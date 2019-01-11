map←{s e ns ne←⍺⋄ns+(ne-ns)×(e-s)÷⍨⍵-s}
size←800 800
origin←size÷2
P5.size←size
G ← P5.G

P5.setup ← {
  G.bg 256⊥1 255 255 255
}

n x y←3⍴0
P5.draw ← {
  x1← x+.5
  y1← 0 1 0 800 map ⎕←P5.Noise (n+←.01)

  ⍝G.stroke←{256⊥ 255, ? 3⍴ 255}⍬
  1 G.line x y x1 y1
  1 G.line x1 y1 x1 800
  x⊢←x1⋄y⊢←y1
}