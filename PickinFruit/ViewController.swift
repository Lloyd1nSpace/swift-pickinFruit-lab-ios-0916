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
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count - 1))), inComponent: 0, animated: true)
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count - 1))), inComponent: 1, animated: true)
        fruitPicker.selectRow(Int(arc4random_uniform(UInt32(fruitsArray.count - 1))), inComponent: 2, animated: true)
        updateLabel()
    }
 
    func updateLabel() {
        let firstComponent = fruitPicker.selectedRow(inComponent: 0)
        let secondComponent = fruitPicker.selectedRow(inComponent: 1)
        let thirdComponent = fruitPicker.selectedRow(inComponent: 2)
        resultLabel.text = (firstComponent, secondComponent) == (secondComponent, thirdComponent) ? "WINNER!" : "TRY AGAIN"
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
        return fruitsArray.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
}


