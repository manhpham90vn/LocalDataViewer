//
//  DetailTableViewCell.swift
//  LocalDataViewer
//
//  Created by Manh Pham on 8/6/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var data: DetailValue?
    
    func config(data: DetailValue) {
        titleLabel.text = data.displayText
        self.data = data
    }
    
    @IBAction func copyButtonDidTap(_ sender: Any) {
        UIPasteboard.general.string = data?.displayText ?? ""
    }
    
}
