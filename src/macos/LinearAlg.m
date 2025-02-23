#import "LinearAlg.h"

matrix_float4x4 translationMat(float tx, float ty) {
	return (matrix_float4x4){
		.columns[0] = {1,  0,  0, 0},
		.columns[1] = {0,  1,  0, 0},
		.columns[2] = {0,  0,  1, 0},
		.columns[3] = {tx, ty, 0, 1}
	};
}

matrix_float4x4 scaleMat(float sx, float sy) {
	return (matrix_float4x4){
		.columns[0] = {sx, 0,  0, 0},
		.columns[1] = {0,  sy, 0, 0},
		.columns[2] = {0,  0,  1, 0},
		.columns[3] = {0,  0,  0, 1}
	};
}

matrix_float4x4 modelMat(float tx, float ty, float sx, float sy, float angle) {
	float c = cosf(angle);
	float s = sinf(angle);
	return (matrix_float4x4){
		.columns[0] = { sx * c, sy * s, 0, 0},
		.columns[1] = {-sx * s, sy * c, 0, 0},
		.columns[2] = { 0,      0     , 1, 0},
		.columns[3] = { tx,     ty    , 0, 1}
	};
}

matrix_float4x4 orthoProjMat(float left, float right, float bot, float top, float near, float far) {
	return (matrix_float4x4) {
		.columns[0] = {2.0f / (right - left), 0, 0, 0},  // First column (X-axis)
		.columns[1] = {0, 2.0f / (top - bot), 0, 0},  // Second column (Y-axis)
		.columns[2] = {0, 0, 1.0f / (far - near), 0},    // Third column (Z-axis)
		.columns[3] = {-(right + left) / (right - left), -(top + bot) / (top - bot), -near / (far - near), 1}  // Fourth column (translation)
	};
}
