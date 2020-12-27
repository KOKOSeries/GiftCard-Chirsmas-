//
//  WriteVC.m
//  GiftCard
//
//  Created by KOK on 25/12/2020.
//

#import "WriteVC.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import <MJExtension/MJExtension.h>
@interface WriteVC ()
@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UITextView *tv;

@end

@implementation WriteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)comment:(UIButton *)sender {
    [self network];
}

- (void)network{
    //    1. 创建一个url
    NSURL *url= [NSURL URLWithString: @"https://api.airtable.com/v0/appcfaNx6MJxu9bh7/wishstone"];
    //    2. 创建一个网络请求，网络请求不指定方法默认是GET
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    NSDictionary *dic = @{@"records":
                              @[@{@"fields":@{
                                          @"useremail":@"naiyuanyou@gmail.com",
                                          @"idea":@"opop",
                                          @"staus":@(0)
                              }
                              }
                              ]
                          
    };
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    
    [request setHTTPBody:[dic mj_JSONObject]];
    [request setValue:@"Bearer keyRQbKbSteI1Hvyn" forHTTPHeaderField:@"Authorization"];
    //    自定义请求配置
    NSURLSessionConfiguration *config = NSURLSessionConfiguration.defaultSessionConfiguration;
    config.timeoutIntervalForRequest = 4;// 请求超超时时间
    //    //...还有很多参数
    NSURLSession *session = [NSURLSession sessionWithConfiguration: config];
    //    3. 创建网络管理
//    NSURLSession *session = [NSURLSession sharedSession];

    //    4. 创建一个网络任务
    /*
        第一个参数 : 请求对象
        第二个参数 :
            completionHandler回调 ( 请求完成 ["成功"or"失败"] 的回调 )
            data : 响应体信息(期望的数据)
            response : 响应头信息,主要是对服务器端的描述
            error : 错误信息 , 如果请求失败 , 则error有值
    */
    NSURLSessionDataTask *task= [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // data就是服务器返回的数据,response为服务器的响应
        if(!error){
            // 强转为NSHTTPURLResponse

            NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
            if(res.statusCode == 200){
               // 更新UI必须回到主线程
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"成功");
                });
            }

        }else{
            NSLog(@"报错啦,%@",error);
        }
    }];
    //    5. 开启任务
    [task resume];
}

-(void)network2{
//    @{@"fields":@{
//                @"useremail":@"naiyuanyou@gmail.com",
//                @"idea":@"opop",
//                @"staus":@(0)
//    }
    
    NSDictionary *dic00 = @{@"useremail":@"naiyuanyou@gmail.com", @"idea":@"opop",@"staus":@(0)};
    NSString *dstr = [dic00 mj_JSONObject];
    
    NSDictionary *dic01 = @{@"fields":dstr};
    NSString *dstr01 = [dic01 mj_JSONObject];
    
    
    
    NSDictionary *dic =@{@"records":[@[dstr01] mj_JSONObject]};
    
    
    
    AFHTTPSessionManager *manager =  [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    NSURLSessionTask *task = [manager POST:@"" parameters:@"" headers:@"" progress: success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
    NSURLSessionDataTask *task = [manager POST:@"https://api.airtable.com/v0/appcfaNx6MJxu9bh7/wishstone" parameters:nil headers:@{@"Authorization":@"Bearer keyRQbKbSteI1Hvyn"} progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

    }];
//    [task resume];
}
- (void)network3{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLSessionDataTask *task = [manager GET:@"https://api.airtable.com/v0/appcfaNx6MJxu9bh7/wishstone?maxRecords=3&view=Grid%20view" parameters:nil headers:@{@"Authorization":@"Bearer keyRQbKbSteI1Hvyn"} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
