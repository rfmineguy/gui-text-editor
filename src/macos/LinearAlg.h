#import <simd/simd.h>

matrix_float4x4 translationMat(float x, float y);
matrix_float4x4 scaleMat(float x, float y);
matrix_float4x4 modelMat(float tx, float ty, float sx, float sy, float angle);
matrix_float4x4 orthoProjMat(float left, float right, float bot, float top, float near, float far);
