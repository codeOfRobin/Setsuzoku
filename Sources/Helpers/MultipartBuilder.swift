import Foundation

public final class MultipartBuilder {
  public init() {}

  public func buildMultipartString(from parameters: [String: Any]) -> String {
    var string = ""
    let components = QueryBuilder().buildComponents(from: parameters)

    for (key, value) in components {
      string += "--\(Networking.boundary)\r\n"
      string += "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n"
      string += "\(value)\r\n"
    }

    string += "--\(Networking.boundary)--\r\n"

    return string
  }
}
