//
//  EntryController.m
//  Journal-C
//
//  Created by Junior Suarez-Leyva on 5/4/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"

static NSString * const EntriesKey = @"entries";

@interface EntryController ()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end


@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)entries { return _internalEntries; }

- (void) addEntry:(Entry *)entry
{
    [_internalEntries addObject:entry];
}

- (void) removeEntry:(Entry *)entry
{
    [_internalEntries removeObject:entry];
}


- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];

    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }

    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries)
    {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

@end
