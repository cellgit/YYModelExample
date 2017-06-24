//
//  UserModel.m
//  YYModelUseExample
//
//  Created by zyhy on 2017/6/23.
//  Copyright © 2017年 刘宏立. All rights reserved.
//

#import "UserModel.h"


@implementation User

@end


@implementation Author

@end


@implementation UserModel

@end



@implementation Book
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"n",
             @"page" : @"p",
             @"desc" : @"ext.desc",
             @"bookID" : @[@"id",@"ID",@"book_id"]};
}
@end







