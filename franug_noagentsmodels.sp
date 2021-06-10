/*  SM Franug No Agents Models
 *
 *  Copyright (C) 2020-2021 Francisco 'Franc1sco' García
 * 
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) 
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT 
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS 
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with 
 * this program. If not, see http://www.gnu.org/licenses/.
 */

#include <sourcemod>
#include <sdktools>
#include <cstrike>

// Valve Agents list by category and team
char CTDistinguished[][][] =
{
	{"Seal Team 6 Soldier | NSWC SEAL",						"models/player/custom_player/legacy/ctm_st6_variante.mdl"},
	{"3rd Commando Company | KSK",							"models/player/custom_player/legacy/ctm_st6_variantk.mdl"},
	{"Operator | FBI SWAT",									"models/player/custom_player/legacy/ctm_fbi_variantf.mdl"},
	{"B Squadron Officer | SAS",							"models/player/custom_player/legacy/ctm_sas_variantf.mdl"},
	{"Chem-Haz Specialist | SWAT",							"models/player/custom_player/legacy/ctm_swat_variantj.mdl"},
	{"Bio-Haz Specialist | SWAT",							"models/player/custom_player/legacy/ctm_swat_varianth.mdl"},
}

char TDistinguished[][][] =
{
	{"Enforcer | Phoenix",									"models/player/custom_player/legacy/tm_phoenix_variantf.mdl"},
	{"Soldier | Phoenix",									"models/player/custom_player/legacy/tm_phoenix_varianth.mdl"},
	{"Ground Rebel  | Elite Crew",							"models/player/custom_player/legacy/tm_leet_variantg.mdl"},
	{"Street Soldier | Phoenix",							"models/player/custom_player/legacy/tm_phoenix_varianti.mdl"},
	{"Dragomir | Sabre Footsoldier",						"models/player/custom_player/legacy/tm_balkan_variantl.mdl"},
}

char CTExceptional[][][] =
{
	{"Markus Delrow | FBI",									"models/player/custom_player/legacy/ctm_fbi_variantg.mdl"},
	{"Buckshot | NSWC SEAL",								"models/player/custom_player/legacy/ctm_st6_variantg.mdl"},
	{"John 'Van Healen' Kask | SWAT",						"models/player/custom_player/legacy/ctm_swat_variantg.mdl"},
	{"Sergeant Bombson | SWAT",								"models/player/custom_player/legacy/ctm_swat_varianti.mdl"},
	{"'Blueberries' Buckshot | NSWC SEAL",					"models/player/custom_player/legacy/ctm_st6_variantj.mdl"},
}

char TExceptional[][][] =
{
	{"Maximus | Sabre",										"models/player/custom_player/legacy/tm_balkan_varianti.mdl"},
	{"Osiris | Elite Crew",									"models/player/custom_player/legacy/tm_leet_varianth.mdl"},
	{"Slingshot | Phoenix",									"models/player/custom_player/legacy/tm_phoenix_variantg.mdl"},
	{"Dragomir | Sabre",									"models/player/custom_player/legacy/tm_balkan_variantf.mdl"},
	{"Getaway Sally | The Professionals",					"models/player/custom_player/legacy/tm_professional_varj.mdl"},
	{"Little Kev | The Professionals",						"models/player/custom_player/legacy/tm_professional_varh.mdl"},
}

char CTSuperior[][][] =
{
	{"Michael Syfers | FBI Sniper",							"models/player/custom_player/legacy/ctm_fbi_varianth.mdl"},
	{"'Two Times' McCoy | USAF TACP",						"models/player/custom_player/legacy/ctm_st6_variantm.mdl"},
	{"1st Lieutenant Farlow | SWAT",						"models/player/custom_player/legacy/ctm_swat_variantf.mdl"},
	{"'Two Times' McCoy | TACP Cavalry",					"models/player/custom_player/legacy/ctm_st6_variantl.mdl"},
}

char TSuperior[][][] =
{
	{"Blackwolf | Sabre",									"models/player/custom_player/legacy/tm_balkan_variantj.mdl"},
	{"Prof. Shahmat | Elite Crew",							"models/player/custom_player/legacy/tm_leet_varianti.mdl"},
	{"Rezan The Ready | Sabre",								"models/player/custom_player/legacy/tm_balkan_variantg.mdl"},
	{"Number K | The Professionals",						"models/player/custom_player/legacy/tm_professional_vari.mdl"},
	{"Safecracker Voltzmann | The Professionals",			"models/player/custom_player/legacy/tm_professional_varg.mdl"},
	{"Rezan the Redshirt | Sabre",							"models/player/custom_player/legacy/tm_balkan_variantk.mdl"},
}

char CTMaster[][][] =
{
	{"Lt. Commander Ricksaw | NSWC SEAL",					"models/player/custom_player/legacy/ctm_st6_varianti.mdl"},
	{"Special Agent Ava | FBI",								"models/player/custom_player/legacy/ctm_fbi_variantb.mdl"},
	{"Cmdr. Mae 'Dead Cold' Jamison | SWAT",				"models/player/custom_player/legacy/ctm_swat_variante.mdl"},
}

char TMaster[][][] =
{
	{"'The Doctor' Romanov | Sabre",						"models/player/custom_player/legacy/tm_balkan_varianth.mdl"},
	{"The Elite Mr. Muhlik | Elite Crew",					"models/player/custom_player/legacy/tm_leet_variantf.mdl"},
	{"Sir Bloody Miami Darryl | The Professionals",			"models/player/custom_player/legacy/tm_professional_varf.mdl"},
	{"Sir Bloody Silent Darryl | The Professionals",		"models/player/custom_player/legacy/tm_professional_varf1.mdl"},
	{"Sir Bloody Skullhead Darryl | The Professionals",		"models/player/custom_player/legacy/tm_professional_varf2.mdl"},
	{"Sir Bloody Darryl Royale | The Professionals",		"models/player/custom_player/legacy/tm_professional_varf3.mdl"},
	{"Sir Bloody Loudmouth Darryl | The Professionals",		"models/player/custom_player/legacy/tm_professional_varf4.mdl"},
}

// default models for replace
char tmodel[128] = "models/player/custom_player/legacy/tm_phoenix_varianta.mdl";
char ctmodel[128] = "models/player/custom_player/legacy/ctm_sas_varianta.mdl";


#define DATA "3.0"

public Plugin myinfo = 
{
	name = "SM Franug No Agents Models",
	author = "Franc1sco franug",
	description = "",
	version = DATA,
	url = "http://steamcommunity.com/id/franug"
};

ConVar cv_ct, cv_tt, cv_time;
char g_ctmodel[128], g_ttmodel[128];
float g_time;

Handle timers[MAXPLAYERS];

public void OnPluginStart()
{
	HookEvent("player_spawn", Event_PlayerSpawn);
	
	cv_ct = CreateConVar("sm_noagents_ctmodel", "models/player/custom_player/legacy/ctm_sas_varianta.mdl", "Set the default ct models for apply to people that have a agent skin");
	cv_tt = CreateConVar("sm_noagents_ttmodel", "models/player/custom_player/legacy/tm_phoenix_varianta.mdl", "Set the default tt models for apply to people that have a agent skin");
	
	cv_time = CreateConVar("sm_noagents_timer", "1.2", "Timer on spawn for apply filter of no agents");
	
	HookConVarChange(cv_ct, CVarChanged);
	HookConVarChange(cv_tt, CVarChanged);
	HookConVarChange(cv_time, CVarChanged);
	
	GetConVarString(cv_ct, g_ctmodel, 128);
	GetConVarString(cv_tt, g_ttmodel, 128);
	g_time = GetConVarFloat(cv_time);
}

public void CVarChanged(ConVar hConvar, char[] oldV, char[] newV)
{
	if(cv_ct == hConvar)
	{
		strcopy(g_ctmodel, 128, newV);
		if(!IsModelPrecached(g_ctmodel))
			PrecacheModel(g_ctmodel);
	}
	else if(cv_tt == hConvar)
	{
		strcopy(g_ttmodel, 128, newV);
		if(!IsModelPrecached(g_ttmodel))
			PrecacheModel(g_ttmodel);
	}
}

public void OnClientDisconnect(int client)
{
	if(timers[client] != null)
		KillTimer(timers[client]);
		
	timers[client] = null;
}

public void OnMapStart()
{
	PrecacheModel(g_ttmodel);
	
	PrecacheModel(g_ctmodel);
}

public Action Event_PlayerSpawn(Handle event, char[] name, bool dontBroadcast)
{	
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if (IsFakeClient(client))return;
	
	if(timers[client] != null)
		KillTimer(timers[client]);
		
	timers[client] = CreateTimer(g_time, ReModel, client);
}

public Action ReModel(Handle timer, int client)
{
	timers[client] = null;
	
	if (!IsClientInGame(client) || !IsPlayerAlive(client))return;
	
	char model[128];
	GetClientModel(client, model, sizeof(model));
	
	if(StrContains(model, "models/player/custom_player/legacy/") == -1) // player use a custom model by other plugin
		return;
	
	int team = GetClientTeam(client);
	
	if (team < 2)return;
	
	if (team == CS_TEAM_CT && isAgentModelCT(model))SetEntityModel(client, ctmodel);
	else if (team == CS_TEAM_T && isAgentModelT(model)) SetEntityModel(client, tmodel);
	
}

bool isAgentModelCT(char model[128])
{
	for (int i = 0; i < sizeof(CTDistinguished); i++)
	{
		if (StrEqual(CTDistinguished[i][1], model))return true;
	}
	
	for (int i = 0; i < sizeof(CTExceptional); i++)
	{
		if (StrEqual(CTExceptional[i][1], model))return true;
	}
	
	for (int i = 0; i < sizeof(CTSuperior); i++)
	{
		if (StrEqual(CTSuperior[i][1], model))return true;
	}
	
	for (int i = 0; i < sizeof(CTMaster); i++)
	{
		if (StrEqual(CTMaster[i][1], model))return true;
	}
	
	return false;
}

bool isAgentModelT(char model[128])
{
	for (int i = 0; i < sizeof(TDistinguished); i++)
	{
		if (StrEqual(TDistinguished[i][1], model))return true;
	}
	for (int i = 0; i < sizeof(TExceptional); i++)
	{
		if (StrEqual(TExceptional[i][1], model))return true;
	}
	for (int i = 0; i < sizeof(TSuperior); i++)
	{
		if (StrEqual(TSuperior[i][1], model))return true;
	}
	for (int i = 0; i < sizeof(TMaster); i++)
	{
		if (StrEqual(TMaster[i][1], model))return true;
	}
	
	return false;
}
