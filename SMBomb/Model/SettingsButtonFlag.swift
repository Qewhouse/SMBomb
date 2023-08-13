//
//  SettingsButtonFlag.swift
//  SMBomb
//
//  Created by Admin on 12.08.2023.
//

import Foundation

struct SettingsButtonFlag {
    static var isSelectedShortTime = true
    static var isSelectedAvarageTime = false
    static var isSelectedLongTime = false
    static var isSelectedRandomTime = false
    
    static var timeForTimer: Int {
        return checkTimeForTimer()
    }
    
    static func checkTimeForTimer() -> Int {
        if isSelectedShortTime {
            return 10
        } else if isSelectedAvarageTime {
            return 20
        } else if isSelectedLongTime {
            return 45
        } else {
            return Int.random(in: 10...45)
        }
    }
}

