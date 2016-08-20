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
    [roundButton.layer setCornerRadiusScale:50];
    [self.view addSubview:roundButton];
}
@end
