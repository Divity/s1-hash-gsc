// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

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
        _id_A75A::_id_72F4( level._id_01B5, 3, 0, 9 );
        _id_A75A::_id_72F6( level._id_01B5, 2.5 );
        _id_A75A::_id_72F5( level._id_01B5, 1 );
        _id_A75A::_id_72F3( level._id_01B5, 0 );
        _id_A75A::_id_72FB( level._id_01B5, 4 );
        _id_A75A::_id_72F1( level._id_01B5, 1 );
        _id_A75A::_id_72EC( level._id_01B5, 0 );
        level._id_59E3 = 0;
        level._id_59E8 = 0;
    }

    level._id_62F5 = 1;
    level._id_91E4 = 1;
    level._id_64D7 = maps\mp\gametypes\common_sd_sr::_id_64D7;
    level._id_64E9 = ::_id_64E9;
    level._id_40D0 = ::_id_40D0;
    level._id_64E6 = ::_id_64E6;
    level._id_64D0 = ::_id_64D0;
    level._id_6463 = maps\mp\gametypes\common_sd_sr::_id_6463;
    level._id_64BD = maps\mp\gametypes\common_sd_sr::_id_64BD;
    level._id_64ED = maps\mp\gametypes\common_sd_sr::_id_64ED;
    level._id_64BC = maps\mp\gametypes\common_sd_sr::_id_64BC;
    level._id_3BF3 = maps\mp\gametypes\common_sd_sr::_id_5178;
    level._id_0AAB = 0;

    if ( level._id_59E3 || level._id_59E8 )
        level._id_5D4E = _id_A783::_id_3BF4;

    game["dialog"]["gametype"] = "sd_intro";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["dialog"]["offense_obj"] = "gbl_destroyobj";
    game["dialog"]["defense_obj"] = "gbl_defendobj";

    if ( _id_A75A::isgrapplinghookgamemode() )
        game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];

    setomnvar( "ui_bomb_timer_endtime", 0 );
}

_id_4DDD()
{
    _id_A75A::_id_7F39();
    var_0 = getmatchrulesdata( "sdData", "roundLength" );
    setdynamicdvar( "scr_sd_timelimit", var_0 );
    _id_A75A::_id_72F6( "sd", var_0 );
    var_1 = getmatchrulesdata( "sdData", "roundSwitch" );
    setdynamicdvar( "scr_sd_roundswitch", var_1 );
    _id_A75A::_id_72F4( "sd", var_1, 0, 9 );
    var_2 = getmatchrulesdata( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_sd_winlimit", var_2 );
    _id_A75A::_id_72FB( "sd", var_2 );
    setdynamicdvar( "scr_sd_bombtimer", getmatchrulesdata( "sdData", "bombTimer" ) );
    setdynamicdvar( "scr_sd_planttime", getmatchrulesdata( "sdData", "plantTime" ) );
    setdynamicdvar( "scr_sd_defusetime", getmatchrulesdata( "sdData", "defuseTime" ) );
    setdynamicdvar( "scr_sd_multibomb", getmatchrulesdata( "sdData", "multiBomb" ) );
    setdynamicdvar( "scr_sd_silentplant", getmatchrulesdata( "sdData", "silentPlant" ) );
    setdynamicdvar( "scr_sd_roundlimit", 0 );
    _id_A75A::_id_72F3( "sd", 0 );
    setdynamicdvar( "scr_sd_scorelimit", 1 );
    _id_A75A::_id_72F5( "sd", 1 );
    setdynamicdvar( "scr_sd_halftime", 0 );
    _id_A75A::_id_72EC( "sd", 0 );
}

_id_64E9()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    getteamplayersalive( "manual_change" );
    level._id_058F["bomb_explosion"] = loadfx( "vfx/explosion/mp_gametype_bomb" );
    level._id_058F["bomb_light_blinking"] = loadfx( "vfx/lights/light_sdbomb_blinking" );
    level._id_058F["bomb_light_planted"] = loadfx( "vfx/lights/light_beacon_sdbomb" );
    _id_A75A::_id_7FBF( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
    _id_A75A::_id_7FBF( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );

    if ( level._id_8A76 )
    {
        _id_A75A::_id_7FBE( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
        _id_A75A::_id_7FBE( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );
    }
    else
    {
        _id_A75A::_id_7FBE( game["attackers"], &"OBJECTIVES_SD_ATTACKER_SCORE" );
        _id_A75A::_id_7FBE( game["defenders"], &"OBJECTIVES_SD_DEFENDER_SCORE" );
    }

    _id_A75A::_id_7FBD( game["attackers"], &"OBJECTIVES_SD_ATTACKER_HINT" );
    _id_A75A::_id_7FBD( game["defenders"], &"OBJECTIVES_SD_DEFENDER_HINT" );
    _id_4E23();
    var_2[0] = "sd";
    var_2[1] = "bombzone";
    var_2[2] = "blocker";
    _id_A78A::main( var_2 );
    thread maps\mp\gametypes\common_sd_sr::_id_9B1A();
    maps\mp\gametypes\common_sd_sr::_id_8011();
    thread maps\mp\gametypes\common_sd_sr::_id_1549();
}

_id_4E23()
{
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    _id_A7AF::_id_0831( "mp_sd_spawn_attacker" );
    _id_A7AF::_id_0831( "mp_sd_spawn_defender" );
    level._id_5983 = _id_A7AF::_id_3777( level._id_89F0, level._id_89ED );
    setmapcenter( level._id_5983 );
}

_id_40D0()
{
    var_0 = "mp_sd_spawn_defender";

    if ( self._id_030D["team"] == game["attackers"] )
        var_0 = "mp_sd_spawn_attacker";

    var_1 = _id_A7AF::_id_40DB( var_0 );
    var_2 = _id_A7AF::_id_40D9( var_1 );
    _id_A7AF::_id_7270( var_2 );
    return var_2;
}

_id_64E6()
{
    var_0 = isdefined( self.isrespawningwithbombcarrierclass ) && self.isrespawningwithbombcarrierclass;

    if ( _id_A75A::_id_510F( self ) )
    {
        self._id_5171 = 0;
        self._id_50EC = 0;

        if ( !var_0 )
        {
            self._id_50C5 = 0;
            self._id_02D6 = 0;
        }
    }

    if ( isplayer( self ) && !var_0 )
    {
        if ( level._id_5FDF && self._id_030D["team"] == game["attackers"] )
            self _meth_82FB( "ui_carrying_bomb", 1 );
        else
            self _meth_82FB( "ui_carrying_bomb", 0 );
    }

    _id_A75A::_id_7F65( 0 );

    if ( isdefined( self._id_030D["plants"] ) )
        _id_A75A::_id_7F65( self._id_030D["plants"] );

    _id_A75A::_id_7F66( 0 );

    if ( isdefined( self._id_030D["defuses"] ) )
        _id_A75A::_id_7F66( self._id_030D["defuses"] );

    self.isrespawningwithbombcarrierclass = undefined;
    level notify( "spawned_player" );
}

_id_64D0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isplayer( self ) )
        self _meth_82FB( "ui_carrying_bomb", 0 );

    thread maps\mp\gametypes\common_sd_sr::_id_1CF1();
}
