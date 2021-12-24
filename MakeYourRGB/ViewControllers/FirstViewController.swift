//
//  ViewController.swift
//  MakeYourRGB
//
//  Created by Vasichko Anna on 24.12.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setBackgroundColor(for viewBackgroundColor: UIColor)
}

class FirstViewController: UIViewController {

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as! SettingsViewController
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
       
    }

}

extension FirstViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(for viewBackgroundColor: UIColor) {
        view.backgroundColor = viewBackgroundColor
    }
    
}




