#import "MetalProfiler.h"

@implementation MetalProfiler {
}

- (instancetype)init {
	self = [super init];
	if (self) {
		MTLCaptureManager* capture = [MTLCaptureManager sharedCaptureManager];
		if ([capture supportsDestination: MTLCaptureDestinationGPUTraceDocument]) {
		  NSLog(@"MetalProfiler: Doesn't support trace doc");
		}
		else {
			NSLog(@"MetalProfiler: Supports trace doc");
		}
	}
	return self;
}
- (void)startCapture:(nullable id<MTLDevice>)device {
	// Create a capture descriptor
	NSFileManager *fm = [NSFileManager defaultManager];
	NSArray *docsDirs = [fm URLsForDirectory:NSDocumentDirectory inDomains: NSUserDomainMask];
	NSURL *docsDir = docsDirs[0];
	NSString *docsPath = [docsDir path];
	
	NSString *savePath = [docsPath stringByAppendingString: @"/capture.gputrace"];
	NSURL *pURL = [[NSURL alloc] initFileURLWithPath: savePath];

	NSError *error = nil;

	// Delete the file at the specified path
	NSLog(@"pURL: %@", pURL);
	BOOL success = [fm removeItemAtURL:pURL error:&error];
	if (success) {
		NSLog(@"File deleted successfully. %@, pURL: %@", savePath, pURL);
	} else {
		NSLog(@"No capture file to remove %@", error.localizedDescription);
	}

	// MTLCaptureManager *captureManager = [MTLCaptureManager sharedCaptureManager];
	// if ([captureManager supportsDestination:MTLCaptureDestinationGPUTraceDocument]) {
	// 	NSLog(@"Supports GPU Trace doc");
	// }
	// else {
	// 	NSLog(@"WARNING: Doesn't support GPU Trace doc");
	// 	return;
	// }

	MTLCaptureDescriptor *captureDescriptor = [[MTLCaptureDescriptor alloc] init];
	captureDescriptor.captureObject = device;
	captureDescriptor.destination = MTLCaptureDestinationGPUTraceDocument;
	captureDescriptor.outputURL = pURL;

	@try {
			// Start the capture
			NSError *error;
			[[MTLCaptureManager sharedCaptureManager] startCaptureWithDescriptor:captureDescriptor error:&error];
			[captureDescriptor dealloc];
			NSLog(@"[MetalView] Started capture: %@", error);
	} @catch (NSException *exception) {
			NSLog(@"Error when trying to capture: %@", exception);
			abort();
	}
}
- (void)stopCapture {
	MTLCaptureManager* captureMannager = [MTLCaptureManager sharedCaptureManager];
	[captureMannager stopCapture];
	NSLog(@"Stopped capturing");
}
@end
