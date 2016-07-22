//
//  AppContext.h
//  app框架
//
//  Created by 😄咔咔 on 16/6/1.
//  Copyright © 2016年 -LimingZou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FMTAppEnvironmentType) {
    FMTAppEnvironmentTypeDEV = 0,
    FMTAppEnvironmentTypeGQC = 1,
    FMTAppEnvironmentTypePRE = 2,
    FMTAppEnvironmentTypePRD = 3
};


static inline NSString *FMTStringFromAppEnvironmentType(FMTAppEnvironmentType type) {
    switch (type) {
        case FMTAppEnvironmentTypeDEV: {
            return @"开发(DEV)环境";
            break;
        }
        case FMTAppEnvironmentTypeGQC: {
            return @"测试(GQC)环境";
            break;
        }
        case FMTAppEnvironmentTypePRE: {
            return @"预生产(PRE)环境";
            break;
        }
        case FMTAppEnvironmentTypePRD: {
            return @"生产(PRD)环境";
            break;
        }
    }
}


@interface AppContext : NSObject


NS_ASSUME_NONNULL_END

@end
