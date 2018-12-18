

#import "ViewController.h"
#import "LinLangApi.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSLog(@"scheme--%@",[[NSBundle mainBundle] infoDictionary]);
//    [LinLangApi shared];
}

- (IBAction)open:(id)sender {
}
- (IBAction)openWXApp:(UIButton *)sender {
//    [self demo1];
//    [self demo2];
    [self demo3];
}

//直接打开WXApp
- (void)demo1 {
    //创建一个url，这个url就是WXApp的url，记得加上：//
    NSURL *url = [NSURL URLWithString:@"weixin://"];
    
    //打开url
    [[UIApplication sharedApplication] openURL:url];
}

//先判断再打开WXApp
- (void)demo2 {
    //创建一个url，这个url就是WXApp的url，记得加上：//
    NSURL *url = [NSURL URLWithString:@"weixin://"];
    
    //先判断是否能打开该url
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        //打开url
        [[UIApplication sharedApplication] openURL:url];
    } else {
        //给个提示或者做点别的事情
        NSLog(@"U四不四洒，没安装WXApp，怎么打开啊！");
    }
}

//使用URL Schemes传递数据
- (void)demo3 {
    [LinLangApi sendAuthWithScheme:@"popluarPig" handle:^(id parameter) {
        NSLog(@"%@",parameter);
    }];

    
    //    创建一个url，这个url就是WXApp的url，记得加上：//
//    NSURL *url = [NSURL URLWithString:@"linlangShow://www.shixueqian.com/abc?title=hello&content=helloworld"];
//    //打开url
//    [[UIApplication sharedApplication] openURL:url];
//
}

@end
