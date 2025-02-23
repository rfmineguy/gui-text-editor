#import <simd/simd.h>

typedef struct {
	vector_float2 position;
	vector_float4 color;
	vector_float2 uv;
} Vertex;

typedef struct {
	vector_float2 size;
	matrix_float4x4 model, projection;
} Uniforms;

typedef struct {
	Uniforms uniforms;
	float n;
} SquircleUniforms;
