//
//  Created by Roland Persson on 2021-11-30.
//

#import <Foundation/Foundation.h>

@interface fastmath : NSObject
@property (copy, readonly, nonatomic) NSString *version;
@end

float fastmath_sinf(float x);
