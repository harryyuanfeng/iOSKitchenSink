//
//  CALayer+extendCornerRadius.m
//  iosKitchenSink
//
//  Created by harryfeng on 16/8/20.
//  Copyright © 2016年 harryfeng. All rights reserved.
//

#import "CALayer+extendCornerRadius.h"

@implementation CALayer (extendCornerRadius)
-(void)setCornerRadiusScale:(CGFloat)cornerRadius{
    [self setCornerRadius:cornerRadius*2];  
}
@end
