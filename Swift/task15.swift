//
//  task15.swift
//  PassData
//
//  Created by Yerlan Omarov on 05.08.2021.
//

import Foundation

class FileDescription {
 var filePath: String {
  return self.folderPath + self.fileName
 }
 var fileName: String = ""
 var maxSize: Int = 64
 var folderPath: String = ""
 var data: String = ""

}

enum CustomColor: Int, CaseIterable {
 static var numColor: Int {return self.allCases.count }
 static var startColor: CustomColor {return .black}
 static var endColor: CustomColor {return .navy}
 
 case black = 0x000000
  case white = 0xFFFFFF
  case red = 0xFF0000
  case lime = 0x00FF00
  case blue = 0x0000FF
  case yellow = 0xFFFF00
  case cyan  = 0x00FFFF
  case magenta = 0xFF00FF
  case silver = 0xC0C0C0
  case gray = 0x808080
  case maroon = 0x800000
  case olive = 0x808000
  case green = 0x008000
  case purple = 0x800080
  case teal = 0x008080
  case navy = 0x000080
}

var a = FileDescription()
a.fileName = "music.mp3"
a.folderPath = "C:/Documents/Music/"
a.data = "someData"

var b = CustomColor.black

print(a.filePath)
print(b.rawValue)
print(CustomColor.numColor)
print(CustomColor.startColor)
print(CustomColor.endColor)
