

#import "LinLangAuth.h"


@implementation LinLangAuth

static LinLangAuth *auth = nil;

+(instancetype)shared
{
    @synchronized(self){
        if (!auth) {
            auth = [[super allocWithZone:nil]init];
        }
    }
    return auth;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [LinLangAuth shared];
}
-(id)copyWithZone:(NSZone *)zone{
    return [LinLangAuth shared];
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return [LinLangAuth shared];
}



+(void)handleURL:(NSURL *)url
{
    //linlnagShow://com.com.popularPig.discountsShow/linlangShowAuth?scheme=popluarPig
    //不是授权的话return
    if (![url.path isEqualToString:@"/linlangShowAuth"]) {
        return;
    }
    [LinLangAuth shared];
    
    auth.url = url;
    auth.parameter = [NSMutableDictionary dictionary];

    for (NSString *query in [[url query] componentsSeparatedByString:@"&"]) {
        NSArray *arr = [query componentsSeparatedByString:@"="];
        if (arr.count == 2) {
            [auth.parameter setObject:arr.lastObject forKey:arr.firstObject];
        }
    }
    
    //如果已经登录，弹出授权页面
    //如果未登录 先进入登录  再弹出授权页面
    if (1) {
        [self showAuthViewController];
    }else{
        //登录
    }
}

+(void)showAuthViewController
{
    
}

+(void)authInfoWithToken:(NSString *)token
{
    if (auth.parameter[@"scheme"]) {
        NSDictionary *bundleInfo = [[NSBundle mainBundle] infoDictionary];
        NSString *bundleID = [bundleInfo objectForKey:@"CFBundleIdentifier"];
        //popluarPig://com.linlang.show/linlangShowAuth?token=xxxx
        NSString *urlString = [NSString stringWithFormat:@"%@://%@/linlangShowAuth?token=%@",auth.parameter[@"scheme"],bundleID,token];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlString]];
        auth.parameter = nil;
    }
   
}
+(void)cancelAuth
{
    if (auth.parameter[@"scheme"]) {
        NSString *url = [NSString stringWithFormat:@"%@://",auth.parameter[@"scheme"]];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url]];
        auth.parameter = nil;
    }
}



@end
