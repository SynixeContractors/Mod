class ace_medical_treatment_actions {
    class Morphine;
    class ITEM(painkillers): Morphine {
        displayName = CSTRING(Painkillers_Name);
        displayNameProgress = CSTRING(PainkillerProgress);
        allowedSelections[] = {"head"};
        items[] = {QITEM(painkillers)};
        icon = QPATHTOF(ui\painkillers_icon_ca.paa);
        condition = "";
        callbackSuccess = QUOTE(call ACEFUNC(medical_treatment,medication));
    };
    class ITEM(txa): Morphine {
        displayName = CSTRING(TXAAction);
        displayNameProgress = CSTRING(TXAProgress);
        items[] = {QITEM(txa)};
        icon = "z\ace\addons\medical_gui\ui\auto_injector.paa";
        condition = "";
        callbackSuccess = QUOTE(call ACEFUNC(medical_treatment,medication));
        litter[] = {{QITEM(txa_litter)}};
    };
};

class ace_medical_treatment {
    class Medication {
        class ITEM(painkillers) {
            painReduce = 0.35;
            hrIncreaseLow[] = {-5, -10}; // Painkillers are a weaker opoid than Morphine, they also have an adverse effect on heart rate in larger doses.
            hrIncreaseNormal[] = {-5, -15};
            hrIncreaseHigh[] = {-5, -17};
            timeInSystem = 420; // 7 Minutes
            maxDose = 6;
            inCompatableMedication[] = {};
            viscosityChange = 5;
        };
        class ITEM(txa) {
            painReduce = 0;
            timeInSystem = 420; // 7 Minutes
            maxDose = 4;
            viscosityChange = 15;
        };
    };
};
