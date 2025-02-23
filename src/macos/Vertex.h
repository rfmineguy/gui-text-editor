#import <simd/simd.h>

typedef struct {
	vector_float2 position;
	vector_float4 color;
} Vertex;

typedef struct {
	matrix_float4x4 model, projection;
} Uniforms;
