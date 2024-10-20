struct 瓶: Hashable, Sendable {
  var 色リスト: [色]

  init(_ 色リスト: [色]) {
    self.色リスト = 色リスト
  }

  func クリア(最大値: Int) -> Bool {
    色リスト.isEmpty || (色リスト.count == 最大値 && Set(色リスト).count == 1)
  }

  mutating func 受け取る(_ event: 移動Event) {
    色リスト =
      Array(
        repeating: event.from.移動可能な色!,
        count: event.from.移動可能な数
      ) + 色リスト
  }

  mutating func 移動する() {
    let 移動する色 = 移動可能な色!
    while let 一番上の色 = 色リスト.first, 一番上の色 == 移動する色 {
      色リスト.removeFirst()
    }
  }

  func 移動可能(to 瓶: Self, 最大値: Int) -> Bool {
    guard let 移動可能な色, 瓶.受け入れ可能な色リスト(最大値: 最大値).contains(移動可能な色) else {
      return false
    }
    return 移動可能な数 <= 瓶.受け入れ可能な数(最大値: 最大値)
  }

  private func 受け入れ可能な色リスト(最大値: Int) -> Set<色> {
    guard 受け入れ可能な数(最大値: 最大値) > 0 else {
      return []
    }
    if let 一番上の色 = 色リスト.first {
      return Set([一番上の色])
    }
    return Set(色.allCases)
  }

  private func 受け入れ可能な数(最大値: Int) -> Int {
    最大値 - 色リスト.count
  }

  var 移動可能な色: 色? { 色リスト.first }

  private var 移動可能な数: Int {
    guard let 移動可能な色 else { return 0 }
    for (index, 色) in 色リスト.enumerated() {
      if 色 == 移動可能な色 { continue }
      return index
    }
    return 色リスト.count
  }
}

extension 瓶: Comparable {
  static func < (lhs: 瓶, rhs: 瓶) -> Bool {
    lhs.色識別子 < rhs.色識別子
  }
  var 色識別子: String {
    if 色リスト.isEmpty { return "[]" }
    return 色リスト.map(\.rawValue).joined(separator: "-")
  }
}
