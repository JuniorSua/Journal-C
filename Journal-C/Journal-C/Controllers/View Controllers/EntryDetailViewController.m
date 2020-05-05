//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Junior Suarez-Leyva on 5/4/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"

@interface EntryDetailViewController ()


@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    
}

- (void) updateViews {
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodyText;
}

- (IBAction)saveButtonTapped:(id)sender {
    
    
    if (self.entry) {
        
        self.entry.title = self.titleTextField.text;
        self.entry.bodyText = self.bodyTextView.text;
        
        
    } else {
        
        Entry *entry = [[Entry alloc] initWithTitle:self.titleTextField.text bodyText:self.bodyTextView.text];
        
        [[EntryController sharedInstance] addEntry:entry];
        
        self.entry = entry;
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender {
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}


- (BOOL) textFieldShouldReturn: (UITextField *)textField
{
    
    [self resignFirstResponder];
    return YES;
  
}
@end
