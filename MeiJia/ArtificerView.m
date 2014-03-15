//
//  ArtificerView.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "ArtificerView.h"

@implementation ArtificerView

- (id)initWithFrame:(CGRect)frame WithTarget:(id)target andSelector:(SEL)selector //andHideWorkYear:(BOOL)workYear
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [self creatViewHideWorkYear:workYear];
        [self creatViewWithTarget:target andSelector:selector];
    }
    return self;
}

- (void)creatViewHideWorkYear//:(BOOL)workYear
{
    UIImageView *headimageView = [[UIImageView alloc] init];
    headimageView.frame = CGRectMake(5, 0, 70, 87);
    headimageView.image = [UIImage imageNamed:@"u11_normal.png"];
    [self addSubview:headimageView];
    
    UILabel *jobIDlabel = [[UILabel alloc] init];
    jobIDlabel.frame = CGRectMake(80, 0, 200, 40);
    jobIDlabel.text = @"工 号：NS 89987654";
    [self addSubview:jobIDlabel];
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.frame = CGRectMake(80, 25, 200, 40);
    namelabel.text = @"姓名：莉莉";
    [self addSubview:namelabel];
    
//    if(!workYear)
    {
    UILabel *workYearlabel = [[UILabel alloc] init];
    workYearlabel.frame = CGRectMake(190, 25, 200, 40);
    workYearlabel.text = @"工作年限：5年";
    workYearlabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:workYearlabel];
    }
}

- (void)creatViewWithTarget:(id)target andSelector:(SEL)selector
{
    UIButton *busyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    busyButton.frame = CGRectMake(80, 50, 100, 40);
    [busyButton setTitle:@"忙碌" forState:UIControlStateNormal];
    busyButton.enabled = NO;
    [self addSubview:busyButton];
    
    UIButton *bookButton = [UIButton buttonWithType:UIButtonTypeSystem];
    bookButton.frame = CGRectMake(180, 50, 100, 40);
    [bookButton setTitle:@"预约" forState:UIControlStateNormal];
    [bookButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bookButton];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
