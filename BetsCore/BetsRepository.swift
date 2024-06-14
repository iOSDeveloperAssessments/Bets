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
/*
    public func updateOdds() async throws -> [Bet] {
        var bets = try await service.loadBets()
        
        for i in 0 ..< bets.count {
            if bets[i].name != "Player performance", bets[i].name != "Total score" {
                if bets[i].quality > 0 {
                    if bets[i].name != "Winning team" {
                        bets[i].quality = bets[i].quality - 1
                    }
                }
            } else {
                if bets[i].quality < 50 {
                    bets[i].quality = bets[i].quality + 1

                    if bets[i].name == "Total score" {
                        if bets[i].sellIn < 11 {
                            if bets[i].quality < 50 {
                                bets[i].quality = bets[i].quality + 1
                            }
                        }

                        if bets[i].sellIn < 6 {
                            if bets[i].quality < 50 {
                                bets[i].quality = bets[i].quality + 1
                            }
                        }
                    }
                }
            }

            if bets[i].name != "Winning team" {
                bets[i].sellIn = bets[i].sellIn - 1
            }

            if bets[i].sellIn < 0 {
                if bets[i].name != "Player performance" {
                    if bets[i].name != "Total score" {
                        if bets[i].quality > 0 {
                            if bets[i].name != "Winning team" {
                                bets[i].quality = bets[i].quality - 1
                            }
                        }
                    } else {
                        bets[i].quality = bets[i].quality - bets[i].quality
                    }
                } else {
                    if bets[i].quality < 50 {
                        bets[i].quality = bets[i].quality + 1
                    }
                }
            }
        }

        try await service.saveBets(bets)
        return bets
    } */
  
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
