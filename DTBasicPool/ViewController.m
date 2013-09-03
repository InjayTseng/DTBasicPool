//
//  ViewController.m
//  DTBasicPool
//
//  Created by David Tseng on 2/6/13.
//  Copyright (c) 2013 David Tseng. All rights reserved.
//


#define ResizableImage(name,top,left,bottom,right) [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(top,left,bottom,right)]

#define ResizableImageWithMode(name,top,left,bottom,right,mode) [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(top,left,bottom,right) resizingMode:mode]

#define FileToString(name,ext) [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)] encoding:NSUTF8StringEncoding error:nil]

#define canTel ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:"]])

#define tel(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]])

#define callAfterAsking(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",phoneNumber]]])



#define FileDictionary(name,ext) [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)]]
#define FileArray(name,ext) [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)]]


#import "ViewController.h"
#import "DTBasics.h"
#import "Person.h"
#import "AutoCoding.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"%@",[DTBasics pathSimulatorDocuments]);
//    NSArray *array = @[@"123",@"123123",@"343513",@"123123"];
//    [DTBasics logArrayContent:array withName:nil];
    //NSLog(@"content %@",FileToString(@"sample", @"html"));
    
    /*
    if (canTel) {
        callAfterAsking(@"0921469099");
    }else{
        NSLog(@"Can't call");
    }
    */
    /*
    NSArray * my_array = @[@"ABC",@"ABC2",@"ABC3",@"ABC4",@"ABC5"];
    if ([my_array writeToFile:@"my_array.plist" atomically:YES]) {
        NSLog(@"Success");
    }else{
        NSLog(@"Fail");
    }
     */
    
    //NSLog(@"%@",FileArray(@"data", @"plist"));
    [self writePlist];
    [self readPlist];
    
    //NSLog(@"%@",FileDictionary(@"data", @"plist"));
    Person *person = [[Person alloc]init];
    [person setAge:50];
    [person setFirstName:@"David"];
    [person setLastName:@"Tseng"];
    [person setNickName:@"Injay"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingString:@"/Person.plist"];
    
    [person writeToFile:filePath atomically:YES];
    
    NSLog(@"%@",[person dictionaryRepresentation]);
    
    
    //id personLoad;
    //[personLoad objectWithContentsOfFile:
     
     
     
    //personLoad =
    
    
}

- (void)readPlist
{
    
    //取得檔案路徑
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingString:@"/data.plist"];
    //
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *plistDict;
    if ([fileManager fileExistsAtPath: filePath]) //檢查檔案是否存在
    {
        plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }else{
        plistDict = [[NSMutableDictionary alloc] init];
    }
    NSString *value;
    value = [plistDict objectForKey:@"version"];
    NSLog(@"%@",value);
}


//存檔
- (void)writePlist
{
    //取得檔案路徑
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingString:@"/data.plist"];
    
    //
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *plistDict;
    if ([fileManager fileExistsAtPath: filePath]) //檢查檔案是否存在
    {
        plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }else{
        plistDict = [[NSMutableDictionary alloc] init];
    }
    
    
    [plistDict setValue:@"1.0.0" forKey:@"version"];
    
    //存檔
    if ([plistDict writeToFile:filePath atomically: YES]) {
        NSLog(@"writePlist success");
    } else {
        NSLog(@"writePlist fail");
    }
}

-(NSString*)getNSPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    return path;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
