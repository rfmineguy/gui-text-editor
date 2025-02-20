#import <AppKit/AppKit.h>
#import <MetalKit/MetalKit.h>

@interface AppDelegate : NSResponder <NSApplicationDelegate, NSWindowDelegate>
@property (strong, nonatomic) NSWindow *window;
@property (strong, nonatomic) MTKView *view;
@property (strong, nonatomic) id<MTLDevice> device;
@end
