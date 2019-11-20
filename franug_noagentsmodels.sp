#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <dhooks>

// Valve Agents models list
char Agents[][] = {
"models/player/custom_player/legacy/tm_phoenix_varianth.mdl",
"models/player/custom_player/legacy/tm_phoenix_variantg.mdl",
"models/player/custom_player/legacy/tm_phoenix_variantf.mdl",
"models/player/custom_player/legacy/tm_leet_varianti.mdl",
"models/player/custom_player/legacy/tm_leet_variantg.mdl",
"models/player/custom_player/legacy/tm_leet_varianth.mdl",
"models/player/custom_player/legacy/tm_balkan_variantj.mdl",
"models/player/custom_player/legacy/tm_balkan_varianti.mdl",
"models/player/custom_player/legacy/tm_balkan_varianth.mdl",
"models/player/custom_player/legacy/tm_balkan_variantg.mdl",
"models/player/custom_player/legacy/tm_balkan_variantf.mdl",
"models/player/custom_player/legacy/ctm_st6_variantm.mdl",
"models/player/custom_player/legacy/ctm_st6_varianti.mdl",
"models/player/custom_player/legacy/ctm_st6_variantg.mdl",
"models/player/custom_player/legacy/ctm_sas_variantf.mdl",
"models/player/custom_player/legacy/ctm_fbi_varianth.mdl",
"models/player/custom_player/legacy/ctm_fbi_variantg.mdl",
"models/player/custom_player/legacy/ctm_fbi_variantb.mdl",
"models/player/custom_player/legacy/tm_leet_variantf.mdl",
"models/player/custom_player/legacy/ctm_fbi_variantf.mdl",
"models/player/custom_player/legacy/ctm_st6_variante.mdl",
"models/player/custom_player/legacy/ctm_st6_variantk.mdl"
};

// default models for replace
char tmodel[128] = "models/player/custom_player/legacy/tm_phoenix_varianta.mdl";
char ctmodel[128] = "models/player/custom_player/legacy/ctm_sas_varianta.mdl";


#define DATA "1.0"

public Plugin myinfo = 
{
	name = "SM Franug No Agents Models",
	author = "Franc1sco franug",
	description = "",
	version = DATA,
	url = "http://steamcommunity.com/id/franug"
};

Handle hSetModel;

public void OnPluginStart()
{
	Handle hGameConf;
	
	hGameConf = LoadGameConfigFile("sdktools.games");
	if(hGameConf == INVALID_HANDLE)
		SetFailState("Gamedata file sdktools.games.txt is missing.");
	int iOffset = GameConfGetOffset(hGameConf, "SetEntityModel");
	CloseHandle(hGameConf);
	if(iOffset == -1)
		SetFailState("Gamedata is missing the \"SetEntityModel\" offset.");
		
	hSetModel = DHookCreate(iOffset, HookType_Entity, ReturnType_Void, ThisPointer_CBaseEntity, SetModel);
	DHookAddParam(hSetModel, HookParamType_CharPtr);
}

public void OnMapStart()
{
	PrecacheModel(tmodel);
	PrecacheModel(ctmodel);
}

public void OnClientPutInServer(int client)
{
	if(IsFakeClient(client)) return;
	
	DHookEntity(hSetModel, true, client);
}

public MRESReturn SetModel(int client, Handle hParams)
{
	// todo block the event instead of keep it and set model after
	CreateTimer(0.0, ReModel, client);
	
	return MRES_Ignored;
}

public Action ReModel(Handle timer, int client)
{
	if (!IsClientInGame(client) || !IsPlayerAlive(client))return;
	
	int team = GetClientTeam(client);
	
	if (team < 2)return;
	
	char model[128];
	GetClientModel(client, model, sizeof(model));
	
	for (int i = 0; i < sizeof(Agents); i++)
	{
		if(StrEqual(model, Agents[i]))
		{
			if (team == CS_TEAM_CT)SetEntityModel(client, ctmodel);
			else SetEntityModel(client, tmodel);
			
			break;
		}			
	}
}
