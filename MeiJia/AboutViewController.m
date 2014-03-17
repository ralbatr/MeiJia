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

#define kImageCount 3
#define kImageHeigh 380
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
    //作品的滚动展示图片
    [self setImageView];
    //美甲师的简介
    ArtificerView *artificerView = [[ArtificerView alloc] initWithFrame:CGRectMake(5, 390, 320, 320) WithTarget:self andSelector:@selector(book) andHideWorkYear:NO];
    [self.view addSubview:artificerView];
}

- (void)setImageView
{
    for (int i = 0; i< kImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        // 1.设置frame
        imageView.frame = CGRectMake(0 + i*320 , 0, 320, kImageHeigh);
        // 2.设置图片
        imageView.image = [UIImage imageNamed:@"u9_normal.png"];
        [_scrollView addSubview:imageView];
    }
}

- (void)creatScrollView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, 320, kImageHeigh);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.delegate = self;
    CGSize newSize = CGSizeMake(320*kImageCount, 0);
    [_scrollView setContentSize:newSize];
    [self.view addSubview:_scrollView];
    //图片滚动的小点
    // 添加PageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(320 * 0.5, kImageHeigh - 20);
    pageControl.bounds = CGRectMake(0, 0, 320, kImageHeigh);
    pageControl.numberOfPages = kImageCount; // 一共显示多少个圆点
    // 设置非选中页的圆点颜色
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    // 设置选中页的圆点颜色
    pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    // 禁止默认的点击功能
    pageControl.enabled = NO;
    [self.view addSubview:pageControl];
    _pageControl = pageControl;
}
#pragma mark -图片滚动的小点
//- (void)creatPageControl
//{
//    
//}

#pragma mark - UIScrollView的代理方法
#pragma mark 当scrollView正在滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
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
