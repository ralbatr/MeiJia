//
//  HomeViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "HomeViewController.h"
#import "AboutViewController.h"

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
	// Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 65, 320, 150);
    imageView.image = [UIImage imageNamed:@"u24_normal.png"];
    [self.view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 205, 220, 40);
    label.text = @"Man Nails 美甲";
    label.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:label];
    
    [self creatScrollView];
    
    //add buttons
    [self creatButtons];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _discArray = [NSArray arrayWithObjects:@"服务项目1",@"服务项目2", @"服务项目3",@"服务项目4",@"服务项目5",@"服务项目6",@"服务项目7",@"服务项目8",@"服务项目9",@"服务项目10",@"服务项目11",@"服务项目12",nil];
}

- (void)creatScrollView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(10, 230, 300, 330);
//    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    CGSize newSize = CGSizeMake(300, self.view.frame.size.height*2);
    [_scrollView setContentSize:newSize];
    [self.view addSubview:_scrollView];
}

- (void)creatButtons
{
    
    for (int i = 0; i < 12; i++) {
        CGRect frame = CGRectMake((97*(i%3)+10), 95*(i/3)+0, 87, 98);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        if (i%3 == 0) {
            [button setImage:[UIImage imageNamed:@"u29_normal.png"] forState:UIControlStateNormal];
        }
        else if(i%3 == 1)
        {
            [button setImage:[UIImage imageNamed:@"u31_normal.png"] forState:UIControlStateNormal];
        }
        else
        {
            [button setImage:[UIImage imageNamed:@"u37_normal.png"] forState:UIControlStateNormal];
        }
        button.tag = i;
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        
        CGRect labelFrame = CGRectMake(frame.origin.x+5, frame.origin.y+40, frame.size.width, frame.size.height);
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        label.font = [UIFont systemFontOfSize:14];
        label.text = _discArray[i];
        [self.scrollView addSubview:label];
    }
}

- (void)action:(id)sender
{
    AboutViewController *aboutViewController = [[AboutViewController alloc] init];
    aboutViewController.title = @"美甲秀";
    [self.navigationController pushViewController:aboutViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
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
 */

@end
