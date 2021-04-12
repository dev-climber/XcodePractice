//
//  MusicTableViewCell.swift
//  MusicDictionary
//
//  Created by Jungsang Lim on 2021/04/09.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with musics: Music) {
        symbolLabel.text = musics.symbol
        titleLabel.text = musics.title
        artistLabel.text = musics.artist
        
    }
    
}
