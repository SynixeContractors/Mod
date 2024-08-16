class CfgGesturesMale {
    skeletonName = "OFP2_ManSkeleton";
    class Default {};
    class States {
        class GestureNo;
        class GVAR(base): Default {
            canReload = 0;
            disableWeapons = 1;
            disableWeaponsLong = 1;
            enableOptics = 0;
            headBobMode = 2;
            headBobStrength = 0;
            interpolationRestart = 2;
            leftHandIKBeg = 1;
            leftHandIKCurve[] = {0,1,0.02,1,0.02469,0,0.95,0,0.98766,1,1,1};
            leftHandIKEnd = 1;
            looped = 0;
            mask = "handsWeapon";
            rightHandIKBeg = 1;
            rightHandIKCurve[] = {1};
            rightHandIKEnd = 1;
            speed = 0.3751;
            weaponIK = 1;
        };

        class GVAR(map_start): GVAR(base) {
            file = QPATHTOF(anims\map_start.rtm);
            leftHandIKCurve[] = {0,1,0.02,1,0.02469,0};
            rightHandIKCurve[] = {0,0,0.02,0,0.02469,0,0.63,0,0.72766,1,1,1};
            speed = -2;
        };
        class GVAR(map_loop): GVAR(base) {
            file = QPATHTOF(anims\map_loop.rtm);
            looped = 1;
            leftHandIKCurve[] = {0};
            speed = -10;
        };
        class GVAR(map_end): GVAR(base) {
            file = QPATHTOF(anims\map_end.rtm);
            leftHandIKCurve[] = {0,0,0.02,0,0.02469,0,0.93,0,0.97766,1,1,1};
            rightHandIKCurve[] = {1};
            speed = -1;
        };
        class GVAR(compass_start): GVAR(base) {
            file = QPATHTOF(anims\compass_start.rtm);
            speed = 0.45;
            leftHandIKCurve[] = {0,1,0.02,1,0.02469,0};
            soundEdge[] = {0.01};
            soundEnabled = 1;
            soundOverride = "lift_rifle";
        };
        class GVAR(compass_loop): GVAR(base) {
            file = QPATHTOF(anims\compass_loop.rtm);
            speed = -1e+012;
            looped = 1;
            leftHandIKCurve[] = {0};
        };
        class GVAR(compass_end): GVAR(base) {
            file = QPATHTOF(anims\compass_end.rtm);
            leftHandIKCurve[] = {0,0,0.02,0,0.02469,0,0.93,0,0.97766,1,1,1};
            speed = 0.7;
            soundOverride = "low_rifle";
        };
        class GVAR(watch): GVAR(base) {
            file = QPATHTOF(anims\watch.rtm);
            speed = -1e+012;
            interpolationSpeed = 2.5;
            looped = 1;
            leftHandIKCurve[] = {0};
        };

        class GVAR(base_tsp): GestureNo {
            mask = "leftArm";
            speed = 1;
            interpolationSpeed = 2;
            leftHandIKCurve[] = {0,1,0.1,0,0.9,0,1,1};
            rightHandIKCurve[] = {1};
            disableWeapons = 0;
        };
        class GVAR(clacker): GVAR(base_tsp) {
            file = QPATHTOF(anims\clacker.rtm);
            speed = 2;
            leftHandIKCurve[] = {0};
        };
        class GVAR(nvg_up): GVAR(base_tsp) {
            file = QPATHTOF(anims\nightvision_up.rtm);
        };
        class GVAR(nvg_down): GVAR(base_tsp) {
            file = QPATHTOF(anims\nightvision_down.rtm);
        };
    };

    class BlendAnims {
        rightArmHead[] = {
            "head",1,"neck1",1,"neck",1,
            "RightShoulder", 1, "RightArm", 1, "RightArmRoll", 1, "RightForeArm", 1, "RightForeArmRoll", 1, "RightHand", 1, 
            "RightHandThumb1", 1, "RightHandThumb2", 1, "RightHandThumb3", 1,
            "RightHandIndex1", 1, "RightHandIndex2", 1, "RightHandIndex3", 1, 
            "RightHandMiddle1", 1, "RightHandMiddle2", 1, "RightHandMiddle3", 1, 
            "RightHandRing", 1, "RightHandRing1", 1, "RightHandRing2", 1, "RightHandRing3", 1, 
            "RightHandPinky1", 1, "RightHandPinky2", 1, "RightHandPinky3", 1
        };
        rightArm[] = {
            "RightShoulder", 1, "RightArm", 1, "RightArmRoll", 1, "RightForeArm", 1, "RightForeArmRoll", 1, "RightHand", 1, 
            "RightHandThumb1", 1, "RightHandThumb2", 1, "RightHandThumb3", 1,
            "RightHandIndex1", 1, "RightHandIndex2", 1, "RightHandIndex3", 1, 
            "RightHandMiddle1", 1, "RightHandMiddle2", 1, "RightHandMiddle3", 1, 
            "RightHandRing", 1, "RightHandRing1", 1, "RightHandRing2", 1, "RightHandRing3", 1, 
            "RightHandPinky1", 1, "RightHandPinky2", 1, "RightHandPinky3", 1
        };
        leftArm[] = {
            "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1, 
            "LeftHandThumb1", 1, "LeftHandThumb2", 1, "LeftHandThumb3", 1,
            "LeftHandIndex1", 1, "LeftHandIndex2", 1, "LeftHandIndex3", 1, 
            "LeftHandMiddle1", 1, "LeftHandMiddle2", 1, "LeftHandMiddle3", 1, 
            "LeftHandRing", 1, "LeftHandRing1", 1, "LeftHandRing2", 1, "LeftHandRing3", 1, 
            "LeftHandPinky1", 1, "LeftHandPinky2", 1, "LeftHandPinky3", 1
        };
        leftArmSpine[] = {
            "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1, 
            "LeftHandThumb1", 1, "LeftHandThumb2", 1, "LeftHandThumb3", 1,
            "LeftHandIndex1", 1, "LeftHandIndex2", 1, "LeftHandIndex3", 1, 
            "LeftHandMiddle1", 1, "LeftHandMiddle2", 1, "LeftHandMiddle3", 1, 
            "LeftHandRing", 1, "LeftHandRing1", 1, "LeftHandRing2", 1, "LeftHandRing3", 1, 
            "LeftHandPinky1", 1, "LeftHandPinky2", 1, "LeftHandPinky3", 1,
            "neck", 1, "neck1", 1, "head", 1, "Spine", 1, "Spine1", 1, "Spine2", 1, "Spine3", 1, "pelvis", "MaskStart"
        };
        bothArms[] = {
            "RightShoulder", 1, "RightArm", 1, "RightArmRoll", 1, "RightForeArm", 1, "RightForeArmRoll", 1, "RightHand", 1, 
            "RightHandThumb1", 1, "RightHandThumb2", 1, "RightHandThumb3", 1,
            "RightHandIndex1", 1, "RightHandIndex2", 1, "RightHandIndex3", 1, 
            "RightHandMiddle1", 1, "RightHandMiddle2", 1, "RightHandMiddle3", 1, 
            "RightHandRing", 1, "RightHandRing1", 1, "RightHandRing2", 1, "RightHandRing3", 1, 
            "RightHandPinky1", 1, "RightHandPinky2", 1, "RightHandPinky3", 1,
            "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1, 
            "LeftHandThumb1", 1, "LeftHandThumb2", 1, "LeftHandThumb3", 1,
            "LeftHandIndex1", 1, "LeftHandIndex2", 1, "LeftHandIndex3", 1, 
            "LeftHandMiddle1", 1, "LeftHandMiddle2", 1, "LeftHandMiddle3", 1, 
            "LeftHandRing", 1, "LeftHandRing1", 1, "LeftHandRing2", 1, "LeftHandRing3", 1, 
            "LeftHandPinky1", 1, "LeftHandPinky2", 1, "LeftHandPinky3", 1
        };
        readyPistol[] = {
            "RightShoulder", 1, "RightArm", 1, "RightArmRoll", 1, "RightForeArm", 1, "RightForeArmRoll", 1, "RightHand", 1, 
            "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1, 
            "LeftHandThumb1", 1, "LeftHandThumb2", 1, "LeftHandThumb3", 1,
            "LeftHandIndex1", 1, "LeftHandIndex2", 1, "LeftHandIndex3", 1, 
            "LeftHandMiddle1", 1, "LeftHandMiddle2", 1, "LeftHandMiddle3", 1, 
            "LeftHandRing", 1, "LeftHandRing1", 1, "LeftHandRing2", 1, "LeftHandRing3", 1, 
            "LeftHandPinky1", 1, "LeftHandPinky2", 1, "LeftHandPinky3", 1
        };
        readyPistolSpine[] = {
            "RightShoulder", 1, "RightArm", 1, "RightArmRoll", 1, "RightForeArm", 1, "RightForeArmRoll", 1, "RightHand", 1, 
            "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1, 
            "LeftHandThumb1", 1, "LeftHandThumb2", 1, "LeftHandThumb3", 1,
            "LeftHandIndex1", 1, "LeftHandIndex2", 1, "LeftHandIndex3", 1, 
            "LeftHandMiddle1", 1, "LeftHandMiddle2", 1, "LeftHandMiddle3", 1, 
            "LeftHandRing", 1, "LeftHandRing1", 1, "LeftHandRing2", 1, "LeftHandRing3", 1, 
            "LeftHandPinky1", 1, "LeftHandPinky2", 1, "LeftHandPinky3", 1,
            "neck", 1, "neck1", 1, "head", 1, "Spine", 1, "Spine1", 1, "Spine2", 1, "Spine3", 1, "pelvis", "MaskStart"
        };
        weapon[] = {"weapon", 1};
        weaponSpine[] = {"weapon", 1, "neck", 1, "neck1", 1, "Spine", 1, "Spine1", 0.1};	
        weaponLeftArm[] = {
            "weapon", 1,
            "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1, 
            "LeftHandThumb1", 1, "LeftHandThumb2", 1, "LeftHandThumb3", 1,
            "LeftHandIndex1", 1, "LeftHandIndex2", 1, "LeftHandIndex3", 1, 
            "LeftHandMiddle1", 1, "LeftHandMiddle2", 1, "LeftHandMiddle3", 1, 
            "LeftHandRing", 1, "LeftHandRing1", 1, "LeftHandRing2", 1, "LeftHandRing3", 1, 
            "LeftHandPinky1", 1, "LeftHandPinky2", 1, "LeftHandPinky3", 1
        };
        upperTorsoWeak[] =  {
            "neck", 1, "neck1", 1, "Spine", 1, "Spine1", 0.1,
            "RightShoulder", 1, "RightArm", 1, "RightArmRoll", 1, "RightForeArm", 1, "RightForeArmRoll", 1, "RightHand", 1, 
            "LeftShoulder", 1, "LeftArm", 1, "LeftArmRoll", 1, "LeftForeArm", 1, "LeftForeArmRoll", 1, "LeftHand", 1
        };
    };
};
