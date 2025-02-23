#import "UI.h"

@implementation TextEditorUI {
	float n, t;
}

- (nonnull instancetype)init {
	self = [super init];
	if (self) {
		n = 0;
		t = 0;
	}
	return self;
}

- (void)renderToView:(nonnull MetalRenderer*)renderer mtkView:(MTKView *)mtkView {
	t += 0.01;
	n = 1.7 + sin(t);
	NSPoint m = [NSEvent mouseLocation];
	[renderer begin:mtkView];
	[renderer renderQuad:mtkView x:100 y:100 sx:100 sy:100 angle:M_PI_2];
	[renderer renderQuad:mtkView x:150 y:100 sx:100 sy:100 angle:M_PI_4];
	[renderer renderQuad:mtkView x:200 y:100 sx:100 sy:100 angle:M_PI_2];
	[renderer renderQuad:mtkView x:m.x y:m.y sx:100 sy:100 angle:M_PI_4];
	[renderer renderSquircle:mtkView x:400 y:100 sx:100 sy:100 angle:M_PI_4 n:n];
	[renderer end:mtkView];
}
@end
