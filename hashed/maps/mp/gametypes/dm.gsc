// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_A78D::_id_0209();
    maps\mp\gametypes\_callbacksetup::SetupCallbacks();
    _id_A78D::SetupCallbacks();

    if ( isusingmatchrulesdata() )
    {
        level._id_4DDD = ::_id_4DDD;
        [[ level._id_4DDD ]]();
        level thread _id_A75A::_id_7304();
    }
    else
    {
        _id_A75A::_id_72F6( level._id_01B5, 10 );
        _id_A75A::_id_72F5( level._id_01B5, 30 );
        _id_A75A::_id_72FB( level._id_01B5, 1 );
        _id_A75A::_id_72F3( level._id_01B5, 1 );
        _id_A75A::_id_72F1( level._id_01B5, 0 );
        _id_A75A::_id_72EC( level._id_01B5, 0 );
        _id_A75A::_id_72F5( level._id_01B5, 30 );
        level._id_59E3 = 0;
        level._id_59E8 = 0;
    }

    level._id_64E9 = ::_id_64E9;
    level._id_40D0 = ::_id_40D0;
    level._id_64BC = ::_id_64BC;
    level._id_64D2 = ::_id_64D2;

    if ( level._id_59E3 || level._id_59E8 )
        level._id_5D4E = _id_A783::_id_3BF4;

    setteamscore( "ffa" );
    game["dialog"]["gametype"] = "ffa_intro";
    game["dialog"]["defense_obj"] = "gbl_start";
    game["dialog"]["offense_obj"] = "gbl_start";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    if ( _id_A75A::isgrapplinghookgamemode() )
        game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];
}

_id_4DDD()
{
    _id_A75A::_id_7F39( 1 );
    setdynamicdvar( "scr_dm_winlimit", 1 );
    _id_A75A::_id_72FB( "dm", 1 );
    setdynamicdvar( "scr_dm_roundlimit", 1 );
    _id_A75A::_id_72F3( "dm", 1 );
    setdynamicdvar( "scr_dm_halftime", 0 );
    _id_A75A::_id_72EC( "dm", 0 );
}

_id_64E9()
{
    getteamplayersalive( "auto_change" );
    _id_A75A::_id_7FBF( "allies", &"OBJECTIVES_DM" );
    _id_A75A::_id_7FBF( "axis", &"OBJECTIVES_DM" );

    if ( level._id_8A76 )
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_DM" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_DM" );
    }
    else
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_DM_SCORE" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_DM_SCORE" );
    }

    _id_A75A::_id_7FBD( "allies", &"OBJECTIVES_DM_HINT" );
    _id_A75A::_id_7FBD( "axis", &"OBJECTIVES_DM_HINT" );
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    level._id_8923 = "mp_dm_spawn";
    _id_A7AF::_id_082F( "allies", level._id_8923 );
    _id_A7AF::_id_082F( "axis", level._id_8923 );
    level._id_5983 = _id_A7AF::_id_3777( level._id_89F0, level._id_89ED );
    setmapcenter( level._id_5983 );
    var_0[0] = "dm";
    _id_A78A::main( var_0 );
    level._id_709F = 1;
}

getstartspawnpoints( var_0 )
{
    if ( !isdefined( level.dmstartspawnpoints ) )
        level.dmstartspawnpoints = [];

    if ( !isdefined( level.dmstartspawnpoints[var_0] ) )
    {
        var_1 = _id_A7AF::_id_411D( var_0 );
        level.dmstartspawnpoints[var_0] = [];

        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3._id_039B ) && var_3._id_039B == "start_spawn" )
                level.dmstartspawnpoints[var_0][level.dmstartspawnpoints[var_0].size] = var_3;
        }
    }

    if ( level.dmstartspawnpoints[var_0].size >= level._id_0328.size )
        return level.dmstartspawnpoints[var_0];
    else
        return _id_A7AF::_id_411D( var_0 );
}

_id_40D0()
{
    if ( level._id_4C6A )
    {
        var_0 = getstartspawnpoints( self._id_04A8 );
        var_1 = _id_A7AF::_id_40D6( var_0 );
    }
    else
    {
        var_0 = _id_A7AF::_id_411D( self._id_04A8 );
        var_1 = _id_A7B0::_id_40D3( var_0 );
    }

    _id_A7AF::_id_7270( var_1 );
    return var_1;
}

_id_64BC( var_0, var_1, var_2 )
{
    var_3 = 0;

    foreach ( var_5 in level._id_0328 )
    {
        if ( isdefined( var_5._id_0390 ) && var_5._id_0390 > var_3 )
            var_3 = var_5._id_0390;
    }

    if ( game["state"] == "postgame" && var_1._id_0390 >= var_3 )
        var_1._id_373C = 1;
}

_id_64D2( var_0, var_1, var_2 )
{
    if ( _id_51AA( var_0 ) )
    {
        var_3 = _id_A7AA::_id_40BF( var_0 );
        var_1 _id_A75A::_id_7F65( var_1._id_0169 + var_3 );
        var_1 _id_A78B::_id_9B5D( var_1, var_3 );
        return 1;
    }

    return 0;
}

_id_51AA( var_0 )
{
    switch ( var_0 )
    {
        case "kill":
        case "vulcan_kill":
        case "warbird_kill":
        case "paladin_kill":
        case "missile_strike_kill":
        case "sentry_gun_kill":
        case "strafing_run_kill":
        case "assault_drone_kill":
        case "goliath_kill":
        case "airdrop_trap_kill":
        case "airdrop_kill":
        case "map_killstreak_kill":
            return 1;
    }

    return 0;
}
