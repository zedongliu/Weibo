//
//  RefreshHeaderView.m
//  Weibo
//
//  Created by liuzedong on 2018/11/8.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "RefreshHeaderView.h"
#import "Animation.h"

@implementation RefreshHeaderView

- (void)prepare
{
    [super prepare];
    
    self.stateLabel.font = SYSTEMFONT(12);
    self.stateLabel.textColor = COLOR_BFC3CF;
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-8);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    self.lastUpdatedTimeLabel.font = SYSTEMFONT(12);
    self.lastUpdatedTimeLabel.textColor = COLOR_BFC3CF;
    self.lastUpdatedTimeLabel.hidden = true;
    
    [self setTitle:[NSBundle mj_localizedStringForKey:MJRefreshHeaderIdleText]  forState:MJRefreshStateIdle];
    [self setTitle:[NSBundle mj_localizedStringForKey:MJRefreshHeaderPullingText]  forState:MJRefreshStatePulling];
    [self setTitle:[NSBundle mj_localizedStringForKey:MJRefreshHeaderRefreshingText]  forState:MJRefreshStateRefreshing];
    
    [self addSubview:self.imgViewLogo];
    [self.imgViewLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(3);
        make.centerX.mas_equalTo(self);
    }];
}

- (void)setState:(MJRefreshState)state
{
    //    [super setState:state];
    MJRefreshCheckState
    
    NSTimeInterval timeInterval = [[NSDate date]timeIntervalSinceDate:self.lastUpdatedTime];
    if (timeInterval < 60)
    {
        self.lastUpdatedTimeLabel.text = @"最后更新：刚刚";
    }
    [self.imgViewLogo.layer removeAllAnimations];
    
    switch (state)
    {
        case MJRefreshStateRefreshing:
        case MJRefreshStatePulling:
        {
            [self.imgViewLogo.layer addAnimation:[Animation rotation:0.25 degree:360 direction:1 repeatCount:100]
                                          forKey:@"flash"];
            // 保存刷新时间
            [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:self.lastUpdatedTimeKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
            break;
        case MJRefreshStateIdle:
        {
            
        }
            break;
        default:
            break;
    }
}

#pragma mark - Setter && Getter

- (UIImageView *)imgViewLogo
{
    if (!_imgViewLogo)
    {
        _imgViewLogo = [[UIImageView alloc]initWithImage:IMAGENAMED(@"icon_new")];
    }
    return _imgViewLogo;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
