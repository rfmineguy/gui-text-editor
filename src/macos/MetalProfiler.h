#import <Metal/Metal.h>

@interface MetalProfiler : NSObject
- (nonnull instancetype)init;

- (void)startCapture:(nullable id<MTLDevice>)device;
- (void)stopCapture;
@end
