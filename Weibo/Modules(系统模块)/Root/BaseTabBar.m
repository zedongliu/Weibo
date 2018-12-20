//
//  BaseTabBar.m
//  Weibo
//
//  Created by liuzedong on 2018/12/19.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseTabBar.h"

@interface BaseTabBar()

/** 发布按钮 */
@property (nonatomic, weak) UIButton * publishBtn;

@end

@implementation BaseTabBar

/**
 * 初始化
 */
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        // 设置tabbar的子控件
        UIButton * publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_selected"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_selected"] forState:UIControlStateHighlighted];
        [publishBtn sizeToFit];
        
        [self addSubview:publishBtn];
        self.publishBtn = publishBtn;
    }
    return self;
}

/**
 * 重写布局子控件的方法进行布局
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    if(ISIPHONEX){
        height = self.frame.size.height - 30;
    }else{
        height = self.frame.size.height;
    }
    
    // 设置发布按钮的frame
    self.publishBtn.center = CGPointMake(width  * 0.5, height * 0.5);
    
    // 设置其他的UITabBar的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width /5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIView  * button in self.subviews) {
        
        // 判断 - 只有是UITabBarButton的button才进行布局（也就是tabbar上面的精华、新帖、关注、我这四个按钮） 而发布按钮不是UITabBarButton，就不进行布局
        // 由于UITabBar是苹果官方私有的， 所以不能直接设置
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")])  continue;
        
        //  计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1) ? (index + 1): (index));
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 索引增加
        index ++;
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
