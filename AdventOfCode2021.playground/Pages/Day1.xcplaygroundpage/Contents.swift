import Foundation

let day1_example_input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
let day1_input = ints_from_text("day1_input") // looks for Day1/Resources/day1_input.txt

let example_part1 = day1_part1(day1_example_input)
let solution_part1 = day1_part1(day1_input)

assert(day1(day1_example_input) == example_part1)
assert(day1(day1_input) == solution_part1)

let example_part2 = day1(day1_example_input, windowSize: 3)
let solution_part2 = day1(day1_input, windowSize: 3)
