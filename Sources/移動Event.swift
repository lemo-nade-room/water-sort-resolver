struct 移動Event: Hashable, Sendable, CustomStringConvertible {
  var from: 瓶
  var to: 瓶

  var description: String {
    "\(from.移動可能な色!): \(from.色識別子) -> \(to.色識別子)"
  }
}
