#import "AppDelegate.h"

@implementation AppDelegate
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}
- (void)applicationDidFinishLaunching:(NSNotification *)notification {
	NSLog(@"App finished launching");
	[self setupMenu];

	NSRect frame = NSMakeRect(0,0,600,600);
	_window = [[NSWindow alloc]
		initWithContentRect:frame styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskClosable|NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO
	];
	_view = [[MetalView alloc] initWithFrame:frame];
	[_view setEnableSetNeedsDisplay: NO];
	[_view setPreferredFramesPerSecond: 60];
	NSLog(@"Setup view");

	[_window setTitle: @"Metal Window"];
	[_window setBackgroundColor:[NSColor blueColor]];
	[_window makeKeyAndOrderFront:nil];
	[_window setContentView:_view];
	[_window setLevel:NSNormalWindowLevel];

	NSLog(@"Finish launch");
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
	NSLog(@"Finish setupMenu");
}

- (void)windowWillClose:(NSNotification *)notification {
	NSLog(@"Window close");
	[NSApp terminate:nil];
}

- (void) dealloc {
	[super dealloc];
}

- (void)mouseMoved:(NSEvent *)event {
}

@end
