//
//  BaseFlutterViewController.m
//  FlutterMixDemo
//
//  Created by junshao on 2020/1/3.
//  Copyright © 2020 junshao. All rights reserved.
//

#import "BaseFlutterViewController.h"
#import "AppDelegate.h"
@interface BaseFlutterViewController ()

@end

@implementation BaseFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"[js] viewWillAppear");
    [super viewWillAppear:animated];
    FlutterEngine *flutterEngine = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    flutterEngine.viewController = self;
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"[js] viewDidDisappear");
    [super viewDidDisappear:animated];
}

-(void)dealloc{
    NSLog(@"[js] dealloc");
}



@end
