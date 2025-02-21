#import "MetalView.h"
#import <simd/simd.h>

@implementation MetalViewDelegate {
}
- (instancetype)init:(MTKView *)mtkView {
	[super init];
	if (self) {
		_renderer = [[MetalRenderer alloc] initWithMetalKitView:mtkView];
		[_renderer setViewportSize:mtkView.bounds.size];
		NSLog(@"MetalViewDel init %@", _renderer);
	}
	return self;
}
- (void)drawInMTKView:(MTKView *)view {
	[_renderer renderToView:view];
}
- (void)mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size {
	[_renderer setViewportSize:size];
}

@end

@implementation MetalView {
	MetalViewDelegate* delegate;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];

	[self setupDisplayLink];
	self.wantsLayer = YES;
	self.device = MTLCreateSystemDefaultDevice();
	delegate = [[MetalViewDelegate alloc] init:self]; 
	[self setDelegate:delegate];

	NSLog(@"MetalView: InitWithFrame");
	return self;
}

- (void)setupDisplayLink {
	_displayLink = [self displayLinkWithTarget:self selector:@selector(render)];
	[_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

	NSLog(@"Setup display link");
}

- (void)render {
	// [_renderer drawInMTKView: self];
}

@end
