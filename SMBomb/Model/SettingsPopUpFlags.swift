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


struct SettingsTickSound {
    static var firstTick = true
    static var secondTick = false
    static var thirdTick = false
    
    static func updateMemory(_ nameButtonActive:String){
        switch nameButtonActive {
        case "Мелодия 1":
            firstTick = true
            secondTick = false
            thirdTick = false
        case "Мелодия 2":
            firstTick = false
            secondTick = true
            thirdTick = false
        case "Мелодия 3":
            firstTick = false
            secondTick = false
            thirdTick = true
        default:
            break
        }
    }
    static func getActualTick() -> String{
        if firstTick{
            return "firstTick"
        }else if secondTick{
            return "secondTick"
        }else{
            return "thirdTick"
        }
    }
}

struct SettingsBombSound {
    static var firstBomb = true
    static var secondBomb = false
    static var thirdBomb = false
    
    static func updateMemory(_ nameButtonActive:String){
        switch nameButtonActive {
        case "Мелодия 1":
            firstBomb = true
            secondBomb = false
            thirdBomb = false
        case "Мелодия 2":
            firstBomb = false
            secondBomb = true
            thirdBomb = false
        case "Мелодия 3":
            firstBomb = false
            secondBomb = false
            thirdBomb = true
        default:
            break
        }
    }
    static func getActualBomb() -> String{
        if firstBomb{
            return "firstBomb"
        }else if secondBomb{
            return "secondBomb"
        }else{
            return "thirdBomb"
        }
    }
}
