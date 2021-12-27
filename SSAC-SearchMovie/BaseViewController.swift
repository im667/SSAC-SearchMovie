//
//  ViewController.swift
//  SSAC-SearchMovie
//
//  Created by mac on 2021/12/22.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        configure()
        setupConstraints()
    }
    
    func configure() {
        view.backgroundColor = .white
    }
    
    func setupConstraints() {
        
    }

}

