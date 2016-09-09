if (isServer) 
then{
	{
		private _arr = _x;
		private _zone = _arr select 0;
		private _locAll = _arr select 1;
		private _closeDoors = _arr select 2;
		
		private _center = getMarkerPos _zone;	//get center of the marker on the mission file, for the _buildingsArr variable
												//in order to locate where to start adding buildings
		private _size = markerSize _zone; //get the diameter of the marker
		private _rX = _size select 0; //get the X-radius value
		private _rY = _size select 1; //get the Y-radius value
		private _r = ((_rX + _rY) /2); 	//get the average radius of the marker, may close doors outside the radius if the
										//marker isn't a perfect circle.  Will also leave some doors open inside the marker
										//if the marker is a square
		
		private _buildingsArr = nearestObjects [_center,["house","Cargo_Patrol_base_F","Cargo_Tower_base_F","Cargo_HQ_base_F"],_r];
		if (count _buildingsArr > 0) then {
			{

				private _zeroes = ["dvere","dvere1l","dvere1r","dvere2l","dvere2r","dvere_spodni_r","dvere_spodni_l","dvere_vrchni","vrata1","vrata2","vratal1","vratar1","vratal2","vratar2","vratal3","vratar3"];
				private _ones = ["door","door_1_1","door_1_2","door_2_1","door_2_2","dvere1","dvere2","dvere3","dvere4","dvere5","dvere6","dvere7","dvere8","dvere9","dvere10","dvere11","dvere12","dvere13","dvere14","doorl","doorr","door_01","door01_a","door_02","door02_a","door_03","door_04","door_05","door_06","door_1a","door_1","door_2"];
				private _twos = ["door_1_rot","door_3_rot","door_2_rot","door_4_rot","door_5_rot","door_6_rot","door_7_rot"];
					_y = _x;
							{_y animate [format ["%1", _x], 1]} foreach _zeroes;
							{_y animate [format ["%1", _x], 1]} foreach _ones;
							{_y animate [format ["%1", _x], 1]} foreach _twos;
					};
					sleep 0.0001;
		} foreach _buildingsArr;
	}; 
};