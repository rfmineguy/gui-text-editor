#import "MetalRenderer.h"
#import "MetalView.h"
#import "Vertex.h"
#import "LinearAlg.h"

@implementation MetalRenderer {
	id<MTLDevice> _device;
	id<MTLRenderPipelineState> _pipelineState;
	id<MTLCommandQueue> _commandQueue;

	vector_uint2 _viewportSize;

	id<MTLBuffer> _quadVertexBuffer, _quadIndexBuffer;
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

		static const Vertex triangleVertices[] = {
				// 2D positions,    RGBA colors
				{ { -0.5,  -0.5 }, { 0, 1, 0, 1 } },
				{ {  0.5,  -0.5 }, { 1, 0, 0, 1 } },
				{ {  0.5,   0.5 }, { 0, 0, 1, 1 } },
				{ { -0.5,   0.5 }, { 0, 0, 1, 1 } },
		};

		static const UInt32 triangleIndices[] = {
			0, 1, 2, 2, 3, 0
		};

		_quadVertexBuffer = [_device newBufferWithBytes:triangleVertices length:sizeof(triangleVertices) options:MTLResourceStorageModeShared];
		_quadVertexBuffer.label = @"VertexBuf";
		_quadIndexBuffer  = [_device newBufferWithBytes:triangleIndices length:sizeof(triangleIndices) options:MTLResourceStorageModeShared];
		_quadIndexBuffer.label = @"IndexBuf";

		NSLog(@"Created MetalRenderer: %@", self);
	}
	return self;
}

- (void)renderToView:(nonnull MTKView *)view {
	NSLog(@"DrawInMTKView");

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

		[self renderQuad:view enc:renderEncoder x:100 y:100 sx:50 sy:50 angle:M_PI_2];
		[self renderQuad:view enc:renderEncoder x:150 y:100 sx:50 sy:50 angle:M_PI_4];
		[self renderQuad:view enc:renderEncoder x:200 y:100 sx:50 sy:50 angle:M_PI_2];
		[self renderQuad:view enc:renderEncoder x:250 y:100 sx:50 sy:50 angle:M_PI_4];

		// Schedule a present once the framebuffer is complete using the current drawable.
		[commandBuffer presentDrawable:view.currentDrawable];
		[renderEncoder endEncoding];
	}

	// Finalize rendering here & push the command buffer to the GPU.
	[commandBuffer commit];
}

- (void)renderQuad:(nonnull MTKView *)view enc:(nonnull id<MTLRenderCommandEncoder>)renderEncoder x:(float)x y:(float)y sx:(float)sx sy:(float)sy angle:(float)angle {
	Uniforms u = {.model = modelMat(x, y, sx * view.window.backingScaleFactor, sy * view.window.backingScaleFactor, angle), .projection = orthoProjMat(0, _viewportSize.x, 0, _viewportSize.y, 0, 1)};
	id<MTLBuffer> unifBuffer = [_device newBufferWithBytes:&u length:sizeof(Uniforms) options:MTLResourceStorageModeShared];
	unifBuffer.label = @"UnifBuf";

	[renderEncoder setRenderPipelineState:_pipelineState];
	[renderEncoder setVertexBuffer:_quadVertexBuffer
													offset:0
												 atIndex:0];

	[renderEncoder setVertexBuffer:unifBuffer
													offset:0
													atIndex:1];
	
	[renderEncoder setVertexBytes:&_viewportSize
												 length:sizeof(_viewportSize)
												atIndex:2];

	[renderEncoder drawIndexedPrimitives:MTLPrimitiveTypeTriangle indexCount:6 indexType:MTLIndexTypeUInt32 indexBuffer:_quadIndexBuffer indexBufferOffset:0];
}

- (void)setViewportSize:(CGSize)size {
	_viewportSize.x = size.width;
	_viewportSize.y = size.height;
	NSLog(@"Adjust viewport size: %d, %d", _viewportSize.x, _viewportSize.y);
}


@end
