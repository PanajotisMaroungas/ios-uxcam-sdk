// swift-tools-version:5.3
import PackageDescription

let package = Package(
    
    name: "UXCam",
    
    platforms: 
    [
        .iOS(.v9)
    ],
    
    products: 
    [
        .library(
            name: "UXCam", 
            targets: ["UXCamWrapper"])
    ],
    
    targets: 
    [
		.target(
				name: "UXCamWrapper",
		    	dependencies: 
      			[
			        .target(name: "UXCamFW", condition: .when(platforms: .some([.iOS])))
				],
				path: "UXCamWrapper",
				linkerSettings: 
				[
					.linkedFramework("AVFoundation"),
					.linkedFramework("CoreGraphics"),
					.linkedFramework("CoreMedia"),
					.linkedFramework("CoreVideo"),
					.linkedFramework("CoreTelephony"),
					.linkedFramework("MobileCoreServices"),
					.linkedFramework("QuartzCore"),
					.linkedFramework("Security"),
					.linkedFramework("SystemConfiguration"),
					.linkedFramework("WebKit"),
					.linkedLibrary("z"),
					.linkedLibrary("iconv")
				]
		),
		
        .binaryTarget(
            name: "UXCamFW", 
            //path: "Framework/UXCam.xcframework"
			url: "https://github.com/uxcam/ios-sdk/UXCam.xcframework.zip",
			checksum: "1179d7d02396e5c3584830a5924ee6078e956e3a1f15cad96af1f71de2c5b6a1"
		)
    ]
)
        
