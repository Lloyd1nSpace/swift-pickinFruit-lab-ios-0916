//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        fruitPicker.delegate = self
        fruitPicker.dataSource = self
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {

        fruitPicker.selectRow(<#T##row: Int##Int#>, inComponent: <#T##Int#>, animated: true)
        fruitPicker.selectedRow(inComponent: <#T##Int#>)
        
        resultLabel.text = "TRY AGAIN"
        resultLabel.text = "WINNER"
        
    }
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton() {
        spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        spinButton.layer.borderColor = UIColor.white.cgColor
        spinButton.layer.borderWidth = 4.0
        spinButton.clipsToBounds = true
    }
    
}

// MARK: Picker View Delegate & Data Source
extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//        
//    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        
//    }
    
}


