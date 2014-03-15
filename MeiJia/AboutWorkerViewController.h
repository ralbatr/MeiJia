//
//  AboutWorkerViewController.h
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutWorkerViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UILabel *workYearlabel;
@property (nonatomic,strong) UISegmentedControl *segmented;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISegmentedControl *timeSegment;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) NSArray *bookArray;

@end
