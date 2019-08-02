#import "IosListViewPlugin.h"
#import <ios_list_view/ios_list_view-Swift.h>

@implementation IosListViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [registrar registerViewFactory: [[IosListVIewFactory alloc] initWithMessenger:[registrar messenger]] withId:@"plugins/ios_list_view"];
}
@end
