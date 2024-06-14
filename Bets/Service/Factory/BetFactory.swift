//
//  BetFactory.swift
//  Bets
//
//  Created by David Alarcon on 13/6/24.
//

import Foundation
import BetsCore

protocol Factory {
  associatedtype ItemCreated
  func create() -> ItemCreated
}

enum BetType {
  case `default`
  case winningTeam
  case totalScore
  case playerPerformance
  case firstGoalScorer
  case numberOfFouls
  case cornerKicks
  case yellowCards
  case redCards
  case offsides
  case penalties
  case halfTimeScore
  case cleanSheet
  case hatTrick
  case numberOfSetsWon
  case numberOfAces
  case setScore
}

class BetFactory: Factory {
  var betType: BetType = .default
  
  static func `for`(_ type: BetType) -> BetFactory {
    
    let factory = BetFactory()
    factory.betType = type
    
    return factory
  }
  
  func create() -> Bet {
    switch betType {
    case .default:
      return Bet(name: "Default", sellIn: .zero, quality: .zero)
    case .winningTeam:
      return Bet(name: "Winning team", sellIn: 8, quality: 15)
    case .totalScore:
      return Bet(name: "Total score", sellIn: 5, quality: 26) { bet in
        if bet.quality < 50 {
          bet.quality += 1
          if bet.sellIn < 11 && bet.quality < 50 { bet.quality += 1 }
          if bet.sellIn < 6 && bet.quality < 50 { bet.quality += 1 }
        }
        bet.sellIn -= 1
        if bet.sellIn < 0 { bet.quality = .zero }
      }
    case .playerPerformance:
      return Bet(name: "Player performance", sellIn: 9, quality: 4) { bet in
        if bet.quality < 50 { bet.quality += 1 }
        bet.sellIn -= 1
        if bet.sellIn < 0 && bet.quality < 50 { bet.quality += 1 }
      }
    case .firstGoalScorer:
      return Bet(name: "First goal scorer", sellIn: 10, quality: 49) { bet in
        if bet.quality > 0 { bet.quality -= 1 }
        bet.sellIn -= 1
        if bet.sellIn < 0 && bet.quality > 0 { bet.quality -= 1 }
      }
    case .numberOfFouls:
      return Bet(name: "Number of fouls", sellIn: 4, quality: 21) { bet in
        // TODO: Add update rules as previous bets
      }
    case .cornerKicks:
      return Bet(name: "Corner kicks", sellIn: 9, quality: 32) { bet in
        // TODO: Add update rules as previous bets
      }
    case .yellowCards:
      return Bet(name: "Yellow cards", sellIn: 0, quality: 45) { bet in
        // TODO: Add update rules as previous bets
      }
    case .redCards:
      return Bet(name: "Red cards", sellIn: 2, quality: 11) { bet in
        // TODO: Add update rules as previous bets
      }
    case .offsides:
      return Bet(name: "Offsides", sellIn: 2, quality: 14) { bet in
        // TODO: Add update rules as previous bets
      }
    case .penalties:
      return Bet(name: "Penalties", sellIn: 4, quality: 10) { bet in
        // TODO: Add update rules as previous bets
      }
    case .halfTimeScore:
      return Bet(name: "Half-time score", sellIn: 1, quality: 42) { bet in
        // TODO: Add update rules as previous bets
      }
    case .cleanSheet:
      return Bet(name: "Clean sheet", sellIn: 10, quality: 34) { bet in
        // TODO: Add update rules as previous bets
      }
    case .hatTrick:
      return Bet(name: "Hat trick", sellIn: 9, quality: 32) { bet in
        // TODO: Add update rules as previous bets
      }
    case .numberOfSetsWon:
      return Bet(name: "Number of sets won", sellIn: 8, quality: 17) { bet in
        // TODO: Add update rules as previous bets
      }
    case .numberOfAces:
      return Bet(name: "Number of aces", sellIn: 6, quality: 46) { bet in
        // TODO: Add update rules as previous bets
      }
    case .setScore:
      return Bet(name: "Set score", sellIn: 9, quality: 12) { bet in
        // TODO: Add update rules as previous bets
      }
    }
  }
}
