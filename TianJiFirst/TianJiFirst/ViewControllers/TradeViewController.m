//
//  TradeViewController.m
//  TianJiFirst
//
//  Created by Sun on 15/11/24.
//  Copyright © 2015年 jsb. All rights reserved.
//

#import "TradeViewController.h"

@interface TradeViewController ()

@end

@implementation TradeViewController{
    UITableView *mainTableViewOfAssets;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"收益榜";
    self.view.backgroundColor = [UIColor brownColor];
    
    //标题
    [self createTableName];
    
    [self createTableView];
    // Do any additional setup after loading the view.
}
#pragma mark - TableName
-(void)createTableName{
    NSArray *nameTitle = [NSArray arrayWithObjects:@"排名",@"股票代码",@"股票简称",@"涨跌幅(%)", nil];
    for (int titleIndex = 0; titleIndex < nameTitle.count; titleIndex ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(titleIndex * VIEW_WIDTH/4, 64, VIEW_WIDTH/4, 30)];
        label.text = nameTitle[titleIndex];
//        label.textColor = [UIColor brownColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
    }
}
#pragma mark - TableView
-(void)createTableView{
    mainTableViewOfAssets = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + 30, VIEW_WIDTH, VIEW_HEIGHT) style:UITableViewStyleGrouped];
    mainTableViewOfAssets.dataSource = self;
    mainTableViewOfAssets.delegate = self;
    mainTableViewOfAssets.sectionHeaderHeight = 2;
    
    [self.view addSubview:mainTableViewOfAssets];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"assetsCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"assetsCell"];
    }
    cell.textLabel.text = @"123";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
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
