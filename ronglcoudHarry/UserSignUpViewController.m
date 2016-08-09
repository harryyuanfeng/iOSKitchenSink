//
//  UserSignUpViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 9/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "UserSignUpViewController.h"

@interface UserSignUpViewController ()

@end
UITextField *username;
UITextField *password;
UIButton *registerBtn;
@implementation UserSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    [DBASingleton testSingleton];
    [DBASingleton beginTaskWithCallbackBlock:^(NSMutableArray *array) {
        NSLog(@"%@",array[0]);
    }];
    UILabel *usernamel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 150, 30)];
    usernamel.text = @"user name";
    [usernamel sizeToFit];
    [self.view addSubview:usernamel];
    
    UILabel *passwordl = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 150, 30)];
    passwordl.text = @"password";
    [passwordl sizeToFit];
    [self.view addSubview:passwordl];
    
    username = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    [username setBackgroundColor:[UIColor whiteColor]];
    username.textColor = [UIColor blackColor];

    password = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 200, 30)];
    [password setBackgroundColor:[UIColor whiteColor]];
    password.textColor = [UIColor blackColor];
    
    registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    [registerBtn addTarget:self action:@selector(PressSignUpBtn) forControlEvents:UIControlEventTouchDown];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registerBtn setTitle:@"Sign up" forState:UIControlStateNormal];
    [registerBtn setBackgroundColor:[UIColor whiteColor]];
    
    
    [self.view addSubview:username];
     [self.view addSubview:password];
     [self.view addSubview:registerBtn];
    // Do any additional setup after loading the view.
}
-(void)PressSignUpBtn{
    AVUser *user = [AVUser user];// 新建 AVUser 对象实例
    user.username = username.text;// 设置用户名
    user.password =  password.text;// 设置密码
    [user setObject:password.text forKey:@"actualPassword"];
    //user.actulpassword = password.text;
    //user.email = @"tom@leancloud.cn";// 设置邮箱
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"register success");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                            message:@"register success"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            //[alert release];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:error.description
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
             NSLog(@"register success %@",error.description);
            // 失败的原因可能有多种，常见的是用户名已经存在。
        }
    }];
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
