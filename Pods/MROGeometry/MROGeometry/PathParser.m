
#line 1 "MROGeometry/PathParser.rl"
//
// PathParser.rl
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

#import "PathParser.h"
#import "PathBuilder.h"

#ifdef MRLogD
#undef MRLogD
#undef MRLogTStart
#endif
// No Logging
#define MRLogD(x,...)
#define MRLogTStart()


static inline double strltod(const char *restrict nptr, char **restrict endptr, const size_t size)
{
  char push_number_tmp[size];
  // push_number_tmp[len] = '\0';
  strlcpy(push_number_tmp, nptr, size);
  assert(push_number_tmp[size-1] == '\0' && "must be NUL terminated");
  return strtod(push_number_tmp, endptr);
}

/** <a href="http://www.complang.org/ragel/">Ragel</a> parser 
 * for <a href="http://www.w3.org/TR/SVG11/paths.html#PathDataBNF">paths</a> 
 * This file is auto-generated
 * <p>
 * DO NOT EDIT MANUALLY!!!
 * </p>
 * See also https://lib2geom.svn.sourceforge.net/svnroot/lib2geom/lib2geom/trunk/src/2geom/svg-path-parser.rl
 */
@implementation PathParser

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-const-variable"


#line 287 "MROGeometry/PathParser.rl"



#line 70 "MROGeometry/PathParser.m"
static const int path_start = 232;
static const int path_first_final = 232;
static const int path_error = 0;

static const int path_en_main = 232;


#line 290 "MROGeometry/PathParser.rl"
  
-(CGPathRef)newCGPathWithCString:(const char*)data length:(const size_t)length trafo:(const CGAffineTransform*)trafo error:(NSError**)errPtr
{
  MRLogTStart();
  PathBuilder *pb = [[PathBuilder alloc] initWithTrafo:trafo];
  if(data == NULL)
    return CGPathRetain([pb toPath]);
//  high-level buffers
  const char *start = NULL;
  CGFloat argv[] = {0,1,2,3,4,5,6,7};
  int argc = 0;
  BOOL absolute = YES;
  
//  ragel variables (low level)
  const char *p = data;
  const char *pe = data + length; // pointer "end"
  const char *eof = pe;
  int cs = 0;
//  int top;

///////////////////////////////////////////////////////////
//  init ragel
  
#line 102 "MROGeometry/PathParser.m"
	{
	cs = path_start;
	}

#line 313 "MROGeometry/PathParser.rl"
///////////////////////////////////////////////////////////
//  exec ragel
  
#line 111 "MROGeometry/PathParser.m"
	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
st232:
	if ( ++p == pe )
		goto _test_eof232;
case 232:
	switch( (*p) ) {
		case 13: goto st232;
		case 32: goto st232;
		case 77: goto st1;
		case 109: goto st160;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto st232;
	goto st0;
st0:
cs = 0;
	goto _out;
tr443:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st1;
tr485:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st1;
tr508:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st1;
tr533:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st1;
tr558:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st1;
tr583:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st1;
tr608:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st1;
tr633:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st1;
tr658:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st1;
tr679:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st1;
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
#line 261 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr0;
		case 32: goto tr0;
		case 43: goto tr2;
		case 45: goto tr2;
		case 46: goto tr3;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr4;
	} else if ( (*p) >= 9 )
		goto tr0;
	goto st0;
tr0:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
	goto st2;
tr366:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
	goto st2;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
#line 291 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st2;
		case 32: goto st2;
		case 43: goto tr6;
		case 45: goto tr6;
		case 46: goto tr7;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr8;
	} else if ( (*p) >= 9 )
		goto st2;
	goto st0;
tr2:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st3;
tr6:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st3;
tr367:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st3;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
#line 335 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st4;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st161;
	goto st0;
tr3:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st4;
tr7:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st4;
tr368:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st4;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
#line 371 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st5;
	goto st0;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
	switch( (*p) ) {
		case 13: goto tr12;
		case 32: goto tr12;
		case 44: goto tr14;
		case 46: goto tr15;
		case 69: goto st169;
		case 101: goto st169;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr12;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st5;
	} else
		goto tr13;
	goto st0;
tr12:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st6;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
#line 408 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st6;
		case 32: goto st6;
		case 44: goto st162;
		case 46: goto tr20;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st6;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr21;
	} else
		goto tr18;
	goto st0;
tr18:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st7;
tr13:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st7;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
#line 446 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st8;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st265;
	goto st0;
tr20:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st8;
tr15:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st8;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
#line 474 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st233;
	goto st0;
st233:
	if ( ++p == pe )
		goto _test_eof233;
case 233:
	switch( (*p) ) {
		case 13: goto tr434;
		case 32: goto tr434;
		case 44: goto tr436;
		case 46: goto tr437;
		case 65: goto tr438;
		case 67: goto tr439;
		case 69: goto st163;
		case 72: goto tr441;
		case 76: goto tr442;
		case 77: goto tr443;
		case 81: goto tr444;
		case 83: goto tr445;
		case 84: goto tr446;
		case 86: goto tr447;
		case 90: goto tr448;
		case 97: goto tr449;
		case 99: goto tr450;
		case 101: goto st163;
		case 104: goto tr451;
		case 108: goto tr452;
		case 109: goto tr453;
		case 113: goto tr454;
		case 115: goto tr455;
		case 116: goto tr456;
		case 118: goto tr457;
		case 122: goto tr448;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr434;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st233;
	} else
		goto tr435;
	goto st0;
tr434:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st234;
tr476:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st234;
st234:
	if ( ++p == pe )
		goto _test_eof234;
case 234:
#line 549 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st234;
		case 32: goto st234;
		case 44: goto st15;
		case 46: goto tr43;
		case 65: goto st18;
		case 67: goto st47;
		case 72: goto st83;
		case 76: goto st89;
		case 77: goto st1;
		case 81: goto st90;
		case 83: goto st114;
		case 84: goto st138;
		case 86: goto st150;
		case 90: goto st263;
		case 97: goto st156;
		case 99: goto st157;
		case 104: goto st158;
		case 108: goto st159;
		case 109: goto st160;
		case 113: goto st165;
		case 115: goto st166;
		case 116: goto st167;
		case 118: goto st168;
		case 122: goto st263;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st234;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr44;
	} else
		goto tr42;
	goto st0;
tr205:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st9;
tr42:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st9;
tr363:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st9;
tr435:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st9;
tr477:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st9;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
#line 649 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st10;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st16;
	goto st0;
tr206:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st10;
tr43:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st10;
tr364:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st10;
tr437:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st10;
tr479:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 719 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st11;
	goto st0;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	switch( (*p) ) {
		case 13: goto tr28;
		case 32: goto tr28;
		case 44: goto tr30;
		case 46: goto tr31;
		case 69: goto st229;
		case 101: goto st229;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr28;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st11;
	} else
		goto tr29;
	goto st0;
tr28:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st12;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
#line 756 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st12;
		case 32: goto st12;
		case 44: goto st17;
		case 46: goto tr36;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st12;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr37;
	} else
		goto tr34;
	goto st0;
tr34:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st13;
tr29:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
#line 794 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st14;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st236;
	goto st0;
tr36:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st14;
tr31:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st14;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
#line 822 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st235;
	goto st0;
st235:
	if ( ++p == pe )
		goto _test_eof235;
case 235:
	switch( (*p) ) {
		case 13: goto tr476;
		case 32: goto tr476;
		case 44: goto tr478;
		case 46: goto tr479;
		case 65: goto tr480;
		case 67: goto tr481;
		case 69: goto st227;
		case 72: goto tr483;
		case 76: goto tr484;
		case 77: goto tr485;
		case 81: goto tr486;
		case 83: goto tr487;
		case 84: goto tr488;
		case 86: goto tr489;
		case 90: goto tr490;
		case 97: goto tr491;
		case 99: goto tr492;
		case 101: goto st227;
		case 104: goto tr493;
		case 108: goto tr494;
		case 109: goto tr495;
		case 113: goto tr496;
		case 115: goto tr497;
		case 116: goto tr498;
		case 118: goto tr499;
		case 122: goto tr490;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr476;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st235;
	} else
		goto tr477;
	goto st0;
tr204:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
	goto st15;
tr362:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
	goto st15;
tr436:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st15;
tr478:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st15;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
#line 909 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st15;
		case 32: goto st15;
		case 43: goto tr42;
		case 45: goto tr42;
		case 46: goto tr43;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr44;
	} else if ( (*p) >= 9 )
		goto st15;
	goto st0;
tr207:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st16;
tr44:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st16;
tr365:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st16;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
#line 953 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr28;
		case 32: goto tr28;
		case 44: goto tr30;
		case 46: goto st11;
		case 69: goto st229;
		case 101: goto st229;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr28;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st16;
	} else
		goto tr29;
	goto st0;
tr30:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st17;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
#line 983 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st17;
		case 32: goto st17;
		case 43: goto tr34;
		case 45: goto tr34;
		case 46: goto tr36;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr37;
	} else if ( (*p) >= 9 )
		goto st17;
	goto st0;
tr37:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st236;
st236:
	if ( ++p == pe )
		goto _test_eof236;
case 236:
#line 1007 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr476;
		case 32: goto tr476;
		case 44: goto tr478;
		case 46: goto st235;
		case 65: goto tr480;
		case 67: goto tr481;
		case 69: goto st227;
		case 72: goto tr483;
		case 76: goto tr484;
		case 77: goto tr485;
		case 81: goto tr486;
		case 83: goto tr487;
		case 84: goto tr488;
		case 86: goto tr489;
		case 90: goto tr490;
		case 97: goto tr491;
		case 99: goto tr492;
		case 101: goto st227;
		case 104: goto tr493;
		case 108: goto tr494;
		case 109: goto tr495;
		case 113: goto tr496;
		case 115: goto tr497;
		case 116: goto tr498;
		case 118: goto tr499;
		case 122: goto tr490;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr476;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st236;
	} else
		goto tr477;
	goto st0;
tr438:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st18;
tr480:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st18;
tr503:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st18;
tr528:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st18;
tr553:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st18;
tr578:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st18;
tr603:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st18;
tr628:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st18;
tr653:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st18;
tr675:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st18;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
#line 1173 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr45;
		case 32: goto tr45;
		case 46: goto tr46;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr47;
	} else if ( (*p) >= 9 )
		goto tr45;
	goto st0;
tr45:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
	goto st19;
tr351:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
	goto st19;
tr501:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st19;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
#line 1215 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st19;
		case 32: goto st19;
		case 46: goto tr49;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr50;
	} else if ( (*p) >= 9 )
		goto st19;
	goto st0;
tr46:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st20;
tr49:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st20;
tr352:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st20;
tr502:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st20;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
#line 1275 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st21;
	goto st0;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
	switch( (*p) ) {
		case 13: goto tr52;
		case 32: goto tr52;
		case 44: goto tr53;
		case 46: goto tr54;
		case 69: goto st44;
		case 101: goto st44;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st21;
	} else if ( (*p) >= 9 )
		goto tr52;
	goto st0;
tr52:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st22;
st22:
	if ( ++p == pe )
		goto _test_eof22;
case 22:
#line 1309 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st22;
		case 32: goto st22;
		case 44: goto st23;
		case 46: goto tr58;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr59;
	} else if ( (*p) >= 9 )
		goto st22;
	goto st0;
tr53:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st23;
st23:
	if ( ++p == pe )
		goto _test_eof23;
case 23:
#line 1334 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st23;
		case 32: goto st23;
		case 46: goto tr58;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr59;
	} else if ( (*p) >= 9 )
		goto st23;
	goto st0;
tr58:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st24;
tr54:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st24;
st24:
	if ( ++p == pe )
		goto _test_eof24;
case 24:
#line 1368 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st25;
	goto st0;
st25:
	if ( ++p == pe )
		goto _test_eof25;
case 25:
	switch( (*p) ) {
		case 13: goto tr61;
		case 32: goto tr61;
		case 44: goto tr63;
		case 46: goto tr64;
		case 69: goto st223;
		case 101: goto st223;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr61;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st25;
	} else
		goto tr62;
	goto st0;
tr61:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st26;
st26:
	if ( ++p == pe )
		goto _test_eof26;
case 26:
#line 1405 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st26;
		case 32: goto st26;
		case 44: goto st222;
		case 46: goto tr69;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st26;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr70;
	} else
		goto tr67;
	goto st0;
tr67:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st27;
tr62:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st27;
st27:
	if ( ++p == pe )
		goto _test_eof27;
case 27:
#line 1443 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st28;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st221;
	goto st0;
tr69:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st28;
tr64:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st28;
st28:
	if ( ++p == pe )
		goto _test_eof28;
case 28:
#line 1471 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st29;
	goto st0;
st29:
	if ( ++p == pe )
		goto _test_eof29;
case 29:
	switch( (*p) ) {
		case 13: goto tr74;
		case 32: goto tr74;
		case 44: goto tr75;
		case 69: goto st218;
		case 101: goto st218;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st29;
	} else if ( (*p) >= 9 )
		goto tr74;
	goto st0;
tr74:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st30;
st30:
	if ( ++p == pe )
		goto _test_eof30;
case 30:
#line 1504 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st30;
		case 32: goto st30;
		case 44: goto st31;
		case 48: goto st32;
		case 49: goto st217;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto st30;
	goto st0;
tr75:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st31;
st31:
	if ( ++p == pe )
		goto _test_eof31;
case 31:
#line 1527 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st31;
		case 32: goto st31;
		case 48: goto st32;
		case 49: goto st217;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto st31;
	goto st0;
st32:
	if ( ++p == pe )
		goto _test_eof32;
case 32:
	switch( (*p) ) {
		case 13: goto tr81;
		case 32: goto tr81;
		case 44: goto tr82;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto tr81;
	goto st0;
tr81:
#line 85 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action push_false isn't implemented yet." format:@""];
  }
	goto st33;
tr420:
#line 80 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action push_true isn't implemented yet." format:@""];
  }
	goto st33;
st33:
	if ( ++p == pe )
		goto _test_eof33;
case 33:
#line 1567 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st33;
		case 32: goto st33;
		case 44: goto st34;
		case 48: goto st35;
		case 49: goto st216;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto st33;
	goto st0;
tr82:
#line 85 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action push_false isn't implemented yet." format:@""];
  }
	goto st34;
tr421:
#line 80 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action push_true isn't implemented yet." format:@""];
  }
	goto st34;
st34:
	if ( ++p == pe )
		goto _test_eof34;
case 34:
#line 1596 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st34;
		case 32: goto st34;
		case 48: goto st35;
		case 49: goto st216;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto st34;
	goto st0;
st35:
	if ( ++p == pe )
		goto _test_eof35;
case 35:
	switch( (*p) ) {
		case 13: goto tr87;
		case 32: goto tr87;
		case 44: goto tr88;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto tr87;
	goto st0;
tr87:
#line 85 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action push_false isn't implemented yet." format:@""];
  }
	goto st36;
tr418:
#line 80 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action push_true isn't implemented yet." format:@""];
  }
	goto st36;
st36:
	if ( ++p == pe )
		goto _test_eof36;
case 36:
#line 1636 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st36;
		case 32: goto st36;
		case 44: goto st215;
		case 46: goto tr92;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st36;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr93;
	} else
		goto tr90;
	goto st0;
tr90:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st37;
st37:
	if ( ++p == pe )
		goto _test_eof37;
case 37:
#line 1662 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st38;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st214;
	goto st0;
tr92:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st38;
st38:
	if ( ++p == pe )
		goto _test_eof38;
case 38:
#line 1678 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st39;
	goto st0;
st39:
	if ( ++p == pe )
		goto _test_eof39;
case 39:
	switch( (*p) ) {
		case 13: goto tr97;
		case 32: goto tr97;
		case 44: goto tr99;
		case 46: goto tr100;
		case 69: goto st211;
		case 101: goto st211;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr97;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st39;
	} else
		goto tr98;
	goto st0;
tr97:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st40;
st40:
	if ( ++p == pe )
		goto _test_eof40;
case 40:
#line 1715 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st40;
		case 32: goto st40;
		case 44: goto st210;
		case 46: goto tr105;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st40;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr106;
	} else
		goto tr103;
	goto st0;
tr103:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st41;
tr98:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st41;
st41:
	if ( ++p == pe )
		goto _test_eof41;
case 41:
#line 1753 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st42;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st268;
	goto st0;
tr105:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st42;
tr100:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st42;
st42:
	if ( ++p == pe )
		goto _test_eof42;
case 42:
#line 1781 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st237;
	goto st0;
st237:
	if ( ++p == pe )
		goto _test_eof237;
case 237:
	switch( (*p) ) {
		case 13: goto tr500;
		case 32: goto tr500;
		case 44: goto tr501;
		case 46: goto tr502;
		case 65: goto tr503;
		case 67: goto tr504;
		case 69: goto st208;
		case 72: goto tr506;
		case 76: goto tr507;
		case 77: goto tr508;
		case 81: goto tr509;
		case 83: goto tr510;
		case 84: goto tr511;
		case 86: goto tr512;
		case 90: goto tr513;
		case 97: goto tr514;
		case 99: goto tr515;
		case 101: goto st208;
		case 104: goto tr516;
		case 108: goto tr517;
		case 109: goto tr518;
		case 113: goto tr519;
		case 115: goto tr520;
		case 116: goto tr521;
		case 118: goto tr522;
		case 122: goto tr513;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st237;
	} else if ( (*p) >= 9 )
		goto tr500;
	goto st0;
tr500:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st238;
st238:
	if ( ++p == pe )
		goto _test_eof238;
case 238:
#line 1841 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st238;
		case 32: goto st238;
		case 44: goto st19;
		case 46: goto tr49;
		case 65: goto st18;
		case 67: goto st47;
		case 72: goto st83;
		case 76: goto st89;
		case 77: goto st1;
		case 81: goto st90;
		case 83: goto st114;
		case 84: goto st138;
		case 86: goto st150;
		case 90: goto st263;
		case 97: goto st156;
		case 99: goto st157;
		case 104: goto st158;
		case 108: goto st159;
		case 109: goto st160;
		case 113: goto st165;
		case 115: goto st166;
		case 116: goto st167;
		case 118: goto st168;
		case 122: goto st263;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr50;
	} else if ( (*p) >= 9 )
		goto st238;
	goto st0;
tr47:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st43;
tr50:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st43;
tr353:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st43;
st43:
	if ( ++p == pe )
		goto _test_eof43;
case 43:
#line 1904 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr52;
		case 32: goto tr52;
		case 44: goto tr53;
		case 46: goto st21;
		case 69: goto st44;
		case 101: goto st44;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st43;
	} else if ( (*p) >= 9 )
		goto tr52;
	goto st0;
st44:
	if ( ++p == pe )
		goto _test_eof44;
case 44:
	switch( (*p) ) {
		case 43: goto st45;
		case 45: goto st45;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st46;
	goto st0;
st45:
	if ( ++p == pe )
		goto _test_eof45;
case 45:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st46;
	goto st0;
st46:
	if ( ++p == pe )
		goto _test_eof46;
case 46:
	switch( (*p) ) {
		case 13: goto tr52;
		case 32: goto tr52;
		case 44: goto tr53;
		case 46: goto tr54;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st46;
	} else if ( (*p) >= 9 )
		goto tr52;
	goto st0;
tr439:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st47;
tr481:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st47;
tr504:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st47;
tr529:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st47;
tr554:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st47;
tr579:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st47;
tr604:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st47;
tr629:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st47;
tr654:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st47;
tr676:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st47;
st47:
	if ( ++p == pe )
		goto _test_eof47;
case 47:
#line 2081 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr113;
		case 32: goto tr113;
		case 43: goto tr114;
		case 45: goto tr114;
		case 46: goto tr115;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr116;
	} else if ( (*p) >= 9 )
		goto tr113;
	goto st0;
tr113:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
	goto st48;
tr354:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
	goto st48;
tr526:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st48;
st48:
	if ( ++p == pe )
		goto _test_eof48;
case 48:
#line 2124 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st48;
		case 32: goto st48;
		case 43: goto tr118;
		case 45: goto tr118;
		case 46: goto tr119;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr120;
	} else if ( (*p) >= 9 )
		goto st48;
	goto st0;
tr114:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st49;
tr118:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st49;
tr355:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st49;
tr525:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st49;
st49:
	if ( ++p == pe )
		goto _test_eof49;
case 49:
#line 2185 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st50;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st71;
	goto st0;
tr115:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st50;
tr119:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st50;
tr356:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st50;
tr527:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st50;
st50:
	if ( ++p == pe )
		goto _test_eof50;
case 50:
#line 2238 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st51;
	goto st0;
st51:
	if ( ++p == pe )
		goto _test_eof51;
case 51:
	switch( (*p) ) {
		case 13: goto tr124;
		case 32: goto tr124;
		case 44: goto tr126;
		case 46: goto tr127;
		case 69: goto st205;
		case 101: goto st205;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr124;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st51;
	} else
		goto tr125;
	goto st0;
tr124:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st52;
st52:
	if ( ++p == pe )
		goto _test_eof52;
case 52:
#line 2275 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st52;
		case 32: goto st52;
		case 44: goto st72;
		case 46: goto tr132;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st52;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr133;
	} else
		goto tr130;
	goto st0;
tr130:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st53;
tr125:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st53;
st53:
	if ( ++p == pe )
		goto _test_eof53;
case 53:
#line 2313 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st54;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st73;
	goto st0;
tr132:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st54;
tr127:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st54;
st54:
	if ( ++p == pe )
		goto _test_eof54;
case 54:
#line 2341 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st55;
	goto st0;
st55:
	if ( ++p == pe )
		goto _test_eof55;
case 55:
	switch( (*p) ) {
		case 13: goto tr137;
		case 32: goto tr137;
		case 44: goto tr139;
		case 46: goto tr140;
		case 69: goto st202;
		case 101: goto st202;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr137;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st55;
	} else
		goto tr138;
	goto st0;
tr137:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st56;
st56:
	if ( ++p == pe )
		goto _test_eof56;
case 56:
#line 2378 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st56;
		case 32: goto st56;
		case 44: goto st74;
		case 46: goto tr145;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st56;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr146;
	} else
		goto tr143;
	goto st0;
tr143:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st57;
tr138:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st57;
st57:
	if ( ++p == pe )
		goto _test_eof57;
case 57:
#line 2416 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st58;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st75;
	goto st0;
tr145:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st58;
tr140:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st58;
st58:
	if ( ++p == pe )
		goto _test_eof58;
case 58:
#line 2444 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st59;
	goto st0;
st59:
	if ( ++p == pe )
		goto _test_eof59;
case 59:
	switch( (*p) ) {
		case 13: goto tr150;
		case 32: goto tr150;
		case 44: goto tr152;
		case 46: goto tr153;
		case 69: goto st199;
		case 101: goto st199;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr150;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st59;
	} else
		goto tr151;
	goto st0;
tr150:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st60;
st60:
	if ( ++p == pe )
		goto _test_eof60;
case 60:
#line 2481 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st60;
		case 32: goto st60;
		case 44: goto st76;
		case 46: goto tr158;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st60;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr159;
	} else
		goto tr156;
	goto st0;
tr156:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st61;
tr151:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st61;
st61:
	if ( ++p == pe )
		goto _test_eof61;
case 61:
#line 2519 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st62;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st77;
	goto st0;
tr158:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st62;
tr153:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st62;
st62:
	if ( ++p == pe )
		goto _test_eof62;
case 62:
#line 2547 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st63;
	goto st0;
st63:
	if ( ++p == pe )
		goto _test_eof63;
case 63:
	switch( (*p) ) {
		case 13: goto tr163;
		case 32: goto tr163;
		case 44: goto tr165;
		case 46: goto tr166;
		case 69: goto st196;
		case 101: goto st196;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr163;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st63;
	} else
		goto tr164;
	goto st0;
tr163:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st64;
st64:
	if ( ++p == pe )
		goto _test_eof64;
case 64:
#line 2584 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st64;
		case 32: goto st64;
		case 44: goto st78;
		case 46: goto tr171;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st64;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr172;
	} else
		goto tr169;
	goto st0;
tr169:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st65;
tr164:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st65;
st65:
	if ( ++p == pe )
		goto _test_eof65;
case 65:
#line 2622 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st66;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st79;
	goto st0;
tr171:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st66;
tr166:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st66;
st66:
	if ( ++p == pe )
		goto _test_eof66;
case 66:
#line 2650 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st67;
	goto st0;
st67:
	if ( ++p == pe )
		goto _test_eof67;
case 67:
	switch( (*p) ) {
		case 13: goto tr176;
		case 32: goto tr176;
		case 44: goto tr178;
		case 46: goto tr179;
		case 69: goto st193;
		case 101: goto st193;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr176;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st67;
	} else
		goto tr177;
	goto st0;
tr176:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st68;
st68:
	if ( ++p == pe )
		goto _test_eof68;
case 68:
#line 2687 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st68;
		case 32: goto st68;
		case 44: goto st80;
		case 46: goto tr184;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st68;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr185;
	} else
		goto tr182;
	goto st0;
tr182:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st69;
tr177:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st69;
st69:
	if ( ++p == pe )
		goto _test_eof69;
case 69:
#line 2725 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st70;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st241;
	goto st0;
tr184:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st70;
tr179:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st70;
st70:
	if ( ++p == pe )
		goto _test_eof70;
case 70:
#line 2753 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st239;
	goto st0;
st239:
	if ( ++p == pe )
		goto _test_eof239;
case 239:
	switch( (*p) ) {
		case 13: goto tr524;
		case 32: goto tr524;
		case 44: goto tr526;
		case 46: goto tr527;
		case 65: goto tr528;
		case 67: goto tr529;
		case 69: goto st81;
		case 72: goto tr531;
		case 76: goto tr532;
		case 77: goto tr533;
		case 81: goto tr534;
		case 83: goto tr535;
		case 84: goto tr536;
		case 86: goto tr537;
		case 90: goto tr538;
		case 97: goto tr539;
		case 99: goto tr540;
		case 101: goto st81;
		case 104: goto tr541;
		case 108: goto tr542;
		case 109: goto tr543;
		case 113: goto tr544;
		case 115: goto tr545;
		case 116: goto tr546;
		case 118: goto tr547;
		case 122: goto tr538;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr524;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st239;
	} else
		goto tr525;
	goto st0;
tr524:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st240;
st240:
	if ( ++p == pe )
		goto _test_eof240;
case 240:
#line 2815 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st240;
		case 32: goto st240;
		case 44: goto st48;
		case 46: goto tr119;
		case 65: goto st18;
		case 67: goto st47;
		case 72: goto st83;
		case 76: goto st89;
		case 77: goto st1;
		case 81: goto st90;
		case 83: goto st114;
		case 84: goto st138;
		case 86: goto st150;
		case 90: goto st263;
		case 97: goto st156;
		case 99: goto st157;
		case 104: goto st158;
		case 108: goto st159;
		case 109: goto st160;
		case 113: goto st165;
		case 115: goto st166;
		case 116: goto st167;
		case 118: goto st168;
		case 122: goto st263;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st240;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr120;
	} else
		goto tr118;
	goto st0;
tr116:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st71;
tr120:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st71;
tr357:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st71;
st71:
	if ( ++p == pe )
		goto _test_eof71;
case 71:
#line 2881 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr124;
		case 32: goto tr124;
		case 44: goto tr126;
		case 46: goto st51;
		case 69: goto st205;
		case 101: goto st205;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr124;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st71;
	} else
		goto tr125;
	goto st0;
tr126:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st72;
st72:
	if ( ++p == pe )
		goto _test_eof72;
case 72:
#line 2911 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st72;
		case 32: goto st72;
		case 43: goto tr130;
		case 45: goto tr130;
		case 46: goto tr132;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr133;
	} else if ( (*p) >= 9 )
		goto st72;
	goto st0;
tr133:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st73;
st73:
	if ( ++p == pe )
		goto _test_eof73;
case 73:
#line 2935 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr137;
		case 32: goto tr137;
		case 44: goto tr139;
		case 46: goto st55;
		case 69: goto st202;
		case 101: goto st202;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr137;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st73;
	} else
		goto tr138;
	goto st0;
tr139:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st74;
st74:
	if ( ++p == pe )
		goto _test_eof74;
case 74:
#line 2965 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st74;
		case 32: goto st74;
		case 43: goto tr143;
		case 45: goto tr143;
		case 46: goto tr145;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr146;
	} else if ( (*p) >= 9 )
		goto st74;
	goto st0;
tr146:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st75;
st75:
	if ( ++p == pe )
		goto _test_eof75;
case 75:
#line 2989 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr150;
		case 32: goto tr150;
		case 44: goto tr152;
		case 46: goto st59;
		case 69: goto st199;
		case 101: goto st199;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr150;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st75;
	} else
		goto tr151;
	goto st0;
tr152:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st76;
st76:
	if ( ++p == pe )
		goto _test_eof76;
case 76:
#line 3019 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st76;
		case 32: goto st76;
		case 43: goto tr156;
		case 45: goto tr156;
		case 46: goto tr158;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr159;
	} else if ( (*p) >= 9 )
		goto st76;
	goto st0;
tr159:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st77;
st77:
	if ( ++p == pe )
		goto _test_eof77;
case 77:
#line 3043 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr163;
		case 32: goto tr163;
		case 44: goto tr165;
		case 46: goto st63;
		case 69: goto st196;
		case 101: goto st196;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr163;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st77;
	} else
		goto tr164;
	goto st0;
tr165:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st78;
st78:
	if ( ++p == pe )
		goto _test_eof78;
case 78:
#line 3073 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st78;
		case 32: goto st78;
		case 43: goto tr169;
		case 45: goto tr169;
		case 46: goto tr171;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr172;
	} else if ( (*p) >= 9 )
		goto st78;
	goto st0;
tr172:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st79;
st79:
	if ( ++p == pe )
		goto _test_eof79;
case 79:
#line 3097 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr176;
		case 32: goto tr176;
		case 44: goto tr178;
		case 46: goto st67;
		case 69: goto st193;
		case 101: goto st193;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr176;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st79;
	} else
		goto tr177;
	goto st0;
tr178:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st80;
st80:
	if ( ++p == pe )
		goto _test_eof80;
case 80:
#line 3127 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st80;
		case 32: goto st80;
		case 43: goto tr182;
		case 45: goto tr182;
		case 46: goto tr184;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr185;
	} else if ( (*p) >= 9 )
		goto st80;
	goto st0;
tr185:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st241;
st241:
	if ( ++p == pe )
		goto _test_eof241;
case 241:
#line 3151 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr524;
		case 32: goto tr524;
		case 44: goto tr526;
		case 46: goto st239;
		case 65: goto tr528;
		case 67: goto tr529;
		case 69: goto st81;
		case 72: goto tr531;
		case 76: goto tr532;
		case 77: goto tr533;
		case 81: goto tr534;
		case 83: goto tr535;
		case 84: goto tr536;
		case 86: goto tr537;
		case 90: goto tr538;
		case 97: goto tr539;
		case 99: goto tr540;
		case 101: goto st81;
		case 104: goto tr541;
		case 108: goto tr542;
		case 109: goto tr543;
		case 113: goto tr544;
		case 115: goto tr545;
		case 116: goto tr546;
		case 118: goto tr547;
		case 122: goto tr538;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr524;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st241;
	} else
		goto tr525;
	goto st0;
st81:
	if ( ++p == pe )
		goto _test_eof81;
case 81:
	switch( (*p) ) {
		case 43: goto st82;
		case 45: goto st82;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st242;
	goto st0;
st82:
	if ( ++p == pe )
		goto _test_eof82;
case 82:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st242;
	goto st0;
st242:
	if ( ++p == pe )
		goto _test_eof242;
case 242:
	switch( (*p) ) {
		case 13: goto tr524;
		case 32: goto tr524;
		case 44: goto tr526;
		case 46: goto tr527;
		case 65: goto tr528;
		case 67: goto tr529;
		case 72: goto tr531;
		case 76: goto tr532;
		case 77: goto tr533;
		case 81: goto tr534;
		case 83: goto tr535;
		case 84: goto tr536;
		case 86: goto tr537;
		case 90: goto tr538;
		case 97: goto tr539;
		case 99: goto tr540;
		case 104: goto tr541;
		case 108: goto tr542;
		case 109: goto tr543;
		case 113: goto tr544;
		case 115: goto tr545;
		case 116: goto tr546;
		case 118: goto tr547;
		case 122: goto tr538;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr524;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st242;
	} else
		goto tr525;
	goto st0;
tr441:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st83;
tr483:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st83;
tr506:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st83;
tr531:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st83;
tr556:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st83;
tr581:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st83;
tr606:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st83;
tr631:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st83;
tr656:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st83;
tr677:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st83;
st83:
	if ( ++p == pe )
		goto _test_eof83;
case 83:
#line 3374 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr191;
		case 32: goto tr191;
		case 43: goto tr192;
		case 45: goto tr192;
		case 46: goto tr193;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr194;
	} else if ( (*p) >= 9 )
		goto tr191;
	goto st0;
tr191:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
	goto st84;
tr358:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
	goto st84;
tr551:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st84;
st84:
	if ( ++p == pe )
		goto _test_eof84;
case 84:
#line 3417 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st84;
		case 32: goto st84;
		case 43: goto tr196;
		case 45: goto tr196;
		case 46: goto tr197;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr198;
	} else if ( (*p) >= 9 )
		goto st84;
	goto st0;
tr192:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st85;
tr196:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st85;
tr359:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st85;
tr550:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st85;
st85:
	if ( ++p == pe )
		goto _test_eof85;
case 85:
#line 3478 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st86;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st245;
	goto st0;
tr193:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st86;
tr197:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st86;
tr360:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st86;
tr552:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st86;
st86:
	if ( ++p == pe )
		goto _test_eof86;
case 86:
#line 3531 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st243;
	goto st0;
st243:
	if ( ++p == pe )
		goto _test_eof243;
case 243:
	switch( (*p) ) {
		case 13: goto tr549;
		case 32: goto tr549;
		case 44: goto tr551;
		case 46: goto tr552;
		case 65: goto tr553;
		case 67: goto tr554;
		case 69: goto st87;
		case 72: goto tr556;
		case 76: goto tr557;
		case 77: goto tr558;
		case 81: goto tr559;
		case 83: goto tr560;
		case 84: goto tr561;
		case 86: goto tr562;
		case 90: goto tr563;
		case 97: goto tr564;
		case 99: goto tr565;
		case 101: goto st87;
		case 104: goto tr566;
		case 108: goto tr567;
		case 109: goto tr568;
		case 113: goto tr569;
		case 115: goto tr570;
		case 116: goto tr571;
		case 118: goto tr572;
		case 122: goto tr563;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr549;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st243;
	} else
		goto tr550;
	goto st0;
tr549:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st244;
st244:
	if ( ++p == pe )
		goto _test_eof244;
case 244:
#line 3593 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st244;
		case 32: goto st244;
		case 44: goto st84;
		case 46: goto tr197;
		case 65: goto st18;
		case 67: goto st47;
		case 72: goto st83;
		case 76: goto st89;
		case 77: goto st1;
		case 81: goto st90;
		case 83: goto st114;
		case 84: goto st138;
		case 86: goto st150;
		case 90: goto st263;
		case 97: goto st156;
		case 99: goto st157;
		case 104: goto st158;
		case 108: goto st159;
		case 109: goto st160;
		case 113: goto st165;
		case 115: goto st166;
		case 116: goto st167;
		case 118: goto st168;
		case 122: goto st263;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st244;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr198;
	} else
		goto tr196;
	goto st0;
tr194:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st245;
tr198:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st245;
tr361:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st245;
st245:
	if ( ++p == pe )
		goto _test_eof245;
case 245:
#line 3659 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr549;
		case 32: goto tr549;
		case 44: goto tr551;
		case 46: goto st243;
		case 65: goto tr553;
		case 67: goto tr554;
		case 69: goto st87;
		case 72: goto tr556;
		case 76: goto tr557;
		case 77: goto tr558;
		case 81: goto tr559;
		case 83: goto tr560;
		case 84: goto tr561;
		case 86: goto tr562;
		case 90: goto tr563;
		case 97: goto tr564;
		case 99: goto tr565;
		case 101: goto st87;
		case 104: goto tr566;
		case 108: goto tr567;
		case 109: goto tr568;
		case 113: goto tr569;
		case 115: goto tr570;
		case 116: goto tr571;
		case 118: goto tr572;
		case 122: goto tr563;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr549;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st245;
	} else
		goto tr550;
	goto st0;
st87:
	if ( ++p == pe )
		goto _test_eof87;
case 87:
	switch( (*p) ) {
		case 43: goto st88;
		case 45: goto st88;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st246;
	goto st0;
st88:
	if ( ++p == pe )
		goto _test_eof88;
case 88:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st246;
	goto st0;
st246:
	if ( ++p == pe )
		goto _test_eof246;
case 246:
	switch( (*p) ) {
		case 13: goto tr549;
		case 32: goto tr549;
		case 44: goto tr551;
		case 46: goto tr552;
		case 65: goto tr553;
		case 67: goto tr554;
		case 72: goto tr556;
		case 76: goto tr557;
		case 77: goto tr558;
		case 81: goto tr559;
		case 83: goto tr560;
		case 84: goto tr561;
		case 86: goto tr562;
		case 90: goto tr563;
		case 97: goto tr564;
		case 99: goto tr565;
		case 104: goto tr566;
		case 108: goto tr567;
		case 109: goto tr568;
		case 113: goto tr569;
		case 115: goto tr570;
		case 116: goto tr571;
		case 118: goto tr572;
		case 122: goto tr563;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr549;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st246;
	} else
		goto tr550;
	goto st0;
tr442:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st89;
tr484:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st89;
tr507:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st89;
tr532:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st89;
tr557:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st89;
tr582:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st89;
tr607:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st89;
tr632:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st89;
tr657:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st89;
tr678:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st89;
st89:
	if ( ++p == pe )
		goto _test_eof89;
case 89:
#line 3882 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr204;
		case 32: goto tr204;
		case 43: goto tr205;
		case 45: goto tr205;
		case 46: goto tr206;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr207;
	} else if ( (*p) >= 9 )
		goto tr204;
	goto st0;
tr444:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st90;
tr486:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st90;
tr509:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st90;
tr534:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st90;
tr559:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st90;
tr584:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st90;
tr609:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st90;
tr634:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st90;
tr659:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st90;
tr680:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st90;
st90:
	if ( ++p == pe )
		goto _test_eof90;
case 90:
#line 4024 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr208;
		case 32: goto tr208;
		case 43: goto tr209;
		case 45: goto tr209;
		case 46: goto tr210;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr211;
	} else if ( (*p) >= 9 )
		goto tr208;
	goto st0;
tr208:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
	goto st91;
tr372:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
	goto st91;
tr576:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st91;
st91:
	if ( ++p == pe )
		goto _test_eof91;
case 91:
#line 4067 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st91;
		case 32: goto st91;
		case 43: goto tr213;
		case 45: goto tr213;
		case 46: goto tr214;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr215;
	} else if ( (*p) >= 9 )
		goto st91;
	goto st0;
tr209:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st92;
tr213:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st92;
tr373:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st92;
tr575:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st92;
st92:
	if ( ++p == pe )
		goto _test_eof92;
case 92:
#line 4128 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st93;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st106;
	goto st0;
tr210:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st93;
tr214:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st93;
tr374:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st93;
tr577:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st93;
st93:
	if ( ++p == pe )
		goto _test_eof93;
case 93:
#line 4181 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st94;
	goto st0;
st94:
	if ( ++p == pe )
		goto _test_eof94;
case 94:
	switch( (*p) ) {
		case 13: goto tr219;
		case 32: goto tr219;
		case 44: goto tr221;
		case 46: goto tr222;
		case 69: goto st190;
		case 101: goto st190;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr219;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st94;
	} else
		goto tr220;
	goto st0;
tr219:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st95;
st95:
	if ( ++p == pe )
		goto _test_eof95;
case 95:
#line 4218 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st95;
		case 32: goto st95;
		case 44: goto st107;
		case 46: goto tr227;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st95;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr228;
	} else
		goto tr225;
	goto st0;
tr225:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st96;
tr220:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st96;
st96:
	if ( ++p == pe )
		goto _test_eof96;
case 96:
#line 4256 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st97;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st108;
	goto st0;
tr227:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st97;
tr222:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st97;
st97:
	if ( ++p == pe )
		goto _test_eof97;
case 97:
#line 4284 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st98;
	goto st0;
st98:
	if ( ++p == pe )
		goto _test_eof98;
case 98:
	switch( (*p) ) {
		case 13: goto tr232;
		case 32: goto tr232;
		case 44: goto tr234;
		case 46: goto tr235;
		case 69: goto st187;
		case 101: goto st187;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr232;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st98;
	} else
		goto tr233;
	goto st0;
tr232:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st99;
st99:
	if ( ++p == pe )
		goto _test_eof99;
case 99:
#line 4321 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st99;
		case 32: goto st99;
		case 44: goto st109;
		case 46: goto tr240;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st99;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr241;
	} else
		goto tr238;
	goto st0;
tr238:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st100;
tr233:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st100;
st100:
	if ( ++p == pe )
		goto _test_eof100;
case 100:
#line 4359 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st101;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st110;
	goto st0;
tr240:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st101;
tr235:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st101;
st101:
	if ( ++p == pe )
		goto _test_eof101;
case 101:
#line 4387 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st102;
	goto st0;
st102:
	if ( ++p == pe )
		goto _test_eof102;
case 102:
	switch( (*p) ) {
		case 13: goto tr245;
		case 32: goto tr245;
		case 44: goto tr247;
		case 46: goto tr248;
		case 69: goto st184;
		case 101: goto st184;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr245;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st102;
	} else
		goto tr246;
	goto st0;
tr245:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st103;
st103:
	if ( ++p == pe )
		goto _test_eof103;
case 103:
#line 4424 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st103;
		case 32: goto st103;
		case 44: goto st111;
		case 46: goto tr253;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st103;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr254;
	} else
		goto tr251;
	goto st0;
tr251:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st104;
tr246:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st104;
st104:
	if ( ++p == pe )
		goto _test_eof104;
case 104:
#line 4462 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st105;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st249;
	goto st0;
tr253:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st105;
tr248:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st105;
st105:
	if ( ++p == pe )
		goto _test_eof105;
case 105:
#line 4490 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st247;
	goto st0;
st247:
	if ( ++p == pe )
		goto _test_eof247;
case 247:
	switch( (*p) ) {
		case 13: goto tr574;
		case 32: goto tr574;
		case 44: goto tr576;
		case 46: goto tr577;
		case 65: goto tr578;
		case 67: goto tr579;
		case 69: goto st112;
		case 72: goto tr581;
		case 76: goto tr582;
		case 77: goto tr583;
		case 81: goto tr584;
		case 83: goto tr585;
		case 84: goto tr586;
		case 86: goto tr587;
		case 90: goto tr588;
		case 97: goto tr589;
		case 99: goto tr590;
		case 101: goto st112;
		case 104: goto tr591;
		case 108: goto tr592;
		case 109: goto tr593;
		case 113: goto tr594;
		case 115: goto tr595;
		case 116: goto tr596;
		case 118: goto tr597;
		case 122: goto tr588;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr574;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st247;
	} else
		goto tr575;
	goto st0;
tr574:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st248;
st248:
	if ( ++p == pe )
		goto _test_eof248;
case 248:
#line 4552 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st248;
		case 32: goto st248;
		case 44: goto st91;
		case 46: goto tr214;
		case 65: goto st18;
		case 67: goto st47;
		case 72: goto st83;
		case 76: goto st89;
		case 77: goto st1;
		case 81: goto st90;
		case 83: goto st114;
		case 84: goto st138;
		case 86: goto st150;
		case 90: goto st263;
		case 97: goto st156;
		case 99: goto st157;
		case 104: goto st158;
		case 108: goto st159;
		case 109: goto st160;
		case 113: goto st165;
		case 115: goto st166;
		case 116: goto st167;
		case 118: goto st168;
		case 122: goto st263;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st248;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr215;
	} else
		goto tr213;
	goto st0;
tr211:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st106;
tr215:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st106;
tr375:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st106;
st106:
	if ( ++p == pe )
		goto _test_eof106;
case 106:
#line 4618 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr219;
		case 32: goto tr219;
		case 44: goto tr221;
		case 46: goto st94;
		case 69: goto st190;
		case 101: goto st190;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr219;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st106;
	} else
		goto tr220;
	goto st0;
tr221:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st107;
st107:
	if ( ++p == pe )
		goto _test_eof107;
case 107:
#line 4648 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st107;
		case 32: goto st107;
		case 43: goto tr225;
		case 45: goto tr225;
		case 46: goto tr227;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr228;
	} else if ( (*p) >= 9 )
		goto st107;
	goto st0;
tr228:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st108;
st108:
	if ( ++p == pe )
		goto _test_eof108;
case 108:
#line 4672 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr232;
		case 32: goto tr232;
		case 44: goto tr234;
		case 46: goto st98;
		case 69: goto st187;
		case 101: goto st187;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr232;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st108;
	} else
		goto tr233;
	goto st0;
tr234:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st109;
st109:
	if ( ++p == pe )
		goto _test_eof109;
case 109:
#line 4702 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st109;
		case 32: goto st109;
		case 43: goto tr238;
		case 45: goto tr238;
		case 46: goto tr240;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr241;
	} else if ( (*p) >= 9 )
		goto st109;
	goto st0;
tr241:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st110;
st110:
	if ( ++p == pe )
		goto _test_eof110;
case 110:
#line 4726 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr245;
		case 32: goto tr245;
		case 44: goto tr247;
		case 46: goto st102;
		case 69: goto st184;
		case 101: goto st184;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr245;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st110;
	} else
		goto tr246;
	goto st0;
tr247:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st111;
st111:
	if ( ++p == pe )
		goto _test_eof111;
case 111:
#line 4756 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st111;
		case 32: goto st111;
		case 43: goto tr251;
		case 45: goto tr251;
		case 46: goto tr253;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr254;
	} else if ( (*p) >= 9 )
		goto st111;
	goto st0;
tr254:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st249;
st249:
	if ( ++p == pe )
		goto _test_eof249;
case 249:
#line 4780 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr574;
		case 32: goto tr574;
		case 44: goto tr576;
		case 46: goto st247;
		case 65: goto tr578;
		case 67: goto tr579;
		case 69: goto st112;
		case 72: goto tr581;
		case 76: goto tr582;
		case 77: goto tr583;
		case 81: goto tr584;
		case 83: goto tr585;
		case 84: goto tr586;
		case 86: goto tr587;
		case 90: goto tr588;
		case 97: goto tr589;
		case 99: goto tr590;
		case 101: goto st112;
		case 104: goto tr591;
		case 108: goto tr592;
		case 109: goto tr593;
		case 113: goto tr594;
		case 115: goto tr595;
		case 116: goto tr596;
		case 118: goto tr597;
		case 122: goto tr588;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr574;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st249;
	} else
		goto tr575;
	goto st0;
st112:
	if ( ++p == pe )
		goto _test_eof112;
case 112:
	switch( (*p) ) {
		case 43: goto st113;
		case 45: goto st113;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st250;
	goto st0;
st113:
	if ( ++p == pe )
		goto _test_eof113;
case 113:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st250;
	goto st0;
st250:
	if ( ++p == pe )
		goto _test_eof250;
case 250:
	switch( (*p) ) {
		case 13: goto tr574;
		case 32: goto tr574;
		case 44: goto tr576;
		case 46: goto tr577;
		case 65: goto tr578;
		case 67: goto tr579;
		case 72: goto tr581;
		case 76: goto tr582;
		case 77: goto tr583;
		case 81: goto tr584;
		case 83: goto tr585;
		case 84: goto tr586;
		case 86: goto tr587;
		case 90: goto tr588;
		case 97: goto tr589;
		case 99: goto tr590;
		case 104: goto tr591;
		case 108: goto tr592;
		case 109: goto tr593;
		case 113: goto tr594;
		case 115: goto tr595;
		case 116: goto tr596;
		case 118: goto tr597;
		case 122: goto tr588;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr574;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st250;
	} else
		goto tr575;
	goto st0;
tr445:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st114;
tr487:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st114;
tr510:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st114;
tr535:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st114;
tr560:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st114;
tr585:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st114;
tr610:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st114;
tr635:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st114;
tr660:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st114;
tr681:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st114;
st114:
	if ( ++p == pe )
		goto _test_eof114;
case 114:
#line 5003 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr260;
		case 32: goto tr260;
		case 43: goto tr261;
		case 45: goto tr261;
		case 46: goto tr262;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr263;
	} else if ( (*p) >= 9 )
		goto tr260;
	goto st0;
tr260:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
	goto st115;
tr376:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
	goto st115;
tr601:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st115;
st115:
	if ( ++p == pe )
		goto _test_eof115;
case 115:
#line 5046 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st115;
		case 32: goto st115;
		case 43: goto tr265;
		case 45: goto tr265;
		case 46: goto tr266;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr267;
	} else if ( (*p) >= 9 )
		goto st115;
	goto st0;
tr261:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st116;
tr265:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st116;
tr377:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st116;
tr600:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st116;
st116:
	if ( ++p == pe )
		goto _test_eof116;
case 116:
#line 5107 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st117;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st130;
	goto st0;
tr262:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st117;
tr266:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st117;
tr378:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st117;
tr602:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st117;
st117:
	if ( ++p == pe )
		goto _test_eof117;
case 117:
#line 5160 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st118;
	goto st0;
st118:
	if ( ++p == pe )
		goto _test_eof118;
case 118:
	switch( (*p) ) {
		case 13: goto tr271;
		case 32: goto tr271;
		case 44: goto tr273;
		case 46: goto tr274;
		case 69: goto st181;
		case 101: goto st181;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr271;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st118;
	} else
		goto tr272;
	goto st0;
tr271:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st119;
st119:
	if ( ++p == pe )
		goto _test_eof119;
case 119:
#line 5197 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st119;
		case 32: goto st119;
		case 44: goto st131;
		case 46: goto tr279;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st119;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr280;
	} else
		goto tr277;
	goto st0;
tr277:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st120;
tr272:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st120;
st120:
	if ( ++p == pe )
		goto _test_eof120;
case 120:
#line 5235 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st121;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st132;
	goto st0;
tr279:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st121;
tr274:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st121;
st121:
	if ( ++p == pe )
		goto _test_eof121;
case 121:
#line 5263 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st122;
	goto st0;
st122:
	if ( ++p == pe )
		goto _test_eof122;
case 122:
	switch( (*p) ) {
		case 13: goto tr284;
		case 32: goto tr284;
		case 44: goto tr286;
		case 46: goto tr287;
		case 69: goto st178;
		case 101: goto st178;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr284;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st122;
	} else
		goto tr285;
	goto st0;
tr284:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st123;
st123:
	if ( ++p == pe )
		goto _test_eof123;
case 123:
#line 5300 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st123;
		case 32: goto st123;
		case 44: goto st133;
		case 46: goto tr292;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st123;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr293;
	} else
		goto tr290;
	goto st0;
tr290:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st124;
tr285:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st124;
st124:
	if ( ++p == pe )
		goto _test_eof124;
case 124:
#line 5338 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st125;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st134;
	goto st0;
tr292:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st125;
tr287:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st125;
st125:
	if ( ++p == pe )
		goto _test_eof125;
case 125:
#line 5366 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st126;
	goto st0;
st126:
	if ( ++p == pe )
		goto _test_eof126;
case 126:
	switch( (*p) ) {
		case 13: goto tr297;
		case 32: goto tr297;
		case 44: goto tr299;
		case 46: goto tr300;
		case 69: goto st175;
		case 101: goto st175;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr297;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st126;
	} else
		goto tr298;
	goto st0;
tr297:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st127;
st127:
	if ( ++p == pe )
		goto _test_eof127;
case 127:
#line 5403 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st127;
		case 32: goto st127;
		case 44: goto st135;
		case 46: goto tr305;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st127;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr306;
	} else
		goto tr303;
	goto st0;
tr303:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st128;
tr298:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st128;
st128:
	if ( ++p == pe )
		goto _test_eof128;
case 128:
#line 5441 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st129;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st253;
	goto st0;
tr305:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st129;
tr300:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st129;
st129:
	if ( ++p == pe )
		goto _test_eof129;
case 129:
#line 5469 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st251;
	goto st0;
st251:
	if ( ++p == pe )
		goto _test_eof251;
case 251:
	switch( (*p) ) {
		case 13: goto tr599;
		case 32: goto tr599;
		case 44: goto tr601;
		case 46: goto tr602;
		case 65: goto tr603;
		case 67: goto tr604;
		case 69: goto st136;
		case 72: goto tr606;
		case 76: goto tr607;
		case 77: goto tr608;
		case 81: goto tr609;
		case 83: goto tr610;
		case 84: goto tr611;
		case 86: goto tr612;
		case 90: goto tr613;
		case 97: goto tr614;
		case 99: goto tr615;
		case 101: goto st136;
		case 104: goto tr616;
		case 108: goto tr617;
		case 109: goto tr618;
		case 113: goto tr619;
		case 115: goto tr620;
		case 116: goto tr621;
		case 118: goto tr622;
		case 122: goto tr613;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr599;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st251;
	} else
		goto tr600;
	goto st0;
tr599:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st252;
st252:
	if ( ++p == pe )
		goto _test_eof252;
case 252:
#line 5531 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st252;
		case 32: goto st252;
		case 44: goto st115;
		case 46: goto tr266;
		case 65: goto st18;
		case 67: goto st47;
		case 72: goto st83;
		case 76: goto st89;
		case 77: goto st1;
		case 81: goto st90;
		case 83: goto st114;
		case 84: goto st138;
		case 86: goto st150;
		case 90: goto st263;
		case 97: goto st156;
		case 99: goto st157;
		case 104: goto st158;
		case 108: goto st159;
		case 109: goto st160;
		case 113: goto st165;
		case 115: goto st166;
		case 116: goto st167;
		case 118: goto st168;
		case 122: goto st263;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st252;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr267;
	} else
		goto tr265;
	goto st0;
tr263:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st130;
tr267:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st130;
tr379:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st130;
st130:
	if ( ++p == pe )
		goto _test_eof130;
case 130:
#line 5597 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr271;
		case 32: goto tr271;
		case 44: goto tr273;
		case 46: goto st118;
		case 69: goto st181;
		case 101: goto st181;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr271;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st130;
	} else
		goto tr272;
	goto st0;
tr273:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st131;
st131:
	if ( ++p == pe )
		goto _test_eof131;
case 131:
#line 5627 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st131;
		case 32: goto st131;
		case 43: goto tr277;
		case 45: goto tr277;
		case 46: goto tr279;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr280;
	} else if ( (*p) >= 9 )
		goto st131;
	goto st0;
tr280:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st132;
st132:
	if ( ++p == pe )
		goto _test_eof132;
case 132:
#line 5651 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr284;
		case 32: goto tr284;
		case 44: goto tr286;
		case 46: goto st122;
		case 69: goto st178;
		case 101: goto st178;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr284;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st132;
	} else
		goto tr285;
	goto st0;
tr286:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st133;
st133:
	if ( ++p == pe )
		goto _test_eof133;
case 133:
#line 5681 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st133;
		case 32: goto st133;
		case 43: goto tr290;
		case 45: goto tr290;
		case 46: goto tr292;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr293;
	} else if ( (*p) >= 9 )
		goto st133;
	goto st0;
tr293:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st134;
st134:
	if ( ++p == pe )
		goto _test_eof134;
case 134:
#line 5705 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr297;
		case 32: goto tr297;
		case 44: goto tr299;
		case 46: goto st126;
		case 69: goto st175;
		case 101: goto st175;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr297;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st134;
	} else
		goto tr298;
	goto st0;
tr299:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st135;
st135:
	if ( ++p == pe )
		goto _test_eof135;
case 135:
#line 5735 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st135;
		case 32: goto st135;
		case 43: goto tr303;
		case 45: goto tr303;
		case 46: goto tr305;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr306;
	} else if ( (*p) >= 9 )
		goto st135;
	goto st0;
tr306:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st253;
st253:
	if ( ++p == pe )
		goto _test_eof253;
case 253:
#line 5759 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr599;
		case 32: goto tr599;
		case 44: goto tr601;
		case 46: goto st251;
		case 65: goto tr603;
		case 67: goto tr604;
		case 69: goto st136;
		case 72: goto tr606;
		case 76: goto tr607;
		case 77: goto tr608;
		case 81: goto tr609;
		case 83: goto tr610;
		case 84: goto tr611;
		case 86: goto tr612;
		case 90: goto tr613;
		case 97: goto tr614;
		case 99: goto tr615;
		case 101: goto st136;
		case 104: goto tr616;
		case 108: goto tr617;
		case 109: goto tr618;
		case 113: goto tr619;
		case 115: goto tr620;
		case 116: goto tr621;
		case 118: goto tr622;
		case 122: goto tr613;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr599;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st253;
	} else
		goto tr600;
	goto st0;
st136:
	if ( ++p == pe )
		goto _test_eof136;
case 136:
	switch( (*p) ) {
		case 43: goto st137;
		case 45: goto st137;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st254;
	goto st0;
st137:
	if ( ++p == pe )
		goto _test_eof137;
case 137:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st254;
	goto st0;
st254:
	if ( ++p == pe )
		goto _test_eof254;
case 254:
	switch( (*p) ) {
		case 13: goto tr599;
		case 32: goto tr599;
		case 44: goto tr601;
		case 46: goto tr602;
		case 65: goto tr603;
		case 67: goto tr604;
		case 72: goto tr606;
		case 76: goto tr607;
		case 77: goto tr608;
		case 81: goto tr609;
		case 83: goto tr610;
		case 84: goto tr611;
		case 86: goto tr612;
		case 90: goto tr613;
		case 97: goto tr614;
		case 99: goto tr615;
		case 104: goto tr616;
		case 108: goto tr617;
		case 109: goto tr618;
		case 113: goto tr619;
		case 115: goto tr620;
		case 116: goto tr621;
		case 118: goto tr622;
		case 122: goto tr613;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr599;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st254;
	} else
		goto tr600;
	goto st0;
tr446:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st138;
tr488:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st138;
tr511:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st138;
tr536:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st138;
tr561:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st138;
tr586:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st138;
tr611:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st138;
tr636:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st138;
tr661:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st138;
tr682:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st138;
st138:
	if ( ++p == pe )
		goto _test_eof138;
case 138:
#line 5982 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr312;
		case 32: goto tr312;
		case 43: goto tr313;
		case 45: goto tr313;
		case 46: goto tr314;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr315;
	} else if ( (*p) >= 9 )
		goto tr312;
	goto st0;
tr312:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
	goto st139;
tr380:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
	goto st139;
tr626:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st139;
st139:
	if ( ++p == pe )
		goto _test_eof139;
case 139:
#line 6025 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st139;
		case 32: goto st139;
		case 43: goto tr317;
		case 45: goto tr317;
		case 46: goto tr318;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr319;
	} else if ( (*p) >= 9 )
		goto st139;
	goto st0;
tr313:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st140;
tr317:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st140;
tr381:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st140;
tr625:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st140;
st140:
	if ( ++p == pe )
		goto _test_eof140;
case 140:
#line 6086 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st141;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st146;
	goto st0;
tr314:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st141;
tr318:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st141;
tr382:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st141;
tr627:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st141;
st141:
	if ( ++p == pe )
		goto _test_eof141;
case 141:
#line 6139 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st142;
	goto st0;
st142:
	if ( ++p == pe )
		goto _test_eof142;
case 142:
	switch( (*p) ) {
		case 13: goto tr323;
		case 32: goto tr323;
		case 44: goto tr325;
		case 46: goto tr326;
		case 69: goto st172;
		case 101: goto st172;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr323;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st142;
	} else
		goto tr324;
	goto st0;
tr323:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st143;
st143:
	if ( ++p == pe )
		goto _test_eof143;
case 143:
#line 6176 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st143;
		case 32: goto st143;
		case 44: goto st147;
		case 46: goto tr331;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st143;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr332;
	} else
		goto tr329;
	goto st0;
tr329:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st144;
tr324:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st144;
st144:
	if ( ++p == pe )
		goto _test_eof144;
case 144:
#line 6214 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st145;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st257;
	goto st0;
tr331:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st145;
tr326:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st145;
st145:
	if ( ++p == pe )
		goto _test_eof145;
case 145:
#line 6242 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st255;
	goto st0;
st255:
	if ( ++p == pe )
		goto _test_eof255;
case 255:
	switch( (*p) ) {
		case 13: goto tr624;
		case 32: goto tr624;
		case 44: goto tr626;
		case 46: goto tr627;
		case 65: goto tr628;
		case 67: goto tr629;
		case 69: goto st148;
		case 72: goto tr631;
		case 76: goto tr632;
		case 77: goto tr633;
		case 81: goto tr634;
		case 83: goto tr635;
		case 84: goto tr636;
		case 86: goto tr637;
		case 90: goto tr638;
		case 97: goto tr639;
		case 99: goto tr640;
		case 101: goto st148;
		case 104: goto tr641;
		case 108: goto tr642;
		case 109: goto tr643;
		case 113: goto tr644;
		case 115: goto tr645;
		case 116: goto tr646;
		case 118: goto tr647;
		case 122: goto tr638;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr624;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st255;
	} else
		goto tr625;
	goto st0;
tr624:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st256;
st256:
	if ( ++p == pe )
		goto _test_eof256;
case 256:
#line 6304 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st256;
		case 32: goto st256;
		case 44: goto st139;
		case 46: goto tr318;
		case 65: goto st18;
		case 67: goto st47;
		case 72: goto st83;
		case 76: goto st89;
		case 77: goto st1;
		case 81: goto st90;
		case 83: goto st114;
		case 84: goto st138;
		case 86: goto st150;
		case 90: goto st263;
		case 97: goto st156;
		case 99: goto st157;
		case 104: goto st158;
		case 108: goto st159;
		case 109: goto st160;
		case 113: goto st165;
		case 115: goto st166;
		case 116: goto st167;
		case 118: goto st168;
		case 122: goto st263;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st256;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr319;
	} else
		goto tr317;
	goto st0;
tr315:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st146;
tr319:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st146;
tr383:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st146;
st146:
	if ( ++p == pe )
		goto _test_eof146;
case 146:
#line 6370 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr323;
		case 32: goto tr323;
		case 44: goto tr325;
		case 46: goto st142;
		case 69: goto st172;
		case 101: goto st172;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr323;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st146;
	} else
		goto tr324;
	goto st0;
tr325:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st147;
st147:
	if ( ++p == pe )
		goto _test_eof147;
case 147:
#line 6400 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st147;
		case 32: goto st147;
		case 43: goto tr329;
		case 45: goto tr329;
		case 46: goto tr331;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr332;
	} else if ( (*p) >= 9 )
		goto st147;
	goto st0;
tr332:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st257;
st257:
	if ( ++p == pe )
		goto _test_eof257;
case 257:
#line 6424 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr624;
		case 32: goto tr624;
		case 44: goto tr626;
		case 46: goto st255;
		case 65: goto tr628;
		case 67: goto tr629;
		case 69: goto st148;
		case 72: goto tr631;
		case 76: goto tr632;
		case 77: goto tr633;
		case 81: goto tr634;
		case 83: goto tr635;
		case 84: goto tr636;
		case 86: goto tr637;
		case 90: goto tr638;
		case 97: goto tr639;
		case 99: goto tr640;
		case 101: goto st148;
		case 104: goto tr641;
		case 108: goto tr642;
		case 109: goto tr643;
		case 113: goto tr644;
		case 115: goto tr645;
		case 116: goto tr646;
		case 118: goto tr647;
		case 122: goto tr638;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr624;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st257;
	} else
		goto tr625;
	goto st0;
st148:
	if ( ++p == pe )
		goto _test_eof148;
case 148:
	switch( (*p) ) {
		case 43: goto st149;
		case 45: goto st149;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st258;
	goto st0;
st149:
	if ( ++p == pe )
		goto _test_eof149;
case 149:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st258;
	goto st0;
st258:
	if ( ++p == pe )
		goto _test_eof258;
case 258:
	switch( (*p) ) {
		case 13: goto tr624;
		case 32: goto tr624;
		case 44: goto tr626;
		case 46: goto tr627;
		case 65: goto tr628;
		case 67: goto tr629;
		case 72: goto tr631;
		case 76: goto tr632;
		case 77: goto tr633;
		case 81: goto tr634;
		case 83: goto tr635;
		case 84: goto tr636;
		case 86: goto tr637;
		case 90: goto tr638;
		case 97: goto tr639;
		case 99: goto tr640;
		case 104: goto tr641;
		case 108: goto tr642;
		case 109: goto tr643;
		case 113: goto tr644;
		case 115: goto tr645;
		case 116: goto tr646;
		case 118: goto tr647;
		case 122: goto tr638;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr624;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st258;
	} else
		goto tr625;
	goto st0;
tr447:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st150;
tr489:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st150;
tr512:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st150;
tr537:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st150;
tr562:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st150;
tr587:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st150;
tr612:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st150;
tr637:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st150;
tr662:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st150;
tr683:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st150;
st150:
	if ( ++p == pe )
		goto _test_eof150;
case 150:
#line 6647 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr338;
		case 32: goto tr338;
		case 43: goto tr339;
		case 45: goto tr339;
		case 46: goto tr340;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr341;
	} else if ( (*p) >= 9 )
		goto tr338;
	goto st0;
tr338:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
	goto st151;
tr384:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
	goto st151;
tr651:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st151;
st151:
	if ( ++p == pe )
		goto _test_eof151;
case 151:
#line 6690 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st151;
		case 32: goto st151;
		case 43: goto tr343;
		case 45: goto tr343;
		case 46: goto tr344;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr345;
	} else if ( (*p) >= 9 )
		goto st151;
	goto st0;
tr339:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st152;
tr343:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st152;
tr385:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st152;
tr650:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st152;
st152:
	if ( ++p == pe )
		goto _test_eof152;
case 152:
#line 6751 "MROGeometry/PathParser.m"
	if ( (*p) == 46 )
		goto st153;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st261;
	goto st0;
tr340:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st153;
tr344:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st153;
tr386:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st153;
tr652:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st153;
st153:
	if ( ++p == pe )
		goto _test_eof153;
case 153:
#line 6804 "MROGeometry/PathParser.m"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st259;
	goto st0;
st259:
	if ( ++p == pe )
		goto _test_eof259;
case 259:
	switch( (*p) ) {
		case 13: goto tr649;
		case 32: goto tr649;
		case 44: goto tr651;
		case 46: goto tr652;
		case 65: goto tr653;
		case 67: goto tr654;
		case 69: goto st154;
		case 72: goto tr656;
		case 76: goto tr657;
		case 77: goto tr658;
		case 81: goto tr659;
		case 83: goto tr660;
		case 84: goto tr661;
		case 86: goto tr662;
		case 90: goto tr663;
		case 97: goto tr664;
		case 99: goto tr665;
		case 101: goto st154;
		case 104: goto tr666;
		case 108: goto tr667;
		case 109: goto tr668;
		case 113: goto tr669;
		case 115: goto tr670;
		case 116: goto tr671;
		case 118: goto tr672;
		case 122: goto tr663;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr649;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st259;
	} else
		goto tr650;
	goto st0;
tr649:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st260;
st260:
	if ( ++p == pe )
		goto _test_eof260;
case 260:
#line 6866 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st260;
		case 32: goto st260;
		case 44: goto st151;
		case 46: goto tr344;
		case 65: goto st18;
		case 67: goto st47;
		case 72: goto st83;
		case 76: goto st89;
		case 77: goto st1;
		case 81: goto st90;
		case 83: goto st114;
		case 84: goto st138;
		case 86: goto st150;
		case 90: goto st263;
		case 97: goto st156;
		case 99: goto st157;
		case 104: goto st158;
		case 108: goto st159;
		case 109: goto st160;
		case 113: goto st165;
		case 115: goto st166;
		case 116: goto st167;
		case 118: goto st168;
		case 122: goto st263;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto st260;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr345;
	} else
		goto tr343;
	goto st0;
tr341:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st261;
tr345:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st261;
tr387:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st261;
st261:
	if ( ++p == pe )
		goto _test_eof261;
case 261:
#line 6932 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr649;
		case 32: goto tr649;
		case 44: goto tr651;
		case 46: goto st259;
		case 65: goto tr653;
		case 67: goto tr654;
		case 69: goto st154;
		case 72: goto tr656;
		case 76: goto tr657;
		case 77: goto tr658;
		case 81: goto tr659;
		case 83: goto tr660;
		case 84: goto tr661;
		case 86: goto tr662;
		case 90: goto tr663;
		case 97: goto tr664;
		case 99: goto tr665;
		case 101: goto st154;
		case 104: goto tr666;
		case 108: goto tr667;
		case 109: goto tr668;
		case 113: goto tr669;
		case 115: goto tr670;
		case 116: goto tr671;
		case 118: goto tr672;
		case 122: goto tr663;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr649;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st261;
	} else
		goto tr650;
	goto st0;
st154:
	if ( ++p == pe )
		goto _test_eof154;
case 154:
	switch( (*p) ) {
		case 43: goto st155;
		case 45: goto st155;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st262;
	goto st0;
st155:
	if ( ++p == pe )
		goto _test_eof155;
case 155:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st262;
	goto st0;
st262:
	if ( ++p == pe )
		goto _test_eof262;
case 262:
	switch( (*p) ) {
		case 13: goto tr649;
		case 32: goto tr649;
		case 44: goto tr651;
		case 46: goto tr652;
		case 65: goto tr653;
		case 67: goto tr654;
		case 72: goto tr656;
		case 76: goto tr657;
		case 77: goto tr658;
		case 81: goto tr659;
		case 83: goto tr660;
		case 84: goto tr661;
		case 86: goto tr662;
		case 90: goto tr663;
		case 97: goto tr664;
		case 99: goto tr665;
		case 104: goto tr666;
		case 108: goto tr667;
		case 109: goto tr668;
		case 113: goto tr669;
		case 115: goto tr670;
		case 116: goto tr671;
		case 118: goto tr672;
		case 122: goto tr663;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr649;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st262;
	} else
		goto tr650;
	goto st0;
tr448:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st263;
tr490:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st263;
tr513:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st263;
tr538:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st263;
tr563:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st263;
tr588:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st263;
tr613:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st263;
tr638:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st263;
tr663:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st263;
tr684:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st263;
st263:
	if ( ++p == pe )
		goto _test_eof263;
case 263:
#line 7155 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr674;
		case 32: goto tr674;
		case 65: goto tr675;
		case 67: goto tr676;
		case 72: goto tr677;
		case 76: goto tr678;
		case 77: goto tr679;
		case 81: goto tr680;
		case 83: goto tr681;
		case 84: goto tr682;
		case 86: goto tr683;
		case 90: goto tr684;
		case 97: goto tr685;
		case 99: goto tr686;
		case 104: goto tr687;
		case 108: goto tr688;
		case 109: goto tr689;
		case 113: goto tr690;
		case 115: goto tr691;
		case 116: goto tr692;
		case 118: goto tr693;
		case 122: goto tr684;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto tr674;
	goto st0;
tr674:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st264;
st264:
	if ( ++p == pe )
		goto _test_eof264;
case 264:
#line 7193 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st264;
		case 32: goto st264;
		case 65: goto st18;
		case 67: goto st47;
		case 72: goto st83;
		case 76: goto st89;
		case 77: goto st1;
		case 81: goto st90;
		case 83: goto st114;
		case 84: goto st138;
		case 86: goto st150;
		case 90: goto st263;
		case 97: goto st156;
		case 99: goto st157;
		case 104: goto st158;
		case 108: goto st159;
		case 109: goto st160;
		case 113: goto st165;
		case 115: goto st166;
		case 116: goto st167;
		case 118: goto st168;
		case 122: goto st263;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto st264;
	goto st0;
tr449:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st156;
tr491:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st156;
tr514:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st156;
tr539:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st156;
tr564:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st156;
tr589:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st156;
tr614:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st156;
tr639:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st156;
tr664:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st156;
tr685:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st156;
st156:
	if ( ++p == pe )
		goto _test_eof156;
case 156:
#line 7349 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr351;
		case 32: goto tr351;
		case 46: goto tr352;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr353;
	} else if ( (*p) >= 9 )
		goto tr351;
	goto st0;
tr450:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st157;
tr492:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st157;
tr515:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st157;
tr540:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st157;
tr565:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st157;
tr590:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st157;
tr615:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st157;
tr640:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st157;
tr665:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st157;
tr686:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st157;
st157:
	if ( ++p == pe )
		goto _test_eof157;
case 157:
#line 7489 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr354;
		case 32: goto tr354;
		case 43: goto tr355;
		case 45: goto tr355;
		case 46: goto tr356;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr357;
	} else if ( (*p) >= 9 )
		goto tr354;
	goto st0;
tr451:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st158;
tr493:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st158;
tr516:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st158;
tr541:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st158;
tr566:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st158;
tr591:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st158;
tr616:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st158;
tr641:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st158;
tr666:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st158;
tr687:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st158;
st158:
	if ( ++p == pe )
		goto _test_eof158;
case 158:
#line 7631 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr358;
		case 32: goto tr358;
		case 43: goto tr359;
		case 45: goto tr359;
		case 46: goto tr360;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr361;
	} else if ( (*p) >= 9 )
		goto tr358;
	goto st0;
tr452:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st159;
tr494:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st159;
tr517:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st159;
tr542:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st159;
tr567:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st159;
tr592:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st159;
tr617:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st159;
tr642:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st159;
tr667:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st159;
tr688:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st159;
st159:
	if ( ++p == pe )
		goto _test_eof159;
case 159:
#line 7773 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr362;
		case 32: goto tr362;
		case 43: goto tr363;
		case 45: goto tr363;
		case 46: goto tr364;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr365;
	} else if ( (*p) >= 9 )
		goto tr362;
	goto st0;
tr453:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st160;
tr495:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st160;
tr518:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st160;
tr543:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st160;
tr568:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st160;
tr593:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st160;
tr618:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st160;
tr643:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st160;
tr668:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st160;
tr689:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st160;
st160:
	if ( ++p == pe )
		goto _test_eof160;
case 160:
#line 7915 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr366;
		case 32: goto tr366;
		case 43: goto tr367;
		case 45: goto tr367;
		case 46: goto tr368;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr369;
	} else if ( (*p) >= 9 )
		goto tr366;
	goto st0;
tr4:
#line 90 "MROGeometry/PathParser.rl"
	{
    absolute = YES;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st161;
tr8:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st161;
tr369:
#line 94 "MROGeometry/PathParser.rl"
	{
    absolute = NO;
  }
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st161;
st161:
	if ( ++p == pe )
		goto _test_eof161;
case 161:
#line 7959 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr12;
		case 32: goto tr12;
		case 44: goto tr14;
		case 46: goto st5;
		case 69: goto st169;
		case 101: goto st169;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr12;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st161;
	} else
		goto tr13;
	goto st0;
tr14:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st162;
st162:
	if ( ++p == pe )
		goto _test_eof162;
case 162:
#line 7989 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st162;
		case 32: goto st162;
		case 43: goto tr18;
		case 45: goto tr18;
		case 46: goto tr20;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr21;
	} else if ( (*p) >= 9 )
		goto st162;
	goto st0;
tr21:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st265;
st265:
	if ( ++p == pe )
		goto _test_eof265;
case 265:
#line 8013 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr434;
		case 32: goto tr434;
		case 44: goto tr436;
		case 46: goto st233;
		case 65: goto tr438;
		case 67: goto tr439;
		case 69: goto st163;
		case 72: goto tr441;
		case 76: goto tr442;
		case 77: goto tr443;
		case 81: goto tr444;
		case 83: goto tr445;
		case 84: goto tr446;
		case 86: goto tr447;
		case 90: goto tr448;
		case 97: goto tr449;
		case 99: goto tr450;
		case 101: goto st163;
		case 104: goto tr451;
		case 108: goto tr452;
		case 109: goto tr453;
		case 113: goto tr454;
		case 115: goto tr455;
		case 116: goto tr456;
		case 118: goto tr457;
		case 122: goto tr448;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr434;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st265;
	} else
		goto tr435;
	goto st0;
st163:
	if ( ++p == pe )
		goto _test_eof163;
case 163:
	switch( (*p) ) {
		case 43: goto st164;
		case 45: goto st164;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st266;
	goto st0;
st164:
	if ( ++p == pe )
		goto _test_eof164;
case 164:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st266;
	goto st0;
st266:
	if ( ++p == pe )
		goto _test_eof266;
case 266:
	switch( (*p) ) {
		case 13: goto tr434;
		case 32: goto tr434;
		case 44: goto tr436;
		case 46: goto tr437;
		case 65: goto tr438;
		case 67: goto tr439;
		case 72: goto tr441;
		case 76: goto tr442;
		case 77: goto tr443;
		case 81: goto tr444;
		case 83: goto tr445;
		case 84: goto tr446;
		case 86: goto tr447;
		case 90: goto tr448;
		case 97: goto tr449;
		case 99: goto tr450;
		case 104: goto tr451;
		case 108: goto tr452;
		case 109: goto tr453;
		case 113: goto tr454;
		case 115: goto tr455;
		case 116: goto tr456;
		case 118: goto tr457;
		case 122: goto tr448;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr434;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st266;
	} else
		goto tr435;
	goto st0;
tr454:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st165;
tr496:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st165;
tr519:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st165;
tr544:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st165;
tr569:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st165;
tr594:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st165;
tr619:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st165;
tr644:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st165;
tr669:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st165;
tr690:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st165;
st165:
	if ( ++p == pe )
		goto _test_eof165;
case 165:
#line 8236 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr372;
		case 32: goto tr372;
		case 43: goto tr373;
		case 45: goto tr373;
		case 46: goto tr374;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr375;
	} else if ( (*p) >= 9 )
		goto tr372;
	goto st0;
tr455:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st166;
tr497:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st166;
tr520:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st166;
tr545:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st166;
tr570:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st166;
tr595:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st166;
tr620:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st166;
tr645:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st166;
tr670:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st166;
tr691:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st166;
st166:
	if ( ++p == pe )
		goto _test_eof166;
case 166:
#line 8378 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr376;
		case 32: goto tr376;
		case 43: goto tr377;
		case 45: goto tr377;
		case 46: goto tr378;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr379;
	} else if ( (*p) >= 9 )
		goto tr376;
	goto st0;
tr456:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st167;
tr498:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st167;
tr521:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st167;
tr546:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st167;
tr571:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st167;
tr596:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st167;
tr621:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st167;
tr646:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st167;
tr671:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st167;
tr692:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st167;
st167:
	if ( ++p == pe )
		goto _test_eof167;
case 167:
#line 8520 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr380;
		case 32: goto tr380;
		case 43: goto tr381;
		case 45: goto tr381;
		case 46: goto tr382;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr383;
	} else if ( (*p) >= 9 )
		goto tr380;
	goto st0;
tr457:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st168;
tr499:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	goto st168;
tr522:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	goto st168;
tr547:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	goto st168;
tr572:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	goto st168;
tr597:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	goto st168;
tr622:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	goto st168;
tr647:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	goto st168;
tr672:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	goto st168;
tr693:
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	goto st168;
st168:
	if ( ++p == pe )
		goto _test_eof168;
case 168:
#line 8662 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr384;
		case 32: goto tr384;
		case 43: goto tr385;
		case 45: goto tr385;
		case 46: goto tr386;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr387;
	} else if ( (*p) >= 9 )
		goto tr384;
	goto st0;
st169:
	if ( ++p == pe )
		goto _test_eof169;
case 169:
	switch( (*p) ) {
		case 43: goto st170;
		case 45: goto st170;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st171;
	goto st0;
st170:
	if ( ++p == pe )
		goto _test_eof170;
case 170:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st171;
	goto st0;
st171:
	if ( ++p == pe )
		goto _test_eof171;
case 171:
	switch( (*p) ) {
		case 13: goto tr12;
		case 32: goto tr12;
		case 44: goto tr14;
		case 46: goto tr15;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr12;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st171;
	} else
		goto tr13;
	goto st0;
st172:
	if ( ++p == pe )
		goto _test_eof172;
case 172:
	switch( (*p) ) {
		case 43: goto st173;
		case 45: goto st173;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st174;
	goto st0;
st173:
	if ( ++p == pe )
		goto _test_eof173;
case 173:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st174;
	goto st0;
st174:
	if ( ++p == pe )
		goto _test_eof174;
case 174:
	switch( (*p) ) {
		case 13: goto tr323;
		case 32: goto tr323;
		case 44: goto tr325;
		case 46: goto tr326;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr323;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st174;
	} else
		goto tr324;
	goto st0;
st175:
	if ( ++p == pe )
		goto _test_eof175;
case 175:
	switch( (*p) ) {
		case 43: goto st176;
		case 45: goto st176;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st177;
	goto st0;
st176:
	if ( ++p == pe )
		goto _test_eof176;
case 176:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st177;
	goto st0;
st177:
	if ( ++p == pe )
		goto _test_eof177;
case 177:
	switch( (*p) ) {
		case 13: goto tr297;
		case 32: goto tr297;
		case 44: goto tr299;
		case 46: goto tr300;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr297;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st177;
	} else
		goto tr298;
	goto st0;
st178:
	if ( ++p == pe )
		goto _test_eof178;
case 178:
	switch( (*p) ) {
		case 43: goto st179;
		case 45: goto st179;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st180;
	goto st0;
st179:
	if ( ++p == pe )
		goto _test_eof179;
case 179:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st180;
	goto st0;
st180:
	if ( ++p == pe )
		goto _test_eof180;
case 180:
	switch( (*p) ) {
		case 13: goto tr284;
		case 32: goto tr284;
		case 44: goto tr286;
		case 46: goto tr287;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr284;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st180;
	} else
		goto tr285;
	goto st0;
st181:
	if ( ++p == pe )
		goto _test_eof181;
case 181:
	switch( (*p) ) {
		case 43: goto st182;
		case 45: goto st182;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st183;
	goto st0;
st182:
	if ( ++p == pe )
		goto _test_eof182;
case 182:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st183;
	goto st0;
st183:
	if ( ++p == pe )
		goto _test_eof183;
case 183:
	switch( (*p) ) {
		case 13: goto tr271;
		case 32: goto tr271;
		case 44: goto tr273;
		case 46: goto tr274;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr271;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st183;
	} else
		goto tr272;
	goto st0;
st184:
	if ( ++p == pe )
		goto _test_eof184;
case 184:
	switch( (*p) ) {
		case 43: goto st185;
		case 45: goto st185;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st186;
	goto st0;
st185:
	if ( ++p == pe )
		goto _test_eof185;
case 185:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st186;
	goto st0;
st186:
	if ( ++p == pe )
		goto _test_eof186;
case 186:
	switch( (*p) ) {
		case 13: goto tr245;
		case 32: goto tr245;
		case 44: goto tr247;
		case 46: goto tr248;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr245;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st186;
	} else
		goto tr246;
	goto st0;
st187:
	if ( ++p == pe )
		goto _test_eof187;
case 187:
	switch( (*p) ) {
		case 43: goto st188;
		case 45: goto st188;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st189;
	goto st0;
st188:
	if ( ++p == pe )
		goto _test_eof188;
case 188:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st189;
	goto st0;
st189:
	if ( ++p == pe )
		goto _test_eof189;
case 189:
	switch( (*p) ) {
		case 13: goto tr232;
		case 32: goto tr232;
		case 44: goto tr234;
		case 46: goto tr235;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr232;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st189;
	} else
		goto tr233;
	goto st0;
st190:
	if ( ++p == pe )
		goto _test_eof190;
case 190:
	switch( (*p) ) {
		case 43: goto st191;
		case 45: goto st191;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st192;
	goto st0;
st191:
	if ( ++p == pe )
		goto _test_eof191;
case 191:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st192;
	goto st0;
st192:
	if ( ++p == pe )
		goto _test_eof192;
case 192:
	switch( (*p) ) {
		case 13: goto tr219;
		case 32: goto tr219;
		case 44: goto tr221;
		case 46: goto tr222;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr219;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st192;
	} else
		goto tr220;
	goto st0;
st193:
	if ( ++p == pe )
		goto _test_eof193;
case 193:
	switch( (*p) ) {
		case 43: goto st194;
		case 45: goto st194;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st195;
	goto st0;
st194:
	if ( ++p == pe )
		goto _test_eof194;
case 194:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st195;
	goto st0;
st195:
	if ( ++p == pe )
		goto _test_eof195;
case 195:
	switch( (*p) ) {
		case 13: goto tr176;
		case 32: goto tr176;
		case 44: goto tr178;
		case 46: goto tr179;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr176;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st195;
	} else
		goto tr177;
	goto st0;
st196:
	if ( ++p == pe )
		goto _test_eof196;
case 196:
	switch( (*p) ) {
		case 43: goto st197;
		case 45: goto st197;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st198;
	goto st0;
st197:
	if ( ++p == pe )
		goto _test_eof197;
case 197:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st198;
	goto st0;
st198:
	if ( ++p == pe )
		goto _test_eof198;
case 198:
	switch( (*p) ) {
		case 13: goto tr163;
		case 32: goto tr163;
		case 44: goto tr165;
		case 46: goto tr166;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr163;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st198;
	} else
		goto tr164;
	goto st0;
st199:
	if ( ++p == pe )
		goto _test_eof199;
case 199:
	switch( (*p) ) {
		case 43: goto st200;
		case 45: goto st200;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st201;
	goto st0;
st200:
	if ( ++p == pe )
		goto _test_eof200;
case 200:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st201;
	goto st0;
st201:
	if ( ++p == pe )
		goto _test_eof201;
case 201:
	switch( (*p) ) {
		case 13: goto tr150;
		case 32: goto tr150;
		case 44: goto tr152;
		case 46: goto tr153;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr150;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st201;
	} else
		goto tr151;
	goto st0;
st202:
	if ( ++p == pe )
		goto _test_eof202;
case 202:
	switch( (*p) ) {
		case 43: goto st203;
		case 45: goto st203;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st204;
	goto st0;
st203:
	if ( ++p == pe )
		goto _test_eof203;
case 203:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st204;
	goto st0;
st204:
	if ( ++p == pe )
		goto _test_eof204;
case 204:
	switch( (*p) ) {
		case 13: goto tr137;
		case 32: goto tr137;
		case 44: goto tr139;
		case 46: goto tr140;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr137;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st204;
	} else
		goto tr138;
	goto st0;
st205:
	if ( ++p == pe )
		goto _test_eof205;
case 205:
	switch( (*p) ) {
		case 43: goto st206;
		case 45: goto st206;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st207;
	goto st0;
st206:
	if ( ++p == pe )
		goto _test_eof206;
case 206:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st207;
	goto st0;
st207:
	if ( ++p == pe )
		goto _test_eof207;
case 207:
	switch( (*p) ) {
		case 13: goto tr124;
		case 32: goto tr124;
		case 44: goto tr126;
		case 46: goto tr127;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr124;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st207;
	} else
		goto tr125;
	goto st0;
st208:
	if ( ++p == pe )
		goto _test_eof208;
case 208:
	switch( (*p) ) {
		case 43: goto st209;
		case 45: goto st209;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st267;
	goto st0;
st209:
	if ( ++p == pe )
		goto _test_eof209;
case 209:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st267;
	goto st0;
st267:
	if ( ++p == pe )
		goto _test_eof267;
case 267:
	switch( (*p) ) {
		case 13: goto tr500;
		case 32: goto tr500;
		case 44: goto tr501;
		case 46: goto tr502;
		case 65: goto tr503;
		case 67: goto tr504;
		case 72: goto tr506;
		case 76: goto tr507;
		case 77: goto tr508;
		case 81: goto tr509;
		case 83: goto tr510;
		case 84: goto tr511;
		case 86: goto tr512;
		case 90: goto tr513;
		case 97: goto tr514;
		case 99: goto tr515;
		case 104: goto tr516;
		case 108: goto tr517;
		case 109: goto tr518;
		case 113: goto tr519;
		case 115: goto tr520;
		case 116: goto tr521;
		case 118: goto tr522;
		case 122: goto tr513;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st267;
	} else if ( (*p) >= 9 )
		goto tr500;
	goto st0;
tr106:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st268;
st268:
	if ( ++p == pe )
		goto _test_eof268;
case 268:
#line 9221 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr500;
		case 32: goto tr500;
		case 44: goto tr501;
		case 46: goto st237;
		case 65: goto tr503;
		case 67: goto tr504;
		case 69: goto st208;
		case 72: goto tr506;
		case 76: goto tr507;
		case 77: goto tr508;
		case 81: goto tr509;
		case 83: goto tr510;
		case 84: goto tr511;
		case 86: goto tr512;
		case 90: goto tr513;
		case 97: goto tr514;
		case 99: goto tr515;
		case 101: goto st208;
		case 104: goto tr516;
		case 108: goto tr517;
		case 109: goto tr518;
		case 113: goto tr519;
		case 115: goto tr520;
		case 116: goto tr521;
		case 118: goto tr522;
		case 122: goto tr513;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st268;
	} else if ( (*p) >= 9 )
		goto tr500;
	goto st0;
tr99:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st210;
st210:
	if ( ++p == pe )
		goto _test_eof210;
case 210:
#line 9268 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st210;
		case 32: goto st210;
		case 43: goto tr103;
		case 45: goto tr103;
		case 46: goto tr105;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr106;
	} else if ( (*p) >= 9 )
		goto st210;
	goto st0;
st211:
	if ( ++p == pe )
		goto _test_eof211;
case 211:
	switch( (*p) ) {
		case 43: goto st212;
		case 45: goto st212;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st213;
	goto st0;
st212:
	if ( ++p == pe )
		goto _test_eof212;
case 212:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st213;
	goto st0;
st213:
	if ( ++p == pe )
		goto _test_eof213;
case 213:
	switch( (*p) ) {
		case 13: goto tr97;
		case 32: goto tr97;
		case 44: goto tr99;
		case 46: goto tr100;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr97;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st213;
	} else
		goto tr98;
	goto st0;
tr93:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st214;
st214:
	if ( ++p == pe )
		goto _test_eof214;
case 214:
#line 9329 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr97;
		case 32: goto tr97;
		case 44: goto tr99;
		case 46: goto st39;
		case 69: goto st211;
		case 101: goto st211;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr97;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st214;
	} else
		goto tr98;
	goto st0;
tr88:
#line 85 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action push_false isn't implemented yet." format:@""];
  }
	goto st215;
tr419:
#line 80 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action push_true isn't implemented yet." format:@""];
  }
	goto st215;
st215:
	if ( ++p == pe )
		goto _test_eof215;
case 215:
#line 9365 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st215;
		case 32: goto st215;
		case 43: goto tr90;
		case 45: goto tr90;
		case 46: goto tr92;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr93;
	} else if ( (*p) >= 9 )
		goto st215;
	goto st0;
st216:
	if ( ++p == pe )
		goto _test_eof216;
case 216:
	switch( (*p) ) {
		case 13: goto tr418;
		case 32: goto tr418;
		case 44: goto tr419;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto tr418;
	goto st0;
st217:
	if ( ++p == pe )
		goto _test_eof217;
case 217:
	switch( (*p) ) {
		case 13: goto tr420;
		case 32: goto tr420;
		case 44: goto tr421;
	}
	if ( 9 <= (*p) && (*p) <= 10 )
		goto tr420;
	goto st0;
st218:
	if ( ++p == pe )
		goto _test_eof218;
case 218:
	switch( (*p) ) {
		case 43: goto st219;
		case 45: goto st219;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st220;
	goto st0;
st219:
	if ( ++p == pe )
		goto _test_eof219;
case 219:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st220;
	goto st0;
st220:
	if ( ++p == pe )
		goto _test_eof220;
case 220:
	switch( (*p) ) {
		case 13: goto tr74;
		case 32: goto tr74;
		case 44: goto tr75;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st220;
	} else if ( (*p) >= 9 )
		goto tr74;
	goto st0;
tr70:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st221;
st221:
	if ( ++p == pe )
		goto _test_eof221;
case 221:
#line 9446 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr74;
		case 32: goto tr74;
		case 44: goto tr75;
		case 46: goto st29;
		case 69: goto st218;
		case 101: goto st218;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st221;
	} else if ( (*p) >= 9 )
		goto tr74;
	goto st0;
tr63:
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
	goto st222;
st222:
	if ( ++p == pe )
		goto _test_eof222;
case 222:
#line 9473 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto st222;
		case 32: goto st222;
		case 43: goto tr67;
		case 45: goto tr67;
		case 46: goto tr69;
	}
	if ( (*p) > 10 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto tr70;
	} else if ( (*p) >= 9 )
		goto st222;
	goto st0;
st223:
	if ( ++p == pe )
		goto _test_eof223;
case 223:
	switch( (*p) ) {
		case 43: goto st224;
		case 45: goto st224;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st225;
	goto st0;
st224:
	if ( ++p == pe )
		goto _test_eof224;
case 224:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st225;
	goto st0;
st225:
	if ( ++p == pe )
		goto _test_eof225;
case 225:
	switch( (*p) ) {
		case 13: goto tr61;
		case 32: goto tr61;
		case 44: goto tr63;
		case 46: goto tr64;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr61;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st225;
	} else
		goto tr62;
	goto st0;
tr59:
#line 70 "MROGeometry/PathParser.rl"
	{
    start = p;
  }
	goto st226;
st226:
	if ( ++p == pe )
		goto _test_eof226;
case 226:
#line 9534 "MROGeometry/PathParser.m"
	switch( (*p) ) {
		case 13: goto tr61;
		case 32: goto tr61;
		case 44: goto tr63;
		case 46: goto st25;
		case 69: goto st223;
		case 101: goto st223;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr61;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st226;
	} else
		goto tr62;
	goto st0;
st227:
	if ( ++p == pe )
		goto _test_eof227;
case 227:
	switch( (*p) ) {
		case 43: goto st228;
		case 45: goto st228;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st269;
	goto st0;
st228:
	if ( ++p == pe )
		goto _test_eof228;
case 228:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st269;
	goto st0;
st269:
	if ( ++p == pe )
		goto _test_eof269;
case 269:
	switch( (*p) ) {
		case 13: goto tr476;
		case 32: goto tr476;
		case 44: goto tr478;
		case 46: goto tr479;
		case 65: goto tr480;
		case 67: goto tr481;
		case 72: goto tr483;
		case 76: goto tr484;
		case 77: goto tr485;
		case 81: goto tr486;
		case 83: goto tr487;
		case 84: goto tr488;
		case 86: goto tr489;
		case 90: goto tr490;
		case 97: goto tr491;
		case 99: goto tr492;
		case 104: goto tr493;
		case 108: goto tr494;
		case 109: goto tr495;
		case 113: goto tr496;
		case 115: goto tr497;
		case 116: goto tr498;
		case 118: goto tr499;
		case 122: goto tr490;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr476;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st269;
	} else
		goto tr477;
	goto st0;
st229:
	if ( ++p == pe )
		goto _test_eof229;
case 229:
	switch( (*p) ) {
		case 43: goto st230;
		case 45: goto st230;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st231;
	goto st0;
st230:
	if ( ++p == pe )
		goto _test_eof230;
case 230:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto st231;
	goto st0;
st231:
	if ( ++p == pe )
		goto _test_eof231;
case 231:
	switch( (*p) ) {
		case 13: goto tr28;
		case 32: goto tr28;
		case 44: goto tr30;
		case 46: goto tr31;
	}
	if ( (*p) < 43 ) {
		if ( 9 <= (*p) && (*p) <= 10 )
			goto tr28;
	} else if ( (*p) > 45 ) {
		if ( 48 <= (*p) && (*p) <= 57 )
			goto st231;
	} else
		goto tr29;
	goto st0;
	}
	_test_eof232: cs = 232; goto _test_eof; 
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof233: cs = 233; goto _test_eof; 
	_test_eof234: cs = 234; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof235: cs = 235; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof236: cs = 236; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 
	_test_eof22: cs = 22; goto _test_eof; 
	_test_eof23: cs = 23; goto _test_eof; 
	_test_eof24: cs = 24; goto _test_eof; 
	_test_eof25: cs = 25; goto _test_eof; 
	_test_eof26: cs = 26; goto _test_eof; 
	_test_eof27: cs = 27; goto _test_eof; 
	_test_eof28: cs = 28; goto _test_eof; 
	_test_eof29: cs = 29; goto _test_eof; 
	_test_eof30: cs = 30; goto _test_eof; 
	_test_eof31: cs = 31; goto _test_eof; 
	_test_eof32: cs = 32; goto _test_eof; 
	_test_eof33: cs = 33; goto _test_eof; 
	_test_eof34: cs = 34; goto _test_eof; 
	_test_eof35: cs = 35; goto _test_eof; 
	_test_eof36: cs = 36; goto _test_eof; 
	_test_eof37: cs = 37; goto _test_eof; 
	_test_eof38: cs = 38; goto _test_eof; 
	_test_eof39: cs = 39; goto _test_eof; 
	_test_eof40: cs = 40; goto _test_eof; 
	_test_eof41: cs = 41; goto _test_eof; 
	_test_eof42: cs = 42; goto _test_eof; 
	_test_eof237: cs = 237; goto _test_eof; 
	_test_eof238: cs = 238; goto _test_eof; 
	_test_eof43: cs = 43; goto _test_eof; 
	_test_eof44: cs = 44; goto _test_eof; 
	_test_eof45: cs = 45; goto _test_eof; 
	_test_eof46: cs = 46; goto _test_eof; 
	_test_eof47: cs = 47; goto _test_eof; 
	_test_eof48: cs = 48; goto _test_eof; 
	_test_eof49: cs = 49; goto _test_eof; 
	_test_eof50: cs = 50; goto _test_eof; 
	_test_eof51: cs = 51; goto _test_eof; 
	_test_eof52: cs = 52; goto _test_eof; 
	_test_eof53: cs = 53; goto _test_eof; 
	_test_eof54: cs = 54; goto _test_eof; 
	_test_eof55: cs = 55; goto _test_eof; 
	_test_eof56: cs = 56; goto _test_eof; 
	_test_eof57: cs = 57; goto _test_eof; 
	_test_eof58: cs = 58; goto _test_eof; 
	_test_eof59: cs = 59; goto _test_eof; 
	_test_eof60: cs = 60; goto _test_eof; 
	_test_eof61: cs = 61; goto _test_eof; 
	_test_eof62: cs = 62; goto _test_eof; 
	_test_eof63: cs = 63; goto _test_eof; 
	_test_eof64: cs = 64; goto _test_eof; 
	_test_eof65: cs = 65; goto _test_eof; 
	_test_eof66: cs = 66; goto _test_eof; 
	_test_eof67: cs = 67; goto _test_eof; 
	_test_eof68: cs = 68; goto _test_eof; 
	_test_eof69: cs = 69; goto _test_eof; 
	_test_eof70: cs = 70; goto _test_eof; 
	_test_eof239: cs = 239; goto _test_eof; 
	_test_eof240: cs = 240; goto _test_eof; 
	_test_eof71: cs = 71; goto _test_eof; 
	_test_eof72: cs = 72; goto _test_eof; 
	_test_eof73: cs = 73; goto _test_eof; 
	_test_eof74: cs = 74; goto _test_eof; 
	_test_eof75: cs = 75; goto _test_eof; 
	_test_eof76: cs = 76; goto _test_eof; 
	_test_eof77: cs = 77; goto _test_eof; 
	_test_eof78: cs = 78; goto _test_eof; 
	_test_eof79: cs = 79; goto _test_eof; 
	_test_eof80: cs = 80; goto _test_eof; 
	_test_eof241: cs = 241; goto _test_eof; 
	_test_eof81: cs = 81; goto _test_eof; 
	_test_eof82: cs = 82; goto _test_eof; 
	_test_eof242: cs = 242; goto _test_eof; 
	_test_eof83: cs = 83; goto _test_eof; 
	_test_eof84: cs = 84; goto _test_eof; 
	_test_eof85: cs = 85; goto _test_eof; 
	_test_eof86: cs = 86; goto _test_eof; 
	_test_eof243: cs = 243; goto _test_eof; 
	_test_eof244: cs = 244; goto _test_eof; 
	_test_eof245: cs = 245; goto _test_eof; 
	_test_eof87: cs = 87; goto _test_eof; 
	_test_eof88: cs = 88; goto _test_eof; 
	_test_eof246: cs = 246; goto _test_eof; 
	_test_eof89: cs = 89; goto _test_eof; 
	_test_eof90: cs = 90; goto _test_eof; 
	_test_eof91: cs = 91; goto _test_eof; 
	_test_eof92: cs = 92; goto _test_eof; 
	_test_eof93: cs = 93; goto _test_eof; 
	_test_eof94: cs = 94; goto _test_eof; 
	_test_eof95: cs = 95; goto _test_eof; 
	_test_eof96: cs = 96; goto _test_eof; 
	_test_eof97: cs = 97; goto _test_eof; 
	_test_eof98: cs = 98; goto _test_eof; 
	_test_eof99: cs = 99; goto _test_eof; 
	_test_eof100: cs = 100; goto _test_eof; 
	_test_eof101: cs = 101; goto _test_eof; 
	_test_eof102: cs = 102; goto _test_eof; 
	_test_eof103: cs = 103; goto _test_eof; 
	_test_eof104: cs = 104; goto _test_eof; 
	_test_eof105: cs = 105; goto _test_eof; 
	_test_eof247: cs = 247; goto _test_eof; 
	_test_eof248: cs = 248; goto _test_eof; 
	_test_eof106: cs = 106; goto _test_eof; 
	_test_eof107: cs = 107; goto _test_eof; 
	_test_eof108: cs = 108; goto _test_eof; 
	_test_eof109: cs = 109; goto _test_eof; 
	_test_eof110: cs = 110; goto _test_eof; 
	_test_eof111: cs = 111; goto _test_eof; 
	_test_eof249: cs = 249; goto _test_eof; 
	_test_eof112: cs = 112; goto _test_eof; 
	_test_eof113: cs = 113; goto _test_eof; 
	_test_eof250: cs = 250; goto _test_eof; 
	_test_eof114: cs = 114; goto _test_eof; 
	_test_eof115: cs = 115; goto _test_eof; 
	_test_eof116: cs = 116; goto _test_eof; 
	_test_eof117: cs = 117; goto _test_eof; 
	_test_eof118: cs = 118; goto _test_eof; 
	_test_eof119: cs = 119; goto _test_eof; 
	_test_eof120: cs = 120; goto _test_eof; 
	_test_eof121: cs = 121; goto _test_eof; 
	_test_eof122: cs = 122; goto _test_eof; 
	_test_eof123: cs = 123; goto _test_eof; 
	_test_eof124: cs = 124; goto _test_eof; 
	_test_eof125: cs = 125; goto _test_eof; 
	_test_eof126: cs = 126; goto _test_eof; 
	_test_eof127: cs = 127; goto _test_eof; 
	_test_eof128: cs = 128; goto _test_eof; 
	_test_eof129: cs = 129; goto _test_eof; 
	_test_eof251: cs = 251; goto _test_eof; 
	_test_eof252: cs = 252; goto _test_eof; 
	_test_eof130: cs = 130; goto _test_eof; 
	_test_eof131: cs = 131; goto _test_eof; 
	_test_eof132: cs = 132; goto _test_eof; 
	_test_eof133: cs = 133; goto _test_eof; 
	_test_eof134: cs = 134; goto _test_eof; 
	_test_eof135: cs = 135; goto _test_eof; 
	_test_eof253: cs = 253; goto _test_eof; 
	_test_eof136: cs = 136; goto _test_eof; 
	_test_eof137: cs = 137; goto _test_eof; 
	_test_eof254: cs = 254; goto _test_eof; 
	_test_eof138: cs = 138; goto _test_eof; 
	_test_eof139: cs = 139; goto _test_eof; 
	_test_eof140: cs = 140; goto _test_eof; 
	_test_eof141: cs = 141; goto _test_eof; 
	_test_eof142: cs = 142; goto _test_eof; 
	_test_eof143: cs = 143; goto _test_eof; 
	_test_eof144: cs = 144; goto _test_eof; 
	_test_eof145: cs = 145; goto _test_eof; 
	_test_eof255: cs = 255; goto _test_eof; 
	_test_eof256: cs = 256; goto _test_eof; 
	_test_eof146: cs = 146; goto _test_eof; 
	_test_eof147: cs = 147; goto _test_eof; 
	_test_eof257: cs = 257; goto _test_eof; 
	_test_eof148: cs = 148; goto _test_eof; 
	_test_eof149: cs = 149; goto _test_eof; 
	_test_eof258: cs = 258; goto _test_eof; 
	_test_eof150: cs = 150; goto _test_eof; 
	_test_eof151: cs = 151; goto _test_eof; 
	_test_eof152: cs = 152; goto _test_eof; 
	_test_eof153: cs = 153; goto _test_eof; 
	_test_eof259: cs = 259; goto _test_eof; 
	_test_eof260: cs = 260; goto _test_eof; 
	_test_eof261: cs = 261; goto _test_eof; 
	_test_eof154: cs = 154; goto _test_eof; 
	_test_eof155: cs = 155; goto _test_eof; 
	_test_eof262: cs = 262; goto _test_eof; 
	_test_eof263: cs = 263; goto _test_eof; 
	_test_eof264: cs = 264; goto _test_eof; 
	_test_eof156: cs = 156; goto _test_eof; 
	_test_eof157: cs = 157; goto _test_eof; 
	_test_eof158: cs = 158; goto _test_eof; 
	_test_eof159: cs = 159; goto _test_eof; 
	_test_eof160: cs = 160; goto _test_eof; 
	_test_eof161: cs = 161; goto _test_eof; 
	_test_eof162: cs = 162; goto _test_eof; 
	_test_eof265: cs = 265; goto _test_eof; 
	_test_eof163: cs = 163; goto _test_eof; 
	_test_eof164: cs = 164; goto _test_eof; 
	_test_eof266: cs = 266; goto _test_eof; 
	_test_eof165: cs = 165; goto _test_eof; 
	_test_eof166: cs = 166; goto _test_eof; 
	_test_eof167: cs = 167; goto _test_eof; 
	_test_eof168: cs = 168; goto _test_eof; 
	_test_eof169: cs = 169; goto _test_eof; 
	_test_eof170: cs = 170; goto _test_eof; 
	_test_eof171: cs = 171; goto _test_eof; 
	_test_eof172: cs = 172; goto _test_eof; 
	_test_eof173: cs = 173; goto _test_eof; 
	_test_eof174: cs = 174; goto _test_eof; 
	_test_eof175: cs = 175; goto _test_eof; 
	_test_eof176: cs = 176; goto _test_eof; 
	_test_eof177: cs = 177; goto _test_eof; 
	_test_eof178: cs = 178; goto _test_eof; 
	_test_eof179: cs = 179; goto _test_eof; 
	_test_eof180: cs = 180; goto _test_eof; 
	_test_eof181: cs = 181; goto _test_eof; 
	_test_eof182: cs = 182; goto _test_eof; 
	_test_eof183: cs = 183; goto _test_eof; 
	_test_eof184: cs = 184; goto _test_eof; 
	_test_eof185: cs = 185; goto _test_eof; 
	_test_eof186: cs = 186; goto _test_eof; 
	_test_eof187: cs = 187; goto _test_eof; 
	_test_eof188: cs = 188; goto _test_eof; 
	_test_eof189: cs = 189; goto _test_eof; 
	_test_eof190: cs = 190; goto _test_eof; 
	_test_eof191: cs = 191; goto _test_eof; 
	_test_eof192: cs = 192; goto _test_eof; 
	_test_eof193: cs = 193; goto _test_eof; 
	_test_eof194: cs = 194; goto _test_eof; 
	_test_eof195: cs = 195; goto _test_eof; 
	_test_eof196: cs = 196; goto _test_eof; 
	_test_eof197: cs = 197; goto _test_eof; 
	_test_eof198: cs = 198; goto _test_eof; 
	_test_eof199: cs = 199; goto _test_eof; 
	_test_eof200: cs = 200; goto _test_eof; 
	_test_eof201: cs = 201; goto _test_eof; 
	_test_eof202: cs = 202; goto _test_eof; 
	_test_eof203: cs = 203; goto _test_eof; 
	_test_eof204: cs = 204; goto _test_eof; 
	_test_eof205: cs = 205; goto _test_eof; 
	_test_eof206: cs = 206; goto _test_eof; 
	_test_eof207: cs = 207; goto _test_eof; 
	_test_eof208: cs = 208; goto _test_eof; 
	_test_eof209: cs = 209; goto _test_eof; 
	_test_eof267: cs = 267; goto _test_eof; 
	_test_eof268: cs = 268; goto _test_eof; 
	_test_eof210: cs = 210; goto _test_eof; 
	_test_eof211: cs = 211; goto _test_eof; 
	_test_eof212: cs = 212; goto _test_eof; 
	_test_eof213: cs = 213; goto _test_eof; 
	_test_eof214: cs = 214; goto _test_eof; 
	_test_eof215: cs = 215; goto _test_eof; 
	_test_eof216: cs = 216; goto _test_eof; 
	_test_eof217: cs = 217; goto _test_eof; 
	_test_eof218: cs = 218; goto _test_eof; 
	_test_eof219: cs = 219; goto _test_eof; 
	_test_eof220: cs = 220; goto _test_eof; 
	_test_eof221: cs = 221; goto _test_eof; 
	_test_eof222: cs = 222; goto _test_eof; 
	_test_eof223: cs = 223; goto _test_eof; 
	_test_eof224: cs = 224; goto _test_eof; 
	_test_eof225: cs = 225; goto _test_eof; 
	_test_eof226: cs = 226; goto _test_eof; 
	_test_eof227: cs = 227; goto _test_eof; 
	_test_eof228: cs = 228; goto _test_eof; 
	_test_eof269: cs = 269; goto _test_eof; 
	_test_eof229: cs = 229; goto _test_eof; 
	_test_eof230: cs = 230; goto _test_eof; 
	_test_eof231: cs = 231; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 263: 
#line 144 "MROGeometry/PathParser.rl"
	{
    [pb closePath];   
  }
	break;
	case 233: 
	case 265: 
	case 266: 
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 98 "MROGeometry/PathParser.rl"
	{
    [pb moveToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	break;
	case 235: 
	case 236: 
	case 269: 
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 103 "MROGeometry/PathParser.rl"
	{
    [pb lineToAbsolute:absolute x:argv[0] y:argv[1]];
    argc = 0;
  }
	break;
	case 243: 
	case 245: 
	case 246: 
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 108 "MROGeometry/PathParser.rl"
	{
    [pb hlineToAbsolute:absolute x:argv[0]];
    argc = 0;
  }
	break;
	case 259: 
	case 261: 
	case 262: 
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 113 "MROGeometry/PathParser.rl"
	{
    [pb vlineToAbsolute:absolute y:argv[0]];
    argc = 0;
  }
	break;
	case 239: 
	case 241: 
	case 242: 
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 118 "MROGeometry/PathParser.rl"
	{
    [pb cubicToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] x3:argv[4] y3:argv[5] ];
    argc = 0;
  }
	break;
	case 251: 
	case 253: 
	case 254: 
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 123 "MROGeometry/PathParser.rl"
	{
    [pb smoothCubicToAbsolute:absolute x2:argv[0] y2:argv[1] x3:argv[2] y3:argv[3] ];
    argc = 0;
  }
	break;
	case 247: 
	case 249: 
	case 250: 
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 128 "MROGeometry/PathParser.rl"
	{
    [pb quadToAbsolute:absolute x1:argv[0] y1:argv[1] x2:argv[2] y2:argv[3] ];
    argc = 0;
  }
	break;
	case 255: 
	case 257: 
	case 258: 
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 133 "MROGeometry/PathParser.rl"
	{
    [pb smoothQuadToAbsolute:absolute x2:argv[0] y2:argv[1] ];
    argc = 0;
  }
	break;
	case 237: 
	case 267: 
	case 268: 
#line 74 "MROGeometry/PathParser.rl"
	{
    assert(p >= start && "must be positive size");
    argv[argc++] = strltod(start, NULL, p-start);
    start = NULL;
  }
#line 138 "MROGeometry/PathParser.rl"
	{
    if(YES)
      [NSException raise:@"ragel action elliptical_arc isn't implemented yet." format:@""];
    argc = 0;
  }
	break;
#line 10063 "MROGeometry/PathParser.m"
	}
	}

	_out: {}
	}

#line 316 "MROGeometry/PathParser.rl"

  if ( errPtr != nil && cs < path_first_final )
    *errPtr = [self parseError:data position:p];
  MRLogT(@"", nil);
  return CGPathRetain([pb toPath]);
}

-(CGPathRef)newCGPathWithNSString:(NSString*)data trafo:(const CGAffineTransform*)trafo error:(NSError**)errPtr
{
    const char *c = [data UTF8String];
    return [self newCGPathWithCString:c length:strlen(c) trafo:trafo error:errPtr];
}

#pragma clang diagnostic pop

@end
