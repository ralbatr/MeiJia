//
//  bookResultView.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "bookResultView.h"

@implementation bookResultView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self creatLabel];
    }
    return self;
}

- (void)creatLabel
{
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.frame = CGRectMake(5, 5, 300, 40);
    timeLabel.text = @"2月28日  9:40 -- 11:40";
    [self addSubview:timeLabel];
    UILabel *serverLabel = [[UILabel alloc] init];
    serverLabel.frame = CGRectMake(5, 45, 300, 40);
    serverLabel.text = @"服务内容：icure修手，Padicure修脚";
    [self addSubview:serverLabel];
}

@end
