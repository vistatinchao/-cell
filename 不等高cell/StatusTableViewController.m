//
//  StatusTableViewController.m
//  不等高cell
//
//  Created by mac on 2017/4/27.
//  Copyright © 2017年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "StatusTableViewController.h"
#import "Status.h"
#import "StatusCell.h"

@interface StatusTableViewController ()
/**微博数据*/
@property (nonatomic,strong) NSArray <Status *>*statuses;

@end

@implementation StatusTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatusCell *cell = [StatusCell cellWithTableView:tableView indexPath:indexPath];
    cell.status = self.statuses[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Status *status = self.statuses[indexPath.row];
    return status.cellHeight;
}
- (NSArray<Status *> *)statuses{
    if (!_statuses) {
        NSMutableArray *statusArr= [NSMutableArray array];
        NSArray *status = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
        for (NSDictionary *dict in status) {
            Status *status = [Status statusWithDict:dict];
            [statusArr addObject:status];
        }
        self.statuses = statusArr;
    }
    return _statuses;
}

@end
