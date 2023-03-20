# OceanBattery


![Ocean Battery](https://user-images.githubusercontent.com/51987477/226371109-9ea1ea89-ec14-4eae-9943-e5d8cce790d8.png "Ocean Battery")


## Authors of the documentation
- Andreas T. Asiikkis
- Antonis I. Vakis

## Code Developed by
- Jimme Bromlewe (Ocean Battery source code)
- Lars Hof (OceanBattery application development)


<div align="right">

Engineering and Technology Institute Groningen (ENTEG)  
Faculty of Science and Engineering (FSE)  
University of Groningen (RUG)  
Groningen, The Netherlands  
February, 2023

</div>





## 1. Introduction
<p align="justify">The Ocean Battery (OB) technology [1] is a form of a pumped hydro storage system that uses underwater flexible bladders to store water and generate electricity when needed. The system works by pumping water from a rigid reservoir into the flexible bladder on the seabed, where it is stored as potential energy in the form of water under high pressure due to the hydrostatic pressure. When energy is needed, the water is released from the bladders back into the rigid reservoirs, driving hydro turbines that generate electricity. This technology has the potential to provide scalable and eco-friendly utility scale energy storage from renewable sources such as wind turbines, floating solar farms and wave energy converters in the ocean.

The application OceanBattery is aimed at providing the user with an overview of the technical specifications of the small-scale Ocean Battery technology and its functioning. By providing inputs in the application, such as information of the hydraulic system, the user can estimate the energy saved and generated, along with the system's efficiency. The OB mathematical model used in this application has been presented in [2].</p>


## 2. Installation
<p align="justify">There are two available options to run the OceanBattery application. The first option is to have MATLAB installed (provided a license is available) and the second option is to use the standalone version of the application which requires downloading the MATLAB runtime software which does not require any license. The first option permits access to the application's source code, allowing the user to modify it, whereas the second option does not provide this capability.</p>

### 2.1 Requirements
The following programs/files are required, which can be downloaded from WEBSITE(GitHub):

#### 2.1.1 With MATLAB license
- MATLAB R2022b or later
- A folder called "OceanBattery" that contains the following:
  - The file OceanBattery.mlapp
  - A folder called "functions" containing all the following .m files:
    - Charging.m
    - Copy_of_OB_parameters.m
    - Discharging.m
    - Discharging_test_setup.m
    - independant_k_values.m
    - K_values_charging_parameters.m
    - K_values_discharging_parameters.m
    - K_values_independent.m
    - K_values_independent_test_setup.m
    - K_values_test_setup_parameters.m
    - Major_head_loss_charging.m
    - Major_head_loss_discharging.m
    - Major_head_loss_test_setup.m
    - Major_head_loss_umbilical.m
    - Minor_head_loss_charging.m
    - Minor_head_loss_discharging.m
    - Minor_head_loss_test_setup.m
    - Minor_head_loss_umbilical.m
    - Moody.m
    - OB_parameters.m
    - Turbine_unit_loss.m
    - Water_level_rigid_reservoir.m
  - A folder called "images", containing all the following images:
    - inlet.png
    - turbine.png
    - contraction.png
    - discharging.png
    - pump.png
    - system.png
    - 45_degree_elbow.png
    - legend.png
    - enlargement.png
    - ball_valve.png
    - flow_sensor.png
    - tee_junctions.png
    - check_valve.png
    - union.png
    - elbow.png
    - bend.png
    - charging.png
    - pressure_sensor.png
