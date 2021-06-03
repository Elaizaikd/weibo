#import "HomeTableViewController.h"
#import "VisitorView.h"
#import "UserAccountViewModel.h"
#import "Status.h"
#import "StatusListViewModel.h"
#import "StatusViewModel.h"

#import "Common.h"
#import "StatusNormalCell.h"
#import "StatusRetweetedCell.h"

@interface HomeTableViewController ()
@property(nonatomic, strong)NSNumber* clickWeiboId;
@end

@implementation HomeTableViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    // 设置未登录时的界面
    if (!UserAccountViewModel.shareUserAccount.userLogin) {
        [self.visitorView setupImage:@"" andTitle:@"关注一些人，这里看看有什么惊喜"];
        return ;
    }
    // 注册可重用cell
    [self.tableView registerClass:[StatusRetweetedCell class] forCellReuseIdentifier:StatusRetweetedCellID];
    [self.tableView registerClass:[StatusNormalCell class] forCellReuseIdentifier:StatusNormalCellID];
    
    // 设置预估行高
    self.tableView.estimatedRowHeight = 100;
    
    // 下拉刷新
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = UIColor.redColor;
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [refreshControl addTarget:self action:@selector(test) forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = refreshControl;
    
    // 分割线
    self.tableView.separatorColor = UIColor.blackColor;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // 加载数据
    [self loadData];
}

- (void)test {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"refresh");
        [self.tableView.refreshControl endRefreshing];
    });
   
}

// 获得微博数据
- (void)loadData{
    
    [StatusListViewModel.shareStatus loadStatusWithCompletionHandler:^(id  _Nonnull data, NSError * _Nonnull error) {
        if (!error) {
            [self.tableView reloadData];
        }else{
            NSLog(@"%@", error);
        }
    }];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return StatusListViewModel.shareStatus.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusViewModel* vm = StatusListViewModel.shareStatus.statuses[indexPath.row];
    StatusNormalCell* cell;
    if (vm.status.retweeted_status == nil) {
       cell = [tableView dequeueReusableCellWithIdentifier:StatusNormalCellID];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:StatusRetweetedCellID];
    }
    cell.viewModel = vm;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusViewModel* vm = StatusListViewModel.shareStatus.statuses[indexPath.row];
    return vm.rowHeight;
}

@end
