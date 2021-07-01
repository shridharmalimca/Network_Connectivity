#import "NetworkConnectivityPlugin.h"
#if __has_include(<network_connectivity/network_connectivity-Swift.h>)
#import <network_connectivity/network_connectivity-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "network_connectivity-Swift.h"
#endif

@implementation NetworkConnectivityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNetworkConnectivityPlugin registerWithRegistrar:registrar];
}
@end
