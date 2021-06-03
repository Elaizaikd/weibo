//
//  MessageTableViewController.m
//  Weibo-OC
//
//  Created by Juri on 2020/4/15.
//  Copyright © 2020 Juri. All rights reserved.
//

#import "MessageTableViewController.h"
#import "VisitorView.h"
@interface MessageTableViewController ()

@end

@implementation MessageTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.visitorView setupImage:@"visitorImage_message" andTitle:@"登陆后，别人评价你的微博，发给你的消息，都会在这里收到通知"];
}

@end
