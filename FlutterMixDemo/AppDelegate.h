//
//  AppDelegate.h
//  FlutterMixDemo
//
//  Created by junshao on 2020/1/2.
//  Copyright © 2020 junshao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) FlutterEngine *flutterEngine;
@property (nonatomic, strong) FlutterMethodChannel *flutterMethodChannel;

@end

