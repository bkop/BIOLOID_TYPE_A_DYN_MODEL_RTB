
%arm kinematics
 %load('BioloidarmModelData.mat')
 den=1000;%milimeter to meter
 mden=1000;%gramm tokilogramm
%LEFT ARM
    A1=Link('d',43.87/den,'a',14.5/den,'alpha',-pi/2);
    A1.m=11.25/mden;
    T=t2r((trotz(90*pi/180)*trotx(-90*pi/180))); %motor CS to armLink CS
    t_inert=T*az1Il_*T';
    A1.I=t_inert;%inertia is already in kg m
    temp=((trotz(90*pi/180)*trotx(-90*pi/180))*[az1CM/den,1]');%mass center in armLink CS
    A1.r=temp(1:3,1);

    A2=Link('d',0,'a',67.5/den,'alpha',0);
    A2.m=(54.6+14.6)/mden;
    T=t2r(trotz(-90*pi/180)*trotx(90*pi/180));
    t_inert=T*az2Il_*T';
    A2.I=t_inert;
    temp=((trotz(-90*pi/180)*trotx(90*pi/180))*[az2ACM/den,1]');
    A2.r=temp(1:3,1);

    A3=Link('d',0,'a',106.71/den,'alpha',0);
    A3.m=(54.6+17.2)/mden;
    T=t2r(trotz(-90*pi/180)*trotx(90*pi/180));
    t_inert=T*az3Il_*T';
    A3.I=t_inert;
    temp=((trotz(-90*pi/180)*trotx(90*pi/180))*[az3ACM/den,1]');
    A3.r=temp(1:3,1);

armL=SerialLink([A1,A2,A3],'name','armL');
armL.base=troty(90*pi/180)*transl([0,0,0.1]);

plotArm(figure('color','white'),armL,[pi/3,pi/6,0],true);
 
 %RIGHT ARM
    A1=Link('d',43.87/den,'a',14.5/den,'alpha',-pi/2);
    A1.m=11.25/mden;
    T=t2r(trotz(90*pi/180));
    t_inert=T*az1Ir_*T';
    A1.I=t_inert;
    temp=trotz(pi)*((trotz(90*pi/180)*trotx(-90*pi/180))*[az1CM/den,1]');%trotx(-90*pi/180)
    A1.r=temp(1:3,1);

    A2=Link('d',0,'a',67.5/den,'alpha',0);
    A2.m=(54.6+14.6)/mden;
    T=t2r((trotz(-90*pi/180)*trotx(90*pi/180))*trotz(pi));
    t_inert=T*az2Ir_*T';
    A2.I=t_inert;
    temp=((trotz(-90*pi/180)*trotx(90*pi/180))*trotz(pi)*[az2ACM/den,1]');
    A2.r=temp(1:3,1);

    A3=Link('d',0,'a',106.71/den,'alpha',0);
    A3.m=(54.6+17.2)/den;
    T=t2r((trotz(-90*pi/180)*trotx(90*pi/180))*trotz(pi));
    t_inert=T*az3Ir_*T';
    A3.I=t_inert;
    temp=((trotz(-90*pi/180)*trotx(90*pi/180))*trotz(pi)*[az3ACM/den,1]');
    A3.r=temp(1:3,1);
    % armMotorCSmask(1,:,:)=inv(trotz(90*pi/180)*trotx(-90*pi/180));
    % armMotorCSmask(2,:,:)=inv(trotz(-90*pi/180)*trotx(90*pi/180));
    % armMotorCSmask(3,:,:)=inv(trotz(-90*pi/180)*trotx(90*pi/180));

armR=SerialLink([A1,A2,A3],'name','armR');
armR.base=troty(90*pi/180)*transl([0,0,-0.1])*trotx(pi);
plotArm(figure('color','white'),armR,[pi/3,pi/6,0],true);
axis([-1.2,-0.4,-0.4,0.4,-0.4,0.4])

    %arm.plot([0,0,0])
    % fig0=figure('color','white');
    % armL.plot([pi/6,-pi/4,-pi/4]); 
    % hold on; 
    % armR.plot([pi/6,-pi/4,-pi/4]); 
    % hold off;
    %  fig1=figure('color','white');
    %  fig2=figure('color','white');
    %  plotArm(fig1,armL,[pi/6,-pi/4,-pi/4],true);  
    %  plotArm(fig2,armR,[pi/6,-pi/4,-pi/4],true); 
