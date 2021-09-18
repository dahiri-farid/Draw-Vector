//
// PathBuilder.m
//
// Created by Marcus Rohrmoser on 11.03.10.
// Copyright (c) 2010-2014, Marcus Rohrmoser mobile Software
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted
// provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions
// and the following disclaimer.
//
// 2. The software must not be used for military or intelligence or related purposes nor
// anything that's in conflict with human rights as declared in http://www.un.org/en/documents/udhr/ .
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
// IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//

#import "PathBuilder.h"

#if 0
#ifdef MRLogD
#undef MRLogD
#endif
// No Logging
#define MRLogD(x, ...)
#endif

@interface PathBuilder()
{
	const CGAffineTransform *trafo;
	CGMutablePathRef gp;
	// last control point for the smooth curveTo and quadTo
	CGPoint o;
	// last point
	CGPoint p;
}
@end


/**
 * @todo CGPathAddArc
 * @todo CGPathAddRelativeArc
 */
@implementation PathBuilder

-(id)initWithTrafo:(const CGAffineTransform *)trafo_
{
	if( self = [super init] ) {
		trafo = trafo_;
		gp = CGPathCreateMutable();
		o.x = o.y = NAN;
		p = CGPointZero;
	}
	return self;
}


-(void)dealloc
{
	CGPathRelease(gp);
}


-(void)closePath
{
	CGPathCloseSubpath(gp);
}


-(void)cubicToAbsolute:(BOOL)abs x1:(CGFloat)x1 y1:(CGFloat)y1 x2:(CGFloat)x2 y2:(CGFloat)y2 x3:(CGFloat)x3 y3:(CGFloat)y3
{
	MRLogD(@"%d (%f,%f) (%f,%f) (%f,%f)", abs, x1, y1, x2, y2, x3, y3);
	if( !abs ) {
		x1 += p.x;
		y1 += p.y;
		x2 += p.x;
		y2 += p.y;
		x3 += p.x;
		y3 += p.y;
	}
	CGPathAddCurveToPoint(gp, trafo, x1, y1, x2, y2, x3, y3);
	o.x = x2;
	o.y = y2;
	p.x = x3;
	p.y = y3;
}


-(void)lineToAbsolute:(BOOL)abs x:(CGFloat)x y:(CGFloat)y
{
	MRLogD(@"%d", abs);
	if( !abs ) {
		x += p.x;
		y += p.y;
	}
	CGPathAddLineToPoint(gp, trafo, x, y);
	o.x = o.y = NAN;
	p.x = x;
	p.y = y;
}


-(void)hlineToAbsolute:(BOOL)abs x:(CGFloat)x
{
	MRLogD(@"%d", abs);
	[self lineToAbsolute:abs x:x y:(abs ? p.y:0)];
}


-(void)moveToAbsolute:(BOOL)abs x:(CGFloat)x y:(CGFloat)y
{
	MRLogD(@"%d (%f,%f)", abs, x, y);
	if( !abs ) {
		x += p.x;
		y += p.y;
	}
	CGPathMoveToPoint(gp, trafo, x, y);
	o.x = o.y = NAN;
	p.x = x;
	p.y = y;
}


-(void)quadToAbsolute:(BOOL)abs x1:(CGFloat)x1 y1:(CGFloat)y1 x2:(CGFloat)x2 y2:(CGFloat)y2
{
	MRLogD(@"%d", abs);
	if( !abs ) {
		x1 += p.x;
		y1 += p.y;
		x2 += p.x;
		y2 += p.y;
	}
	CGPathAddQuadCurveToPoint(gp, trafo, x1, y1, x2, y2);
	o.x = x1;
	o.y = y1;
	p.x = x2;
	p.y = y2;
}


/**
 * @see http://www.w3.org/TR/SVG11/implnote.html#PathElementImplementationNotes
 */
-(void)smoothCubicToAbsolute:(BOOL)abs x2:(CGFloat)x2 y2:(CGFloat)y2 x3:(CGFloat)x3 y3:(CGFloat)y3
{
	MRLogD(@"%d (%f,%f) (%f,%f)", abs, x2, y2, x3, y3);
	const CGFloat x1 = p.x + (p.x - o.x);
	const CGFloat y1 = p.y + (p.y - o.y);
	if( !abs ) {
		x2 += p.x;
		y2 += p.y;
		x3 += p.x;
		y3 += p.y;
	}
	[self cubicToAbsolute:YES x1:x1 y1:y1 x2:x2 y2:y2 x3:x3 y3:y3];
}


-(void)smoothQuadToAbsolute:(BOOL)abs x2:(CGFloat)x2 y2:(CGFloat)y2
{
	MRLogD(@"%d", abs);
	CGFloat x1;
	CGFloat y1;
	if( abs ) {
		x1 = 2 * p.x - o.x;
		y1 = 2 * p.y - o.y;
	} else {
		// @todo verify!
		x1 = p.x - o.x;
		y1 = p.y - o.y;
	}
	[self quadToAbsolute:abs x1:x1 y1:y1 x2:x2 y2:y2];
}


/** returns an unretained reference! */
-(CGPathRef)toPath
{
	return gp;
}


-(void)vlineToAbsolute:(BOOL)abs y:(CGFloat)y
{
	MRLogD(@"%d", abs);
	[self lineToAbsolute:abs x:(abs ? p.x:0) y:y];
}


@end
