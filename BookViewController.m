//
//  BookViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "BookViewController.h"
#import "AboutWorkerViewController.h"

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
    self.title = @"美甲技师";
    [super viewDidLoad];
    [self creatScrollView];
    [self creatButton];
}

- (void)creatScrollView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 45, 320, 508);
    //    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    CGSize newSize = CGSizeMake(320, self.view.frame.size.height*2);
    [_scrollView setContentSize:newSize];
    [self.view addSubview:_scrollView];
}

- (void)creatButton
{
    NSArray *discArray = [NSArray arrayWithObjects:@"工号： NS8766732",@"工号： NS8766732", @"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",@"工号： NS8766732",nil];
    for (int i = 0; i < 9; i++) {
        CGRect frame = CGRectMake((150*(i%2)+20), 188*(i/2), 140, 182);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        [button setImage:[UIImage imageNamed:@"u80_normal.png"] forState:UIControlStateNormal];
        
        button.tag = i;
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        
        CGRect labelFrame = CGRectMake(frame.origin.x+0, frame.origin.y+160, 140, 30);
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        label.backgroundColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:14];
        label.text = discArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        [self.scrollView addSubview:label];
    }
}

- (void)action:(id)sender
{
    AboutWorkerViewController *aboutWorkerViewController = [[AboutWorkerViewController alloc] init];
    aboutWorkerViewController.title = @"技师介绍";
    [self.navigationController pushViewController:aboutWorkerViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
