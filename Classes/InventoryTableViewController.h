//
//  InventoryTableViewController.h
//  BoobyTrap
//
//  Created by Roderic Campbell on 9/22/09.
//  Copyright 2009 Slide. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TrapDetailViewController;

@interface InventoryTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>  {
	IBOutlet UITableView *inventoryTableView;
	//NSMutableArray *inventoryArray;
	NSMutableDictionary *inventoryDict;
	TrapDetailViewController *trapDetailViewController;
	NSString *persistentJsonString;
}

//@property (nonatomic, retain) NSMutableArray *inventoryArray;
@property (nonatomic, retain) NSMutableDictionary *inventoryDict;
@property (nonatomic, retain) TrapDetailViewController *trapDetailViewController;
@property (nonatomic, retain) NSString *persistentJsonString;

@end
