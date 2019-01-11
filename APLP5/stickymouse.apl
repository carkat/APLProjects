map←{s e ns ne←⍺⋄ns+(ne-ns)×(e-s)÷⍨⍵-s}
size←800 800⋄origin←size÷2
P5.size←size⋄G ← P5.G

P5.setup ← {
}

P5.draw ← {
  G.bg 256⊥1 255 255 255
  m←P5.mx P5.my
  1 G.line  origin, m
}