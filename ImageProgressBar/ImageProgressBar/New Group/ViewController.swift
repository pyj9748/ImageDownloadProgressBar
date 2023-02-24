//
//  ViewController.swift
//  ImageProgressBar
//
//  Created by young june Park on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {
    let mainView = MainView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = mainView
    }

}

