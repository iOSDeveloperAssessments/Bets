//
//  OddsUpdater.swift
//  BetsCore
//
//  Created by David Alarcon on 13/6/24.
//

import Foundation

public protocol OddsUpdatable {
  func update(_ Bet: (inout Bet))
}

public extension OddsUpdatable {
  func update(_ updatable: (inout Bet)) {
    if let update = updatable.update { update(&updatable) }
  }
}

public class OddsUpdater: OddsUpdatable {
  public init() {}
}
