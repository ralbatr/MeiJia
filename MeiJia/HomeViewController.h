//
//  HomeViewController.h
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *discArray;

@end
