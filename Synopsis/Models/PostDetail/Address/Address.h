//
//  Address.h
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Geo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Address : NSObject
    
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *suite;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) Geo *geo;
    
    
- (instancetype)initWithStreet:(NSString *)street
                         suite:(NSString *)suite
                          city:(NSString *)city
                       zipcode:(NSString *)zipcode
                           geo:(Geo *)geo;
    
+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
