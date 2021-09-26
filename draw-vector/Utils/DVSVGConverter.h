//
//  DVSVGConverter.h
//  draw-vector
//
//  Created by Farid Dahiri on 19.09.2021.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


NS_ASSUME_NONNULL_BEGIN


@interface DVSVGConverter : NSObject

+ (nullable NSString *)SVGStringFromPath:(CGPathRef)pathRef size:(CGSize)size;

@end


NS_ASSUME_NONNULL_END
