//
//  extendCornerRadiusViewController.m
//  iosKitchenSink
//
//  Created by harryfeng on 16/8/20.
//  Copyright © 2016年 harryfeng. All rights reserved.
//

#import "extendCornerRadiusViewController.h"
#import "CALayer+extendCornerRadius.h"
@implementation extendCornerRadiusViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *roundButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [roundButton setBackgroundColor:[UIColor blueColor]];
    // 你可以用这个来定义corner radius
    //[roundButton.layer setCornerRadiusScale:50];
    // 或者这种来定也corner radius 也可以
    roundButton.layer.cornerRadiusPScale = 50;
    [self.view addSubview:roundButton];
}
@end
