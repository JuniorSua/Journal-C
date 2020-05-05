//
//  Entry.m
//  Journal-C
//
//  Created by Junior Suarez-Leyva on 5/4/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import "Entry.h"

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimestampKey = @"timestamp";

@implementation Entry

- (instancetype)initWithTitle:(nonnull NSString *)title bodyText:(nonnull NSString *)bodyText
{
    self = [super init];
    if (self)
    {
        _timeStamp = [NSDate date];
        _title = title;
        _bodyText = bodyText;
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *text = dictionary[TextKey];
    return [self initWithTitle:title bodyText:text];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title,
             TextKey: self.bodyText,
             TimestampKey: self.timeStamp };
    
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[Entry class]]) { return NO;}
    
    return [[self dictionaryRepresentation] isEqualToDictionary:[(Entry *)object dictionaryRepresentation]];
}

@end
