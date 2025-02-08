#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_main",
            "archipelago"
        };
        skipWhenMissingDependencies = 1;
        author = "Brett";
        VERSION_CONFIG;
    };
};

class CfgWorlds {
    class Altis;
    class archipelago: Altis {
        description = "L’Archipel d’Émeraude";
        class Names {
            class Asrel_Bay {
                name = "Baie des Naufragés";
            };
            class Axhull {
                name = "Saint-Pierre-sur-Mer";
            };
            class Azla {
                name = "Notre-Dame-des-Lys";
            };
            class Baker {
                name = "Brigade Saint-Armand";
            };
            class Barracks {
                name = "Brigade Île-Sainte-Marguerite";
            };
            class Bastion {
                name = "Brigade Teva Roche";
            };
            class Nantoon {
                name = "Mine de Fer-Vert";
            };
            class Bellcoe {
                name = "Port de Fer-Vert";
            };
            class Bellcoe_Bay {
                name = "Baie de Fer-Vert";
            };
            class Biha {
                name = "Île Tane";
            };
            class Brookthunna {
                name = "Ville de Saint-Denis";
            };
            class Buchan {
                name = "Brigade de Saint-Éloi";
            };
            class Comms_Juliet {
                name = "Poste César";
            };
            class Comms_Lima {
                name = "Poste Jules";
            };
            class Doraz_Jetty {
                name = "Quai";
            };
            class Dubuma {
                name = "Baie de Dibuma";
            };
            class Equirock {
                name = "Idylle";
            };
            class For_Ner {
                name = "Fort de l'Île Perdue";
            };
            class Fort_Luitbi {
                name = "Fort Saint-Clair";
            };
            class Foyprince_Bay {
                name = "Anse de l'Enclume";
            };
            class FSB_Rnari {
                name = "Brigade de la Colline Taneau";
            };
            class Glaceston_Bay {
                name = "Baie de Hina";
            };
            class Grand_Del {
                name = "Vahera";
            };
            class Grand_Mial {
                name = "Tahurue";
            };
            class Haverfoy_Bay {
                name = "Baie de la Lune";
            };
            class Imaska {
                name = "Station Radar";
            };
            class Jetty {
                name = "Quai";
            };
            class La_Char_Mine {
                name = "Mine de la Char";
            };
            class La_Mera_Ind {
                name = "Usine";
            };
            class GM_Factory {
                name = "Usine";
            };
            class GM_Sawmill {
                name = "Scierie";
            };
            class GM_Turbines {
                name = "Ferme Éolienne";
            };
            class Bird_Head_Farm {
                name = "Ferme";
            };
            class Bird_Head_Orchard {
                name = "Verger";
            };
            class Bird_Head_Temple {
                name = "Ruines du Temple";
            };
            class Bird_Head_Workshop {
                name = "Atelier";
            };
            class Lequi_Ind {
                name = "Usine";
            };
            class Lequi_Jetty {
                name = "Quai";
            };
            class LZ_Redeye {
                name = "Zone Hélico de Atohuna";
            };
            class LZ_Victor {
                name = "Zone Hélico de Paumeau";
                position[] = { 4677.44, 2309.91 };
                angle = 0;
                radiusA = 36.53;
                radiusB = 23.51;
            };
            class Old_Pit {
                name = "Ancienne Fosse";
            };
            class Old_Temple {
                name = "Les Ruines du Marae Oublié";
            };
            class OP_Tango {
                name = "Poste Théodore";
            };
            class OP_Thunder {
                name = "Poste Émile";
            };
            class Port_Bourclear {
                name = "Port de Bourclear";
            };
            class Port_Orines {
                name = "Port d'Orines";
            };
            class Port_Stosran {
                name = "Port de Hitiaro";
            };
            class Port_Tyva {
                name = "Port de Tyva";
            };
            class Pyhope {
                name = "Mo'orea";
            };
            class Relay_Station {
                name = "Zone Hélico de Tufani";
                position[] = { 4174.94, 2496.68 };
                type = "StrongpointArea";
            };
            class Right_Right_Depot {
                name = "Dépôt";
            };
            class Right_Right_Farm1 {
                name = "Ferme";
            };
            class Right_Right_Farm2 {
                name = "Ferme";
            };
            class Right_Right_Jetty {
                name = "Quai";
            };
            class Right_right_Temple {
                name = "Ruines du Temple";
            };
            class Rison {
                name = "Resort Moana Rêve";
            };
            class Ruswan {
                name = "Pahero";
            };
            class Saint_Annewhite {
                name = "Sainte-Anne";
            };
            class Saint_Bernorth {
                name = "Saint-Bernard";
            };
            class Saint_Runornia {
                name = "Sainte-Rose";
            };
            class Satho_Lake {
                name = "Lac de Tivere";
            };
            class Sonnai {
                name = "Aéroport de l'Émeraude";
            };
            class Sonnai_Depot {
                name = "Dépôt";
            };
            class Sorines_Bay {
                name = "Baie de Sorinua";
            };
            class Terktuk {
                name = "Fenuaïta";
            };
            class Termeaule_Bay {
                name = "Baie de Termeaule";
            };
            class Top_Left_Farm {
                name = "Ferme";
            };
            class Top_Ruins {
                name = "Ruines du Fort";
            };
            class Tsontoche {
                name = "Tsoné";
            };
            class Tymur {
                name = "Tymara";
            };
            class Viskam {
                name = "Viskamo";
            };
            class West_Bornebou {
                name = "Bornebou Ouest";
            };
            class Westcap {
                name = "Fort de l'Île Perdue";
            };
            class Wharf {
                name = "Quai";
            };
            class Winbra {
                name = "Winaru";
            };
            class Winbra_Jetty {
                name = "Quai";
            };
            class Wnaskas {
                name = "Wanaka";
            };

            class LZ_Saint_Armand {
                name = "Zone Hélico";
                position[] = { 3366.09, 4070.52 };
                angle = 0;
                radiusA = 36.53;
                radiusB = 23.51;
                type = "StrongpointArea";
            };
            class LZ_Port_Hitiaro {
                name = "Zone Hélico";
                position[] = { 7550.39, 1712.2 };
                angle = 0;
                radiusA = 36.53;
                radiusB = 23.51;
                type = "StrongpointArea";
            };
            class LZ_Saint_Rose {
                name = "Zone Hélico";
                position[] = { 7422.07, 2940.71 };
                angle = 0;
                radiusA = 36.53;
                radiusB = 23.51;
                type = "StrongpointArea";
            };
            class LZ_Colline_Taneau {
                name = "Zone Hélico";
                position[] = { 6472.96, 3318.93 };
                angle = 0;
                radiusA = 36.53;
                radiusB = 23.51;
                type = "StrongpointArea";
            };
        };
    };
};
