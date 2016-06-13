%leg R kinematics
%kilograms meters 
 %load('BioloidarmModelData.mat')
 
 den=1000;%millimetr to meter
 mden=1000;%gramm to kilogramm
 
 LR1=Link('d',49.87/den,'a',0,'alpha',pi/2);
     T = t2r( troty( 90 * pi / 180 ) * trotz( -90 * pi / 180 ) );
     t_inert = T * lz1Il_ * T';
     LR1.I = t_inert; 
     temp = troty( 90 * pi/180) * trotz( -90 * pi / 180) * [l1CM / den, 1]';
     LR1.r = temp( 1:3, 1);
     LR1.m = l1M / mden;%gramm to kilogramm

 
 LR2=Link('d',0,'a',0,'alpha',pi/2,'offset',pi/2);
     TR = t2r( trotz( pi ) * trotx( -pi / 2) );
     tr_inert = TR * lz2Il_ * TR';%axis rotation
     LR2.I = tr_inert;
     temp  = transl( [0, 0, 32/den]) * trotz(pi) * trotx( -pi / 2) * [l2ACM / den, 1]';
     LR2.r = temp( 1:3 , 1);
     LR2.m=l2AM/mden;%gramm to kilogramm
 
 LR3=Link('d',0,'a',76.4/den,'alpha',0,'offset',11*pi/180);
     TR = t2r( trotz( -pi / 2) * trotx( pi / 2 ));
     tr_inert = TR * lz3Il_ * TR';%axis rotation
     LR3.I = tr_inert;
     temp = trotz( -pi / 2) * trotx( pi/2 ) * [l3CM / den,1]';
     LR3.r = temp( 1:3, 1);
     LR3.m = l3M / mden;%gramm to kilogramm
 
 LR4=Link('d',0,'a',76.4/den,'alpha',0,'offset',-22*pi/180);
     TR = t2r( trotz( ( 180 - 11 ) * pi/180) * trotx( pi / 2 ));
     tr_inert = TR * lz4Il_ * TR';%axis rotation
     LR4.I = tr_inert;
     temp = trotz( ( 180 - 11) * pi / 180) * trotx( pi / 2) * [ l4ACM / den, 1]';
     LR4.r = temp( 1:3 , 1 );
     LR4.m = l4AM / mden;%gramm to kilogramm
 
 LR5=Link('d',0,'a',0,'alpha',pi/2,'offset',11*pi/180);
     TR = t2r( trotz( ( 90 + 11 ) * pi / 180) * trotx( 90 * pi / 180));
     tr_inert = TR * lz5Il_ * TR';%axis rotation
     LR5.I = tr_inert;
     temp = trotz( (90 + 11) * pi / 180) * trotx( 90 * pi / 180) * [ l5ACM / den, 1]';
     LR5.r = temp( 1:3 , 1);
     LR5.m = l5AM / mden;%gramm to kilogramm
 
 LR6=Link('d',0,'a',0,'alpha',0);
      TR = t2r( trotz( pi / 2) * trotx( pi / 2 ));
     tr_inert = TR * lz6Il_ * TR';%axis rotation
     LR2.I = tr_inert;
     temp = transl( [ 0, 0, -32 / den]) * trotz(pi / 2 ) * trotx(pi / 2) * [l6CM / den, 1]';
     LR6.r = temp( 1:3 , 1);
     LR6.m = l6M / mden;%gramm to kilogramm
 
 
 legL=SerialLink([LR1,LR2,LR3,LR4,LR5,LR6],'name','legL');
% A1=Link('d',43.87/den,'a',14.5/den,'alpha',-pi/2);
% A1.m=11.25;
% A1.r=az1CM/den;
% temp=((trotz(90*pi/180)*trotx(-90*pi/180))*[az1CM/den,1]');
% A1.r=temp(1:3,1);


legL.base=trotx(pi);

%LEFT LEG

 LR1 = Link('d',49.87/den,'a',0,'alpha',pi/2);
     T = t2r( troty( 90 * pi / 180) * trotz( -90 * pi / 180 ));
     t_inert = T * lz1Ir_ * T';
     LR1.I = t_inert;
     temp = troty( 90 * pi / 180) * trotz( -90 * pi / 180) * [l1CM / den, 1]';
     LR1.r = temp( 1:3 , 1 );
     LR1.m = l1M / mden;%gramm to kilogramm
 
 LR2 = Link( 'd' , 0 , 'a', 0, 'alpha', pi / 2, 'offset', pi/2);
     TR = t2r( trotz( pi ) * trotx( -pi /2 ) );
     tr_inert = TR * lz2Ir_ * TR';%axis rotation
     LR2.I = tr_inert;
     temp = transl( [ 0, 0, 32 / den]) * trotz(pi) * trotx( -pi/2 ) * [ l2ACM / den, 1]';
     LR2.r = temp( 1:3, 1);
     LR2.m = l2AM / mden;%gramm to kilogramm
 
 LR3 = Link('d', 0, 'a', 76.4 / den, 'alpha', 0, 'offset', 11 * pi / 180);
     TR = t2r( trotz( -pi/2 ) * trotx( pi/2 ) * trotz( pi ));
     tr_inert = TR * lz3Ir_ * TR';%axis rotation
     LR3.I = tr_inert;
     temp = trotz( -pi/2 ) * trotx( pi/2 ) * trotz(pi) * [ l3CM / den, 1]';
     LR3.r = temp( 1:3, 1);
     LR3.m = l3M / mden;%gramm to kilogramm

 LR4 = Link('d', 0, 'a', 76.4 / den, 'alpha', 0, 'offset', -22 * pi / 180);
      TR = t2r( trotz( (180-11) * pi / 180 ) * trotx( pi/2 ) * trotz(pi));
     tr_inert = TR * lz4Ir_ * TR';%axis rotation
     LR4.I = tr_inert;
     temp = trotz( (180-11) * pi / 180) * trotx( pi/2 ) * trotz(pi) * [ l4ACM / den, 1]';
     LR4.r = temp( 1:3, 1);
     LR4.m = l4AM / mden;%gramm to kilogramm
 
 LR5 = Link( 'd', 0, 'a', 0, 'alpha',pi/2,  'offset',11 * pi / 180);
     TR = t2r( trotz( (90+11) * pi/180) * trotx(90 * pi / 180) * trotz(pi));
     tr_inert = TR * lz5Ir_ * TR';%axis rotation
     LR5.I = tr_inert;
     temp = trotz( (90+11) * pi / 180) * trotx( 90 * pi / 180) * trotz(pi) * [ l5ACM / den, 1]';
     LR5.r = temp( 1:3, 1);
     LR5.m = l5AM / mden;%gramm to kilogramm

 LR6 = Link('d', 0,  'a', 0,  'alpha', 0);
      TR = t2r( trotz( pi/2 ) * trotx(pi/2));
     tr_inert = TR * lz6Ir_ * TR';%axis rotation
     LR2.I = tr_inert;
     temp = transl( [ 0, 0, -32 / den]) * trotz( pi/2 ) * trotx( pi/2 ) * [ l6CM / den, 1]';
     LR6.r = temp( 1:3, 1);
     LR6.m = l6M / mden;%gramm to kilogramm
 
 
 legR=SerialLink([LR1,LR2,LR3,LR4,LR5,LR6],'name','legR');
% A1=Link('d',43.87/den,'a',14.5/den,'alpha',-pi/2);
% A1.m=11.25;
% A1.r=az1CM/den;
% temp=((trotz(90*pi/180)*trotx(-90*pi/180))*[az1CM/den,1]');
% A1.r=temp(1:3,1);


legR.base=trotx(pi);
plotArm(figure('color','white'),legR,[0,0,0,0,0,0],true);