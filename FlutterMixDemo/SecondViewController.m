//
//  SecondViewController.m
//  FlutterMixDemo
//
//  Created by junshao on 2020/1/3.
//  Copyright © 2020 junshao. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 50);
    [button setTitle:@"button2" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(showFlutter) forControlEvents:UIControlEventTouchUpInside];
}

-(void)showFlutter{
    
    
    
    FlutterEngine *flutterEngine = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    FlutterMethodChannel *flutterMethodChannel = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterMethodChannel;
    [flutterMethodChannel invokeMethod:@"changeRoute" arguments:@{@"routeName":@"page0"}];
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
