//
//  InventoryTableViewController.m
//  BoobyTrap
//
//  Created by Roderic Campbell on 9/22/09.
//  Copyright 2009 Slide. All rights reserved.
//

#import "InventoryTableViewController.h"
#import "TrapDetailViewController.h"
#import "BoobyTrapAppDelegate.h"

@implementation InventoryTableViewController
//@synthesize inventoryArray;
@synthesize inventoryDict;
@synthesize persistentJsonString;
@synthesize trapDetailViewController;
/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = NSLocalizedString(@"Inventory", @"My Inventory");
	
	//NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"Slippery Banana Peel", @"Secret Trap Door", @"Trip Wire", nil];
	//self.inventoryArray = array;
	NSString *jsonString =[[NSString alloc] initWithString:@"{\"0\": {\"cost\": \"15\", \"description\": \"Use this banana peel to make your victim slip and fall, causing endless embarrasment most likely in front of his or her friends.\", \"img\": \"bananapeel.png\", \"title\": \"Slippery Banana Peel\"},\"1\": {\"cost\": \"10\", \"description\": \"They walk into the place, they get punched in the face. Classic!!!\", \"img\": \"boxingglove.jpg\", \"title\": \"Boxing Glove Trap\"}}"];
	NSDictionary *results = [jsonString JSONValue];
	self.inventoryDict = results;
	self.persistentJsonString = jsonString;
	[results release];
	//[array release];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.inventoryDict count];
	//return [self.inventoryArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	NSInteger row = [indexPath row];
	NSString *s = [NSString stringWithFormat:@"%d", row];

	cell.text = [[self.inventoryDict objectForKey:s] objectForKey:@"title"];
	[s release];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	NSInteger row = [indexPath row];
	if (self.trapDetailViewController == nil){
		TrapDetailViewController *aTrapDetail = [[TrapDetailViewController alloc] initWithNibName:@"TrapDetailView" bundle:nil];
		self.trapDetailViewController = aTrapDetail;
		[aTrapDetail release];
	}
	//25:00
	//NSLog(@"logging stuff");
	//NSLog(self.persistentJsonString);
	NSDictionary *jsonDict = [persistentJsonString JSONValue];
	NSString *s = [NSString stringWithFormat:@"%d", row];
	//NSString *jsonify = [inventoryDict JSONRepresentation];
	//NSLog([self.inventoryDict JSONRepresentation]);
	NSLog([[jsonDict objectForKey:s] objectForKey:@"title"]);
	NSLog([[jsonDict objectForKey:s] objectForKey:@"description"]);
	trapDetailViewController.title = [[jsonDict objectForKey:s] objectForKey:@"title"];

	//trapDetailViewController.title = [NSString stringWithFormat:@"%@", s];
	NSLog(trapDetailViewController.itemTitle.text);
	BoobyTrapAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	[delegate.inventoryNavController pushViewController:trapDetailViewController animated:YES];
	
	//The delegate has pushed the new nav controller. Now set up the text fields etc
	trapDetailViewController.itemTitle.text = [[jsonDict objectForKey:s] objectForKey:@"title"];
	trapDetailViewController.itemDescription.text = [[jsonDict objectForKey:s] objectForKey:@"description"];
	trapDetailViewController.itemCost.text = [[jsonDict objectForKey:s] objectForKey:@"cost"];
	trapDetailViewController.itemImage.image = [UIImage imageNamed:[[jsonDict objectForKey:s] objectForKey:@"img"]];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
	[trapDetailViewController release];
    [super dealloc];
}


@end

