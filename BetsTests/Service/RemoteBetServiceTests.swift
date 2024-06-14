//
//  RemoteBetServiceTests.swift
//  BetsTests
//
//  Created by David Alarcon on 14/6/24.
//

import XCTest
@testable import Bets

final class RemoteBetServiceTests: XCTestCase {
  
  func testLoadBets() async throws {
    let sut = RemoteBetService.instance
    
    let bets = try await sut.loadBets()
    let sutBets = await sut.betsFromFactory
    
    XCTAssertEqual(bets.count, sutBets.count)
  }
  
  func testSaveBets() async throws {
    let sut = RemoteBetService.instance
    let bets = [BetFactory.for(.default).create()]
    
    try await sut.saveBets(bets)
    let sutBets = await sut.betsFromFactory
    
    XCTAssertEqual(bets.count, sutBets.count)
  }
  
}
