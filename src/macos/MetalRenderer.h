#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>

@interface MetalRenderer : NSObject
- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;
- (void)renderToView:(nonnull MTKView *)mtkView;
- (void)setViewportSize:(CGSize)size;
@end
