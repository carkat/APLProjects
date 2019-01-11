⎕IO←0
⍝ vector methods
mag←{√+/⍵*2}⋄norm←{⍵÷ mag ⍵}⋄setMag←{⍺×norm⍵}⋄limit←{(×⍺)×⍵⌊|⍺} 
⍝ setup P5
size ← 1000 1000 ⋄ origin ← size÷2 ⋄ P5.size ← size⋄G←P5.G⋄map←{s e ns ne←⍺⋄ns+(ne-ns)×(e-s)÷⍨⍵-s}⋄randColor←{256⊥⍵,?3⍴255}
P5.setup ← {}


newBall← {3 2⍴⍵, 5 6, 2⍴0} ⍝ defines a ball
P5.lm.c← {balls⊢←↓(↑balls),newBall⍵} ⍝ creates a ball on click
P5.rm.c← {follow⊢←~follow} ⍝ creates a ball on click

follow←1              ⍝ follow mouse
balls←↓newBall origin ⍝ inital ball

gfx←{
  ⍝ draw ball
  G.bg  256⊥ 4⍴ 255 
  'radius' G.rect origin, 300 300
  G.fill ← 256⊥ 4⍴ 255 ⋄ {'radius' G.ellipse  ⍵, 20 20}¨↓((⍺÷2),2)⍴⍵
}

⍝ try debuggin with this
P5.draw ← {
  b s a ← balls                                 ⍝ ball speed accel
  ps ← (pb ← ⍴b)⍴ size                          ⍝ extend size to length of b
  ⍝s ⊢← s limit 5
  a⊢← ¯1 .5
  wrap   ←{b ×← ps> b +← ps×0> ⍵}
  contain←{{⍵⌷1 ¯1}¨⎕←(b≥size)∨b≤tom}
  b +← ⎕←s×←contain s +← ↑a
  pb gfx b
  balls ⊢← b s a
}

  ⍝rectSize← origin +280⋄bottom  ← origin-280
  ⍝s≡0 : (s+←¯1×contain s)