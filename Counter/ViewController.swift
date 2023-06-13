//
//  ViewController.swift
//  Counter
//
//  Created by Admin on 13.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    private var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countLabel.text = "Значение счетчика: \(count)"
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        count += 1
        countLabel.text = "Значение счетчика: \(count)"
        }
    }
    


