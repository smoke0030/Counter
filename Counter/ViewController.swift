//
//  ViewController.swift
//  Counter
//
//  Created by Admin on 13.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var countLabel: UILabel!
    @IBOutlet weak private var historyLabel: UITextView!
    @IBOutlet weak private var plusButtonOutlet: UIButton!
    @IBOutlet weak private var minusButtonOutlet: UIButton!
    @IBOutlet weak private var clearButtonOutlet: UIButton!
    @IBOutlet weak private var clearHistory: UIButton!
    
    private let dateFormatter = DateFormatter()
    private var count: Int = 0
    private var historyArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
        return  dateFormatter.string(from: Date())
    }
    
    
    @IBAction private func buttonPlus(_ sender: UIButton) {
        count += 1
        historyArray.append("\(getCurrentTime()): значение изменено на +1")
        updateInfo()
        
    }
    
    @IBAction private func buttonMinus(_ sender: UIButton) {
        count -= 1
        if count < 0 {
            count = 0
            historyArray.append("\(getCurrentTime()) попытка уменьшить значение счётчика ниже 0")
        } else {
            historyArray.append("\(getCurrentTime()): значение изменено на -1")
        }
        updateInfo()
    }
    
    @IBAction private func buttonClear(_ sender: UIButton) {
        count = 0
        historyArray.append("\(getCurrentTime()): значение сброшено")
        updateInfo()
        
    }
    
    @IBAction private func historyClear(_ sender: UIButton) {
        historyArray.removeAll()
        historyLabel.text = "История изменений:"
    }
    
    
    
    }
    
