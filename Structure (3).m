%% weight of components (lb)
% solar panels, housing, battery, antenna, hard drive, safety light,
% computer, and anchor

solar1_w = 20;
solar2_w = 20;
solar3_w = 20;
solar4_w = 20;
house_w = 309.514;
batt_w = 0.1;
ant_w = 0.5;
drive_w = 0.1;
light_w = 0.1;
comp_w = 0.1;
anchor_w = 15;

%% mass of components (kg)

solar1_m = solar1_w * 0.453592;
solar2_m = solar2_w * 0.453592;
solar3_m = solar3_w * 0.453592;
solar4_m = solar4_w * 0.453592;
house_m = house_w * 0.453592;
batt_m = batt_w * 0.453592;
ant_m = ant_w * 0.453592;
drive_m = drive_w * 0.453592;
light_m = light_w * 0.453592;
comp_m = comp_w * 0.453592;
anchor_m = anchor_w * 0.453592;

%% total mass of buoy (anchor not included)

M = solar1_m + solar2_m + solar3_m + solar4_m + house_m + batt_m + ant_m + drive_m + light_m + comp_m;

%% centroids in xyz space (m)

solar1_x = 0.61;
solar1_y = 1.83;
solar1_z = 0.3048;

solar2_x = 0.61;
solar2_y = 1.83;
solar2_z = -0.3048;

solar3_x = 0.3048;
solar3_y = 1.83;
solar3_z = 0;

solar4_x = 0.9144;
solar4_y = 1.83;
solar4_z = 0;

house_x = 0.61;
house_y = 0.693;
house_z = 0;

batt_x = 0.305;
batt_y = 0.005;
batt_z = 0;

ant_x = 0.59;
ant_y = 2.579;
ant_z = 0;

drive_x = 0.61;
drive_y = 0.005;
drive_z = 0;

light_x = 0.63;
light_y = 1.84;
light_z = 0;

comp_x = 0.915;
comp_y = 0.005;
comp_z = 0;

%% Center of mass in x,y,z 

% x-coordinate center of mass
CM_x = ((solar1_x * solar1_m)+(solar2_x * solar2_m)+(solar3_x * solar3_m)+(solar4_x * solar4_m)+(house_x*house_m)+(batt_x*batt_m)+(ant_x*ant_m)+(drive_x*drive_m)+(light_x*light_m)+(comp_x*comp_m))/M;

% y-coordinate center of mass
CM_y = ((solar1_y * solar1_m)+(solar2_y * solar2_m)+(solar3_y * solar3_m)+(solar4_y * solar4_m)+(house_y*house_m)+(batt_y*batt_m)+(ant_y*ant_m)+(drive_y*drive_m)+(light_y*light_m)+(comp_y*comp_m))/M;

% z-coordinate center of mass
CM_z = ((solar1_z * solar1_m)+(solar2_z * solar2_m)+(solar3_z * solar3_m)+(solar4_z * solar4_m)+(house_z*house_m)+(batt_z*batt_m)+(ant_z*ant_m)+(drive_z*drive_m)+(light_z*light_m)+(comp_z*comp_m))/M;


