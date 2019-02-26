//
//  Company.h
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Company : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *catchPhrase;
@property (nonatomic, strong) NSString *bs;
    
- (instancetype)initWithName:(NSString *)name
                 catchPhrase:(NSString *)catchPhrase
                          bs:(NSString *)bs;
+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
