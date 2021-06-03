#import "MainViewController.h"
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"
@interface MainViewController ()
@end

@implementation MainViewController

#pragma mark - 控制器生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChilds];
}

#pragma mark - 设置界面
// 添加所有控制器
- (void)addChilds{
    [self addChild:[[HomeTableViewController alloc]init] withTitle:@"首页" withImage:@"tabbar_home"];
    [self addChild:[[MessageTableViewController alloc]init] withTitle:@"消息" withImage:@"tabbar_message_center"];
    [self addChild:[[DiscoverTableViewController alloc]init] withTitle:@"发现" withImage:@"tabbar_discover"];
    [self addChild:[[ProfileTableViewController alloc]init] withTitle:@"我" withImage:@"tabbar_profile"];
}

// 添加控制器
- (void)addChild:(UIViewController*)vc withTitle:(NSString*)title withImage:(NSString*)imageName{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
