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
    
    let xOffset = 10
    let yOffset = 100
    let gridElementSize = 25
    let margin = 5
    
    var gameState: GameState = .Stopped
    var timer: NSTimer!
    var gameOfLife: LifeLogic!
    var buttonGrid = [[UIButton?]](count: 20, repeatedValue: [UIButton?](count: 20, repeatedValue: nil))
    
    @IBOutlet weak var startStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gameOfLife = LifeLogic(size: GridSize)
        self.gameState = .Stopped
        createGrid()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        var imageTag:Int = 0
        
        // draw a grid of buttons
        for x in 0..<GridSize {
            for y in 0..<GridSize{
                var imageButton = UIButton(
                    frame: CGRectMake(
                        CGFloat(x * gridElementSize + xOffset),
                        CGFloat(y * gridElementSize + yOffset),
                        CGFloat(gridElementSize),
                        CGFloat(gridElementSize))
                )

                imageButton.setImage(UIImage(named: "cell_white.png"), forState: UIControlState.Normal)
                imageButton.imageView?.contentMode = .ScaleAspectFit;
                imageButton.tag = imageTag++
                imageButton.addTarget(self, action: "cellButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
                self.view.addSubview(imageButton)
                self.buttonGrid[x][y] = imageButton
            }
        }
    }
    
    // called by timer
    func updateGrid()
    {
        gameOfLife.calculateNextGeneration()
     
        for x in 0..<GridSize {
            for y in 0..<GridSize{
                if self.gameOfLife.grid[x][y] {
                    self.buttonGrid[x][y]!.setImage(UIImage(named: "cell_black.png"), forState: UIControlState.Normal)
                } else {
                    self.buttonGrid[x][y]!.setImage(UIImage(named: "cell_white.png"), forState: UIControlState.Normal)
                }
            }
        }
    }
    
    @IBAction func cellButtonClicked(sender: UIButton) {
        if gameState == .Stopped {
            // calculate x/y coordinates
            let x = sender.tag / GridSize
            var y = sender.tag % GridSize
            
            // update visual and game grid
            if sender.currentImage! == UIImage(named: "cell_black.png") {
                sender.setImage(UIImage(named: "cell_white.png"), forState: UIControlState.Normal)
                self.gameOfLife.grid[x][y] = false
            } else
            {
                sender.setImage(UIImage(named: "cell_black.png"), forState: UIControlState.Normal)
                self.gameOfLife.grid[x][y] = true
            }
        }
    }
}

