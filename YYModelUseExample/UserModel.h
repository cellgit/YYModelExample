//
//  UserModel.h
//  YYModelUseExample
//
//  Created by zyhy on 2017/6/23.
//  Copyright © 2017年 刘宏立. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - User
@interface User : NSObject

@property (nonatomic, assign) UInt64 uid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSDate *created;

@end

#pragma mark - Author
@interface Author : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *birthday;

@end

#pragma mark - UserModel
@interface UserModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger pages;
@property (nonatomic, strong) Author *author;

@end


#pragma mark - Book
@interface Book : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *bookID;

@end




