//
//  FirstViewController.swift
//  GameOfLifeSwift
//
//  Created by Jan Broeze on 16-10-14.
//  Copyright (c) 2014 stekks. All rights reserved.
//

import UIKit

var GridSize = 12
var IntervalTime: Float = 1000

class FirstViewController: UIViewController {

    @IBOutlet var gridSize: UITextField!
    @IBOutlet var gridSizeStepper: UIStepper!
    @IBOutlet var timeSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.gridSize.text = GridSize.description
        self.timeSlider.value = IntervalTime
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func oneClicker(sender: UIStepper) {
        self.gridSize.text = Int(sender.value).description
        GridSize = Int(sender.value)
    }

    @IBAction func timeSliderChanged(sender: UISlider) {
        IntervalTime = sender.value
        self.timeLabel.text = "\(Int(sender.value)) ms"
    }
}

