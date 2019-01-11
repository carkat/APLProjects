⎕IO←0
origin ← 2÷⍨ P5.size ← w h←800 800
G←P5.G

mag←{√+/⍵*2}⋄norm←{⍵÷ mag ⍵}⋄setMag←{⍺×norm⍵}⋄limit←{(×⍺)×⍵⌊|⍺} 
map←{s e ns ne←⍺⋄ns+(ne-ns)×(e-s)÷⍨⍵-s}
randColor←{256⊥⍵,?3⍴255}


newBall  ← { ⍝ adds a pos
  loc,← ⍵
  vel,← (¯1+3×?0) 5
  dim,← 2⍴?15
  acc,← 0 0
}
P5.lm.c ← {newBall ⍵} ⍝ creates a pos on click

n←.01
loc vel dim acc ← ⍬ ⍬ ⍬ ⍬
bpf ← 4 ⍝ balls per frame
P5.draw ← {
  nse ← (0 1 ¯.1 .1) map P5.noise (n+←.01)     ⍝ map noise once
  {newBall ((?800) ¯5)}¨bpf⍴0

  pb    ← ≢loc
  ps    ← pb ⍴ w h   ⍝ extend aspect ratio pair to length of b pairs
  force ← pb ⍴ nse,0

  loc ×← ps>loc +← ps× 0>loc +← vel +← force   ⍝ map balls to screen and apply force to velocity
  G.bg     'fff'                               ⍝ fun things happen if you remove this
  G.fill ← 'fff'
  bs ← ⍬ 2⍴loc
  ss ← ⍬ 2⍴dim
  'radius'∘G.ellipse ↓bs,ss                    ⍝ at some point in the future the ↓ won't be required
  
  pb > ¯5 + 2 × bpf × h÷5: { ⍝ drop balls at the end of the screen
    loc↓⍨← 10
    vel↓⍨← 10
    dim↓⍨← 10
    acc↓⍨← 10
  }⍬
  ⎕←P5.fps
}