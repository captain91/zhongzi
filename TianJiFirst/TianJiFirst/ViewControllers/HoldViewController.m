//
//  HoldViewController.m
//  TianJiFirst
//
//  Created by Sun on 15/11/24.
//  Copyright © 2015年 jsb. All rights reserved.
//

#import "HoldViewController.h"
#import "AssetsTableViewCell.h"
@interface HoldViewController ()

@end

@implementation HoldViewController{
    UITableView *positionTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"持仓";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createPositionTableView];
    // Do any additional setup after loading the view.
}
#pragma mark - positionTabelView
-(void)createPositionTableView{
    positionTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT) style:UITableViewStyleGrouped];
    positionTableView.dataSource = self;
    positionTableView.delegate = self;
    positionTableView.sectionHeaderHeight = 30;
    positionTableView.sectionFooterHeight = 0;
    positionTableView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0);
    [self.view addSubview:positionTableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0)
        return 1;
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        AssetsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"assetsCell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"AssetsTableViewCell" owner:nil options:nil]firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }else{
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"positionCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"positionCell"];
        }
            return cell;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray *arrayTitle = [NSArray arrayWithObjects:@"",@"持仓状态",@"交易记录", nil];
    return arrayTitle[section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
        return 88;
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 30;
    }
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
