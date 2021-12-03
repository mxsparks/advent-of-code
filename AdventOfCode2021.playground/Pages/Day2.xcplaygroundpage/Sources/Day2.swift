import Foundation

public enum Direction: String {
    case forward
    case down
    case up
}

public struct Command: InitializableFromString {
    public let direction: Direction
    public let distance: Int

    public init(_ dir: Direction, _ dist: Int) {
        direction = dir
        distance = dist
    }

    public init?(_ line: String) {
        let words = line.split(separator: " ")
        guard words.count == 2,
              let dir = Direction(rawValue: String(words[0])),
              let dist = Int(words[1])
        else {
            return nil
        }
        direction = dir
        distance = dist
    }
}

public class Position {
    var horizontal: Int = 0
    var depth: Int = 0

    public var solution: Int {
        get {
            return horizontal * depth
        }
    }

    public init(_ cmds: [Command]) {
        for cmd in cmds {
            execute(cmd)
        }
    }

    func execute(_ cmd: Command) {
        switch cmd.direction {
        case .forward:
            horizontal += cmd.distance
        case .down:
            depth += cmd.distance
        case .up:
            depth -= cmd.distance
        }
    }
}

public class Part2Position: Position {
    var aim: Int = 0

    override func execute(_ cmd: Command) {
        switch cmd.direction {
        case .forward:
            horizontal += cmd.distance
            depth += aim * cmd.distance
        case .down:
            aim += cmd.distance
        case .up:
            aim -= cmd.distance
        }
    }

}
