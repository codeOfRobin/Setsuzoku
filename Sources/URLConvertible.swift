//
//  URLConvertible.swift
//  Setsuzoku
//
//  Created by Robin Malhotra on 23/01/18.
//

import Foundation

import Foundation

/// Types adopting the `URLConvertible` protocol can be used to construct URLs, which are then used to construct
/// URL requests.
public protocol URLConvertible {
	/// Returns a URL that conforms to RFC 2396 or throws an `Error`.
	///
	/// - throws: An `Error` if the type cannot be converted to a `URL`.
	///
	/// - returns: A URL or throws an `Error`.
	func asURL() throws -> URL
}

extension String: URLConvertible {
	/// Returns a URL if `self` represents a valid URL string that conforms to RFC 2396 or throws an `AFError`.
	///
	/// - throws: An `AFError.invalidURL` if `self` is not a valid URL string.
	///
	/// - returns: A URL or throws an `NetworkingError`.
	public func asURL() throws -> URL {
		guard let url = URL(string: self) else {
			throw NetworkError.invalidRequestURL(self)
		}
		return url
	}
}

extension URL: URLConvertible {
	/// Returns self.
	public func asURL() throws -> URL { return self }
}

extension URLComponents: URLConvertible {
	/// Returns a URL if `url` is not nil, otherwise throws an `Error`.
	///
	/// - throws: An `AFError.invalidURL` if `url` is `nil`.
	///
	/// - returns: A URL or throws a `NetworkingError`.
	public func asURL() throws -> URL {
		guard let url = url else {
			throw NetworkError.invalidRequestURL(self)
		}
		return url
	}
}
