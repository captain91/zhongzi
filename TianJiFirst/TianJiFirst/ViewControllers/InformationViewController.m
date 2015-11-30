//
//  InformationViewController.m
//  TianJiFirst
//
//  Created by Sun on 15/11/24.
//  Copyright © 2015年 jsb. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController{
    UITableView *mainTableViewOfNews;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.title = @"独家内参";
    
    //推出消息
//    [self setRightBarButton];
    
    //创建tableView
    [self createTableView];
    // Do any additional setup after loading the view.
}
#pragma mark - TableView
-(void)createTableView{
    mainTableViewOfNews = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT) style:UITableViewStyleGrouped];
    mainTableViewOfNews.dataSource = self;
    mainTableViewOfNews.delegate = self;
    
    mainTableViewOfNews.sectionFooterHeight = 0;
    mainTableViewOfNews.sectionHeaderHeight = 30;
    
    [self.view addSubview:mainTableViewOfNews];
}

//协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
    }
    cell.textLabel.text = @"头条新闻";
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray *newsSectionTitleArray = [NSArray arrayWithObjects:@"中资观点",@"体彩风向标",@"政策解读", nil];
    return newsSectionTitleArray[section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}




-(void)setRightBarButton{
    UIButton *inforButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 44)];
    [inforButton setTitle:@"消息" forState:UIControlStateNormal];
    [inforButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [inforButton addTarget:self action:@selector(pushInformation) forControlEvents:UIControlEventTouchUpInside];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"消息" style:UIBarButtonItemStyleDone target:self action:@selector(pushInformation)];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc]initWithCustomView:inforButton];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = -20;
    
    self.navigationItem.rightBarButtonItems =[NSArray arrayWithObjects:btn_right,space, nil];
}
-(void)pushInformation{
    
    MessageViewController *messageVc = [MessageViewController new];
    [self.navigationController pushViewController:messageVc animated:YES];
    
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
