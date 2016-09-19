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
@interface LeanCloudCloudEngineViewController (){
    UIButton *buttonA;
    UIButton *buttonB;
    UIButton *buttonC;
    UIButton *buttonD;
    UIButton *buttonE;
}

@end

@implementation LeanCloudCloudEngineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //[self functionTwo];
    //[self functionThree];
    //[self functionFive];
    [self functionFour];
    [self setUpView];
    // Do any additional setup after loading the view.
    
    
}

-(void)setUpView{
    buttonA = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
        [button setBackgroundColor:[UIColor grayColor]];
        [button setTitle:@"functionOne" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(functionOne) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    buttonB = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(buttonA.frame)+10, 100, 40)];
        [button setBackgroundColor:[UIColor grayColor]];
        [button setTitle:@"functionTwo" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(functionTwo) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    buttonC = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(buttonB.frame)+10, 100, 40)];
        [button setBackgroundColor:[UIColor grayColor]];
        [button setTitle:@"functionThree" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(functionThree) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    buttonD = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(buttonC.frame)+10, 100, 40)];
        [button setBackgroundColor:[UIColor grayColor]];
        [button setTitle:@"functionFour" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(functionFour) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [self.view addSubview:buttonA];
    [self.view addSubview:buttonB];
    [self.view addSubview:buttonC];
    [self.view addSubview:buttonD];
}

-(void)logStringfyJsonAvObject:(AVObject *)object{
    NSMutableDictionary *serializedJSONDictionary = [object dictionaryForObject];//获取序列化后的字典
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:serializedJSONDictionary options:0 error:&err];//获取 JSON 数据
    NSString *serializedString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];// 获取 JSON 字符串
    NSLog(serializedString);
}

-(void)functionOne{
    // 调用指定名称的云函数 averageStars，并且传递参数
    [AVCloud callFunctionInBackground:@"getTodo"
                       withParameters:nil
                                block:^(id object, NSError *error) {
                                    if(error == nil){
                                        for(AVObject *theObject in (NSArray *)object){
                                            //[self logStringfyJsonAvObject:theObject];
                                        }
                                    } else {
                                        NSLog(@"getTodo Error: %@", error);
                                    }
                                }];
}

-(void)functionTwo{
    [AVCloud rpcFunctionInBackground:@"rpcGetTodo"
                      withParameters:nil
                               block:^(id object, NSError *error) {
                                   if(error == nil){
                                       for(AVObject *theObject in (NSArray *)object){
                                           [self logStringfyJsonAvObject:theObject];
                                       }
                                   }
                                   else {
                                       NSLog(@"getTodo Error: %@", error);
                                   }
                               }];
}

-(void)functionThree{
    [AVCloud rpcFunctionInBackground:@"cqlInPointerSearch"
                      withParameters:nil
                               block:^(id object, NSError *error) {
                                   if(error == nil){
                                       for(AVObject *theObject in (NSArray *)object){
                                           [self logStringfyJsonAvObject:theObject];
                                       }
                                   }
                                   else {
                                       NSLog(@"getTodo Error: %@", error);
                                   }
                               }];
}

-(NSMutableDictionary *)makeAVFileDic:(AVFile *)file{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:file.objectId forKey:@"objectId"];
    [dic setObject:@"File" forKey:@"__type"];
    [dic setObject:file.name forKey:@"name"];
    [dic setObject:file.url forKey:@"url"];
    return dic;
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
        model.imageFileDic = [self makeAVFileDic:file];
        NSDictionary *dicParameters = [NSDictionary dictionaryWithObject:[model toJSONString] forKey:@"object"];
        
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
