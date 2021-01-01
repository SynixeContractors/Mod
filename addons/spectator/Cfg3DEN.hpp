class Cfg3DEN {
	class Object {
		class AttributeCategories {
			class DynuloPMC {
				displayName = "Synixe Contractors";
				class Attributes {
					class Spectator {
						//--- Mandatory properties
						displayName = "Spectator Screen";
						tooltip = "Players use this object to enter spectator";
						property = QGVAR(attribute_spectator);
						control = "Checkbox";

						//--- Optional
						expression = QUOTE(if(_value)then{GVAR(screens) pushBack _this});
						defaultValue = false;
					};
				};
			};
		};
	};
};
