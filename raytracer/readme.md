
Run using Dyalog 17.
Requires arcfide's compiler.


1. Start a new workspace
2. Copy the ray function found in raytracer.apl
3. Use the following code:

```
	ns←⎕NS⍬

]compile ns cd -af=cpu

PCG

	cd.∆.Init

	cd.∆.(Image Display≢) ray 800 600
```