public typealias OddVariation = (sellIn: Int, quality: Int)

public struct Bet {
  public var name: String
  public var sellIn: Int
  public var quality: Int
  public var variation: OddVariation
  
  public init(name: String, sellIn: Int, quality: Int, variation: OddVariation = (.zero, .zero)) {
    self.name = name
    self.sellIn = sellIn
    self.quality = quality
    self.variation = variation
  }
}
