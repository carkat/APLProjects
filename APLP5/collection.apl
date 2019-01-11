⎕IO←0
mag←{√+/⍵*2} ⋄ norm←{⍵ ×∘÷ mag ⍵} ⋄ setMag←{⍺×norm ⍵} ⋄ limit←{(×⍺)×⍵⌊|⍺} 
map←{s e ns ne←⍺⋄ns+(ne-ns)×(e-s)÷⍨⍵-s} ⋄ constrain←{n←⍺⋄low high←⍵⋄low⌈n⌊high}
randColor←{256⊥⍵,?3⍴255}

contain←{aspect←⍵                                  ⍝ contain an object to the screen
  {loc⊢←(aspect×~⍵)+loc×⍵ ⋄ vel×←dir¨⍵} loc<aspect ⍝ contain right and bottom
  {loc×←⍵⋄vel×←dir¨⍵} 0<loc                        ⍝ contain left and top
}

friction←{⍵ ×∊ norm¨vecs vel} ⍝ apply friction
drag    ←{(⍺ friction ⍵) × ⍺*2} ⍝ apply drag


id←{⍵ ⍵ ⍴ 1 , ⍵ ⍴ 0}

origin ← 2÷⍨ P5.size←w h←800 800
G←P5.G

P5.setup ← {}
P5.lm.c  ← {newBall⍵} ⍝ creates a ball on click

vecs←{⍬ 2⍴⍵} ⋄ join←{↓,/vecs¨⍵} ⋄ dir←{⍵ ⊇¯1 1}
newBall←{
  loc ,← ⍵ 
  vel ,← 0 0
  dim ,← d←5+2⍴?20
  acc ,← .0 0
  mass,←d÷2
}   

attract ←∘.{l1 m1←↓vecs⍵ ⋄ l2 m2←↓vecs⍺ ⍝ gravitational attraction
  direction←norm l2-l1
  r←(mag direction) constrain 5 25
  str←(.001×m1×m2)÷(r*2)
  direction×str
}

loc vel dim acc mass←⍬ ⍬ ⍬ ⍬ ⍬ 
sun ←origin, 100 100
newBall  40 40

P5.draw ← {
  a←2÷⍨count ← ≢loc
  sforce← ∊(⊂,/sun) attract join loc mass
  forces← ↑,/attract ⍨join loc mass
  loc  +← vel +← sforce+ +/⍉forces
  
  G.bg  'fff' ⋄ G.fill←'FFFF00'
  'radius' G.ellipse sun
  G.fill ← 'fff' 
  'radius' G.ellipse join loc dim
}