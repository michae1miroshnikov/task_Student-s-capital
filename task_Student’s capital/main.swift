//
//  main.swift
//  task_Student’s capital
//
//  Created by Michael Miroshnikov on 14/07/2025.
//

import Foundation

func readInt(prompt: String) -> Int {
    print(prompt, terminator: " ")
    guard let input = readLine(), let value = Int(input) else {
        fatalError("Invalid input. Please enter an integer.")
    }
    return value
}

func readIntArray(prompt: String, count: Int) -> [Int] {
    print(prompt)
    var array: [Int] = []
    while array.count < count {
        if let input = readLine() {
            let numbers = input.split(separator: " ").compactMap { Int($0) }
            array += numbers
        }
    }
    if array.count != count {
        fatalError("Incorrect number of values.")
    }
    return array
}


let n = readInt(prompt: "Enter the max number of laptops you can buy (N):")
let c = readInt(prompt: "Enter your starting capital (C):")
let k = readInt(prompt: "Enter total number of available laptops (K):")

let price = readIntArray(prompt: "Enter the price of each laptop (space-separated, \(k) values):", count: k)
let gains = readIntArray(prompt: "Enter the expected gain for each laptop (space-separated, \(k) values):", count: k)

var capital = c


let laptops = (0..<k).map { (i: Int) in
    return (index: i, gain: gains[i], price: price[i])
}


var affordable: [(index: Int, gain: Int, price: Int)] = laptops.filter { $0.price <= capital }


affordable.sort {
    let profit1 = $0.gain - $0.price
    let profit2 = $1.gain - $1.price
    return profit1 > profit2
}

var bought = 0

for laptop in affordable {
    if bought >= n { break }
    if laptop.price <= capital {
        capital -= laptop.price
        capital += laptop.gain
        bought += 1
        print("Bought laptop #\(laptop.index + 1) for \(laptop.price), gained \(laptop.gain).")
    }
}

print("Final capital after summer: \(capital)")
