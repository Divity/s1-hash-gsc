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
        _id_A75A::_id_72F6( level._id_01B5, 30 );
        _id_A75A::_id_72F5( level._id_01B5, 300 );
        _id_A75A::_id_72F3( level._id_01B5, 1 );
        _id_A75A::_id_72FB( level._id_01B5, 1 );
        _id_A75A::_id_72F1( level._id_01B5, 0 );
        _id_A75A::_id_72EC( level._id_01B5, 1 );
        level._id_59E3 = 0;
        level._id_59E8 = 0;
    }

    level._id_91E4 = 1;
    level._id_0AAD = 0;
    level._id_64E9 = ::_id_64E9;
    level._id_40D0 = ::_id_40D0;
    level._id_64D0 = ::_id_64D0;
    level._id_64E6 = ::_id_64E6;
    level._id_2D00 = gettime();
    level._id_0AA0 = 1;
    level._id_2CF0 = _id_A75A::_id_3F9B( "scr_dom_capture_time", 10 );
    level._id_932E["axis"]["time"] = 0;
    level._id_932E["axis"]["awarded"] = 0;
    level._id_932E["allies"]["time"] = 0;
    level._id_932E["allies"]["awarded"] = 0;
    level._id_0A7D = [];
    level._id_1216 = [];
    level._id_2CEC = spawnstruct();

    if ( level._id_59E3 || level._id_59E8 )
        level._id_5D4E = _id_A783::_id_3BF4;

    game["dialog"]["gametype"] = "dom_intro";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["dialog"]["offense_obj"] = "dom_start";
    game["dialog"]["defense_obj"] = "dom_start";

    if ( _id_A75A::isgrapplinghookgamemode() )
        game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];
}

_id_4DDD()
{
    _id_A75A::_id_7F39();
    setdynamicdvar( "scr_dom_roundlimit", 1 );
    _id_A75A::_id_72F3( "dom", 1 );
    setdynamicdvar( "scr_dom_winlimit", 1 );
    _id_A75A::_id_72FB( "dom", 1 );
    setdynamicdvar( "scr_dom_halftime", 1 );
    _id_A75A::_id_72EC( "dom", 1 );
    setdynamicdvar( "scr_dom_capture_time", getmatchrulesdata( "domData", "captureTime" ) );
    setdynamicdvar( "scr_dom_allowNeutral", getmatchrulesdata( "domData", "allowNeutral" ) );
    setdynamicdvar( "scr_dom_halftimeswitchsides", getmatchrulesdata( "domData", "halfTimeSwitchSides" ) );
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

    if ( game["status"] == "halftime" )
        setomnvar( "ui_current_round", 2 );
    else if ( game["status"] == "overtime" )
        setomnvar( "ui_current_round", 3 );
    else if ( game["status"] == "overtime_halftime" )
        setomnvar( "ui_current_round", 4 );

    _id_A75A::_id_7FBF( "allies", &"OBJECTIVES_DOM" );
    _id_A75A::_id_7FBF( "axis", &"OBJECTIVES_DOM" );

    if ( level._id_8A76 )
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_DOM" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_DOM" );
    }
    else
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_DOM_SCORE" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_DOM_SCORE" );
    }

    _id_A75A::_id_7FBD( "allies", &"OBJECTIVES_DOM_HINT" );
    _id_A75A::_id_7FBD( "axis", &"OBJECTIVES_DOM_HINT" );
    getteamplayersalive( "auto_change" );
    _id_4E23();
    _id_6ED7();
    var_2[0] = "dom";
    _id_A78A::main( var_2 );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    setomnvar( "ui_mlg_game_mode_status_2", 0 );
    setomnvar( "ui_mlg_game_mode_status_3", 0 );
    level thread _id_2CF8();
    level thread _id_9B0A();
    level thread _id_9B31();
    level thread _id_9B5C();
    level._id_44F9 = _id_A75A::_id_2FCF( "halftimeswitchsides", 1, 0, 1 );
    level._id_0AAD = _id_A75A::_id_2FCF( "allowNeutral", 0, 0, 1 );
}

_id_9B5C()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_9AF4();
        var_0 thread _id_9B09();
    }
}

_id_9AF4()
{
    waitframe;
    _id_A75A::_id_7F65( self._id_030D["captures"] );
}

_id_9B09()
{
    waitframe;
    _id_A75A::_id_7F66( self._id_030D["defends"] );
}

_id_9B31()
{
    level endon( "game_ended" );

    for (;;)
    {
        foreach ( var_1 in level._id_0328 )
        {
            var_1._id_02D6 = 0;

            foreach ( var_3 in level._id_2CF8 )
            {
                if ( var_1 _meth_80A9( var_3._id_56D6 ) )
                {
                    if ( var_3._id_62AC["axis"] * var_3._id_62AC["allies"] > 0 )
                        var_1._id_02D6 = 1;
                    else if ( var_3._id_6637 == "neutral" )
                    {
                        if ( var_1._id_04A8 == "allies" )
                            var_1._id_02D6 = 2;
                        else
                            var_1._id_02D6 = 3;
                    }
                    else if ( var_3._id_6637 == "allies" )
                    {
                        if ( var_1._id_04A8 == "allies" )
                            var_1._id_02D6 = 4;
                        else
                            var_1._id_02D6 = 5;
                    }
                    else if ( var_3._id_6637 == "axis" )
                    {
                        if ( var_1._id_04A8 == "axis" )
                            var_1._id_02D6 = 6;
                        else
                            var_1._id_02D6 = 7;
                    }

                    if ( var_1._id_02D6 > 0 )
                    {
                        if ( var_3._id_0245 == "_b" )
                        {
                            var_1._id_02D6 += 7;
                            continue;
                        }

                        if ( var_3._id_0245 == "_c" )
                            var_1._id_02D6 += 14;
                    }
                }
            }
        }

        wait 0.05;
    }
}

_id_6ED7()
{
    game["neutral"] = "neutral";
    level._id_385C = "flag_holo_base_ground";
    level._id_3861["sentinel"]["friendly"] = loadfx( "vfx/unique/vfx_flag_project_sentinel_friendly" );
    level._id_3861["sentinel"]["enemy"] = loadfx( "vfx/unique/vfx_flag_project_sentinel_enemy" );
    level._id_3861["atlas"]["friendly"] = loadfx( "vfx/unique/vfx_flag_project_atlas_friendly" );
    level._id_3861["atlas"]["enemy"] = loadfx( "vfx/unique/vfx_flag_project_atlas_enemy" );
    level._id_3861["neutral"]["friendly"] = loadfx( "vfx/unique/vfx_flag_project_neutral" );
    level._id_3861["neutral"]["enemy"] = loadfx( "vfx/unique/vfx_flag_project_neutral" );
    level._id_14CD["sentinel"]["friendly"] = loadfx( "vfx/unique/vfx_marker_dom" );
    level._id_14CD["sentinel"]["enemy"] = loadfx( "vfx/unique/vfx_marker_dom_red" );
    level._id_14CD["atlas"]["friendly"] = loadfx( "vfx/unique/vfx_marker_dom" );
    level._id_14CD["atlas"]["enemy"] = loadfx( "vfx/unique/vfx_marker_dom_red" );
    level._id_14CD["neutral"]["friendly"] = loadfx( "vfx/unique/vfx_marker_dom_white" );
    level._id_14CD["neutral"]["enemy"] = loadfx( "vfx/unique/vfx_marker_dom_white" );
}

_id_4E23()
{
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    _id_A7AF::_id_0831( "mp_dom_spawn_allies_start" );
    _id_A7AF::_id_0831( "mp_dom_spawn_axis_start" );
    level._id_8923 = "mp_dom_spawn";
    _id_A7AF::_id_082F( "allies", level._id_8923 );
    _id_A7AF::_id_082F( "axis", level._id_8923 );
    level._id_5983 = _id_A7AF::_id_3777( level._id_89F0, level._id_89ED );
    setmapcenter( level._id_5983 );
}

_id_40D0()
{
    var_0 = self._id_030D["team"];

    if ( level._id_9C0C && level._id_4C6A )
    {
        if ( game["switchedsides"] )
            var_0 = _id_A75A::_id_4065( var_0 );

        var_1 = _id_A7AF::_id_40DB( "mp_dom_spawn_" + var_0 + "_start" );
        var_2 = _id_A7AF::_id_40D9( var_1 );
    }
    else
    {
        var_3 = _id_410C( var_0 );
        var_4 = _id_A75A::_id_4065( var_0 );
        var_5 = _id_410C( var_4 );
        var_6 = _id_4097( var_3, var_5 );
        var_1 = _id_A7AF::_id_411D( var_0 );
        var_2 = _id_A7B0::_id_40D2( var_1, var_6 );
    }

    _id_A7AF::_id_7270( var_2 );
    return var_2;
}

_id_410C( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_2CF8 )
    {
        if ( var_3._id_6637 == var_0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_4097( var_0, var_1 )
{
    var_2 = [];
    var_2[0] = 0;
    var_2[1] = 0;
    var_2[2] = 0;
    var_3 = self._id_030D["team"];

    if ( var_0.size == level._id_2CF8.size )
    {
        var_4 = var_3;
        var_5 = level._id_13B2[var_3];
        var_2[var_5._id_9C01._id_2CFF] = 1;
        return var_2;
    }

    if ( var_0.size == 1 && var_1.size == 2 )
    {
        var_6 = _id_A75A::_id_4065( self._id_04A8 );
        var_7 = _id_A78B::_id_05BD( var_6 ) - _id_A78B::_id_05BD( self._id_04A8 );

        if ( var_7 > 25 )
        {
            var_8 = _id_4131( var_0[0] );
            var_9 = _id_4131( var_1[0] );
            var_10 = _id_4131( var_1[1] );

            if ( var_8 > 80000 && var_9 > 80000 && var_10 > 80000 )
                return var_2;
        }
    }

    if ( var_0.size > 0 )
    {
        foreach ( var_12 in var_0 )
            var_2[var_12._id_2CFF] = 1;

        return var_2;
    }
    else
    {
        var_4 = var_3;
        var_6 = _id_A75A::_id_4065( var_4 );
        var_5 = level._id_13B2[var_4];

        if ( var_1.size > 0 && var_1.size < level._id_2CF8.size )
        {
            var_5 = _id_4143( var_4, undefined, 0 );
            level._id_13B2[var_4] = var_5;
        }

        if ( var_5 == level._id_13B2[var_6] )
        {
            var_5 = _id_4143( var_4, level._id_13B2[var_6], 1 );
            level._id_13B2[var_4] = var_5;
        }

        var_2[var_5._id_9C01._id_2CFF] = 1;
        return var_2;
    }

    return var_2;
}

_id_4131( var_0 )
{
    return gettime() - var_0._id_1B5D;
}

_id_2CF8()
{
    level._id_55F8["allies"] = 0;
    level._id_55F8["axis"] = 0;
    var_0 = getentarray( "flag_primary", "targetname" );
    var_1 = getentarray( "flag_primary_augmented", "targetname" );

    if ( var_0.size < 2 )
        return;

    if ( _id_A75A::_id_50C1() )
    {
        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = var_1[var_2]._id_0397;

            for ( var_4 = 0; var_4 < var_0.size; var_4++ )
            {
                if ( var_0[var_4]._id_0397 == var_3 )
                {
                    var_0[var_4] delete();
                    break;
                }
            }
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
            var_1[var_5] delete();
    }

    level._id_3869 = [];
    level._id_3869 = _id_A4F0::_id_0CDD( var_0, var_1 );
    level._id_2CF8 = [];

    for ( var_5 = 0; var_5 < level._id_3869.size; var_5++ )
    {
        var_6 = level._id_3869[var_5];

        if ( isdefined( var_6._id_04A5 ) )
            var_7[0] = getent( var_6._id_04A5, "targetname" );
        else
        {
            var_7[0] = spawn( "script_model", var_6._id_02E6 );
            var_7[0]._id_0041 = var_6._id_0041;
        }

        var_7[0] _meth_80B1( level._id_385C );
        var_8 = _id_A78A::_id_244C( "neutral", var_6, var_7, ( 0, 0, 100 ) );
        var_8 _id_A78A::_id_0AB2( "enemy" );
        var_8 _id_A78A::_id_8346( level._id_2CF0 );
        var_8 _id_A78A::_id_8345( &"MP_SECURING_POSITION" );
        var_9 = var_8 _id_A78A::_id_3FF8();
        var_8._id_0245 = var_9;
        var_8 _id_A78A::_id_7F0C( "friendly", "waypoint_defend" + var_9 );
        var_8 _id_A78A::_id_7F0D( "friendly", "waypoint_defend" + var_9 );
        var_8 _id_A78A::_id_7F0C( "enemy", "waypoint_captureneutral" + var_9 );
        var_8 _id_A78A::_id_7F0D( "enemy", "waypoint_captureneutral" + var_9 );
        var_8 _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_white" + var_9 );
        var_8 _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_white" + var_9 );
        var_8 _id_A78A::_id_834C( "any" );
        var_8._id_64F5 = ::_id_64F5;
        var_8._id_6451 = ::_id_6451;
        var_8._id_64F9 = ::_id_64F9;
        var_8._id_648B = ::_id_648B;
        var_8._id_623F = 1;
        var_8._id_4B50 = "domFlag";
        var_8._id_46E0 = 0;
        var_8._id_3816 = 1;
        var_10 = var_7[0]._id_02E6 + ( 0, 0, 32 );
        var_11 = var_7[0]._id_02E6 + ( 0, 0, -32 );
        var_12 = bullettrace( var_10, var_11, 0, var_7[0] );
        var_13 = vectortoangles( var_12["normal"] );
        var_8._id_1306 = anglestoforward( var_13 );
        var_8._id_1308 = anglestoright( var_13 );
        var_8._id_1307 = var_12["position"];
        var_7[0]._id_02E6 = var_12["position"];
        var_8 thread _id_9B99( 1 );
        level._id_3869[var_5]._id_9C01 = var_8;
        var_8._id_56D6 = level._id_3869[var_5];
        level._id_2CF8[level._id_2CF8.size] = var_8;
    }

    var_14 = _id_A7AF::_id_40DB( "mp_dom_spawn_axis_start" );
    var_15 = _id_A7AF::_id_40DB( "mp_dom_spawn_allies_start" );
    level._id_8D32["allies"] = var_15[0]._id_02E6;
    level._id_8D32["axis"] = var_14[0]._id_02E6;
    level._id_13B2 = [];
    level._id_13B2["allies"] = _id_4143( "allies", undefined, 0 );
    level._id_13B2["axis"] = _id_4143( "axis", level._id_13B2["allies"], 0 );
    _id_386B();
}

_id_4143( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = undefined;

    for ( var_5 = 0; var_5 < level._id_3869.size; var_5++ )
    {
        var_6 = level._id_3869[var_5];

        if ( !var_2 && var_6 _id_3F96() != "neutral" )
            continue;

        var_7 = distancesquared( var_6._id_02E6, level._id_8D32[var_0] );

        if ( ( !isdefined( var_1 ) || var_6 != var_1 ) && ( !isdefined( var_3 ) || var_7 < var_4 ) )
        {
            var_4 = var_7;
            var_3 = var_6;
        }
    }

    return var_3;
}

_id_6451( var_0 )
{
    var_1 = _id_A78A::_id_4076();
    self._id_2A4D = 0;
    _id_A78A::_id_8346( level._id_2CF0 );

    if ( var_1 == "neutral" )
    {
        _id_8D77( "securing" + self._id_0245, var_0._id_04A8 );

        if ( self._id_3816 || self._id_24C9 == 0 )
            _id_A78A::_id_8346( level._id_2CF0 / 2 );
    }
    else
    {
        if ( var_1 == "allies" )
        {
            level._id_0A7D[level._id_0A7D.size] = self._id_0245;
            var_2 = "axis";
            return;
        }

        level._id_1216[level._id_1216.size] = self._id_0245;
        var_2 = "allies";
    }
}

_id_64F9( var_0, var_1, var_2 )
{
    var_3 = _id_A78A::_id_4076();

    if ( var_1 > 0.05 && var_2 && !self._id_2A4D )
    {
        if ( var_3 == "neutral" )
        {
            _id_8D77( "securing" + self._id_0245, var_0 );
            self._id_6F6F = _id_A75A::_id_4065( var_0 );

            if ( var_0 == "allies" )
            {
                _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_blue_taking" + self._id_0245 );
                _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_blue_taking" + self._id_0245 );
            }
            else
            {
                _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_red_taking" + self._id_0245 );
                _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_red_taking" + self._id_0245 );
            }
        }
        else
        {
            _id_8D77( "losing" + self._id_0245, var_3, 1 );
            _id_8D77( "securing" + self._id_0245, var_0 );

            if ( var_3 == "allies" )
            {
                _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_blue_losing" + self._id_0245 );
                _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_blue_losing" + self._id_0245 );
            }
            else
            {
                _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_red_losing" + self._id_0245 );
                _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_red_losing" + self._id_0245 );
            }
        }

        _id_A78A::_id_7F0C( "enemy", "waypoint_taking" + self._id_0245 );
        _id_A78A::_id_7F0D( "enemy", "waypoint_taking" + self._id_0245 );
        _id_A78A::_id_7F0C( "friendly", "waypoint_losing" + self._id_0245 );
        _id_A78A::_id_7F0D( "friendly", "waypoint_losing" + self._id_0245 );
        self._id_2A4D = 1;
    }
    else if ( level._id_0AAD && var_1 > 0.49 && var_2 && self._id_2A4D && var_3 != "neutral" )
    {
        _id_A78A::_id_7FD4( "neutral" );
        _id_9B99();
        _id_8D77( "lost" + self._id_0245, var_3, 1 );
        level thread _id_A75A::_id_6DDA( "mp_obj_notify_pos_lrg", var_0 );
        level thread _id_A75A::_id_6DDA( "mp_obj_notify_neg_lrg", var_3 );
        _id_9B8B( self._id_0245, "neutral" );
        thread _id_41E4( self._id_9406[var_0] );
    }
}

_id_8D77( var_0, var_1, var_2 )
{
    var_3 = gettime();

    if ( gettime() < level._id_55F8[var_1] + 5000 && ( !isdefined( var_2 ) || !var_2 ) )
        return;

    thread _id_27E0( var_0, var_1 );
    level._id_55F8[var_1] = gettime();
}

_id_648B( var_0, var_1, var_2 )
{
    if ( isplayer( var_1 ) )
        var_1 _meth_82FB( "ui_capture_icon", 0 );

    var_3 = _id_A78A::_id_4076();

    if ( var_3 != "neutral" )
    {
        _id_A78A::_id_7F0C( "enemy", "waypoint_capture" + self._id_0245 );
        _id_A78A::_id_7F0D( "enemy", "waypoint_capture" + self._id_0245 );
        _id_A78A::_id_7F0C( "friendly", "waypoint_defend" + self._id_0245 );
        _id_A78A::_id_7F0D( "friendly", "waypoint_defend" + self._id_0245 );

        if ( var_3 == "allies" )
        {
            _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_blue" + self._id_0245 );
            _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_blue" + self._id_0245 );
        }
        else
        {
            _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_red" + self._id_0245 );
            _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_red" + self._id_0245 );
        }
    }
    else
    {
        _id_A78A::_id_7F0C( "enemy", "waypoint_captureneutral" + self._id_0245 );
        _id_A78A::_id_7F0D( "enemy", "waypoint_captureneutral" + self._id_0245 );
        _id_A78A::_id_7F0C( "friendly", "waypoint_captureneutral" + self._id_0245 );
        _id_A78A::_id_7F0D( "friendly", "waypoint_captureneutral" + self._id_0245 );
        _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_white" + self._id_0245 );
        _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_white" + self._id_0245 );
    }

    if ( var_0 == "allies" )
        _id_A4F0::_id_0CF6( level._id_0A7D, self._id_0245 );
    else
        _id_A4F0::_id_0CF6( level._id_0A7D, self._id_0245 );
}

_id_9B99( var_0 )
{
    if ( isdefined( var_0 ) && var_0 )
        waitframe;

    if ( !_func_294( self._id_9E93[0] ) )
    {
        var_1 = self._id_9E93[0];
        _id_3A97( var_1._id_02E6, anglestoup( var_1._id_0041 ) );
    }
}

_id_3A97( var_0, var_1 )
{
    var_2 = self._id_6637;
    var_3 = level._id_3861[game[var_2]]["friendly"];
    var_4 = level._id_14CD[game[var_2]]["friendly"];
    var_5 = level._id_3861[game[var_2]]["enemy"];
    var_6 = level._id_14CD[game[var_2]]["enemy"];
    _id_3A98();
    self._id_3AA8 = _id_A75A::_id_89D7( var_3, var_2, var_0, var_1 );
    self._id_3A90 = _id_A75A::_id_89D7( var_4, var_2, var_0, var_1 );
    self._id_32AA = _id_A75A::_id_89D7( var_5, _id_A75A::_id_4065( var_2 ), var_0, var_1 );
    self._id_32A6 = _id_A75A::_id_89D7( var_6, _id_A75A::_id_4065( var_2 ), var_0, var_1 );
}

_id_3A98()
{
    if ( isdefined( self._id_3AA8 ) )
        self._id_3AA8 delete();

    if ( isdefined( self._id_3A90 ) )
        self._id_3A90 delete();

    if ( isdefined( self._id_32AA ) )
        self._id_32AA delete();

    if ( isdefined( self._id_32A6 ) )
        self._id_32A6 delete();
}

_id_9B8B( var_0, var_1 )
{
    var_2 = "ui_mlg_game_mode_status_1";

    if ( var_0 == "_b" )
        var_2 = "ui_mlg_game_mode_status_2";

    if ( var_0 == "_c" )
        var_2 = "ui_mlg_game_mode_status_3";

    if ( var_1 == "allies" )
        setomnvar( var_2, -1 );
    else if ( var_1 == "axis" )
        setomnvar( var_2, 1 );
    else
        setomnvar( var_2, 0 );
}

_id_64F5( var_0 )
{
    var_1 = var_0._id_04A8;
    var_2 = _id_A78A::_id_4076();
    var_3 = _id_A78A::_id_3FF8();
    var_4 = 0;

    if ( self._id_3816 && var_3 == "_b" )
        var_4 = 1;

    self._id_1B5D = gettime();
    self._id_3816 = 0;
    self._id_46E0 = 1;

    if ( isdefined( self._id_662D ) )
        self._id_662E = 0;
    else
        self._id_662E = 1;

    _id_A78A::_id_7FD4( var_1 );
    _id_A78A::_id_7F0C( "enemy", "waypoint_capture" + var_3 );
    _id_A78A::_id_7F0D( "enemy", "waypoint_capture" + var_3 );
    _id_A78A::_id_7F0C( "friendly", "waypoint_defend" + self._id_0245 );
    _id_A78A::_id_7F0D( "friendly", "waypoint_defend" + self._id_0245 );

    if ( var_1 == "allies" )
    {
        _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_blue" + self._id_0245 );
        _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_blue" + self._id_0245 );
    }
    else
    {
        _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_red" + self._id_0245 );
        _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_red" + self._id_0245 );
    }

    _id_9B99();
    level._id_9C0C = 0;

    if ( var_2 == "neutral" )
    {
        var_5 = _id_A75A::_id_4065( var_1 );
        _id_8D77( "secured" + self._id_0245, var_1, 1 );
        _id_8D77( "enemy_has" + self._id_0245, var_5, 1 );
        level thread _id_A75A::_id_6DDA( "mp_obj_notify_pos_lrg", var_1 );
    }
    else
    {
        if ( _id_410F( var_1 ) == level._id_3869.size )
        {
            _id_8D77( "secure_all", var_1 );
            _id_8D77( "lost_all", var_2 );
        }
        else
        {
            _id_8D77( "secured" + self._id_0245, var_1, 1 );
            _id_8D77( "lost" + self._id_0245, var_2, 1 );
        }

        level thread _id_A75A::_id_6DDA( "mp_obj_notify_pos_lrg", var_1 );
        level thread _id_A75A::_id_6DDA( "mp_obj_notify_neg_lrg", var_2 );
        level._id_13B2[var_2] = self._id_56D6;
    }

    _id_9B8B( self._id_0245, var_1 );
    var_0 thread _id_A724::_id_8740( "mp_obj_notify_pos_lrg", "mp_obj_notify_neg_lrg" );
    thread _id_41E3( self._id_9406[var_1], var_4 );
}

_id_41E3( var_0, var_1 )
{
    level endon( "game_ended" );
    var_2 = _id_A78A::_id_3F77();

    if ( isdefined( var_2._id_02E9 ) )
        var_2 = var_2._id_02E9;

    if ( isplayer( var_2 ) )
        level thread _id_A75A::_id_91F3( "callout_securedposition" + self._id_0245, var_2 );

    var_3 = getarraykeys( var_0 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_2 = var_0[var_3[var_4]]._id_031D;

        if ( isdefined( var_2._id_02E9 ) )
            var_2 = var_2._id_02E9;

        if ( !isplayer( var_2 ) )
            continue;

        var_2 thread _id_A72E::_id_2CEF( var_1 );
        var_2 thread _id_9B03();
        wait 0.05;
    }
}

_id_41E4( var_0 )
{
    level endon( "game_ended" );
    var_1 = _id_A78A::_id_3F77();

    if ( isdefined( var_1._id_02E9 ) )
        var_1 = var_1._id_02E9;

    if ( isplayer( var_1 ) )
        level thread _id_A75A::_id_91F3( "callout_neutralized_position" + self._id_0245, var_1 );

    var_2 = getarraykeys( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_1 = var_0[var_2[var_3]]._id_031D;

        if ( isdefined( var_1._id_02E9 ) )
            var_1 = var_1._id_02E9;

        if ( !isplayer( var_1 ) )
            continue;

        var_1 thread _id_A72E::_id_2CFB();
        wait 0.05;
    }
}

_id_27E0( var_0, var_1 )
{
    level endon( "game_ended" );
    wait 0.1;
    _id_A75A::_id_A0EB();
    _id_A75A::_id_5648( var_0, var_1 );
}

_id_27E1( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    wait 0.1;
    _id_A75A::_id_A0EB();
    _id_A75A::_id_564D( var_0, var_1, var_2, var_3 );
}

_id_9B0A()
{
    level endon( "game_ended" );

    while ( !level._id_3BD8 )
    {
        var_0 = _id_4075();

        if ( var_0.size )
        {
            var_1 = undefined;
            var_2 = undefined;

            foreach ( var_4 in var_0 )
            {
                var_5 = var_4 _id_A78A::_id_4076();
                _id_A78B::_id_4209( var_5, 1 );

                if ( !isdefined( var_1 ) || var_1 < var_4._id_1B5D )
                    var_1 = var_4._id_1B5D;

                if ( !isdefined( var_2 ) )
                    var_2 = var_5;

                if ( var_2 != var_5 )
                    var_2 = "none";
            }

            if ( var_0.size == 3 && var_2 != "none" && level._id_0328.size > 5 )
            {
                level._id_932E[var_2]["time"] = gettime() - var_1;
                level._id_932E[_id_A75A::_id_4065( var_2 )]["time"] = 0;

                if ( level._id_932E[var_2]["time"] > 60000 && level._id_932E["axis"]["awarded"] == 0 )
                {
                    level._id_932E["axis"]["awarded"] = 1;

                    foreach ( var_8 in level._id_0328 )
                    {
                        if ( var_8._id_04A8 != var_2 )
                            continue;

                        var_8 _id_A7A0::_id_6FF3( "ch_dom_tripcap" );
                    }
                }
            }
            else
            {
                level._id_932E["axis"]["time"] = 0;
                level._id_932E["allies"]["time"] = 0;
            }
        }

        var_10 = 0;
        var_11 = 0;
        var_12 = 0;

        foreach ( var_14 in level._id_2CF8 )
        {
            if ( var_14._id_0245 == "_a" )
            {
                if ( var_14._id_46E0 == 1 )
                    var_11 = 1;

                continue;
            }

            if ( var_14._id_0245 == "_c" )
            {
                if ( var_14._id_46E0 == 1 )
                    var_12 = 1;
            }
        }

        if ( var_11 == 1 || var_12 == 1 )
            var_10 = 1;

        if ( _id_A75A::_id_59E0() && !level._id_0AAD && !var_10 && _id_3F69() > 120000 && !getdvarint( "force_ranking" ) )
        {
            level._id_374B = "none";
            thread _id_A789::_id_315E( "none", game["end_reason"]["time_limit_reached"] );
            return;
        }

        wait 5.0;
        _id_A79A::_id_A0D4();
    }
}

_id_3F69()
{
    return gettime() - level._id_2D00;
}

_id_64D0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isplayer( var_1 ) )
        return;

    if ( _id_A783::_id_510B( self, var_1 ) )
        return;

    if ( var_1 == self )
        return;

    if ( isdefined( var_4 ) && _id_A75A::_id_513A( var_4 ) )
        return;

    var_10 = 0;
    var_11 = self;

    foreach ( var_13 in var_1._id_9408 )
    {
        if ( var_13 != level._id_3869[0] && var_13 != level._id_3869[1] && var_13 != level._id_3869[2] )
            continue;

        var_14 = var_13._id_9C01._id_6637;

        if ( var_1._id_04A8 != var_14 )
        {
            var_1 thread _id_A72E::_id_53B1( var_11, var_9 );
            var_10 = 1;
        }
    }

    var_16 = 90000;

    foreach ( var_13 in level._id_3869 )
    {
        var_14 = var_13._id_9C01._id_6637;
        var_18 = distancesquared( var_13._id_02E6, var_11._id_02E6 );
        var_19 = distancesquared( var_13._id_02E6, var_1._id_02E6 );

        if ( var_14 == var_1._id_04A8 )
        {
            if ( var_18 < var_16 || var_19 < var_16 )
            {
                var_1 thread _id_A72E::_id_27AD( var_11, var_9 );
                var_1 _id_A75A::_id_7F66( var_1._id_030D["defends"] );
            }
        }

        if ( var_10 )
            break;

        if ( var_14 == var_11._id_04A8 )
        {
            if ( var_19 < var_16 || var_18 < var_16 )
                var_1 thread _id_A72E::_id_0D52( self, var_9 );
        }
    }
}

_id_4075()
{
    var_0 = [];

    foreach ( var_2 in level._id_2CF8 )
    {
        if ( var_2 _id_A78A::_id_4076() != "neutral" && isdefined( var_2._id_1B5D ) )
            var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_410F( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_3869.size; var_2++ )
    {
        if ( level._id_2CF8[var_2] _id_A78A::_id_4076() == var_0 )
            var_1++;
    }

    return var_1;
}

_id_3F96()
{
    return self._id_9C01 _id_A78A::_id_4076();
}

_id_386B()
{
    foreach ( var_1 in level._id_2CF8 )
    {
        switch ( var_1._id_0245 )
        {
            case "_a":
                var_1._id_2CFF = 0;
                continue;
            case "_b":
                var_1._id_2CFF = 1;
                continue;
            case "_c":
                var_1._id_2CFF = 2;
                continue;
        }
    }

    var_3 = _id_A7AF::_id_40DB( "mp_dom_spawn" );

    foreach ( var_5 in var_3 )
    {
        var_5.preferreddompoint = undefined;

        if ( isdefined( var_5._id_039B ) )
        {
            if ( var_5._id_039B == "a_override" )
            {
                var_5.preferreddompoint = 0;
                continue;
            }
            else if ( var_5._id_039B == "b_override" )
            {
                var_5.preferreddompoint = 1;
                continue;
            }
            else if ( var_5._id_039B == "c_override" )
            {
                var_5.preferreddompoint = 2;
                continue;
            }
        }

        var_5._id_6074 = _id_4031( var_5 );

        switch ( var_5._id_6074._id_9C01._id_2CFF )
        {
            case 0:
                var_5.preferreddompoint = 0;
                continue;
            case 1:
                var_5.preferreddompoint = 1;
                continue;
            case 2:
                var_5.preferreddompoint = 2;
                continue;
        }
    }
}

_id_4031( var_0 )
{
    var_1 = _id_A7AF::_id_516D();
    var_2 = undefined;
    var_3 = undefined;

    foreach ( var_5 in level._id_2CF8 )
    {
        var_6 = undefined;

        if ( var_1 )
            var_6 = getpathdist( var_0._id_02E6, var_5._id_56D6._id_02E6, 999999 );

        if ( !isdefined( var_6 ) || var_6 == -1 )
            var_6 = distancesquared( var_5._id_56D6._id_02E6, var_0._id_02E6 );

        if ( !isdefined( var_2 ) || var_6 < var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    return var_2._id_56D6;
}

_id_64E6()
{

}

_id_9B03()
{
    if ( !isdefined( self._id_22CD ) )
    {
        self._id_6291 = 0;
        self._id_22CD = 0;
    }

    self._id_6291++;

    if ( _id_A75A::_id_4022() < 1 )
        return;

    self._id_22CD = self._id_6291 / _id_A75A::_id_4022();
}

_id_3F23()
{
    if ( self._id_22CD < 4 )
        return 1;
    else
        return 0.25;
}
