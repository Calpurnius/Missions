_houses = [1000,1000] nearObjects ["house", 1000000];
_zeroes = ["dvere","dvere1l","dvere1r","dvere2l","dvere2r","dvere_spodni_r","dvere_spodni_l","dvere_vrchni","vrata1","vrata2","vratal1","vratar1","vratal2","vratar2","vratal3","vratar3"];
_ones = ["door","door_1_1","door_1_2","door_2_1","door_2_2","dvere1","dvere2","dvere3","dvere4","dvere5","dvere6","dvere7","dvere8","dvere9","dvere10","dvere11","dvere12","dvere13","dvere14","doorl","doorr","door_01","door01_a","door_02","door02_a","door_03","door_04","door_05","door_06","door_1a","door_1","door_2"];
_twos = ["door_1_rot","door_3_rot","door_2_rot","door_4_rot","door_5_rot","door_6_rot","door_7_rot"];
{
 _y = _x;
 {_y animate [format ["%1", _x], 0]} foreach _zeroes;
 {_y animate [format ["%1", _x], 1]} foreach _ones;
 {_y animate [format ["%1", _x], 1]} foreach _twos;
 sleep 0.0001;
} foreach _houses