//
//  BetFactoryTests.swift
//  BetsTests
//
//  Created by David Alarcon on 14/6/24.
//

import XCTest
@testable import Bets

final class BetFactoryTests: XCTestCase {

  func testCreateDefaultBet() {
    let factory = BetFactory.for(.default)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Default")
    XCTAssertEqual(bet.sellIn, 0)
    XCTAssertEqual(bet.quality, 0)
  }
  
  func testCreateWinningTeamBet() {
    let factory = BetFactory.for(.winningTeam)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Winning team")
    XCTAssertEqual(bet.sellIn, 8)
    XCTAssertEqual(bet.quality, 15)
  }
  
  func testCreateTotalScoreBet() {
    let factory = BetFactory.for(.totalScore)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Total score")
    XCTAssertEqual(bet.sellIn, 5)
    XCTAssertEqual(bet.quality, 26)
  }
  
  func testCreatePlayerPerformanceBet() {
    let factory = BetFactory.for(.playerPerformance)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Player performance")
    XCTAssertEqual(bet.sellIn, 9)
    XCTAssertEqual(bet.quality, 4)
  }
  
  func testCreateFirstGoalScorerBet() {
    let factory = BetFactory.for(.firstGoalScorer)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "First goal scorer")
    XCTAssertEqual(bet.sellIn, 10)
    XCTAssertEqual(bet.quality, 49)
  }
  
  func testCreateNumberOfFoulsBet() {
    let factory = BetFactory.for(.numberOfFouls)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Number of fouls")
    XCTAssertEqual(bet.sellIn, 4)
    XCTAssertEqual(bet.quality, 21)
  }
  
  func testCreateCornerKicksBet() {
    let factory = BetFactory.for(.cornerKicks)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Corner kicks")
    XCTAssertEqual(bet.sellIn, 9)
    XCTAssertEqual(bet.quality, 32)
  }
  
  func testCreateYellowCardsBet() {
    let factory = BetFactory.for(.yellowCards)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Yellow cards")
    XCTAssertEqual(bet.sellIn, 0)
    XCTAssertEqual(bet.quality, 45)
  }
  
  func testCreateRedCardsBet() {
    let factory = BetFactory.for(.redCards)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Red cards")
    XCTAssertEqual(bet.sellIn, 2)
    XCTAssertEqual(bet.quality, 11)
  }
  
  func testCreateOffsidesBet() {
    let factory = BetFactory.for(.offsides)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Offsides")
    XCTAssertEqual(bet.sellIn, 2)
    XCTAssertEqual(bet.quality, 14)
  }
  
  func testCreatePenaltiesBet() {
    let factory = BetFactory.for(.penalties)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Penalties")
    XCTAssertEqual(bet.sellIn, 4)
    XCTAssertEqual(bet.quality, 10)
  }
  
  func testCreateHalfTimeScoreBet() {
    let factory = BetFactory.for(.halfTimeScore)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Half-time score")
    XCTAssertEqual(bet.sellIn, 1)
    XCTAssertEqual(bet.quality, 42)
  }
  
  func testCreateCleanSheetBet() {
    let factory = BetFactory.for(.cleanSheet)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Clean sheet")
    XCTAssertEqual(bet.sellIn, 10)
    XCTAssertEqual(bet.quality, 34)
  }
  
  func testCreateHatTrickBet() {
    let factory = BetFactory.for(.hatTrick)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Hat trick")
    XCTAssertEqual(bet.sellIn, 9)
    XCTAssertEqual(bet.quality, 32)
  }
  
  func testCreateNumberOfSetsWonBet() {
    let factory = BetFactory.for(.numberOfSetsWon)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Number of sets won")
    XCTAssertEqual(bet.sellIn, 8)
    XCTAssertEqual(bet.quality, 17)
  }
  
  func testCreateNumberOfAcesBet() {
    let factory = BetFactory.for(.numberOfAces)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Number of aces")
    XCTAssertEqual(bet.sellIn, 6)
    XCTAssertEqual(bet.quality, 46)
  }
  
  func testCreateSetScoreBet() {
    let factory = BetFactory.for(.setScore)
    let bet = factory.create()
    
    XCTAssertEqual(bet.name, "Set score")
    XCTAssertEqual(bet.sellIn, 9)
    XCTAssertEqual(bet.quality, 12)
  }

}
