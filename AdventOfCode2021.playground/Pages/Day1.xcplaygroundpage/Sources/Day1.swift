import Foundation

public func day1_part1(_ inputs: [Int]) -> Int {
    var retval = 0
    var prevInput: Int? = nil
    for value in inputs {
        if let i = prevInput, value > i {
            retval += 1
        }
        prevInput = value
    }
    return retval
}

public func day1(_ inputs: [Int], windowSize: Int = 1) -> Int {
    var retval = 0
    var window: [Int] = []
    for value in inputs {
        if window.count == windowSize
            && value > window.removeFirst()
        {
            // Array is a very bad queue for large window sizes
            // since removeFirst() is O(n), but it'll do for now
            retval += 1
        }
        window.append(value)
    }
    return retval
}
