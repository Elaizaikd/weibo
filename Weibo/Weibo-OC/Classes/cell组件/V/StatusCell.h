//
//  StatusCell.h
//  Weibo-OC
//
//  Created by Juri on 2020/4/28.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StatusViewModel;
@class StatusPicsView;
@class StatusCellBottomView;

// 微博cell
@interface StatusCell : UITableViewCell

@property (nonatomic, strong) UILabel* textContentLbl;
@property (nonatomic, strong) StatusPicsView* picsView;
@property (nonatomic, strong) StatusCellBottomView* bottomView;

@property (nonatomic, strong) StatusViewModel* viewModel;

-(CGFloat)rowHeight:(StatusViewModel*)vm;
- (void)setupUI;

@end
