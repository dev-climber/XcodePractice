//
//  Music.swift
//  MusicDictionary
//
//  Created by Jungsang Lim on 2021/04/09.
//

import Foundation

struct Music {
    var symbol: String
    var title: String
    var artist: String
    var album: String

    init(symbol: String, title: String, artist: String, album: String) {
        self.symbol = symbol
        self.title = title
        self.artist = artist
        self.album = album
    }
}
