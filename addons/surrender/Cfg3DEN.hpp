class Cfg3DEN {
    class Group {
        class AttributeCategories {
            class GVAR(Surrender) {
                displayName = "Synixe - Dynamic Surrender";
                class Attributes {
                    class Disabled {
                        displayName = "Disabled";
                        tooltip = "Disable the dynamic surrender system for this group";
                        property = QGVAR(attribute_disabled);
                        control = "Checkbox";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(disabled),_value)];);
                        defaultValue = "false";
                    };
                    class OnHitMultiplier {
                        displayName = "On Hit Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when hit";
                        property = QGVAR(attribute_onHitMultiplier);
                        control = "Slider";
                        defaultValue = "0.5";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(onHitMultiplier),_value)];);
                    };
                    class OnStunMultiplier {
                        displayName = "On Stun Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when stunned";
                        property = QGVAR(attribute_onStunMultiplier);
                        control = "Slider";
                        defaultValue = "0.5";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(onStunMultiplier),_value)];);
                    };
                    class OnSuppressMultiplier {
                        displayName = "On Suppress Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when suppressed";
                        property = QGVAR(attribute_onSuppressMultiplier);
                        control = "Slider";
                        defaultValue = "0.5";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(onSuppressMultiplier),_value)];);
                    };
                    class OnAimMultiplier {
                        displayName = "On Aim Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when aimed at";
                        property = QGVAR(attribute_onAimMultiplier);
                        control = "Slider";
                        defaultValue = "0";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(onAimMultiplier),_value)];);
                    };
                    class OnSpeakMultiplier {
                        displayName = "On Speak Multiplier";
                        tooltip = "The Multiplier for the unit to surrender when they hear enemy voices nearby";
                        property = QGVAR(attribute_onSpeakMultiplier);
                        control = "Slider";
                        defaultValue = "0";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(onSpeakMultiplier),_value)];);
                    };
                    class CanRallyMultiplier {
                        displayName = "Can Rally Multiplier";
                        tooltip = "The Multiplier for the unit to rally instead of surrendering";
                        property = QGVAR(attribute_canRallyMultiplier);
                        control = "Slider";
                        defaultValue = "0.5";
                        expression = QUOTE(_this setVariable [ARR_2(QQGVAR(canRallyMultiplier),_value)];);
                    };
                };
            };
        };
    };
};
