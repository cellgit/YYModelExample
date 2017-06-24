//
//  ViewController.m
//  YYModelUseExample
//
//  Created by zyhy on 2017/6/23.
//  Copyright © 2017年 刘宏立. All rights reserved.
//

#import "ViewController.h"
#import <YYModel.h>
#import "UserModel.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self jsonToModel];       // json转模型
    [self setToJson];         // 集合(字典,数组)转json
    [self modelToJson];       // 模型转json
}



////****************** 转换成 model ******************////
- (void)jsonToModel {
    [self parseJsonToModelWithSimpleDict];                // 简单的字典模型 json
    [self parseJsonToModelWithDictInDict];                // 字典中含有字典的 json
    [self parseJsonToModelWithArrayInDict];               // 字典中含有数组的 json
    [self parseJsonToModelWithKeyDifferentProperty];       // 字典中的key和模型中属性名不一致的json(映射)
}
#pragma mark - 简单的字典 json
- (NSString *)loadJsonDataWithSimpleDict {
    NSString *json = @"{\"uid\":123456,\"name\":\"Harry\",\"created\":\"1965-07-31T00:00:00+0000\"}";
    return json;
}
- (void)parseJsonToModelWithSimpleDict {
    NSString *json = [self loadJsonDataWithSimpleDict];
    User *user =  [User yy_modelWithJSON:json];
    NSLog(@"SimpleDict >>>>>>>>>>>>>>>: User = %@, userModel, User.uid = %zd, User.name = %@, User.created = %@", user, user.uid, user.name, user.created);
}
#pragma mark - 字典转模型 - 字典中含有字典的 json
- (NSString *)loadJsonDataWithDictInDict {
    NSString *json = @"{\"author\":{\"name\":\"J.K.Rowling\",\"birthday\":\"1965-07-31T00:00:00+0000\"},\"name\":\"Harry Potter\",\"pages\":256}";
//    NSLog(@"json == %@", json);
    return json;
}
- (void)parseJsonToModelWithDictInDict {
    NSString *json = [self loadJsonDataWithDictInDict];
    UserModel *userModel =  [UserModel yy_modelWithJSON:json];
    NSLog(@"DictInDict >>>>>>>>>>>>>>>: userModel = %@, userModel, userModel.name = %@, userModel.pages = %zd, userModel.author.name = %@, userModel.author.birthday = %@, userModel.author = %@", userModel, userModel.name, userModel.pages, userModel.author.name, userModel.author.birthday, userModel.author);
}
#pragma mark - 字典转模型 - 字典中含有数组的 json
- (NSString *)loadJsonDataWithArrayInDict {
    NSString *json = @"{\"author\":[{\"name\":\"J.K.Rowling\",\"birthday\":\"1965-07-31T00:00:00+0000\"}],\"name\":\"Harry Potter\",\"pages\":256}";
//    NSLog(@"json == %@", json);
    return json;
}
- (void)parseJsonToModelWithArrayInDict {
    NSString *json = [self loadJsonDataWithDictInDict];
    UserModel *userModel =  [UserModel yy_modelWithJSON:json];
    NSLog(@"ArrayInDict >>>>>>>>>>>>>>>: userModel = %@, userModel, userModel.name = %@, userModel.pages = %zd, userModel.author.name = %@, userModel.author.birthday = %@, userModel.author = %@", userModel, userModel.name, userModel.pages, userModel.author.name, userModel.author.birthday, userModel.author);
}
#pragma mark - 字典中的 key 和模型的属性名不相同时, 通过映射进行字典转模型
- (NSString *)loadDictDataKeyDifferentBetweenProperty {
    
    NSString *json = @"{\"n\":\"Harry Pottery\",\"p\": 256,\"ext\" : {\"desc\" : \"A book written by J.K.Rowing.\"},\"ID\" : 100010}";
    return json;
}
- (void)parseJsonToModelWithKeyDifferentProperty {
    NSString *json = [self loadDictDataKeyDifferentBetweenProperty];
    Book *book = [Book yy_modelWithJSON:json];
    NSLog(@"KeyDifferentBetweenProperty >>>>>>> book = %@, book.name = %@, book.page = %zd, book.desc = %@, book.bookID = %@", book,book.name, book.page, book.desc, book.bookID);
}



////****************** 集合(字典,数组)转换成 json ******************////
- (void)setToJson {
    [self parseDictToJsonWithSimpleDict];
    [self parseDictToJsonWithDictInDict];
    [self parseDictToJsonWithArrayInDict];
}
#pragma mark - 简单的字典转换成 json
- (NSDictionary *)loadDictDataWithSimpleDict {
    NSDictionary *dict = @{
                           @"uid":@"123456",
                           @"name":@"Harry",
                           @"created":@"1965-07-31T00:00:00+0000"
                           };
    return dict;
}
- (void)parseDictToJsonWithSimpleDict {
    NSDictionary *dict = [self loadDictDataWithSimpleDict];
    NSString *json = [dict yy_modelToJSONString];
    NSLog(@"DictToJsonWithSimpleDict >>>>>>> %@", json);
}


#pragma mark - 字典中含有字典转换成 json
- (NSDictionary *)loadDictDataWithDictInDict {
    NSDictionary *dict = @{
                           @"author":@{
                                   @"name":@"J.K.Rowling",
                                   @"birthday":@"1965-07-31T00:00:00+0000"
                                   },
                           @"name":@"Harry Potter",
                           @"pages":@"256"
                           };
    return dict;
}
- (void)parseDictToJsonWithDictInDict {
    NSDictionary *dict = [self loadDictDataWithDictInDict];
    NSString *json = [dict yy_modelToJSONString];
    NSLog(@"DictToJsonWithDictInDict >>>>>>> %@", json);
}

#pragma mark - 字典中含有数组转换成 json
- (NSDictionary *)loadDictDataWithArrayInDict {
    NSDictionary *dict = @{
                           @"author":@[@{
                                   @"name":@"J.K.Rowling",
                                   @"birthday":@"1965-07-31T00:00:00+0000"
                                   }],
                           @"name":@"Harry Potter",
                           @"pages":@"256"
                           };
    return dict;
}
- (void)parseDictToJsonWithArrayInDict {
    NSDictionary *dict = [self loadDictDataWithArrayInDict];
    NSString *json = [dict yy_modelToJSONString];
    NSLog(@"DictToJsonWithDictInDict >>>>>>> %@", json);
}


////****************** 模型转换成 json ******************////
- (void)modelToJson {
    [self parseModelToJsonWithSimpleDict];
}
#pragma mark - 简单的字典模型转成 json
- (User *)parseJsonToModelWithSimpleDictReturnModel {
    NSString *json = [self loadJsonDataWithSimpleDict];
    User *user =  [User yy_modelWithJSON:json];
    NSLog(@"SimpleDict >>>>>>>>>>>>>>>: User = %@, userModel, User.uid = %zd, User.name = %@, User.created = %@", user, user.uid, user.name, user.created);
    return user;
}
- (void)parseModelToJsonWithSimpleDict {
    User *user = [self parseJsonToModelWithSimpleDictReturnModel];
    NSString *json = [user yy_modelToJSONString];
    NSLog(@"modelToJsonWithSimpleDict >>>>>>> %@", json);
}
#pragma mark - 字典中含有字典模型转成 json
- (User *)parseJsonToModelWithDictInDictReturnModel {
    NSString *json = [self loadJsonDataWithSimpleDict];
    User *user =  [User yy_modelWithJSON:json];
    NSLog(@"SimpleDict >>>>>>>>>>>>>>>: User = %@, userModel, User.uid = %zd, User.name = %@, User.created = %@", user, user.uid, user.name, user.created);
    return user;
}
- (void)parseModelToJsonWithDictInDict {
    User *user = [self parseJsonToModelWithSimpleDictReturnModel];
    NSString *json = [user yy_modelToJSONString];
    NSLog(@"modelToJsonWithSimpleDict >>>>>>> %@", json);
}






@end
