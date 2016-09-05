//
//  LeanCloudCloudEngineViewController.m
//  iosKitchenSink
//
//  Created by harryfeng on 16/9/1.
//  Copyright © 2016年 harryfeng. All rights reserved.
//

#import "LeanCloudCloudEngineViewController.h"
#import "TodoModel.h"
#import "JSONModelLib.h"
@interface LeanCloudCloudEngineViewController ()

@end

@implementation LeanCloudCloudEngineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //[self functionTwo];
    //[self functionThree];
    //[self functionFive];
    [self functionFour];
    // Do any additional setup after loading the view.
    
    
}


-(void)functionOne{
    NSDictionary *dicParameters = [NSDictionary dictionaryWithObject:@"夏洛特烦恼"
                                                              forKey:@"movie"];
    
    // 调用指定名称的云函数 averageStars，并且传递参数
    [AVCloud callFunctionInBackground:@"getTodo"
                       withParameters:dicParameters
                                block:^(id object, NSError *error) {
                                    if(error == nil){
                                        for(AVObject *theObject in (NSArray *)object){
                                            //AVObject *theObject = (AVObject *)object[0];
                                            NSLog([theObject objectForKey:@"name"]);
                                            AVFile *file = [theObject objectForKey:@"headerImage"];
                                            NSNumber *count = [theObject objectForKey:@"count"];
                                            NSArray *tags = [theObject objectForKey:@"tags"];
                                            AVObject *category = [theObject objectForKey:@"category"];
                                            NSString *cagegoryName = [category objectForKey:@"name"];
                                            NSLog(cagegoryName);
                                        }
                                                                            } else {
                                        NSLog(@"getTodo Error: %@", error);
                                    }
                                }];
}

-(void)functionTwo{
    NSDictionary *dicParameters = [NSDictionary dictionaryWithObject:@"夏洛特烦恼"
                                                              forKey:@"movie"];
    
    [AVCloud rpcFunctionInBackground:@"rpcGetTodo"
                      withParameters:dicParameters
                               block:^(id object, NSError *error) {
                                   if(error == nil){
                                       for(AVObject *theObject in (NSArray *)object){
                                           //AVObject *theObject = (AVObject *)object[0];
                                           NSLog([theObject objectForKey:@"name"]);
                                           AVFile *file = [theObject objectForKey:@"headerImage"];
                                           NSNumber *count = [theObject objectForKey:@"count"];
                                           NSArray *tags = [theObject objectForKey:@"tags"];
                                           NSDate *createdAt = theObject.createdAt;
                                           NSDate *date = [theObject objectForKey:@"date"];
                                           AVObject *category = [theObject objectForKey:@"category"];
                                           NSString *cagegoryName = [category objectForKey:@"name"];
                                           NSLog(cagegoryName);
                                       }
                                   }
                                   else {
                                       NSLog(@"getTodo Error: %@", error);
                                   }
                               }];
}

-(void)functionThree{
    NSDictionary *dicParameters = [NSDictionary dictionaryWithObject:@"夏洛特烦恼"
                                                              forKey:@"movie"];
    
    [AVCloud rpcFunctionInBackground:@"cqlInPointerSearch"
                      withParameters:dicParameters
                               block:^(id object, NSError *error) {
                                   if(error == nil){
                                       for(AVObject *theObject in (NSArray *)object){
                                           AVObject *category = [theObject objectForKey:@"category"];
                                           NSString *cagegoryName = [category objectForKey:@"name"];
                                           NSLog(cagegoryName);
                                       }
                                   }
                                   else {
                                       NSLog(@"getTodo Error: %@", error);
                                   }
                               }];
}

-(void)functionFour{
    TodoModel *model = [[TodoModel alloc] init];
    model.name = @"harryfengTodoModel";
    //UIImage *image = [UIImage]
    UIImage *image = [UIImage imageNamed:@"loginLogo512"];
    NSData *imageData = UIImageJPEGRepresentation(image,0.1);
    AVFile *file = [AVFile fileWithData:imageData];
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        //model.imageFileString = [fil];
        model.imageFileId = file.objectId;
        NSString *lastname = [model getLastName];
        NSString *lName = model.getLastName;
        NSDictionary *dicParameters = [NSDictionary dictionaryWithObject:[model toJSONString]
                                                                  forKey:@"object"];
        
        [AVCloud rpcFunctionInBackground:@"saveModel"
                          withParameters:dicParameters
                                   block:^(id object, NSError *error) {
                                       if(error == nil){
                                           
                                       }
                                       else {
                                           NSLog(@"getTodo Error: %@", error);
                                       }
                                   }];
    }];
    
}

-(void)functionFive{
    AVQuery *query = [AVQuery queryWithClassName:@"Todo"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSArray<AVObject *> *todos = objects;
        NSDictionary *name = [todos[0] objectForKey:@"harryObject"];
        NSLog([name objectForKey:@"gender"]);
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
