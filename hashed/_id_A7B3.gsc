// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_413D( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "rule":
            var_2 = level._id_7671[var_1]._id_2FCD;
            break;
        case "game":
            var_2 = level._id_3C00[var_1]._id_2FCD;
            break;
        case "team":
            var_2 = level._id_91FE[var_1]._id_2FCD;
            break;
        case "player":
            var_2 = level._id_6D71[var_1]._id_2FCD;
            break;
        case "class":
            var_2 = level._id_1E40[var_1]._id_2FCD;
            break;
        case "weapon":
            var_2 = level._id_A2E9[var_1]._id_2FCD;
            break;
        case "hardpoint":
            var_2 = level._id_46CB[var_1]._id_2FCD;
            break;
        case "hud":
            var_2 = level._id_4AFC[var_1]._id_2FCD;
            break;
        default:
            var_2 = undefined;
            break;
    }

    var_3 = getdvarint( var_2 );
    return var_3;
}

_id_413C( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "rule":
            var_2 = level._id_7671[var_1]._id_2FCD;
            break;
        case "game":
            var_2 = level._id_3C00[var_1]._id_2FCD;
            break;
        case "team":
            var_2 = level._id_91FE[var_1]._id_2FCD;
            break;
        case "player":
            var_2 = level._id_6D71[var_1]._id_2FCD;
            break;
        case "class":
            var_2 = level._id_1E40[var_1]._id_2FCD;
            break;
        case "weapon":
            var_2 = level._id_A2E9[var_1]._id_2FCD;
            break;
        case "hardpoint":
            var_2 = level._id_46CB[var_1]._id_2FCD;
            break;
        case "hud":
            var_2 = level._id_4AFC[var_1]._id_2FCD;
            break;
        default:
            var_2 = undefined;
            break;
    }

    return var_2;
}

_id_413F( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "rule":
            var_2 = level._id_7671[var_1]._id_9C4B;
            break;
        case "game":
            var_2 = level._id_3C00[var_1]._id_9C4B;
            break;
        case "team":
            var_2 = level._id_91FE[var_1]._id_9C4B;
            break;
        case "player":
            var_2 = level._id_6D71[var_1]._id_9C4B;
            break;
        case "class":
            var_2 = level._id_1E40[var_1]._id_9C4B;
            break;
        case "weapon":
            var_2 = level._id_A2E9[var_1]._id_9C4B;
            break;
        case "hardpoint":
            var_2 = level._id_46CB[var_1]._id_9C4B;
            break;
        case "hud":
            var_2 = level._id_4AFC[var_1]._id_9C4B;
            break;
        default:
            var_2 = undefined;
            break;
    }

    return var_2;
}

_id_413E( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "rule":
            var_2 = level._id_7671[var_1]._id_5609;
            break;
        case "game":
            var_2 = level._id_3C00[var_1]._id_5609;
            break;
        case "team":
            var_2 = level._id_91FE[var_1]._id_5609;
            break;
        case "player":
            var_2 = level._id_6D71[var_1]._id_5609;
            break;
        case "class":
            var_2 = level._id_1E40[var_1]._id_5609;
            break;
        case "weapon":
            var_2 = level._id_A2E9[var_1]._id_5609;
            break;
        case "hardpoint":
            var_2 = level._id_46CB[var_1]._id_5609;
            break;
        case "hud":
            var_2 = level._id_4AFC[var_1]._id_5609;
            break;
        default:
            var_2 = undefined;
            break;
    }

    return var_2;
}

_id_8034( var_0, var_1, var_2 )
{
    switch ( var_0 )
    {
        case "rule":
            var_3 = level._id_7671[var_1]._id_2FCD;
            break;
        case "game":
            var_3 = level._id_3C00[var_1]._id_2FCD;
            break;
        case "team":
            var_3 = level._id_91FE[var_1]._id_2FCD;
            break;
        case "player":
            var_3 = level._id_6D71[var_1]._id_2FCD;
            break;
        case "class":
            var_3 = level._id_1E40[var_1]._id_2FCD;
            break;
        case "weapon":
            var_3 = level._id_A2E9[var_1]._id_2FCD;
            break;
        case "hardpoint":
            var_3 = level._id_46CB[var_1]._id_2FCD;
            break;
        case "hud":
            var_3 = level._id_4AFC[var_1]._id_2FCD;
            break;
        default:
            var_3 = undefined;
            break;
    }

    setdvar( var_3, var_2 );
}

_id_8033( var_0, var_1, var_2 )
{
    switch ( var_0 )
    {
        case "rule":
            level._id_7671[var_1]._id_5609 = var_2;
            break;
        case "game":
            level._id_3C00[var_1]._id_5609 = var_2;
            break;
        case "team":
            level._id_91FE[var_1]._id_5609 = var_2;
            break;
        case "player":
            level._id_6D71[var_1]._id_5609 = var_2;
            break;
        case "class":
            level._id_1E40[var_1]._id_5609 = var_2;
            break;
        case "weapon":
            level._id_A2E9[var_1]._id_5609 = var_2;
            break;
        case "hardpoint":
            level._id_46CB[var_1]._id_5609 = var_2;
            break;
        case "hud":
            level._id_4AFC[var_1]._id_5609 = var_2;
            break;
        default:
            break;
    }
}

_id_72F7( var_0, var_1, var_2, var_3 )
{
    if ( isstring( var_3 ) )
        var_3 = getdvar( var_2, var_3 );
    else
        var_3 = getdvarint( var_2, var_3 );

    switch ( var_0 )
    {
        case "rule":
            if ( !isdefined( level._id_7671[var_1] ) )
                level._id_7671[var_1] = spawnstruct();

            level._id_7671[var_1]._id_9C4B = var_3;
            level._id_7671[var_1]._id_5609 = var_3;
            level._id_7671[var_1]._id_2FCD = var_2;
            break;
        case "game":
            if ( !isdefined( level._id_3C00[var_1] ) )
                level._id_3C00[var_1] = spawnstruct();

            level._id_3C00[var_1]._id_9C4B = var_3;
            level._id_3C00[var_1]._id_5609 = var_3;
            level._id_3C00[var_1]._id_2FCD = var_2;
            break;
        case "team":
            if ( !isdefined( level._id_91FE[var_1] ) )
                level._id_91FE[var_1] = spawnstruct();

            level._id_91FE[var_1]._id_9C4B = var_3;
            level._id_91FE[var_1]._id_5609 = var_3;
            level._id_91FE[var_1]._id_2FCD = var_2;
            break;
        case "player":
            if ( !isdefined( level._id_6D71[var_1] ) )
                level._id_6D71[var_1] = spawnstruct();

            level._id_6D71[var_1]._id_9C4B = var_3;
            level._id_6D71[var_1]._id_5609 = var_3;
            level._id_6D71[var_1]._id_2FCD = var_2;
            break;
        case "class":
            if ( !isdefined( level._id_1E40[var_1] ) )
                level._id_1E40[var_1] = spawnstruct();

            level._id_1E40[var_1]._id_9C4B = var_3;
            level._id_1E40[var_1]._id_5609 = var_3;
            level._id_1E40[var_1]._id_2FCD = var_2;
            break;
        case "weapon":
            if ( !isdefined( level._id_A2E9[var_1] ) )
                level._id_A2E9[var_1] = spawnstruct();

            level._id_A2E9[var_1]._id_9C4B = var_3;
            level._id_A2E9[var_1]._id_5609 = var_3;
            level._id_A2E9[var_1]._id_2FCD = var_2;
            break;
        case "hardpoint":
            if ( !isdefined( level._id_46CB[var_1] ) )
                level._id_46CB[var_1] = spawnstruct();

            level._id_46CB[var_1]._id_9C4B = var_3;
            level._id_46CB[var_1]._id_5609 = var_3;
            level._id_46CB[var_1]._id_2FCD = var_2;
            break;
        case "hud":
            if ( !isdefined( level._id_4AFC[var_1] ) )
                level._id_4AFC[var_1] = spawnstruct();

            level._id_4AFC[var_1]._id_9C4B = var_3;
            level._id_4AFC[var_1]._id_5609 = var_3;
            level._id_4AFC[var_1]._id_2FCD = var_2;
            break;
    }
}

_id_0209()
{
    level._id_1F12 = [];
    level._id_99D8 = 1;
    level._id_7671 = [];
    level._id_3C00 = [];
    level._id_91FE = [];
    level._id_6D71 = [];
    level._id_1E40 = [];
    level._id_A2E9 = [];
    level._id_46CB = [];
    level._id_4AFC = [];

    if ( level._id_2153 )
    {
        _id_72F7( "game", "graceperiod", "scr_game_graceperiod", 15 );
        _id_72F7( "game", "graceperiod_ds", "scr_game_graceperiod_ds", 20 );
    }
    else
    {
        _id_72F7( "game", "playerwaittime", "scr_game_playerwaittime", 15 );
        _id_72F7( "game", "playerwaittime_ds", "scr_game_playerwaittime_ds", 20 );
    }

    _id_72F7( "game", "matchstarttime", "scr_game_matchstarttime", 15 );
    _id_72F7( "game", "roundstarttime", "scr_game_roundstarttime", 5 );
    _id_72F7( "game", "onlyheadshots", "scr_game_onlyheadshots", 0 );
    _id_72F7( "game", "allowkillcam", "scr_game_allowkillcam", 1 );
    _id_72F7( "game", "spectatetype", "scr_game_spectatetype", 2 );
    _id_72F7( "game", "lockspectatepov", "scr_game_lockspectatorpov", 0 );
    _id_72F7( "game", "deathpointloss", "scr_game_deathpointloss", 0 );
    _id_72F7( "game", "suicidepointloss", "scr_game_suicidepointloss", 0 );
    _id_72F7( "game", "suicidespawndelay", "scr_game_suicidespawndelay", 0 );
    _id_72F7( "team", "teamkillpointloss", "scr_team_teamkillpointloss", 0 );
    _id_72F7( "team", "fftype", "scr_team_fftype", 0 );
    _id_72F7( "team", "teamkillspawndelay", "scr_team_teamkillspawndelay", 20 );
    _id_72F7( "team", "teamkillkicklimit", "scr_team_teamkillkicklimit", 0 );
    _id_72F7( "player", "maxhealth", "scr_player_maxhealth", 100 );
    _id_72F7( "player", "healthregentime", "scr_player_healthregentime", 5 );
    _id_72F7( "player", "forcerespawn", "scr_player_forcerespawn", 1 );
    _id_72F7( "weapon", "allowfrag", "scr_weapon_allowfrags", 1 );
    _id_72F7( "weapon", "allowsmoke", "scr_weapon_allowsmoke", 1 );
    _id_72F7( "weapon", "allowflash", "scr_weapon_allowflash", 1 );
    _id_72F7( "weapon", "allowc4", "scr_weapon_allowc4", 1 );
    _id_72F7( "weapon", "allowclaymores", "scr_weapon_allowclaymores", 1 );
    _id_72F7( "weapon", "allowrpgs", "scr_weapon_allowrpgs", 1 );
    _id_72F7( "weapon", "allowmines", "scr_weapon_allowmines", 1 );
    _id_72F7( "hardpoint", "allowartillery", "scr_hardpoint_allowartillery", 1 );
    _id_72F7( "hardpoint", "allowuav", "scr_hardpoint_allowuav", 1 );
    _id_72F7( "hardpoint", "allowsupply", "scr_hardpoint_allowsupply", 1 );
    _id_72F7( "hardpoint", "allowhelicopter", "scr_hardpoint_allowhelicopter", 1 );
}
