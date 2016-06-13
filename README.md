# BIOLOID_TYPE_A_DYN_MODEL_RTB
V1-
Thank you for interest in this project. I needed bioloid dynamical model for my project, and failed to find one,
so we developed this model. Feel free to use it, modify and whatever you want, We would be glad to know someone find
it usefull. Feedback would be appreciated too. I'm going to use this model, so I would modify and add components.

You will need to install robotics toolbox by Peter Corke to use this model
http://petercorke.com/Robotics_Toolbox.html

Also if you want to connect to dynamixel's you will need Dynamixel SDK 
http://support.robotis.com/en/software/dynamixel_sdk/usb2dynamixel/usb2dxl_windows.htm

bioloidDin_LIMBS_14_04_2016.mat - bioloid type A limbs as serial manipulators with dynamical parameters built in

bioloidDin_KG_M_14_04_2016.mat - limbs as seriallinks plus computational data

armModel.m/legModel.m - Limbs build code

inertialData - links and parts inertia 

motor.m - wrapper class on dynamixelSDK feel free to look through code to how to use it 
motorExpSpeedExpVarU.m - consider it as an example 

plotArm.m - plots serial link and Centers of mass.



