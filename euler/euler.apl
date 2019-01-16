⍝ all functions should be called with ⍬, except p12
⎕FR←1287
⎕PP←34
⎕IO←0
)load dfns
p1 ← {+/⍸∨/¨0=(⊂3 5)|¨⍳999}                       ⍝ sum of n≤1000 where 3 and 5 are divisors of n
p2 ← {+/(0=2|a)/a←({⍵,+/¯2↑⍵}⍣(4000000<¯1↑⊣))1 1} ⍝ sum of even fib ns ≤ 4e6
p3 ← {⊃⌽factors 600851475143}                     ⍝ largest factor of a given number
p4 ← {⊃⌽∊{((⊂b)≡⊂⌽b←⍕⍵)/⍵}¨a[⍋a←∊∘.×⍨100+⍳899]}   ⍝ largest 3 digit product palendromic number 
⍝p5 ← {⎕IO←1⋄{(⍺×⍵)÷⍺{⍵=0:⍺ ⋄ ⍵ ∇ ⍵|⍺}⍵}/⍳20}      ⍝ range(20).reduce(lcm)
p5 ← {⎕IO←1⋄∧/⍳20} ⍝ lcm / 1 2 3 ... 20
p6 ← {{((+/⍵)*2)-+/⍵*2}⍳100}                      ⍝ difference of the square of sum and sum of square
p7 ← {pco 10001}                                  ⍝ nth prime
n  ← ⊃⎕NGET './problem8.txt'                      ⍝ replace with the appropriate path to ./problem8.txt
p8 ← {⊃b[⍒b←13×/⍎¨¯1↓⊃n]}

⍝triprod ← {×/t×1000=+/t←⍵ ⍺((+/2*⍨⍵ ⍺)*0.5)} ⍝ non train solution
triprod ← {×/(⊢×1000=+/)⍵ ⍺((+/2*⍨⍵ ⍺)*0.5)}  ⍝ get the product of a pythagorean triple who's sqrt sum = 1000
p9      ← {⊃(∊∘.triprod⍨⍳500)~0}
p10     ← { +/⍸ sieve 2e6 }                   ⍝ using sieve as defined here https://dfns.dyalog.com/n_sieve.htm

⍝ credit to H.Pwiz from APL Orchard for the inner function optimization
⍝ 2 times the count of divisors less than the square root
⍝ every factor of n < square root corresponds to a factor of n > square root
⍝ this holds true for all non perfect square n, in this case, subtract 1. 
p12 ← {500<{2×+/0=⍵|⍨⍳⌊⍵*0.5} a←+/⍳⍵ : a ⋄ ∇⍵+1}  ⍝ p12 1

collatz ← {1=⊃⍵ : ≢⍵ ⋄ 0=2|⊃⍵ : ∇(2÷⍨⊃⍵),⍵ ⋄ ∇(1+3×⊃⍵),⍵} ⍝ prepends each collatz number, collatz numbers in reverse
p13     ← {⎕IO←1 ⋄ a⍳⌈/a←collatz¨⍳1e6}                    ⍝ slow solution, execution time > 1 minute, but returns the correct solution

P16      ← {+/⍎¨↑×big/1000⍴2} ⍝ sum the digits of a large number

triangle ← 75 95 64 17 47 82 18 35 87 10 20 04 82 47 65 19 01 23 75 03 34 88 02 77 73 07 63 67 99 65 04 28 06 16 70 92 41 41 26 56 83 40 80 70 33 41 48 72 33 47 32 37 16 94 29 53 71 44 65 25 43 91 52 97 51 14 70 11 33 28 77 73 17 78 39 68 17 57 91 71 52 38 17 14 91 43 58 50 27 29 48 63 66 04 68 89 53 67 30 73 16 69 87 40 31 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
rows     ← {⍵⊂⍨a∊(+\a←⍳≢⍵)} triangle
p18      ← {⌈/⊃{⍺+⍵⌈¯1⌽⍵}/⌽↓ {↑⍵⊂⍨a∊(+\a←⍳≢⍵)} triangle}
p18v2    ← {⊃{⍺+2⌈/⍵}/rows}

ily  ← {(0=400|⍵) ∨ ((0≠100|⍵) ∧ 0=4|⍵)}                     ⍝ is leap year?
  m  ← {31 (28+ily ⍵) 31 30 31 30 31 31 30 31 30 31}         ⍝ calandar months
 p19 ← {+/ 1= 12↓ ((+/ms) ⍴ 1⌽⍳7)[¯1↓ +\ 1,ms←∊m¨1899+⍳101]} ⍝ count sundays on the first of the month from 1901 to 2000

p20 ← {+/{⍎⍵}¨⊃×big/⍳100} ⍝ sum the digits of !100




p40 ← {×/{⍎⍵}¨(∊⍕¨⍳1000000)[10*(⍳7)-1]}
