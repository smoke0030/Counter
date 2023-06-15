//
//  ViewController.swift
//  Counter
//
//  Created by Admin on 13.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var historyLabel: UITextView!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var minusButtonOutlet: UIButton!
    @IBOutlet weak var clearButtonOutlet: UIButton!
    
    private var count: Int = 0
    private var historyArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyLabel.isEditable = false
        plusButtonOutlet.setImage(UIImage(systemName: "plus"), for: .normal)
        minusButtonOutlet.setImage(UIImage(systemName: "minus"), for: .normal)
        plusButtonOutlet.backgroundColor = .red
        minusButtonOutlet.backgroundColor = .blue
        clearButtonOutlet.backgroundColor = .green
        clearButtonOutlet.setImage(UIImage(systemName: "clear"), for: .normal)
        
        
    }
    private func updateInfo() {
        historyLabel.text = historyArray.joined(separator: "\n")
        countLabel.text = "Значение счетчика: \(count)"
        
    }
    
    private func simpleTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
        return  dateFormatter.string(from: Date())
    }
    
    @IBAction func buttonPlus(_ sender: UIButton) {
        count += 1
        historyArray.append("\(simpleTime()): значение изменено на +1")
        updateInfo()
        
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        count -= 1
        if count < 0 {
            count = 0
            historyArray.append("\(simpleTime()) попытка уменьшить значение счётчика ниже 0")
        } else {
            historyArray.append("\(simpleTime()): значение изменено на -1")
        }
        updateInfo()
    }
    
    @IBAction func buttonClear(_ sender: UIButton) {
        count = 0
        historyArray.append("\(simpleTime()): значение сброшено")
        updateInfo()
        
    }
    
    
    }
    
/*extension Date {
    var toJustTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
        return  dateFormatter.string(from: self)
    }
}

*/
