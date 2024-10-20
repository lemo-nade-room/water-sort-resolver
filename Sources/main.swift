let 移動リスト = ゲーム(
  瓶s: [
    .init([.青, .鶯, .水, .水]),
    .init([.紫, .桃, .緑, .灰]),
    .init([.橙, .紫, .赤, .茶]),
    .init([.橙, .桃, .赤, .橙]),
    .init([.鶯, .赤, .黄, .青]),
    .init([.黄, .鶯, .茶, .鶯]),
    .init([.茶, .紫, .赤, .黄緑]),
    .init([.黄緑, .紫, .桃, .黄緑]),
    .init([.緑, .灰, .水, .青]),
    .init([.茶, .黄, .灰, .緑]),
    .init([.灰, .黄, .黄緑, .青]),
    .init([.緑, .水, .桃, .橙]),
    .init([]),
    .init([]),
  ], 最大値: 4
).探索()!

print("💛\(移動リスト.count)手必要")
print(移動リスト.map(\.description).joined(separator: "\n"))
