//
//  CALayer+extendCornerRadius.h
//  iosKitchenSink
//
//  Created by harryfeng on 16/8/20.
//  Copyright © 2016年 harryfeng. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
@interface CALayer (extendCornerRadius)
@property CGFloat cornerRadiusPScale;
-(void)setCornerRadiusScale:(CGFloat)cornerRadius;
@end
