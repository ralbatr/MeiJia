//
//  ServerViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "ServerViewController.h"
#import "BookResultView.h"

@interface ServerViewController ()

@end

@implementation ServerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatLabels];
    [self creatButtons];
    [self creatTableView];
}

- (void)creatLabels
{
    UILabel *userIDlabel = [[UILabel alloc] init];
    userIDlabel.frame = CGRectMake(10, 0, 188, 30);
    userIDlabel.text = @"会员卡号：NS54366891";
    userIDlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:userIDlabel];
    
    UILabel *userNamelabel = [[UILabel alloc] init];
    userNamelabel.frame = CGRectMake(10, 30, 188, 30);
    userNamelabel.text = @"会员姓名：莉莉丝";
    userNamelabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:userNamelabel];
}

- (void)creatButtons
{
    UIButton *secretChangeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    secretChangeButton.frame = CGRectMake(180, 15, 88, 60);
    [secretChangeButton setTitle:@"修改密码" forState:UIControlStateNormal];
    [self.view addSubview:secretChangeButton];
}

- (void)creatTableView
{
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(10, 55, 300, 300);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ServierCell = @"ServierCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ServierCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ServierCell];
    }
    NSUInteger row = [indexPath row];
    BookResultView *book = [[BookResultView alloc]initWithFrame:CGRectMake(0, 0 , 300, 120) andTarget:self andSEL:@selector(bookButtonAction:) andTitle:@"取消" andTag:row];
//    book.backgroundColor = [UIColor greenColor];
    [cell.contentView addSubview:book];
    
    return cell;
}

- (void)bookButtonAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSLog(@"bookButtonAction %d",button.tag);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"我的预约";
}

@end
