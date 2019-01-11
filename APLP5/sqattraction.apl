⎕IO←0
mag←{√+/⍵*2} ⋄ norm←{⍵÷ mag ⍵} 
constrain←{n←⍺ ⋄low high←⍵ ⋄ low⌈n⌊high}



origin ← 2÷⍨ P5.size← w h ←800 800
G←P5.G

P5.setup ← {}
P5.lm.c  ← {newBall ⍵} ⍝ creates a ball on click

vecs←⍬ 2∘⍴ ⋄ join←{↓,/vecs¨⍵}
⎕←'ding'
newBall  ← {
  loc ,← ⍵ 
  vel ,← 0 0
  dim ,← d←5+2⍴?20
  acc ,← .0 0
  mass,← d÷2
  angl,← 0 0
  avel,← 0 0 
  aacc,← .001 0
}   
⎕←'ding'


loc vel dim acc mass angl avel aacc← ⍬ ⍬ ⍬ ⍬ ⍬ ⍬ ⍬ ⍬
sun←↓2 2⍴origin, 100 100
newBall  40 40 ⋄ newBall  500 600 ⋄ newBall  300 600

attract ←{l2 m2←{(≢⊃⍺)⍴⍵}¨↓vecs ⍵ ⋄ l1 m1←⍺
  dir  ← norm l2-l1               ⍝ direction from ⍺ to ⍵
  r    ← (mag dir) constrain 5 25 ⍝ the denominator for attraction equation
  str  ← (.01×m1×m2) ÷ r*2        ⍝ force
  dir×str                         ⍝ direction × force
}

gfx←{l d a←⎕←↓vecs ⍵

  G.fill ← 'fff' 
  G.pum ⍬
  G.translate l
  G.rotate ⊃a
  'radius' G.rect 0 0,d
  G.pom ⍬
}

P5.draw  ← {
  c      ← (≢loc)÷2                               ⍝ number of balls
  sforce ← (lms←loc mass) attract ,/sun           ⍝ force of the sun
  forces ← ∊¨ ↓c c⍴ ↓vecs ∊ lms∘attract¨ join lms ⍝ all balls attracted to all other balls
  loc   +← vel +← sforce+ (+/⍉forces)       ⍝ update balls location and velocity
  angl  +← avel +←aacc
  G.bg  'fff' ⋄ G.fill←'FFFF00'
  'radius' G.ellipse  join sun
  gfx ¨join loc dim angl
  
}