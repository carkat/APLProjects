⎕IO←0
rshift←{¯⍵∘↓⍢(2⊤)⍺} ⋄ lshift←{2⊥⍺,⍵⍴0}
and←∧/⍢⊤


⍝ CONSTANTS
perlin←0⍴0
ywrap ←1 lshift ywrapb←4
zwrap ←1 lshift zwrapb←8
amp_falloff pocts psize ← 0.5 4 4095

getN←{rxf ryf←⍵
    a ←     perlin[ ⍺          and psize]
    a+←rxf×(perlin[(⍺+1)       and psize]-a)
    b ←     perlin[(⍺+ywrap)   and psize]
    b+←rxf×(perlin[(⍺+ywrap+1) and psize]-b)
    a+←ryf×(b-a)
}

scaled_cos←{0.5×1.0-2○○⍵}

nse←{xyz←3↑|⍵,0 0
  0=≢perlin: perlin⊢ ← ?(psize+1)⍴0
  xyzf←xyz - xyzi←⌊xyz
  result amp ←0 0.5
  { 
    of ← +/xyzi lshift¨0 ywrapb zwrapb
    rxy ← scaled_cos 2↑xyzf

    n1 ← of getN rxy
    n2 ← (of+←zwrap) getN rxy

    n1+←(scaled_cos ⊃⌽xyzf)×(n2-n1)

    result+←(n1×amp)
    amp×←amp_falloff
    xyzi lshift¨⍨←1
    xyzf×←2
    {a←xyzf ≥ 1.0 ⋄ ∨/a: {{xyzf[⍵]+←1}¨⍸a ⋄ {xyzi[⍵]+←1}¨⍸a}⍬}⍬

  }¨⍳pocts

  ⊢result
}

