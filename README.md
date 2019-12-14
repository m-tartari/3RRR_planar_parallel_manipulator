# 3RRR Planar Parallel Manipulator
This project consisted in the design of a three degrees of freedom planar parallel manipulator with the following specifications:

- The manipulator should have a cylindrical regular workspace of diameter equal to 100 mm, its height corresponding to the range of rotation of the moving-platform.
- The range of rotation of the moving platform should be higher than 60 ° throughout the regular workspace.
- The inverse condition numbers of its normalized forward and inverse Jacobian matrices should be larger than 0.1 throughout the regular workspace.
- The manipulator should be compact, i.e., the overall size of the manipulator should be as small as possible.
- For a force equal to 10 N applied on the moving-platform along the normal to the plane of motion in its home configuration, the point-displacement of the moving-platform should be lower than 0.1 mm.

For this design the optimization problem was formulated using MATLAB to meet the specifications, and finding the proper parameters’ values to insert in the CAD model of the manipulator. During the evaluation of complexity phase, we selected the *R*RR architecture between the ones synthetized due to its lower value of complexity and then passed to the embodiment phase, implementing the parallel manipulator model in CATIA.
