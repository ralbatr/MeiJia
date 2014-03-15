//
//  ArtificerListView.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-15.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "ArtificerListView.h"

@implementation ArtificerListView

- (id)initWithFrame:(CGRect)frame atRow:(NSInteger)row andTarget:(id)target andSelector:(SEL)selector andArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatButtonsAtRow:row andTarget:target andSelector:selector andArray:array];
    }
    return self;
}

- (void)creatButtonsAtRow:(NSInteger)row andTarget:(id)target andSelector:(SEL)selector andArray:(NSArray *)array
{
    for (int i = 0; i < 2; i++) {
        CGRect frame = CGRectMake((150*(i%2)+20), 180*(i/2)+5, 140, 182);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        [button setImage:[UIImage imageNamed:@"u80_normal.png"] forState:UIControlStateNormal];
        
        button.tag = i;
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        CGRect labelFrame = CGRectMake(frame.origin.x+0, frame.origin.y+150, 140, 30);
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        label.backgroundColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:14];
        label.text = array[i];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
}

@end
