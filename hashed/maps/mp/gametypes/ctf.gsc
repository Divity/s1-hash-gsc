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
        _id_A75A::_id_72F6( level._id_01B5, 5 );
        _id_A75A::_id_72F5( level._id_01B5, 3 );
        _id_A75A::_id_72F3( level._id_01B5, 1 );
        _id_A75A::_id_72FB( level._id_01B5, 1 );
        _id_A75A::_id_72F1( level._id_01B5, 0 );
        _id_A75A::_id_72EC( level._id_01B5, 0 );
        level._id_59E3 = 0;
        level._id_59E8 = 0;
    }

    _id_A75A::_id_7FD3( 5 );

    if ( isdefined( game["round_time_to_beat"] ) )
    {
        _id_A75A::_id_7FD3( game["round_time_to_beat"] );
        game["round_time_to_beat"] = undefined;
    }

    _id_8012();
    level._id_0D7B = 1;
    level._id_91E4 = 1;
    level._id_62F5 = 1;
    level._id_662B = 1;
    level._id_64B8 = 1;
    level._id_6820 = _id_A75A::_id_3FD9( "scr_ping_carrier", 1 );
    level._id_A322 = _id_A75A::_id_3FD9( "scr_win_by_captures", 0 );
    level._id_64E9 = ::_id_64E9;
    level._id_40D0 = ::_id_40D0;
    level._id_64D0 = ::_id_64D0;
    level._id_64ED = ::_id_64ED;
    level._id_64AF = ::_id_64AF;

    if ( !isdefined( game["shut_out"] ) )
    {
        game["shut_out"]["axis"] = 1;
        game["shut_out"]["allies"] = 1;
    }

    if ( level._id_A322 )
        setdynamicdvar( "scr_ctf_scorelimit", 0 );

    if ( level._id_59E3 || level._id_59E8 )
        level._id_5D4E = _id_A783::_id_3BF4;

    level._id_3868 = _id_A75A::_id_3FD9( "scr_ctf_returntime", 30 );
    game["dialog"]["gametype"] = "ctf_intro";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["dialog"]["offense_obj"] = "dom_start";
    game["dialog"]["defense_obj"] = "dom_start";

    if ( _id_A75A::isgrapplinghookgamemode() )
        game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];

    thread _id_64C5();
}

_id_4DDD()
{
    _id_A75A::_id_7F39();
    setdynamicdvar( "scr_ctf_roundlimit", 1 );
    _id_A75A::_id_72F3( "ctf", 1 );
    setdynamicdvar( "scr_ctf_winlimit", 1 );
    _id_A75A::_id_72FB( "ctf", 1 );
    setdynamicdvar( "scr_ctf_halftime", 1 );
    _id_A75A::_id_72EC( "ctf", 1 );
    setdynamicdvar( "scr_ctf_returntime", getmatchrulesdata( "ctfData", "returnTime" ) );
    setdynamicdvar( "scr_ping_carrier", getmatchrulesdata( "ctfData", "enemyCarrierIcon" ) );
    setdynamicdvar( "scr_win_by_captures", getmatchrulesdata( "ctfData", "winByCaptures" ) );
    setdynamicdvar( "scr_ctf_flag_pick_up_time_friendly", getmatchrulesdata( "ctfData", "pickupTime" ) );
    setdynamicdvar( "scr_ctf_flag_pick_up_time_enemy", getmatchrulesdata( "ctfData", "pickupTime" ) );
}

_id_64E9()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( _id_A75A::_id_5169( game["status"] ) )
        game["switchedsides"] = !game["switchedsides"];

    if ( game["status"] == "halftime" )
        setomnvar( "ui_current_round", 2 );
    else if ( game["status"] == "overtime" )
        setomnvar( "ui_current_round", 3 );
    else if ( game["status"] == "overtime_halftime" )
        setomnvar( "ui_current_round", 4 );

    if ( !isdefined( game["original_defenders"] ) )
        game["original_defenders"] = game["defenders"];

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    if ( !level._id_A322 )
    {
        game["teamScores"][game["attackers"]] = 0;
        updateclientnames( game["attackers"], 0 );
        game["teamScores"][game["defenders"]] = 0;
        updateclientnames( game["defenders"], 0 );
    }

    getteamplayersalive( "auto_change" );
    level._id_386C["sentinel"]["friendly"] = loadfx( "vfx/unique/vfx_flag_project_stowed_sentinel_friendly" );
    level._id_386C["sentinel"]["enemy"] = loadfx( "vfx/unique/vfx_flag_project_stowed_sentinel_enemy" );
    level._id_386C["atlas"]["friendly"] = loadfx( "vfx/unique/vfx_flag_project_stowed_atlas_friendly" );
    level._id_386C["atlas"]["enemy"] = loadfx( "vfx/unique/vfx_flag_project_stowed_atlas_enemy" );
    level._id_3863["sentinel"]["friendly"] = loadfx( "vfx/unique/vfx_flag_project_sentinel_friendly" );
    level._id_3863["sentinel"]["enemy"] = loadfx( "vfx/unique/vfx_flag_project_sentinel_enemy" );
    level._id_3863["atlas"]["friendly"] = loadfx( "vfx/unique/vfx_flag_project_atlas_friendly" );
    level._id_3863["atlas"]["enemy"] = loadfx( "vfx/unique/vfx_flag_project_atlas_enemy" );
    level._id_385B["sentinel"]["friendly"] = loadfx( "vfx/unique/vfx_marker_ctf" );
    level._id_385B["sentinel"]["enemy"] = loadfx( "vfx/unique/vfx_marker_ctf_red" );
    level._id_385B["atlas"]["friendly"] = loadfx( "vfx/unique/vfx_marker_ctf" );
    level._id_385B["atlas"]["enemy"] = loadfx( "vfx/unique/vfx_marker_ctf_red" );

    if ( level._id_8A76 )
    {
        _id_A75A::_id_7FBE( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER" );
        _id_A75A::_id_7FBE( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER" );
    }
    else
    {
        _id_A75A::_id_7FBE( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER_SCORE" );
        _id_A75A::_id_7FBE( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER_SCORE" );
    }

    _id_A75A::_id_7FBF( game["attackers"], &"OBJECTIVES_CTF" );
    _id_A75A::_id_7FBF( game["defenders"], &"OBJECTIVES_CTF" );
    _id_A75A::_id_7FBD( game["attackers"], &"OBJECTIVES_ONE_FLAG_ATTACKER_HINT" );
    _id_A75A::_id_7FBD( game["defenders"], &"OBJECTIVES_ONE_FLAG_DEFENDER_HINT" );
    _id_4E21();
    var_2[0] = "ctf";
    _id_A78A::main( var_2 );
    level thread _id_24AB();
    level thread _id_9B5B();
}

_id_4E21()
{
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    _id_A7AF::_id_0831( "mp_ctf_spawn_allies_start" );
    _id_A7AF::_id_0831( "mp_ctf_spawn_axis_start" );
    level._id_8923 = "mp_ctf_spawn";
    _id_A7AF::_id_082F( "allies", level._id_8923 );
    _id_A7AF::_id_082F( "axis", level._id_8923 );
    level._id_5983 = _id_A7AF::_id_3777( level._id_89F0, level._id_89ED );
    setmapcenter( level._id_5983 );
}

_id_40D0()
{
    var_0 = self._id_04A8;

    if ( level._id_9C0C && level._id_4C6A )
    {
        if ( !game["switchedsides"] )
            var_0 = _id_A75A::_id_4065( var_0 );

        var_1 = _id_A7AF::_id_40DB( "mp_ctf_spawn_" + var_0 + "_start" );
        var_2 = _id_A7AF::_id_40D6( var_1 );
    }
    else
    {
        var_1 = _id_A7AF::_id_411D( var_0 );
        var_2 = _id_A7B0::getspawnpoint_ctf( var_1, var_0 );
    }

    _id_A7AF::_id_7270( var_2 );
    return var_2;
}

_id_9B5B()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_9AF4();
        var_0 thread _id_9B51();
        var_0 thread _id_9B09();
    }
}

_id_9AF4()
{
    waitframe;
    _id_A75A::_id_7F65( self._id_030D["captures"] );
}

_id_9B51()
{
    waitframe;
    self._id_004F = self._id_030D["returns"];
}

_id_9B09()
{
    waitframe;
    _id_A75A::_id_7F66( self._id_030D["defends"] );
}

_id_24AB()
{
    level._id_3864["allies"] = _id_A7B2::_id_4112( "allies" );
    level._id_1BB4["allies"] = _id_A7B2::_id_410E( "allies" );
    level._id_3864["axis"] = _id_A7B2::_id_4112( "axis" );
    level._id_1BB4["axis"] = _id_A7B2::_id_410E( "axis" );
    level._id_4B40 = "waypoint_escort";
    level._id_4B3F = "waypoint_escort";
    level._id_4B42 = "waypoint_kill";
    level._id_4B41 = "waypoint_kill";
    level._id_4B31 = "waypoint_capture_flag";
    level._id_4B30 = "waypoint_capture_flag";
    level._id_4B38 = "waypoint_defend_flag";
    level._id_4B37 = "waypoint_defend_flag";
    level._id_4B4C = "waypoint_return_flag";
    level._id_4B4B = "waypoint_return_flag";
    level._id_4B4F = "waypoint_waitfor_flag";
    level._id_4B4E = "waypoint_waitfor_flag";
    level._id_4B2B = "waypoint_esports_ctf_taken_blue";
    level._id_4B2C = "waypoint_esports_ctf_taken_red";
    level._id_4B39 = "waypoint_esports_ctf_dropped_blue";
    level._id_4B3A = "waypoint_esports_ctf_dropped_red";
    level._id_4B29 = "waypoint_esports_ctf_flag_blue";
    level._id_4B2A = "waypoint_esports_ctf_flag_red";
    level._id_4B43 = "waypoint_esports_ctf_flag_missing_blue";
    level._id_4B44 = "waypoint_esports_ctf_flag_missing_red";
    level._id_91E8[game["defenders"]] = _id_2442( game["defenders"], "allies" );
    level._id_91E8[game["attackers"]] = _id_2442( game["attackers"], level._id_65B0["allies"] );
    level._id_1B60[game["defenders"]] = _id_23E7( game["defenders"], "allies" );
    level._id_1B60[game["attackers"]] = _id_23E7( game["attackers"], level._id_65B0["allies"] );
    _id_0D76();
    _id_64DE( "allies" );
    _id_64DE( "axis" );
}

_id_64DE( var_0 )
{
    if ( var_0 == "allies" )
    {
        level._id_0A84 = 0;
        level._id_0A83 = -1;
    }
    else
    {
        level._id_1219 = 0;
        level._id_1218 = -1;
    }

    level notify( "update_flag_status" );
}

_id_64C1( var_0 )
{
    var_1 = var_0._id_030D["team"];

    if ( var_1 == "allies" )
    {
        var_0._id_02D6 = 1;
        level._id_1219 = 2;
        level._id_1218 = var_0 _meth_81B1();
    }
    else
    {
        var_0._id_02D6 = 2;
        level._id_0A84 = 2;
        level._id_0A83 = var_0 _meth_81B1();
    }

    level notify( "update_flag_status" );
}

_id_646D( var_0 )
{
    if ( var_0 == "allies" )
    {
        level._id_0A84 = 1;
        level._id_0A83 = -1;
    }
    else
    {
        level._id_1219 = 1;
        level._id_1218 = -1;
    }

    level notify( "update_flag_status" );
}

_id_6D74()
{
    if ( !isdefined( self._id_04A8 ) || !isdefined( level._id_0A84 ) )
        return;

    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;

    if ( self._id_04A8 == "allies" || self._id_04A8 == "spectator" )
    {
        var_0 = level._id_0A84;
        var_1 = level._id_0A83;
        var_2 = level._id_1219;
        var_3 = level._id_1218;
    }
    else if ( self._id_04A8 == "axis" )
    {
        var_0 = level._id_1219;
        var_1 = level._id_1218;
        var_2 = level._id_0A84;
        var_3 = level._id_0A83;
    }
    else
        return;

    self _meth_82FB( "ui_ctf_friendly_status", var_0 );
    self _meth_82FB( "ui_ctf_friendly_carrier_clientnum", var_1 );
    self _meth_82FB( "ui_ctf_enemy_status", var_2 );
    self _meth_82FB( "ui_ctf_enemy_carrier_clientnum", var_3 );
    self _meth_82FB( "ui_ctf_status_changed", 1 );
}

_id_6D75()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_6D74();
    }
}

_id_6D8B()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    _id_6D74();
    thread _id_6D75();

    for (;;)
    {
        level waittill( "update_flag_status" );
        _id_6D74();
    }
}

_id_4875( var_0 )
{
    level waittill( "game_ended" );

    if ( isdefined( var_0 ) )
        var_0._id_0037 = 0;
}

_id_2442( var_0, var_1 )
{
    var_2 = getent( "ctf_zone_" + var_1, "targetname" );

    if ( !isdefined( var_2 ) )
        _id_A4F0::_id_334D( "No ctf_zone_" + var_1 + " trigger found in map." );
    else
    {
        var_3 = getent( "ctf_zone_augmented_" + var_1, "targetname" );

        if ( isdefined( var_3 ) )
        {
            if ( _id_A75A::_id_50C1() )
            {
                var_2 delete();
                var_2 = var_3;
            }
            else
                var_3 delete();
        }

        var_4[0] = getent( "ctf_flag_" + var_1, "targetname" );

        if ( !isdefined( var_4[0] ) )
        {
            _id_A4F0::_id_334D( "No ctf_flag_" + var_1 + " script_model found in map." );
            return;
        }

        var_5[0] = getent( "ctf_flag_augmented_" + var_1, "targetname" );

        if ( isdefined( var_5[0] ) )
        {
            if ( _id_A75A::_id_50C1() )
            {
                var_4[0] delete();
                var_4[0] = var_5[0];
            }
            else
                var_5[0] delete();
        }

        var_6 = spawn( "trigger_radius", var_2._id_02E6, 0, 96, var_2._id_01E9 );
        var_2 = var_6;
        var_4[0] _meth_80B1( level._id_3864[var_0] );
        var_4[0]._id_63C4 = var_4[0] _meth_80BE( 0 );
        var_7 = var_4[0]._id_02E6 + ( 0, 0, 32 );
        var_8 = var_4[0]._id_02E6 + ( 0, 0, -32 );
        var_9 = bullettrace( var_7, var_8, 0, undefined );
        var_4[0]._id_02E6 = var_9["position"];
        var_10 = _id_A78A::_id_23E9( var_0, var_2, var_4, ( 0, 0, 85 ) );
        var_11 = getdvarfloat( "scr_ctf_flag_pick_up_time_friendly", 0.0 );

        if ( var_11 > 0 )
            var_10 _id_A78A::_id_8028( "friendly", var_11 );

        var_12 = getdvarfloat( "scr_ctf_flag_pick_up_time_enemy", 0.0 );

        if ( var_12 > 0 )
            var_10 _id_A78A::_id_8028( "enemy", var_12 );

        var_10 _id_A78A::_id_8027( "enemy", &"MP_GRABBING_FLAG" );
        var_10 _id_A78A::_id_8027( "friendly", &"MP_RETURNING_FLAG" );
        var_10 _id_A78A::_id_0AA1( "enemy" );
        var_10 _id_A78A::_id_834C( "none" );
        var_10 _id_A78A::_id_7F0C( "enemy", level._id_4B3F );
        var_10 _id_A78A::_id_7F0D( "enemy", level._id_4B40 );

        if ( level._id_6820 != 2 )
        {
            var_10 _id_A78A::_id_7F0C( "friendly", level._id_4B41 );
            var_10 _id_A78A::_id_7F0D( "friendly", level._id_4B42 );
        }

        if ( _id_A75A::_id_50C1() )
            var_10._id_6310 = 2.5;

        var_10._id_6308 = 1;
        var_10._id_0AB5 = 1;
        var_10._id_740C = 1;
        var_10._id_64BF = ::_id_64BF;
        var_10._id_64C0 = ::_id_64BF;
        var_10._id_646C = ::_id_646C;
        var_10._id_64DD = ::_id_64DD;
        var_10._id_4270 = ::_id_426B;
        var_10._id_1AFB = ::_id_1AF8;
        var_10._id_4270 = ::_id_426F;
        var_10._id_63DC = var_2._id_0354;
        var_10._id_02E6 = var_2._id_02E6;
        var_10.highestspawndistratio = 0.0;

        if ( level._id_6820 == 0 )
            var_10._id_6308 = 0;

        if ( var_0 == "allies" )
        {
            var_10 _id_A78A::_id_7F0C( "mlg", level._id_4B29 );
            var_10 _id_A78A::_id_7F0D( "mlg", level._id_4B29 );
            setomnvar( "ui_mlg_game_mode_status_1", 0 );
        }
        else
        {
            var_10 _id_A78A::_id_7F0C( "mlg", level._id_4B2A );
            var_10 _id_A78A::_id_7F0D( "mlg", level._id_4B2A );
            setomnvar( "ui_mlg_game_mode_status_2", 0 );
        }

        var_10 thread _id_385E();
    }
}

_id_23E7( var_0, var_1 )
{
    var_2 = getent( "ctf_zone_" + var_1, "targetname" );
    var_3 = getent( "ctf_zone_augmented_" + var_1, "targetname" );

    if ( isdefined( var_3 ) && _id_A75A::_id_50C1() )
        var_2 = var_3;

    var_4 = [];
    var_5 = _id_A78A::_id_244C( var_0, var_2, var_4, ( 0, 0, 85 ) );
    var_5 _id_A78A::_id_0AB2( "friendly" );
    var_5 _id_A78A::_id_834C( "any" );
    var_5 _id_A78A::_id_7F0C( "friendly", level._id_4B37 );
    var_5 _id_A78A::_id_7F0D( "friendly", level._id_4B38 );
    var_5 _id_A78A::_id_7F0C( "enemy", level._id_4B30 );
    var_5 _id_A78A::_id_7F0D( "enemy", level._id_4B31 );
    var_5 _id_A78A::_id_8346( 0 );
    var_5 _id_A78A::_id_7F93( level._id_91E8[_id_A75A::_id_4065( var_0 )] );
    var_5._id_64F5 = ::_id_64F5;
    var_5._id_6456 = ::_id_6456;
    var_6 = var_2._id_02E6 + ( 0, 0, 32 );
    var_7 = var_2._id_02E6 + ( 0, 0, -32 );
    var_8 = bullettrace( var_6, var_7, 0, undefined );
    var_5._id_1307 = var_8["position"];
    var_5._id_1306 = var_8["normal"];
    var_5 thread _id_1B5F();
    return var_5;
}

_id_6451( var_0 )
{
    var_1 = var_0._id_030D["team"];

    if ( var_1 == _id_A78A::_id_4076() )
        self._id_04C6._id_0354 = 1024;
    else
        self._id_04C6._id_0354 = self._id_63DC;
}

_id_648B( var_0, var_1, var_2 )
{
    self._id_04C6._id_0354 = self._id_63DC;
}

_id_64BF( var_0 )
{
    self notify( "picked_up" );
    var_1 = var_0._id_030D["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    _id_385F();

    if ( var_1 == _id_A78A::_id_4076() )
    {
        thread _id_74DB();
        _id_A75A::_id_5648( "flag_returned", var_1, "status" );
        _id_A75A::_id_6DDA( "mp_obj_notify_pos_med", var_1 );
        _id_A75A::_id_5648( "enemy_flag_returned", var_2, "status" );
        _id_A75A::_id_6DDA( "mp_obj_notify_neg_med", var_2 );
        var_0 thread _id_A72E::_id_3867();
        _id_64DE( var_1 );
    }
    else
    {
        if ( isdefined( level._id_24AE ) && isdefined( level._id_24AE[var_1] ) )
            var_0 thread _id_0CAC( self );
        else
            var_0 _id_0DFA( self );

        _id_64C1( var_0 );
        _id_A78A::_id_834C( "any" );
        _id_A78A::_id_7F0C( "enemy", level._id_4B3F );
        _id_A78A::_id_7F0D( "enemy", level._id_4B40 );

        if ( level._id_6820 != 2 )
        {
            _id_A78A::_id_7F0C( "friendly", level._id_4B41 );
            _id_A78A::_id_7F0D( "friendly", level._id_4B42 );
        }
        else
        {
            _id_A78A::_id_7F0C( "friendly", undefined );
            _id_A78A::_id_7F0D( "friendly", undefined );
        }

        level._id_1B60[var_2] _id_A78A::_id_0AB2( "none" );
        level._id_1B60[var_2] _id_A78A::_id_834C( "friendly" );
        level._id_1B60[var_2] _id_A78A::_id_7F0C( "friendly", level._id_4B4E );
        level._id_1B60[var_2] _id_A78A::_id_7F0D( "friendly", level._id_4B4F );
        var_3 = [ var_0 ];
        _id_A75A::_id_5648( "enemy_flag_taken", var_1, "status" );
        _id_A75A::_id_6DDA( "mp_obj_notify_pos_sml", var_1, var_3 );
        var_0 _meth_82F4( "mp_ctf_flag_pickup" );
        _id_A75A::_id_5648( "flag_taken", var_2, "status" );
        _id_A75A::_id_6DDA( "mp_obj_notify_neg_sml", var_2 );

        if ( _id_A78A::_id_4076() == "allies" )
        {
            level._id_1B60[var_2] _id_A78A::_id_7F0C( "mlg", level._id_4B43 );
            level._id_1B60[var_2] _id_A78A::_id_7F0D( "mlg", level._id_4B43 );
            _id_A78A::_id_7F0C( "mlg", level._id_4B2B );
            _id_A78A::_id_7F0D( "mlg", level._id_4B2B );
            setomnvar( "ui_mlg_game_mode_status_1", var_0 _meth_81B1() );
        }
        else
        {
            level._id_1B60[var_2] _id_A78A::_id_7F0C( "mlg", level._id_4B44 );
            level._id_1B60[var_2] _id_A78A::_id_7F0D( "mlg", level._id_4B44 );
            _id_A78A::_id_7F0C( "mlg", level._id_4B2C );
            _id_A78A::_id_7F0D( "mlg", level._id_4B2C );
            setomnvar( "ui_mlg_game_mode_status_2", var_0 _meth_81B1() );
        }

        var_0 thread _id_A72E::_id_3866();
        thread _id_385A( var_0, var_1, var_2 );
    }
}

_id_385A( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    self endon( "reset" );

    for (;;)
    {
        wait 15;

        if ( level._id_91E8[var_1] _id_A78A::_id_5119() )
            var_0 _id_A75A::_id_5652( "enemy_flag_bringhome", "status" );

        _id_A75A::_id_5648( "flag_getback", var_2, "status" );
    }
}

_id_74DB()
{
    _id_A78A::_id_74DC();
}

_id_646C( var_0 )
{
    var_1 = _id_A78A::_id_4076();
    var_2 = level._id_65B0[var_1];
    _id_A78A::_id_0AA1( "any" );
    _id_A78A::_id_834C( "any" );
    _id_A78A::_id_7F0C( "friendly", level._id_4B4B );
    _id_A78A::_id_7F0D( "friendly", level._id_4B4C );
    _id_A78A::_id_7F0C( "enemy", level._id_4B30 );
    _id_A78A::_id_7F0D( "enemy", level._id_4B31 );
    _id_646D( var_1 );

    if ( var_1 == "allies" )
    {
        _id_A78A::_id_7F0C( "mlg", level._id_4B39 );
        _id_A78A::_id_7F0D( "mlg", level._id_4B39 );
        setomnvar( "ui_mlg_game_mode_status_1", 0 - level._id_3868 );
    }
    else
    {
        _id_A78A::_id_7F0C( "mlg", level._id_4B3A );
        _id_A78A::_id_7F0D( "mlg", level._id_4B3A );
        setomnvar( "ui_mlg_game_mode_status_2", 0 - level._id_3868 );
    }

    if ( isdefined( var_0 ) )
    {
        var_0._id_02D6 = 0;

        if ( isdefined( var_0._id_1BB4 ) )
            var_0 _id_297F();
    }

    _id_A75A::_id_5648( "flag_dropped", var_1, "status" );
    _id_A75A::_id_6DDA( "mp_obj_notify_neg_sml", var_1 );
    _id_A75A::_id_5648( "enemy_flag_dropped", var_2, "status" );
    _id_A75A::_id_6DDA( "mp_obj_notify_pos_sml", var_2 );
    thread _id_385E();
    thread _id_74D9();
}

_id_74D9()
{
    self endon( "picked_up" );
    self endon( "reset" );
    wait(level._id_3868);
    var_0 = _id_A78A::_id_4076();
    var_1 = level._id_65B0[var_0];
    _id_A75A::_id_5648( "flag_returned", var_0, "status" );
    _id_A75A::_id_6DDA( "mp_obj_notify_pos_med", var_0 );
    _id_A75A::_id_5648( "enemy_flag_returned", var_1, "status" );
    _id_A75A::_id_6DDA( "mp_obj_notify_neg_med", var_1 );
    thread _id_74DB();
}

_id_64DD()
{
    var_0 = _id_A78A::_id_4076();
    var_1 = level._id_65B0[var_0];
    _id_A78A::_id_0AA1( "enemy" );
    _id_A78A::_id_834C( "none" );
    _id_A78A::_id_7F0C( "enemy", level._id_4B3F );
    _id_A78A::_id_7F0D( "enemy", level._id_4B40 );

    if ( level._id_6820 != 2 )
    {
        _id_A78A::_id_7F0C( "friendly", level._id_4B41 );
        _id_A78A::_id_7F0D( "friendly", level._id_4B42 );
    }
    else
    {
        _id_A78A::_id_7F0C( "friendly", undefined );
        _id_A78A::_id_7F0D( "friendly", undefined );
    }

    thread _id_385E();
    _id_64DE( var_0 );
    level._id_1B60[var_0] _id_A78A::_id_0AB2( "friendly" );
    level._id_1B60[var_0] _id_A78A::_id_834C( "any" );
    level._id_1B60[var_0] _id_A78A::_id_7F0C( "friendly", level._id_4B37 );
    level._id_1B60[var_0] _id_A78A::_id_7F0D( "friendly", level._id_4B38 );
    level._id_1B60[var_0] _id_A78A::_id_7F0C( "enemy", level._id_4B30 );
    level._id_1B60[var_0] _id_A78A::_id_7F0D( "enemy", level._id_4B31 );

    if ( var_0 == "allies" )
    {
        level._id_1B60[var_0] _id_A78A::_id_7F0C( "mlg", undefined );
        level._id_1B60[var_0] _id_A78A::_id_7F0D( "mlg", undefined );
        _id_A78A::_id_7F0C( "mlg", level._id_4B29 );
        _id_A78A::_id_7F0D( "mlg", level._id_4B29 );
        setomnvar( "ui_mlg_game_mode_status_1", 0 );
    }
    else
    {
        level._id_1B60[var_0] _id_A78A::_id_7F0C( "mlg", undefined );
        level._id_1B60[var_0] _id_A78A::_id_7F0D( "mlg", undefined );
        _id_A78A::_id_7F0C( "mlg", level._id_4B2A );
        _id_A78A::_id_7F0D( "mlg", level._id_4B2A );
        setomnvar( "ui_mlg_game_mode_status_2", 0 );
    }
}

_id_64F5( var_0 )
{
    var_1 = var_0._id_030D["team"];

    if ( var_1 == "allies" )
        var_2 = "axis";
    else
        var_2 = "allies";

    _id_A75A::_id_5648( "enemy_flag_captured", var_1, "status" );
    _id_A75A::_id_6DDA( "mp_obj_notify_pos_lrg", var_1 );
    _id_A75A::_id_5648( "flag_captured", var_2, "status" );
    _id_A75A::_id_6DDA( "mp_obj_notify_neg_lrg", var_2 );
    var_0 thread _id_A72E::_id_385D();
    _id_A78B::_id_4209( var_1, 1 );
    game["shut_out"][var_2] = 0;

    if ( isdefined( var_0 ) )
    {
        var_0._id_02D6 = 0;

        if ( isdefined( var_0._id_1BB4 ) )
            var_0 _id_297F();
    }

    if ( isdefined( level._id_24AE ) && isdefined( level._id_24AE[var_1] ) )
        var_0 thread _id_73A0();

    level._id_91E8[var_2] _id_74DB();

    if ( _id_A78A::_id_4076() == "allies" )
        setomnvar( "ui_mlg_game_mode_status_1", 0 );
    else
        setomnvar( "ui_mlg_game_mode_status_2", 0 );

    level thread _id_1D19( var_1 );
}

_id_1D19( var_0 )
{
    var_1 = "roundsWon";

    if ( level._id_A322 )
        var_1 = "teamScores";

    if ( _id_A75A::_id_4E3C() )
    {
        _id_9B53( var_0 );

        if ( game["status"] == "overtime" )
        {
            game["round_time_to_beat"] = _id_A75A::_id_4022();
            level thread _id_A789::_id_315E( "overtime_halftime", game["end_reason"]["score_limit_reached"] );
        }
        else if ( game["status"] == "overtime_halftime" )
        {
            if ( game["roundsWon"]["axis"] == game["roundsWon"]["allies"] )
                _id_9B53( var_0 );

            if ( game["teamScores"]["axis"] == game["teamScores"]["allies"] )
                game["teamScores"][var_0]++;

            level thread _id_A789::_id_315E( var_0, game["end_reason"]["score_limit_reached"] );
        }
    }
    else if ( game["teamScores"][var_0] == _id_A75A::_id_415B( "scorelimit" ) )
    {
        _id_9B53( var_0 );

        if ( game["status"] == "normal" )
        {
            game["roundMillisecondsAlreadyPassed"] = _id_A75A::_id_412A();
            level thread _id_A789::_id_315E( "halftime", game["end_reason"]["score_limit_reached"] );
        }
        else if ( game["status"] == "halftime" )
        {
            var_2 = var_0;

            if ( game[var_1]["axis"] == game[var_1]["allies"] )
            {
                var_2 = "overtime";
                level._id_374B = "none";
            }

            level thread _id_A789::_id_315E( var_2, game["end_reason"]["switching_sides"] );
        }
    }
}

_id_9B53( var_0 )
{
    level._id_374B = var_0;
    game["roundsWon"][var_0]++;
}

_id_64AF( var_0 )
{
    _id_64ED();
}

_id_64ED()
{
    level._id_374B = "none";
    var_0 = "roundsWon";

    if ( level._id_A322 )
        var_0 = "teamScores";

    if ( _id_A75A::_id_4E3C() )
    {
        if ( game["status"] == "overtime" )
            level thread _id_A789::_id_315E( "overtime_halftime", game["end_reason"]["time_limit_reached"] );
        else if ( game["status"] == "overtime_halftime" )
        {
            var_1 = "tie";

            if ( game[var_0]["axis"] > game[var_0]["allies"] )
                var_1 = "axis";

            if ( game[var_0]["allies"] > game[var_0]["axis"] )
                var_1 = "allies";

            level thread _id_A789::_id_315E( var_1, game["end_reason"]["time_limit_reached"] );
        }
    }
    else if ( game["status"] == "halftime" )
    {
        var_1 = "tie";

        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            var_1 = "axis";

        if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            var_1 = "allies";

        if ( var_1 == "axis" || var_1 == "allies" )
            _id_9B53( var_1 );

        if ( game[var_0]["axis"] == game[var_0]["allies"] )
            var_1 = "overtime";

        level thread _id_A789::_id_315E( var_1, game["end_reason"]["time_limit_reached"] );
    }
    else
    {
        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            _id_9B53( "axis" );

        if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            _id_9B53( "allies" );

        level thread _id_A789::_id_315E( "halftime", game["end_reason"]["time_limit_reached"] );
    }
}

_id_0CAC( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_50D7 ) && self._id_50D7 == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    if ( _id_A75A::_id_512E() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self._id_030D["gamemodeLoadout"] = level._id_24AE[self._id_04A8];
    self._id_3BF1 = self._id_1E2E;
    self.gamemode_carrierclass = 1;
    self._id_030D["class"] = "gamemode";
    self._id_030D["lastClass"] = "gamemode";
    self._id_1E2E = "gamemode";
    self._id_5586 = "gamemode";
    self notify( "faux_spawn" );
    _id_A781::_id_41DD( self._id_04A8, "gamemode" );

    if ( self.loadoutkeepcurrentkillstreaks )
        _id_A7C3::_id_9B24( 1 );

    _id_72AD();
    thread _id_A000( var_0 );
}

_id_72AD()
{
    var_0 = self _meth_82CE();

    foreach ( var_2 in var_0 )
        self _meth_84A4( var_2 );
}

_id_A000( var_0 )
{
    level endon( "game_ende" );
    self endon( "disconnect" );
    self endon( "death" );
    self waittill( "spawned_player" );
    _id_0DFA( var_0 );
}

_id_73A0()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_50D7 ) && self._id_50D7 == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    if ( _id_A75A::_id_512E() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self._id_030D["gamemodeLoadout"] = undefined;
    self notify( "faux_spawn" );
    _id_A781::_id_41DD( self._id_04A8, self._id_1E2E );

    if ( self.loadoutkeepcurrentkillstreaks )
        _id_A7C3::_id_9B24( 1 );

    _id_72AD();
}

_id_6456( var_0 )
{

}

_id_64D0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1._id_030D["team"] != self._id_030D["team"] )
    {
        if ( isdefined( var_1._id_1BB4 ) )
            var_1 thread _id_A72E::_id_53B3();

        if ( isdefined( self._id_1BB4 ) )
        {
            var_1 thread _id_A72E::_id_5365( var_9 );
            _id_297F();
            return;
        }

        if ( isdefined( var_4 ) && _id_A75A::_id_513A( var_4 ) )
            return;

        var_10 = 9216;

        foreach ( var_12 in level._id_1B60 )
        {
            var_13 = _func_220( var_1._id_02E6, var_12._id_24C8 );
            var_14 = _func_220( self._id_02E6, var_12._id_24C8 );

            if ( var_12._id_6637 == var_1._id_04A8 )
            {
                if ( var_13 < var_10 || var_14 < var_10 )
                {
                    var_1 thread _id_A72E::_id_27AD( self, var_9 );
                    var_1 _id_A75A::_id_7F66( var_1._id_030D["defends"] );
                }
            }

            if ( var_12._id_6637 == self._id_04A8 )
            {
                if ( var_13 < var_10 || var_14 < var_10 )
                    var_1 thread _id_A72E::_id_0D52( self, var_9 );
            }
        }
    }
    else if ( isdefined( self._id_1BB4 ) )
        _id_297F();
}

_id_0DFA( var_0 )
{
    var_1 = level._id_65B0[self._id_030D["team"]];
    self _meth_801D( level._id_1BB4[var_1], "J_SpineUpper", 1 );
    self._id_1BB4 = level._id_1BB4[var_1];
    var_0 thread _id_385E();
}

_id_426B()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "lost_ctf_flag" );
    self waittill( "goliath_equipped" );
    wait 1.0;

    if ( isdefined( self._id_1BB4 ) )
        self _meth_801D( self._id_1BB4, "J_SpineUpper", 1 );

    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_385E();
}

_id_1AF8( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 _id_A75A::_id_512E() )
        return 0;

    if ( isdefined( var_0.enteringgoliath ) && var_0.enteringgoliath == 1 )
        return 0;

    return 1;
}

_id_426F()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self waittill( "goliath_equipped" );

    if ( isdefined( self._id_1BB6 ) )
    {
        self._id_1BB4 = undefined;
        self._id_1BB6 thread _id_A78A::_id_7F57();
    }
}

_id_297F()
{
    self notify( "lost_ctf_flag" );
    var_0 = "J_SpineUpper";
    self _meth_802A( self._id_1BB4, var_0 );
    self._id_1BB4 = undefined;
}

_id_8012()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "axis", 5, "class", "inUse" ) )
        level._id_24AE["axis"] = _id_A75A::_id_4015( "axis", 5 );

    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", "allies", 5, "class", "inUse" ) )
        level._id_24AE["allies"] = _id_A75A::_id_4015( "allies", 5 );
}

_id_0D76()
{
    var_0 = _id_A7AF::_id_40DB( "mp_ctf_spawn" );
    level._id_91FA["axis"] = [];
    level._id_91FA["allies"] = [];

    foreach ( var_2 in var_0 )
    {
        var_2._id_91E3 = _id_4032( var_2 );

        if ( var_2._id_91E3 == "axis" )
        {
            level._id_91FA["axis"][level._id_91FA["axis"].size] = var_2;
            continue;
        }

        level._id_91FA["allies"][level._id_91FA["allies"].size] = var_2;
    }
}

_id_71E9()
{
    var_0 = _id_A7AF::_id_40DB( "mp_ctf_spawn" );
    level._id_91FA["axis"] = [];
    level._id_91FA["allies"] = [];

    foreach ( var_2 in var_0 )
    {
        var_2._id_91E3 = _id_3DE3( var_2 );

        if ( var_2._id_91E3 == "axis" )
        {
            level._id_91FA["axis"][level._id_91FA["axis"].size] = var_2;
            continue;
        }

        level._id_91FA["allies"][level._id_91FA["allies"].size] = var_2;
    }
}

_id_3DE3( var_0 )
{
    var_1 = _id_A7AF::_id_516D();
    var_2 = undefined;
    var_3 = undefined;

    foreach ( var_5 in level._id_1B60 )
    {
        var_6 = undefined;

        if ( var_1 )
            var_6 = getpathdist( var_0._id_02E6, var_5._id_24C8, 999999 );

        if ( !isdefined( var_6 ) || var_6 == -1 )
            var_6 = distancesquared( var_5._id_24C8, var_0._id_02E6 );

        if ( !isdefined( var_2 ) || var_6 < var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    return var_2._id_6637;
}

_id_4032( var_0 )
{
    var_1 = _id_A7AF::_id_516D();
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;

    if ( var_1 )
    {
        var_3 = getpathdist( var_0._id_02E6, level._id_91E8["allies"]._id_02E6, 999999 );
        var_4 = getpathdist( var_0._id_02E6, level._id_91E8["axis"]._id_02E6, 999999 );
    }

    if ( !isdefined( var_3 ) || var_3 == -1 )
        var_3 = distancesquared( level._id_91E8["allies"]._id_02E6, var_0._id_02E6 );

    if ( !isdefined( var_4 ) || var_4 == -1 )
        var_4 = distancesquared( level._id_91E8["axis"]._id_02E6, var_0._id_02E6 );

    if ( isdefined( var_0._id_039B ) )
    {
        if ( game["switchedsides"] && var_0._id_039B == "axis_override" || !game["switchedsides"] && var_0._id_039B == "allies_override" )
        {
            var_2 = "allies";
            var_0.friendlyflag = level._id_91E8["allies"];
            var_0.friendlyflagdist = var_3;
            var_0.enemyflagdist = var_4;
        }
        else if ( game["switchedsides"] && var_0._id_039B == "allies_override" || !game["switchedsides"] && var_0._id_039B == "axis_override" )
        {
            var_2 = "axis";
            var_0.friendlyflag = level._id_91E8["axis"];
            var_0.friendlyflagdist = var_4;
            var_0.enemyflagdist = var_3;
        }
    }

    if ( !isdefined( var_2 ) )
    {
        var_2 = _id_A4F0::_id_928D( var_3 < var_4, "allies", "axis" );
        var_0.friendlyflag = _id_A4F0::_id_928D( var_3 < var_4, level._id_91E8["allies"], level._id_91E8["axis"] );
        var_0.friendlyflagdist = _id_A4F0::_id_928D( var_3 < var_4, var_3, var_4 );
        var_0.enemyflagdist = _id_A4F0::_id_928D( var_3 > var_4, var_3, var_4 );
    }

    var_5 = var_0.friendlyflagdist / var_0.enemyflagdist;

    if ( var_0.friendlyflag.highestspawndistratio < var_5 )
        var_0.friendlyflag.highestspawndistratio = var_5;

    return var_2;
}

_id_385F()
{
    _id_3A98();
}

_id_385E()
{
    waitframe;

    if ( isdefined( self._id_1BAF ) )
        _id_3A99( level._id_386C, self._id_1BAF, "tag_fx_flag" );
    else
    {
        var_0 = self._id_9E93[0];
        _id_3A97( level._id_3863, var_0._id_02E6, anglestoup( var_0._id_0041 ) );
    }
}

_id_1B5F()
{
    waitframe;
    _id_3A97( level._id_385B, self._id_1307, self._id_1306 );
}

_id_3A98()
{
    if ( isdefined( self._id_3AA9 ) )
        self._id_3AA9 delete();

    if ( isdefined( self._id_32AB ) )
        self._id_32AB delete();
}

_id_3A99( var_0, var_1, var_2 )
{
    var_3 = self._id_6637;
    var_4 = var_0[game[var_3]]["friendly"];
    var_5 = var_0[game[var_3]]["enemy"];
    _id_3A98();
    self._id_3AA9 = _id_89E6( var_4, var_3, var_1, var_2 );
    self._id_32AB = _id_89E6( var_5, _id_A75A::_id_4065( var_3 ), var_1, var_2 );
}

_id_3A97( var_0, var_1, var_2 )
{
    var_3 = self._id_6637;
    var_4 = var_0[game[var_3]]["friendly"];
    var_5 = var_0[game[var_3]]["enemy"];
    _id_3A98();
    self._id_3AA9 = _id_A75A::_id_89D7( var_4, var_3, var_1, var_2 );
    self._id_32AB = _id_A75A::_id_89D7( var_5, _id_A75A::_id_4065( var_3 ), var_1, var_2 );
}

_id_89E6( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_2C1( var_0, var_2, var_3 );
    var_4 _id_A75A::_id_3BB6( var_1 );
    return var_4;
}

_id_1B5E()
{
    foreach ( var_1 in level._id_91E8 )
    {
        if ( var_1._id_9E93.size )
        {
            var_2 = var_1._id_9E93[0]._id_02E6 + ( 0, 0, 32 );
            var_3 = var_1._id_9E93[0]._id_02E6 + ( 0, 0, -32 );
            var_4 = bullettrace( var_2, var_3, 0, undefined );
            var_5 = vectortoangles( var_4["normal"] );
            var_1._id_1306 = anglestoforward( var_5 );
            var_1._id_1307 = var_4["position"];
            var_1 thread _id_385E();
            var_6 = level._id_1B60[var_1._id_6637];
            var_6._id_1306 = var_1._id_1306;
            var_6._id_1307 = var_1._id_1307;
            var_6 thread _id_1B5F();
        }
    }
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_6D8B();
    }
}
