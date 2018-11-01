# LoginWithAmazoniOSSwift
Login with Amazon iOS Swift implementation. This solution utilizes the Amazon provided static framework written in Objective-C and uses a proxy to interface our Swift app to communicate with the Login with Amazon library. 

# Get Started
1. Clone this repo
2. Add your App Identifier to the Xcode project. This should be the same App Identifier you provided Login with Amazon
3. Add your own iOS API Key for the "APIKey" in the Info.plist
4. Update the URL Schemes to match your App Identifier

Build and run the app. If the above information is correct, the user can tap on the "Login with Amazon" button and should be redirected
to the Amazon site to provide their Amazon credentials.
