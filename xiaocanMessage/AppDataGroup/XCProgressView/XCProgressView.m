//
//  XCProgressView.m
//  xiaocanMessage
//
//  Created by 王文科 on 2016/10/31.
//  Copyright © 2016年 xiaocan. All rights reserved.
//

#import "XCProgressView.h"

@interface XCProgressView()

@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@end

@implementation XCProgressView

+ (instancetype)initWithInSuperView:(UIView *)superView{
    XCProgressView *progressView = [[XCProgressView alloc]init];
    if (progressView && superView) {
        progressView.viewAlpha = 0.6;
        progressView.activityView = [[UIActivityIndicatorView alloc]init];
        progressView.activityView.hidesWhenStopped = YES;
        [progressView.activityView stopAnimating];
        [progressView addSubview:progressView.activityView];
        progressView.backgroundColor = [UIColor colorWithWhite:0 alpha:progressView.viewAlpha];
        progressView.hidden = YES;
        [superView addSubview:progressView];
        
        [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView).with.insets(UIEdgeInsetsZero);
        }];
        [progressView.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(progressView);
        }];
    }
    return progressView;
}

- (void)setViewAlpha:(CGFloat)viewAlpha{
    _viewAlpha = viewAlpha;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:_viewAlpha];
}

- (void)showProgressView{
    self.hidden = NO;
    [self.activityView startAnimating];
}

- (void)hiddenProgressView{
    self.hidden = YES;
    [self.activityView stopAnimating];
}

@end
