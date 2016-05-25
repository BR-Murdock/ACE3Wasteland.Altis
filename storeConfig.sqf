// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: storeConfig.sqf
# @@Author: His_Shadow, AgentRev
# @@Editor: BR-Murdock
# @@Create Date: 2013-09-16 20:40:58
#*********************************************************/

// This tracks which store owner the client is interacting with
currentOwnerName = "";

// Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost

// empty name = name is extracted from class config

pistolArray = compileFinal str
[
	// Handguns
	["", "hgun_P07_F", 50],
	["", "hgun_Rook40_F", 50],
	["", "hgun_ACPC2_F", 75],
	["", "hgun_Pistol_heavy_02_F", 75],
	["", "hgun_Pistol_heavy_01_F", 100]
];

smgArray = compileFinal str
[
	["", "hgun_PDW2000_F", 100],
	["", "SMG_02_F", 125],
	["", "SMG_01_F", 125]
];

rifleArray = compileFinal str
[
	// Underwater Gun
	["", "arifle_SDAR_F", 100],

	// Assault Rifles
	["", "arifle_Mk20C_plain_F", 150],
	["", "arifle_Mk20C_F", 150],
	["", "arifle_Mk20_plain_F", 200],
	["", "arifle_Mk20_F", 200],
	["", "arifle_Mk20_GL_plain_F", 250],
	["", "arifle_Mk20_GL_F", 250],

	["", "arifle_TRG20_F", 150],
	["", "arifle_TRG21_F", 200],
	["", "arifle_TRG21_GL_F", 250],

	["", "arifle_Katiba_C_F", 150],
	["", "arifle_Katiba_F", 200],
	["", "arifle_Katiba_GL_F", 250],

	["", "arifle_MXC_F", 150],
	["", "arifle_MXC_Black_F", 175],
	["", "arifle_MX_F", 200],
	["", "arifle_MX_Black_F", 225],
	["", "arifle_MX_GL_F", 250],
	["", "arifle_MX_GL_Black_F", 275],

	// Markman Rifles
	["", "arifle_MXM_F", 300],
	["", "arifle_MXM_Black_F", 325],
	["", "srifle_DMR_01_F", 375],
	["", "srifle_EBR_F", 450],

	// DLC
	["", "srifle_DMR_06_camo_F", 450],
	["", "srifle_DMR_06_olive_F", 450],
	["", "srifle_DMR_03_F", 500],
	["", "srifle_DMR_03_multicam_F", 550],
	["", "srifle_DMR_03_khaki_F", 550],
	["", "srifle_DMR_03_tan_F", 550],
	["", "srifle_DMR_03_woodland_F", 550],
	["", "srifle_DMR_02_F", 750],
	["", "srifle_DMR_02_camo_F", 800],
	["", "srifle_DMR_02_sniper_F", 800],
	["", "srifle_DMR_05_blk_F", 750],
	["", "srifle_DMR_05_hex_F", 800],
	["", "srifle_DMR_05_tan_f", 800],

	// Sniper Rifles
	["", "srifle_LRR_LRPS_F", 1000],
	["", "srifle_LRR_camo_LRPS_F", 1200],
	["", "srifle_GM6_LRPS_F", 1250],
	["", "srifle_GM6_camo_LRPS_F", 1500],

	["", "srifle_DMR_04_F", 2000],
	["", "srifle_DMR_04_tan_F", 2250]
];

lmgArray = compileFinal str
[
	["", "arifle_MX_SW_F", 300],
	["", "arifle_MX_SW_Black_F", 325],
	["", "LMG_Mk200_F", 400],
	["", "LMG_Zafir_F", 500],
	["", "MMG_01_tan_F", 750],
	["", "MMG_01_hex_F", 750],
	["", "MMG_02_sand_F", 750],
	["", "MMG_02_camo_F", 750],
	["", "MMG_02_black_F", 800]
];

launcherArray = compileFinal str
[
	["", "launch_RPG32_F", 400],
	["", "launch_NLAW_F", 1000], // Ammo included, one-time use
//	["Titan MPRL Compact (Tan)", "launch_Titan_short_F", 500],		//Deactivating High-Tech Anti Tank Weapons
//	["Titan MPRL Compact (Brown)", "launch_O_Titan_short_F", 500],
//	["Titan MPRL Compact (Olive)", "launch_I_Titan_short_F", 500],
	["Titan MPRL AA (Desert)", "launch_Titan_F", 600],
	["Titan MPRL AA (Hex)", "launch_O_Titan_F", 600],
	["Titan MPRL AA (Digi)", "launch_I_Titan_F", 600]
];

allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call launcherArray);

staticGunsArray = compileFinal str
[
	// ["Vehicle Ammo Crate", "Box_NATO_AmmoVeh_F", 2500],
	["Static Titan AT 4Rnd (NATO)", "B_static_AT_F", 2500], // Static launchers only have 4 ammo, hence the low price
	["Static Titan AT 4Rnd (CSAT)", "O_static_AT_F", 2500],
	["Static Titan AT 4Rnd (AAF)", "I_static_AT_F", 2500],
	["Static Titan AA 4Rnd (NATO)", "B_static_AA_F", 3000],
	["Static Titan AA 4Rnd (CSAT)", "O_static_AA_F", 3000],
	["Static Titan AA 4Rnd (AAF)", "I_static_AA_F", 3000],
	["XM307 HMG .50 Low tripod (NATO)", "B_HMG_01_F", 2000],
	["XM307 HMG .50 Low tripod (CSAT)", "O_HMG_01_F", 2000],
	["XM307 HMG .50 Low tripod (AAF)", "I_HMG_01_F", 2000],
	// ["XM307A HMG .50 Sentry (NATO)", "B_HMG_01_A_F", 5000], // "A" = Autonomous = Overpowered
	// ["XM307A HMG .50 Sentry (CSAT)", "O_HMG_01_A_F", 5000],
	// ["XM307A HMG .50 Sentry (AAF)", "I_HMG_01_A_F", 5000],
	["XM307 HMG .50 High tripod (NATO)", "B_HMG_01_high_F", 3000],
	["XM307 HMG .50 High tripod (CSAT)", "O_HMG_01_high_F", 3000],
	["XM307 HMG .50 High tripod (AAF)", "I_HMG_01_high_F", 3000],
	["XM312 GMG 20mm Low tripod (NATO)", "B_GMG_01_F", 5000],
	["XM312 GMG 20mm Low tripod (CSAT)", "O_GMG_01_F", 5000],
	["XM312 GMG 20mm Low tripod (AAF)", "I_GMG_01_F", 5000],
	// ["XM312A GMG 20mm Sentry (NATO)", "B_GMG_01_A_F", 10000],
	// ["XM312A GMG 20mm Sentry (CSAT)", "O_GMG_01_A_F", 10000],
	// ["XM312A GMG 20mm Sentry (AAF)", "I_GMG_01_A_F", 10000],
	["XM312 GMG 20mm High tripod (NATO)", "B_GMG_01_high_F", 6000],
	["XM312 GMG 20mm High tripod (CSAT)", "O_GMG_01_high_F", 6000],
	["XM312 GMG 20mm High tripod (AAF)", "I_GMG_01_high_F", 6000],
	["Mk6 Mortar (NATO)", "B_Mortar_01_F", 12500],
	["Mk6 Mortar (CSAT)", "O_Mortar_01_F", 12500],
	["Mk6 Mortar (AAF)", "I_Mortar_01_F", 12500]
];

throwputArray = compileFinal str
[
	["Mini Grenade", "MiniGrenade", 50],
	["", "HandGrenade", 100],
	["", "APERSTripMine_Wire_Mag", 200],
	["", "APERSBoundingMine_Range_Mag", 250],
	["", "APERSMine_Range_Mag", 300],
	["", "ClaymoreDirectionalMine_Remote_Mag", 350],
	["", "SLAMDirectionalMine_Wire_Mag", 350],
	["", "ATMine_Range_Mag", 400],
	["", "DemoCharge_Remote_Mag", 450],
	["", "SatchelCharge_Remote_Mag", 500],
	["", "SmokeShell", 50],
	["", "SmokeShellPurple", 50],
	["", "SmokeShellBlue", 50],
	["", "SmokeShellGreen", 50],
	["", "SmokeShellYellow", 50],
	["", "SmokeShellOrange", 50],
	["", "SmokeShellRed", 50]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = compileFinal str
[
	["", "16Rnd_9x21_Mag", 10],
	["9mm 30Rnd Mag", "30Rnd_9x21_Mag", 15],
	[".45 ACP 6Rnd Cylinder", "6Rnd_45ACP_Cylinder", 5],
	["", "9Rnd_45ACP_Mag", 10],
	[".45 ACP 11Rnd Mag", "11Rnd_45ACP_Mag", 15],
	["", "30Rnd_45ACP_MAG_SMG_01", 20],
	["", "30Rnd_45ACP_Mag_SMG_01_tracer_green", 15],
	["5.56mm 20Rnd Underwater Mag", "20Rnd_556x45_UW_mag", 10],
	["5.56mm 30Rnd STANAG Mag", "30Rnd_556x45_Stanag", 20],
	["5.56mm 30Rnd Tracer (Green) Mag", "30Rnd_556x45_Stanag_Tracer_Green", 15],
	["5.56mm 30Rnd Tracer (Yellow) Mag", "30Rnd_556x45_Stanag_Tracer_Yellow", 15],
	["5.56mm 30Rnd Tracer (Red) Mag", "30Rnd_556x45_Stanag_Tracer_Red", 15],
	["6.5mm 30Rnd STANAG Mag", "30Rnd_65x39_caseless_mag", 20],
	["6.5mm 30Rnd Tracer (Red) Mag", "30Rnd_65x39_caseless_mag_Tracer", 15],
	["6.5mm 30Rnd Caseless Mag", "30Rnd_65x39_caseless_green", 20],
	["6.5mm 30Rnd Tracer (Green) Mag", "30Rnd_65x39_caseless_green_mag_Tracer", 15],
	["6.5mm 100Rnd Belt Case", "100Rnd_65x39_caseless_mag", 75],
	["6.5mm 100Rnd Tracer (Red) Belt Case", "100Rnd_65x39_caseless_mag_Tracer", 50],
	["6.5mm 200Rnd Belt Case", "200Rnd_65x39_cased_Box", 150],
	["6.5mm 200Rnd Tracer (Yellow) Belt Case", "200Rnd_65x39_cased_Box_Tracer", 125],
	//["7.62mm 10Rnd Mag", "10Rnd_762x51_Mag", 15],
	["7.62mm 10Rnd Mag", "10Rnd_762x54_Mag", 15],
	["7.62mm 20Rnd Mag", "20Rnd_762x51_Mag", 25],
	//["7.62mm 150Rnd Box", "150Rnd_762x51_Box", 150],
	//["7.62mm 150Rnd Tracer (Green) Box", "150Rnd_762x51_Box_Tracer", 125],
	["7.62mm 150Rnd Box", "150Rnd_762x54_Box", 150],
	["7.62mm 150Rnd Tracer (Green) Box", "150Rnd_762x54_Box_Tracer", 125],
	[".338 LM 10Rnd Mag", "10Rnd_338_Mag", 50],
	[".338 NM 130Rnd Belt", "130Rnd_338_Mag", 150],
	["9.3mm 10Rnd Mag", "10Rnd_93x64_DMR_05_Mag", 50],
	["9.3mm 150Rnd Belt", "150Rnd_93x64_Mag", 150],
	[".408 7Rnd Cheetah Mag", "7Rnd_408_Mag", 50],
	["12.7mm 5Rnd Mag", "5Rnd_127x108_Mag", 50],
	["12.7mm 5Rnd Armor-Piercing Mag", "5Rnd_127x108_APDS_Mag", 60],
	["12.7mm 10Rnd Subsonic Mag", "10Rnd_127x54_Mag", 75],
	["RPG-32 Anti-Tank Rocket", "RPG32_F", 250],              // Direct damage: high      | Splash damage: low    | Guidance: none
	["RPG-32 High-Explosive Rocket", "RPG32_HE_F", 250],      // Direct damage: medium    | Splash damage: medium | Guidance: none
	// ["NLAW Anti-Tank Missile", "NLAW_F", 400],                // Direct damage: very high | Splash damage: low    | Guidance: laser, ground vehicles
	// ["Titan Anti-Tank Missile", "Titan_AT", 350],             // Direct damage: high      | Splash damage: low    | Guidance: mouse, laser, ground vehicles
	// ["Titan Anti-Personnel Missile", "Titan_AP", 350],        // Direct damage: low       | Splash damage: high   | Guidance: mouse, laser
	//["Titan Anti-Air Missile", "Titan_AA", 350],              // Direct damage: low       | Splash damage: medium | Guidance: aircraft
	["40mm HE Grenade Round", "1Rnd_HE_Grenade_shell", 125],
	["40mm 3Rnd HE Grenades", "3Rnd_HE_Grenade_shell", 250],
	["40mm Smoke Round (White)", "1Rnd_Smoke_Grenade_shell", 50],
	["40mm Smoke Round (Purple)", "1Rnd_SmokePurple_Grenade_shell", 50],
	["40mm Smoke Round (Blue)", "1Rnd_SmokeBlue_Grenade_shell", 50],
	["40mm Smoke Round (Green)", "1Rnd_SmokeGreen_Grenade_shell", 50],
	["40mm Smoke Round (Yellow)", "1Rnd_SmokeYellow_Grenade_shell", 50],
	["40mm Smoke Round (Orange)", "1Rnd_SmokeOrange_Grenade_shell", 50],
	["40mm Smoke Round (Red)", "1Rnd_SmokeRed_Grenade_shell", 50],
	["40mm 3Rnd Smokes (White)", "3Rnd_Smoke_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Purple)", "3Rnd_SmokePurple_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Blue)", "3Rnd_SmokeBlue_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Green)", "3Rnd_SmokeGreen_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Yellow)", "3Rnd_SmokeYellow_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Orange)", "3Rnd_SmokeOrange_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Red)", "3Rnd_SmokeRed_Grenade_shell", 100],
	["40mm Flare Round (White)", "UGL_FlareWhite_F", 25],
	["40mm Flare Round (Green)", "UGL_FlareGreen_F", 25],
	["40mm Flare Round (Yellow)", "UGL_FlareYellow_F", 25],
	["40mm Flare Round (Red)", "UGL_FlareRed_F", 25],
	["40mm Flare Round (IR)", "UGL_FlareCIR_F", 25],
	["40mm 3Rnd Flares (White)", "3Rnd_UGL_FlareWhite_F", 50],
	["40mm 3Rnd Flares (Green)", "3Rnd_UGL_FlareGreen_F", 50],
	["40mm 3Rnd Flares (Yellow)", "3Rnd_UGL_FlareYellow_F", 50],
	["40mm 3Rnd Flares (Red)", "3Rnd_UGL_FlareRed_F", 50],
	["40mm 3Rnd Flares (IR)", "3Rnd_UGL_FlareCIR_F", 50]
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray = compileFinal str
[
	["Suppressor 9mm", "muzzle_snds_L", 50, "item"],
	["Suppressor .45 ACP", "muzzle_snds_acp", 75, "item"],
	["Suppressor 5.56mm", "muzzle_snds_M", 100, "item"],
	["Suppressor 6.5mm", "muzzle_snds_H", 100, "item"],
	["Suppressor 6.5mm LMG", "muzzle_snds_H_MG", 125, "item"],
	["Suppressor 7.62mm", "muzzle_snds_B", 125, "item"],
	["Suppressor .338 [DLC]", "muzzle_snds_338_black", 150, "item"],
	["Suppressor .338 (Green) [DLC]", "muzzle_snds_338_green", 150, "item"],
	["Suppressor .338 (Sand) [DLC]", "muzzle_snds_338_sand", 175, "item"],
	["Suppressor 9.3mm [DLC]", "muzzle_snds_93mmg", 175, "item"],
	["Suppressor 9.3mm (Tan) [DLC]", "muzzle_snds_93mmg_tan", 175, "item"],
	["Bipod (NATO)", "bipod_01_F_blk", 250, "item"],
	["Bipod (CSAT)", "bipod_02_F_blk", 250, "item"],
	["Bipod (AAF)", "bipod_03_F_blk", 250, "item"],
	["Bipod (MTP)", "bipod_01_F_mtp", 250, "item"],
	["Bipod (Hex)", "bipod_02_F_hex", 250, "item"],
	["Bipod (Olive)", "bipod_03_F_oli", 250, "item"],
	["Bipod (Sand)", "bipod_01_F_snd", 250, "item"],
	["Bipod (Tan)", "bipod_02_F_tan", 250, "item"],
	["Flashlight", "acc_flashlight", 25, "item"],
	["IR Laser Pointer", "acc_pointer_IR", 25, "item"],
	["Yorris Sight (Zubr Revolver)", "optic_Yorris", 50, "item"],
	["MRD Sight (4-Five Pistol)", "optic_MRD", 50, "item"],
	["ACO (CQB)", "optic_aco_smg", 50, "item"],
	["Holosight (CQB)", "optic_Holosight_smg", 50, "item"],
	["ACO (Red)", "optic_Aco", 75, "item"],
	["ACO (Green)", "optic_Aco_grn", 75, "item"],
	["Holosight", "optic_Holosight", 75, "item"],
	["MRCO", "optic_MRCO", 100, "item"],
	["ARCO", "optic_Arco", 125, "item"],
	["RCO", "optic_Hamr", 150, "item"],
	["MOS", "optic_SOS", 150, "item"],
	["DMS", "optic_DMS", 175, "item"],
	["AMS [DLC]", "optic_AMS", 200, "item"],
	["AMS (Khaki) [DLC]", "optic_AMS_khk", 200, "item"],
	["AMS (Sand) [DLC]", "optic_AMS_snd", 200, "item"],
	["Kahlia [DLC]", "optic_KHS_blk", 250, "item"],
	["Kahlia (Hex) [DLC]", "optic_KHS_hex", 250, "item"],
	["Kahlia (Tan) [DLC]", "optic_KHS_tan", 250, "item"],
	["Kahlia (Old) [DLC]", "optic_KHS_old", 250, "item"],
	["LRPS", "optic_LRPS", 300, "item"],
	["NVS", "optic_NVS", 500, "item"],
	["TWS", "optic_tws", 5000, "item"],
	["TWS MG", "optic_tws_mg", 6000, "item"],
	["Nightstalker", "optic_Nightstalker", 7500, "item"]
];

// If commented, means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[
	["Military Cap (Blue)", "H_MilCap_blue", 25, "hat"],
	["Military Cap (Gray)", "H_MilCap_gry", 25, "hat"],
	["Military Cap (Urban)", "H_MilCap_oucamo", 25, "hat"],
	["Military Cap (Russia)", "H_MilCap_rucamo", 25, "hat"],
	["Military Cap (MTP)", "H_MilCap_mcamo", 25, "hat"],
	["Military Cap (Hex)", "H_MilCap_ocamo", 25, "hat"],
	["Military Cap (AAF)", "H_MilCap_dgtl", 25, "hat"],
	["Rangemaster Cap", "H_Cap_headphones", 25, "hat"],
	["Bandanna (Coyote)", "H_Bandanna_cbr", 10, "hat"],
	["Bandanna (Camo)", "H_Bandanna_camo", 10, "hat"],
	["Bandanna (Gray)", "H_Bandanna_gry", 10, "hat"],
	["Bandanna (Khaki)", "H_Bandanna_khk", 10, "hat"],
	["Bandanna (MTP)", "H_Bandanna_mcamo", 10, "hat"],
	["Bandanna (Sage)", "H_Bandanna_sgg", 10, "hat"],
	["Bandanna (Surfer)", "H_Bandanna_surfer", 10, "hat"],
	["Bandanna Mask (Black)", "H_BandMask_blk", 10, "hat"],
	["Bandanna Mask (Demon)", "H_BandMask_demon", 10, "hat"],
	["Bandanna Mask (Khaki)", "H_BandMask_khk", 10, "hat"],
	["Bandanna Mask (Reaper)", "H_BandMask_reaper", 10, "hat"],
	["Beanie (Black)", "H_Watchcap_blk", 10, "hat"],
	["Beanie (Dark blue)", "H_Watchcap_sgg", 10, "hat"],
	["Beanie (Dark brown)", "H_Watchcap_cbr", 10, "hat"],
	["Beanie (Dark khaki)", "H_Watchcap_khk", 10, "hat"],
	["Beanie (Dark green)", "H_Watchcap_camo", 10, "hat"],
	["Beret (Black)", "H_Beret_blk", 10, "hat"],
	["Beret (Colonel)", "H_Beret_Colonel", 10, "hat"],
	["Beret (NATO)", "H_Beret_02", 10, "hat"],
	["Booniehat (Khaki)", "H_Booniehat_khk", 10, "hat"],
	["Booniehat (Tan)", "H_Booniehat_tan", 10, "hat"],
	["Booniehat (MTP)", "H_Booniehat_mcamo", 10, "hat"],
	["Booniehat (Digi)", "H_Booniehat_dgtl", 10, "hat"],
	["Fedora (Blue)", "H_Hat_blue", 10, "hat"],
	["Fedora (Brown)", "H_Hat_brown", 10, "hat"],
	["Fedora (Camo)", "H_Hat_camo", 10, "hat"],
	["Fedora (Checker)", "H_Hat_checker", 10, "hat"],
	["Fedora (Gray)", "H_Hat_grey", 10, "hat"],
	["Fedora (Tan)", "H_Hat_tan", 10, "hat"],
	["Cap (Black)", "H_Cap_blk", 10, "hat"],
	["Cap (Blue)", "H_Cap_blu", 10, "hat"],
	["Cap (Green)", "H_Cap_grn", 10, "hat"],
	["Cap (Olive)", "H_Cap_oli", 10, "hat"],
	["Cap (Red)", "H_Cap_red", 10, "hat"],
	["Cap (Tan)", "H_Cap_tan", 10, "hat"],
	["Cap (BI)", "H_Cap_grn_BI", 10, "hat"],
	["Cap (CMMG)", "H_Cap_blk_CMMG", 10, "hat"],
	["Cap (ION)", "H_Cap_blk_ION", 10, "hat"],
	["Cap (Raven Security)", "H_Cap_blk_Raven", 10, "hat"],
	["Cap (SAS)", "H_Cap_khaki_specops_UK", 10, "hat"],
	["Cap (SF)", "H_Cap_tan_specops_US", 10, "hat"],
	["Cap (SPECOPS)", "H_Cap_brn_SPECOPS", 10, "hat"],
	["Shemag (White)", "H_ShemagOpen_khk", 25, "hat"],
	["Shemag (Brown)", "H_ShemagOpen_tan", 25, "hat"],
	["Shemag mask (Khaki)", "H_Shemag_khk", 25, "hat"],
	["Shemag mask (Olive)", "H_Shemag_olive", 25, "hat"],
	["Cap (Police)", "H_Cap_police", 10, "hat"],
	["Cap (BlackHS)", "TRYK_H_headsetcap_blk", 10, "hat"],
	["Cap (BlackGL)", "TRYK_H_headsetcap_blk_Glasses", 10, "hat"],
	["Cap (OlivGL)", "TRYK_H_headsetcap_od_Glasses", 10, "hat"],
	["Cap (Reverse Blk)", "TRYK_R_CAP_BLK", 10, "hat"],
	["Cap (Reverse Blk/Gl)", "TRYK_r_cap_blk_Glasses", 10, "hat"]
];

uniformArray = compileFinal str
[
	["DEA Rd/Blk", "TRYK_shirts_BLK_PAD", 250, "uni"], // DEA
	["DEA Blk/Blk", "TRYK_shirts_BLK_PAD_BK", 250, "uni"],
	["DEA Blu/Blk", "TRYK_shirts_BLK_PAD_BLU3", 250, "uni"],
	["DEA Vio/Blk", "TRYK_shirts_BLK_PAD_BL", 250, "uni"],
	["DEA Tan/Blk", "TRYK_shirts_BLK_PAD_BLW", 250, "uni"],
	["DEA Yel/Blk", "TRYK_shirts_BLK_PAD_YEL", 250, "uni"],
	["DEA Rd/Gr", "TRYK_shirts_OD_PAD", 250, "uni"],
	["DEA Blk/Gr", "TRYK_shirts_OD_PAD_BK", 250, "uni"],
	["DEA Blu/Gr", "TRYK_shirts_OD_PAD_BLU3", 250, "uni"],
	["DEA Tan/Gr", "TRYK_shirts_OD_PAD_BLW", 250, "uni"],
	["DEA Yek/Gr", "TRYK_shirts_OD_PAD_YEL", 250, "uni"],
	["DEA Blk/Tan", "TRYK_shirts_PAD_BK", 250, "uni"],
	["DEA Camo Combat", "TRYK_U_hood_mc", 250, "uni"],
	["DEA Grey Hood", "TRYK_U_B_PCUGs", 250, "uni"],
	["DEA Black Hood", "TRYK_U_B_PCUGs_BLK_R", 250, "uni"],
	["DEA Black Hood Com", "TRYK_U_B_PCUs", 250, "uni"],
	["DEA Green Hood Com", "TRYK_U_Bts_PCUODs", 250, "uni"],
		
	["Los Pepes Blk 1", "TRYK_U_B_BLKBLK_CombatUniform", 250, "uni"], // Los Pepes
	["Los Pepes Blk 2", "TRYK_U_B_BLK", 250, "uni"],
	["Los Pepes Blk 3", "TRYK_U_B_BLKBLK_R_CombatUniform", 250, "uni"],
	["Los Pepes Blk 4", "TRYK_U_B_BLK_OD", 250, "uni"],
	["Los Pepes Blk 5", "TRYK_U_B_BLK_OD_Tshirt", 250, "uni"],
	["Los Pepes Blk 6", "TRYK_U_B_BLK_T_BG_BK", 250, "uni"],
	["Los Pepes Blk 7", "TRYK_U_B_BLK_T_BK", 250, "uni"],
	["Los Pepes Blk 8", "TRYK_U_B_BLK_Tshirt", 250, "uni"],
	["Los Pepes Blk 9", "TRYK_U_B_BLK3CD_Tshirt", 250, "uni"],
	["Los Pepes Blk 10", "TRYK_U_B_BLKOCP_CombatUniform", 250, "uni"],
	["Los Pepes Blk 11", "TRYK_U_B_BLKOCP_R_CombatUniformTshirt", 250, "uni"],
	["Los Pepes Blk 12", "TRYK_U_B_BLOD_T", 250, "uni"],
	["Los Pepes Blk 13", "TRYK_U_B_C01_Tsirt", 250, "uni"],
	["Los Pepes Blk 14", "TRYK_U_B_BLTAN_T", 250, "uni"],
	
	
	["Medellín 1", "TRYK_U_denim_hood_blk", 250, "uni"], // Medellin
	["Medellín 2", "TRYK_U_denim_hood_nc", 250, "uni"],
	["Medellín 3", "TRYK_U_denim_hood_mc", 250, "uni"],
	["Medellín 4", "TRYK_U_denim_jersey_blk", 250, "uni"],
	["Medellín 5", "TRYK_U_denim_jersey_blu", 250, "uni"],
	["Medellín 6", "TRYK_U_hood_nc", 250, "uni"], 
	["Medellín 7", "TRYK_U_nohoodPcu_gry", 250, "uni"],
	["Medellín 8", "TRYK_U_pad_hood_Blk", 250, "uni"],
	["Medellín 9", "TRYK_U_pad_j", 250, "uni"],
	["Medellín 10", "TRYK_U_pad_j_blk", 250, "uni"],
	["Medellín 11", "TRYK_ZARATAKI", 250, "uni"],
	["Medellín 12", "TRYK_ZARATAKI2", 250, "uni"],
	["Medellín 13", "TRYK_ZARATAKI3", 250, "uni"],
	["Medellín 14", "TRYK_U_denim_hood_3c", 250, "uni"]
];

vestArray = compileFinal str
[
	["Rebreather (NATO)", "V_RebreatherB", 200, "vest"],
	["Rebreather (CSAT)", "V_RebreatherIR", 200, "vest"],
	["Rebreather (AAF)", "V_RebreatherIA", 200, "vest"],
	["FBI Vest HRT", "TRYK_V_ArmorVest_HRT_OD", -1, "vest"],
	["Police Vest Plate", "TRYK_V_PlateCarrier_POLICE", -1, "vest"],
	["FBI Vest BLK", "TRYK_V_tacv1_FBI_BK", -1, "vest"],
	["Marshal Vest BLK", "TRYK_V_tacv1_MSL_BK", -1, "vest"],
	["Tactical Vest (Police)", "V_TacVest_blk_POLICE", 200, "vest"],
	["Police Vest Blue", "TRYK_V_tacv1_MSL_NV", -1, "vest"],
	["Sheriff Vest BLK", "TRYK_V_tacv1_SHERIFF_BK", -1, "vest"],
	["Sheriff Vest Green", "TRYK_V_tacv1LC_SRF_OD", -1, "vest"],
	["Armor Vest Marpat", "TRYK_V_ArmorVest_AOR1", -1, "vest"],
	["Armor Vest Green", "TRYK_V_ArmorVest_AOR2", -1, "vest"],
	["Armor Vest Brown", "TRYK_V_ArmorVest_Brown", -1, "vest"],
	["Armor Vest Black", "TRYK_V_ArmorVest_Delta", -1, "vest"],
	["Plate Carrier Black", "TRYK_V_PlateCarrier_blk", -1, "vest"],
	["Plate Carrier Coyote", "TRYK_V_PlateCarrier_coyo", -1, "vest"],
	["Plate Carrier JSDF", "TRYK_V_PlateCarrier_JSDF", -1, "vest"],
	["Plate Carrier Wood", "TRYK_V_PlateCarrier_wood", -1, "vest"],
	["LBV Harness", "V_HarnessO_brn", 200, "vest"],
	["LBV Harness (Gray)", "V_HarnessO_gry", 210	, "vest"],
	["LBV Grenadier Harness", "V_HarnessOGL_brn", 180, "vest"],
	["LBV Grenadier Harness (Gray)", "V_HarnessOGL_gry", 190, "vest"],
	["ELBV Harness", "V_HarnessOSpec_brn", 200, "vest"],
	["ELBV Harness (Gray)", "V_HarnessOSpec_gry", 210, "vest"],
	["CTRG Plate Carrier Rig Mk.1 (Light)", "V_PlateCarrierL_CTRG", 150, "vest"],
    ["CTRG Plate Carrier Rig Mk.2 (Heavy)", "V_PlateCarrierH_CTRG", 160, "vest"],
	["Slash Bandolier (Black)", "V_BandollierB_blk", 80, "vest"],
	["Slash Bandolier (Coyote)", "V_BandollierB_cbr", 80, "vest"],
	["Slash Bandolier (Green)", "V_BandollierB_rgr", 80, "vest"],
	["Slash Bandolier (Khaki)", "V_BandollierB_khk", 80, "vest"],
	["Slash Bandolier (Olive)", "V_BandollierB_oli", 80, "vest"],
	["Chest Rig (Khaki)", "V_Chestrig_khk", 120, "vest"],
	["Chest Rig (Green)", "V_Chestrig_rgr", 120, "vest"],
	["Fighter Chestrig (Black)", "V_Chestrig_blk", 120, "vest"],
	["Fighter Chestrig (Olive)", "V_Chestrig_oli", 120, "vest"],
	["Tactical Vest (Black)", "V_TacVest_blk", 150, "vest"],
	["Tactical Vest (Brown)", "V_TacVest_brn", 150, "vest"],
	["Tactical Vest (Camo)", "V_TacVest_camo", 150, "vest"],
	["Tactical Vest (Khaki)", "V_TacVest_khk", 150, "vest"],
	["Tactical Vest (Olive)", "V_TacVest_oli", 150, "vest"], 
	["Tactical Vest (Stavrou)", "V_I_G_resistanceLeader_F", 150, "vest"],
	["Raven Night Vest", "V_TacVestIR_blk", 150, "vest"]
];

backpackArray = compileFinal str
[
	["Parachute", "B_Parachute", 200, "backpack"],
	["Assault Pack (Black)", "B_AssaultPack_blk", 150, "backpack"],
	["Assault Pack (Green)", "B_AssaultPack_rgr", 150, "backpack"],
	["Assault Pack (MTP)", "B_AssaultPack_mcamo", 150, "backpack"],
	["Assault Pack (Hex)", "B_AssaultPack_ocamo", 150, "backpack"],

	["Field Pack (Black)", "B_FieldPack_blk", 250, "backpack"],
	["Field Pack (Coyote)", "B_FieldPack_cbr", 250, "backpack"],
	["Field Pack (Hex)", "B_FieldPack_ocamo", 250, "backpack"],
	["Field Pack (Khaki)", "B_FieldPack_khk", 250, "backpack"],
	["Field Pack (Olive)", "B_FieldPack_oli", 250, "backpack"],
	["Field Pack (Urban)", "B_FieldPack_oucamo", 250, "backpack"],

	["Kitbag (Coyote)", "B_Kitbag_cbr", 450, "backpack"],
	["Kitbag (Green)", "B_Kitbag_rgr", 450, "backpack"],
	["Kitbag (MTP)", "B_Kitbag_mcamo", 450, "backpack"],
	["Kitbag (Sage)", "B_Kitbag_sgg", 450, "backpack"],
	["Kitbag (Black)", "TRYK_B_Kitbag_blk", 450, "backpack"],
	["Kitbag (Med)", "TRYK_B_Medbag", 450, "backpack"],
	["Kitbag (Med Black)", "TRYK_B_Medbag_BK", 450, "backpack"],
	["Kitbag (Med Green)", "TRYK_B_Medbag_OD", 450, "backpack"],
	["Kitbag (Med Urban)", "TRYK_B_Medbag_ucp", 450, "backpack"],

	["Bergen (Black)", "B_Bergen_blk", 650, "backpack"],
	["Bergen (Green)", "B_Bergen_rgr", 650, "backpack"],
	["Bergen (MTP)", "B_Bergen_mcamo", 650, "backpack"],
	["Bergen (Sage)", "B_Bergen_sgg", 650, "backpack"],

	["Carryall (Coyote)", "B_Carryall_cbr", 850, "backpack"],
	["Carryall (Hex)", "B_Carryall_ocamo", 850, "backpack"],
	["Carryall (Khaki)", "B_Carryall_khk", 850, "backpack"],
	["Carryall (MTP)", "B_Carryall_mcamo", 850, "backpack"],
	["Carryall (Olive)", "B_Carryall_oli", 850, "backpack"],
	["Carryall (Urban)", "B_Carryall_oucamo", 850, "backpack"],
	["Carryall (Black)", "TRYK_B_Carryall_blk", 850, "backpack"]
];

genItemArray = compileFinal str
[
	["UAV Terminal (NATO)", "B_UavTerminal", 800, "gps"],
	["UAV Terminal (CSAT)", "O_UavTerminal", 800, "gps"],
	["UAV Terminal (AAF)", "I_UavTerminal", 800, "gps"],
	["Quadrotor UAV (NATO)", "B_UAV_01_backpack_F", 1000, "backpack"],
	["Quadrotor UAV (CSAT)", "O_UAV_01_backpack_F", 1000, "backpack"],
	["Quadrotor UAV (AAF)", "I_UAV_01_backpack_F", 1000, "backpack"],
	["Remote Designator Bag (NATO)", "B_Static_Designator_01_weapon_F", 1500, "backpack"],
	["Remote Designator Bag (CSAT)", "O_Static_Designator_02_weapon_F", 1500, "backpack"],
	["", "ACE_fieldDressing", 25, "item"],
	["", "ACE_morphine", 100 ,"item"],
	["", "ACE_epinephrine", 100, "item"],
	["", "ACE_bloodIV", 250, "item"],
	["", "ACE_EarPlugs", 10, "item"],
	["GPS", "ItemGPS", 500, "gps"],
	["First Aid Kit", "FirstAidKit", 100, "item"],
	["Medikit", "Medikit", 500, "item"],
	["Toolkit", "ToolKit", 500, "item"],
	["Mine Detector", "MineDetector", 250, "item"],
	["NV Goggles Brown", "NVGoggles", 500, "nvg"],
	["NV Goggles Black", "NVGoggles_OPFOR", 500, "nvg"],
	["NV Goggles Green", "NVGoggles_INDEP", 500, "nvg"],
	["Binoculars", "Binocular", 500, "binoc"],
	["Rangefinder", "Rangefinder", 1000, "binoc"],
	["Laser Designator (NATO)", "Laserdesignator", 1500, "binoc", "WEST"],
	["Laser Designator (CSAT)", "Laserdesignator_02", 1500, "binoc", "EAST"],
	["Laser Designator (AAF)", "Laserdesignator_03", 1500, "binoc", "GUER"],
	["IR Grenade (NATO)", "B_IR_Grenade", 150, "mag", "WEST"],
	["IR Grenade (CSAT)", "O_IR_Grenade", 150, "mag", "EAST"],
	["IR Grenade (AAF)", "I_IR_Grenade", 150, "mag", "GUER"],
	["Chemlight (Blue)", "Chemlight_blue", 25, "mag"],
	["Chemlight (Green)", "Chemlight_green", 25, "mag"],
	["Chemlight (Yellow)", "Chemlight_yellow", 25, "mag"],
	["Chemlight (Red)", "Chemlight_red", 25, "mag"],
	["Aviator Glasses", "G_Aviator", 25, "gogg"],
	["Diving Goggles", "G_Diving", 100, "gogg"],
	["Balaclava (Black)", "G_Balaclava_blk", 100, "gogg"],
	["Balaclava (Olive)", "G_Balaclava_oli", 100, "gogg"],
	["Balaclava (Combat Goggles)", "G_Balaclava_combat", 100, "gogg"],
	["Balaclava (Low Profile Goggles)", "G_Balaclava_lowprofile", 100, "gogg"],
	["Bandanna (Aviator)", "G_Bandanna_aviator", 100, "gogg"],
	["Bandanna (Beast)", "G_Bandanna_beast", 100, "gogg"],
	["Bandanna (Black)", "G_Bandanna_blk", 100, "gogg"],
	["Bandanna (Khaki)", "G_Bandanna_khk", 100, "gogg"],
	["Bandanna (Olive)", "G_Bandanna_oli", 100, "gogg"],
	["Bandanna (Shades)", "G_Bandanna_shades", 100, "gogg"],
	["Bandanna (Sport)", "G_Bandanna_sport", 100, "gogg"],
	["Bandanna (Tan)", "G_Bandanna_tan", 100, "gogg"],
	["Combat Goggles", "G_Combat", 100, "gogg"],
	["VR Goggles", "G_Goggles_VR", 100, "gogg"],
	["Ladies Shades (ICE)", "G_Lady_Blue", 100, "gogg"],
	["Ladies Shades (Sea)", "G_Lady_Dark", 100, "gogg"],
	["Ladies Shades (Iridium)", "G_Lady_Mirror", 100, "gogg"],
	["Ladies Shades (Fire)", "G_Lady_Red", 100, "gogg"],
	["Low Profile Goggles", "G_Lowprofile", 100, "gogg"],
	["Shades (Black)", "G_Shades_Black", 100, "gogg"],
	["Shades (Blue)", "G_Shades_Blue", 100, "gogg"],
	["Shades (Green)", "G_Shades_Green", 100, "gogg"],
	["Shades (Red)", "G_Shades_Red", 100, "gogg"],
	["Spectacle Glasses", "G_Spectacles", 100, "gogg"],
	["Tinted Spectacles", "G_Spectacles_Tinted", 100, "gogg"],
	["Sport Shades (Vulcan)", "G_Sport_Blackred", 100, "gogg"],
	["Sport Shades (Shadow)", "G_Sport_BlackWhite", 100, "gogg"],
	["Sport Shades (Poison)", "G_Sport_Blackyellow", 100, "gogg"],
	["Sport Shades (Style)", "G_Sport_Checkered", 100, "gogg"],
	["Sport Shades (Yetti)", "G_Sport_Greenblack", 100, "gogg"],
	["Sport Shades (Fire)", "G_Sport_Red", 100, "gogg"],
	["Square Spectacles", "G_Squares", 100, "gogg"],
	["Square Shades", "G_Squares_Tinted", 100, "gogg"],
	["Tactical Shades", "G_Tactical_Black", 100, "gogg"],
	["Tactical Glasses", "G_Tactical_Clear", 100, "gogg"],
	["Beard Black light", "TRYK_Beard_BK", 100, "gogg"],
	["Beard Black full", "TRYK_Beard_BK3", 100, "gogg"],
	["Beard Brown light", "TRYK_Beard_BW", 100, "gogg"],
	["Beard Black full", "TRYK_Beard_BW3", 100, "gogg"],
	["Beard Grey light", "TRYK_Beard_Gr2", 100, "gogg"],
	["Beard Grey full", "TRYK_Beard_Gr4", 100, "gogg"],
	["Beard Blonde light", "TRYK_Beard3", 100, "gogg"],
	["Beard Blonde full", "TRYK_Beard4", 100, "gogg"]
];

allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call uniformArray + call vestArray + call backpackArray);

genObjectsArray = compileFinal str
[
	["Empty Ammo Crate", "Box_NATO_Ammo_F", 200, "ammocrate"],
	//["Metal Barrel", "Land_MetalBarrel_F", 25, "object"],
	//["Toilet Box", "Land_ToiletBox_F", 25, "object"],
	["Lamp Post (Harbour)", "Land_LampHarbour_F", 100, "object"],
	["Lamp Post (Shabby)", "Land_LampShabby_F", 100, "object"],
	["Boom Gate", "Land_BarGate_F", 150, "object"],
	["Pipes", "Land_Pipes_Large_F", 200, "object"],
	["Concrete Frame", "Land_CncShelter_F", 200, "object"],
	["Highway Guardrail", "Land_Crash_barrier_F", 200, "object"],
	["Concrete Barrier", "Land_CncBarrier_F", 200, "object"],
	["Concrete Barrier (Medium)", "Land_CncBarrierMedium_F", 350, "object"],
	["Concrete Barrier (Long)", "Land_CncBarrierMedium4_F", 500, "object"],
	["HBarrier (1 block)", "Land_HBarrier_1_F", 150, "object"],
	["HBarrier (3 blocks)", "Land_HBarrier_3_F", 200, "object"],
	["HBarrier (5 blocks)", "Land_HBarrier_5_F", 250, "object"],
	["HBarrier Big", "Land_HBarrierBig_F", 500, "object"],
	["HBarrier Wall (4 blocks)", "Land_HBarrierWall4_F", 400, "object"],
	["HBarrier Wall (6 blocks)", "Land_HBarrierWall6_F", 500, "object"],
	["HBarrier Watchtower", "Land_HBarrierTower_F", 600, "object"],
	["Concrete Wall", "Land_CncWall1_F", 400, "object"],
	["Concrete Military Wall", "Land_Mil_ConcreteWall_F", 400, "object"],
	["Concrete Wall (Long)", "Land_CncWall4_F", 600, "object"],
	["Military Wall (Big)", "Land_Mil_WallBig_4m_F", 600, "object"],
	//["Shoot House Wall", "Land_Shoot_House_Wall_F", 180, "object"],
	["Canal Wall (Small)", "Land_Canal_WallSmall_10m_F", 400, "object"],
	["Canal Stairs", "Land_Canal_Wall_Stairs_F", 500, "object"],
	["Bag Fence (Corner)", "Land_BagFence_Corner_F", 150, "object"],
	["Bag Fence (End)", "Land_BagFence_End_F", 150, "object"],
	["Bag Fence (Long)", "Land_BagFence_Long_F", 200, "object"],
	["Bag Fence (Round)", "Land_BagFence_Round_F", 150, "object"],
	["Bag Fence (Short)", "Land_BagFence_Short_F", 150, "object"],
	["Bag Bunker (Small)", "Land_BagBunker_Small_F", 250, "object"],
	["Bag Bunker (Large)", "Land_BagBunker_Large_F", 500, "object"],
	["Bag Bunker Tower", "Land_BagBunker_Tower_F", 1000, "object"],
	["Military Cargo Post", "Land_Cargo_Patrol_V1_F", 800, "object"],
	["Military Cargo Tower", "Land_Cargo_Tower_V1_F", 10000, "object"],
	["Concrete Ramp", "Land_RampConcrete_F", 350, "object"],
	["Concrete Ramp (High)", "Land_RampConcreteHigh_F", 500, "object"],
	["Scaffolding", "Land_Scaffolding_F", 250, "object"]
];

allGenStoreVanillaItems = compileFinal str (call genItemArray + call genObjectsArray + call allStoreGear);

//Text name, classname, buy cost, spawn type, sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
	["Kart", "C_Kart_01_F", 500, "vehicle"],

	["Quadbike (Civilian)", "C_Quadbike_01_F", 600, "vehicle"],
	["Quadbike (NATO)", "B_Quadbike_01_F", 650, "vehicle"],
	["Quadbike (CSAT)", "O_Quadbike_01_F", 650, "vehicle"],
	["Quadbike (AAF)", "I_Quadbike_01_F", 650, "vehicle"],
	["Quadbike (FIA)", "B_G_Quadbike_01_F", 650, "vehicle"],

	["Hatchback", "C_Hatchback_01_F", 800, "vehicle"],
	["Hatchback Sport", "C_Hatchback_01_sport_F", 1000, "vehicle"],
	["SUV", "C_SUV_01_F", 1100, "vehicle"],
	["Offroad", "C_Offroad_01_F", 1100, "vehicle"],
	["Offroad Camo", "B_G_Offroad_01_F", 1250, "vehicle"],
	["Offroad Repair", "C_Offroad_01_repair_F", 1500, "vehicle"],
	["Offroad HMG", "B_G_Offroad_01_armed_F", 2500, "vehicle"],

	["Truck", "C_Van_01_transport_F", 700, "vehicle"],
	["Truck (Camo)", "B_G_Van_01_transport_F", 800, "vehicle"],
	["Truck Box", "C_Van_01_box_F", 900, "vehicle"],
	["Fuel Truck", "C_Van_01_fuel_F", 2000, "vehicle"],
	["Fuel Truck (Camo)", "B_G_Van_01_fuel_F", 2100, "vehicle"],

	["HEMTT Tractor", "B_Truck_01_mover_F", 4000, "vehicle"],
	["HEMTT Box", "B_Truck_01_box_F", 5000, "vehicle"],
	["HEMTT Transport", "B_Truck_01_transport_F", 6000, "vehicle"],
	["HEMTT Covered", "B_Truck_01_covered_F", 7500, "vehicle"],
	["HEMTT Fuel", "B_Truck_01_fuel_F", 9000, "vehicle"],
	["HEMTT Medical", "B_Truck_01_medical_F", 10000, "vehicle"],
	["HEMTT Repair", "B_Truck_01_Repair_F", 12500, "vehicle"],
	["HEMTT Ammo", "B_Truck_01_ammo_F", 27500, "vehicle"],

	["Typhoon Device", "O_Truck_03_device_F", 4000, "vehicle"],
	["Typhoon Transport", "O_Truck_03_transport_F", 6000, "vehicle"],
	["Typhoon Covered", "O_Truck_03_covered_F", 7500, "vehicle"],
	["Typhoon Fuel", "O_Truck_03_fuel_F", 9000, "vehicle"],
	["Typhoon Medical", "O_Truck_03_medical_F", 10000, "vehicle"],
	["Typhoon Repair", "O_Truck_03_repair_F", 12500, "vehicle"],
	["Typhoon Ammo", "O_Truck_03_ammo_F", 27500, "vehicle"],

	["KamAZ Transport", "I_Truck_02_transport_F", 4000, "vehicle"],
	["KamAZ Covered", "I_Truck_02_covered_F", 5000, "vehicle"],
	["KamAZ Fuel", "I_Truck_02_fuel_F", 7500, "vehicle"],
	["KamAZ Medical", "I_Truck_02_medical_F", 9000, "vehicle"],
	["KamAZ Repair", "I_Truck_02_box_F", 10000, "vehicle"],
	["KamAZ Ammo", "I_Truck_02_ammo_F", 25000, "vehicle"],

	["UGV Stomper (NATO)", "B_UGV_01_F", 2500, "vehicle"],
	["UGV Stomper RCWS (NATO)", "B_UGV_01_rcws_F", 15000, "vehicle"],
	["UGV Stomper (AAF)", "I_UGV_01_F", 2500, "vehicle"],
	["UGV Stomper RCWS (AAF)", "I_UGV_01_rcws_F", 15000, "vehicle"],
	["UGV Saif (CSAT)", "O_UGV_01_F", 2500, "vehicle"],
	["UGV Saif RCWS (CSAT)", "O_UGV_01_rcws_F", 15000, "vehicle"]
];

armoredArray = compileFinal str	//no gunned vehicles but drones
[
	["", "B_MRAP_01_F", 4000, "vehicle"],
	["", "O_MRAP_02_F", 4000, "vehicle"],
	["", "I_MRAP_03_F", 4000, "vehicle"]
];

tanksArray = compileFinal str		//no tanks
[
];


helicoptersArray = compileFinal str
[
	["", "C_Heli_Light_01_civil_F", 2500, "vehicle"], // MH-6, no flares
	["", "B_Heli_Light_01_F", 4000, "vehicle"], // MH-6
	["", "O_Heli_Light_02_unarmed_F", 5000, "vehicle"], // Ka-60
	["", "I_Heli_light_03_unarmed_F", 6000, "vehicle"], // AW159
	["", "B_Heli_Transport_01_F", 7000, "vehicle"],
	
	["", "O_Heli_Transport_04_F", 7500, "vehicle"], // CH-54
	["", "O_Heli_Transport_04_box_F", 8000, "vehicle"],
	["", "O_Heli_Transport_04_fuel_F", 8500, "vehicle"],
	["", "O_Heli_Transport_04_bench_F", 9000, "vehicle"],
	["", "O_Heli_Transport_04_covered_F", 9500, "vehicle"],
	["", "B_Heli_Transport_03_unarmed_F", 10000, "vehicle"], // CH-47
	["", 10000, "vehicle"], // AW101

	["", "O_Heli_Transport_04_medevac_F",12500, "vehicle"],
	["", "O_Heli_Transport_04_repair_F", 15000, "vehicle"],
	["", "O_Heli_Transport_04_ammo_F", 25000, "vehicle"]
];

planesArray = compileFinal str
[
	["", "B_UAV_02_F", 200000, "vehicle"],
	["", "B_UAV_02_CAS_F", 100000, "vehicle"], // Bomber UAVs are a lot harder to use, hence why they are cheaper than ATGMs
	["", "O_UAV_02_F", 200000, "vehicle"],
	["", "O_UAV_02_CAS_F", 100000, "vehicle"],
	["", "I_UAV_02_F", 200000, "vehicle"],
	["", "I_UAV_02_CAS_F", 100000, "vehicle"]
];

boatsArray = compileFinal str
[
	["Rescue Boat", "C_Rubberboat", 500, "boat"],
	["Rescue Boat (NATO)", "B_Lifeboat", 500, "boat"],
	["Rescue Boat (CSAT)", "O_Lifeboat", 500, "boat"],
	["Assault Boat (NATO)", "B_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (CSAT)", "O_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (AAF)", "I_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (FIA)", "B_G_Boat_Transport_01_F", 600, "boat"],
	["Motorboat", "C_Boat_Civil_01_F", 1000, "boat"],
	["Motorboat Rescue", "C_Boat_Civil_rescue_01_F", 900, "boat"],
	["Motorboat Police", "C_Boat_Civil_police_01_F", 1250, "boat"],
	["Speedboat HMG (CSAT)", "O_Boat_Armed_01_hmg_F", 4000, "boat"],
	["Speedboat Minigun (NATO)", "B_Boat_Armed_01_minigun_F", 4000, "boat"],
	["Speedboat Minigun (AAF)", "I_Boat_Armed_01_minigun_F", 4000, "boat"],
	["SDV Submarine (NATO)", "B_SDV_01_F", 1000, "submarine"],
	["SDV Submarine (CSAT)", "O_SDV_01_F", 1000, "submarine"],
	["SDV Submarine (AAF)", "I_SDV_01_F", 1000, "submarine"]
];

allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray);

uavArray = compileFinal str
[
	"UAV_02_base_F",
	"UGV_01_base_F"
];

noColorVehicles = compileFinal str
[
	// Deprecated
];

rgbOnlyVehicles = compileFinal str
[
	// Deprecated
];

_color = "#(rgb,1,1,1)color";
_texDir = "client\images\vehicleTextures\";
_kartDir = "\A3\soft_f_kart\Kart_01\Data\";
_mh9Dir = "\A3\air_f\Heli_Light_01\Data\";
_mohawkDir = "\A3\air_f_beta\Heli_Transport_02\Data\";
_taruDir = "\A3\air_f_heli\Heli_Transport_04\Data\";

colorsArray = compileFinal str
[
	[ // Main colors
		"All",
		[
			["SUV COP", _texDir + "cop_suv.paa"], // COPS
			["Hatchback DEA", _texDir + "dea_hatchback.paa"],
			["Hatchback COP", _texDir + "cop_hatchback.paa"],
			["Hatchback FBI", _texDir + "fbi_hatchback.paa"],
			["Hunter FBI", _texDir + "fbi_hunter.paa"],
			["Offraod COP", _texDir + "police_offroad.paa"],
			["Hummingbird COP", _texDir + "cop_hummingbird.paa"],
			["Ghosthawk COP", _texDir + "Ghosthawk_Cop.paa"],
			["Hunter COP", _texDir + "Hunter_COP.paa"],
			["Strider COP", _texDir + "strider_cop.paa"],
			["Hunter Los Pepes", _texDir + "Hunter_LosPepes.paa"], //Los Pepes
			["SUV Los Pepes 1", _texDir + "SUV_LosPepes.paa"],
			["SUV Los Pepes 2", _texDir + "SUV_LosPepes2.paa"],
			["Hunter Medellin", _texDir + "Hunter_Medellin.paa"], // Medellin
			["SUV Medellin 1", _texDir + "SUV_Medellin1.paa"],
			["SUV Medellin 2", _texDir + "SUV_Medellin2.paa"],
			["SUV Medellin 3", _texDir + "SUV_Medellin3.paa"]
		]
	],
	[ // Kart colors
		"Kart_01_Base_F",
		[
			["Black (Kart)", [[0, _kartDir + "kart_01_base_black_co.paa"]]],
			["White (Kart)", [[0, _kartDir + "kart_01_base_white_co.paa"]]],
			["Blue (Kart)", [[0, _kartDir + "kart_01_base_blue_co.paa"]]],
			["Green (Kart)", [[0, _kartDir + "kart_01_base_green_co.paa"]]],
			["Yellow (Kart)", [[0, _kartDir + "kart_01_base_yellow_co.paa"]]],
			["Orange (Kart)", [[0, _kartDir + "kart_01_base_orange_co.paa"]]],
			["Red (Kart)", [[0, _kartDir + "kart_01_base_red_co.paa"]]]
		]
	],
	[ // MH-9 colors
		"Heli_Light_01_base_F",
		[
			["AAF Camo (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_indp_co.paa"]]],
			["Blue 'n White (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_blue_co.paa"]]],
			["Blueline (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_blueline_co.paa"]]],
			["Cream Gravy (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_co.paa"]]],
			["Digital (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_digital_co.paa"]]],
			["Elliptical (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_elliptical_co.paa"]]],
			["Furious (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_furious_co.paa"]]],
			["Graywatcher (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_graywatcher_co.paa"]]],
			["ION (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_ion_co.paa"]]],
			["Jeans (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_jeans_co.paa"]]],
			["Light (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_light_co.paa"]]],
			["Shadow (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_shadow_co.paa"]]],
			["Sheriff (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sheriff_co.paa"]]],
			["Speedy (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_speedy_co.paa"]]],
			["Sunset (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sunset_co.paa"]]],
			["Vrana (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_vrana_co.paa"]]],
			["Wasp (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wasp_co.paa"]]],
			["Wave (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wave_co.paa"]]]
		]
	],
	[ // Mohawk colors
		"Heli_Transport_02_base_F",
		[
			["Dahoman (Mohawk)", [
				[0, _mohawkDir + "Skins\heli_transport_02_1_dahoman_co.paa"],
				[1, _mohawkDir + "Skins\heli_transport_02_2_dahoman_co.paa"],
				[2, _mohawkDir + "Skins\heli_transport_02_3_dahoman_co.paa"]
			]],
			["ION (Mohawk)", [
				[0, _mohawkDir + "Skins\heli_transport_02_1_ion_co.paa"],
				[1, _mohawkDir + "Skins\heli_transport_02_2_ion_co.paa"],
				[2, _mohawkDir + "Skins\heli_transport_02_3_ion_co.paa"]
			]]
		]
	],
	[ // Taru base colors
		"Heli_Transport_04_base_F",
		[
			["Black (Taru)", [
				[0, _taruDir + "heli_transport_04_base_01_black_co.paa"],
				[1, _taruDir + "heli_transport_04_base_02_black_co.paa"],
				[2, _taruDir + "heli_transport_04_pod_ext01_black_co.paa"],
				[3, _taruDir + "heli_transport_04_pod_ext02_black_co.paa"]
			]]
		]
	],
	[ // Taru bench colors
		"O_Heli_Transport_04_bench_F",
		[
			["Black (Taru)", [[2, _taruDir + "heli_transport_04_bench_black_co.paa"]]]
		]
	],
	[ // Taru fuel colors
		"O_Heli_Transport_04_fuel_F",
		[
			["Black (Taru)", [[2, _taruDir + "heli_transport_04_fuel_black_co.paa"]]]
		]
	]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
// ["Medical Kit", "medkits", localize "STR_WL_ShopDescriptions_MedKit", "client\icons\medkit.paa", 400, 200],  // not needed since there are First Ait Kits
customPlayerItems = compileFinal str
[
	["Water Bottle", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\waterbottle.paa", 30, 15],
	["Canned Food", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 30, 15],

	["LSD", "lsd", localize "STR_WL_ShopDescriptions_LSD", "client\icons\lsd.paa", 8000, 4000],
	["Marijuana", "marijuana", localize "STR_WL_ShopDescriptions_Marijuana", "client\icons\marijuana.paa", 10000, 5000],
	["Cocaine", "cocaine", localize "STR_WL_ShopDescriptions_Cocaine", "client\icons\cocaine.paa", 14000, 7000],
	["Heroin", "heroin", localize "STR_WL_ShopDescriptions_Heroin", "client\icons\heroin.paa", 15000, 7500],

	["Repair Kit", "repairkit", localize "STR_WL_ShopDescriptions_RepairKit", "client\icons\briefcase.paa", 750, 375],
	["Jerry Can (Full)", "jerrycanfull", localize "STR_WL_ShopDescriptions_fuelFull", "client\icons\jerrycan.paa", 150, 75],
	["Jerry Can (Empty)", "jerrycanempty", localize "STR_WL_ShopDescriptions_fuelEmpty", "client\icons\jerrycan.paa", 50, 25],
	["Spawn Beacon", "spawnbeacon", localize "STR_WL_ShopDescriptions_spawnBeacon", "client\icons\spawnbeacon.paa", 7000, 7000],
	["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\camonet.paa", 600, 300],
	["Syphon Hose", "syphonhose", localize "STR_WL_ShopDescriptions_SyphonHose", "client\icons\syphonhose.paa", 200, 100],
	["Energy Drink", "energydrink", localize "STR_WL_ShopDescriptions_Energy_Drink", "client\icons\energydrink.paa", 100, 50],
	["Warchest", "warchest", localize "STR_WL_ShopDescriptions_Warchest", "client\icons\warchest.paa", 1000, 500]
];

call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";

storeConfigDone = compileFinal "true";
