% ASTM D6272 Stress Strain Analysis
function [stressAbs, strain] = ASTM_D6272_Stress_Strain_Analysis(Position, Load, depth, width)
 %Input Variable
  STRESS_COEFF = 3 / 4;
  STRAIN_COEFF = 4.46;
  SUPPORT_SPAN = 70; % mm
  
  %Perform Calculations
    %Sample 1
  Position_change1 = Position1(1,1)-Position1;
  f1 = SUPPORT_SPAN * Load1;
  a1 = width * (depth ^ 2);
  l1 = STRAIN_COEFF * depth;
    %Sample 2
  Position_change2 = Position2(1,1)-Position2;
  f2 = SUPPORT_SPAN * Load2;
  a2 = width * (depth ^ 2);
  l2 = STRAIN_COEFF * depth;
    %Sample 3
  Position_change3 = Position3(1,1)-Position3;
  f3 = SUPPORT_SPAN * Load1;
  a3 = width * (depth ^ 2);
  l3 = STRAIN_COEFF * depth;
    %Sample 4
  Position_change4 = Position4(1,1)-Position4;
  f4 = SUPPORT_SPAN * Load4;
  a4 = width * (depth ^ 2);
  l4 = STRAIN_COEFF * depth;
    %Sample 5
  Position_change5 = Position5(1,1)-Position5;
  f5 = SUPPORT_SPAN * Load5;
  a5 = width * (depth ^ 2);
  l5 = STRAIN_COEFF * depth;
    %Sample 6
  Position_change6 = Position6(1,1)-Position6;
  f6 = SUPPORT_SPAN * Load6;
  a6 = width * (depth ^ 2);
  l6 = STRAIN_COEFF * depth;
    %Sample 7
  Position_change7 = Position7(1,1)-Position7;
  f7 = SUPPORT_SPAN * Load7;
  a7 = width * (depth ^ 2);
  l7 = STRAIN_COEFF * depth;
  
  %Final Output
    %Sample 1
  stressAbs1 = abs(STRESS_COEFF .* (f1 ./ a1));
  strain1 = l1 .* Position_change1 / (SUPPORT_SPAN ^ 2);
    %sample 2
  stressAbs2 = abs(STRESS_COEFF .* (f2 ./ a2));
  strain2 = l2 .* Position_change2 / (SUPPORT_SPAN ^ 2);
    %Sample 3
  stressAbs3 = abs(STRESS_COEFF .* (f3 ./ a3));
  strain3 = l3 .* Position_change3 / (SUPPORT_SPAN ^ 2);
    %Sample 4
  stressAbs4 = abs(STRESS_COEFF .* (f4 ./ a4));
  strain4 = l4 .* Position_change4 / (SUPPORT_SPAN ^ 2);
    %Sample 5
  stressAbs5 = abs(STRESS_COEFF .* (f5 ./ a5));
  strain5 = l5 .* Position_change5 / (SUPPORT_SPAN ^ 2);
    %Sample 6
  stressAbs6 = abs(STRESS_COEFF .* (f6 ./ a6));
  strain6 = l6 .* Position_change6 / (SUPPORT_SPAN ^ 2);
    %Sample 7
  stressAbs7 = abs(STRESS_COEFF .* (f7 ./ a7));
  strain7 = l7 .* Position_change7 / (SUPPORT_SPAN ^ 2);
 
  % Find Flexural Stress fro each sample tested
   %Sample 1
  FS_1 = max(stressAbs1);
   %Sample 2
  FS_2 = max(stressAbs2);
   %Sample 3
  FS_3 = max(stressAbs3);
   %Sample 4
  FS_4 = max(stressAbs4);
   %Sample 5
  FS_5 = max(stressAbs5);
   %Sample 6
  FS_6 = max(stressAbs6);
   %Sample 7
  FS_7 = max(stressAbs7);
  
  %Calculate Average Flexural Stress
  
  FS_avg = mean(FS_1,FS_2,FS_3,FS_4,FS_5,FS_6,FS_7);
  
  %Display Results
  Flexural_Stress = table (FS_1,FS_2,FS_3,FS_4,FS_5,FS_6,FS_7, FS_avg);
  
  %Plot Curve
  m = 1;
  figure (m)
  hold on 
  grid on
  plot(strain1, stressAbs1, 'color','r')
  hold on
  plot(strain2, stressAbs2, 'color','g')
  hold on
  plot(strain3, stressAbs3, 'color','b')
  hold on
  plot(strain4, stressAbs4, 'color','c')
  hold on
  plot(strain5, stressAbs5, 'color','m')
  hold on
  plot(strain6, stressAbs6, 'color','y')
  hold on
  plot(strain7, stressAbs7, 'color','k')
  xlabel ('Strain, mm/mm')
  ylabel ('Stress, MPa')
  title ( 'Stress Strain Curve')


[stressAbs, strain] = d790_252(Position, Load, depth, width);
end 
