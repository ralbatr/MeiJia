//
//  ServierView.h
//  MeiJia
//
//  Created by Ralbatr on 14-3-15.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServierView : UIView

- (id)initWithFrame:(CGRect)frame withRow:(NSInteger)row andTarget:(id)target andSelector:(SEL)selector andArray:(NSArray *)array;

@end
