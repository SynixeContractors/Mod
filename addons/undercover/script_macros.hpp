
#define UNDERCOVER(GRANDPARENT,PARENT,DISPLAY) \
    class PARENT: GRANDPARENT { \
        class ItemInfo: VestItem {}; \
    }; \
    class CLASS(PARENT##_Heavy): PARENT { \
        scope = 2; \
        displayName = QUOTE(DISPLAY [Level 3]); \
        class ItemInfo: ItemInfo { \
            mass = 40 + 75; \
            class HitpointsProtectionInfo { \
                class Chest { \
                    hitpointName = "HitChest"; \
                    armor = 15; \
                    passThrough = 0.2; \
                }; \
                class Diaphragm { \
                    hitpointName = "HitDiaphragm"; \
                    armor = 15; \
                    passThrough = 0.2; \
                }; \
                class Abdomen { \
                    hitpointName = "HitAbdomen"; \
                    armor = 15; \
                    passThrough = 0.2; \
                }; \
                class Body { \
                    hitpointName = "HitBody"; \
                    passThrough = 0.2; \
                }; \
            }; \
        }; \
    }; \
    class CLASS(PARENT##_Medium): PARENT { \
        scope = 2; \
        displayName = QUOTE(DISPLAY [Level 2]); \
        class ItemInfo: ItemInfo { \
            mass = 40 + 50; \
            class HitpointsProtectionInfo { \
                class Chest { \
                    hitpointName = "HitChest"; \
                    armor = 10; \
                    passThrough = 0.2; \
                }; \
                class Diaphragm { \
                    hitpointName = "HitDiaphragm"; \
                    armor = 10; \
                    passThrough = 0.2; \
                }; \
                class Abdomen { \
                    hitpointName = "HitAbdomen"; \
                    armor = 10; \
                    passThrough = 0.2; \
                }; \
                class Body { \
                    hitpointName = "HitBody"; \
                    passThrough = 0.2; \
                }; \
            }; \
        }; \
    }; \
    class CLASS(PARENT##_Light): PARENT { \
        scope = 2; \
        displayName = QUOTE(DISPLAY [Level 1]); \
        class ItemInfo: ItemInfo { \
            mass = 40 + 25; \
            class HitpointsProtectionInfo { \
                class Chest { \
                    hitpointName = "HitChest"; \
                    armor = 5; \
                    passThrough = 0.2; \
                }; \
                class Diaphragm { \
                    hitpointName = "HitDiaphragm"; \
                    armor = 5; \
                    passThrough = 0.2; \
                }; \
                class Abdomen { \
                    hitpointName = "HitAbdomen"; \
                    armor = 5; \
                    passThrough = 0.2; \
                }; \
                class Body { \
                    hitpointName = "HitBody"; \
                    passThrough = 0.2; \
                }; \
            }; \
        }; \
    }
