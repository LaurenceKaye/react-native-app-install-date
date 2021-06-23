#import "AppInstallDate.h"

@implementation AppInstallDate

RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_REMAP_METHOD(getInstallDateTime,
                 getInstallDateTimeWithFormat:(nonnull NSString*)format
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSURL* urlToDocumentsFolder = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
  __autoreleasing NSError *error;
  NSString *mainBundlePath = [[NSBundle mainBundle] bundlePath]
  NSDate *installDate = [[[NSFileManager defaultManager] attributesOfItemAtPath:mainBundlePath error:&error] objectForKey:NSFileCreationDate];
  
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:format];
  
  NSString *stringDate = [dateFormatter stringFromDate:installDate];

  resolve(stringDate);
}

RCT_REMAP_METHOD(getUpdateDateTime,
                 getUpdateDateTimeWithFormat:(nonnull NSString*)format
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSURL* urlToDocumentsFolder = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
  __autoreleasing NSError *error;
  NSString *mainBundlePath = [[NSBundle mainBundle] bundlePath]
  NSDate *updateDate = [[[NSFileManager defaultManager] attributesOfItemAtPath:mainBundlePath error:&error] objectForKey:NSFileModificationDate];
  
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:format];
  
  NSString *stringDate = [dateFormatter stringFromDate:updateDate];

  resolve(stringDate);
}

@end
