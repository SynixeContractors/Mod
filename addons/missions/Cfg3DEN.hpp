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
    class Group {
        class AttributeCategories {
            class GVAR(Surrender) {
                displayName = "Synixe - Dynamic Surrender";
                class Attributes {
                    class Disabled {
                        displayName = "Disabled";
                        tooltip = "Disable the dynamic surrender system for this group";
                        property = QGVAR(attribute_surrenderDisabled);
                        control = "Checkbox";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(surrenderDisabled),_value)];);
                        defaultValue = "false";
                    };
                    class OnHitMultiplier {
                        displayName = "On Hit Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when hit";
                        property = QGVAR(attribute_surrenderOnHitMultiplier);
                        control = "Slider";
                        defaultValue = "0.5";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(surrenderOnHitMultiplier),_value)];);
                    };
                    class OnStunMultiplier {
                        displayName = "On Stun Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when stunned";
                        property = QGVAR(attribute_surrenderOnStunMultiplier);
                        control = "Slider";
                        defaultValue = "0.5";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(surrenderOnStunMultiplier),_value)];);
                    };
                    class OnSuppressMultiplier {
                        displayName = "On Suppress Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when suppressed";
                        property = QGVAR(attribute_surrenderOnSuppressMultiplier);
                        control = "Slider";
                        defaultValue = "0.5";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(surrenderOnSuppressMultiplier),_value)];);
                    };
                    class OnAimMultiplier {
                        displayName = "On Aim Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when aimed at";
                        property = QGVAR(attribute_surrenderOnAimMultiplier);
                        control = "Slider";
                        defaultValue = "0";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(surrenderOnAimMultiplier),_value)];);
                    };
                    class OnSpeakMultiplier {
                        displayName = "On Speak Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when they hear enemy voices nearby";
                        property = QGVAR(attribute_surrenderOnSpeakMultiplier);
                        control = "Slider";
                        defaultValue = "0";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(surrenderOnSpeakMultiplier),_value)];);
                    };
                    class CanRallyMultiplier {
                        displayName = "Can Rally Multiplier";
                        tooltip = "The Multiplier for the unit to rally instead of surrendering";
                        property = QGVAR(attribute_surrenderCanRallyMultiplier);
                        control = "Slider";
                        defaultValue = "0.5";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(surrenderCanRallyMultiplier),_value)];);
                    };
                };
            };
        };
    };
};
