//
//  JADataModel.m
//  JATableCellNestTableDemo
//
//  Created by JasoneIo on 16/6/27.
//  Copyright © 2016年 littleBoy. All rights reserved.
//

#import "JADataModel.h"

@implementation picurls

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.img = dict[@"img"];
    }
    return self;
}

+ (instancetype)picUrlWithDict:(NSDictionary *)dict
{
    return  [[self alloc] initWithDict:dict];
}

@end

@implementation dayjourney
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.theme = dict[@"theme"];
        self.content = dict[@"content"];
        self.journeyrange = dict[@"journeyrange"];
        self.picurls = dict[@"picurls"];
        NSMutableArray <picurls*> *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in self.picurls) {
            [tempArr addObject:[picurls picUrlWithDict:dict]];
        }
        self.picurls = tempArr;
    }
    return self;
}

+ (instancetype)dayJourneyWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end

@implementation JADataModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.outday = dict[@"outday"];
        self.title = dict[@"title"];
        self.dayjourney = dict[@"dayjourney"];
        NSMutableArray <dayjourney*>* tempArr = [NSMutableArray array];
        for (NSDictionary *dict in self.dayjourney) {
            [tempArr addObject:[dayjourney dayJourneyWithDict:dict]];
        }
        self.dayjourney = tempArr;
    }
    return self;
}

+ (instancetype)dataModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)fetchDataModelList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        [arrM addObject:[self dataModelWithDict:dict]];
    }
    return arrM;
}
@end
