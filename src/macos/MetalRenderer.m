#import "MetalRenderer.h"
#import "MetalView.h"
#import "Vertex.h"

@implementation MetalRenderer {
	id<MTLDevice> _device;
	id<MTLRenderPipelineState> _pipelineState;
	id<MTLCommandQueue> _commandQueue;

	vector_uint2 _viewportSize;
}

- (instancetype)initWithMetalKitView:(MTKView *)mtkView {
	self = [super init];
	if (self) {
		_device = mtkView.device;

		// Setup shader
		id<MTLLibrary> defaultLib = [_device newDefaultLibrary];
		id<MTLFunction> vertexFunc = [defaultLib newFunctionWithName:@"vertexShader"];
		id<MTLFunction> fragmentFunc = [defaultLib newFunctionWithName:@"fragmentShader"];
		NSLog(@"Setup shaders");

		MTLRenderPipelineDescriptor *pDesc = [[MTLRenderPipelineDescriptor alloc] init];
		pDesc.label = @"Main_Descriptor";
		pDesc.vertexFunction = vertexFunc;
		pDesc.fragmentFunction = fragmentFunc;
		pDesc.colorAttachments[0].pixelFormat = mtkView.colorPixelFormat;
		NSLog(@"Setup pipeline descriptor");

		NSError *err;
		_pipelineState = [_device newRenderPipelineStateWithDescriptor: pDesc error: &err];
		if (err != nil) {
			NSLog(@"Failed to create new render pipeline state: %@", err);
			return nil; // Properly handle failure
		}

		_commandQueue = [_device newCommandQueue];
		NSLog(@"Created MetalRenderer: %@", self);
	}
	return self;
}

- (void)renderToView:(nonnull MTKView *)view {
	NSLog(@"DrawInMTKView");

	static const Vertex triangleVertices[] = {
			// 2D positions,    RGBA colors
			{ {  250,  -250 }, { 1, 0, 0, 1 } },
			{ { -250,  -250 }, { 0, 1, 0, 1 } },
			{ {    0,   250 }, { 0, 0, 1, 1 } },
	};

	// Create a new command buffer for each render pass to the current drawable.
	id<MTLCommandBuffer> commandBuffer = [_commandQueue commandBuffer];
	commandBuffer.label = @"MyCommand";

	// Obtain a renderPassDescriptor generated from the view's drawable textures.
	MTLRenderPassDescriptor *renderPassDescriptor = view.currentRenderPassDescriptor;

	if(renderPassDescriptor != nil)
	{
			// Create a render command encoder.
			id<MTLRenderCommandEncoder> renderEncoder =
			[commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
			renderEncoder.label = @"MyRenderEncoder";

			// Set the region of the drawable to draw into.
			[renderEncoder setViewport:(MTLViewport){0.0, 0.0, _viewportSize.x, _viewportSize.y, 0.0, 1.0 }];
			
			[renderEncoder setRenderPipelineState:_pipelineState];

			// Pass in the parameter data.
			[renderEncoder setVertexBytes:triangleVertices
														 length:sizeof(triangleVertices)
														atIndex:0];
			
			[renderEncoder setVertexBytes:&_viewportSize
														 length:sizeof(_viewportSize)
														atIndex:1];

			// Draw the triangle.
			[renderEncoder drawPrimitives:MTLPrimitiveTypeTriangle
												vertexStart:0
												vertexCount:3];

			[renderEncoder endEncoding];

			// Schedule a present once the framebuffer is complete using the current drawable.
			[commandBuffer presentDrawable:view.currentDrawable];
	}

	// Finalize rendering here & push the command buffer to the GPU.
	[commandBuffer commit];
}

- (void)setViewportSize:(CGSize)size {
	_viewportSize.x = size.width;
	_viewportSize.y = size.height;
	NSLog(@"Adjust viewport size: %d, %d", _viewportSize.x, _viewportSize.y);
}


@end
