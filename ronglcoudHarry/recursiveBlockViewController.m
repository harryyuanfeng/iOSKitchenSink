//
//  recursiveBlockViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/22/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "recursiveBlockViewController.h"

@interface recursiveBlockViewController ()

@end
typedef void (^classRecusiveBlock)(id);
int studentClassCounter;
@implementation recursiveBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"1",@"2",@"2",@"2",@"2", nil];
    studentClassCounter = 0;
    
    classRecusiveBlock _recusiveBlock;
    _recusiveBlock = ^(classRecusiveBlock block) {
        NSLog(@"block");
        studentClassCounter++;
        if(studentClassCounter < array.count){
            block(block);
        }
    };
    
    _recusiveBlock(_recusiveBlock);
    
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
