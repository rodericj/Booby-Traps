//
//  TrapDetailViewController.h
//  BoobyTrap
//
//  Created by Roderic Campbell on 9/22/09.
//  Copyright 2009 Slide. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TrapDetailViewController : UIViewController {
	IBOutlet UILabel *itemTitle;
	IBOutlet UILabel *itemCost;
	IBOutlet UIImageView *itemImage;
	IBOutlet UITextView *itemDescription;
}
@property (nonatomic, retain) UILabel *itemTitle;
@property (nonatomic, retain) UIImageView *itemImage;
@property (nonatomic, retain) UILabel *itemCost;
@property (nonatomic, retain) UITextView *itemDescription;

@end
