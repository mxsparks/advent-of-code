import Foundation

let example_input = [
    Command(.forward, 5),
    Command(.down, 5),
    Command(.forward, 8),
    Command(.up, 3),
    Command(.down, 8),
    Command(.forward, 2),
]
let example_part1 = Position(example_input)
example_part1.solution

let actual_input: [Command] = from_lines_in_text("day2_input")
let part1 = Position(actual_input)
part1.solution

let example_part2 = Part2Position(example_input)
example_part2.solution

let part2 = Part2Position(actual_input)
part2.solution
