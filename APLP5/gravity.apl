⎕IO←0
mag←{√+/⍵*2}⋄norm←{⍵ ÷ mag ⍵}
constrain←{n←⍺⋄low high←⍵⋄low⌈n⌊high}

origin ← 2÷⍨ P5.size←w h←800 800
G←P5.G

P5.setup ← {}
P5.lm.c  ← {newBall⍵} ⍝ creates a ball on click

vecs←{⍬ 2⍴⍵} ⋄ join←{↓,/vecs¨⍵}
newBall  ← {
  loc ,← ⍵ 
  vel ,← 2⍴0
  dim ,← d←5+2⍴?20
  acc ,← 0 0
  mass,←d÷2
}   

attract ←∘.{l1 m1←↓vecs⍵ ⋄ l2 m2←↓vecs⍺
  direction←norm l2-l1
  r←(mag direction) constrain 5 25
  str←(.001×m1×m2)÷(r*2)
  direction×str
}

loc vel dim acc mass←⍬ ⍬ ⍬ ⍬ ⍬  ⍝ initialize variables
sun←origin, 100 100
newBall  40 40

P5.draw ← {
  ⎕←P5.fps
  sforce← ∊(⊂sun) attract join loc mass ⍝ sun attracts all balls
  forces← ↑,/attract ⍨join loc mass       ⍝ attract each ball to each other
  loc +← vel +← sforce+ +/⍉forces         ⍝ combine forces
  
  G.bg  'fff' ⋄ G.fill←'FFFF00'
  'radius' G.ellipse sun
  G.fill ← 'fff' 
  'radius' G.ellipse join loc dim
}