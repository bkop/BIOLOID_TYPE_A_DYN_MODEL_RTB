%переделать load в счетчик экспериментов 

clear all;
m=motor(7);
nagruzka='gruz0';
m.initDynamixelLibrary(3);


expnum=10;%number of experimentssa
exptime=5;%secs
m=m.UpdateStateFromMotor();
params=m.GetParametersAll();
numparams=zeros(size(params,1),1);
motorData=zeros(100*5*3,size(params,1)+1);

%m=m.SetParameter('TORQUE_LIMIT',uint16(200));

%WHeel mode measure
m=m.UpdateStateFromMotor();
m.writeDynamixel('CW_ANGLE_LIMIT',uint16(0));
m.writeDynamixel('CCW_ANGLE_LIMIT',uint16(0));
m.writeDynamixel('TORQUE_LIMIT', uint16(1000));
%m.writeDynamixel('UP_LIMIT_VOLTAGE',uint8(100));
m=m.UpdateStateFromMotor();
disp(m);
mlsData=cell(expnum,2);
expCnt=0;
for expKK=1:expnum;
    expCnt=expCnt+1;
    disp(expCnt);
    speedCnt=-1;
    %disp 'starting new measure'
for speedKK=200:200:1000
    speedCnt=speedCnt+1;
    disp(sprintf('current measure goal speed is %d',speedKK));
    m=m.SetParameter('MOVING_SPEED',uint16(speedKK));
    m=m.SetParameter('TORQUE_LIMIT',uint16(1000));
    m.writeDynamixelMotion();
    tic;%start timer and restart timer before every measure
    for ikk=1:exptime/0.05%50ms measure step
    m=m.UpdateStateFromMotor();
    params=m.GetParametersAll();
                    for pkk=1:size(params,1)
                        if isinteger(params{pkk,2})%just convert from cell to array
                        numparams(pkk,1)=params{pkk,2};
                        else 
                        numparams(pkk,1)=0;
                        end
                    end
                    numparams(size(params,1)+1,1)=toc;%saving real elapsed time
                    
    motorData(ikk+100*speedCnt,:)=numparams(:,1);%only data
    
    pause(0.05);%delay 50ms 
    %посчитать неточность измерени€ времени
    %отдельно запрашивать врем€ неззависимого таймера и отмечать им данные в и
    %выводить на экран матлаба 
    
    end%for
    m=m.SetParameter('MOVING_SPEED',uint16(0));
    m=m.SetParameter('TORQUE_ENABLE',uint8(0));
    m.writeDynamixelMotion();
   
    pause(3);%10 seconds pause between speed measures experiments
   
    
end%speed
%sinus
for speedKK=200:200:1000
    speedCnt=speedCnt+1;
    disp(sprintf('current sinus measure goal speed is %d',speedKK));
    tic;%start timer and restart timer before every measure
    for ikk=1:exptime/0.05%50ms measure step
    
    m=m.SetParameter('MOVING_SPEED',uint16(sind(ikk*10)*speedKK/2+speedKK/2));
    m=m.SetParameter('TORQUE_LIMIT',uint16(1000));
    m.writeDynamixelMotion();
       pause(0.05);%delay 50ms  
    m=m.UpdateStateFromMotor();
    params=m.GetParametersAll();
                    for pkk=1:size(params,1)
                        if isinteger(params{pkk,2})%just convert from cell to array
                        numparams(pkk,1)=params{pkk,2};
                        else 
                        numparams(pkk,1)=0;
                        end
                    end
                    numparams(size(params,1)+1,1)=toc;%saving real elapsed time
                    
    motorData(ikk+100*speedCnt+501,:)=numparams(:,1);%only data
    

    %посчитать неточность измерени€ времени
    %отдельно запрашивать врем€ неззависимого таймера и отмечать им данные в и
    %выводить на экран матлаба 
    
    end%for
    m=m.SetParameter('MOVING_SPEED',uint16(0));
    m=m.SetParameter('TORQUE_ENABLE',uint8(0));
    m.writeDynamixelMotion();
   
    pause(3);%10 seconds pause between speed measures experiments
   
    
end%speed sinus

%sawtooth
for speedKK=200:200:1000
    speedCnt=speedCnt+1;
    disp(sprintf('current sinus measure goal speed is %d',speedKK));
    tic;%start timer and restart timer before every measure
    for ikk=1:exptime/0.05%50ms measure step
    
    m=m.SetParameter('MOVING_SPEED',uint16(sawtooth(ikk*10*pi/180)*speedKK/2+speedKK/2));
    m=m.SetParameter('TORQUE_LIMIT',uint16(1000));
    m.writeDynamixelMotion();
       pause(0.05);%delay 50ms  
    m=m.UpdateStateFromMotor();
    params=m.GetParametersAll();
                    for pkk=1:size(params,1)
                        if isinteger(params{pkk,2})%just convert from cell to array
                        numparams(pkk,1)=params{pkk,2};
                        else 
                        numparams(pkk,1)=0;
                        end
                    end
                    numparams(size(params,1)+1,1)=toc;%saving real elapsed time
                    
    motorData(ikk+100*speedCnt+1001,:)=numparams(:,1);%only data
    

    %посчитать неточность измерени€ времени
    %отдельно запрашивать врем€ неззависимого таймера и отмечать им данные в и
    %выводить на экран матлаба 
    
    end%for
    m=m.SetParameter('MOVING_SPEED',uint16(0));
    m=m.SetParameter('TORQUE_ENABLE',uint8(0));
    m.writeDynamixelMotion();
   
    pause(3);%10 seconds pause between speed measures experiments
   
    
end%speed sawtooth

%сохран€ем данные в €чейки
mlsData{expCnt,1}=expKK;
mlsData{expCnt,2}=motorData;
%messsage=sprintf('please replace load with one equal to %d%% of maximum load',expKK);
%msgh=msgbox(message,'replace load','help'); 
%uiwait(msgh); 
disp(sprintf('measure N%d of %d done successfull',expKK,expnum));
 disp(params);
end%load

load gong.mat;
sound(y);

m.unloadDynamixelLibrary();