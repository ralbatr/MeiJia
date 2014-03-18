//
//  BaseNavigationController.m
//  Weibo
//
//  Created by Ralbatr on 13-10-7.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

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
    UIImage *image = [UIImage imageNamed:@"navigationbar_background"];
    //设置navigationV=Bar背景
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}


@end
