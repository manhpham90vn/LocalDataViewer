//
//  LocalDataViewer.swift
//  LocalDataViewer
//
//  Created by Manh Pham on 8/7/22.
//

import Foundation
import UIKit

public class LocalDataViewer {
    
    public static func getMenuVC() -> UIViewController {
        let vc =  UIStoryboard(name: "Home", bundle: Bundle(for: Self.self)).instantiateInitialViewController()!
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    
}
