#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "MetalRenderer.h"
#import "MetalProfiler.h"

@interface MetalViewDelegate : NSObject<MTKViewDelegate>
@property (nonatomic, strong) MetalRenderer* renderer;
@property (nonatomic, strong) MetalProfiler* profiler;
@end

@interface MetalView : MTKView
@property (nonatomic, strong) CADisplayLink* displayLink;
@end
