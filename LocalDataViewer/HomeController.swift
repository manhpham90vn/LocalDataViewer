//
//  HomeController.swift
//  LocalDataViewer
//
//  Created by Manh Pham on 8/6/22.
//

import UIKit
import KeychainAccess

class HomeController: UIViewController {

    private var dataSources = [LocalDataType]()
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: Bundle(for: Self.self)), forCellReuseIdentifier: "cell")
        let closeBtn = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeBtn
        let buttonRegisterUserDefaults = UIBarButtonItem(title: "Add SuiteName", style: .plain, target: self, action: #selector(handleAddUserDefault))
        let buttonRegisterKeyChain = UIBarButtonItem(title: "Add KeyChain", style: .plain, target: self, action: #selector(handleAddKeyChain))
        navigationItem.rightBarButtonItems = [buttonRegisterUserDefaults, buttonRegisterKeyChain]
        initDatas()
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleAddUserDefault() {
        let alert = UIAlertController(title: "Add new SuiteName for UserDefaults", message: nil, preferredStyle: .alert)
        alert.addTextField { text in
            text.placeholder = "SuiteName"
        }
        alert.addAction(.init(title: "OK", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            let text = alert.textFields?[0].text ?? ""
            if !text.isEmpty {
                self.dataSources.append(.userDefaults(item: .suiteName(name: text,
                                                                       items: self.getAllDataFromUserDefault(type: .suiteName(name: text,
                                                                                                                              items: [])))))
                self.tableView.reloadData()
            }
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func handleAddKeyChain() {
        let alert = UIAlertController(title: "Add new Keychain service", message: nil, preferredStyle: .alert)
        alert.addTextField { text in
            text.placeholder = "service"
        }
        alert.addAction(.init(title: "OK", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            let text = alert.textFields?[0].text ?? ""
            if !text.isEmpty {
                self.dataSources.append(.keychain(item: .service(name: text,
                                                                 items: self.getAllDataFromKeyChain(type: .service(name: text,
                                                                                                                   items: [])))))
                self.tableView.reloadData()
            }
        }))
        present(alert, animated: true, completion: nil)
    }
        
    private func initDatas() {
        dataSources.append(.userDefaults(item: .standard(items: getAllDataFromUserDefault(type: .standard(items: [])))))
        tableView.reloadData()
    }
    
    func getAllDataFromUserDefault(type: UserDefaultType) -> [DetailValue] {
        switch type {
        case .standard:
            return UserDefaults.standard.dictionaryRepresentation().map { .init(key: $0.key, value: $0.value) }
        case let .suiteName(name, _):
            return UserDefaults(suiteName: name)?.dictionaryRepresentation().map { .init(key: $0.key, value: $0.value) } ?? []
        }
    }
    
    func getAllDataFromKeyChain(type: KeychainType) -> [DetailValue] {
        switch type {
        case let .service(name, _):
            return Keychain(service: name).allItems().map { .init(key: $0["key"] as? String ?? "", value: $0["value"] ?? "") }
        }
    }
    
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.config(name: dataSources[indexPath.row].description)
        return cell
    }
}

extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataSources[indexPath.row]
        let vc = UIStoryboard(name: "Home", bundle: Bundle(for: Self.self)).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.injectData(datas: data.items)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}
