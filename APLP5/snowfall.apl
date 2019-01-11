⎕IO←0
mag←{√ +/ ⍵*2} ⋄ norm←{⍵ ÷ mag ⍵} ⋄ setMag←{⍺×norm ⍵} ⋄ limit←{(×⍺)×⍵ ⌊| ⍺} 
map←{s e ns ne←⍺⋄ ns + (ne-ns) × (e-s) ÷⍨ ⍵-s}
randColor←{256⊥⍵,?3⍴255}

origin ← 2 ÷⍨ P5.size←w h←1000 1000
G←P5.G

P5.setup ← {}
P5.lm.c  ← {balls⊢←↓(↑balls),newBall⍵} ⍝ creates a ball on click

newBall  ← {
  loc ,← ⍵ 
  vel ,← ((?4)-2),3.5
  dim ,← d←5+2⍴?10
  acc ,← 2⍴0
  mass,← d÷2

}   

drop←{
  loc ⊢←⍵⌿loc
  vel ⊢←⍵⌿vel
  dim ⊢←⍵⌿dim
  acc ⊢←⍵⌿acc
  mass⊢←⍵⌿mass
} 
⍝snowBall ← {balls⊢←↓(↑balls),newBall (?800),-5} ⍝ create a ball from top of screen
⍝d        ← {↓(((⍴⍵)÷2),2)⍴⍵}

vecs←{⍬ 2⍴⍵}
loc vel dim acc mass←⍬ ⍬ ⍬ ⍬ ⍬ 
gfx←{
  G.bg  'fff' ⋄ G.fill ← 'fff' 
  'radius' G.ellipse  ↓,/vecs¨⍵                  
}

n←.01                                        ⍝  initial perlin noise value
P5.draw ← {
  nse ← (0 1 ¯.05 .05) map P5.Noise (n+←.01) ⍝ map noise once
  newBall (?800),0                           ⍝ make snowball every frame,

  count← ≢loc                                ⍝ number of objects
  ratio← count ⍴ w h                         ⍝ extend aspect ratio pair to length of pairs
  force← (count ⍴ nse,.05)÷mass              ⍝ generate force
  loc +← ratio× 0>loc +← vel +← force        ⍝ wrap screen sides and apply force to velocity

  ⍝loc  ×← ratio>loc                         ⍝ this wraps the bottom to the top
  count gfx loc dim                          ⍝ draw
  drop 2⌿∧/>/vecs¨ratio loc                  ⍝ drop all that are off the bottom of the screen
}
