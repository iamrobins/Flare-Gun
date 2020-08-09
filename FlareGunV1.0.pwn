// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" SAMP Flare Gun Mod by Robin Singh");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" SAMP Flare Gun Mod by Robin Singh");
	print("----------------------------------\n");
}

#endif

//Flare Related Things Here
new Float:x, Float:y, Float:z;
new flare, moveFlare, baloon, moveBaloon;
#define DIALOG_WEAPONS 1

forward createBaloon(playerid, Float:a, Float:b, Float:c);

public createBaloon(playerid, Float:a, Float:b, Float:c){
	baloon = CreateObject(19333, a, b, c+200.00, 0, 0, 96.0,300.0);
    SendClientMessage(playerid, -1, "Flare created");
    new string[50];
    moveBaloon = MoveObject(baloon, a, b, c-1.00, 6.00);//new changes here
    format(string, sizeof(string), "Object will finish moving in %d milliseconds", moveBaloon);
    SendClientMessage(playerid, 0xFF000000, string);
    return 1;
}

stock createFlare(playerid, Float:a, Float:b, Float:c){
	GetPlayerPos(playerid, a, b, c);
    //Flare Light
    flare = CreateObject(18728, a, b, c-2.0, 0, 0, 0, 300);
    new string1[50];
    moveFlare = MoveObject(flare, a, b, c+800.00, 6.00);//new changes here
    format(string1, sizeof(string1), "Object will finish moving in %d milliseconds", moveFlare);
    SendClientMessage(playerid, 0xFF000000, string1);
    SetTimerEx("createBaloon", 2000, false,"d""f""f""f",playerid,a,b,c);
    return 1;	
}

//All Flare related stuff ends here
public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Flare Gun");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 24, 999, 25, 999,28, 999);
	AddPlayerClass(1, 1958.3783, 1343.1572, 15.3746, 269.1425, 24, 999, 25, 999,28, 999);
	AddPlayerClass(2, 1958.3783, 1343.1572, 15.3746, 269.1425, 24, 999, 25, 999,28, 999);
	AddPlayerClass(3, 1958.3783, 1343.1572, 15.3746, 269.1425, 24, 999, 25, 999,28, 999);
	AddPlayerClass(4, 1958.3783, 1343.1572, 15.3746, 269.1425, 24, 999, 25, 999,28, 999);
	AddPlayerClass(5, 1958.3783, 1343.1572, 15.3746, 269.1425, 24, 999, 25, 999,28, 999);
	SetWorldTime(0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	SetWorldTime(0);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerTime(playerid, 0, 0);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{

    if (!strcmp("/flare", cmdtext, true))
    {
    	
    	ApplyAnimation(playerid, "GFUNK", "DANCE_G12", 1.3, false, false, false, false, 700, false);
    	createFlare(playerid, x, y, z);
    	
        return 1;
        
    }

    if (!strcmp("/near", cmdtext))
	{
		GetObjectPos(baloon, x, y, z);
    	if (IsPlayerInRangeOfPoint(playerid, 10.0, x, y, z)) 
    	{
    		
    		SendClientMessage(playerid,0xFFFFFFFF,"You are near the object");
    		ShowPlayerDialog(playerid, DIALOG_WEAPONS, DIALOG_STYLE_LIST, "Weapons", "Desert Eagle\nAK-47\nCombat Shotgun", "Select", "Close");
    	}
    	else
    	{
    		SendClientMessage(playerid,0xFFFFFFFF,"You are far away");
    	}
 
    	return 1;
	}

	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_WEAPONS)
    {
        if(response)
        {
            
            switch(listitem)
            {
                case 0: GivePlayerWeapon(playerid, WEAPON_DEAGLE, 14);
                case 1: GivePlayerWeapon(playerid, WEAPON_AK47, 120);
                case 2: GivePlayerWeapon(playerid, WEAPON_SHOTGSPA, 28); 
            }
        }
        return 1; 
    }
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
