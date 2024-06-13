public typealias OddVariation = (sellIn: Int, quality: Int)
public typealias OddsUpdateAction = (inout Bet) -> Void

public struct Bet {
  public var name: String
  public var sellIn: Int
  public var quality: Int
  public var update: OddsUpdateAction?
  
  public init(name: String, sellIn: Int, quality: Int, update: OddsUpdateAction? = .none) {
    self.name = name
    self.sellIn = sellIn
    self.quality = quality
    self.update = update
  }
}
