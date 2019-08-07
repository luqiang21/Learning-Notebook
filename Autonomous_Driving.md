# Map
## OpenDRIVE [ref](https://scholar.google.com/scholar?hl=en&as_sdt=0%2C5&q=automatic+conversion+of+road+networks+from+opendrive+to+lanelets&btnG=)
- Individual lanes are created by specifiying a lateral distance from a reference path whose ID is 0, 
lanes on the right have negative decreasing IDs and have same direction as the reference path, 
lanes on the left have positive increasing IDs and have the opposite direction.
- Reference path are constructed by concatenating clothoids (aks Euler spirals) or (polynomials). 
  - Arc segments and straight lines are special cases of clothoids.
  - Reference path segments are seperated based on curvature types. 
    - Straight linle: curvature `c = 0`
    - Clothoid: curvature changes linearly
    - Arc: curvature is constant
- The reference path is divided into multiple sections based on the number of lanes.
  - Lanes have no empty space between them, to introduce gaps, one has to create an additional lane of a special type `non-road` type.
  
