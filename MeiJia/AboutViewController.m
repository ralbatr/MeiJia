//
//  AboutViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "AboutViewController.h"
#import "BookDetailViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
	UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 65, 320, 320);
    imageView.image = [UIImage imageNamed:@"u9_normal.png"];
    [self.view addSubview:imageView];
    
    UIImageView *headimageView = [[UIImageView alloc] init];
    headimageView.frame = CGRectMake(5, 390, 70, 87);
    headimageView.image = [UIImage imageNamed:@"u11_normal.png"];
    [self.view addSubview:headimageView];
    
    UILabel *jobIDlabel = [[UILabel alloc] init];
    jobIDlabel.frame = CGRectMake(80, 380, 200, 40);
    jobIDlabel.text = @"工 号：NS 89987654";
    [self.view addSubview:jobIDlabel];
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.frame = CGRectMake(80, 405, 200, 40);
    namelabel.text = @"姓名：莉莉";
    [self.view addSubview:namelabel];
    
    UILabel *workYearlabel = [[UILabel alloc] init];
    workYearlabel.frame = CGRectMake(190, 405, 200, 40);
    workYearlabel.text = @"工作年限：5年";
    workYearlabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:workYearlabel];
    
    UIButton *busyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    busyButton.frame = CGRectMake(80, 440, 100, 40);
    [busyButton setTitle:@"忙碌" forState:UIControlStateNormal];
    busyButton.enabled = NO;
    [self.view addSubview:busyButton];
    
    UIButton *bookButton = [UIButton buttonWithType:UIButtonTypeSystem];
    bookButton.frame = CGRectMake(180, 440, 100, 40);
    [bookButton setTitle:@"预约" forState:UIControlStateNormal];
    [bookButton addTarget:self action:@selector(book) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bookButton];    
}

- (void)book
{
    BookDetailViewController *bookDetailViewController = [[BookDetailViewController alloc] init];
    bookDetailViewController.title = @"预约单";
    [self.navigationController pushViewController:bookDetailViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
