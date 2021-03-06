//
//  SceneDelegate.m
//  RSTask8Final
//
//  Created by Gleb Tregubov on 18.07.2021.
//

#import "SceneDelegate.h"
#import "ArtistViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)) API_AVAILABLE(ios(13.0)) API_AVAILABLE(ios(13.0)){
    if (@available(iOS 13.0, *)) {
        self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    } else {
        // Fallback on earlier versions
    }if (@available(iOS 13.0, *)) {
        self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    } else {
        // Fallback on earlier versions
    }
//    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [self rootViewController];
    [self.window makeKeyAndVisible];
}

- (UIViewController *)rootViewController {
    UINavigationController *masterViewController = [[UINavigationController alloc] initWithRootViewController:[ArtistViewController new]];
    return masterViewController;
}


//- (void)sceneDidDisconnect:(UIScene *)scene {
//    // Called as the scene is being released by the system.
//    // This occurs shortly after the scene enters the API_AVAILABLE(ios(13.0)) background, or when its session is discarded.
//    // Release any resources associated with this scene that can be re-created the next time the scene connects.
//    // The scene may re-connect later, as its session was not necessarily discarded (s API_AVAILABLE(ios(13.0))ee `application:didDiscardSceneSessions` instead).
//}
//
//
//- (void)sceneDidBecomeActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
//    // Called when the scene has moved from an inactive state to an active state.
//    // Use this method to restart an API_AVAILABLE(ios(13.0))y tasks that were paused (or not yet started) when the scene was inactive.
//}
//
//
//- (void)sceneWillResignActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
//    // Called when the scene will move from an active state to an inactive state. API_AVAILABLE(ios(13.0))
//    // This may occur due to temporary interruptions (ex. an incoming phone call).
//}
//
//
//- (void)sceneWillEnterForeground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
//    // Called as the scene transitions from the background to the foreground.
//    // Use this method to undo the changes made on entering the background.
//}
//
//
//- (void)sceneDidEnterBackground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
//    // Called as the scene transitions from the foreground to the background.
//    // Use this method to save data, release shared resources, and store enough scene-specific state information
//    // to restore the scene back to its current state.
//}


@end
