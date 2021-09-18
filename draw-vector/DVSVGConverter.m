//
//  DVSVGConverter.m
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

#import "DVSVGConverter.h"

#import "CGPathWriter.h"


NS_ASSUME_NONNULL_BEGIN


@implementation DVSVGConverter

+ (nullable NSString *)SVGStringFromPath:(CGPathRef)pathRef size:(CGSize)size {
    
    char* charString = CGPathToCString(pathRef, size.width, size.height);
    return [[NSString alloc] initWithCString:charString encoding:NSUTF8StringEncoding];
}

@end


NS_ASSUME_NONNULL_END
