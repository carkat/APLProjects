⍝ Generate a ⍵ x ⍵ maze, which outputs a list of numbers tracing the path from end to end, filling the entire ⍵ x ⍵ maze. 
⍝ This solution uses backtracking without recursion

⍝ call genMaze with a positive integer
⍝ ex. genMaze 10
     ends ← {(1@(locs[2?≢locs←⍸∨/¨((⊃⍴⍵)=x)∨1=x←⍳⍴⍵]))⍵}                           ⍝ generate 2 random ends of the maze
 adjCells ← {(∧/¨((⊃⍴⍺)≥b)∧(0<b))/b←⍵+dirs}                                        ⍝ find cells adjacen to current cell
  getCell ← {0<≢emt←⍸0=⍵[cells←⍵ adjCells ⍺]:emt rand cells ⋄ ⍺(cells backtrack)⍵} ⍝ select the next cell, either a random empty cell
                                                                                   ⍝ or backtrack when there are no empty neighbors
     rand ← {⍵⌷⍨⍺⌷⍨?⍴⍺}                                                            ⍝ get a random empty cell
backtrack ← {⍺⍺⌷⍨vs⍳⊃gt[⍒gt←vs[⍸⍵[⍺]>vs←⍵[⍺⍺]]]}                                   ⍝ select cell = currentCell - 1
    apply ← {cell,⊂(((⍵[⍺])+(1+0=val←⍵[cell])⌷¯1 1)@(cell←⍺ getCell ⍵))⍵}          ⍝ apply the value to the next cell
   repeat ← {⍵[1]apply⊃⍵[2]}                                                       ⍝ repeat 
  genMaze ← {(repeat⍣{∧/,0≠⊃⌽⍵})(1↑⍸1=b),⊂b←ends ⍵ ⍵⍴0}                            ⍝ generates a ⍵ by ⍵ maze