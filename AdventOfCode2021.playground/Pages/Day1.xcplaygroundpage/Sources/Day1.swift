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
    var sum = 0
    for value in inputs {
        if window.count == windowSize {
            // Array is a very bad queue for large window sizes
            // since removeFirst() is O(n), but it'll do for now
            let newSum = sum - window.removeFirst() + value
            if newSum > sum {
                retval += 1
            }
            sum = newSum
        } else {
            sum += value
        }
        window.append(value)
    }
    return retval
}
