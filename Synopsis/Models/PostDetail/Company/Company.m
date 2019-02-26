//
//  Company.m
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import "Company.h"

@implementation Company
    
- (instancetype)initWithName:(NSString *)name
                 catchPhrase:(NSString *)catchPhrase
                          bs:(NSString *)bs {
    
    if ((self = super.init)) {
        _name = name;
        _catchPhrase = catchPhrase;
        _bs = bs;
    }
    
    return self;
}
+ (instancetype)fromDictionary:(NSDictionary *)dict {
    if (dict == nil) {
        return nil;
    }
    
    return [self.alloc initWithName:dict[@"name"]
                        catchPhrase:dict[@"catchPhrase"]
                                 bs:dict[@"bs"]];
}

@end
