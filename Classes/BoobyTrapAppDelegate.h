//
//  BoobyTrapAppDelegate.h
//  BoobyTrap
//
//  Created by Roderic Campbell on 9/21/09.
//  Copyright Slide 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InventoryNavController;

@interface BoobyTrapAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UITabBarController *rootController;
	IBOutlet InventoryNavController *inventoryNavController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;
@property (nonatomic, retain) IBOutlet InventoryNavController *inventoryNavController;
@end

