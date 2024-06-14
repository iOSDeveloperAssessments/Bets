import BetsCore

actor RemoteBetService: BetService {
    private static let delay: UInt64 = 1_000_000_000
    
    public static let instance = RemoteBetService()
    
    private init() { }
  
  /// 1. Just add new bets
  /*
  private var bets: [Bet] = [
    Bet(name: "Winning team", sellIn: 8, quality: 15),
    Bet(name: "Total score", sellIn: 5, quality: 26) { bet in
      if bet.quality < 50 {
        bet.quality += 1
        if bet.sellIn < 11 && bet.quality < 50 { bet.quality += 1 }
        if bet.sellIn < 6 && bet.quality < 50 { bet.quality += 1 }
      }
      bet.sellIn -= 1
      if bet.sellIn < 0 { bet.quality = .zero }
    },
    Bet(name: "Player performance", sellIn: 9, quality: 4) { bet in
      if bet.quality < 50 { bet.quality += 1 }
      bet.sellIn -= 1
      if bet.sellIn < 0 && bet.quality < 50 { bet.quality += 1 }
    },
    Bet(name: "First goal scorer", sellIn: 10, quality: 49) { bet in
      if bet.quality > 0 { bet.quality -= 1 }
      bet.sellIn -= 1
      if bet.sellIn < 0 && bet.quality > 0 { bet.quality -= 1 }
    },
    Bet(name: "Number of fouls", sellIn: 4, quality: 21) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Corner kicks", sellIn: 9, quality: 32) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Yellow cards", sellIn: 0, quality: 45) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Red cards", sellIn: 2, quality: 11) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Offsides", sellIn: 2, quality: 14) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Penalties", sellIn: 4, quality: 10) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Half-time score", sellIn: 1, quality: 42) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Clean sheet", sellIn: 10, quality: 34) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Hat trick", sellIn: 9, quality: 32) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Number of sets won", sellIn: 8, quality: 17) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Number of aces", sellIn: 6, quality: 46) { bet in
      // TODO: Add update rules as previous bets
    },
    Bet(name: "Set score", sellIn: 9, quality: 12) { bet in
      // TODO: Add update rules as previous bets
    },
  ] */
  
  /// 2. Factory pattern
  private(set) var betsFromFactory: [Bet] = [
    BetFactory.for(.winningTeam).create(),
    BetFactory.for(.totalScore).create(),
    BetFactory.for(.playerPerformance).create(),
    BetFactory.for(.firstGoalScorer).create(),
    BetFactory.for(.numberOfFouls).create(),
    BetFactory.for(.cornerKicks).create(),
    BetFactory.for(.yellowCards).create(),
    BetFactory.for(.redCards).create(),
    BetFactory.for(.offsides).create(),
    BetFactory.for(.penalties).create(),
    BetFactory.for(.halfTimeScore).create(),
    BetFactory.for(.cleanSheet).create(),
    BetFactory.for(.hatTrick).create(),
    BetFactory.for(.numberOfSetsWon).create(),
    BetFactory.for(.numberOfAces).create(),
    BetFactory.for(.setScore).create()
  ]
  
  func loadBets() async throws -> [Bet] {
    try await Task.sleep(nanoseconds: RemoteBetService.delay)
    return betsFromFactory
  }
  
  func saveBets(_ bets: [Bet]) async throws {
    try await Task.sleep(nanoseconds: RemoteBetService.delay)
    self.betsFromFactory = bets
  }
}
