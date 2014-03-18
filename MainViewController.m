//
//  MainViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-18.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "ServerViewController.h"
#import "BookViewController.h"
#import "BaseNavigationController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [self _initViewController];
    [self _initTabbarView];
}

//初始化字控制器
- (void)_initViewController
{
    HomeViewController *homeViewController = [[HomeViewController alloc]init];
    [homeViewController setTitle:@"美甲秀"];
    BookViewController *bookViewController = [[BookViewController alloc] init];
    ServerViewController *serverViewController = [[ServerViewController alloc] init];
    
    NSArray *views = @[homeViewController,bookViewController,serverViewController];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:3];
    for (UIViewController *viewController in views) {
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:viewController];
        [viewControllers addObject:nav];
    }
    //添加到 tarbar
    self.viewControllers = viewControllers;
}

// 自定义tarbar
- (void)_initTabbarView
{
    _tabbarView = [[UIView alloc] init];
    _tabbarView.frame = CGRectMake(0, ScreenHeight - 69, 320, 49);
    [self.view addSubview:_tabbarView];
    NSArray *backgroud = @[@"tabbar_home.png",@"tabbar_message_center.png",@"tabbar_more.png"];
    NSArray *heightBackground = @[@"tabbar_home_highlighted.png",@"tabbar_message_center_highlighted.png",@"tabbar_more_highlighted.png"];
    
    for (int i = 0; i < backgroud.count; i++) {
        NSString *backImage = backgroud[i];
        NSString *hightImage = heightBackground[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        ThemeButton *button = [[ThemeButton alloc] initWithImage:
//        backImage highlightedImage:hightImage];
//        UIButton *button = [UIFactory creatButton:backImage highted:hightImage];
        button.frame = CGRectMake((107-30)/2+(i*107), (69-30)/2, 30, 30);
        button.tag = i;
        [button setImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
    }
}

- (void)selectTab:(UIButton *)button
{
    self.selectedIndex = button.tag;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
