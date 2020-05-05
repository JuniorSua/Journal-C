//
//  Entry.h
//  Journal-C
//
//  Created by Junior Suarez-Leyva on 5/4/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject 

@property (nonatomic, strong) NSDate * timeStamp;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * bodyText;

- (instancetype) initWithTitle:(NSString *)title bodyText:(NSString *)bodyText;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;


@end

NS_ASSUME_NONNULL_END
