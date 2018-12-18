

#import "ViewController.h"
#import "LinLangAuth.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
}
- (IBAction)cancel:(id)sender {
    [LinLangAuth cancelAuth];
}

- (IBAction)open:(UIButton *)sender {
    
    [LinLangAuth authInfoWithToken:@"token123"];
    
    //创建一个url，这个url就是WXApp的url，记得加上：//
//    NSURL *url = [NSURL URLWithString:@"MyApp://www.shixueqian.com/abc?title=hello&content=helloworld"];
//    //打开url
//    [[UIApplication sharedApplication] openURL:url];
//    NSDictionary *dic = @{@"name":@"joy",
//                          @"age":@(10),
//                          @"info":@{@"height":@(140.6)},
//                          @"study":@[@"yuwen",@"数学"],
//                          };
//
//    NSLog(@"%@",dic);
//    NSString *str = [LinLangAuth convertToStringWithJSONObject:dic];
//
//    NSString *url = [NSString stringWithFormat:@"MyApp://%@",str];
//    url = [url stringByAppendingString:str];
//    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
////    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
////    req
//    NSLog(@"%@",url);
//    NSURL *u = [NSURL URLWithString:url];
//    NSLog(@"%@",u);
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url]];
}


@end
