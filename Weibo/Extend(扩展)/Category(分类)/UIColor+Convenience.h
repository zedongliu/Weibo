//
//  UIColor+Convenience.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Convenience)
+ (UIColor *)colorWithHex:(NSInteger)hex alpha:(float)alpha;


/**
 *  NSString -> UIColor
 *
 *  @param aColorString normal:@“#AB12FF” or @“AB12FF” or gray: @"C7"
 *
 *  @return UIColor
 */
+ (UIColor *)colorFromString:(NSString *)aColorString;

/**
 *  NSString -> UIColor with alpha
 *
 *  @param aColorString normal:@“#AB12FF” or @“AB12FF” or gray: @"C7"
 *  @param aAlpha       alpha 0-1.0
 *
 *  @return UIColor
 */
+ (UIColor *)colorFromString:(NSString *)aColorString alpha:(CGFloat)aAlpha;
@end

NS_ASSUME_NONNULL_END
