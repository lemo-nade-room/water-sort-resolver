import Testing

@testable import WaterSortResolver

@Suite struct 瓶Tests {
  @Test func 十分に空きがあり先頭色が同じ場合移動可能() {
    let 移動元 = 瓶([.灰, .灰, .橙, .灰])
    let 移動先 = 瓶([.灰, .水])

    #expect(移動元.移動可能(to: 移動先, 最大値: 4) == true)
  }
  @Test func 先頭色が異なる場合移動できない() {
    let 移動元 = 瓶([.灰, .灰, .橙, .灰])
    let 移動先 = 瓶([.水])

    #expect(移動元.移動可能(to: 移動先, 最大値: 4) == false)
  }
  @Test func 先頭色が同じでも十分に空きがない場合移動できない() {
    let 移動元 = 瓶([.灰, .灰, .橙, .灰])
    let 移動先 = 瓶([.灰, .灰, .水])

    #expect(移動元.移動可能(to: 移動先, 最大値: 4) == false)
  }
  @Test func 移動する() {
    var 移動元 = 瓶([.灰, .灰, .橙, .灰])

    移動元.移動する()

    #expect(移動元 == 瓶([.橙, .灰]))
  }
  @Test func 受け取る() {
    let 移動元 = 瓶([.灰, .灰, .橙, .灰])
    var 移動先 = 瓶([.灰, .水])
    let event = 移動Event(from: 移動元, to: 移動先)

    移動先.受け取る(event)

    #expect(移動先 == 瓶([.灰, .灰, .灰, .水]))
  }
  @Test func 空ならクリア() {
    let 瓶 = 瓶([])

    #expect(瓶.クリア(最大値: 4) == true)
  }
  @Test func 色が全て同じかつ満タンならクリア() {
    let 瓶 = 瓶([.灰, .灰, .灰, .灰])

    #expect(瓶.クリア(最大値: 4) == true)
  }
  @Test func 満タンでないならクリアでない() {
    let 瓶 = 瓶([.灰, .灰, .灰])

    #expect(瓶.クリア(最大値: 4) == false)
  }
  @Test func 二色以上あればクリアでない() {
    let 瓶 = 瓶([.桃, .灰, .灰, .灰])

    #expect(瓶.クリア(最大値: 4) == false)
  }
}
