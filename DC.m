 %Extract cycle parameters
           cycle_parameters = inputdlg('Initial temp','Initial press','Initial volume','Gas constant','Compression ratio','Cut-off ratio','Specific heat capacity of p','Specific heat capacity of v','Stroke Length','Cylinder Bore Diameter'),'Diesel Cycle Parameters';
          
           %Check for empty paramters and output an error message if any
           for i=1:10
               if isempty(cycle_parameters(i))
                   Err = msgbox('Inital cycle parameter left blank. Retry');
                   return
               end
           end
          
           %Convert character array to numeric matrix
           Ti = str2num(cycle_parameters(1));
           Pi = str2num(cycle_parameters(2));
           Vi = str2num(cycle_parameters(3));
           Cp = str2num(cycle_parameters(4));
           Cv = str2num(cycle_parameters(5));
           R = str2num(cycle_parameters(6));
           cr = str2num(cycle_parameters(7));
           cor = str2num(cycle_parameters(8));
          L_s = str2num(cycle_parameters(9));
           D_c = str2num(cycle_parameters(10));
          
            %Check temperature value
          
           if (Ti == 0)
               Terr = msgbox('Inital temperature value can not be zero. Retry');
               return
           end
          
             %Check pressure value
            
           if (Pi == 0)
               Perr = msgbox ('Inital pressure value can not be zero. Retry');
               return
           end
           
           %Check cut-off ratio value
          
           if (cor == 0)
               CORerr = msgbox('Cut-off ratio value can not be zero. Retry');
               return
           end
          
             %Check compression ratio value
            
             if (cr < 12)
                 Crerr = msgbox ('Compression ration should be between 12 and 24. Retry');
                 return
               else if (cr > 24)
                     CRerr= msgbox ('Compression ration should be between 12 and 24. Retry');
                     return
               end
             end
            
             %input other variables
             gamma = Cp/Cv;
            
             %Calculate swept and clearance volumes
            
             Vs = (pi/4)*(D_c^2)*(L_s);
             Vc = Vs / (cr-1);
            
             %Calculate variables at different states
             % State 1
            
             vD1 = Vs + Vc;
             pD1 = Pi;
             tD1 = Ti;
            
             % State 2
            
             vD2 = Vc;
             pD2 = pD1 * (cr^gamma);
             tD2 = tD1 * (cr^(gamma-1));
            
             % State 3
            
             vD3 = cor * vD2;
             pD3 = pD2;
             tD3 = cor * tD2;
            
             % State 4
            
             vD4 = vD1;
             pD4 = pD3 * ((vD3/vD4)^gamma);
             tD4 = (pD4*vD4*tD3) / (pD3*vD3);
            
             %Compression Curve from State 1 to State 2
            
             Comp_vD = linspace (vD1,vD2,100);
             Comp_pD = (((vD1./Comp_vD).^gamma)*pD1);
            
             %Expansion Curve from State 3 to State 4
            
             Exp_vD = linspace (vD3,vD4,100);
             Exp_pD = (((vD3./Exp_vD).^gamma)*pD3);
            
             % Calculate Output parameters
            
             %Thermal_Efficiency
             Thermal_Efficiency = 1-((1/(cr^(gamma-1)))*(((cor^gamma)-1)/(gamma*(cor-1))));
            
             %Net work output
             mass = pD1*vD1*180/(R+tD1);
             Qa = mass*Cp*(tD3-tD2)*1000;
             Wnet = Qa*Thermal_Efficiency/1000;
             Qr = mass*Cv*(tD4-tD1)*1000;
            
             %Mean Effective Pressure
             MEP = Wnet/(vD1-vD2);
            
             %Display output parameters
             Output = msgbox ({['Mean Effective Pressure = ', num2str(MEP)], ['Thermal Efficiency=',num2str(Thermal_Efficiency)], ['Net Work Done=',num2str(Wnet)]});
             disp('View P_V Diagram')
             uiwait(Output)
             clc
             cd('ArData/')
             
             %Plot P-V Curve
             m = 1;
             figure (m)
             hold on
             grid on
             title ('Ideal Diesel Cycle')
             hold on
             plot (Comp_vD, Comp_pD,'color','r')
             hold on
             plot ([vD2 vD3],[pD2 pD3],'color','m')
             hold on
             plot (Exp_vD, Exp_pD, 'color', 'r')
             hold on
             plot ([vD4 vD1],[pD4 pD1],'color','m')
             xlabel ('Volume')
             ylabel ('Pressure')
              end
          
    
             
             

