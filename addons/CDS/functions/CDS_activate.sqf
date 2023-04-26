// Toggle HUD display
player say "readoutclick";
AAF_cds_lastchange = time + 0.2;
if (AAF_cds_active) then {
	AAF_cds_active = false;
	player sidechat "CDS disabled";
} else {
	AAF_cds_active = true;
	player sidechat "CDS enabled";
};
if (player getvariable ["AAF_cds_goggles",0] == 0) exitwith {};
