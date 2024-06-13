//
//  OddsUpdater.swift
//  BetsCore
//
//  Created by David Alarcon on 13/6/24.
//

import Foundation

protocol Updater {
  associatedtype Updatable
  static func update(_ updatable: (inout Updatable))
}

class OddsUpdater: Updater {
  static func update(_ updatable: (inout Bet)) {
    if let update = updatable.update {
      update(&updatable)
    }
  }
}
