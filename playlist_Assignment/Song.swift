//
//  Song.swift
//  DogusGuleryuz
//
//  Created by Dogus Guleryuz on 15.03.2023.
//

import Foundation

struct Song {
  enum Style: String {
    case pop, rock, alternative, rnb, hiphop, classical
  }
  // title of the song
  private(set) var title: String
  // artist of the song
  private(set) var artist: String
  // category of the song
  private(set) var category: Style
  // file size, stored in kilobytes
  private(set) var size: Int
  
  init(title: String, artist: String, category: Style, size: Int) {
    self.title = title
    self.artist = artist
    self.category = category
    self.size = size
  }
  
  mutating func setSong(title: String, artist: String, category: Style, size: Int) {
    self.title = title
    self.artist = artist
    self.category = category
    self.size = size
  }
}

extension Song: CustomStringConvertible {
  // Size should be printed in Megabytes (use 1000 kilobytes = 1 MB for this calculation), to 1 decimal place.
  // The category abbreviations used should be: Pop, Rock, Alt, Cls, HH, RnB
  // Example:
  // | Title                               | Artist                   | Style       | Size (MB)
  var description: String {
    var type: String = ""
    var title = "| \(self.title)"
    var artist = "| \(self.artist)"
    var num = Double(self.size/100)
    var size = String("|  \(Double(num/10)) ")
    
    if category == .pop {
      type = "Pop"
    } else if category == .rock {
      type = "Rock"
    } else if category == .alternative {
      type = "Alt"
    } else if category == .classical {
      type = "Cls"
    } else if category == .hiphop {
      type = "HH"
    } else if category == .rnb {
      type = "RnB"
    }
    
    var style = "| \(type)"
    
    return title.padding(toLength: 35, withPad: " ", startingAt: 0) + artist.padding(toLength: 35, withPad: " ", startingAt: 0) + style.padding(toLength: 15, withPad: " ", startingAt: 0) + size.padding(toLength: 10, withPad: " ", startingAt: 0)
  }
}
