//
// NSCoder_MROCGPath.m
//
// Created by Marcus Rohrmoser on 26.10.10.
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

#import "NSCoder_MROCGPath.h"
#import "CGPathWriter.h"
#import "PathParser.h"

// http://blog.mro.name/2010/06/xcode-missing-deprecated-warnings/
#define alloc(c) ( (c *)[c alloc] )

@implementation NSCoder(MROCGPath)


-(void)encodeCGPath:(CGPathRef)value forKey:(NSString *)key
{
	char *buf = CGPathToCString(value, 256, 256);
	if( buf == NULL )
		return;
	// MRLogD(@"Encode CGPath Buffer[%d]: '%s'", strlen(buf) + 1, buf);
	NSAssert(buf[strlen(buf)] == '\0', @"");
	[self encodeObject:[NSString stringWithCString:buf encoding:NSASCIIStringEncoding] forKey:key];
	free(buf);
}


-(CGPathRef)decodeCGPathForKey:(NSString *)key
{
	NSString *buf = [self decodeObjectForKey:key];
	// MRLogD(@"Decode CGPath Buffer[%d]: '%s'", len, buf);
	PathParser *pp = [alloc (PathParser)init];
	NSError *err = nil;
	CGPathRef p = [pp newCGPathWithNSString:buf trafo:NULL error:&err];
	// MRLogD(@"Error: %@", err);
	NSAssert(p != NULL, @"");
	NSAssert(err == nil, @"");
	return p;
}


@end
