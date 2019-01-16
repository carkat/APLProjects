⎕IO←0
'Oh say can you see?'
p1←≢∘∪⌈\
t1←5 5 2 10 3 15 10
r1←3 2 0 1
r1≡p1¨t1 (⌽t1) ⍬ 10

'Number Splitting'
p2←{a,⍵-a←⌊⍵}
t2←1.234 12 .1234 0
r2←(1 0.234) (12 0) (0 .1234) (0 0)
r2≡p2¨t2

'Rolling Along'
p3←{{(⍺) ({'*'}¨⍵)}⌸∊+/¨⍳⍵}
t3←(6 6) 6 (5 4 3) ⍬
r3←p3¨t3
r3≡p3¨t3

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
p7←{((-×.5+⍺)×≢⍵)↑(-⍺)↓⍵} ⍝ .5 added to account for 0≡×0
t7←1 0 1 1 1 0 1 1
⍝ 3 ({(×⍺)×≢⍵}↑↓) t7 ⍝ interesting train of the inverse of the solution, from Adam
r7←(⊂0 0 0 1 0 1 1 1), ⊂1 1 0 1 1 0 0 0
r7≡3 ¯3 p7¨⊂t7
 ⍬≡5 p7 ⍬
 0=3 p7 1

⎕IO←1

'Making a Good Argument'
p8←{n←≢⍺⋄(n≡+/⍺∊⍳⍴⍴⍵)∧((≢∪⍺)≡≢a∧(a←∪⍳⌈/⍺)∊⍺)∧n≡≢⍴⍵}
as←(3 1 2) (2 1 2) (2 3 2) (1 1) (1 2) (1.1 2 3) 1
o1←2 3 4⍴⍳24
o2←3 4⍴⍳12
os←o1 o1 o1 o2 o1 o1 ⍬
r8←1 1 0 1 0 0 1 
r8≡{(⊃as[⍵]) p8 ⊃os[⍵]}¨⍳≢as

'Earlier, Later, or the Same?'
p9←{((</a),(⍺≡⍵),>/a←⌊/¨⍸¨(⊂⍺<⍵),⊂⍺>⍵)/¯1 0 1}
t9←(2018 4 1 16 45 12 800) (2018 4 1 12 34 56 789) (2017 4 1 12 34 56 789)
r9←¯1 0 1
r9≡{,/(⊃2⌷t9) p9 ⍵}¨t9

'Anagrammically Correct' 
 p10←{f←{x[⍋x←⍵~' ']} ⋄ ≡/f¨⍺ ⍵}
as10←'albert einstein' '' 'd' 'mesas' 'apple'
os10←'ten elite brains' '' 'd' 'seam' 'lapel'
 r10←1 1 1 0 0
 r10≡{(⊃⍵⌷as10)p10 ⊃⍵⌷os10}¨⍳≢as10