//
//  BetRepositoryTests.swift
//  BetsScoreTests
//
//  Created by David Alarcon on 14/6/24.
//

import XCTest
import BetsCore
@testable import Bets

final class BetRepositoryTests: XCTestCase {
  
  func testUpdateOddsCheckService() async throws {
    let service = TestBetServiceSpy()
    
    let sut = BetRepository(service: service, updater: OddsUpdater())
    
    try await _ = sut.updateOdds()
    
    XCTAssertTrue(service.loadBetsCalled)
    XCTAssertTrue(service.saveBetsCalled)
  }
  
  func testUpdateOddsCheckUpdater() async throws {
    let updater = TestUpdaterSpy()
    
    let sut = BetRepository(service: TestBetServiceSpy(), updater: updater)
    
    try await _ = sut.updateOdds()
    
    XCTAssertTrue(updater.updateCalled)
  }
}

class TestUpdaterSpy: OddsUpdatable {
  var updateCalled = false
  func update(_ Bet: inout (Bet)) {
    updateCalled = true
  }
}

class TestBetServiceSpy: BetService {
  var loadBetsCalled = false
  var saveBetsCalled = false
  
  func loadBets() async throws -> [Bet] { loadBetsCalled = true; return [BetFactory.for(.default).create()] }
  func saveBets(_ bets: [Bet]) async throws { saveBetsCalled = true }
}
