⍝ snailsort                   
⍝ snailsort 3 3 ⍴ ⍳9          
⍝ returns 1 2 3 6 9 8 7 4 5   
⍝ sort a n x n matrix in the shape of a snail shell
snailsort←{0<+/⍴⍵:⍵[1;],∇⊖⍉⍵[1↓⍳1↑⍴⍵;]⋄⍬}    
snailsort 4 4⍴⍳16


⍝ generic version of snail sort
⍝ sorts any matrix in the shape of a snail
⍝ s 4 4⍴'abcd' → abcddddbcaaabccb
⍝ s 3 3⍴⍳9     → 1 2 3 6 9 8 7 4 5   
 s←{                                             
     imat    ← (⍴mat) ⍴⍳ ≢∊⍵                              ⍝ an index matrix
     n       ← 1↑⍴⍵                                       ⍝ get the size of the first dimension
     n2      ← 2×n                                        ⍝ double it
     rowNums ← n2 ↑∊↓ 1⌽ 2/ ⍉↑ (⊂⍳n),⊂⌽⍳n                 ⍝ the sequence of numbers of first and last rows, for n = 10, 1 10 10 1 2 9 9 2 3 8 8 3...
     rows    ← ((⍴rowNums) ⍴ 1 2) {⍵ ⌷[⍺] imat} ¨rowNums  ⍝ get the list of row/columns indices alternating by the numbers in rowNums
     rotate  ← {rows[⍵]←⊂⌽⊃rows[⍵]} ¨(n2⍴ 2/ 0 1)/ ⍳n2    ⍝ rotate every alternating pair, for n = 10, 0 0 1 1 0 0 1 1...
     (∊⍵)[∪∊rows]                                         ⍝ return the elements by the unique list of indices
 }



⍝ generic version of snail sort
⍝ sorts any matrix in the shape of a snail
⍝ s 4 4⍴'abcd' → abcddddbcaaabccb
⍝ s 3 3⍴⍳9     → 1 2 3 6 9 8 7 4 5   
s2←{ 
  n         ← 1↑⍴⍵                                  ⍝ root of a square matrix
  takes     ← 1↓⌽ 2/ ⍳n                             ⍝ the list of how many values to take during each maneuver
  maneuvers ← {i x←⍵ ⋄ x/ (1 n ¯1 (-n))[ 1+4|i-1 ]} ⍝ gets the list of maneuvers with a [index value, ...] list
  indices   ← +\∊ maneuvers¨ ↓⍉↑ (⊂⍳⍴takes),⊂takes  ⍝ the snail sorted indices
  (∊⍵)[indices]                                     ⍝ the snail sorted values
}

⍝ s2 in one line
s3←{ n ← 1↑⍴⍵ ⋄ (∊⍵)[+\∊ {i x←⍵ ⋄ x/ (1+4|i-1)⌷ 1 n ¯1 (-n)}¨ ↓⍉↑ (⊂⍳⍴a) ,⊂ a←1↓ ⌽ 2/ ⍳n]}

⍝ s2 without ¨ , simply replicates each as needed accross the list
s4←{ a ← 1↓ ⌽ 2/ ⍳n ← 1↑ ⍴⍵ ⋄ (∊⍵)[ +\∊ a/ (⍴a) ⍴ 1 n ,- 1 n ]}