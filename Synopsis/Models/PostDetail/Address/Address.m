//
//  Address.m
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import "Address.h"

@implementation Address
    
- (instancetype)initWithStreet:(NSString *)street
                         suite:(NSString *)suite
                          city:(NSString *)city
                       zipcode:(NSString *)zipcode
                           geo:(Geo *)geo {
    
    if ((self = super.init)) {
        _suite = suite;
        _city = city;
        _zipcode = zipcode;
        _geo = geo;
    }
    
    return self;
}
    
+ (instancetype)fromDictionary:(NSDictionary *)dict {
    if (dict == nil) {
        return nil;
    }
    
    return [self.alloc initWithStreet:dict[@"street"]
                                suite:dict[@"suite"]
                                 city:dict[@"city"]
                              zipcode:dict[@"zipcode"]
                                  geo:[Geo fromDictionary:dict[@"geo"]]];
}

@end
