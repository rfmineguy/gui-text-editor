#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "MetalRenderer.h"
#import "MetalProfiler.h"
#import  "UI.h"

@interface MetalViewDelegate : NSObject<MTKViewDelegate>
@property (nonatomic, strong) MetalRenderer* renderer;
@property (nonatomic, strong) MetalProfiler* profiler;
@property (nonatomic, strong) TextEditorUI* ui;
@end

@interface MetalView : MTKView
@property (nonatomic, strong) CADisplayLink* displayLink;
@property (nonatomic) NSPoint mousePos;

- (void)setMousePos:(NSPoint)mousePos;
@end
