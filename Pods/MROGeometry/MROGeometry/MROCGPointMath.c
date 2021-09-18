/*
 * MROCGPointMath.c
 *
 * Created by Marcus Rohrmoser on 21.09.10.
 *
 * Copyright (c) 2010-2014, Marcus Rohrmoser mobile Software
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted
 * provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions
 * and the following disclaimer.
 *
 * 2. The software must not be used for military or intelligence or related purposes nor
 * anything that's in conflict with human rights as declared in http://www.un.org/en/documents/udhr/ .
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
 * IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
 * THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include "MROCGPointMath.h"
#include <math.h>


CGPoint CGPointAdd(const CGPoint a, const CGPoint b)
{
	return CGPointMake(a.x + b.x, a.y + b.y);
}


CGPoint CGPointSub(const CGPoint a, const CGPoint b)
{
	return CGPointMake(a.x - b.x, a.y - b.y);
}


CGPoint CGPointMul(const CGPoint a, const CGFloat f)
{
	return CGPointMake(f * a.x, f * a.y);
}


CGFloat CGPointDotPr(const CGPoint a, const CGPoint b)
{
	return a.x * b.x + a.y * b.y;
}


#if !defined(SQR)
#define SQR(x) ( (x) * (x) )
#else
#error "SQR already defined."
#endif


CGFloat CGPointAbsSqr(const CGPoint a)
{
	return CGPointDotPr(a, a);
}


CGFloat CGPointAbs(const CGPoint a)
{
	return sqrt( CGPointAbsSqr(a) );
}


#if !defined(ABS)
#define ABS(A) ({ __typeof__(A) __a = (A); __a < 0 ? -__a : __a; } \
		)
#else
#error "ABS already defined."
#endif


bool CGPointDistanceSmallerThan(const CGPoint a, const CGPoint b, const CGFloat radius)
{
	const CGFloat dx = ABS(a.x - b.x);
	if( dx > radius )
		return false;
	const CGFloat dy = ABS(a.y - b.y);
	if( dy > radius )
		return false;
	return SQR(dx) + SQR(dy) < SQR(radius);
}
