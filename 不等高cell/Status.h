//
//  Status.h
//  不等高cell
//
//  Created by mac on 2017/4/27.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Status : NSObject

/**正文*/
@property (nonatomic,copy) NSString *text;
/**头像*/
@property (nonatomic,copy) NSString *icon;
/**昵称*/
@property (nonatomic,copy) NSString *name;
/**是否会员*/
@property (nonatomic,assign,getter=isVip) BOOL vip;
/**配图*/
@property (nonatomic,copy) NSString *picture;

/**正文frame*/
@property (nonatomic,assign) CGRect textF;
/**头像frame*/
@property (nonatomic,assign) CGRect iconF;
/**vipFrame*/
@property (nonatomic,assign) CGRect vipF;
/**配图frame*/
@property (nonatomic,assign) CGRect pictureF;
/**昵称frame*/
@property (nonatomic,assign) CGRect nameF;
/**cell的高度*/
@property (nonatomic,assign,readonly) CGFloat cellHeight;
/**
 字典转模型
 */
+(instancetype)statusWithDict:(NSDictionary *)dict;

@end

