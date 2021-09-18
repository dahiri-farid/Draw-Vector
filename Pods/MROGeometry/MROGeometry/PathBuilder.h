//
// PathBuilder.h
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

#import <CoreGraphics/CGPath.h>
#import <CoreGraphics/CGAffineTransform.h>

/** Internal Helper for PathParser. As the PathParser sources stem from a ragel PathParser.rl file
 * that means a break in the toolchain and therefore I try to keep it's complexity as low as possible.
 *
 * @see http://www.w3.org/TR/SVG11/implnote.html#PathElementImplementationNotes
 */
@interface PathBuilder : NSObject

-(id)initWithTrafo:(const CGAffineTransform *)trafo;

/**
 * http://www.w3.org/TR/SVG11/paths.html#PathDataClosePathCommand
 */
-(void)closePath;

/**
 * http://www.w3.org/TR/SVG11/paths.html#PathDataCubicBezierCommands
 */
-(void)cubicToAbsolute:(BOOL)abs x1:(CGFloat)x1 y1:(CGFloat)y1 x2:(CGFloat)x2 y2:(CGFloat)y2 x3:(CGFloat)x3 y3:(CGFloat)y3;

/**
 * http://www.w3.org/TR/SVG11/paths.html#PathDataLinetoCommands
 */
-(void)lineToAbsolute:(BOOL)abs x:(CGFloat)x y:(CGFloat)y;

/**
 * http://www.w3.org/TR/SVG11/paths.html#PathDataLinetoCommands
 */
-(void)hlineToAbsolute:(BOOL)abs x:(CGFloat)x;

/**
 * http://www.w3.org/TR/SVG11/paths.html#PathDataMovetoCommands
 */
-(void)moveToAbsolute:(BOOL)abs x:(CGFloat)x y:(CGFloat)y;

/**
 * http://www.w3.org/TR/SVG11/paths.html#PathDataQuadraticBezierCommands
 */
-(void)quadToAbsolute:(BOOL)abs x1:(CGFloat)x1 y1:(CGFloat)y1 x2:(CGFloat)x2 y2:(CGFloat)y2;

/**
 * http://www.w3.org/TR/SVG11/paths.html#PathDataCubicBezierCommands
 */
-(void)smoothCubicToAbsolute:(BOOL)abs x2:(CGFloat)x2 y2:(CGFloat)y2 x3:(CGFloat)x3 y3:(CGFloat)y3;

/**
 * http://www.w3.org/TR/SVG11/paths.html#PathDataQuadraticBezierCommands
 */
-(void)smoothQuadToAbsolute:(BOOL)abs x2:(CGFloat)x2 y2:(CGFloat)y2;

/**
 * @return unretained reference!
 */
-(CGPathRef)toPath;

/**
 * http://www.w3.org/TR/SVG11/paths.html#PathDataLinetoCommands
 */
-(void)vlineToAbsolute:(BOOL)abs y:(CGFloat)y;

@end
