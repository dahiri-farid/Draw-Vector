//
// PathParser.h
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

#import "RagelParser.h"
#import <CoreGraphics/CGPath.h>
#import <CoreGraphics/CGAffineTransform.h>


/** Parser for <a href="http://www.w3.org/TR/SVG11/paths.html#PathDataBNF">SVG path elements</a>.
 *
 * The implementation is generated via <a href="http://www.complang.org/ragel/">Ragel</a>
 * from PathParser.rl.
 *
 * <b>DO NOT EDIT PathParser.m MANUALLY!!!</b>
 *
 * See also https://lib2geom.svn.sourceforge.net/svnroot/lib2geom/lib2geom/trunk/src/2geom/svg-path-parser.rl
 */
@interface PathParser : RagelParser {}

/** Do the actual parsing. Stateless and reentrant.
 * @param data content of a svg path element's 'd' attribute.
 * @param trafo may be NULL
 * @param errPtr out parameter to report parsing problems.
 * @return a retained core graphics path.
 */
-(CGPathRef)newCGPathWithNSString:(NSString *)data trafo:(const CGAffineTransform *)trafo error:(NSError **)errPtr;


/** Do the actual parsing. Stateless and reentrant.
 * @param data content of a svg path element's 'd' attribute.
 * @param length number of max. baytes to read
 * @param errPtr out parameter to report parsing problems.
 * @return a retained core graphics path.
 */
-(CGPathRef)newCGPathWithCString:(const char *)data length:(size_t)length trafo:(const CGAffineTransform *)trafo error:(NSError **)errPtr;


@end
