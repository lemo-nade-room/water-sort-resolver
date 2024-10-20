import Testing

@testable import WaterSortResolver

@Suite
struct ゲームTests {
  @Test func クリア方法を出せる() async throws {
    let ゲーム = ゲーム(
      瓶s: [
        .init([.灰, .水, .橙, .灰]),
        .init([.灰, .灰, .橙, .水]),
        .init([.水, .橙, .水, .橙]),
        .init([]),
      ], 最大値: 4)

    let イベントリスト = try #require(ゲーム.探索())

    #expect(
      イベントリスト.map(\.description) == [
        "灰: 灰-水-橙-灰 -> []",
        "水: 水-橙-水-橙 -> 水-橙-灰",
        "灰: 灰-灰-橙-水 -> 灰",
        "橙: 橙-水 -> 橙-水-橙",
        "水: 水-水-橙-灰 -> 水",
        "橙: 橙-橙-水-橙 -> 橙-灰",
        "水: 水-橙 -> 水-水-水",
        "橙: 橙-橙-橙-灰 -> 橙",
        "灰: 灰 -> 灰-灰-灰",
      ])
  }
}
