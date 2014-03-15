//
//  AboutWorkerViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "AboutWorkerViewController.h"
#import "BookDetailViewController.h"

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
	// Do any additional setup after loading the view.
    [self creatView];
    [self creatButton];
    [self creatScrollView];
    [self initTableViewAndSegment];
    _tableView.hidden = YES;
    _timeSegment.hidden = YES;
    _bookArray = [NSArray arrayWithObjects:@"套餐类别", @"套餐类别", @"套餐类别", @"套餐类别", nil];
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (void)initTableViewAndSegment
{
    _timeSegment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"今天",@"明天",@"后天", nil]];
    _timeSegment.frame = CGRectMake(10, 200, 300, 35);
    _timeSegment.selectedSegmentIndex = 0;
    [self.view addSubview:_timeSegment];
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 240, 320, 280);
    [self.view addSubview:_tableView];
}

- (void)creatView
{
    UIImageView *headimageView = [[UIImageView alloc] init];
    headimageView.frame = CGRectMake(5, 65, 70, 87);
    headimageView.image = [UIImage imageNamed:@"u11_normal.png"];
    [self.view addSubview:headimageView];
    
    UILabel *jobIDlabel = [[UILabel alloc] init];
    jobIDlabel.frame = CGRectMake(80, 60, 200, 40);
    jobIDlabel.text = @"工 号：NS 89987654";
    [self.view addSubview:jobIDlabel];
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.frame = CGRectMake(80, 85, 200, 40);
    namelabel.text = @"姓名：莉莉";
    [self.view addSubview:namelabel];
    
    _workYearlabel = [[UILabel alloc] init];
    _workYearlabel.frame = CGRectMake(190, 85, 200, 40);
    _workYearlabel.text = @"工作年限：5年";
    _workYearlabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_workYearlabel];
}

- (void)creatButton
{
    UIButton *busyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    busyButton.frame = CGRectMake(80, 110, 100, 40);
    [busyButton setTitle:@"忙碌" forState:UIControlStateNormal];
    busyButton.enabled = NO;
    [self.view addSubview:busyButton];
    
    UIButton *bookButton = [UIButton buttonWithType:UIButtonTypeSystem];
    bookButton.frame = CGRectMake(180, 110, 100, 40);
    [bookButton setTitle:@"预约" forState:UIControlStateNormal];
    [bookButton addTarget:self action:@selector(book) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bookButton];
    
    NSArray *array = @[@"可预约服务",@"预约列表"];
    _segmented = [[UISegmentedControl alloc] initWithItems:array];
    _segmented.selectedSegmentIndex = 0;
    _segmented.frame = CGRectMake(10, 150, 300, 40);
    [_segmented addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmented];
}

- (void)creatScrollView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(10, 200, 300, 330);
//    _scrollView.backgroundColor = [UIColor redColor]; 
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    CGSize newSize = CGSizeMake(300, self.view.frame.size.height*2);
    [_scrollView setContentSize:newSize];
    [self.view addSubview:_scrollView];
    [self creatButtons];
}
//- (void)

- (void)book
{
    BookDetailViewController *bookDetailViewController = [[BookDetailViewController alloc] init];
    bookDetailViewController.title = @"技师介绍";
    [self.navigationController pushViewController:bookDetailViewController animated:YES];
}

- (void)action:(id)sender
{
    UISegmentedControl *segmented = (UISegmentedControl *)sender;
    if (segmented.selectedSegmentIndex == 0) {
        _workYearlabel.hidden = NO;
        [_segmented setTitle:@"可预约服务" forSegmentAtIndex:0];
        _tableView.hidden = YES;
        _timeSegment.hidden = YES;
        _label.hidden = NO;
    }
    else{
        _workYearlabel.hidden = YES;
        _label.hidden = YES;
        _tableView.hidden = NO;
        _timeSegment.hidden = NO;
        [_segmented setTitle:@"作品" forSegmentAtIndex:0];
    }
}

- (void)creatButtons
{
    _label = [[UILabel alloc] init];
    _label.frame = CGRectMake(0, 50, 150, 40);
    _label.text = @"Man Nails 美甲";
    [self.segmented addSubview:_label];
    for (int i = 0; i < 12; i++) {
        CGRect frame = CGRectMake((97*(i%3)+10), 95*(i/3)+38, 87, 98);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        if (i%3 == 0) {
            [button setImage:[UIImage imageNamed:@"u29_normal.png"] forState:UIControlStateNormal];
        }
        else
        {
            [button setImage:[UIImage imageNamed:@"u31_normal.png"] forState:UIControlStateNormal];
        }
        button.tag = i;
//        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
    }
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_bookArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
