# Papers I read
## Optimal Scheduling of Autonomous Vehicle Arrivals at Intelligent Intersections via MILP
### S. Alireza Fayazi, Ardalan Vahidi, Andre Luckow
#### Method
- ![img](images/J_1.png): minimize the expected arrival time of the last vehicle
passing the intersection in a given time window.
- ![img](images/J_2.png): minimize the difference between the assigned and desired access time for
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
- Conversion of discontinuity of ![img](images/J_1.png) <!--J_1-->
    - sort all vehicles, replace the max with ![img](images/v_n.png) <!--v_n-->.
- Conversion of discontinuity of ![img](images/J_2.png) <!--J_2-->
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
- In II 3, ![img](images/d_access.jpg) <!--d_{access}--> is estimated stopping distance using average speed, then
vehicle with the maximum speed will not be able to stop.
- Used access area which increases the intersection area. No conflicting vehicles
 can exist inside the access area at the same time.
- No consideration of communication uncertainty.
- No explanation on optimizing weights ![img](images/omega_1.png) <!--w1--> and ![img](images/omega_2.png) <!--w2-->.
- Used number of stopped cars and travel time as the performance.

## Mixed Integer Linear Programming for Optimal Scheduling of Autonomous Vehicle Intersection Crossing
### S. Alireza Fayazi, Ardalan Vahidi
#### Method

# Simulation notes
- SUMO + ns3 cannot simulate the influence on communication from buildings.
