//
//  SettingsPopUpFlags.swift
//  SMBomb
//
//  Created by Admin on 13.08.2023.
//

import Foundation

struct SettingsBackgroundMusic {
    static var firstMusic = false
    static var secondMusic = true
    static var thirdMusic = false
    
    static func updateMemory(_ nameButtonActive: String){
        switch nameButtonActive {
        case "Мелодия 1":
            firstMusic = true
            secondMusic = false
            thirdMusic = false
        case "Мелодия 2":
            firstMusic = false
            secondMusic = true
            thirdMusic = false
        case "Мелодия 3":
            firstMusic = false
            secondMusic = false
            thirdMusic = true
        default:
            break
        }
    }
    
    static func getActualMusic() -> String {
        if firstMusic {
            return "firstBackgroundMusic"
        } else if secondMusic {
            return "secondBackgroundMusic"
        } else {
            return "music3"
        }
    }
}
