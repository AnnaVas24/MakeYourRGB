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
    var color: UIColor!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = color
        setupUI()
        
        redColorTF.delegate = self
        greenColorTF.delegate = self
        blueColorTF.delegate = self
        
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
        let backgroundColor = mainView.backgroundColor!
        delegate.setBackgroundColor(for: backgroundColor)
        dismiss(animated: true)
    }
    
}

// MARK: - Private Methods
extension SettingsViewController {
    private func setupUI() {
        setupSliders()
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redColorLabel.text = String(format: "%.2f", redSlider.value)
        greenColorLabel.text = String(format: "%.2f", greenSlider.value)
        blueColorLabel.text = String(format: "%.2f", blueSlider.value)
        
        redColorTF.text = String(format: "%.2f", redSlider.value)
        greenColorTF.text = String(format: "%.2f", greenSlider.value)
        blueColorTF.text = String(format: "%.2f", blueSlider.value)
        
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
    
    private func setupSliders() {
        redSlider.value = Float(color.rgba.red)
        greenSlider.value = Float(color.rgba.green)
        blueSlider.value = Float(color.rgba.blue)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else {return}
        guard let floatValue = Float(newValue) else {
            showAlert(title: "Wrong format!", message: "Please enter a float value")
            return
        }
        if floatValue > 1 {
            showAlert(title: "Wrong number!", message: "Please enter a float number from 0 to 1")
        }
        
        if textField == redColorTF {
            redColorLabel.text = String(format: "%.2f", floatValue)
            redSlider.value = floatValue
            setupColor()
        } else if textField == greenColorTF {
            greenColorLabel.text = String(format: "%.2f", floatValue)
            greenSlider.value = floatValue
            setupColor()
        } else {
            blueColorLabel.text = String(format: "%.2f", floatValue)
            blueSlider.value = floatValue
            setupColor()
        }
    }
}

