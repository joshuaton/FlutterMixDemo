//
//  ViewController.m
//  FlutterMixDemo
//
//  Created by junshao on 2020/1/2.
//  Copyright © 2020 junshao. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import "AppDelegate.h"
#import "BaseFlutterViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 50);
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(showFlutter) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)showFlutter{
    
    
    
    FlutterEngine *flutterEngine = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    BaseFlutterViewController *flutterViewController = [[BaseFlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    FlutterMethodChannel *flutterMethodChannel = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterMethodChannel;
    [flutterMethodChannel invokeMethod:@"changeRoute" arguments:@{@"routeName":@"page0"}];
    [self.navigationController pushViewController:flutterViewController animated:YES];
}


@end
