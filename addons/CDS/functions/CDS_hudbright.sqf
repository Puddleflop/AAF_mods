player say "readoutclick";
AAF_cds_lastchange = time + 0.2;
AAF_cds_alpha = AAF_cds_alpha + 0.1;
if (AAF_cds_alpha > 1.1) then {
	AAF_cds_alpha = 0;
};
//Remove to stop confusion
//player sidechat format ["HUD brightness adjust %1%2",AAF_cds_alpha*100,"%"];
// Reset HUD for good measure
[] call AAF_cds_fnc_reset;
