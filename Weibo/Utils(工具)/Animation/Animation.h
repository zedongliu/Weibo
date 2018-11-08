//
//  Animation.h
//  Weibo
//
//  Created by liuzedong on 2018/11/8.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animation : NSObject

+(CABasicAnimation *)opacityForever_Animation:(float)time; //永久闪烁的动画
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time; //有闪烁次数的动画
+(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x; //横向移动
+(CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y; //纵向移动
+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes; //缩放
+(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes; //组合动画
+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes; //路径动画
+(CABasicAnimation *)movepoint:(CGPoint )point; //点移动
+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount; //旋转

@end

NS_ASSUME_NONNULL_END
