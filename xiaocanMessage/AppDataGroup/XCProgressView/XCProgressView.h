//
//  XCProgressView.h
//  xiaocanMessage
//
//  Created by 王文科 on 2016/10/31.
//  Copyright © 2016年 xiaocan. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 菊花图 */
@interface XCProgressView : UIView

@property (nonatomic, assign) CGFloat viewAlpha;/**< 0~1.0 */

+ (instancetype)initWithInSuperView:(UIView *)superView;

- (void)showProgressView;

- (void)hiddenProgressView;

@end
