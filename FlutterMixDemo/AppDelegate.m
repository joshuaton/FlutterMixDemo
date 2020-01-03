//
//  AppDelegate.m
//  FlutterMixDemo
//
//  Created by junshao on 2020/1/2.
//  Copyright © 2020 junshao. All rights reserved.
//

#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "ViewController.h"
#import "BaseFlutterViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
    [self.flutterEngine run];
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    self.flutterMethodChannel = [FlutterMethodChannel methodChannelWithName:@"com.junshao"
                                  binaryMessenger:self.flutterEngine.binaryMessenger];
    [self.flutterMethodChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        if([@"jump" isEqualToString:call.method]){
            NSDictionary *args = call.arguments;
            NSString *url = args[@"url"];
            if(url){
                                UINavigationController *navigationController = [UIApplication sharedApplication].keyWindow.rootViewController;

                
                
                FlutterEngine *flutterEngine = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
                BaseFlutterViewController *flutterViewController = [[BaseFlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
                FlutterMethodChannel *flutterMethodChannel = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterMethodChannel;
                [flutterMethodChannel invokeMethod:@"changeRoute" arguments:@{@"routeName":@"page1"}];
                [navigationController pushViewController:flutterViewController animated:YES];
                
            }
        }else{
            result(FlutterMethodNotImplemented);
        }
    }];
    return YES;
}





@end
