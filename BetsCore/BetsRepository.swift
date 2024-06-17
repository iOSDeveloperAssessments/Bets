public protocol BetService {
  func loadBets() async throws -> [Bet]
  func saveBets(_ bets: [Bet]) async throws
}

public protocol Repository {
  func updateOdds() async throws -> [Bet]
}

public class BetRepository: Repository {
  private let service: BetService
  private let oddsUpdater: OddsUpdatable
  
  public init(service: BetService, updater: OddsUpdatable) {
    self.service = service
    self.oddsUpdater = updater
  }
  
  public func updateOdds() async throws -> [Bet] {
    var bets = try await service.loadBets()
    
    bets.updateEach { self.oddsUpdater.update(&$0) }
    
    try await service.saveBets(bets)
    
    return bets
  }
}

extension MutableCollection {
  mutating func updateEach(_ update: (inout Element) -> Void) {
    for i in indices {
      update(&self[i])
    }
  }
}
