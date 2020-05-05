//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by Junior Suarez-Leyva on 5/4/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import "EntryListTableViewController.h"


@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return EntryController.sharedInstance.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCell" forIndexPath:indexPath];
    
    Entry *entry = EntryController.sharedInstance.entries[indexPath.row];
    if (entry)
    {
        cell.textLabel.text = entry.title;
    }
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Entry * entryListToDelete = EntryController.sharedInstance.entries[indexPath.row];
        [EntryController.sharedInstance removeEntry:entryListToDelete];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toViewEntry"])
    {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        EntryDetailViewController *vc = [segue destinationViewController];
        
        vc.entry = EntryController.sharedInstance.entries[indexPath.row];
        
    }
}


@end

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Make sure your segue name in storyboard is the same as this line
//    if ([[segue identifier] isEqualToString:@"YOUR_SEGUE_NAME_HERE"])
//    {
//        // Get reference to the destination view controller
//        YourViewController *vc = [segue destinationViewController];
//
//        // Pass any objects to the view controller here, like...
//        [vc setMyObjectHere:object];
//    }
//}
