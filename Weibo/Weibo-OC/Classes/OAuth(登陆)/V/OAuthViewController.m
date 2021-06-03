#import "OAuthViewController.h"
#import <WebKit/WebKit.h>
#import "NetworkTools.h"
#import "UserAccount.h"
#import "UserAccountViewModel.h"

@interface OAuthViewController ()<WKNavigationDelegate>
@property (nonatomic, strong)WKWebView *webView;
@end

@implementation OAuthViewController

#pragma mark - 视图生命周期
- (void)loadView{
    self.view = self.webView;
    self.title = @"登录新浪微博";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backMain)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"填充" style:UIBarButtonItemStylePlain target:self action:@selector(autoFill)];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // 加载授权
    [self.webView loadRequest: [UserAccountViewModel.shareUserAccount.netTools getAuthorizeRequest]];
    
    // 设置代理，监听用户授权的过程
    self.webView.navigationDelegate = self;
}

#pragma mark - 代理方法
// 监听跳转动作
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    if ([webView.URL.host isEqual: @"www.baidu.com"]) {
        [UserAccountViewModel.shareUserAccount getAccessTokenWithCode:webView.URL completionHandler:^(id  _Nonnull data, NSError * _Nonnull error) {
            if (!error) {
                NSLog(@"%@", data);
                UserAccountViewModel.shareUserAccount.userLogin = YES;
                
                [self dismissViewControllerAnimated:YES completion:^{
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadView" object:nil];
                }];
            }else{
                NSLog(@"%@", error);
            }
        }];
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - 按钮监听方法
/// 返回主界面
- (void) backMain{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/// 填充用户名和密码
- (void)autoFill{
    NSString *js = @"document.getElementById('userId').value = '19801171030';\
    document.getElementById('passwd').value = '6235523.'";
    [self.webView evaluateJavaScript:js completionHandler:nil];
}

#pragma mark - 懒加载
- (WKWebView *)webView{
    if (_webView == nil) {
        _webView = [[WKWebView alloc]init];
    }
    return _webView;
}

@end
