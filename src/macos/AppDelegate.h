#import <AppKit/AppKit.h>
#import <MetalKit/MetalKit.h>
#import "MetalRenderer.h"
#import "MetalView.h"

@interface AppDelegate : NSResponder <NSApplicationDelegate, NSWindowDelegate>
@property (strong, nonatomic) NSWindow *window;
@property (strong, nonatomic) MetalView *view;
@end
