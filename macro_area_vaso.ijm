// Written by: Philipe Godoy and Bruna Hornink
// date: 01.2022
// objective: to measure vessel area per tree ring

// Requires:
//   - roi per tree ring 

// "SelectionIntersection"
// This macro creates a selection that is the intersection
// of two selections in the ROI Manager.
	requires("1.37j");
	setBatchMode(true);
	
	square_number = 1;
	segment_number = 203;
	for (j = segment_number; j < square_number + segment_number; j++) {
		for (i = 0; i < segment_number; i++) {
			oldCount = roiManager("Count");
			orig = getImageID();
			roiManager("Select", i);
			run("Create Mask");
			rename("Mask1");
			mask1 = getImageID();
			roiManager("Select", j);
			run("Create Mask");
			mask2 = getImageID();
			imageCalculator("AND", mask2, mask1);
			run("Create Selection");
			type=selectionType();
            if (type!=-1) {
	        	roiManager("Add");
				selectImage(orig);
				roiManager("Select", roiManager("Count") - 1);
				roiManager("Rename", "Intersection"+i+"-"+j);   	
            }
		}
		print("done with the square #" + j - segment_number);
	}
	
