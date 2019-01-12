⍝ Inspired by the jugalbandi snakes and ladders challenge
⍝ the game works by adding the dice throws to the player position to the mapping, if any
⍝ for a 10x10 game of 4 players
⍝ 10 game 4
⍝ output is the list of positions once a player has won
     sl ← 4 2⍴ 3 10 10 10 23 ¯9 17 ¯11                           ⍝ a map list of ladders and snakes
adddice ← {⍵+a×~⍺<⍵+a←?(⍴⍵)⍴6}                                   ⍝ add the dice throws to the player positions
   game ← {(⍺*2){{⍵+⊃⌽sl[⍸sl[1;]∊⍵;]}¨⍺ adddice ⍵}⍣((⍺*2)∊⊣)⍵/1} ⍝ ⍺=board size, ⍵= number of players
