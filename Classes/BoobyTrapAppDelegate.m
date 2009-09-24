//
//  BoobyTrapAppDelegate.m
//  BoobyTrap
//
//  Created by Roderic Campbell on 9/21/09.
//  Copyright Slide 2009. All rights reserved.
//

#import "BoobyTrapAppDelegate.h"
#import "InventoryNavController.h"

@implementation BoobyTrapAppDelegate

@synthesize window;
@synthesize rootController;
@synthesize inventoryNavController;
- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	//From the demo at: http://www.youtube.com/watch?v=LBnPfAtswgw
	//May want to make this the login page first instead of the rootController view
	[window addSubview:rootController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
	[rootController release];
	[inventoryNavController release];
    [super dealloc];
}


@end
