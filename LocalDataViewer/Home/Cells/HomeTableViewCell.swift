//
//  HomeTableViewCell.swift
//  LocalDataViewer
//
//  Created by Manh Pham on 8/6/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    func config(name: String) {
        titleLabel.text = name
    }

}
