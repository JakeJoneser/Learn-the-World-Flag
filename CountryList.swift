//
//  File.swift
//

import Foundation

struct Quiz {
    var example: Array<Int>
    var correctAnswerIndex: Int
}

struct FlagInfo: Hashable {
    var name: String
    var imageName: String
    var GDP: Int
    var area: Int
    var difficulty: Int
}

var flagInfo = Array<FlagInfo>()
