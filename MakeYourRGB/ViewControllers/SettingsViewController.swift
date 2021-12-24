//
//  SettingsViewController.swift
//  MakeYourRGB
//
//  Created by Vasichko Anna on 24.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redColorTF: UITextField!
    @IBOutlet weak var greenColorTF: UITextField!
    @IBOutlet weak var blueColorTF: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        mainView.layer.cornerRadius = 25
    }
    
    @IBAction func redSliderAction() {
        redColorLabel.text = String(format: "%.2f", redSlider.value)
        redColorTF.text = String(format: "%.2f", redSlider.value)
        
        setupColor()
    }
   
    @IBAction func greenSliderAction() {
        greenColorLabel.text = String(format: "%.2f", greenSlider.value)
        greenColorTF.text = String(format: "%.2f", greenSlider.value)
        
        setupColor()
    }
    
    @IBAction func blueSliderAction() {
        blueColorLabel.text = String(format: "%.2f", blueSlider.value)
        blueColorTF.text = String(format: "%.2f", blueSlider.value)
        
        setupColor()
        
    }
    
    
    @IBAction func doneButtonPressed() {
        delegate.setBackgroundColor(for: mainView.backgroundColor ?? .blue)
        dismiss(animated: true)
    }
    
}

// MARK: - Private Methods
extension SettingsViewController {
    private func setupUI() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redColorLabel.text = String(format: "%.2f", redSlider.value)
        greenColorLabel.text = String(format: "%.2f", greenSlider.value)
        blueColorLabel.text = String(format: "%.2f", blueSlider.value)
        
        redColorTF.text = String(format: "%.2f", redSlider.value)
        greenColorTF.text = String(format: "%.2f", greenSlider.value)
        blueColorTF.text = String(format: "%.2f", blueSlider.value)
        
        setupColor()
        
    }
    private func setupColor() {
        let redSliderValue = CGFloat(redSlider.value)
        let greenSliderValue = CGFloat(greenSlider.value)
        let blueSliderValue = CGFloat(blueSlider.value)
        
        mainView.backgroundColor = UIColor(
        red: redSliderValue,
        green: greenSliderValue,
        blue: blueSliderValue,
        alpha: 1
        )
    
    }
    
}


