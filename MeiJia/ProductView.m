//
//  ProductView.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-15.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "ProductView.h"

@implementation ProductView

- (id)initWithFrame:(CGRect)frame atRow:(NSInteger)row
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatButtonsAtRow:row];
    }
    return self;
}

- (void)creatButtonsAtRow:(NSInteger)row
{
    for (int i = 0; i < 2; i++) {
        CGRect frame = CGRectMake((150*(i%2)+10), 150*(i/2), 145, 145);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        if (i%2 == 0) {
            [button setImage:[UIImage imageNamed:@"u63_normal.png"] forState:UIControlStateNormal];
        }
        else
        {
            [button setImage:[UIImage imageNamed:@"u61_normal.png"] forState:UIControlStateNormal];
        }
        button.tag = i;
        //        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

@end
