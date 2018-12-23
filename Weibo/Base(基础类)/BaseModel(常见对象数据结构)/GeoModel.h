//
//  GeoModel.h
//  Weibo
//  地理信息
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GeoModel : BaseModel

@property (nonatomic,strong) NSString *longitude;           //    经度坐标
@property (nonatomic,strong) NSString *latitude;            //    维度坐标
@property (nonatomic,strong) NSString *city;                //    所在城市的城市代码
@property (nonatomic,strong) NSString *province;            //    所在省份的省份代码
@property (nonatomic,strong) NSString *city_name;           //    所在城市的城市名称
@property (nonatomic,strong) NSString *province_name;       //    所在省份的省份名称
@property (nonatomic,strong) NSString *address;             //    所在的实际地址，可以为空
@property (nonatomic,strong) NSString *pinyin;              //    地址的汉语拼音，不是所有情况都会返回该字段
@property (nonatomic,strong) NSString *more;                //    更多信息，不是所有情况都会返回该字段

@end

NS_ASSUME_NONNULL_END
