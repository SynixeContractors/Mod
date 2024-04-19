class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class ADDON {
                displayName = "Synixe Missions";
                class Attributes {
                    class CarAlarm {
                        displayName = "Disable Car Alarm";
                        tooltip = "Disable the car alarm on this vehicle";
                        property = QGVAR(attribute_carAlarm);
                        control = "Checkbox";
                        condition = "objectVehicle";
                        expression = QUOTE(_this setVariable [ARR_2(QQUOTE(alarmEHRemoved),_value)];);
                        defaultValue = "false";
                    };
                };
            };
        };
    };
};
