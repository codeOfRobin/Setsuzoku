//
//  RequestBehaviour.swift
//  Networking_iOS
//
//  Created by Robin Malhotra on 19/01/18.
//

import Foundation

// Refer: http://khanlou.com/2017/01/request-behaviors/

protocol RequestBehavior {

	func beforeSend()

	func afterSuccess(result: Any)

	func afterFailure(error: Error)

	func adapt(_ request: URLRequest) -> URLRequest

}

extension RequestBehavior {
	func beforeSend() {

	}

	func afterSuccess(result: Any) {

	}

	func afterFailure(error: Error) {

	}

	func adapt(_ request: URLRequest) -> URLRequest {
		return request
	}
}

struct EmptyRequestBehavior: RequestBehavior { }

