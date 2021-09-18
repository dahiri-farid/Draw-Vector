/*
 * CGPathWriter.c
 *
 * Created by Marcus Rohrmoser on 15.10.10.
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

#include "CGPathWriter.h"
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdarg.h>
#include <stdio.h>
#include <math.h>

#if !defined(MAX)
// or rather http://graphics.stanford.edu/~seander/bithacks.html#IntegerMinOrMax ?
#define MAX(A, B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a < __b ? __b : __a; }	\
		   )
#endif

#ifndef MRLogD
#define MRLogD(x, ...)
#endif

/** internal, temporary helper struct */
struct CGPathWriter_t {
	char *buffer;
	bool absolute;
	size_t allocated;
	size_t used;
	size_t increment;
};
/** internal, temporary helper struct */
typedef struct CGPathWriter_t CGPathWriter_t;

/** internal, re-allocating snprintf helper */
void CGPathWriter_snprintf(CGPathWriter_t *const t, char *fmt, ...)
{
	assert(t != NULL);
	for(;; ) {
		if( t->buffer == NULL )
			return;
		assert(t->used >= 0);
		assert(t->allocated >= t->used);
		const size_t max = t->allocated - t->used;

		// http://stackoverflow.com/questions/498705/create-a-my-printf-that-sends-data-to-both-a-sprintf-and-the-normal-printf
		va_list ap;
		va_start(ap, fmt);
		const int len = vsnprintf(t->buffer + t->used, max, fmt, ap);
		va_end(ap);
		assert(len >= 0);

		if( len >= max ) {
			assert(t->increment >= 0);
			const size_t inc = MAX(len - max + 1, t->increment);
			assert(t->allocated < INT_MAX - inc);
			// fprintf(stderr, "CGPathToCString::re-allocating %zu\n", inc);
			t->buffer = reallocf(t->buffer, t->allocated += inc);
			assert(t->allocated > t->used);
			t->buffer[t->used] = '\0';
			assert(t->buffer[t->used] == '\0');
		} else {
			t->used += len;
			return;
		}
	}
}


/** internal Helper */
void CGPathWriter_path_walker(void *info, const CGPathElement *elm)
{
	assert(info != NULL);
	CGPathWriter_t *const t = (CGPathWriter_t *)info;
	assert(t->absolute && "currently only absolute positions supported.");
	assert(t->buffer && "buffer to write to mustn't be NULL");
	switch( elm->type ) {
	case kCGPathElementMoveToPoint:
		CGPathWriter_snprintf(t, "M%f,%f", elm->points[0].x, elm->points[0].y);
		break;
	case kCGPathElementAddLineToPoint:
		CGPathWriter_snprintf(t, "L%f,%f", elm->points[0].x, elm->points[0].y);
		break;
	case kCGPathElementAddQuadCurveToPoint:
		CGPathWriter_snprintf(t, "Q%f,%f,%f,%f", elm->points[0].x, elm->points[0].y, elm->points[1].x, elm->points[1].y);
		break;
	case kCGPathElementAddCurveToPoint:
		CGPathWriter_snprintf(t, "C%f,%f,%f,%f,%f,%f", elm->points[0].x, elm->points[0].y, elm->points[1].x, elm->points[1].y, elm->points[2].x, elm->points[2].y);
		break;
	case kCGPathElementCloseSubpath:
		CGPathWriter_snprintf(t, "Z");
		break;
	default:
		fprintf(stderr, "Switch-case-fallthrough\n");
		assert(0);
		break;
	}
}


char *CGPathToCString(const CGPathRef p, const size_t capacity, const size_t increment)
{
	if( p == NULL )
		return NULL;
	CGPathWriter_t t;
	t.absolute  = true;
	t.allocated = MAX(2, capacity);
	t.increment = MAX(2, increment);
	t.buffer = malloc(t.allocated);
	if( t.buffer != NULL )
		t.buffer[0] = '\0';
	t.used = 0;

	CGPathApply(p, &t, CGPathWriter_path_walker);

	return t.buffer;
}
