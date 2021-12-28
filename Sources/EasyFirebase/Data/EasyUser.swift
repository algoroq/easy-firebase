//
//  EasyUser.swift
//  
//
//  Created by Ben Myers on 10/30/21.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseMessaging

/**
 A fundamental user object.
 
 Extend your own user class from the `EasyUser` protocol to quickly create user objects that are compatabile with `EasyAuth`.
 
 All user objects come with `lastSignon`, `displayName`, `username`, `email`, `appVersion`, `deviceToken`, and `progress` support.
 
 ```swift
 class MyUser: EasyUser {
   
   var lastSignon: Date
   var displayName: String
   var username: String
   var email: String
   var appVersion: String
   var deviceToken: String?
   var id: String
   var dateCreated: Date
   var progress: Int
 
   var balance: Int = 0
      
   func addBalance() {
     balance += 1
   }
 }
 ```
 */
@available(iOS 13.0, *)
public protocol EasyUser: Document {
  
  // MARK: - Properties
  
  /// The user's last signon date.
  ///
  /// This value is automatically updated each time the user logs into your application.
  var lastSignon: Date { get set }
  
  /// The user's display name.
  ///
  /// This value is automatically updated to a suggested display name when an account is created.
  var displayName: String { get set }
  
  /// The user's username.
  ///
  /// This value is automatically generated based on the user's email upon account creation.
  var username: String { get set }
  
  /// The user's email address.
  var email: String { get set }
  
  /// The user's last logged-in app version.
  ///
  /// This value is automatically updated when the user logs in.
  var appVersion: String { get set }
  
  /// The user's FCM device token.
  ///
  /// This value is automatically updated.
  var deviceToken: String? { get set }
  
  /// The user's app progression.
  ///
  /// This is a utility variable that you can use to keep track of tutorial progress, user progression, etc.
  ///
  /// There are a few preset values:
  ///
  /// - `-1` means the user has just been initalized.
  /// - `0` means the user data has been pushed to Firestore.
  /// - `1` and above are values you can customize.
  var progress: Int { get set }
  
  // MARK: - Initalizers
  
  init()
}

@available(iOS 13.0, *)
extension EasyUser {
  
  // MARK: - Initalizers
  
  public init?(from user: User) {
    guard let email = user.email else { return nil }
    self.init()
    id = user.uid
    lastSignon = Date()
    username = email.removeDomainFromEmail()
    displayName = user.displayName ?? username
    self.email = email
    appVersion = Bundle.versionString
    deviceToken = Messaging.messaging().fcmToken
    progress = -1
  }
}
