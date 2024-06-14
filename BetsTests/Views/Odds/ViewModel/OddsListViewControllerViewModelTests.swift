//
//  OddsListViewControllerViewModelTests.swift
//  BetsTests
//
//  Created by David Alarcon on 14/6/24.
//

import XCTest
import BetsCore
@testable import Bets

final class OddsListViewControllerViewModelTests: XCTestCase {
  
  func testUpdateOdds() async throws {
    let repository = TestBetRepositorySpy()
    let sut = OddsListViewControllerViewModel(repository: repository)
    
    try await sut.updateOdds()
    
    XCTAssertTrue(repository.updateOddsCalled)
  }
}

class TestBetRepositorySpy: Repository {
  var updateOddsCalled = false
  func updateOdds() async throws -> [Bet] {
    updateOddsCalled = true
    
    return []
  }
}
