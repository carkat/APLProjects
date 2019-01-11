⎕IO←0
P5.size←800 800⋄G←P5.G
P5.setup ← {}

vecs←{⍬ 2⍴⍵} ⋄ join←{↓,/vecs¨⍵}
loc vel dim acc←⍬ ⍬ ⍬ ⍬ 
newBall←{
  loc ,← ⍵ 
  vel ,← .0000000001 .0000000000001
  dim ,← 10 10 
  acc ,← 0 0
}   

n←200
{⍵ newBall (20×⍵), 400}¨⍳n
ang←0 ⋄ amp←50 ⋄ pos←400
P5.draw   ← {
  G.bg 'fff'
  ang+←.1
  loc⊢←∊,/n ⍬∘⍴¨((5)×⍳n)  (pos+amp×1○ang++\n⍴0.2)
⍝ loc⊢←∊(1×⍳n),¨ (pos+amp×1○ang++\n⍴0.2)
  'radius' G.ellipse join loc dim
  ⎕←P5.fps
}