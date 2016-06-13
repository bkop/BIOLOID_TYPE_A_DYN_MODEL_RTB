classdef motor
    %класс мотора содержит управл€емые параметры двигател€,
    %функции дл€ взаимодействи€ с двигателем,
    %а также функции дл€ управлени€ двигателем.
    properties(SetAccess = private) %int32
        %MOTOR DATA AND CONTROLS
         ID; 
        CW_ANGLE_LIMIT;
        CCW_ANGLE_LIMIT;
        LIMIT_TEMPERATURE;
        DOWN_LIMIT_VOLTAGE;
        UP_LIMIT_VOLTAGE;
        MAX_TORQUE;
        %ALARM_LED
        TORQUE_ENABLE;
        AX_LED;
        CW_COMPLIANCE_MARGIN;
        CCW_COMPLIANCE_MARGIN;
        CW_COMPLIANCE_SLOPE;
        CCW_COMPLIANCE_SLOPE;
        GOAL_POSITION;
        MOVING_SPEED;
        TORQUE_LIMIT;
        PRESENT_POSITION;
        PRESENT_SPEED;
        PRESENT_LOAD;
        PRESENT_VOLTAGE;
        PRESENT_TEMPERATURE;
        MOVING;
        PUNCH;
        %описание свойств см в документации ax-12 datasheet
        
        
    end%properties
    properties(SetAccess=private)
        M_ACCELERATION;
        M_SPEED;
        M_DTORQUE;
        %meta properties
        %controller properties
    end%properties
    methods
        %class routine
         function err=initDefault()
        
         end
        function self=motor(ID)
          %инициалищирует объект мотора и устанавливает ID
          
            self.ID=ID;
       %initDefault();
        end
        function [self,err]=SetParameter(self,name,value)
            %устанавливает значение value параметра с именем  name
            %возвращает эксземпл€р класса с этими изменени€ми 
            %
            %дл€ получени€ списка имен устанавливаемых параметров
            %изпользуйте функцию getSetableNames
            switch name
                                %добавить обработку кор€вых значений
                                case 'ID' 
                                    self.ID=value;
                                case 'CW_ANGLE_LIMIT' 
                                    self.CW_ANGLE_LIMIT=value;
                                case 'CCW_ANGLE_LIMIT' 
                                    self.CCW_ANGLE_LIMIT=value;
                                case 'LIMIT_TEMPERATURE' 
                                    self.LIMIT_TEMPERATURE=value;
                                case 'DOWN_LIMIT_VOLTAGE' 
                                    self.DOWN_LIMIT_VOLTAGE=value;
                                case 'UP_LIMIT_VOLTAGE' 
                                    self.UP_LIMIT_VOLTAGE=value;
                                case 'MAX_TORQUE' 
                                    self.MAX_TORQUE=value;
                            %ALARM_LED
                                case 'TORQUE_ENABLE' 
                                    self.TORQUE_ENABLE=value;
                                case 'AX_LED' 
                                    self.AX_LED=value;
                                case 'CW_COMPLIANCE_MARGIN' 
                                    self.CW_COMPLIANCE_MARGIN=value;
                                case 'CCW_COMPLIANCE_MARGIN' 
                                    self.CCW_COMPLIANCE_MARGIN=value;
                                case 'CW_COMPLIANCE_SLOPE' 
                                    self.CW_COMPLIANCE_SLOPE=value;
                                case 'CCW_COMPLIANCE_SLOPE' 
                                    self.CCW_COMPLIANCE_SLOPE=value;
                                case 'GOAL_POSITION' 
                                    self.GOAL_POSITION=value;
                                case 'MOVING_SPEED' 
                                    self.MOVING_SPEED=value;
                                case 'TORQUE_LIMIT' 
                                    self.TORQUE_LIMIT=value;
                                case 'PUNCH' 
                                    self.PUNCH=value;
            end%switch
        end
        function res=getSetableNames(self)
        %возвращает список имен устанавливаемых параметров

        names=fieldnames(self);
        setableInds=[2,3,7,8,9,10,11,12,13,14,15,16,23];
        res=names(setableInds,1);
        end
        function err=SetParametersAll(self,parameters)%cell array
                names=fieldnames(self);
                setableInds=[2,3,7,8,9,10,11,12,13,14,15,16,23];
                setableNames=names(setableInds,1);
                if (size(setdiff(parameters(:,1),setableNames),1)==0)
                    err = 'incorrect parameters table,  try getSetableNames() to get proper list of setable parameters';
                    return;
                end%if
                for ikk=1:size(setableNames,1)
                    self=setfield(self,parameters{ikk,1},parameters{ikk,2});
                end%for
        end
        function [res,err,adr,size,wr]=GetParameter(self,name)
            
            err='NO ERROR';
             switch name
                                 case 'ID' 
                                                           res=self.ID;                                                           adr=3;              size=1;     wr=1; 
                                case 'CW_ANGLE_LIMIT' 
                                                           res=self.CW_ANGLE_LIMIT;                          adr=6;              size=2;     wr=1;
                                case 'CCW_ANGLE_LIMIT' 
                                                           res=self.CCW_ANGLE_LIMIT;                       adr=8;              size=2;     wr=1;
                                case 'LIMIT_TEMPERATURE' 
                                                           res=self.LIMIT_TEMPERATURE;                  adr=11;            size=1;     wr=1;
                                case 'DOWN_LIMIT_VOLTAGE' 
                                                           res=self.DOWN_LIMIT_VOLTAGE;             adr=12;            size=1;      wr=1;
                                case 'UP_LIMIT_VOLTAGE' 
                                                           res=self.UP_LIMIT_VOLTAGE;                     adr=13;            size=1;      wr=1;
                                case 'MAX_TORQUE' 
                                                           res=self.MAX_TORQUE;                                adr=14;            size=2;      wr=1;
                                %ALARM_LED
                                case 'TORQUE_ENABLE' 
                                                           res=self.TORQUE_ENABLE;                          adr=24;            size=1;      wr=1;
                                case 'AX_LED' 
                                                           res=self.AX_LED;                                             adr=25;            size=1;      wr=1;
                                case 'CW_COMPLIANCE_MARGIN' 
                                                           res=self.CW_COMPLIANCE_MARGIN;      adr=26;            size=1;      wr=1;
                                case 'CCW_COMPLIANCE_MARGIN' 
                                                           res=self.CCW_COMPLIANCE_MARGIN;   adr=27;            size=1;      wr=1;
                                case 'CW_COMPLIANCE_SLOPE' 
                                                           res=self.CW_COMPLIANCE_SLOPE;          adr=28;             size=1;      wr=1;
                                case 'CCW_COMPLIANCE_SLOPE'
                                                           res=self.CCW_COMPLIANCE_SLOPE;       adr=29;             size=1;      wr=1;
                                case 'GOAL_POSITION' 
                                                           res=self.GOAL_POSITION;                            adr=30;             size=2;      wr=1;
                                case 'MOVING_SPEED' 
                                                           res=self.MOVING_SPEED;                             adr=32;             size=2;      wr=1;
                                case 'TORQUE_LIMIT' 
                                                           res=self.TORQUE_LIMIT;                             adr=34;             size=2;      wr=1;
                                case 'PUNCH' 
                                                           res=self.PUNCH;                                              adr=48;            size=2;      wr=1;
                                case 'PRESENT_POSITION' 
                                                           res=self.PRESENT_POSITION;                     adr=36;            size=2;       wr=0;                                                                                 
                                case 'PRESENT_SPEED' 
                                                           res=self.PRESENT_SPEED;                          adr=38;              size=2;       wr=0;
                                case 'PRESENT_LOAD' 
                                                           res=self.PRESENT_LOAD;                           adr=40;             size=2;        wr=0;
                                case 'PRESENT_VOLTAGE' 
                                                           res=self.PRESENT_VOLTAGE;                    adr=42;             size=1;        wr=0;
                                case 'PRESENT_TEMPERATURE' 
                                                           res=self.PRESENT_TEMPERATURE;        adr=43;             size=1;         wr=0;
                                case 'MOVING' 
                                                           res=self.MOVING;                                          adr=46;            size=1;         wr=0;
                 otherwise
                     res=-1;err='NO SUCH NAME';adr=-1;size=-1;wr=-1;
             end%switch
             
        end
        function res=GetParametersAll(self)
                    res= fieldnames(self);
                   for ikk=1:size(res,1)%можно ли заменить одной функцией ?
                            res{ikk,2}=getfield(self,res{ikk,1});
                   end%for
        end

        %CONTROL AND DATA ANALYSIS
        function [res,err]=control(self,argc,argv)
        %link to control function
        end
     
        function onErr(self)
        end
        
    end%methods
    methods  %transmit & receive data 
       function initDynamixelLibrary(self,PORTNUM)
                   BAUD=1;
                   loadlibrary('dynamixel','dynamixel.h');
                   calllib('dynamixel','dxl_initialize',PORTNUM,BAUD);
       end
        
        function unloadDynamixelLibrary(~)
                    calllib('dynamixel','dxl_terminate');
                    unloadlibrary('dynamixel');
        end
        
        function timerControl(~)
        end
        
        function SendCurrentStateToMotor(self)
        end
        
        function self=UpdateStateFromMotor(self)
            %readdata 
            [err,res]=self.readDynamixel();
            %parsedata
            self=self.parserFromHardToView(res,size(res,1));
            
            
            %parse data to self
            
        end
                
        function sendData(self,data)
        
        end
        
        function hdata=parserFromViewToHard(self)
            %prepares data as list of bytes to transmit 
            %registers 24-35
            %Torque enable - torquelimitH
            hdata=uint8(zeros(12,1));
            disp('wow');
            disp([size(hdata(1,1)),size(self.TORQUE_ENABLE)]);
            hdata(1,1)=uint8(self.TORQUE_ENABLE);
            hdata(2,1)=uint8(self.AX_LED);
            hdata(3,1)=uint8(self.CW_COMPLIANCE_MARGIN);
            hdata(4,1)=uint8(self.CCW_COMPLIANCE_MARGIN);
            hdata(5,1)=uint8(self.CW_COMPLIANCE_SLOPE);
            hdata(6,1)=uint8(self.CCW_COMPLIANCE_SLOPE);
            hdata(7:8,1)=typecast(uint16(self.GOAL_POSITION),'uint8');
            hdata(9:10,1)=typecast(uint16(self.MOVING_SPEED),'uint8');
            hdata(11:12,1)=typecast(uint16(self.TORQUE_LIMIT),'uint8');
            %%%
        end
        
        function [self,err]=parserFromHardToView(self,byteVect,length)
                            if length==49
                                        %'ID',int8(byteVect(1,1));  %3
                                        %baudrate byteVect(2,1)            %4
                                        %return delay time byteVect(3,1) %5
                                        self.CW_ANGLE_LIMIT=typecast(byteVect([4,5],1),'uint16');%int16(byteVect(4:5,1));%6-7
                                        %disp(self.CW_ANGLE_LIMIT);
                                        self.CCW_ANGLE_LIMIT = typecast(byteVect([6,7],1),'uint16');%uint16(byteVect(6:7,1));%8-9
                                        %RESERVED %10
                                        self.LIMIT_TEMPERATURE = uint8(byteVect(9,1)); %11
                                        self.DOWN_LIMIT_VOLTAGE = uint8(byteVect(10,1));%12
                                        self.UP_LIMIT_VOLTAGE = uint8(byteVect(11,1));%13
                                        self.MAX_TORQUE = typecast(byteVect([12,13],1),'uint16');%uint16(byteVect(12:13,1));%14-15
                                        %STATUS RETURN LEVEL byteVect(14,1)%16
                                        %ALARM_LED                      byteVect(15,1)%17
                                        %ALARM SHUTDWON       byteVect(16,1)%18
                                        %reserved                                byteVect([17,1)%19
                                        %DOWNCALLIBRATION   byteVect(18:19,1)%20-21
                                        %UPCALLIBRATION           byteVect(20:21,1)%22-23
                                        self.TORQUE_ENABLE = uint8(byteVect(22,1));%24
                                        self.AX_LED = uint8(byteVect(23,1));%250
                                        self.CW_COMPLIANCE_MARGIN = uint8(byteVect(24,1));%26
                                        self.CCW_COMPLIANCE_MARGIN = uint8(byteVect(25,1));%27
                                        self.CW_COMPLIANCE_SLOPE = uint8(byteVect(26,1));%28
                                        self.CCW_COMPLIANCE_SLOPE = uint8(byteVect(27,1));%29
                                        self.GOAL_POSITION = typecast(byteVect([28,29],1),'uint16');%uint16(byteVect(28:29,1));%30-31
                                        self.MOVING_SPEED = typecast(byteVect([30,31],1),'uint16');%uint16(byteVect(30:31,1));%32-33
                                        self.TORQUE_LIMIT = typecast(byteVect([32,33],1),'uint16');%uint16(byteVect(32:33,1));%34-35
                                        self.PRESENT_POSITION = typecast(byteVect([34,35],1),'uint16');%uint16(byteVect(34:35,1));%36-37
                                        self.PRESENT_SPEED = typecast(byteVect([36,37],1),'uint16');%uint16(byteVect(36:37,1));%38-39
                                        self.PRESENT_LOAD = typecast(byteVect([38,39],1),'uint16');%int16(byteVect(38:39,1));%40-41
                                        self.PRESENT_VOLTAGE = uint8(byteVect(40,1));%42
                                        self.PRESENT_TEMPERATURE = uint8(byteVect(41,1));%43
                                        %REGISTERED INSTRUCTION byteVect(42) %44
                                        %RESERVED %45
                                        self.MOVING = uint8(byteVect(44,1));%46
                                        %LOCK %47
                                        self.PUNCH = typecast(byteVect([48,47],1),'uint16');%int16(byteVect(46:47,1));%49
                             err='NO ERROR';
                            else
                            err='length error';
                            end
         end
        
        function [err,data]=readDynamixel(self)
                        %packet vaariables to read all data
            func=2;
            id=self.ID;
            length=4;
            start_adress=3;%%from ID
            data_length=47;%47 to the end  
            %form packet
            calllib('dynamixel','dxl_set_txpacket_id',id); 
            calllib('dynamixel','dxl_set_txpacket_length',length);
            calllib('dynamixel','dxl_set_txpacket_instruction',func);
            calllib('dynamixel','dxl_set_txpacket_parameter',int32(0),start_adress); 
            calllib('dynamixel','dxl_set_txpacket_parameter',int32(1),data_length);
             
            %transmit and receive data
            calllib('dynamixel','dxl_txrx_packet');
            %calllib('dynamixel','dxl_rx_packet');
            CommStatus = self.getStatus();
            %calllib('dynamixel','dxl_get_result');
            rx_length=calllib('dynamixel','dxl_get_rxpacket_length');
            %disp 'rx_length';
            %disp(rx_length);
            rx_parameters=uint8(zeros(rx_length,1));
            for ikk=1:rx_length
                    rx_parameters(ikk,1)=calllib('dynamixel','dxl_get_rxpacket_parameter',ikk-1);
            end
            err=CommStatus;  data=rx_parameters; %data_len=rx_length; 
            %disp(data)
        end
        
        function [err]=writeDynamixelMotion(self)
            instruction=3;
            length=12+3;
            %form packet
            calllib('dynamixel','dxl_set_txpacket_id',self.ID);
            calllib('dynamixel','dxl_set_txpacket_instruction',instruction);
            calllib('dynamixel','dxl_set_txpacket_length',length);
            calllib('dynamixel','dxl_set_txpacket_parameter',int32(0),24);
                %prepareParameterTable
                params=self.parserFromViewToHard();
                for ikk=1:size(params,1)
                 calllib('dynamixel','dxl_set_txpacket_parameter',int32(ikk),params(ikk,1));
                end
            %transmit and receive data
            calllib('dynamixel','dxl_txrx_packet');
            %calllib('dynamixel','dxl_rx_packet');
                self.getStatus();         
        end
        
        function [err]=writeDynamixel(self,nameParam,value)
         [res,err,adr,size,wr]=GetParameter(self,nameParam);
            if not(res==-1)
                    %if parameter with this name exists 
                    %check for writeability
                                if not(wr==0)
                                    %use writeword for 2byte paraneter and write byte
                                    %for 1byte parameter
                                                       switch size
                                                            case 1
                                                                calllib('dynamixel','dxl_write_byte',uint8(self.ID),uint8(adr),uint8(value))
                                                            case 2
                                                                calllib('dynamixel','dxl_write_word',uint8(self.ID),uint8(adr),uint16(value))
                                                            otherwise
                                                                err='SIZE ERROR'; %disp(err);
                                                        end%switch size
                                                                   %workout status packet
                                                                       self.getStatus();

                                else
                                    err='NO WRITEABLE PARAMETER';
                                   % disp(err);
                                end%if wr!=0
            else
                %disp(err);
            end%if
        end
        
        function status=getStatus(self)
         CommStatus = int32(calllib('dynamixel','dxl_get_result'));
            if CommStatus == 1
            PrintErrorCode();
            %return;
            else
            disp('CommStatus');
            PrintCommStatus(CommStatus);
            end     
            status=CommStatus;
        end
        
              
    end%methods
end%classdef
