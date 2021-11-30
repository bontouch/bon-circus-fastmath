//
//  fastmath.m
//  fastmath
//
//  Created by Roland Persson on 2021-11-30.
//

#import "bon_fastmath.h"

@implementation fastmath

- (NSString *)version {
    return @"1.0.1";
}

@end

float fastmath_sinf(float x) {
    return sinf(x);
}
