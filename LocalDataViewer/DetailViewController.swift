//
//  DetailViewController.swift
//  LocalDataViewer
//
//  Created by Manh Pham on 8/6/22.
//

import UIKit

struct DetailValue {
    var key: String
    var value: Any
    
    var displayText: String {
        if let value = value as? String {
             return "\(key):\(value)"
        } else if let value = value as? Int {
            return "\(key):\(value)"
        } else if let value = value as? Double {
            return "\(key):\(value)"
        } else if let value = value as? Float {
            return "\(key):\(value)"
        } else if let value = value as? Bool {
            return "\(key):\(value)"
        } else if let value = value as? URL {
            return "\(key):\(value.absoluteString)"
        } else {
            return "\(key):Can not view data"
        }
    }
}

class DetailViewController: UIViewController {

    private var dataSources = [DetailValue]()
        
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: Bundle(for: Self.self)), forCellReuseIdentifier: "cell")
    }
    
    func injectData(datas: [DetailValue]) {
        self.dataSources = datas
    }
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailTableViewCell
        cell.config(data: dataSources[indexPath.row])
        return cell
    }
}
