⎕IO←0
mag←{√+/⍵*2} ⋄ norm←{0≠m←mag ⍵:←⍵ ÷ m⋄0 0} ⋄ setMag←{⍺×norm ⍵} ⋄ limit←{(×⍺)×⍵⌊|⍺} 
map←{s e ns ne←⍺⋄ns+(ne-ns)×(e-s)÷⍨⍵-s} ⋄ constrain←{n←⍺⋄low high←⍵⋄low⌈n⌊high}
randColor←{256⊥⍵,?3⍴255}

contain←{aspect←(≢loc)⍴⍵                                  ⍝ contain an object to the screen
  {loc⊢←((aspect-mass)×~⍵)+loc×⍵ ⋄ vel×←dir¨⍵} loc<(aspect-mass) ⍝ contain right and bottom
  {loc×←⍵⋄vel×←dir¨⍵} 0<loc                        ⍝ contain left and top
}

friction←{⍺ × norm ⍵} ⍝ apply friction
drag← {(norm ⍵)×¯1×⍺×(mag ⍵)*2}


origin ← 2÷⍨ P5.size←w h←800 800
G←P5.G

P5.setup ← {}
P5.lm.c  ← {newBall⍵} ⍝ creates a ball on click

vecs←{⍬ 2⍴⍵} ⋄ join←{↓,/vecs¨⍵} ⋄ dir←{⍵ ⌷¯1 1}
newBall←{
  loc ,← ⍵ 
  vel ,← .0000000001 .0000000000001
  dim ,← d←20+2⍴?50
  acc ,← 0 0
  mass,←d÷2
}   

loc vel dim acc mass←⍬ ⍬ ⍬ ⍬ ⍬ 
sun ← origin, 100 100
newBall (?800), 0
newBall (?800), 0
newBall (?800), 00
newBall (?800), 00
newBall (?800), 00
newBall (?800), 00
newBall (?800), 00
newBall (?800), 00
newBall (?800), 00
newBall (?800), 00

P5.draw   ← {
  gravity← mass × (ls←≢loc)⍴ 0 .1
  ⍝G.translate 0 ¯500 
  ⍝G.rotate .1
  ys←   ∊{2⌿∨/⍵>origin}¨ ↓vecs (loc × ls⍴ 0 1)
  d ←ys×∊{1 drag ⍵    }¨ ↓vecs vel

  loc +← vel +← (d+gravity) ÷ mass
  contain w h

  G.bg  'fff' ⋄ G.fill←'0055FF'
  'corners' G.rect 0 (⊃origin),w h
  G.fill ← 'fff' 
  'radius' G.ellipse join loc mass
}