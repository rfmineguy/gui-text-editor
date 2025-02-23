/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Metal shaders used for this sample
*/

#include <metal_stdlib>

using namespace metal;

// Include header shared between this Metal shader code and C code executing Metal API commands.
#include "Vertex.h"

// Vertex shader outputs and fragment shader inputs
struct RasterizerData
{
    float4 position [[position]];
    float4 color;
		float2 uv;
		float2 size;
		float n;
};

vertex RasterizerData
squircleVertex(uint vertexID [[vertex_id]],
             constant Vertex *vertices [[buffer(0)]],
						 constant SquircleUniforms& uniforms [[buffer(1)]])
{
    RasterizerData out;

		float4 pos = uniforms.uniforms.model * float4(vertices[vertexID].position, 0.0, 1.0);
		out.position = uniforms.uniforms.projection * pos;

    out.color = vertices[vertexID].color;
		out.uv = vertices[vertexID].uv;
		out.size = uniforms.uniforms.size;
		out.n = uniforms.n;
    return out;
}

fragment float4 squircleFragment(RasterizerData in [[stage_in]]) {
	float2 uv_norm = (in.uv * 2.0) - 1.0;
	float dist = pow(fabs(uv_norm.x), in.n) + pow(fabs(uv_norm.y), in.n);
	if (dist <= 0.9) {
		return float4(0.3, 0.3, 0.3, 1.0);
	}
	else if (dist <= 1.0) {
		return float4(0.8, 0.3, 0.3, 1.0);
	}
	else {
		discard_fragment();
	}
}
