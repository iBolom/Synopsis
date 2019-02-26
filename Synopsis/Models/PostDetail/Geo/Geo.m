//
//  Geo.m
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import "Geo.h"

@implementation Geo
    
- (instancetype)initWithLatitude:(NSString *)latitude
                       longitude:(NSString *)longitude {
    
    if ((self = super.init)) {
        _latitude = latitude;
        _longitude = longitude;
    }
    
    return self;
}
    
+ (instancetype)fromDictionary:(NSDictionary *)dict {
    if (dict == nil) {
        return nil;
    }
    
    return [self.alloc initWithLatitude:dict[@"lat"]
                              longitude:dict[@"lng"]];
}

@end
