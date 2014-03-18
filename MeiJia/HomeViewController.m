//
//  HomeViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "HomeViewController.h"
#import "AboutViewController.h"
#import "ServierView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    [self creatImageView];
    [self creatTableView];
    
    _discArray = [NSArray arrayWithObjects:@"服务项目1",@"服务项目2", @"服务项目3",@"服务项目4",@"服务项目5",@"服务项目6",@"服务项目7",@"服务项目8",@"服务项目9",@"服务项目10",@"服务项目11",@"服务项目12",nil];
    //设置 navigationItem 的名称
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
}

- (void)creatImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 320, 150);
    imageView.image = [UIImage imageNamed:@"u24_normal.png"];
    [self.view addSubview:imageView];
}

- (void)creatTableView
{
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(10, 155, 300, 300);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
// 选择服务按钮
- (void)action:(id)sender
{
    AboutViewController *aboutViewController = [[AboutViewController alloc] init];
    aboutViewController.title = @"美甲秀";
    [self.navigationController pushViewController:aboutViewController animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _discArray.count/3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ServierCell = @"ServierCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ServierCell];
    
    if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ServierCell];
    }
    NSUInteger row = [indexPath row];
    ServierView *servierView = [[ServierView alloc] initWithFrame:CGRectMake(0, 0, 320, 94) withRow:row andTarget:self andSelector:@selector(action:) andArray:_discArray];
    [cell.contentView addSubview:servierView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Man Nails 美甲";
}

@end
