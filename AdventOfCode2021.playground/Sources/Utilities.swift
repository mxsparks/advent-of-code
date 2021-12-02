import Foundation

public func ints_from_text(_ name: String) -> [Int] {
    guard let url = Bundle.main.url(forResource: name, withExtension: "txt"),
          let text = try? String(contentsOf: url)
    else {
        print("Failed to load resource: \"\(name)\"")
        return []
    }
    var retval: [Int] = []
    text.enumerateLines { line, _ in
        if let value = Int(line) {
            retval.append(value)
        } else {
            print("Non-integer value: \"\(line)\"")
        }
    }
    return retval
}
