//
//  ProfileTableViewController.m
//  Weibo-OC
//
//  Created by Juri on 2020/4/15.
//  Copyright © 2020 Juri. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "VisitorView.h"
@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.visitorView setupImage:@"visitorImage_profile" andTitle:@"登陆后，你的微博、相册、个人资料都会显示在这里，展示给别人"];
}

@end
