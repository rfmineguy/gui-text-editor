#import "UI.h"

@implementation TextEditorUI {
}

- (nonnull instancetype)init {
	self = [super init];
	if (self) {}
	return self;
}

- (void)renderToView:(nonnull MetalRenderer*)renderer mtkView:(MTKView *)mtkView {
	[renderer renderToView:mtkView];
}
@end
