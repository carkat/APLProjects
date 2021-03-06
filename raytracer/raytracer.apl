 ray←{
     ⎕DIV←1 ⋄ ⎕IO←0

     OrientCamera←{world←⍵ ⋄ cam←⍺
         z←norm cam            ⍝ face the world
         x←norm world cross z
         y←norm z cross x
         x y z
     }
                         
     cross←2⌽p⍨-p←⊣×2⌽⊢  ⍝ linear algebra functions
     mag  ←{0.5*⍨+⌿⍵*2}
     norm ←{⍵÷⍤¯1 99 mag ⍵}

     PIntersect←{pN pD c←⍵ ⋄ (⊂c)(((-pD)-(pN+.×Cp))×÷pN+.×⍺)}
     SIntersect←{s r col←⍵ ⋄ dir←⍺
         a b c←(+⌿×⍨dir)(2×(Cp-s)+.×dir)((+⌿×⍨Cp-s)-r*2)
         ps←(2×a)(÷⍤2)⍨(-b)(+,[¯0.5]-)0.5*⍨(b*2)-4×a×c ⍝ points of intersection
         (⊂col)(⌊⌿(0=11○ps)×ps)     ⍝ Nearest non-complex number
     }

     mindex←{⎕CT←0                  ⍝ Comparisons with min should be intolerant
         inf  ←⌊⌿⍬                  ⍝ Largest float.
         ds   ←inf@(≤∘0)⍵           ⍝ Replace negative values with "infinity"
         m    ←⌊⌿ds                 ⍝ Minimum
         ismin←(m<inf)(∧⍤2)m(=⍤2)ds ⍝ Where is the minimum, if any?
         +⌿∧⍀~↑ismin                ⍝ Count leading zeros of ismin
     }

     Cast←{
         Pcs Pds←  ⊃⍵∘PIntersect¨P  ⍝ plane  intersections
         Scs Sds←1⊂↑⍵∘SIntersect¨S  ⍝ sphere interesctions
         colors[(∊Pcs Scs 0)[mindex Pds{(⍺⍴⍨¯3↑1,⍴⍺)⍪(⍵⍴⍨¯3↑1,⍴⍵)}⊢⌿↑⍉Sds]]
     }

     w h←⍵                          ⍝ w=width h=height
     P S←⍬ ⍬
     o  ←{↓(3↑⍵)(3⊃⍵)(4⊃⍵)}
     P, ←o 0 0 1 0 1                ⍝ P=Planes
     S, ←o 0 0 0 2 3                ⍝ S=Spheres
     S, ←o 3 2 3 1 2
     S, ←o ¯3 ¯2 3 1 4
     Cp ←0 ¯10 1                    ⍝ C=Camera
     Cx Cy Cz←Cp OrientCamera 0 0 1 ⍝ p=point/position
     Fw Fh Fd←1(w÷h)1               ⍝ d=dist
     hFw hFh ←0.5×Fw Fh             ⍝ h=half
     Fc      ←Cp-Fd×Cz              ⍝ c=Center
     FRatio  ←{¯1+2×(⍳⍵)÷⍵}         ⍝ F=Film
     FPoints ←{(⍺∘.×⍨hFh×Cx)(∘.+⍤¯1)(⍵∘.×⍨hFw×Cy)}
     Fxs Fys ←FRatio¨w h
     colors  ←↓5 3⍴0 0 0 0 255 0 255 0 0 0 0 255 100 100 255

     h w 3⍴∊⊖⍉Cast norm(Fxs FPoints Fys)(+⍤¯1)Fc-Cp
 }
