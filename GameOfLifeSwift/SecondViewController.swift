//
//  SecondViewController.swift
//  GameOfLifeSwift
//
//  Created by Jan Broeze on 16-10-14.
//  Copyright (c) 2014 stekks. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    enum GameState {
        case Started, Stopped
    }
    
    let xOffset: UInt8 = 10
    let yOffset:UInt8 = 100
    let gridElementSize: UInt8 = 25
    let margin:UInt8 = 5
    
    var gameState: GameState = .Stopped
    var timer: NSTimer!
    
    @IBOutlet weak var startStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // init vars
        self.gameState = .Stopped
        
        // create grid of views(?) depending on size of main view
        createGrid()
        // create timer according to interval parameter when start button is pressed
        // change grid in LifeLogic according to the grid on the screen
        // call LifeLogic on timer events
        // change grid on the screen according to next generation of LifeLogic grid
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startStopButtonClicked(sender: UIButton) {
        if (self.gameState == .Stopped) {
            self.gameState = .Started
            // start timer
            self.timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(IntervalTime/1000), target: self, selector: Selector("updateGrid"), userInfo: nil, repeats: true)
            // update button text
            self.startStopButton.setTitle("Start", forState: UIControlState.Normal)
        }
        else {
            self.gameState = .Stopped
            // stop timer
            self.timer.invalidate()
            self.timer = nil
            // update button text
            self.startStopButton.setTitle("Stop", forState: UIControlState.Normal)
        }
    }
    
    func createGrid()
    {
        // draw grid with lines (maybe not needed if 'smart' images are chosen)
        
        // fill grid with (scaled!) UIImageViews of 'dead' cells. (dead cells are white, life cells are black?)
        // connect on-click eventhandler on over UIImageView
        /*
        for x in 0..<GridSize {
            for y in 0..<GridSize {
                var imageView = UIImageView(
                    frame: CGRectMake(
                        CGFloat(x * gridElementSize + xOffset),
                        CGFloat(y * gridElementSize + yOffset),
                        CGFloat(gridElementSize),
                        CGFloat(gridElementSize))
                )
                println("\(x) \(y)")
                imageView.contentMode = UIViewContentMode.ScaleAspectFit;
                var image = UIImage(named: "cell_white.png")
                imageView.image = image
                self.view.addSubview(imageView)   <- crashes on 7th iteration.. why?
                imageView.tag = Int((x * 100) + y)
                // imageView.touchesEnded(<#touches: NSSet#>, withEvent: <#UIEvent#>)
            }
        } 
        */
        // fill tag value of every UIImageView: x+(y*size) so we can deduce the position in the 2d-array
    }
    
    // called by timer
    func updateGrid()
    {
        // LifeLogic.calculateNextGeneration
        println("timerinterval fired")        
    }

}

