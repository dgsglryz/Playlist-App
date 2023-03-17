//
//  Playlist.swift
//  DogusGuleryuz
//
//  Created by Dogus Guleryuz on 15.03.2023.
//

import Foundation

struct Playlist {
  private(set) var songs: [Song] = []
  
  init() {
    self.songs = []
  }
  
  mutating func addSong(title: String, artist: String, category: Song.Style, size: Int) {
    let song = Song(title: title, artist: artist, category: category, size: size)
    songs.append(song)
  }
  
  mutating func findSong(searchSong: String) -> [Song] {
    var result: [Song] = []
    
    if searchSong.count<=35 {
      for i in songs {
        if i.title.localizedCaseInsensitiveContains(searchSong) {
          result.append(i)
        } else if i.artist.localizedCaseInsensitiveContains(searchSong) {
          result.append(i)
        }
      }
    }
    
    return result
  }
  
  mutating func deleteSong(title: String) -> Bool {
    if let indexOfSong = songs.firstIndex(where: {$0.title==title}) {
      songs.remove(at: indexOfSong)
      return true
    } else {
      return false
    }
  }
  
  func showPlaylist() {
    display()
    for i in songs {
      print(i.description)
    }
    print("-----------------------------------------------------------------------------------------------")
  }
  
  func display() {
    var title = "| Title"
    var artist = "| Artist"
    var style = "| Category"
    var size = "| Size(MB)"
    print("Show the entire playlist!")
    print("-----------------------------------------------------------------------------------------------")
    print(title.padding(toLength: 35, withPad: " ", startingAt: 0)+artist.padding(toLength: 35, withPad: " ", startingAt: 0) + style.padding(toLength: 15, withPad: " ", startingAt: 0) + size.padding(toLength: 10, withPad: " ", startingAt: 0))
    print("-----------------------------------------------------------------------------------------------")
  }
  
  func showCategoryTotalSizeAndSong(category: Song.Style) {
    
    display()
    
    var song = 0
    var size = 0
    
    for i in songs {
      if i.category==category {
        print(i.description)
        size+=i.size
        song+=1
      }
    }
    var newSize = Double(size/100)
    print("--------------------------------------------------------------------------------------------")
    print("Total: \(song) songs in the playlist.\nSize: \(Double(newSize/10)) MB.")
    
  }
  
  func showTotalSize() -> Int{
    var size = 0
    
    for i in songs {
      size+=i.size
    }
    
    return size
  }
  
}
