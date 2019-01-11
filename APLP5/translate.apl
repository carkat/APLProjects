⎕IO←0
mag←{√+/⍵*2} ⋄ norm←{0≠m←mag ⍵:←⍵ ÷ m⋄0 0} ⋄ setMag←{⍺×norm ⍵} ⋄ limit←{(×⍺)×⍵⌊|⍺}⋄map←{s e ns ne←⍺⋄ns+(ne-ns)×(e-s)÷⍨⍵-s} ⋄ constrain←{n←⍺⋄low high←⍵⋄low⌈n⌊high}⋄randColor←{256⊥⍵,?3⍴255}

contain←{⎕←aspect←(≢loc)⍴⍵                                  
  {loc⊢←((aspect-mass)×~⍵)+loc×⍵ ⋄ vel×←dir¨⍵} loc<(aspect-mass) 
  {loc×←⍵⋄vel×←dir¨⍵} 0<loc
}

friction←{⍺ × norm ⍵} ⋄ drag← {(norm ⍵)×¯1×⍺×(mag ⍵)*2}


origin ← 2÷⍨ P5.size←window←800 800⋄G←P5.G


P5.setup ← {}
P5.lm.c  ← {newBall⍵} ⍝ creates a ball on click

vecs←{⍬ 2⍴⍵} ⋄ join←{↓,/vecs¨⍵} ⋄ dir←{⍵ ⌷¯1 1}
newBall←{
  loc ,← ⍵ 
  vel ,← .0000000001 .0000000000001
  dim ,← d←10+2⍴?40
  acc ,← 0 0
  mass,←d÷2
}   
loc vel dim acc mass←⍬ ⍬ ⍬ ⍬ ⍬ 
newBall (?800), 100

a ← 0
aVel ← 0
aAcc ← 0.01

P5.draw   ← {
  aAcc ← 0 800 ¯0.01 0.01 map P5.mx
  a +← aVel +← aAcc
  gravity←0 .3
  wind←¯.1 0
  loc+←vel+←gravity+wind
  contain window

  G.bg  'fff' ⋄ G.fill←'0055FF'
  G.pum ⍬
  G.translate origin
  G.rotate a
  'radius' G.rect 0 0 40 40
  G.pom ⍬
  G.fill ← 'fff' 
  'radius' G.ellipse join loc mass
}