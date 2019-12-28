showReference = false;
$fn = 200;
if (showReference) import("C:/Users/Craighton/Downloads/WemosD1Mini.stl");

 module cylinderOuter(height,radius,fn){
   fudge = 1/cos(180/fn);
   cylinder(h=height,r=radius*fudge,$fn=fn);
}

module rectangle() {
    linear_extrude(height = 1) offset(r = 5) square([19,27]);
}

module holeObject() {
    color("red") cylinderOuter(3.5, 1, $fn);
}

module pinoutCover() {
    difference() {
        translate([-9.5,-14,3.2]) color("blue") rectangle();
        
        for(i = [8.9, 6.4, 3.9, 1.3, -1.3, -3.8, -6.3, -8.9]) {
        //for(i = [8.9 : -8.9 : -2.225]) {
            //echo(i);
            translate([-11.45,i,1.5]) holeObject();
            mirror([1,0,0]) translate([-11.45,i,1.5]) holeObject();
        }
    }
}
pinoutCover();