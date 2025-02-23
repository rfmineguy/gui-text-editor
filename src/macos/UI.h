#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import "MetalRenderer.h"

@interface TextEditorUI : NSObject
- (nonnull instancetype)init;
- (void)renderToView:(nonnull MetalRenderer*)renderer mtkView:(nonnull MTKView*)mtkView;
@end
