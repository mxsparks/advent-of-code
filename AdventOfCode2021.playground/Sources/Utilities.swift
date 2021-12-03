import Foundation

public protocol InitializableFromString {
    init?(_: String)
}

extension Int: InitializableFromString {}

public func from_lines_in_text<T: InitializableFromString>(_ name: String) -> [T] {
    guard let url = Bundle.main.url(forResource: name, withExtension: "txt"),
          let text = try? String(contentsOf: url)
    else {
        print("Failed to load resource: \"\(name)\"")
        return []
    }
    var retval: [T] = []
    text.enumerateLines { line, _ in
        if let value = T(line) {
            retval.append(value)
        } else {
            print("Ignoring invalid line: \"\(line)\"")
        }
    }
    return retval
}
