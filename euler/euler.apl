⍝ all functions should be called with ⍬, except p12
)load dfns
⎕IO←0

p1 ← {+/∊{(∨/0=3 5|⍵)/⍵}¨⍳1000}                   ⍝ sum of n≤1000 where 3 and 5 are divisors of n
p2 ← {+/(0=2|a)/a←({⍵,+/¯2↑⍵}⍣(4000000<¯1↑⊣))1 1} ⍝ sum of even fib ns ≤ 4e6
p3 ← {⊃⌽factors 600851475143}                     ⍝ largest factor of a given number
p4 ← {⊃⌽∊{((⊂b)≡⊂⌽b←⍕⍵)/⍵}¨a[⍋a←∊∘.×⍨100+⍳899]}   ⍝ largest 3 digit product palendromic number 
p5 ← {⎕IO←1⋄{(⍺×⍵)÷⍺{⍵=0:⍺ ⋄ ⍵ ∇ ⍵|⍺}⍵}/⍳20}      ⍝ range(20).reduce(lcm)
p6 ← {{((+/⍵)*2)-+/⍵*2}⍳100}                      ⍝ difference of the square of sum and sum of square
p7 ← {pco 10001}                                  ⍝ nth prime
n  ← ⊃⎕NGET './problem8.txt'                      ⍝ replace with the appropriate path to ./problem8.txt
p8 ← {0⍕⊃a[⍒a←{×/⍎¨⍵}¨¯1↓13 ,/n]}                 ⍝ product of 13 consecutive integers in large number

⍝triprod ← {×/t×1000=+/t←⍵ ⍺((+/2*⍨⍵ ⍺)*0.5)}     ⍝ non train solution
triprod ← {×/(⊢×1000=+/)⍵ ⍺((+/2*⍨⍵ ⍺)*0.5)}      ⍝ get the product of a pythagorean triple who's sqrt sum = 1000
p9      ← {⊃(∊∘.triprod⍨⍳500)~0}

p10 ← { 0⍕ +/⍸ sieve 2e6 }                        ⍝ using sieve as defined here https://dfns.dyalog.com/n_sieve.htm

⍝ credit to H.Pwiz from APL Orchard for the inner function optimization
⍝ 2 times the count of divisors less than the square root
⍝ every factor of n < square root corresponds to a factor of n > square root
⍝ this holds true for all non perfect square n, in this case, subtract 1. 
p12 ← {500<{2×+/0=⍵|⍨⍳⌊⍵*0.5} a←+/⍳⍵ : a ⋄ ∇⍵+1}  ⍝ p12 1