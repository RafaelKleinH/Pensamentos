//
//  SetingsViewController.swift
//  Pensamentos
//
//  Created by Rafael Hartmann on 10/03/21.
//

import UIKit

class SetingsViewController: UIViewController {

    
    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!

    @IBOutlet weak var lbTimeInterval: UILabel!
    @IBOutlet weak var scColorTheme: UISegmentedControl!
    
    
    let config = Configuration.shared
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
        
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        formatView()
    }
    func formatView() {
        swAutoRefresh.setOn(config.autoRefresh, animated: false)
        slTimeInterval.setValue(Float(config.timeInterval), animated: false)
        scColorTheme.selectedSegmentIndex = config.colorScheme
        changeTimeIntervalLabel(with: config.timeInterval)
    }
    func changeTimeIntervalLabel(with value: Double){
        lbTimeInterval.text = "Mudar após \(value) segundos"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue:"Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }

}
