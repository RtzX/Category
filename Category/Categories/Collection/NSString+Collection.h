//
//  NSString+Collection.h
//  Category
//
//  Created by Mu on 2019/3/22.
//  Copyright © 2019 Mu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICollectionAdapter.h"

@interface NSString (Collection) <ICollectionAdapter>
/**
 重复插入某个字符 count 次
 */
+ (NSString *)repeat:(NSString *)text count:(NSUInteger)count;
/**
 将NSString根据分隔符转换为NSArray
 */
- (NSArray *)explode:(NSString *)delimiter;
- (NSString *)initials;
/**
 将 例如 "1,000" 转化为 @(1000) 待测试
 */
- (NSNumber *)toNumber;
/**
 末位追加字符
 */
- (NSString *)append:(NSString *)append;

/**
 末位追加 `self` 字符串本身 abc => abcabc
 */
- (NSString *)prepend:(NSString *)prepend;

/**
 从from开始截取到最后
 
 @param from 如果from大于等于0 则 从Min(from, length) 开始截取
 如果from小于0 则 从Max(lenght + from, 0) 开始截取
 */
- (NSString *)substr:(int)from;
- (NSString *)substr:(int)from length:(int)length;

/**
 替换字符串
 
 @param character 旧内容
 @param replace 新内容
 */
- (NSString *)replace:(NSString *)character with:(NSString *)replace;
/**
 按正则表达式替换
 
 @param regexp 正则表达式
 @param replace 替换的内容. 新内容
 */
- (NSString *)replaceRegexp:(NSString *)regexp with:(NSString *)replace;

/**
 分离字符串 长度为1
 */
- (NSArray *)split;
- (NSArray *)split:(int)splitLength;

/**
 去除两端的空格
 */
- (NSString *)trim;

/**
 去除两端的空格和回车
 */
- (NSString *)trimWithNewLine;

/**
 去除左端的空格
 */
- (NSString *)trimLeft;
/**
 去除右端的空格
 */
- (NSString *)trimRight;

/**
 * 将 @"this text" 变成 @"thisText" or @"a_text" 变成 @"aText"
 */
- (NSString *)camelCase;

/**
 * 将 @"this text" 变成 @"ThisText" or @"a_text" 变成 @"AText"
 */
- (NSString *)pascalCase;

/**
 将 @"fooBar" 变成 @"foo_bar"
 */
- (NSString *)snakeCase;

/**
 * 首字母大写
 */
- (NSString *)ucFirst;

/**
 * 首字母小写
 */
- (NSString *)lcFirst;

/**
 本地化字符串折叠
 *字符折叠可以移除字母之间的区别，例如，字母折叠可以将大写字母替换成相应的小写字母；地区参数会影响折叠逻辑，例如，在土耳其当地，不区分字母大小写的比较会在 “I” to “ı” (U+0131 LATIN SMALL DOTLESS I)之间进行，而不会在“I”和正常的“i”之间进行。
 */
- (NSString *)withoutDiacritic;


/**
 所有数字和字母（大小写不分）都做编码  ios 9 以后的API
 */
- (NSString *)urlEncode;

/**
 做解码  ios 9 以后的API
 */
- (NSString *)urlDecode;
- (NSString *)md5;
- (NSString *)toBase64;

/**
 #ffffff 颜色
 */
+ (NSString *)fromHex:(NSString *)str;
- (NSString *)toHex;

/**
 末位字符比较 是否以某个字符串结尾
 */
- (BOOL)endsWith:(NSString *)compare;

/**
 起始字符比较 是否以某个字符串开头
 */
- (BOOL)startsWith:(NSString *)compare;
/**
 是否包含
 */
- (BOOL)contains:(NSString *)compare;

/**
 检查某个字符串是否匹配指定的正则表达式
 
 @param regexp 正则表达式
 @return 是否
 */
- (BOOL)matches:(NSString *)regexp;

/**
 在“源字符串”的末尾位置处拼接字符串“padString”，从使padString的padIndex所有位置处开始拼接，使“源字符串”的长度为newLength
 
 @param lenght  源字符串需要扩展到的长度
 大于原来长度，末尾插入
 等于原来长度，不做处理
 小于原来长度，截取处理
 @param string 需要拼接的子字符串
 @return 新的字符串
 */
- (NSString *)lpad:(int)lenght string:(NSString *)string;
- (NSString *)rpad:(int)lenght string:(NSString *)string;

@end
