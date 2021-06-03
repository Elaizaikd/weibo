//
//  DiscoverTableViewController.m
//  Weibo-OC
//
//  Created by Juri on 2020/4/15.
//  Copyright © 2020 Juri. All rights reserved.
//

#import "DiscoverTableViewController.h"
#import "VisitorView.h"
@interface DiscoverTableViewController ()

@end

@implementation DiscoverTableViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.visitorView setupImage:@"visitorImage_house" andTitle:@"登陆后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过"];
}

@end
