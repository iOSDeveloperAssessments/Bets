//
//  OddsListViewControllerViewModelTests.swift
//  BetsCoreTests
//
//  Created by David Alarcon on 14/6/24.
//

import XCTest
@testable import BetsCore
@testable import Bets

final class OddsListViewControllerViewModelTests: XCTestCase {

    func testUpdateOdds() async throws {
      let updater = TestUpdaterSpy()

      let sut = OddsListViewControllerViewModel(repository: .init(service: RemoteBetService.instance, updater: updater))
      
      try await sut.updateOdds()
      
      XCTAssertTrue(updater.updateCalled)
    }
}

class TestUpdaterSpy: OddsUpdatable {
  var updateCalled = false
  func update(_ Bet: inout (Bet)) {
    updateCalled = true
  }
}
