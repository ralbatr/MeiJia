//
//  bookResultView.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "BookResultView.h"

@implementation BookResultView

- (id)initWithFrame:(CGRect)frame andTarget:(id)target andSEL:(SEL)selector andTitle:(NSString *)title andTag:(NSInteger)row
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self creatLabel];
        [self creatButtonWithTarget:(id)target andSEL:(SEL)selector andTitle:(NSString *)title andTag:row];
    }
    return self;
}

- (void)creatLabel
{
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.frame = CGRectMake(5, 5, 300, 30);
    timeLabel.text = @"2月28日  9:40 -- 11:40";
    [self addSubview:timeLabel];
    UILabel *serverLabel = [[UILabel alloc] init];
    serverLabel.frame = CGRectMake(5, 40, 300, 30);
    serverLabel.text = @"服务内容：icure修手，Padicure修脚";
    [self addSubview:serverLabel];
}

- (void)creatButtonWithTarget:(id)target andSEL:(SEL)selector andTitle:(NSString *)title andTag:(NSInteger)row
{
    UIButton *bookButton = [UIButton buttonWithType:UIButtonTypeSystem];
    bookButton.frame = CGRectMake(110, 75, 100, 30);
//    bookButton.backgroundColor = [UIColor grayColor];
    bookButton.tag = row;
    [bookButton setTitle:title forState:UIControlStateNormal];
    [bookButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bookButton];
}

@end
