//
//  Geo.h
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Geo : NSObject
    
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
    
- (instancetype)initWithLatitude:(NSString *)latitude
                       longitude:(NSString *)longitude;
+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
