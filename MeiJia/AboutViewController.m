//
//  AboutViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "AboutViewController.h"
#import "BookDetailViewController.h"
#import "ArtificerView.h"

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
    imageView.frame = CGRectMake(5, 65, 320, 320);
    imageView.image = [UIImage imageNamed:@"u9_normal.png"];
    [self.view addSubview:imageView];
    
//    ArtificerView *artificerView = [[ArtificerView alloc] initWithFrame:CGRectMake(5, 390, 320, 320) WithTarget:self andSelector:@selector(book) andHideWorkYear:YES];
//    [self.view addSubview:artificerView];
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
