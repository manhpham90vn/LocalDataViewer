//
//  ViewController.swift
//  SampleApp
//
//  Created by Manh Pham on 8/7/22.
//

import UIKit
import LocalDataViewer
import KeychainAccess

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initButton()
        addSampleData()
    }
    
    func addSampleData() {
        let stringValue = "test"
        let boolValue = true
        let intValue = 1
        let doubleValue = 1.1
        let floatValue: Float = 1.1
        let urlValue = URL(string: "https://github.com/manhpham90vn/LocalDataViewer")
        let string =
"""
View Local Data as UserDefaults or KeyChain
View Local Data as UserDefaults or KeyChain
View Local Data as UserDefaults or KeyChain
View Local Data as UserDefaults or KeyChain
View Local Data as UserDefaults or KeyChain
"""
        
        UserDefaults.standard.set(string, forKey: "string")
        UserDefaults.standard.set(stringValue, forKey: "stringTest")
        UserDefaults.standard.set(boolValue, forKey: "boolTest")
        UserDefaults.standard.set(intValue, forKey: "intTest")
        UserDefaults.standard.set(doubleValue, forKey: "doubleTest")
        UserDefaults.standard.set(floatValue, forKey: "floatTest")
        UserDefaults.standard.set(urlValue, forKey: "urlTest")
        
        let suiteName = UserDefaults(suiteName: "testSuiteName")!
        suiteName.set(string, forKey: "string")
        suiteName.set(stringValue, forKey: "stringTest")
        suiteName.set(boolValue, forKey: "boolTest")
        suiteName.set(intValue, forKey: "intTest")
        suiteName.set(doubleValue, forKey: "doubleTest")
        suiteName.set(floatValue, forKey: "floatTest")
        suiteName.set(urlValue, forKey: "urlTest")
        
        let keyChain = Keychain(service: "testKeychain")
        try? keyChain.set(stringValue, key: "stringTest")
        try? keyChain.set(string, key: "string")
    }
    
    func initButton() {
        let button = UIButton(type: .system)
        button.setTitle("show menu", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func handleAdd() {
        let vc = LocalDataViewer.getMenuVC()
        present(vc, animated: true, completion: nil)
    }


}

