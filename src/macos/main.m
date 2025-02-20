#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char* argv[]) {
	NSApplication *app = [NSApplication sharedApplication];
	AppDelegate *delegate = [[AppDelegate alloc] init];

	[app setActivationPolicy:NSApplicationActivationPolicyRegular];
	[app activateIgnoringOtherApps:YES];
	[app setDelegate:delegate];

	[app run];
	return 0;
}
