//
//  CustomAuthBehaviour.swift
//  NetworkingTests_iOS
//
//  Created by Robin Malhotra on 20/01/18.
//

import Foundation

struct CustomAuthBehaviour: RequestBehavior {

	let key: String
	let value: String

	func adapt(_ request: URLRequest) -> URLRequest {
		var copy = request
		var headers = copy.allHTTPHeaderFields ?? [:]
		headers[key] = value
		copy.allHTTPHeaderFields = headers
		return copy
	}
}

