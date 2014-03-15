//
//  BookViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "BookViewController.h"
#import "AboutWorkerViewController.h"
#import "ArtificerListView.h"

@interface BookViewController ()

@end

@implementation BookViewController

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
    _discArray = [NSArray arrayWithObjects:@"工号： NS8766732",@"工号： NS8766732", @"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",nil];
    [self creatTableView];
}

- (void)creatTableView
{
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 0, 320, 508);
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)action:(id)sender
{
    AboutWorkerViewController *aboutWorkerViewController = [[AboutWorkerViewController alloc] init];
    aboutWorkerViewController.title = @"技师介绍";
    [self.navigationController pushViewController:aboutWorkerViewController animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _discArray.count/2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *atificerListCell = @"AtificerListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:atificerListCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:atificerListCell];
    }
    
    NSUInteger row = [indexPath row];
    ArtificerListView *atificerListView = [[ArtificerListView alloc] initWithFrame:CGRectMake(0, 0, 320, 195) atRow:row andTarget:self andSelector:@selector(action:) andArray:_discArray];
    [cell.contentView addSubview:atificerListView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 182.0;
}


@end
