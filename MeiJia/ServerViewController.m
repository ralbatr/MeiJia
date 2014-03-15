//
//  ServerViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "ServerViewController.h"
#import "bookResultView.h"

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
    [self creatScrollView];
    CGRect frame = CGRectMake(0, 0, 300, 80);
    for (int i = 0; i < 2; i++) {
        CGRect newFrame = CGRectMake(0, frame.origin.y + 80 *i, 300, 80);
        [self addBookResult:newFrame];
    }
    
}

- (void)creatLabels
{
    UILabel *userIDlabel = [[UILabel alloc] init];
    userIDlabel.frame = CGRectMake(10, 65, 188, 30);
    userIDlabel.text = @"会员卡号：NS54366891";
    userIDlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:userIDlabel];
    
    UILabel *userNamelabel = [[UILabel alloc] init];
    userNamelabel.frame = CGRectMake(10, 95, 188, 30);
    userNamelabel.text = @"会员姓名：莉莉丝";
    userNamelabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:userNamelabel];
}

- (void)creatButtons
{
    UIButton *secretChangeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    secretChangeButton.frame = CGRectMake(180, 65, 88, 60);
    [secretChangeButton setTitle:@"修改密码" forState:UIControlStateNormal];
    [self.view addSubview:secretChangeButton];
}

- (void)creatScrollView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(10, 130, 300, 380);
//    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    CGSize newSize = CGSizeMake(300, self.view.frame.size.height*2);
    [_scrollView setContentSize:newSize];
    [self.view addSubview:_scrollView];
}

- (void)addBookResult:(CGRect)frame
{
    bookResultView *book = [[bookResultView alloc]initWithFrame:frame];
//    book.frame = frame;
    [_scrollView addSubview:book];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
