//
//  PostDetail.h
//  Synopsis
//
//  Created by Bojan Markovic on 26/02/2019.
//  Copyright © 2019 Bojan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
#import "Company.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostDetail : NSObject
    
@property NSInteger uid; // unique id
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) Address *address;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) Company *company;
    

- (instancetype)initWithName:(NSString *)name
                    username:(NSString *)username
                       email:(NSString *)email
                     address:(Address *)address
                       phone:(NSString *)phone
                     website:(NSString *)website
                     company:(NSString *)company;
+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
