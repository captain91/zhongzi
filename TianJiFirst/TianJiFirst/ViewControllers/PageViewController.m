//
//  PageViewController.m
//  TianJiFirst
//
//  Created by Sun on 15/11/27.
//  Copyright © 2015年 jsb. All rights reserved.
//

#import "PageViewController.h"
#import "IncomeTableViewCell.h"
#import "OperationTableViewCell.h"
@interface PageViewController ()

@end

@implementation PageViewController{
    UITableView *mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建收益图
//    [self createIncomeStatement];
    
    //分组的tableview
    [self createTableView];
    // Do any additional setup after loading the view.
}
-(void)createIncomeStatement{
    UIView *tableOfIncomeView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_WIDTH*0.25)];
    tableOfIncomeView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:tableOfIncomeView];
}

#pragma mark - TableView
-(void)createTableView{
    mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT) style:UITableViewStyleGrouped];
    
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
    mainTableView.sectionHeaderHeight = 30;
    mainTableView.sectionFooterHeight = 0;
    [self.view addSubview:mainTableView];
    
}

//协议方法tableview

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 1;
    }else{
        return 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 160;
    }else if(indexPath.section == 1){
        return 150;
    }else{
        return 40;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        IncomeTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"incomeCell"];
        if (firstCell == nil) {
            firstCell = [[[NSBundle mainBundle]loadNibNamed:@"IncomeTableViewCell" owner:nil options:nil]firstObject];
            firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return firstCell;
        
        
    }else if (indexPath.section == 1){
        OperationTableViewCell *operationCell = [tableView dequeueReusableCellWithIdentifier:@"OperationCell"];
        if (operationCell == nil) {
            operationCell = [[[NSBundle mainBundle]loadNibNamed:@"OperationTableViewCell" owner:nil options:nil]firstObject];
            operationCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return operationCell;
    }else{
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pageCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pageCell"];
        }
        cell.textLabel.text = @"Nothing";
        return cell;
    }
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray *sectionTitleArray = [NSArray arrayWithObjects:@"资产收益表",@"今日操作",@"题材挖掘", nil];
    return sectionTitleArray[section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
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
