//
//  GradientTableViewCell.h
//  SkeletonViewOC
//
//  Created by JY on 2020/4/24.
//  Copyright © 2020 JY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradientTableViewCell : UITableViewCell
-(void)setContentWithTitle:(NSString *)title andDetail:(NSString *)detail andIcon:(NSString *)icon;
@end

NS_ASSUME_NONNULL_END
