# Swift Package of GCDWebServer
based on [swisspol/GCDWebServer](https://github.com/swisspol/GCDWebServer).

> GCDWebServer is a modern and lightweight GCD based HTTP 1.1 server designed to be embedded in iOS, macOS & tvOS apps.

## Hello World Example
Open File > Add Package and
Paste the URL into top right search `https://github.com/yene/GCDWebServer`

```Swift
import UIKit
import GCDWebServer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  let webServer = GCDWebServer()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    webServer.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self, processBlock: {request in
      return GCDWebServerDataResponse(html:"<html><body><p>Hello World</p></body></html>")
    })
    webServer.start(withPort: 8080, bonjourName: "GCD Web Server")
    print("Visit \(webServer.serverURL) in your web browser")
    return true
  }
  // ...
}
```

## Serving Static Directory
Drag the folder containing your html files into the Xcode project.
In this example the folder is called `dist` and has an `index.html` file inside.

> During development make sure to disable cache.

```Swift
import UIKit
import GCDWebServer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	let webServer = GCDWebServer()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		let subdir = Bundle.main.resourceURL!.appendingPathComponent("dist").path
		webServer.addGETHandler(forBasePath: "/", directoryPath: subdir, indexFilename: "index.html", cacheAge: 3600, allowRangeRequests: true)
		webServer.start(withPort: 8080, bonjourName: "GCD Web Server")
		print("Visit \(webServer.serverURL) in your web browser")
		return true
	}
  // ...
}

```
