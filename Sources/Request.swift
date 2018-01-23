//
//  Request.swift
//  Setsuzoku
//
//  Created by Robin Malhotra on 23/01/18.
//

import Foundation

public struct Request {
	public enum TaskType {
		case data
		case upload(data: Data?)
		case download
	}
	public let task: TaskType
	public let method: Method
	public let url: URLConvertible
	public let parameters: [String: Any]
	public let headers: [String: String]

	public init(method: Method,
				url: URLConvertible,
				task: TaskType = .data,
				parameters: [String: Any] = [:],
				headers: [String: String] = [:]) {
		self.task = task
		self.method = method
		self.url = url
		self.parameters = parameters
		self.headers = headers
	}
}
