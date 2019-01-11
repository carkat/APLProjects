⎕IO←0
mag←{√+/⍵*2} ⋄ norm←{⍵÷ mag ⍵} 
constrain←{n←⍺ ⋄low high←⍵ ⋄ low⌈n⌊high}
origin ← 2÷⍨ P5.size← w h ←800 800
G←P5.G

P5.setup ← {}
P5.lm.c  ← {newBall ⍵} ⍝ creates a ball on click

attract ←{l2 m2←{(≢⊃⍺)⍴⍵}¨↓vecs ⍵ ⋄ l1 m1←⍺
  dir  ← norm l2-l1               ⍝ direction from ⍺ to ⍵
  r    ← (mag dir) constrain 5 25 ⍝ the denominator for attraction equation
  str  ← (.01×m1×m2) ÷ r*2        ⍝ force
  dir×str                         ⍝ direction × force
}

vecs←⍬ 2∘⍴ ⋄ join←{↓,/vecs¨⍵}
newBall  ← {
  loc ,← ⍵ 
  vel ,← 0 0
  dim ,← d←50 50 
  acc ,← .0 0
  mass,← d÷2
  angl,← 0 0
  avel,← 0 0 
  aacc,← .001 0
}   

loc vel dim acc mass angl avel aacc← ⍬ ⍬ ⍬ ⍬ ⍬ ⍬ ⍬ ⍬
newBall origin


r←100
gfx←{l d a←⎕←↓vecs ⍵
  x y←r×((≢l)⍴2 1)○⊃a
  G.fill ← 'fff' 
  G.translate l
  1 G.line 0 0 x y
  'radius' G.ellipse x y,d
}

P5.draw  ← {
  angl+←avel+←aacc
  G.bg 'fff'
  G.fill←'fff'
  gfx¨join loc dim angl
  
}