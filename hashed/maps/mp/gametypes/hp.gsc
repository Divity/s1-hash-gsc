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
        _id_A75A::_id_72EC( level._id_01B5, 0 );
        level._id_59E3 = 0;
        level._id_59E8 = 0;
    }

    level._id_91E4 = 1;
    level._id_712D = _id_A75A::_id_3FD9( "scr_hp_radom_selection", 0 );
    level._id_4AA5 = 0;
    level._id_A3E9 = 60;
    level._id_4DE1 = _id_A75A::_id_3FD9( "scr_hp_zone_delay", 0 );
    level._id_6C6A = 6;
    level._id_78A0 = 0;
    level._id_64E9 = ::_id_64E9;
    level._id_40D0 = ::_id_40D0;
    level._id_64D0 = ::_id_64D0;
    level._id_64D7 = ::_id_64D7;
    game["dialog"]["gametype"] = "hpt_intro";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["objective_active"] = "mp_hp_new_hardpoint_active";
    game["objective_gained_sound"] = "mp_obj_notify_pos_sml";
    game["objective_lost_sound"] = "mp_obj_notify_neg_sml";
    game["objective_contested_sound"] = "mp_obj_notify_neg_sml";

    if ( _id_A75A::isgrapplinghookgamemode() )
        game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];

    level._id_5591 = 0;
    level._id_A3EF = [];
}

_id_4DDD()
{
    _id_A75A::_id_7F39();
    _id_A75A::_id_72F3( level._id_01B5, 1 );
    _id_A75A::_id_72FB( level._id_01B5, 1 );
    _id_A75A::_id_72EC( level._id_01B5, 0 );
    setdynamicdvar( "scr_hp_radom_selection", getmatchrulesdata( "hpData", "randomZones" ) );
    setdynamicdvar( "scr_hp_zone_delay", getmatchrulesdata( "hpData", "initDelay" ) );
}

_id_64D7()
{
    level._id_62FA = &"MP_CONTROL_KOTH";
    level._id_62F8 = &"MP_CAPTURE_KOTH";
    level._id_62F9 = &"MP_DEFEND_KOTH";
    level._id_4B47 = "waypoint_captureneutral";
    level._id_4B46 = "waypoint_captureneutral";
    level._id_4B2F = "waypoint_capture";
    level._id_4B2E = "waypoint_capture";
    level._id_4B36 = "waypoint_defend";
    level._id_4B35 = "waypoint_defend";
    level._id_4B33 = "waypoint_contested";
    level._id_4B32 = "waypoint_contested";
    level._id_4B48 = "waypoint_esports_hardpoint_white";
    level._id_4B2D = "waypoint_esports_hardpoint_blue";
    level._id_4B4A = "waypoint_esports_hardpoint_red";
    level._id_4B34 = "waypoint_contested";
    level._id_A3EE = &"MP_KOTH_AVAILABLE_IN";
    level._id_A3E8 = &"MP_KOTH_MOVING_IN";
}

_id_9B39( var_0, var_1 )
{
    game["strings"]["objective_hint_allies"] = var_0;
    game["strings"]["objective_hint_axis"] = var_1;
}

_id_9B38( var_0 )
{
    _id_9B39( var_0, var_0 );
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

    _id_A75A::_id_7FBF( "allies", &"OBJECTIVES_KOTH" );
    _id_A75A::_id_7FBF( "axis", &"OBJECTIVES_KOTH" );

    if ( level._id_8A76 )
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_KOTH" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_KOTH" );
    }
    else
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_KOTH_SCORE" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_KOTH_SCORE" );
    }

    if ( level._id_4DE1 )
        _id_9B38( level._id_62FA );
    else
        _id_9B38( level._id_62F8 );

    getteamplayersalive( "auto_change" );
    _id_4E23();
    var_2[0] = "hp";
    _id_A78A::main( var_2 );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    setomnvar( "ui_mlg_game_mode_status_2", 0 );
    level thread _id_64C5();
    level thread _id_8342();
    level thread _id_46CA();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_3BF8 = 0;
        var_0._id_02D6 = 0;
        var_0._id_9408 = [];
    }
}

_id_4E23()
{
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    _id_A7AF::_id_0831( "mp_hp_spawn_allies_start" );
    _id_A7AF::_id_0831( "mp_hp_spawn_axis_start" );
    level._id_8923 = "mp_hp_spawn";
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
        var_1 = _id_A7AF::_id_40DB( "mp_hp_spawn_" + var_0 + "_start" );
        var_2 = _id_A7AF::_id_40D6( var_1 );
    }
    else
    {
        var_1 = _id_A7AF::_id_411D( var_0 );
        var_2 = _id_A7B0::_id_40D4( var_1 );
    }

    _id_A7AF::_id_7270( var_2 );
    return var_2;
}

_id_4AA6()
{
    level._id_A3D4._id_3BF6 _id_A78A::_id_9B90();
    setomnvar( "ui_mlg_game_mode_status_1", level._id_A3D4._id_3BF6._id_62AC["allies"] );
    setomnvar( "ui_mlg_game_mode_status_2", level._id_A3D4._id_3BF6._id_62AC["axis"] );
}

_id_8929()
{
    if ( level._id_712D )
        level._id_A3D4 = _id_4044();
    else
        level._id_A3D4 = _id_4043();

    _id_7FB5();
}

_id_4AA4()
{
    level endon( "game_ended" );
    level endon( "zone_moved" );
    level._id_4AA5 = gettime();

    for (;;)
    {
        level._id_A3D4._id_3BF6 _id_A78A::_id_0AB2( "any" );
        level._id_A3D4._id_3BF6 _id_A78A::_id_8346( 0 );
        level._id_A3D4._id_3BF6 _id_A78A::_id_8345( &"MP_CAPTURING_OBJECTIVE" );
        level._id_A3D4._id_3BF6 _id_A78A::_id_834C( "any" );
        level._id_A3D4._id_3BF6 _id_A78A::_id_7FAF( 1 );
        level._id_A3D4._id_3BF6 _id_A78A::_id_6007( 0 );
        level._id_A3D4._id_3BF6 _id_A78A::_id_1AC3( 1 );
        level._id_A3D4._id_3BF6._id_64F5 = ::_id_64FC;
        var_0 = level _id_A4F0::_id_A067( "zone_captured", "zone_destroyed" );

        if ( var_0 == "zone_destroyed" )
            continue;

        var_1 = level._id_A3D4._id_3BF6 _id_A78A::_id_4076();

        if ( var_1 == "allies" )
            _id_9B39( level._id_62F9, level._id_62F8 );
        else if ( var_1 == "axis" )
            _id_9B39( level._id_62F8, level._id_62F9 );
        else
            _id_9B39( level._id_62F8, level._id_62F8 );

        level._id_A3D4._id_3BF6 _id_A78A::_id_0AB2( "none" );
        level._id_A3D4._id_3BF6._id_64F5 = undefined;
        level._id_A3D4._id_3BF6._id_64F3 = ::_id_64FF;
        level._id_A3D4._id_3BF6._id_645F = ::_id_64FD;
        level._id_A3D4._id_3BF6._id_64F1 = ::_id_64FE;
        level waittill( "zone_destroyed", var_2 );
        thread _id_39C9( var_1 );

        if ( isdefined( var_2 ) )
        {
            level._id_A3D4._id_3BF6 _id_A78A::_id_7FD4( var_2 );
            continue;
        }

        level._id_A3D4._id_3BF6 _id_A78A::_id_7FD4( "none" );
    }
}

_id_9B18()
{
    for (;;)
    {
        foreach ( var_1 in level._id_0328 )
        {
            var_2 = var_1;

            if ( var_1._id_04A8 == "spectator" || var_1._id_03BC == "spectator" )
                var_2 = var_1 _meth_829D();

            if ( !_id_A75A::_id_5186( var_2 ) )
            {
                var_1 _id_7F74( var_1, 0 );
                continue;
            }

            if ( var_2._id_9408.size == 0 )
            {
                var_1 _id_7F74( var_1, 0 );
                continue;
            }

            foreach ( var_4 in var_2._id_9408 )
            {
                if ( var_4 == level._id_A3D4._id_3BF6._id_04C6 )
                {
                    var_1 _id_7F74( var_1, 1 );
                    break;
                }

                var_1 _id_7F74( var_1, 0 );
            }
        }

        wait 0.05;
    }
}

_id_7F74( var_0, var_1 )
{
    var_2 = 0;

    if ( var_1 )
    {
        var_2 = 1;

        if ( isdefined( level._id_A3D4._id_3BF6._id_50E2 ) && level._id_A3D4._id_3BF6._id_50E2 )
            var_2 = 2;
    }

    if ( var_2 != var_0._id_3BF8 )
    {
        var_0 _meth_82FB( "ui_hardpoint", var_2 );
        var_0._id_3BF8 = var_2;
        var_0._id_02D6 = var_2;
    }
}

_id_46CA()
{
    level endon( "game_ended" );
    level._id_A3EC = -100000;
    level._id_A3D4 = _id_3F95();
    _id_A75A::_id_3BDF( "prematch_done" );
    level childthread _id_9B18();

    for (;;)
    {
        _id_A75A::_id_6DDA( "mp_suitcase_pickup" );
        _id_A75A::_id_38F5( "gamemode_objective" );
        level._id_A3D4._id_3BF6 _id_A78A::_id_7FAF( 1 );
        level._id_A3D4._id_3BF6._id_64F4 = ::_id_4AA6;
        level._id_A3EC = gettime();

        if ( level._id_4DE1 )
        {
            _id_834E( level._id_A3D4 );
            level._id_A3D4._id_3BF6 _id_A78A::_id_834C( "any" );
            _id_9B38( level._id_62FA );
            setomnvar( "ui_hardpoint_timer", gettime() + 1000 * level._id_4DE1 );
            wait(level._id_4DE1);
        }

        waitframe;
        _id_7FB5( level._id_A3D4 );
        _id_A75A::_id_5648( "hp_online", undefined, "gamemode_objective" );
        _id_9B38( level._id_62F8 );
        level thread _id_A75A::_id_6DDA( game["objective_active"] );
        level._id_A3D4._id_3BF6 _id_A78A::_id_3113();
        level._id_A3D4._id_3BF6._id_1B4B = 0;

        if ( level._id_A3E9 )
        {
            thread _id_5F9A( level._id_A3E9 );
            setomnvar( "ui_hardpoint_timer", gettime() + 1000 * level._id_A3E9 );
        }
        else
            level._id_A3E7 = 0;

        _id_4AA4();
        var_0 = level._id_A3D4._id_3BF6 _id_A78A::_id_4076();
        level._id_A3D4._id_3BF6._id_557B = undefined;
        level._id_A3D4._id_3BF6 _id_A78A::_id_2B1D();
        level._id_A3D4._id_3BF6 _id_A78A::_id_0AB2( "none" );
        level._id_A3D4._id_3BF6 _id_A78A::_id_7FD4( "neutral" );
        level._id_A3D4._id_3BF6 _id_A78A::_id_7FAF( 0 );
        level._id_A3D4._id_3BF6 _id_A78A::_id_6007( 0 );
        level._id_A3D4._id_3BF6 _id_A78A::_id_7F0C( "mlg", undefined );
        level._id_A3D4._id_3BF6 _id_A78A::_id_7F0D( "mlg", undefined );
        level notify( "zone_reset" );

        if ( isdefined( level._id_4AA2 ) && level._id_4AA2 == 1 )
            level waittill( "ready_for_next_hp_zone" );

        _id_8929();
        wait 0.5;
        thread _id_39C9( var_0 );
        wait 0.5;
    }
}

_id_39C9( var_0 )
{
    var_1 = level._id_0328;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3._id_030D["team"] == var_0 )
        {
            var_3 notify( "force_spawn" );
            wait 0.1;
        }
    }
}

_id_64FC( var_0 )
{
    var_1 = var_0._id_030D["team"];
    var_2 = _id_A75A::_id_4065( var_1 );
    var_3 = gettime();
    var_0 _meth_8026( "zone captured" );
    level._id_A3D4._id_3BF6._id_50E2 = 0;
    level._id_9C0C = 0;
    _id_8024( var_1 );

    if ( !isdefined( self._id_557B ) || self._id_557B != var_1 )
    {
        var_4 = [];
        var_5 = getarraykeys( self._id_9406[var_1] );

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            var_4[var_5[var_6]] = self._id_9406[var_1][var_5[var_6]];

        level thread _id_41B6( var_4, var_3, var_1, self._id_557B );
        level thread _id_A75A::_id_5648( "hp_secured", var_1, "gamemode_objective" );
        level thread _id_A75A::_id_5648( "hp_lost", var_2, "gamemode_objective" );
    }

    level thread _id_A75A::_id_6DDA( game["objective_gained_sound"], var_1 );
    level thread _id_A75A::_id_6DDA( game["objective_lost_sound"], var_2 );
    level._id_4AA3 = var_1;
    _id_A78A::_id_7FD4( var_1 );

    if ( isdefined( self._id_557B ) && self._id_557B != var_1 )
    {
        for ( var_7 = 0; var_7 < level._id_0328.size; var_7++ )
        {
            var_0 = level._id_0328[var_7];

            if ( var_0._id_030D["team"] == var_1 )
            {
                if ( var_0._id_55B3 + 500 > gettime() )
                    var_0 _id_A7A0::_id_6FF3( "ch_hp_killedLastContester" );
            }
        }
    }

    level thread _id_1206( var_1, self._id_557B );
    self._id_1B4B++;
    self._id_557B = var_1;
    _id_A78A::_id_6007( 1 );
    level notify( "zone_captured" );
    level notify( "zone_captured" + var_1 );
}

_id_41B6( var_0, var_1, var_2, var_3 )
{
    var_4 = getarraykeys( var_0 );

    for ( var_5 = 0; var_5 < var_4.size; var_5++ )
    {
        var_6 = var_0[var_4[var_5]]._id_031D;
        var_6 _id_9AF3( var_3 );

        if ( !_id_5197( var_6 ) )
        {
            var_6 _id_A7A0::_id_6FF3( "ch_hp_capturedObjective" );

            if ( level._id_4AA5 + 500 > var_1 )
                var_6 _id_A7A0::_id_6FF3( "ch_hp_immediateCapture" );

            var_6 thread _id_A72E::_id_7C00();
        }
        else
        {

        }

        wait 0.05;
    }
}

_id_64FF()
{
    level notify( "zone_destroyed" );
    level._id_4AA3 = "neutral";
    level._id_A3D4._id_3BF6._id_50E2 = 0;

    if ( self._id_62AC["axis"] == 0 && self._id_62AC["allies"] == 0 )
    {
        level._id_A3D4._id_3BF6._id_A1C2 = 1;
        _id_7FB5();
    }
}

_id_64FD()
{
    var_0 = level._id_A3D4._id_3BF6 _id_A78A::_id_4076();
    level._id_A3D4._id_3BF6._id_A1B8 = 1;
    level._id_A3D4._id_3BF6._id_50E2 = 1;
    _id_7F3A();
    level thread _id_A75A::_id_6DDA( game["objective_contested_sound"] );
    _id_A75A::_id_5648( "hp_contested", undefined, "gamemode_objective" );
}

_id_64FE( var_0 )
{
    level._id_A3D4._id_3BF6._id_50E2 = 0;
    _id_8024( var_0 );
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F34( var_0 );
}

_id_7FB5( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_A3D4;

    var_0._id_3BF6 _id_A78A::_id_7F0C( "friendly", level._id_4B46 );
    var_0._id_3BF6 _id_A78A::_id_7F0D( "friendly", level._id_4B47 );
    var_0._id_3BF6 _id_A78A::_id_7F0C( "enemy", level._id_4B46 );
    var_0._id_3BF6 _id_A78A::_id_7F0D( "enemy", level._id_4B47 );
    var_0._id_3BF6 _id_A78A::_id_7F0C( "mlg", level._id_4B48 );
    var_0._id_3BF6 _id_A78A::_id_7F0D( "mlg", level._id_4B48 );
}

_id_834E( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_A3D4;

    var_1 = "waypoint_waitfor_flag_neutral";
    var_0._id_3BF6 _id_A78A::_id_7F0C( "friendly", var_1 );
    var_0._id_3BF6 _id_A78A::_id_7F0D( "friendly", var_1 );
    var_0._id_3BF6 _id_A78A::_id_7F0C( "enemy", var_1 );
    var_0._id_3BF6 _id_A78A::_id_7F0D( "enemy", var_1 );
    var_0._id_3BF6 _id_A78A::_id_7F0C( "mlg", var_1 );
    var_0._id_3BF6 _id_A78A::_id_7F0D( "mlg", var_1 );
}

_id_7F3A()
{
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0C( "friendly", level._id_4B32 );
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0D( "friendly", level._id_4B33 );
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0C( "enemy", level._id_4B32 );
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0D( "enemy", level._id_4B33 );
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0C( "mlg", level._id_4B34 );
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0D( "mlg", level._id_4B34 );
}

_id_8024( var_0 )
{
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0C( "friendly", level._id_4B35 );
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0D( "friendly", level._id_4B36 );
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0C( "enemy", level._id_4B2E );
    level._id_A3D4._id_3BF6 _id_A78A::_id_7F0D( "enemy", level._id_4B2F );

    if ( var_0 == "allies" )
    {
        level._id_A3D4._id_3BF6 _id_A78A::_id_7F0C( "mlg", level._id_4B2D );
        level._id_A3D4._id_3BF6 _id_A78A::_id_7F0D( "mlg", level._id_4B2D );
    }
    else
    {
        level._id_A3D4._id_3BF6 _id_A78A::_id_7F0C( "mlg", level._id_4B4A );
        level._id_A3D4._id_3BF6 _id_A78A::_id_7F0D( "mlg", level._id_4B4A );
    }
}

_id_5F9A( var_0 )
{
    level endon( "game_ended" );
    level endon( "zone_reset" );
    level._id_A3EB = gettime() + var_0 * 1000;
    level._id_A3E7 = 0;
    wait(var_0);

    if ( !isdefined( level._id_A3D4._id_3BF6._id_A1B8 ) || level._id_A3D4._id_3BF6._id_A1B8 == 0 )
    {
        if ( !isdefined( level._id_A3D4._id_3BF6._id_A1C2 ) || level._id_A3D4._id_3BF6._id_A1C2 == 0 )
        {
            var_1 = level._id_A3D4._id_3BF6 _id_A78A::_id_4076();

            foreach ( var_3 in level._id_0328 )
            {
                if ( var_3._id_030D["team"] == var_1 )
                    var_3 _id_A7A0::_id_6FF3( "ch_hp_controlZoneEntirely" );
            }
        }
    }

    level._id_A3E7 = 1;
    level notify( "zone_moved" );
}

_id_1206( var_0, var_1 )
{
    level endon( "game_ended" );
    level endon( "zone_destroyed" );
    level endon( "zone_reset" );
    level endon( "zone_moved" );
    level notify( "awardCapturePointsRunning" );
    level endon( "awardCapturePointsRunning" );
    var_2 = 1;
    var_3 = 1;

    while ( !level._id_3BD8 )
    {
        wait(var_2);
        _id_A79A::_id_A0D4();

        if ( !level._id_A3D4._id_3BF6._id_50E2 )
        {
            if ( level._id_78A0 )
                var_3 = level._id_A3D4._id_3BF6._id_62AC[var_0];

            _id_A78B::_id_4209( var_0, var_3 );
        }
    }
}

_id_20CC( var_0, var_1 )
{
    var_2 = var_0._id_7A13;
    var_3 = var_1._id_7A13;

    if ( !isdefined( var_2 ) && !isdefined( var_3 ) )
        return 0;

    if ( !isdefined( var_2 ) && isdefined( var_3 ) )
        return 1;

    if ( isdefined( var_2 ) && !isdefined( var_3 ) )
        return 0;

    if ( var_2 > var_3 )
        return 1;

    return 0;
}

_id_4176( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        return undefined;

    var_2 = 1;

    for ( var_3 = var_1.size; var_2; var_3-- )
    {
        var_2 = 0;

        for ( var_4 = 0; var_4 < var_3 - 1; var_4++ )
        {
            if ( _id_20CC( var_1[var_4], var_1[var_4 + 1] ) )
            {
                var_5 = var_1[var_4];
                var_1[var_4] = var_1[var_4 + 1];
                var_1[var_4 + 1] = var_5;
                var_2 = 1;
            }
        }
    }

    return var_1;
}

_id_8342()
{
    var_0 = _id_4176( "hp_zone_center" );
    var_1 = getentarray( "hp_zone_trigger", "targetname" );
    level._id_A3ED = _id_59EE( var_0, var_1 );
    var_2 = _id_4176( "hp_zone_center_augmented" );
    var_3 = getentarray( "hp_zone_trigger_augmented", "targetname" );

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
    {
        var_2 = _id_59EE( var_2, var_3 );

        if ( _id_A75A::_id_50C1() )
        {
            foreach ( var_5 in var_2 )
            {
                for ( var_6 = 0; var_6 < level._id_A3ED.size; var_6++ )
                {
                    if ( level._id_A3ED[var_6]._id_7A13 == var_5._id_7A13 )
                        level._id_A3ED[var_6] = var_5;
                }
            }
        }
    }

    level._id_09E2 = level._id_A3ED;
    return 1;
}

_id_59EE( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = 0;
        var_4 = var_0[var_2];
        var_4._id_974D = undefined;

        for ( var_5 = 0; var_5 < var_1.size; var_5++ )
        {
            if ( var_4 _meth_80A9( var_1[var_5] ) )
            {
                if ( isdefined( var_4._id_974D ) )
                {
                    var_3 = 1;
                    break;
                }

                var_4._id_974D = var_1[var_5];
                break;
            }
        }

        if ( !isdefined( var_4._id_974D ) )
        {
            if ( !var_3 )
                continue;
        }

        var_4._id_9818 = var_4._id_974D._id_02E6;
        var_6 = [];
        var_6[0] = var_4;

        if ( isdefined( var_4._id_04A5 ) )
        {
            var_7 = getentarray( var_4._id_04A5, "targetname" );

            for ( var_5 = 0; var_5 < var_7.size; var_5++ )
                var_6[var_6.size] = var_7[var_5];
        }

        var_4._id_3BF6 = _id_A78A::_id_244C( "neutral", var_4._id_974D, var_6, ( 0, 0, 0 ) );
        var_4._id_3BF6 _id_A78A::_id_2B1D();
        _id_7FB5( var_4 );
        var_4._id_3BF6 _id_A78A::_id_7F0C( "mlg", undefined );
        var_4._id_3BF6 _id_A78A::_id_7F0D( "mlg", undefined );
        var_4._id_3BF6 _id_A78A::_id_7FAF( 0 );
        var_4._id_974D._id_9C01 = var_4._id_3BF6;
        var_4._id_3BF6._id_6313["allies"] _meth_8523( var_4._id_974D );
        var_4._id_3BF6._id_6313["axis"] _meth_8523( var_4._id_974D );
        var_4._id_3BF6._id_6313["mlg"] _meth_8523( var_4._id_974D );
        var_4 _id_8320();
    }

    return var_0;
}

_id_8320()
{
    var_0 = _id_A7AF::_id_40DB( "mp_hp_spawn" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_2B81 = distancesquared( var_0[var_1]._id_02E6, self._id_02E6 );

    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        for ( var_3 = var_1 - 1; var_3 >= 0 && var_2._id_2B81 < var_0[var_3]._id_2B81; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];

        var_0[var_3 + 1] = var_2;
    }

    var_4 = [];
    var_5 = [];
    var_6 = [];
    var_7 = [];
    var_8 = var_0.size / 3;

    for ( var_1 = 0; var_1 <= var_8; var_1++ )
        var_4[var_4.size] = var_0[var_1];

    while ( var_1 < var_0.size )
    {
        var_7[var_7.size] = var_0[var_1];

        if ( var_1 <= var_8 * 2 )
            var_5[var_5.size] = var_0[var_1];
        else
            var_6[var_6.size] = var_0[var_1];

        var_1++;
    }

    self._id_3BF6._id_6075 = var_4;
    self._id_3BF6._id_5C0D = var_5;
    self._id_3BF6._id_366C = var_6;
    self._id_3BF6._id_65BF = var_7;
}

_id_3F95()
{
    var_0 = level._id_A3ED[0];
    level._id_6F78 = 0;
    return var_0;
}

_id_4043()
{
    var_0 = ( level._id_6F78 + 1 ) % level._id_A3ED.size;
    var_1 = level._id_A3ED[var_0];
    level._id_6F78 = var_0;
    return var_1;
}

_id_8544()
{
    level._id_A3EF = _id_A4F0::_id_0CF5( level._id_A3ED );

    if ( level._id_A3D4 == level._id_A3EF[0] )
        level._id_A3EF = _id_A75A::_id_8FFB( level._id_A3EF, 0, randomintrange( 1, level._id_A3EF.size ) );
}

_id_4044()
{
    if ( level._id_A3EF.size == 0 )
        _id_8544();

    var_0 = level._id_A3EF[0];
    var_1 = [];

    for ( var_2 = 1; var_2 < level._id_A3EF.size; var_2++ )
        var_1[var_2 - 1] = level._id_A3EF[var_2];

    level._id_A3EF = var_1;
    return var_0;
}

_id_64D0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isplayer( var_1 ) )
        return;

    if ( _id_A783::_id_510B( self, var_1 ) )
        return;

    if ( var_1 == self )
        return;

    if ( !isdefined( level._id_A3D4 ) )
        return;

    var_10 = level._id_A3D4._id_3BF6._id_6637;

    if ( !isdefined( var_10 ) || var_10 == "neutral" )
        return;

    if ( isdefined( var_4 ) && _id_A75A::_id_513A( var_4 ) )
        return;

    var_11 = 0;

    if ( !level._id_A3D4._id_3BF6._id_50E2 && var_1 _meth_80A9( level._id_A3D4._id_974D ) )
    {
        var_11 = 1;
        var_1 thread _id_A72E::_id_53B1( self, var_9 );
    }

    if ( self _meth_80A9( level._id_A3D4._id_974D ) )
    {
        var_1._id_55B3 = gettime();

        if ( var_11 )
            return;

        if ( self._id_04A8 == var_10 )
            var_1 thread _id_A72E::_id_0D52( self, var_9 );
        else
        {
            var_1 _id_A7A0::_id_6FF3( "ch_hp_zoneDefense" );
            var_1 thread _id_A72E::_id_27AD( self, var_9 );
            var_1 _id_A75A::_id_7F66( var_1._id_030D["defends"] );
        }
    }
}

_id_648A( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_A3ED.size; var_1++ )
        level._id_A3ED[var_1]._id_3BF6 _id_A78A::_id_0AB2( "none" );
}

_id_9AF3( var_0 )
{
    if ( !isdefined( self._id_1B44 ) )
    {
        self._id_6291 = 0;
        self._id_1B44 = 0;
    }

    if ( !isdefined( var_0 ) || var_0 == "neutral" )
        return;

    self._id_6291++;
    var_1 = _id_A75A::_id_412A() / 60000;

    if ( isplayer( self ) && isdefined( self._id_936B["total"] ) )
        var_1 = self._id_936B["total"] / 60;

    self._id_1B44 = self._id_6291 / var_1;

    if ( self._id_1B44 > self._id_6291 )
        self._id_1B44 = self._id_6291;
}

_id_5197( var_0 )
{
    if ( !level._id_7134 )
        return 0;

    if ( var_0._id_1B44 > level._id_6C6A )
        return 1;

    return 0;
}
