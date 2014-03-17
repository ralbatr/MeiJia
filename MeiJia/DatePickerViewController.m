//
//  DatePickerViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-16.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"选取时间";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self creatButton];
}

- (void)creatButton
{
    UIButton *affirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
    affirmButton.frame = CGRectMake(150, 250, 60, 30);
    [affirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [affirmButton addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:affirmButton];
}

- (void)action
{
    UILabel *timeLabel = (UILabel *)[self.view viewWithTag:101];
    timeLabel.text = @"1111";
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
