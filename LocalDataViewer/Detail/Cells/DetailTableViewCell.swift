//
//  DetailTableViewCell.swift
//  LocalDataViewer
//
//  Created by Manh Pham on 8/6/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func config(data: DetailValue) {
        titleLabel.text = data.key
        valueLabel.text = data.value as? String ?? "Can not view data"
    }
    
}
