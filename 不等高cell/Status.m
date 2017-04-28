//
//  Status.m
//  不等高cell
//
//  Created by mac on 2017/4/27.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "Status.h"

@implementation Status

+ (instancetype)statusWithDict:(NSDictionary *)dict{
    Status *status = [[self alloc]init];
    [status setValuesForKeysWithDictionary:dict];
    return status;
}

/**
 返回cellHeight
 */
- (CGFloat)cellHeight{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = 10;
    
    /**头像frame*/
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    CGFloat iconW = 50;
    CGFloat iconH = iconW;
    self.iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    /**昵称frame*/
    CGFloat nameX = CGRectGetMaxX(self.iconF)+margin;
    CGFloat nameY = iconY;
    CGSize nameSize = [self stringWithSize:self.name maxSize:CGSizeMake(screenW-nameX, MAXFLOAT) font:[UIFont systemFontOfSize:16]];
    self.nameF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    /**vipFrame*/
    if (self.isVip) { //是会员
        CGFloat vipX = CGRectGetMaxX(self.nameF)+margin;
        CGFloat vipY = nameY;
        CGFloat vipW = 16;
        CGFloat vipH = vipW;
        self.vipF = CGRectMake(vipX, vipY, vipW, vipH);
    }

    /**正文frame*/
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconF)+margin;
    CGSize textSize = [self stringWithSize:self.text maxSize:CGSizeMake(screenW-2*margin, MAXFLOAT) font:[UIFont systemFontOfSize:16]];
    self.textF = CGRectMake(textX, textY, textSize.width, textSize.height);

    /**配图frame*/
    if (self.picture.length) { // 有配图
        CGFloat pictureX = textX;
        CGFloat pictureY = CGRectGetMaxY(self.textF)+margin;
        CGFloat pictureW = 100;
        CGFloat pictureH = pictureW;
        self.pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        return CGRectGetMaxY(self.pictureF)+margin;
    }
    return CGRectGetMaxY(self.textF)+margin;
}


/**
 根据字符串算出尺寸
 @param string 需要计算的字符串
 @param maxSize 可以容纳的最大尺寸
 @param font 字体
 @return 尺寸
 */
- (CGSize)stringWithSize:(NSString *)string maxSize:(CGSize)maxSize font:(UIFont *)font{
    NSMutableDictionary *attuibute = [NSMutableDictionary dictionary];
    attuibute[NSFontAttributeName] = font;
    return [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attuibute context:nil].size;
}

@end
