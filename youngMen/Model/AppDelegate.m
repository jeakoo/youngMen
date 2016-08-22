//
//  AppDelegate.m
//  youngMen
//
//  Created by 쿠 on 2016. 8. 22..
//  Copyright © 2016년 rollsRoyce. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    _window = [[UIWindow alloc] initWithFrame:screenBounds];
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    
    _tbController = [[UITabBarController alloc] init];
    
    UIViewController *tb_vc0 = [[UIViewController alloc] init];
    tb_vc0.view.backgroundColor = [UIColor redColor];
    UIViewController *tb_vc1 = [[UIViewController alloc] init];
    tb_vc1.view.backgroundColor = [UIColor orangeColor];
    UIViewController *tb_vc2 = [[UIViewController alloc] init];
    tb_vc2.view.backgroundColor = [UIColor yellowColor];
    UIViewController *tb_vc3 = [[UIViewController alloc] init];
    tb_vc3.view.backgroundColor = [UIColor greenColor];
    UIViewController *tb_vc4 = [[UIViewController alloc] init];
    tb_vc4.view.backgroundColor = [UIColor blueColor];
    
    
    UITabBarItem *tb_item0 = [[UITabBarItem alloc] initWithTitle:@"홈" image:[UIImage imageNamed:@"tb_home"] selectedImage:[UIImage imageNamed:@"tb_home_selected"]];
    [tb_item0 setImageInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    UITabBarItem *tb_item1 = [[UITabBarItem alloc] initWithTitle:@"내주변" image:[UIImage imageNamed:@"tb_location"] selectedImage:[UIImage imageNamed:@"tb_location_selected"]];
    [tb_item1 setImageInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    UITabBarItem *tb_item2 = [[UITabBarItem alloc] initWithTitle:@"채팅" image:[UIImage imageNamed:@"tb_talk"] selectedImage:[UIImage imageNamed:@"tb_talk_selected"]];
    [tb_item2 setImageInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    UITabBarItem *tb_item3 = [[UITabBarItem alloc] initWithTitle:@"캐스트" image:[UIImage imageNamed:@"tb_cast"] selectedImage:[UIImage imageNamed:@"tb_cast_selected"]];
    [tb_item3 setImageInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    UITabBarItem *tb_item4 = [[UITabBarItem alloc] initWithTitle:@"이벤트" image:[UIImage imageNamed:@"tb_event"] selectedImage:[UIImage imageNamed:@"tb_event_selected"]];
    [tb_item4 setImageInsets:UIEdgeInsetsMake(10, 10, 10, 10)];

    [tb_vc0 setTabBarItem:tb_item0];
    [tb_vc1 setTabBarItem:tb_item1];
    [tb_vc2 setTabBarItem:tb_item2];
    [tb_vc3 setTabBarItem:tb_item3];
    [tb_vc4 setTabBarItem:tb_item4];

    NSArray* tbControllers = [NSArray arrayWithObjects:tb_vc0,tb_vc1,tb_vc2,tb_vc3,tb_vc4, nil];
    
    _tbController.viewControllers = tbControllers;
    
    UIButton *leftMenuButton  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [leftMenuButton setImage:[UIImage imageNamed:@"left_menu"] forState:UIControlStateNormal];
    [leftMenuButton addTarget:self action:@selector(leftMenuSlideAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *nav_leftButton = [[UIBarButtonItem alloc] initWithCustomView:leftMenuButton];
        _tbController.navigationItem.leftBarButtonItem = nav_leftButton;
    
    _leftMenuView = [[UIViewController alloc]init];
    _nav = [[UINavigationController alloc] initWithRootViewController: _tbController];
  
    _leftMenuView.view.backgroundColor = [UIColor purpleColor];
    _leftMenuView.view.frame = CGRectMake(-320+_window.frame.size.width/3, 0, _window.frame.size.width/3*2, _window.frame.size.height);

    [_nav.view addSubview:_leftMenuView.view];
    
    [_window setRootViewController: _nav];
    
    [_window makeKeyAndVisible];

    
    return YES;
}

- (void)leftMenuSlideAction_out
{
    CGRect navRect = _nav.view.frame;
    navRect.origin.x = 0;
    
    CGRect navRect_bounds = navRect;
    navRect_bounds.origin.x = navRect_bounds.origin.x - 10;

    [UIView animateWithDuration:0.2
                     animations:^{
                         _nav.view.frame = navRect_bounds;
                         
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.1
                                          animations:^{
                                              _nav.view.frame = navRect;
                                              
                                          }
                                          completion:^(BOOL finished){
                                              [_leftMenuView_out removeFromSuperview];
                                          }];
                     }];

}

- (void)leftMenuSlideAction
{

    CGRect navRect = _nav.view.frame;
    navRect.origin.x = _leftMenuView.view.frame.size.width;
    
    CGRect navRect_bounds = navRect;
    navRect_bounds.origin.x = navRect_bounds.origin.x + 10;
    
    _leftMenuView_out = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, navRect.size.width, navRect.size.height)];
    [_leftMenuView_out addTarget:self action:@selector(leftMenuSlideAction_out) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_nav.view addSubview:_leftMenuView_out];
    [UIView animateWithDuration:0.2
                     animations:^{
                         _nav.view.frame = navRect_bounds;
                         
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.1
                                          animations:^{
                                              _nav.view.frame = navRect;
                                              
                                          }
                                          completion:^(BOOL finished){
                                              
                                          }];
                     }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
