#import "MetalRenderer.h"
#import "MetalView.h"
#import "Vertex.h"
#import "LinearAlg.h"

@implementation MetalRenderer {
	id<MTLDevice> _device;
	id<MTLRenderPipelineState> _quadPipelineState, _squirclePipelineState;
	id<MTLCommandBuffer> _commandBuffer;
	id<MTLCommandQueue> _commandQueue;
	id<MTLRenderCommandEncoder> _commandEncoder;

	vector_uint2 _viewportSize;

	id<MTLBuffer> _quadVertexBuffer, _quadIndexBuffer;

	float n, t;
}

- (instancetype)initWithMetalKitView:(MTKView *)mtkView {
	self = [super init];
	if (self) {
		_device = mtkView.device;

		// Setup shader

		static const Vertex triangleVertices[] = {
				// 2D positions,    RGBA colors
				{ { -0.5,  -0.5 }, { 0, 1, 0, 1 }, { 0.0, 0.0 } },
				{ {  0.5,  -0.5 }, { 1, 0, 0, 1 }, { 1.0, 0.0 } },
				{ {  0.5,   0.5 }, { 0, 0, 1, 1 }, { 1.0, 1.0 } },
				{ { -0.5,   0.5 }, { 0, 0, 1, 1 }, { 0.0, 1.0 } },
		};

		static const UInt32 triangleIndices[] = {
			0, 1, 2, 2, 3, 0
		};

		_quadVertexBuffer = [_device newBufferWithBytes:triangleVertices length:sizeof(triangleVertices) options:MTLResourceStorageModeShared];
		_quadVertexBuffer.label = @"VertexBuf";
		_quadIndexBuffer  = [_device newBufferWithBytes:triangleIndices length:sizeof(triangleIndices) options:MTLResourceStorageModeShared];
		_quadIndexBuffer.label = @"IndexBuf";

		[self initPipelineStates:mtkView.colorPixelFormat];
		n = 0;


		NSLog(@"Created MetalRenderer: %@", self);
	}
	return self;
}

- (void)initPipelineStates:(MTLPixelFormat)pixelFmt {
	// Squircle
	{
		id<MTLLibrary> defaultLib = [_device newDefaultLibrary];
		id<MTLFunction> vertexFunc = [defaultLib newFunctionWithName:@"squircleVertex"];
		id<MTLFunction> fragmentFunc = [defaultLib newFunctionWithName:@"squircleFragment"];
		NSLog(@"Setup shaders");

		MTLRenderPipelineDescriptor *pDesc = [[MTLRenderPipelineDescriptor alloc] init];
		pDesc.label = @"Squircle_Descriptor";
		pDesc.vertexFunction = vertexFunc;
		pDesc.fragmentFunction = fragmentFunc;
		pDesc.colorAttachments[0].pixelFormat = pixelFmt;
		NSLog(@"Setup squircle pipeline descriptor");

		NSError *err;
		_squirclePipelineState = [_device newRenderPipelineStateWithDescriptor: pDesc error: &err];
		if (err != nil) {
			NSLog(@"Failed to create new render pipeline state: %@", err);
			return; // Properly handle failure
		}
	}

	// Quad
	{
		id<MTLLibrary> defaultLib = [_device newDefaultLibrary];
		id<MTLFunction> vertexFunc = [defaultLib newFunctionWithName:@"quadVertex"];
		id<MTLFunction> fragmentFunc = [defaultLib newFunctionWithName:@"quadFragment"];
		NSLog(@"Setup shaders");

		MTLRenderPipelineDescriptor *pDesc = [[MTLRenderPipelineDescriptor alloc] init];
		pDesc.label = @"Quad_Descriptor";
		pDesc.vertexFunction = vertexFunc;
		pDesc.fragmentFunction = fragmentFunc;
		pDesc.colorAttachments[0].pixelFormat = pixelFmt;
		NSLog(@"Setup quad pipeline descriptor");

		NSError *err;
		_quadPipelineState = [_device newRenderPipelineStateWithDescriptor: pDesc error: &err];
		if (err != nil) {
			NSLog(@"Failed to create new render pipeline state: %@", err);
			return; // Properly handle failure
		}
	}

	_commandQueue = [_device newCommandQueue];
}

- (void)begin:(nonnull MTKView*)view {
	_commandBuffer = [_commandQueue commandBuffer];
	_commandBuffer.label = @"CmdBuf";

	if (view.currentRenderPassDescriptor == nil) {
		[self end:view];
		return;
	}

	_commandEncoder = [_commandBuffer renderCommandEncoderWithDescriptor:view.currentRenderPassDescriptor];
}
- (void)end:(nonnull MTKView*)view {
	if (view.currentRenderPassDescriptor == nil) return;

	[_commandBuffer presentDrawable:view.currentDrawable];
	[_commandEncoder endEncoding];
	[_commandBuffer commit];
}

- (void)renderQuad:(nonnull MTKView *)view x:(float)x y:(float)y sx:(float)sx sy:(float)sy angle:(float)angle {
	Uniforms u = {
		.size = {sx,sy},
		.model = modelMat(x, y, sx * view.window.backingScaleFactor, sy * view.window.backingScaleFactor, angle),
		.projection = orthoProjMat(0, _viewportSize.x, 0, _viewportSize.y, 0, 1)
	};
	id<MTLBuffer> unifBuffer = [_device newBufferWithBytes:&u length:sizeof(Uniforms) options:MTLResourceStorageModeShared];
	unifBuffer.label = @"UnifBuf";

	[_commandEncoder setRenderPipelineState:_quadPipelineState];
	[_commandEncoder setVertexBuffer:_quadVertexBuffer offset:0 atIndex:0];
	[_commandEncoder setVertexBuffer:unifBuffer        offset:0 atIndex:1];

	[_commandEncoder drawIndexedPrimitives:MTLPrimitiveTypeTriangle 
														indexCount:6 indexType:MTLIndexTypeUInt32 indexBuffer:_quadIndexBuffer indexBufferOffset:0];
}

- (void)renderSquircle:(nonnull MTKView*)view x:(float)x y:(float)y sx:(float)sx sy:(float)sy angle:(float)angle n:(float)n_ {
	SquircleUniforms u = {
		.uniforms = {
			.size = {sx,sy},
			.model = modelMat(x, y, sx * view.window.backingScaleFactor, sy * view.window.backingScaleFactor, angle),
			.projection = orthoProjMat(0, _viewportSize.x, 0, _viewportSize.y, 0, 1)
		},
		.n = n_
	};
	id<MTLBuffer> unifBuffer = [_device newBufferWithBytes:&u length:sizeof(SquircleUniforms) options:MTLResourceStorageModeShared];
	unifBuffer.label = @"UnifBuf";

	[_commandEncoder setRenderPipelineState:_squirclePipelineState];
	[_commandEncoder setVertexBuffer:_quadVertexBuffer offset:0 atIndex:0];
	[_commandEncoder setVertexBuffer:unifBuffer 			 offset:0 atIndex:1];

	[_commandEncoder drawIndexedPrimitives:MTLPrimitiveTypeTriangle
														indexCount:6 indexType:MTLIndexTypeUInt32 indexBuffer:_quadIndexBuffer indexBufferOffset:0];
}

- (void)setViewportSize:(CGSize)size {
	_viewportSize.x = size.width;
	_viewportSize.y = size.height;
	NSLog(@"Adjust viewport size: %d, %d", _viewportSize.x, _viewportSize.y);
}

@end
