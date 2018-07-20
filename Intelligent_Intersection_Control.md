# Papers I read
## Optimal Scheduling of Autonomous Vehicle Arrivals at Intelligent Intersections via MILP
### S. Alireza Fayazi, Ardalan Vahidi, Andre Luckow
#### Method
- J1: minimize the expected arrival time of the last vehicle
passing the intersection in a given time window.
- J2: minimize the difference between the assigned and desired access time for
all vehicles.
- Constraints:
    - vehicle i's access time is greater than the access time if it use maximum speed
    and acceleration.
    - vehicles of same movement have enough headway.
    - vehicles of different movements have enough gap.
        - Uses big-M method to convert the constraint into an AND-combination
        in a way if one equation holds true then the others are always redundant.
        - Very similar to our constraints except they are using time, we are
        using states.
- Conversion of discontinuity of ![img](http://www.sciweavers.org/tex2img.php?eq=J_1&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) <!--J_1-->
    - sort all vehicles, replace the max with ![img](http://www.sciweavers.org/tex2img.php?eq=v_n&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) <!--v_n-->.
- Conversion of discontinuity of ![img](http://www.sciweavers.org/tex2img.php?eq=J_2&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) <!--J_2-->
    - using two inequality to replace the absolute operator.
#### Contributions (as in the conclusion part)
- A control algorithm that anticipate vehicle arrivals and guides them into fast moving platoons
    - I didn't see too much on platoon side
- Reducing the vehicle intersection coordination problem into a mixed-integer programming
 program
- Developing a customized microsimulation test environment in which simulated
vehicles are guided by MILP-based controller.
#### Discussion
- No turns are allowed in the paper to simplify the presentation of ideas
- In section II paragraph 2, vehicles are sorted by distances to the intersection,
 what if some vehicles are a bit further but have a higher speed?
- In II 3, ![img](http://www.sciweavers.org/tex2img.php?eq=d_%7Baccess%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) <!--d_{access}--> is estimated stopping distance using average speed, then
vehicle with the maximum speed will not be able to stop.
- Used access area which increases the intersection area. No conflicting vehicles
 can exist inside the access area at the same time.
- No consideration of communication uncertainty.
- No explanation on optimizing weights ![img](http://www.sciweavers.org/tex2img.php?eq=%5Comega_1&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) <!--w1--> and ![img](http://www.sciweavers.org/tex2img.php?eq=%5Comega_2&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) <!--w2-->.
- Used number of stopped cars and travel time as the performance.
