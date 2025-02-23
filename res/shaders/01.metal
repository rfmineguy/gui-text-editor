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
};

vertex RasterizerData
vertexShader(uint vertexID [[vertex_id]],
             constant Vertex *vertices [[buffer(0)]],
						 constant Uniforms& uniforms [[buffer(1)]],
             constant vector_uint2 *viewportSizePointer [[buffer(2)]])
{
    RasterizerData out;

		float4 pos = uniforms.model * float4(vertices[vertexID].position, 0.0, 1.0);
		out.position = uniforms.projection * pos;

    // float2 pixelSpacePosition = vertices[vertexID].position.xy;
    // vector_float2 viewportSize = vector_float2(*viewportSizePointer);

    // out.position = vector_float4(0.0, 0.0, 0.0, 1.0);
    // out.position.xy = pixelSpacePosition / (viewportSize / 2.0);

    out.color = vertices[vertexID].color;

    return out;
}

fragment float4 fragmentShader(RasterizerData in [[stage_in]])
{
    return in.color;
}
