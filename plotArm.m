%plotArm
function []=plotArm(fig1,manip,q,showCM)
h1=fig1;
figure(h1);
tl=cell(1,size(q,2));
tm=cell(1,size(q,2));
for ikk=1:size(q,1)
%clf(h1);
manip.plot(q(ikk,:));
hold on;

% for ikk=1:size(arm.links(),2)
%     T=
% end 
    tlmn=manip.base;
    
    for qkk=1:size(q,2)
    trplot(tlmn,'rgb','arrow','length',1,'frame',num2str(qkk)); 
    tl{1,qkk}=tlmn;
    tlmn=tlmn*manip.links(qkk).A(q(ikk,qkk));
    
    
    end

%motor to link coordiantetrnslation needed
        if (showCM)
            tmhm=manip.base;
            for qkk=1:size(q,2)
        %tmcm=tl{1,qkk}*r2t(t2r(manip.links(qkk).A(q(ikk,1))))*transl(manip.links(qkk).r);
%         tmcm=tl{1,qkk}*r2t(t2r(manip.links(qkk).A(q(ikk,qkk))))*transl(manip.links(qkk).r);
%         trplot(tmcm,'arrow','length',0.5,'frame',num2str(qkk));
%         tm{1,qkk}=tmcm;
        Tmod=inv(manip.links(qkk).A(0))*transl(manip.links(qkk).r);%description of COM i terms of
        %link, replacing the link-1 description, ignore rotation
        tmhm=tmhm*manip.links(qkk).A(q(ikk,qkk));
        tmcm=tmhm*Tmod;
        trplot(tmcm,'arrow','rviz','length',0.1,'frame',num2str(qkk));
        
         %*r2t(t2r(manip.links(qkk).A(q(ikk,qkk))))   
%         tm1=manip.base*r2t(t2r(manip.links(1).A(q(ikk,1))))*transl(manip.links(1).r);
%         tm2=manip.base*tl1*r2t(t2r(manip.links(2).A(q(ikk,2))))*transl(manip.links(2).r);
%         tm3=manip.base*tl2*r2t(t2r(manip.links(3).A(q(ikk,3))))*transl(manip.links(3).r);
%         
%          trplot(tm1,'arrow','length',0.50);
%          trplot(tm2,'arrow','length',0.50);
%          trplot(tm3,'arrow','length',0.50);
          end
        end
pause(0.1);
hold off;
end