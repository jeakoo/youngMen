//
//  AppDelegate.h
//  youngMen
//
//  Created by 쿠 on 2016. 8. 22..
//  Copyright © 2016년 rollsRoyce. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tbController;
@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) UIViewController *leftMenuView;
@property (strong, nonatomic) UIButton *leftMenuView_out;


- (void)leftMenuSlideAction;
@end

