//
//  GameOfLifeSwiftTests.swift
//  GameOfLifeSwiftTests
//
//  Created by Jan Broeze on 16-10-14.
//  Copyright (c) 2014 stekks. All rights reserved.
//

import UIKit
import XCTest
import GameOfLifeSwift

class GameOfLifeSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBlinkerFirstGeneration() {
        // arrange
        var game: LifeLogic = LifeLogic(size: 5)
        
        // blinker stage 1
        game.grid = [
            [false, false, false, false, false],
            [false, false, true,  false, false],
            [false, false, true,  false, false],
            [false, false, true,  false, false],
            [false, false, false, false, false],
        ]
        
        // blinker stage 2
        var blinkerStage2 = [
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, true,  true,  true,  false],
            [false, false, false, false, false],
            [false, false, false, false, false],
        ]
        // act
        game.calculateNextGeneration()
        // assert
        XCTAssert(game.grid == blinkerStage2, "Blinker first generation works")
    }
    
    func testBlinkerTwoGenerations() {
        // arrange
        var game: LifeLogic = LifeLogic(size: 5)
        
        // blinker stage 1
        game.grid = [
            [false, false, false, false, false],
            [false, false, true,  false, false],
            [false, false, true,  false, false],
            [false, false, true,  false, false],
            [false, false, false, false, false],
        ]
        
        // blinker stage 2
        var blinkerStage2 = [
            [false, false, false, false, false],
            [false, false, true,  false, false],
            [false, false, true,  false, false],
            [false, false, true,  false, false],
            [false, false, false, false, false],
        ]
        // act
        game.calculateNextGeneration()
        game.calculateNextGeneration()
        // assert
        XCTAssert(game.grid == blinkerStage2, "Blinker second generation works")
    }
    
}
