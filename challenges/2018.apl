'Oh say can you see?'
p1←≢∘∪⌈\
t1←5 5 2 10 3 15 10
r1←3 2 0 1
r1≡p1¨t1 (⌽t1) ⍬ 10

'
'Number Splitting'
p2←{a,⍵-a←⌊⍵}
t2←1.234 12 .1234 0
r2←(1 0.234) (12 0) (0 .1234) (0 0)
r2≡p2¨t2

'Rolling Along'
p3←{{(⍺) ({'*'}¨⍵)}⌸∊+/¨⍳⍵}
t3←(6 6) 6 (5 4 3) ⍬
r3←p3¨t3

'What''s Your Sign?'
zod←'Monkey' 'Rooster' 'Dog' 'Pig' 'Rat' 'Ox' 'Tiger' 'Rabbit' 'Dragon' 'Snake' 'Horse' 'Goat' 
 p4←{⊃zod[12|(0>⍵)+⍵]} 
 t4←2018 1564 ¯551
 r4←'Dog' 'Rat' 'Dog'
 r4≡p4¨t4

'What''s Your Sign? Revisited'
 wzod←'Aquarius' 'Pisces' 'Airies' 'Taurus' 'Gemini' 'Cancer' 'Leo' 'Virgo' 'Libra' 'Scorpio' 'Sagittarius' 'Capricorn'
dates←20 19 21 20 21 21 23 23 23 23 22 22
   p5←{m d←¯1 0+⍵ ⋄ wzod⊃⍨12|m-d<dates⊃⍨12|m}
   t5←(2 23) (10 31)
   r5←'Pisces' 'Scorpio'
   r5≡p5¨t5


'Unconditionally Shifty'
p7←{((-×⍺)×≢⍵)↑(-⍺)↓⍵}
t7←1 0 1 1 1 0 1 1
⍝ 3 ({(×⍺)×≢⍵}↑↓) t7 ⍝ interesting train of the inverse of the solution, from Adam
r7←(⊂0 0 0 1 0 1 1 1), ⊂1 1 0 1 1 0 0 0
r7≡3 ¯3 p7¨⊂t7
 ⍬≡5 p7 ⍬
 0≡3 p7 1
