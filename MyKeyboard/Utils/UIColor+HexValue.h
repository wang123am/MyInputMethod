//
//  UIColor+HexValue.h
//  MyInputMethod
//
//  Created by luowei on 15/7/28.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexValue)

+ (UIColor *)colorWithHexString:(NSString *)hex;

+(NSString *)hexValuesFromUIColor:(UIColor *)color;

+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha;

@end
