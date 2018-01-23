//
//  TokenAuthBehaviour.swift
//  NetworkingTests_iOS
//
//  Created by Robin Malhotra on 20/01/18.
//

import Foundation

struct TokenAuthBehaviour: RequestBehavior {
	let token: String

	func adapt(_ request: URLRequest) -> URLRequest {
		var copy = request
		var headers = copy.allHTTPHeaderFields ?? [:]
		headers["Authorization"] = "Bearer \(token)"
		copy.allHTTPHeaderFields = headers
		return copy
	}
}
