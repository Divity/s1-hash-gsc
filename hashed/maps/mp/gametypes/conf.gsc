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
        _id_A75A::_id_72F4( level._id_01B5, 0, 0, 9 );
        _id_A75A::_id_72F6( level._id_01B5, 10 );
        _id_A75A::_id_72F5( level._id_01B5, 65 );
        _id_A75A::_id_72F3( level._id_01B5, 1 );
        _id_A75A::_id_72FB( level._id_01B5, 1 );
        _id_A75A::_id_72F1( level._id_01B5, 0 );
        _id_A75A::_id_72EC( level._id_01B5, 0 );
        level._id_59E3 = 0;
        level._id_59E8 = 0;
    }

    level._id_91E4 = 1;
    level._id_64E9 = ::_id_64E9;
    level._id_40D0 = ::_id_40D0;
    level._id_64BC = ::_id_64BC;

    if ( level._id_59E3 || level._id_59E8 )
        level._id_5D4E = _id_A783::_id_3BF4;

    game["dialog"]["gametype"] = "kc_intro";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["dialog"]["kill_confirmed"] = "kc_killconfirmed";
    game["dialog"]["kill_denied"] = "kc_killdenied";
    game["dialog"]["kill_lost"] = "kc_killlost";
    game["dialog"]["defense_obj"] = "kc_start";
    game["dialog"]["offense_obj"] = "kc_start";

    if ( _id_A75A::isgrapplinghookgamemode() )
        game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];

    level._id_20E9["vanish"] = loadfx( "vfx/unique/dogtag_vanish" );
}

_id_4DDD()
{
    _id_A75A::_id_7F39();
    setdynamicdvar( "scr_conf_roundswitch", 0 );
    _id_A75A::_id_72F4( "conf", 0, 0, 9 );
    setdynamicdvar( "scr_conf_roundlimit", 1 );
    _id_A75A::_id_72F3( "conf", 1 );
    setdynamicdvar( "scr_conf_winlimit", 1 );
    _id_A75A::_id_72FB( "conf", 1 );
    setdynamicdvar( "scr_conf_halftime", 0 );
    _id_A75A::_id_72EC( "conf", 0 );
}

_id_64E9()
{
    getteamplayersalive( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    _id_A75A::_id_7FBF( "allies", &"OBJECTIVES_CONF" );
    _id_A75A::_id_7FBF( "axis", &"OBJECTIVES_CONF" );

    if ( level._id_8A76 )
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_CONF" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_CONF" );
    }
    else
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_CONF_SCORE" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_CONF_SCORE" );
    }

    _id_A75A::_id_7FBD( "allies", &"OBJECTIVES_CONF_HINT" );
    _id_A75A::_id_7FBD( "axis", &"OBJECTIVES_CONF_HINT" );
    _id_4E23();
    level._id_2CDE = [];
    var_2[0] = level._id_01B5;
    _id_A78A::main( var_2 );
}

_id_4E23()
{
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    _id_A7AF::_id_0831( "mp_tdm_spawn_allies_start" );
    _id_A7AF::_id_0831( "mp_tdm_spawn_axis_start" );
    level._id_8923 = "mp_tdm_spawn";
    _id_A7AF::_id_082F( "allies", level._id_8923 );
    _id_A7AF::_id_082F( "axis", level._id_8923 );
    level._id_5983 = _id_A7AF::_id_3777( level._id_89F0, level._id_89ED );
    setmapcenter( level._id_5983 );
}

_id_40D0()
{
    var_0 = self._id_030D["team"];

    if ( game["switchedsides"] )
        var_0 = _id_A75A::_id_4065( var_0 );

    if ( level._id_9C0C && level._id_4C6A )
    {
        var_1 = _id_A7AF::_id_40DB( "mp_tdm_spawn_" + var_0 + "_start" );
        var_2 = _id_A7AF::_id_40D9( var_1 );
    }
    else
    {
        var_1 = _id_A7AF::_id_411D( var_0 );
        var_2 = _id_A7B0::_id_40D1( var_1 );
    }

    _id_A7AF::_id_7270( var_2 );
    return var_2;
}

_id_64BC( var_0, var_1, var_2 )
{
    level thread _id_8998( var_0, var_1 );

    if ( game["state"] == "postgame" && game["teamScores"][var_1._id_04A8] > game["teamScores"][level._id_65B0[var_1._id_04A8]] )
        var_1._id_373C = 1;
}

_id_8998( var_0, var_1 )
{
    var_2 = var_0._id_030D["team"];

    if ( isdefined( level._id_2CDE[var_0._id_444D] ) )
    {
        playfx( level._id_20E9["vanish"], level._id_2CDE[var_0._id_444D]._id_24C8 );
        level._id_2CDE[var_0._id_444D] notify( "reset" );
    }
    else
    {
        var_3[0] = spawn( "script_model", ( 0, 0, 0 ) );
        var_3[0] _meth_80B1( "prop_dogtags_future_enemy_animated" );
        var_3[0] _meth_856C( 1 );
        var_3[1] = spawn( "script_model", ( 0, 0, 0 ) );
        var_3[1] _meth_80B1( "prop_dogtags_future_friend_animated" );
        var_3[1] _meth_856C( 1 );
        var_4 = spawn( "trigger_radius", ( 0, 0, 0 ), 0, 32, 32 );
        level._id_2CDE[var_0._id_444D] = _id_A78A::_id_244C( "any", var_4, var_3, ( 0, 0, 16 ) );
        _id_A75A::_id_0603( level._id_2CDE[var_0._id_444D]._id_6302 );
        _id_A75A::_id_0603( level._id_2CDE[var_0._id_444D]._id_6303 );
        _id_A75A::_id_0603( level._id_2CDE[var_0._id_444D]._id_6306 );
        _id_A7A2::_id_2858( level._id_2CDE[var_0._id_444D]._id_6313["allies"] );
        _id_A7A2::_id_2858( level._id_2CDE[var_0._id_444D]._id_6313["axis"] );
        _id_A7A2::_id_2858( level._id_2CDE[var_0._id_444D]._id_6313["mlg"] );
        level._id_2CDE[var_0._id_444D] _id_A78A::_id_8346( 0 );
        level._id_2CDE[var_0._id_444D]._id_64F5 = ::_id_64F5;
        level._id_2CDE[var_0._id_444D]._id_9DFE = var_0;
        level._id_2CDE[var_0._id_444D]._id_9E01 = var_2;
        level._id_2CDE[var_0._id_444D]._id_6301 = _id_A78A::_id_403F();
        objective_add( level._id_2CDE[var_0._id_444D]._id_6301, "invisible", ( 0, 0, 0 ) );
        objective_icon( level._id_2CDE[var_0._id_444D]._id_6301, "waypoint_dogtags" );
        level thread _id_1EF9( var_0 );
        var_0 thread _id_9103( level._id_2CDE[var_0._id_444D] );
    }

    var_5 = var_0._id_02E6 + ( 0, 0, 14 );
    level._id_2CDE[var_0._id_444D]._id_24C8 = var_5;
    level._id_2CDE[var_0._id_444D]._id_04C6._id_02E6 = var_5;
    level._id_2CDE[var_0._id_444D]._id_9E93[0]._id_02E6 = var_5;
    level._id_2CDE[var_0._id_444D]._id_9E93[1]._id_02E6 = var_5;
    level._id_2CDE[var_0._id_444D] _id_A78A::_id_4DE0();
    level._id_2CDE[var_0._id_444D] _id_A78A::_id_0AB2( "any" );
    level._id_2CDE[var_0._id_444D]._id_9E93[0] thread _id_852F( level._id_2CDE[var_0._id_444D], _id_A75A::_id_4065( var_2 ) );
    level._id_2CDE[var_0._id_444D]._id_9E93[1] thread _id_852F( level._id_2CDE[var_0._id_444D], var_2 );
    level._id_2CDE[var_0._id_444D]._id_0055 = var_1;
    objective_position( level._id_2CDE[var_0._id_444D]._id_6301, var_5 );
    objective_state( level._id_2CDE[var_0._id_444D]._id_6301, "active" );
    objective_playerenemyteam( level._id_2CDE[var_0._id_444D]._id_6301, var_0 _meth_81B1() );
    playsoundatpos( var_5, "mp_killconfirm_tags_drop" );
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

            if ( var_0._id_9E01 == var_3._id_04A8 && var_3 == var_0._id_0055 )
                objective_state( var_0._id_6301, "invisible" );
        }
    }
}

_id_64F5( var_0 )
{
    if ( isdefined( var_0._id_02E9 ) )
        var_0 = var_0._id_02E9;

    var_1 = var_0._id_030D["team"];

    if ( var_1 == self._id_9E01 )
    {
        self._id_04C6 _meth_809A( "mp_kc_tag_denied" );

        if ( isplayer( var_0 ) )
            var_0 _id_A75A::_id_5652( "kill_denied" );

        if ( isdefined( self._id_0055 ) && isplayer( self._id_0055 ) )
            self._id_0055 _id_A75A::_id_5652( "kc_killlost" );

        var_2 = self._id_9DFE == var_0;
        var_0 _id_A72E::_id_5356( var_2 );
    }
    else
    {
        self._id_04C6 _meth_809A( "mp_kc_tag_collected" );

        if ( isplayer( self._id_0055 ) && self._id_0055 != var_0 )
            level thread _id_A7AA::_id_1208( "team_confirmed", self._id_0055 );

        var_0 _id_A72E::_id_5353();

        if ( isplayer( var_0 ) )
            var_0 _id_A75A::_id_5652( "kill_confirmed" );

        var_0 _id_A78B::_id_4209( var_1, 1 );
    }

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
    objective_state( self._id_6301, "invisible" );
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
            objective_delete( level._id_2CDE[var_1]._id_6301 );
            level._id_2CDE[var_1]._id_04C6 delete();

            for ( var_2 = 0; var_2 < level._id_2CDE[var_1]._id_9E93.size; var_2++ )
                level._id_2CDE[var_1]._id_9E93[var_2] delete();

            level._id_2CDE[var_1] notify( "deleted" );
            level._id_2CDE[var_1] = undefined;
        }
    }
}
