//
//  main.swift
//  playlist_Assignment
//
//  Created by Dogus Guleryuz on 16.03.2023.
//

import Foundation

var playlist = Playlist()

while true{
  print("\nA: Add a song to the playlist")
  print("F: Find a song on the playlist")
  print("D: Delete a song from the playlist")
  print("S: Show the entire playlist")
  print("C: Category summary")
  print("Z: Show playlist size")
  print("M: Show this menu")
  print("X: Exit the program")
  print("Enter your command from the menu:")
  
  if let select = readLine()?.lowercased() {
    switch select {
    case "a":
      print("Add a new song to the playlist!")
      print("Enter a new song's title:")
      let title = readLine() ?? ""
      print("Enter a new song's artist:")
      let artist = readLine() ?? ""
      print("Enter a new song's category (P: Pop, R: Rock, A: Alternative, B: RnB, H: Hiphop, C: Classical):")
      var choice = readLine()?.uppercased() ?? ""
      var category: Song.Style = .pop
      if choice=="P" {
        category=Song.Style.pop
      } else if choice=="R" {
        category=Song.Style.rock
      } else if choice=="A" {
        category=Song.Style.alternative
      } else if choice=="B" {
        category=Song.Style.rnb
      } else if choice=="H" {
        category=Song.Style.hiphop
      } else if choice=="C" {
        category=Song.Style.classical
      }
      while !["P", "R", "A", "B", "H", "C"].contains(choice) {
        print("Invalid category. Please re-enter:")
        choice = readLine()?.uppercased() ?? ""
      }
      print("Enter a new song's size:")
      var size = Int(readLine() ?? "") ?? 0
      while size <= 0 {
        print("Must enter a positive size. Please re-enter:")
        size = Int(readLine() ?? "") ?? 0
      }
      playlist.addSong(title: title, artist: artist, category: category, size: size)
      print("\(title) by \(artist) added to the playlist.")
      
    case "f":
      print("Find a song on the playlist!")
      print("Enter your search Keyword:")
      let searchSong = readLine() ?? ""
      let results = playlist.findSong(searchSong: searchSong)
      if results.isEmpty {
        print("=== Matched Titles ===")
        print("=== 0 matched ===")
        print("=== Matched Artists ===")
        print("=== 0 matched ===")
      } else {
        var i: Int = 0
        var k: Int = 0
        print("=== Matched Titles ===")
        for song in results {
          if song.title.localizedCaseInsensitiveContains(searchSong)  {
            print(song.description)
            i+=1
          }
        }
        print("=== \(i) matched ===")
        print("=== Matched Artists ===")
        for song in results {
          if song.artist.localizedCaseInsensitiveContains(searchSong)  {
            print(song.description)
            k+=1
          }
        }
        print("=== \(k) matches ===")
      }
      
    case "d":
      print("Delete a song from the playlist!")
      print("Enter the title of the song you want to remove from your playlist:")
      let deleteSong = readLine() ?? ""
      let result = playlist.deleteSong(title: deleteSong)
      if result {
        print("\(deleteSong)\nSuccessfully removed the song from the playlist.")
      } else {
        print("No such title: '\(deleteSong)' in the playlist.")
      }
      
    case "s":
      playlist.showPlaylist()
      let size = Double(playlist.showTotalSize())/100
      print("Total: \(playlist.songs.count) songs in the playlist.\nSize: \(Double(size/10)) MB.")
      
    case "c":
      print("\nEnter a category to print (P, R, A, B, H, C):")
      var choice = readLine()?.uppercased() ?? ""
      var categorySum: Song.Style = .pop
      if choice=="P" {
        categorySum=Song.Style.pop
      } else if choice=="R" {
        categorySum=Song.Style.rock
      } else if choice=="A" {
        categorySum=Song.Style.alternative
      } else if choice=="B" {
        categorySum=Song.Style.rnb
      } else if choice=="H" {
        categorySum=Song.Style.hiphop
      } else if choice=="C" {
        categorySum=Song.Style.classical
      }
      while !["P", "R", "A", "B", "H", "C"].contains(choice) {
        print("Invalid category. Please re-enter:")
        choice = readLine()?.uppercased() ?? ""
      }
      playlist.showCategoryTotalSizeAndSong(category: categorySum)
      
    case "z":
      let totalSize = playlist.showTotalSize()
      print("Show playlist size!")
      print("Total size: \(totalSize) KB")
      
    case "m":
      print("Show this menu!")
      continue
      
    case "x":
      exit(0)
      
    default:
      print("Invalid command. Please try again.")
    }
  }
  
}

