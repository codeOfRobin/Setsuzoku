import Foundation

open class Networking {
	
	static let domain = "com.rmalhotra.setsuzoku"

	/// Categorizes a status code.
	///
	/// - informational: This class of status code indicates a provisional response, consisting only of the Status-Line and optional headers, and is terminated by an empty line.
	/// - successful: This class of status code indicates that the client's request was successfully received, understood, and accepted.
	/// - redirection: This class of status code indicates that further action needs to be taken by the user agent in order to fulfill the request.
	/// - clientError: The 4xx class of status code is intended for cases in which the client seems to have erred.
	/// - serverError: Response status codes beginning with the digit "5" indicate cases in which the server is aware that it has erred or is incapable of performing the request.
	/// - cancelled: When a request gets cancelled
	/// - unknown: This response status code could be used by Foundation for other types of states.
	public enum StatusCodeType {
		case informational, successful, redirection, clientError, serverError, cancelled, unknown
	}


	/// The boundary used for multipart requests.
	#if os(Linux)
	static let boundary = String(format: "com.rmalhotra.setsuzoku.%08x%08x", random(), random())
	#else
	static let boundary = String(format: "com.rmalhotra.setsuzoku.%08x%08x", arc4random(), arc4random())
	#endif

	let session: URLSession
	let requestBehaviors: [RequestBehavior]

	init(session: URLSession = .shared, requestBehaviors: [RequestBehavior] = []) {
		self.session = session
		self.requestBehaviors = requestBehaviors
	}

}

