//
//  LoadMoreViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 12/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "LoadMoreViewController.h"
#import "MJRefresh.h"
@interface LoadMoreViewController ()
@property (strong, nonatomic) NSMutableArray *adArray;
@property (strong, nonatomic) UITableView *secondTableView;

@end

@implementation LoadMoreViewController

- (void)setUpTableView {
    
    // 下拉刷新
    self.secondTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    [self.secondTableView.mj_header beginRefreshing];
    
    // 上拉加载
    self.secondTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerLoadmore)];
}

-(void)headerRefresh{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    _secondTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    _secondTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
     [_secondTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _secondTableView.dataSource = self;
    _secondTableView.delegate = self;
    [self.view addSubview:_secondTableView];
    [self setUpTableView];
    // Do any additional setup after loading the view.
}

#pragma mark - TableView DataSource Implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    label.text = @"label view";
    label.textColor = [UIColor blueColor];
    [[cell contentView] addSubview:label];
    //cell.textLabel.text = @"111";
    //cell.titleLabel.text = @"aaa";
    return cell;
}
- (NSMutableArray *)adArray {
    if (!_adArray) {
        _adArray = [NSMutableArray array];
    }
    return _adArray;
}
- (void)footerLoadmore {
    AVQuery *query = [AVQuery queryWithClassName:@"AdList"];
    query.limit = 3;
    query.skip = self.adArray.count;
    [query orderByDescending:@"createdAt"];
    [query whereKey:@"adState" equalTo:@1];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //[self->secondTableView.mj_footer endRefreshing];
        if (error) {
            NSLog(@"error : %@", error.description);
        }
        else {
            [self.adArray addObjectsFromArray:objects];
            
            [self.secondTableView reloadData];
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
