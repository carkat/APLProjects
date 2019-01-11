⎕IO←0
map←{s e ns ne←⍺⋄ns+(ne-ns)×(e-s)÷⍨⍵-s}
crand←{256⊥ ⍵, ? 3⍴ 255}

size←800 800
origin←size÷2 ⋄ P5.size←size ⋄ G ← P5.G

P5.setup ← {
  G.bg 256⊥1 255 255 255
}

GetDir←{{⍵⌷¯1 1}¨(⍵<800)∧⍵>0}
speed ← 5 6.5
ball ← 40 180

P5.draw ← {
  G.Stroke← crand 255 ⋄ G.fill  ← crand 255 
  'radius' G.ellipse ball, 30 30
  ball+←speed×←⎕←GetDir ball
}