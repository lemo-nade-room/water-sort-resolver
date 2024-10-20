import Algorithms
import Foundation

struct ゲーム: Hashable, Sendable {
    let 瓶s: [瓶]
    var 最大値: Int
    
    init(瓶s: [瓶], 最大値: Int) {
        self.瓶s = 瓶s.sorted()
        self.最大値 = 最大値
    }
    
    func 探索() -> [移動Event]? {
        var 履歴一覧: [(events: [移動Event], ゲーム: ゲーム)] = [(events: [], self)]
        var 過去のゲーム一覧: Set<ゲーム> = [self]
        var level = 0
        var start = Date()
        print("手数\ttime\tqueue")
        while let (events, ゲーム) = 履歴一覧.first {
            履歴一覧 = Array(履歴一覧.dropFirst())
            for event in ゲーム.移動EventSet.sorted(by: { $0.from < $1.from }) {
                var ゲーム = ゲーム
                ゲーム.apply(event)
                if ゲーム.クリア { return events + [event] }
                if 過去のゲーム一覧.contains(ゲーム) { continue }
                履歴一覧.append((events: events + [event], ゲーム))
                過去のゲーム一覧.insert(ゲーム)
                if events.count > level {
                    level = events.count
                    print("\(level)\t\(round(Date().timeIntervalSince(start) * 1000) / 1000)\t\(履歴一覧.count)")
                    start = Date()
                }
            }
        }
        return nil
    }
    
    private var 移動EventSet: Set<移動Event> {
        .init(Array(product(瓶s, 瓶s))
            .filter { $0 != $1 }
            .filter { $0.移動可能(to: $1, 最大値: 最大値) }
            .map { 移動Event(from: $0, to: $1) }
        )
    }
    
    private var クリア: Bool {
        瓶s.allSatisfy { $0.クリア(最大値: 最大値) }
    }
    
    private mutating func apply(_ event: 移動Event) {
        var 瓶s = self.瓶s
        let fromIndex = 瓶s.firstIndex(where: { $0 == event .from })!
        let toIndex = 瓶s.firstIndex(where: { $0 == event.to })!
        瓶s[fromIndex].移動する()
        瓶s[toIndex].受け取る(event)
        self = .init(瓶s: 瓶s, 最大値: 最大値)
    }
}
