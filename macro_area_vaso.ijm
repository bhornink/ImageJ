id = getImageID();
run("Clear Results");
for (i=0 ; i<roiManager("count"); i++) {
    selectImage(id);
    roiManager("select", i);
    run("Analyze Particles...", "size=0-Infinity circularity=0.0-1.00 show=Nothing display");
}
