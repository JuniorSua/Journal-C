//
//  EntryController.h
//  Journal-C
//
//  Created by Junior Suarez-Leyva on 5/4/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN



@interface EntryController : NSObject 

+ (EntryController *)sharedInstance;

- (void)saveToPersistentStorage;

@property (nonatomic, strong, readonly) NSArray * entries;

// MARK: - Create
- (void)addEntry:(Entry *)entry;

// MARK: - Remove
- (void)removeEntry:(Entry *)entry;

@end

NS_ASSUME_NONNULL_END
