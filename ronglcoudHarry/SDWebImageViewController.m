//
//  SDWebImageViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/19/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "SDWebImageViewController.h"

@interface SDWebImageViewController ()

@end

@implementation SDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [image sd_setImageWithURL:[NSURL URLWithString:@"http://www.3773.com.cn/zhongkao/UploadFiles_1401/200905/200951922245239.jpg"]];
    [self.view addSubview:image];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
