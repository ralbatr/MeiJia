//
//  AboutWorkerViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "AboutWorkerViewController.h"
#import "BookDetailViewController.h"
#import "ArtificerView.h"
#import "ProductView.h"

@interface AboutWorkerViewController ()

@end

@implementation AboutWorkerViewController

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
    _bookArray = [NSArray arrayWithObjects:@"套餐类别", @"套餐类别", @"套餐类别", @"套餐类别", nil];
	// 美甲师 简单介绍
    [self creatView];
    // 产品 和 预约列表 两个按钮
    [self creatUISegmentedControl];
    [self initTableViewAndSegment];
    _timeSegment.hidden = YES;
}

- (void)initTableViewAndSegment
{
    _timeSegment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"今天",@"明天",@"后天", nil]];
    _timeSegment.frame = CGRectMake(10, 200, 300, 35);
    _timeSegment.selectedSegmentIndex = 0;
    [self.view addSubview:_timeSegment];
    
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 200, 320, 280);
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)creatView
{
    //技师个人介绍
    ArtificerView *artificerView = [[ArtificerView alloc] initWithFrame:CGRectMake(5, 65, 70, 87) WithTarget:self andSelector:@selector(bookArtificer) andHideWorkYear:YES];
    [self.view addSubview:artificerView];
    
    _workYearlabel = [[UILabel alloc] init];
    _workYearlabel.frame = CGRectMake(190, 90, 200, 40);
    _workYearlabel.text = @"工作年限：5年";
    _workYearlabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_workYearlabel];
}

- (void)creatUISegmentedControl
{    
    NSArray *array = @[@"可预约服务",@"预约列表"];
    _segmented = [[UISegmentedControl alloc] initWithItems:array];
    _segmented.selectedSegmentIndex = 0;
    _segmented.frame = CGRectMake(10, 150, 300, 40);
    [_segmented addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmented];
}

- (void)bookArtificer
{
    BookDetailViewController *bookDetailViewController = [[BookDetailViewController alloc] init];
    bookDetailViewController.title = @"预约单";
    [self.navigationController pushViewController:bookDetailViewController animated:YES];
}

- (void)action:(id)sender
{
    UISegmentedControl *segmented = (UISegmentedControl *)sender;
    if (segmented.selectedSegmentIndex == 0) {
        _workYearlabel.hidden = NO;
        [_segmented setTitle:@"可预约服务" forSegmentAtIndex:0];
        _timeSegment.hidden = YES;
        _tableView.frame = CGRectMake(0, 200, 320, 280);
    }
    else{
        _workYearlabel.hidden = YES;
        _timeSegment.hidden = NO;
        [_segmented setTitle:@"作品" forSegmentAtIndex:0];
        _tableView.frame = CGRectMake(0, 240, 320, 280);
    }
    [_tableView reloadData];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_bookArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_segmented.selectedSegmentIndex == 0) {
        static NSString *ProductCell = @"ProductCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductCell];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ProductCell];
        }
        NSUInteger row = [indexPath row];
        ProductView *productView = [[ProductView alloc] initWithFrame:CGRectMake(0, 0, 320, 98) atRow:row];
        [cell.contentView addSubview:productView];
        return cell;
    }
    else
    {
        static NSString *BookCell = @"BookCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BookCell];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BookCell];
        }
        NSUInteger row = [indexPath row];
        cell.textLabel.text = [_bookArray objectAtIndex:row];
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (_segmented.selectedSegmentIndex == 0) {
        return @"Man Nails 美甲";
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_segmented.selectedSegmentIndex == 0) {
        return 150.0;
    }
    return 40.0;
}

@end
