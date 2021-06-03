//
//  StatusPicsView.h
//  Weibo-OC
//
//  Created by Juri on 2020/5/4.
//  Copyright © 2020 Juri. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StatusViewModel;
NS_ASSUME_NONNULL_BEGIN

@interface StatusPicsView : UICollectionView

@property (nonatomic, strong) StatusViewModel* viewModel;

@end

NS_ASSUME_NONNULL_END
