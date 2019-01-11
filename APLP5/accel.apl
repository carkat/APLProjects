⍝ vector methods
mag←{√+/⍵*2}⋄norm←{⍵÷ mag ⍵}⋄setMag←{⍺×norm⍵}⋄limit←{(×⍺)×⍵⌊|⍺} 
⍝ setup P5
size ← 800 800 ⋄ origin ← size÷2 ⋄ P5.size ← size⋄G←P5.G⋄map←{s e ns ne←⍺⋄ns+(ne-ns)×(e-s)÷⍨⍵-s}⋄randColor←{256⊥⍵,?3⍴255}
P5.setup ← {}


newBall← {3 2⍴⍵, 0 0, ?2⍴0} ⍝ defines a ball
P5.lm.c← {balls⊢←↓(↑balls),newBall⍵} ⍝ creates a ball on click
P5.rm.c← {follow⊢←~follow} ⍝ creates a ball on click

follow←1              ⍝ follow mouse
balls←↓newBall origin ⍝ inital ball

gfx←{
  G.fill ← 256⊥ 4⍴ 255 ⋄ {'radius' G.ellipse  ⍵, 10 10}¨↓((⍺÷2),2)⍴⍵
  G.fill ← randColor 2 ⋄  'radius' G.rect     origin,size
}

P5.draw ← {
  b s a ← balls                                 ⍝ ball speed accel
  ps ← (pb ← ⍴b)⍴ size                          ⍝ extend size to length of b
   follow:a ⊢←  1 setMag (pb⍴ P5.mx P5.my) - b  ⍝ balls follow mouse
  ~follow:a ⊢← 0 1 ¯1 1 map ? (⍴a) ⍴0           ⍝ random walkers
  s ⊢← s limit 5
  
  ⍝ map to screen (ball + speed + accel)
  b ×← ps> b +← ps×0> b +← s +← a
  pb gfx b
  balls ⊢← b s a
}
