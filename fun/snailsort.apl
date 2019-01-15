⍝ snailsort                   
⍝ snailsort 3 3 ⍴ ⍳9          
⍝ returns 1 2 3 6 9 8 7 4 5   
⍝ sort a n x n matrix in the shape of a snail shell
snailsort←{0<+/⍴⍵:⍵[1;],∇⊖⍉⍵[1↓⍳1↑⍴⍵;]⋄⍬}    
snailsort 4 4⍴⍳16