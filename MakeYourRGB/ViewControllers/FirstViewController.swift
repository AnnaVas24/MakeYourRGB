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

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else {return}
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else {return}
        settingsVC.delegate = self
    }

}

extension FirstViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(for viewBackgroundColor: UIColor) {
        self.view.backgroundColor = viewBackgroundColor
    }
    
}
