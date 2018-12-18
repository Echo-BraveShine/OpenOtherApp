

#import "LinLangApi.h"

@interface LinLangApi()<NSCopying,NSMutableCopying>

/**
 使用单例对象保存回调
 */
@property (nonatomic,strong)LinLangApiHandle handle;

@end

@implementation LinLangApi

static LinLangApi *api = nil;

+(instancetype)shared
{
    @synchronized(self){
        if (!api) {
            api = [[super allocWithZone:nil]init];
        }
    }
    return api;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [LinLangApi shared];
}

-(id)copyWithZone:(NSZone *)zone{
    return [LinLangApi shared];
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return [LinLangApi shared];
}


+(BOOL)isLinLangAppInstalled
{
    NSURL *url = [NSURL URLWithString:LinLangScheme];
    return [[UIApplication sharedApplication]canOpenURL:url];
}

+(void)sendAuthWithScheme:(NSString *)scheme handle:(LinLangApiHandle)handle
{
    if (![self isLinLangAppInstalled]) {
        NSLog(@"未安装琳琅试用");
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/id1300479868?mt=8"]];
        return;
    }
    
    if (!scheme || scheme.length == 0) {
        NSLog(@"Scheme错误");
        return;
    }
    
    //拼接URL = 琳琅Scheme + bundleID + path + 参数(参数必须包含调用段Scheme)
    //linlnagShow://com.com.popularPig.discountsShow/linlangShowAuth?scheme=popluarPig
    
    [LinLangApi shared].handle = handle;
    NSDictionary *bundleInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleID = [bundleInfo objectForKey:@"CFBundleIdentifier"];
    NSString *http = [NSString stringWithFormat:@"%@%@%@?scheme=%@",LinLangScheme,bundleID,LinLangPath,scheme];
    NSURL *url = [NSURL URLWithString:http];
    [[UIApplication sharedApplication]openURL:url];
    
}

+(void)handleURL:(NSURL *)url
{
    // 如果不是琳琅的回调 不需处理
    if (![url.path isEqualToString:LinLangPath]) {
        return;
    }
    // 将琳琅返回的URL 分割成字典
    if ([LinLangApi shared].handle) {
        NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
        for (NSString *query in [[url query] componentsSeparatedByString:@"&"]) {
            NSArray *arr = [query componentsSeparatedByString:@"="];
            if (arr.count == 2) {
                [parameter setObject:arr.lastObject forKey:arr.firstObject];
            }
        }        
        //此处根据parameter 中的返回值进行接口请求 或者直接将琳琅返回的参数回调出去，在外部请求
        
        
        //将接口返回的信息回调出去
        [LinLangApi shared].handle(parameter);
        //完整的操作结束 handle 置为空
        [LinLangApi shared].handle = nil;
    }
}

@end
