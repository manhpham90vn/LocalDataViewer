//
//  ViewController.swift
//  SampleApp
//
//  Created by Manh Pham on 8/7/22.
//

import UIKit
import LocalDataViewer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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

