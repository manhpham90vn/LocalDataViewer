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
}

class DetailViewController: UIViewController {

    private var dataSources = [DetailValue]()
        
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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

extension DetailViewController: UITableViewDelegate {    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}
