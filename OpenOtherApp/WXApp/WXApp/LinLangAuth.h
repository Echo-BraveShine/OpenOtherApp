

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^LinLangAuthHandle)(id parameter);

@interface LinLangAuth : NSObject<NSCopying,NSMutableCopying>

//@property (nonatomic,strong)LinLangAuthHandle handle;

@property (nonatomic,strong)NSURL *url;

@property (nonatomic,strong)NSMutableDictionary *parameter;


//+(instancetype)shared;

+(void)handleURL:(NSURL *)url;

+(void)authInfoWithToken:(NSString *)token;

+(void)cancelAuth;

@end
