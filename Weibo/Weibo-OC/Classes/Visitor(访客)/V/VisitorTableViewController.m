#import "VisitorTableViewController.h"
#import "VisitorView.h"
#import "OAuthViewController.h"
#import "UserAccountViewModel.h"

@interface VisitorTableViewController ()
@property (nonatomic, assign)BOOL userLogin;
@end

@implementation VisitorTableViewController

#pragma mark - 提醒中心监听方法
- (void)reloadView{
    [self loadView];
}

#pragma mark - 控制器生命周期方法
- (void)loadView{
    self.userLogin = UserAccountViewModel.shareUserAccount.userLogin;
    
    // 根据用户登录情况，决定实现的根视图
    if (self.userLogin) {
        [super loadView];
    }else{
        // 替换根视图
        self.visitorView = [[VisitorView alloc]init];
        self.view = self.visitorView;
        
        // 添加监听方法
        [self.visitorView.registerBtn addTarget:self action:@selector(visitorViewDidRegister) forControlEvents:UIControlEventTouchUpInside];
        [self.visitorView.loginBtn addTarget:self action:@selector(visitorViewDidLogin) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(visitorViewDidRegister)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(visitorViewDidLogin)];
    }
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadView) name:@"reloadView" object:nil];
}

#pragma mark - 访客视图监听方法
- (void) visitorViewDidRegister{
    NSLog(@"注册");
}

- (void) visitorViewDidLogin{
    OAuthViewController *vc = [[OAuthViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
