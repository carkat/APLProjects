Requires:
	- P5
		1. goto https://processing.org/
			2. download and extract P5

	- Dzaima APL(https://github.com/dzaima/APL)
		1. Follow the "Processing integration steps" found on dzaima/apl's github README.md
		2. Have P5 installed
			3. Open APLP5 as instructed in the Dzaima APL readme
				4. With APLP5 open, change line 12 of the "APLP5" tab:
				`if (args == null) args = new String[]{"C:\Path\To\some\file_from_this_project"};`
				4.5 "snowfall.apl" and "water.apl" are good places to start. 
				5. Click the play button


Not all examples are good examples.
Some don't work. 
There is a lot of repetition in the code, as dzaima APL does not
provide a way to import files as yet. 
