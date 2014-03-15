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

#define kImageCount 10
@interface AboutViewController ()
{
    UIPageControl *_pageControl;
}
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
    
    [self creatScrollView];
    
    for (int i = 0; i< kImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        // 1.设置frame
        imageView.frame = CGRectMake(0 + i*320 , 0, 320, 310);
        
        // 2.设置图片
        imageView.image = [UIImage imageNamed:@"u9_normal.png"];
        
        [_scrollView addSubview:imageView];
    }
    
    ArtificerView *artificerView = [[ArtificerView alloc] initWithFrame:CGRectMake(5, 390, 320, 320) WithTarget:self andSelector:@selector(book) andHideWorkYear:NO];
    [self.view addSubview:artificerView];
}

- (void)creatScrollView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, 320, 310);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.delegate = self;
    CGSize newSize = CGSizeMake(320*kImageCount, 0);
    [_scrollView setContentSize:newSize];
    [self.view addSubview:_scrollView];
    
    // 添加PageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(320 * 0.5, 310 - 20);
    pageControl.bounds = CGRectMake(0, 0, 320, 310);
    pageControl.numberOfPages = kImageCount; // 一共显示多少个圆点（多少页）
    // 设置非选中页的圆点颜色
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    // 设置选中页的圆点颜色
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    // 禁止默认的点击功能
    pageControl.enabled = NO;
    
    [self.view addSubview:pageControl];
    _pageControl = pageControl;
}

#pragma mark - UIScrollView的代理方法
#pragma mark 当scrollView正在滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    //    NSLog(@"%d", page);
    
    // 设置页码
    _pageControl.currentPage = page;
}

- (void)book
{
    BookDetailViewController *bookDetailViewController = [[BookDetailViewController alloc] init];
    bookDetailViewController.title = @"预约单";
    [self.navigationController pushViewController:bookDetailViewController animated:YES];
}

@end
