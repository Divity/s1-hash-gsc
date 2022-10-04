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

    level._id_0D7B = 1;
    level._id_62F5 = 1;
    level._id_91E4 = 1;
    level._id_611A = 1;
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

    game["dialog"]["gametype"] = "sr_intro";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["dialog"]["offense_obj"] = "obj_destroy";
    game["dialog"]["defense_obj"] = "obj_defend";
    game["dialog"]["lead_lost"] = "null";
    game["dialog"]["lead_tied"] = "null";
    game["dialog"]["lead_taken"] = "null";
    game["dialog"]["kill_confirmed"] = "kc_killconfirmed";
    game["dialog"]["revived"] = "sr_rev";

    if ( _id_A75A::isgrapplinghookgamemode() )
        game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];

    setomnvar( "ui_bomb_timer_endtime", 0 );
    level._id_20E9["vanish"] = loadfx( "fx/impacts/small_snowhit" );
}

_id_4DDD()
{
    _id_A75A::_id_7F39();
    var_0 = getmatchrulesdata( "srData", "roundLength" );
    setdynamicdvar( "scr_sr_timelimit", var_0 );
    _id_A75A::_id_72F6( "sr", var_0 );
    var_1 = getmatchrulesdata( "srData", "roundSwitch" );
    setdynamicdvar( "scr_sr_roundswitch", var_1 );
    _id_A75A::_id_72F4( "sr", var_1, 0, 9 );
    var_2 = getmatchrulesdata( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_sr_winlimit", var_2 );
    _id_A75A::_id_72FB( "sr", var_2 );
    setdynamicdvar( "scr_sr_bombtimer", getmatchrulesdata( "srData", "bombTimer" ) );
    setdynamicdvar( "scr_sr_planttime", getmatchrulesdata( "srData", "plantTime" ) );
    setdynamicdvar( "scr_sr_defusetime", getmatchrulesdata( "srData", "defuseTime" ) );
    setdynamicdvar( "scr_sr_multibomb", getmatchrulesdata( "srData", "multiBomb" ) );
    setdynamicdvar( "scr_sr_silentplant", getmatchrulesdata( "srData", "silentPlant" ) );
    setdynamicdvar( "scr_sr_roundlimit", 0 );
    _id_A75A::_id_72F3( "sr", 0 );
    setdynamicdvar( "scr_sr_scorelimit", 1 );
    _id_A75A::_id_72F5( "sr", 1 );
    setdynamicdvar( "scr_sr_halftime", 0 );
    _id_A75A::_id_72EC( "sr", 0 );
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
    maps\mp\gametypes\common_sd_sr::_id_9B1A();
    level._id_2CDE = [];
    maps\mp\gametypes\common_sd_sr::_id_8011();
    thread maps\mp\gametypes\common_sd_sr::_id_1549();
}

_id_4E23()
{
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    _id_A7AF::_id_0831( "mp_sd_spawn_attacker" );
    _id_A7AF::_id_0831( "mp_sd_spawn_defender" );
    _id_A7AF::_id_082F( "attacker", "mp_tdm_spawn" );
    _id_A7AF::_id_082F( "defender", "mp_tdm_spawn" );
    level._id_5983 = _id_A7AF::_id_3777( level._id_89F0, level._id_89ED );
    setmapcenter( level._id_5983 );
}

_id_40D0()
{
    var_0 = "defender";

    if ( self._id_030D["team"] == game["attackers"] )
        var_0 = "attacker";

    if ( _id_A7AF::_id_84B5() )
    {
        var_1 = _id_A7AF::_id_40DB( "mp_sd_spawn_" + var_0 );
        var_2 = _id_A7AF::_id_40D9( var_1 );
    }
    else
    {
        var_1 = _id_A7AF::_id_411D( var_0 );
        var_2 = _id_A7B0::_id_40D8( var_1 );
    }

    _id_A7AF::_id_7270( var_2 );
    return var_2;
}

_id_64E6()
{
    var_0 = isdefined( self.isrespawningwithbombcarrierclass ) && self.isrespawningwithbombcarrierclass;
    self._id_5171 = 0;
    self._id_50EC = 0;

    if ( !var_0 )
    {
        self._id_50C5 = 0;
        self._id_02D6 = 0;
    }

    if ( isplayer( self ) && !var_0 )
    {
        if ( level._id_5FDF && self._id_030D["team"] == game["attackers"] )
            self _meth_82FB( "ui_carrying_bomb", 1 );
        else
            self _meth_82FB( "ui_carrying_bomb", 0 );
    }

    self.isrespawningwithbombcarrierclass = undefined;
    level notify( "spawned_player" );

    if ( self._id_03BD == "axis" || self._id_03BD == "allies" )
    {
        level notify( "sr_player_joined", self );
        _id_A75A::_id_7F65( 0 );

        if ( isdefined( self._id_030D["plants"] ) )
            _id_A75A::_id_7F65( self._id_030D["plants"] );

        _id_A75A::_id_7F66( 0 );

        if ( isdefined( self._id_030D["defuses"] ) )
            _id_A75A::_id_7F66( self._id_030D["defuses"] );

        self._id_004F = 0;

        if ( isdefined( self._id_030D["denied"] ) )
            self._id_004F = self._id_030D["denied"];
    }
}

_id_84A9( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( self._id_9078 ) )
        return 0;

    if ( isdefined( self._id_A1C8 ) )
        return 0;

    if ( isdefined( var_1 ) && var_1 == self )
        return 0;

    if ( level._id_91E4 && isdefined( var_1 ) && isdefined( var_1._id_04A8 ) && var_1._id_04A8 == self._id_04A8 )
        return 0;

    if ( isdefined( var_1 ) && !isdefined( var_1._id_04A8 ) && ( var_1._id_00AB == "trigger_hurt" || var_1._id_00AB == "worldspawn" ) )
        return 0;

    return 1;
}

_id_64D0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isplayer( self ) )
        self _meth_82FB( "ui_carrying_bomb", 0 );

    if ( !_id_A75A::_id_3BDB( "prematch_done" ) )
        _id_A7A7::_id_5A5F();
    else
    {
        var_10 = _id_84A9( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( var_10 )
            var_10 = var_10 && !_id_A75A::_id_5186( self );

        if ( var_10 )
            var_10 = var_10 && !_id_A7A7::_id_5A5F();

        if ( var_10 )
            level thread _id_8998( self, var_1 );
    }

    thread maps\mp\gametypes\common_sd_sr::_id_1CF1();
}

_id_8998( var_0, var_1 )
{
    if ( isagent( var_0 ) )
        return;

    if ( isagent( var_1 ) )
        var_1 = var_1._id_02E9;

    var_2 = var_0._id_02E6 + ( 0, 0, 14 );

    if ( isdefined( level._id_2CDE[var_0._id_444D] ) )
    {
        playfx( level._id_20E9["vanish"], level._id_2CDE[var_0._id_444D]._id_24C8 );
        level._id_2CDE[var_0._id_444D] notify( "reset" );
    }
    else
    {
        var_3[0] = spawn( "script_model", ( 0, 0, 0 ) );
        var_3[0] _meth_8382( var_0 );
        var_3[0] _meth_80B1( "prop_dogtags_future_enemy_animated" );
        var_3[0] _meth_856C( 1 );
        var_3[1] = spawn( "script_model", ( 0, 0, 0 ) );
        var_3[1] _meth_8382( var_0 );
        var_3[1] _meth_80B1( "prop_dogtags_future_friend_animated" );
        var_3[1] _meth_856C( 1 );
        var_4 = spawn( "trigger_radius", ( 0, 0, 0 ), 0, 32, 32 );
        level._id_2CDE[var_0._id_444D] = _id_A78A::_id_244C( "any", var_4, var_3, ( 0, 0, 16 ) );
        _id_A7A2::_id_2858( level._id_2CDE[var_0._id_444D]._id_6313["allies"] );
        _id_A7A2::_id_2858( level._id_2CDE[var_0._id_444D]._id_6313["axis"] );
        _id_A7A2::_id_2858( level._id_2CDE[var_0._id_444D]._id_6313["mlg"] );
        level._id_2CDE[var_0._id_444D] _id_A78A::_id_8346( 0 );
        level._id_2CDE[var_0._id_444D]._id_64F5 = ::_id_64F5;
        level._id_2CDE[var_0._id_444D]._id_9DFE = var_0;
        level._id_2CDE[var_0._id_444D]._id_9E01 = var_0._id_04A8;
        level thread _id_1EF9( var_0 );
        var_0 thread _id_9103( level._id_2CDE[var_0._id_444D] );
    }

    level._id_2CDE[var_0._id_444D]._id_24C8 = var_2;
    level._id_2CDE[var_0._id_444D]._id_04C6._id_02E6 = var_2;
    level._id_2CDE[var_0._id_444D]._id_9E93[0]._id_02E6 = var_2;
    level._id_2CDE[var_0._id_444D]._id_9E93[1]._id_02E6 = var_2;
    level._id_2CDE[var_0._id_444D] _id_A78A::_id_4DE0();
    level._id_2CDE[var_0._id_444D] _id_A78A::_id_0AB2( "any" );
    level._id_2CDE[var_0._id_444D]._id_9E93[0] thread _id_852F( level._id_2CDE[var_0._id_444D], _id_A75A::_id_4065( var_0._id_04A8 ) );
    level._id_2CDE[var_0._id_444D]._id_9E93[1] thread _id_852F( level._id_2CDE[var_0._id_444D], var_0._id_04A8 );
    level._id_2CDE[var_0._id_444D]._id_0055 = var_1;

    if ( var_0._id_04A8 == "axis" )
    {
        objective_icon( level._id_2CDE[var_0._id_444D]._id_6303, "waypoint_dogtags_friendlys" );
        objective_team( level._id_2CDE[var_0._id_444D]._id_6303, "axis" );
        objective_icon( level._id_2CDE[var_0._id_444D]._id_6302, "waypoint_dogtags" );
        objective_team( level._id_2CDE[var_0._id_444D]._id_6302, "allies" );
    }
    else
    {
        objective_icon( level._id_2CDE[var_0._id_444D]._id_6302, "waypoint_dogtags_friendlys" );
        objective_team( level._id_2CDE[var_0._id_444D]._id_6302, "allies" );
        objective_icon( level._id_2CDE[var_0._id_444D]._id_6303, "waypoint_dogtags" );
        objective_team( level._id_2CDE[var_0._id_444D]._id_6303, "axis" );
    }

    objective_position( level._id_2CDE[var_0._id_444D]._id_6302, var_2 );
    objective_position( level._id_2CDE[var_0._id_444D]._id_6303, var_2 );
    objective_state( level._id_2CDE[var_0._id_444D]._id_6302, "active" );
    objective_state( level._id_2CDE[var_0._id_444D]._id_6303, "active" );
    playsoundatpos( var_2, "mp_killconfirm_tags_drop" );
    level notify( "sr_player_killed", var_0 );
    var_0._id_90D8 = 1;
    var_0._id_02D6 = 3;
    level._id_2CDE[var_0._id_444D]._id_9E93[0] _meth_8279( "mp_dogtag_spin" );
    level._id_2CDE[var_0._id_444D]._id_9E93[1] _meth_8279( "mp_dogtag_spin" );
}

_id_852F( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "reset" );
    self _meth_8054();

    foreach ( var_3 in level._id_0328 )
    {
        if ( var_3._id_04A8 == var_1 )
            self _meth_8007( var_3 );

        if ( var_3._id_04A8 == "spectator" && var_1 == "allies" )
            self _meth_8007( var_3 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self _meth_8054();

        foreach ( var_3 in level._id_0328 )
        {
            if ( var_3._id_04A8 == var_1 )
                self _meth_8007( var_3 );

            if ( var_3._id_04A8 == "spectator" && var_1 == "allies" )
                self _meth_8007( var_3 );
        }
    }
}

_id_8AD8()
{
    _id_A7A7::_id_4C39( self._id_04A8 );
    self._id_0B00 = 1;
    thread _id_A039();
}

_id_A039()
{
    self endon( "started_spawnPlayer" );

    for (;;)
    {
        wait 0.05;

        if ( isdefined( self ) && ( self._id_03BC == "spectator" || !_id_A75A::_id_5186( self ) ) )
        {
            self._id_030D["lives"] = 1;
            _id_A7A7::_id_8992();
            continue;
        }

        return;
    }
}

_id_64F5( var_0 )
{
    if ( isdefined( var_0._id_02E9 ) )
        var_0 = var_0._id_02E9;

    if ( var_0._id_030D["team"] == self._id_9E01 )
    {
        self._id_04C6 _meth_809A( "mp_snd_ally_revive" );
        var_0 thread _id_A72E::_id_74FC( self._id_9DFE );

        if ( isdefined( self._id_9DFE ) )
        {
            level notify( "sr_player_respawned", self._id_9DFE );
            self._id_9DFE _id_A75A::_id_5652( "revived" );
        }

        if ( isdefined( self._id_9DFE ) )
        {
            if ( !level._id_3BD8 )
                self._id_9DFE thread _id_8AD8();
        }

        var_0 _id_A7A0::_id_6FF3( "ch_rescuer" );

        if ( !isdefined( var_0._id_740E ) )
            var_0._id_740E = [];

        var_0._id_740E[self._id_9DFE._id_444D] = 1;

        if ( var_0._id_740E.size == 4 )
            var_0 _id_A7A0::_id_6FF3( "ch_helpme" );
    }
    else
    {
        self._id_04C6 _meth_809A( "mp_killconfirm_tags_pickup" );
        var_0 thread _id_A72E::_id_305C();

        if ( isdefined( self._id_9DFE ) )
        {
            if ( !level._id_3BD8 )
            {
                self._id_9DFE _id_A75A::_id_7F9F( "spawn_info", game["strings"]["spawn_next_round"] );
                self._id_9DFE thread _id_A7A7::_id_73DB( 3.0 );
            }

            self._id_9DFE._id_90D8 = undefined;
        }

        var_0 _id_A75A::_id_5652( "kill_confirmed" );
        var_0 _id_A7A0::_id_6FF3( "ch_hideandseek" );
    }

    self._id_9DFE._id_02D6 = 0;
    level thread _id_A72E::_id_5ECF( var_0 );
    _id_745E();
}

_id_745E()
{
    self._id_0055 = undefined;
    self notify( "reset" );
    self._id_9E93[0] _meth_8054();
    self._id_9E93[1] _meth_8054();
    self._id_24C8 = ( 0, 0, 1000 );
    self._id_04C6._id_02E6 = ( 0, 0, 1000 );
    self._id_9E93[0]._id_02E6 = ( 0, 0, 1000 );
    self._id_9E93[1]._id_02E6 = ( 0, 0, 1000 );
    _id_A78A::_id_0AB2( "none" );
    objective_state( self._id_6302, "invisible" );
    objective_state( self._id_6303, "invisible" );
}

_id_9103( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        var_0._id_9E01 = self._id_030D["team"];
        var_0 _id_745E();
    }
}

_id_1EF9( var_0 )
{
    level endon( "game_ended" );
    var_1 = var_0._id_444D;
    var_0 waittill( "disconnect" );

    if ( isdefined( level._id_2CDE[var_1] ) )
    {
        level._id_2CDE[var_1] _id_A78A::_id_0AB2( "none" );
        playfx( level._id_20E9["vanish"], level._id_2CDE[var_1]._id_24C8 );
        level._id_2CDE[var_1] notify( "reset" );
        wait 0.05;

        if ( isdefined( level._id_2CDE[var_1] ) )
        {
            objective_delete( level._id_2CDE[var_1]._id_6302 );
            objective_delete( level._id_2CDE[var_1]._id_6302 );
            level._id_2CDE[var_1]._id_04C6 delete();

            for ( var_2 = 0; var_2 < level._id_2CDE[var_1]._id_9E93.size; var_2++ )
                level._id_2CDE[var_1]._id_9E93[var_2] delete();

            level._id_2CDE[var_1] notify( "deleted" );
            level._id_2CDE[var_1] = undefined;
        }
    }
}
