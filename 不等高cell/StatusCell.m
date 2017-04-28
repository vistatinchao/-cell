//
//  StatusCell.m
//  不等高cell
//
//  Created by mac on 2017/4/27.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "StatusCell.h"
#import "Status.h"

@interface StatusCell()
/**头像Imageview*/
@property (nonatomic,weak) UIImageView *iconImageView;
/**昵称Label*/
@property (nonatomic,weak) UILabel *nameLabel;
/**vipImageView*/
@property (nonatomic,weak) UIImageView *vipImageView;
/**正文Label*/
@property (nonatomic,weak) UILabel *contentLabel;
/**配图iamgeView*/
@property (nonatomic,weak) UIImageView *pictureImageView;
@end

@implementation StatusCell

#pragma mark - cell初始化
static NSString *const cellID = @"cell";
+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSubView];
    }
    return self;
}

/**
 添加子控件
 */
- (void)setSubView{
    /**头像Imageview*/
    UIImageView *iconImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;

    /**昵称Label*/
    UILabel *nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:nameLabel];
    nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel = nameLabel;

    /**vipImageView*/
    UIImageView *vipImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:vipImageView];
    self.vipImageView = vipImageView;

    /**正文Label*/
    UILabel *contentLabel = [[UILabel alloc]init];
    [self.contentView addSubview:contentLabel];
    contentLabel.backgroundColor = [UIColor redColor];
    contentLabel.numberOfLines = 0;
    contentLabel.font = [UIFont systemFontOfSize:16];
    self.contentLabel = contentLabel;

    /**配图iamgeView*/
    UIImageView *pictureImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:pictureImageView];
    self.pictureImageView = pictureImageView;
}

/**
 重新属性模型set方法
 @param status 属性模型
 */
- (void)setStatus:(Status *)status{
    _status = status;
    [self setSubViewDatasWithStatus:status];
    [self setSubViewFrameWithStatus:status];
}

/**
 设置子控件数据
 */
- (void)setSubViewDatasWithStatus:(Status *)status{
    self.iconImageView.image = [UIImage imageNamed:status.icon];
    self.nameLabel.text = status.name;
    if (status.isVip) {
        self.vipImageView.image = [UIImage imageNamed:@"vip"];
        self.vipImageView.hidden = NO;
    }else{
        self.vipImageView.hidden = YES;
    }
    self.contentLabel.text = status.text;
    if (status.picture.length) {
        self.pictureImageView.image = [UIImage imageNamed:status.picture];
        self.pictureImageView.hidden = NO;
    }else{
        self.pictureImageView.hidden = YES;
    }
}

/**
 设置子控件frame
 */
- (void)setSubViewFrameWithStatus:(Status *)status{
    self.iconImageView.frame = status.iconF;
    self.nameLabel.frame = status.nameF;
    if (status.isVip) {
        self.vipImageView.frame = status.vipF;
    }
    self.contentLabel.frame = status.textF;
    if (status.picture.length) {
        self.pictureImageView.frame = status.pictureF;
    }
}

@end
