//
//  NotesSummaryOrderTableViewCell.swift
//  Orderin
//
//  Created by Pieter Yonathan on 10/11/21.
//

import UIKit

class NotesSummaryOrderTableViewCell: UITableViewCell {

    //note for resto/order (GET DATA FROM DATABASE)
    @IBOutlet weak var notesTextField: UITextField!
    
    //create identifier XIB
    static let identifier = "cellNotesSummaryOrder"
    static func nib() -> UINib{
        return UINib(nibName: "NotesSummaryOrderTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
