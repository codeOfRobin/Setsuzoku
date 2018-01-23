//
//  Response.swift
//  Setsuzoku
//
//  Created by Robin Malhotra on 23/01/18.
//

import Foundation

public struct Response: Equatable {
	public let data: Data
	public let httpURLResponse: HTTPURLResponse
}

// MARK: - Equatable

public func == (lhs: Response, rhs: Response) -> Bool {
	return lhs.data == rhs.data
		&& lhs.httpURLResponse == rhs.httpURLResponse
}

