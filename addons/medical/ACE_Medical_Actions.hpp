class ace_medical_treatment_actions {
    class Morphine;
    class ITEM(painkillers): Morphine {
        displayName = CSTRING(Painkillers_Name);
        displayNameProgress = CSTRING(PainkillerProgress);
        allowedSelections[] = {"head"};
        items[] = {QITEM(painkillers)};
        icon = QPATHTOF(ui\painkillers_icon_ca.paa);
        treatmentTime = 2.25;
        litter[] = {{"Land_PainKillers_F"}};
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
    };
};
