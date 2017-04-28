//
//  StatusCell.h
//  不等高cell
//
//  Created by mac on 2017/4/27.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Status;
@interface StatusCell : UITableViewCell
/**微博模型*/
@property (nonatomic,strong) Status *status;

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
@end
