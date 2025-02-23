#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>

@interface MetalRenderer : NSObject
- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;
- (void)setViewportSize:(CGSize)size;
- (void)renderQuad:(nonnull MTKView*)view x:(float)x y:(float)y sx:(float)sx sy:(float)sy angle:(float)angle;
- (void)renderSquircle:(nonnull MTKView*)view x:(float)x y:(float)y sx:(float)sx sy:(float)sy angle:(float)angle n:(float)n;

- (void)begin:(nonnull MTKView*)view;
- (void)end:(nonnull MTKView*)view;
@end
