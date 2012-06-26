module nema14(){
cube([36,36,40],true);
translate([0,0,1])cylinder(r=12,h=42,center=true);
translate([0,0,1])cylinder(r=3,h=38);
translate([13,13,1])cylinder(r=1.8,h=38);
translate([13,-13,1])cylinder(r=1.8,h=38);
translate([-13,13,1])cylinder(r=1.8,h=38);
translate([-13,-13,1])cylinder(r=1.8,h=38);

}
module b624(){
difference(){
union(){
cylinder(r=13/2,h=6);
*cylinder(r=13/2,h=6);
}
translate([0,0,-0.1])cylinder(r=2,h=6.2);
}
}
module b624c(){
union(){
difference(){
cylinder(r=15/2,h=7.5);
translate([0,0,-0.0])cylinder(r=13/4,h=0.75);
translate([0,0,6.75])cylinder(r=13/4,h=0.75);
}
translate([0,0,-4.1])cylinder(r=2.2,h=15.2,$fn=12);
}
}
module pumpbody(motor=true){
difference(){
union(){
translate([0,0,-8])cylinder(r=26,h=16);
translate([-15,-35,-8])cube([30,20,16]);
}
translate([-10,-28,-8.5])#cylinder(r=5.2/2,h=17);
translate([10,-28,-8.5])#cylinder(r=5.2/2,h=17);
translate([0,0,-5])cylinder(r=22.5,h=14);
rotate([0,0,-15])translate([0,0,3])rotate([0,90,60])cylinder(r=4,h=30);
translate([0,0,-30.01])nema14();
if(motor)%translate([0,0,-30.01])nema14();
difference(){
translate([0,0,3])rotate_extrude(convexity=7)translate([21,0,0])circle(r=3);
translate([0,0,0])cube(24);
}
translate([42,0,0])rotate([0,0,180])difference(){
translate([0,0,3])rotate_extrude(convexity=7)translate([21,0,0])circle(r=3);
translate([0,0,0])cube(23.4);
}
translate([0,42,0])rotate([0,0,180])difference(){
translate([0,0,3])rotate_extrude(convexity=7)translate([21,0,0])circle(r=3);
translate([0,0,0])cube(23.4);
}

}
}
module rotorb(){rotate([0,0,-15])difference(){
translate([0,0,-2])cylinder(r=20,h=10.5,$fn=6);
for(i=[2:6])rotate([0,0,(360/6)*i])translate([15,0,0]){
b624c();
%b624();
}
translate([0,0,-5])cylinder(r=2.7,h=30);
translate([0,0,3])rotate([0,90,60])cylinder(r=2,h=30);
translate([12,25])rotate([0,0,60])cube(30,center=true);
translate([3.5,6])rotate([0,0,-30])cube([5.5,2.5,25],center=true);

}
}
module pumprotor(){
translate([0,0,2.01])difference(){
rotorb();
translate([0,0,25.49])cube(40,true);
}
translate([20,30,8.51])mirror([0,0,1])difference(){
rotorb();
translate([0,0,25.49-40])cube(40,true);
}
}
%cube([200,200,0.01],true);
translate([-35,35,8])rotate([0,0,130])pumpbody(true);
*translate([-70,75,8])rotate([0,0,130])pumpbody(true);
pumprotor();