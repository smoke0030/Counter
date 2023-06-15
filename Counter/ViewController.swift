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
    @IBOutlet weak var clearHistory: UIButton!
    
    private var count: Int = 0
    private var historyArray: [String] = []
    let message = ": Значение изменено на "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyLabel.isEditable = false
        plusButtonOutlet.setImage(UIImage(systemName: "plus"), for: .normal)
        minusButtonOutlet.setImage(UIImage(systemName: "minus"), for: .normal)
        clearButtonOutlet.setImage(UIImage(systemName: "clear"), for: .normal)
        plusButtonOutlet.backgroundColor = .red
        minusButtonOutlet.backgroundColor = .blue
        clearButtonOutlet.backgroundColor = .green
        plusButtonOutlet.setTitle("", for: .normal)
        minusButtonOutlet.setTitle("", for: .normal)
        clearButtonOutlet.setTitle("", for: .normal)
        clearHistory.setTitle("Clear history", for: .normal)
        clearHistory.backgroundColor = .brown
        clearHistory.tintColor = .white
        
        
    }
    private func updateInfo() {
        historyLabel.text = historyArray.joined(separator: "\n")
        countLabel.text = "Значение счетчика: \(count)"
        
    }
    
    private func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
        return  dateFormatter.string(from: Date())
    }
    
    
    @IBAction func buttonPlus(_ sender: UIButton) {
        count += 1
        historyArray.append("\(getCurrentTime()): значение изменено на +1")
        updateInfo()
        
    }
    
    @IBAction func buttonMinus(_ sender: UIButton) {
        count -= 1
        if count < 0 {
            count = 0
            historyArray.append("\(getCurrentTime()) попытка уменьшить значение счётчика ниже 0")
        } else {
            historyArray.append("\(getCurrentTime()): значение изменено на -1")
        }
        updateInfo()
    }
    
    @IBAction func buttonClear(_ sender: UIButton) {
        count = 0
        historyArray.append("\(getCurrentTime()): значение сброшено")
        updateInfo()
        
    }
    
    @IBAction func historyClear(_ sender: UIButton) {
        historyArray.removeAll()
        historyLabel.text = "История изменений:"
    }
    
    
    
    }
    
