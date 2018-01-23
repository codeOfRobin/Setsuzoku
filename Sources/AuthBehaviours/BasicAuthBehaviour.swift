//
//  BasicAuthBehaviour.swift
//  NetworkingTests_iOS
//
//  Created by Robin Malhotra on 20/01/18.
//

import Foundation


/// Authenticates using Basic Authentication, it converts username:password to Base64 then sets the Authorization header to "Basic \(Base64(username:password))".
///
/// - Parameters:
///   - username: The username to be used.
///   - password: The password to be used.


struct BasicAuthBehaviour: RequestBehavior {

	let username: String
	let password: String

	func adapt(_ request: URLRequest) -> URLRequest {
		var copy = request
		let credentialsString = "\(username):\(password)"
		if let credentialsData = credentialsString.data(using: .utf8) {
			let base64Credentials = credentialsData.base64EncodedString()
			let authString = "Basic \(base64Credentials)"
			var headers = copy.allHTTPHeaderFields ?? [:]
			headers["Authorization"] = authString
			copy.allHTTPHeaderFields = headers
		}
		return copy
	}
}
