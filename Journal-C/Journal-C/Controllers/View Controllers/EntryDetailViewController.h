//
//  EntryDetailViewController.h
//  Journal-C
//
//  Created by Junior Suarez-Leyva on 5/4/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryController.h"
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
@property (strong, nonatomic) Entry * entry;


- (IBAction)clearButtonTapped:(id)sender;

- (IBAction)saveButtonTapped:(id)sender;



@end

NS_ASSUME_NONNULL_END
