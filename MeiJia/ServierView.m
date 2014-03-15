//
//  ServierView.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-15.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "ServierView.h"

@implementation ServierView

- (id)initWithFrame:(CGRect)frame withRow:(NSInteger)row andTarget:(id)target andSelector:(SEL)selector andArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self creatButtonsAtRow:row andTarget:target andSelector:selector andArray:array];
    }
    return self;
}

- (void)creatButtonsAtRow:(NSInteger)row andTarget:(id)target andSelector:(SEL)selector andArray:(NSArray *)array
{
    
    for (int i = 0; i < 3; i++) {
        CGRect frame = CGRectMake((97*(i%3)+10), 95*(i/3)+0, 87, 98);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        if (i%3 == 0) {
            [button setImage:[UIImage imageNamed:@"u29_normal.png"] forState:UIControlStateNormal];
        }
        else if(i%3 == 1)
        {
            [button setImage:[UIImage imageNamed:@"u31_normal.png"] forState:UIControlStateNormal];
        }
        else
        {
            [button setImage:[UIImage imageNamed:@"u37_normal.png"] forState:UIControlStateNormal];
        }
        button.tag = i*row + i;
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        CGRect labelFrame = CGRectMake(frame.origin.x+5, frame.origin.y+40, frame.size.width, frame.size.height);
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        label.font = [UIFont systemFontOfSize:14];
        label.text = array[3*row + i];
//        NSLog(@"%d",3*row+i);
        [self addSubview:label];
    }
}

@end
