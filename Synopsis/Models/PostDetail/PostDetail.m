//
//  PostDetail.m
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import "PostDetail.h"

@implementation PostDetail
    
- (instancetype)initWithName:(NSString *)name
                    username:(NSString *)username
                       email:(NSString *)email
                     address:(Address *)address
                       phone:(NSString *)phone
                     website:(NSString *)website
                     company:(Company *)company {
    
    if ((self = super.init)) {
        _name = name;
        _username = username;
        _email = email;
        _address = address;
        _phone = phone;
        _website = website;
        _company = company;
    }
    
    return self;
}
    
+ (instancetype)fromDictionary:(NSDictionary *)dict {
    if (dict == nil) {
        return nil;
    }
    
    return [self.alloc initWithName:dict[@"name"]
                           username:dict[@"username"]
                              email:dict[@"email"]
                            address:[Address fromDictionary:dict[@"address"]]
                              phone:dict[@"phone"]
                            website:dict[@"website"]
                            company:[Company fromDictionary:dict[@"company"]]];
}
@end
