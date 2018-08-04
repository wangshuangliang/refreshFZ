//
//  ViewController.m
//  TestObject
//
//  Created by wsl 王 on 2018/7/30.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+WSLScrollView.h"
#import "ModelBase.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,WSLScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

    self.tableView.wSLScrollViewDelegate = self;
    [self.tableView beginRefreshWithNeedLoadMore:YES];

}

//下拉刷新代理方法
//设置访问路径及其他辅助项（数据解析的data）
- (NSDictionary *)getRequestParaSet:(UIScrollView *)scrollView refreshType:(RefreshType)refreshType
{
    return @{@"URL":@"baidu",@"page":@(scrollView.curPage)};
}
//设置model类型
- (NSString *)getModelClass:(UIScrollView *)scrollView
{
    return @"ModelBase";
}

//tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableView.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    ModelBase * model = tableView.dataArr[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
