#import "AppDelegate.h"

@implementation AppDelegate
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}
- (void)applicationDidFinishLaunching:(NSNotification *)notification {
	[self setupMenu];

	NSRect frame = NSMakeRect(0,0,300,300);
	_window = [[NSWindow alloc]
		initWithContentRect:frame styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable backing:NSBackingStoreBuffered defer:NO
	];
	_device = MTLCreateSystemDefaultDevice(); 
	_view = [[MTKView alloc] initWithFrame:frame device:_device];

	[_window setTitle: @"Metal Window"];
	[_window setBackgroundColor:[NSColor blueColor]];
	[_window makeKeyAndOrderFront:nil];
	[_window setContentView:_view];
	[_window setDelegate:self];
	[_window setLevel:NSFloatingWindowLevel];
}

- (void)setupMenu {
	NSMenu *menu = [[NSMenu alloc] init];
	NSMenuItem *item = [[NSMenuItem alloc] init];
	[menu addItem:item];

	NSMenu *appMenu = [[NSMenu alloc] initWithTitle:@""];
	NSString *appName = [[NSProcessInfo processInfo] processName];
	NSMenuItem *quitItem = [[NSMenuItem alloc]
		initWithTitle:[NSString stringWithFormat:@"Quit %@", appName]
		action:@selector(terminate:)
		keyEquivalent:@"q"];

	[quitItem setKeyEquivalentModifierMask:NSEventModifierFlagCommand];

	[appMenu addItem:quitItem];
	[item setSubmenu:appMenu];

	[NSApp setMainMenu:menu];
}

- (void)windowWillClose:(NSNotification *)notification {
	[NSApp terminate:nil];
}

- (void) dealloc {
	[super dealloc];
}

@end
