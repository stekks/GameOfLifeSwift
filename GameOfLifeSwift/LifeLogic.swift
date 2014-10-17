//
//  LifeLogic.swift
//  GameOfLifeSwift
//
//  Created by Jan Broeze on 16-10-14.
//  Copyright (c) 2014 stekks. All rights reserved.
//

import Foundation

public class LifeLogic {
    public var grid : [[Bool]]
    var size : Int
    
    public init(size: Int)
    {
        self.grid = [[Bool]](count: size, repeatedValue: [Bool](count: size, repeatedValue: false))
        self.size = size
    }
    
    // logic of the game comes here
    public func calculateNextGeneration()
    {
        // create new grid
        var newGrid = [[Bool]](count: size, repeatedValue: [Bool](count: size, repeatedValue: false))
        
        // apply rules to new grid and put results in new grid
        for i in 0...size-1 {
            for j in 0...size-1 {
                switch countNeighbours(i, y: j) {
                    case 0...1 : newGrid[i][j] = false
                    case 2     : newGrid[i][j] = grid[i][j]
                    case 3     : newGrid[i][j] = true
                    default:     newGrid[i][j] = false
                }
            }
        }
        
        grid = newGrid
        // ideas:
        // - extension method on [[Bool]] to calculate neighbours <- not possible to extend an 2d array?
        // - use new switch statement with grouped cases
        // - store state of grid + settings? (Core Data)
    }
    
    func countNeighbours(x: Int, y: Int) -> Int {
        var count = 0
        
        for i in x-1...x+1 {
            if i >= 0 && i <= size-1 {
                for j in y-1...y+1 {
                    if j >= 0 && j <= size-1 && !( x == i && y == j ) {
                        if grid[i][j] == true {
                            count++
                        }
                    }
                }
            }
        }
        
        return count
    }
}