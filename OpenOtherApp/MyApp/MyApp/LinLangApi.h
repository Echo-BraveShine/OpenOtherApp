

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define LinLangScheme  @"linlangShow://" //琳琅的URLScheme
#define LinLangPath @"/linlangShowAuth"  //与琳琅交互试用的URL.path


/**
 用于第三方登录的回调  用完就置为空
 
 @param parameter 回传参数 为保证兼容使用id 类型
 */
typedef void(^LinLangApiHandle)(id parameter);

@interface LinLangApi : NSObject


/**
 检测是否安装琳琅APP

 @return 是否安装琳琅试用
 */
+(BOOL)isLinLangAppInstalled;


/**
 发送调用

 @param scheme 调用端的Scheme Scheme必须正确(不需要://)
 @param handle 调用成功回传参数 拒绝授权handle参数为nil 或者空字典
 */
+(void)sendAuthWithScheme:(NSString *)scheme handle:(LinLangApiHandle)handle;

/**
 application 中被琳琅打开的回调拦截
 根据url.path 判断是否为琳琅app的回调

 @param url 回调的URL
 */
+(void)handleURL:(NSURL *)url;


@end
