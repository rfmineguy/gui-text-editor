#import <Metal/Metal.h>

@interface MetalProfiler : NSObject
- (nonnull instancetype)init;

- (void)startCapture:(nullable NSString*)loc device:(nullable id<MTLDevice>)device;
- (void)stopCapture;
@end
