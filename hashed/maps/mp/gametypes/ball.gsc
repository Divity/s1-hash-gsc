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
        _id_A75A::_id_72F5( level._id_01B5, 75 );
        _id_A75A::_id_72F3( level._id_01B5, 1 );
        _id_A75A::_id_72FB( level._id_01B5, 1 );
        _id_A75A::_id_72F1( level._id_01B5, 0 );
        _id_A75A::_id_72EC( level._id_01B5, 1 );
        setdynamicdvar( "scr_ball_num_balls", 1 );
        level._id_59E3 = 0;
        level._id_59E8 = 0;
    }

    var_0 = getdvarint( "scr_ball_num_balls", 1 );
    setomnvar( "ui_uplink_num_balls", var_0 );
    _id_A75A::_id_7FD3( 3 );

    if ( isdefined( game["round_time_to_beat"] ) )
    {
        _id_A75A::_id_7FD3( game["round_time_to_beat"] );
        game["round_time_to_beat"] = undefined;
    }

    level._id_91E4 = 1;
    level._id_64AF = ::_id_64AF;
    level._id_64ED = ::_id_64ED;
    level._id_44FA = 1;
    level._id_662B = 1;
    level._id_64E9 = ::_id_64E9;
    level._id_40D0 = ::_id_40D0;
    level._id_64BC = ::_id_64BC;
    level._id_3BF5 = ::_id_64F2;

    if ( level._id_59E3 || level._id_59E8 )
        level._id_5D4E = _id_A783::_id_3BF4;

    game["dialog"]["drone_reset"] = "upl_dronereset";
    game["dialog"]["you_own_drone"] = "upl_allyowndrone";
    game["dialog"]["ally_own_drone"] = "upl_friend_holds";
    game["dialog"]["enemy_own_drone"] = "upl_enemyowndrone";
    game["dialog"]["ally_throw_score"] = "upl_uplinksuccess";
    game["dialog"]["ally_carry_score"] = "upl_dronedelievered";
    game["dialog"]["enemy_throw_score"] = "upl_enm_score_remote";
    game["dialog"]["enemy_carry_score"] = "upl_enm_score";
    game["dialog"]["pass_complete"] = "upl_dronetransfered";
    game["dialog"]["pass_intercepted"] = "upl_droneintercepted";
    game["dialog"]["ally_drop_drone"] = "upl_dronedropped";
    game["dialog"]["enemy_drop_drone"] = "upl_dronedropped";
    game["dialog"]["gametype"] = "upl_intro";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["dialog"]["offense_obj"] = "upl_deliverdrone";
    game["dialog"]["defense_obj"] = "upl_deliverdrone";

    if ( _id_A75A::isgrapplinghookgamemode() )
        game["dialog"]["gametype"] = "grap_" + game["dialog"]["gametype"];

    level thread _id_12AD();
}

_id_4DDD()
{
    _id_A75A::_id_7F39();
    setdynamicdvar( "scr_ball_roundswitch", 0 );
    _id_A75A::_id_72F4( "ball", 0, 0, 9 );
    setdynamicdvar( "scr_ball_roundlimit", 1 );
    _id_A75A::_id_72F3( "ball", 1 );
    setdynamicdvar( "scr_ball_winlimit", 1 );
    _id_A75A::_id_72FB( "ball", 1 );
    setdynamicdvar( "scr_ball_halftime", 1 );
    _id_A75A::_id_72EC( "ball", 1 );
    var_0 = getmatchrulesdata( "ballData", "numBalls" );
    var_0 = max( 1, var_0 );
    setdynamicdvar( "scr_ball_num_balls", var_0 );
    setdynamicdvar( "scr_ball_reset_time", getmatchrulesdata( "ballData", "ballResetTime" ) );
    setdynamicdvar( "scr_ball_points_touchdown", getmatchrulesdata( "ballData", "carryScore" ) );
    setdynamicdvar( "scr_ball_points_fieldgoal", getmatchrulesdata( "ballData", "throwScore" ) );
    setdynamicdvar( "scr_ball_armor", getmatchrulesdata( "ballData", "armorValue" ) );
}

_id_64E9()
{
    getteamplayersalive( "auto_change" );

    if ( game["status"] == "halftime" )
        setomnvar( "ui_current_round", 2 );
    else if ( game["status"] == "overtime" )
        setomnvar( "ui_current_round", 3 );
    else if ( game["status"] == "overtime_halftime" )
        setomnvar( "ui_current_round", 4 );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( _id_A75A::_id_5169( game["status"] ) )
        game["switchedsides"] = !game["switchedsides"];

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    if ( game["status"] == "overtime" )
    {
        game["teamScores"]["allies"] = 0;
        updateclientnames( "allies", 0 );
        game["teamScores"]["axis"] = 0;
        updateclientnames( "axis", 0 );
    }

    _id_A75A::_id_7FBF( "allies", &"OBJECTIVES_BALL" );
    _id_A75A::_id_7FBF( "axis", &"OBJECTIVES_BALL" );

    if ( level._id_8A76 )
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_BALL" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_BALL" );
    }
    else
    {
        _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_BALL_SCORE" );
        _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_BALL_SCORE" );
    }

    _id_A75A::_id_7FBD( "allies", &"OBJECTIVES_BALL_HINT" );
    _id_A75A::_id_7FBD( "axis", &"OBJECTIVES_BALL_HINT" );
    _id_1292();
    var_2[0] = level._id_01B5;
    _id_A78A::main( var_2 );
    level thread _id_76A3();
    _id_4E23();
}

_id_64AF( var_0 )
{
    foreach ( var_2 in level._id_12D9 )
        var_2._id_9E93[0] _meth_84E1();

    _id_A789::_id_2784( var_0 );
}

_id_64ED()
{
    var_0 = undefined;
    level._id_374B = "none";

    foreach ( var_2 in level._id_12D9 )
        var_2._id_9E93[0] _meth_84E1();

    if ( game["status"] == "halftime" || game["status"] == "overtime_halftime" )
    {
        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        {
            level._id_374B = "axis";
            var_0 = "axis";
        }
        else if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
        {
            level._id_374B = "allies";
            var_0 = "allies";
        }
        else if ( game["status"] == "halftime" )
            var_0 = "overtime";
        else if ( isdefined( game["ball_overtime_team"] ) )
            var_0 = game["ball_overtime_team"];
        else
            var_0 = "tie";
    }
    else if ( game["status"] == "overtime" )
        var_0 = "overtime_halftime";

    logstring( "time limit, win: " + var_0 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    level thread _id_A789::_id_315E( var_0, game["end_reason"]["time_limit_reached"] );
}

_id_4E23()
{
    if ( level._id_0391 == "mp_refraction" )
        setdvar( "scr_disableClientSpawnTraces", "1" );

    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    level._id_0A70 = "mp_ball_spawn_allies_start";
    level._id_1215 = "mp_ball_spawn_axis_start";

    if ( !getspawnarray( level._id_0A70 ).size )
    {
        level._id_0A70 = "mp_dom_spawn_allies_start";
        level._id_1215 = "mp_dom_spawn_axis_start";
    }

    _id_A7AF::_id_0831( level._id_0A70 );
    _id_A7AF::_id_0831( level._id_1215 );
    level._id_8923 = "mp_ball_spawn";

    if ( !getspawnarray( level._id_8923 ).size )
        level._id_8923 = "mp_dom_spawn";

    _id_A7AF::_id_082F( "allies", level._id_8923 );
    _id_A7AF::_id_082F( "axis", level._id_8923 );
    var_0 = level._id_12A2[game["attackers"]]._id_02E6;
    var_1 = 0;
    var_2 = _id_A7AF::_id_40DB( level._id_0A70 );

    foreach ( var_4 in var_2 )
        var_1 += distance( var_4._id_02E6, var_0 );

    var_6 = 0;
    var_2 = _id_A7AF::_id_40DB( level._id_1215 );

    foreach ( var_4 in var_2 )
        var_6 += distance( var_4._id_02E6, var_0 );

    level._id_8CA4 = var_1 < var_6;
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

        if ( !level._id_8CA4 )
            var_0 = _id_A75A::_id_4065( var_0 );

        var_1 = level._id_0A70;

        if ( var_0 == "axis" )
            var_1 = level._id_1215;

        var_2 = _id_A7AF::_id_40DB( var_1 );
        var_3 = _id_A7AF::_id_40D9( var_2 );
    }
    else
    {
        var_2 = _id_A7AF::_id_411D( var_0 );
        var_3 = _id_A7B0::_id_40D1( var_2, var_0 );
    }

    _id_A7AF::_id_7270( var_3 );
    return var_3;
}

_id_64F2( var_0 )
{
    foreach ( var_2 in level._id_12D9 )
    {
        if ( isdefined( var_2._id_1BAF ) && var_2._id_1BAF == self )
        {
            self._id_A272 = _id_A78A::_id_3F25( var_2 );
            var_2 thread _id_A78A::_id_7F57();
            return;
        }
    }

    if ( self _meth_8311() == "iw5_carrydrone_mp" && isdefined( self._id_1C87 ) )
        self._id_A272 = self._id_1C87;
    else if ( isdefined( self._id_66AC ) && self._id_66AC )
    {
        var_4 = self _meth_830C();
        self._id_A272 = _id_A4F0::_id_928D( var_4.size, var_4[0], undefined );
    }

    self.balldropdelay = undefined;
}

_id_64BC( var_0, var_1, var_2 )
{
    if ( game["state"] == "postgame" && game["teamScores"][var_1._id_04A8] > game["teamScores"][level._id_65B0[var_1._id_04A8]] )
        var_1._id_373C = 1;
}

_id_128E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_12C4();
        var_0 thread _id_12D1();
    }
}

_id_12C4()
{
    foreach ( var_1 in level._id_12D9 )
        var_1 _id_1299( self );
}

_id_76A3()
{
    level._id_12CC = [];
    level._id_12D9 = [];
    var_0 = getdvarint( "scr_ball_num_balls", 1 );
    _id_128F( var_0 );
    _id_1291( "allies" );
    _id_1291( "axis" );
    level._id_058F["ball_trail"] = loadfx( "vfx/trail/vfx_uplink_ball_trl" );
    level._id_058F["ball_idle"] = loadfx( "vfx/unique/vfx_uplink_ball_idle" );
    level._id_058F["ball_download"] = loadfx( "vfx/trail/vfx_uplink_ball_trl2" );
    level._id_058F["ball_download_end"] = loadfx( "vfx/unique/vfx_uplink_ball_impact" );
    level._id_058F["ball_goal_enemy"] = loadfx( "vfx/unique/vfx_uplink_goal" );
    level._id_058F["ball_goal_friendly"] = loadfx( "vfx/unique/vfx_uplink_goal_friendly" );
    level._id_058F["ball_goal_activated_enemy"] = loadfx( "vfx/unique/vfx_uplink_ball_score" );
    level._id_058F["ball_goal_activated_friendly"] = loadfx( "vfx/unique/vfx_uplink_ball_score_friendly" );
    level._id_058F["ball_teleport"] = loadfx( "vfx/unique/vfx_uplink_ball_glow" );
    level._id_058F["ball_physics_impact"] = loadfx( "vfx/treadfx/footstep_dust" );
    level thread _id_128E();
    _id_12A5();

    for ( var_1 = 0; var_1 < var_0 && var_1 < level._id_12CC.size; var_1++ )
        _id_12CB( var_1 );

    _id_12A1();
    _id_129F();
    _id_A75A::_id_3BDF( "prematch_done" );
    _id_1281();
}

_id_1292()
{
    level._id_277D = [];
    var_0 = getentarray( "flag_primary", "targetname" );

    foreach ( var_2 in var_0 )
    {
        switch ( var_2._id_0397 )
        {
            case "_a":
                level._id_277D[game["attackers"]] = var_2._id_02E6;
                continue;
            case "_b":
                level._id_2777 = var_2._id_02E6;
                continue;
            case "_c":
                level._id_277D[game["defenders"]] = var_2._id_02E6;
                continue;
        }
    }
}

_id_12A5()
{
    level._id_12AC = ( 1000, 1000, 1000 );
    level._id_12AB = ( -1000, -1000, -1000 );
    var_0 = getallnodes();

    if ( var_0.size > 0 )
    {
        foreach ( var_2 in var_0 )
        {
            level._id_12AC = _id_A7AF::_id_3517( level._id_12AC, var_2._id_02E6 );
            level._id_12AB = _id_A7AF::_id_3516( level._id_12AB, var_2._id_02E6 );
        }
    }
    else
    {
        level._id_12AC = level._id_89F0;
        level._id_12AB = level._id_89ED;
    }
}

_id_12A1()
{
    foreach ( var_2, var_1 in level._id_12A2 )
    {
        var_1._id_04C6 = spawn( "trigger_radius", var_1._id_02E6 - ( 0, 0, var_1._id_0354 ), 0, var_1._id_0354, var_1._id_0354 * 2 );
        var_1._id_9C02 = _id_A78A::_id_244C( var_2, var_1._id_04C6, [], ( 0, 0, var_1._id_0354 * 2.1 ) );
        var_1._id_9C02._id_01C1 = var_1;
        var_1._id_9C02 _id_A78A::_id_7F0C( "friendly", "waypoint_ball_defend" );
        var_1._id_9C02 _id_A78A::_id_7F0C( "enemy", "waypoint_ball_goal" );
        var_1._id_9C02 _id_A78A::_id_7F0D( "friendly", "waypoint_ball_defend" );
        var_1._id_9C02 _id_A78A::_id_7F0D( "enemy", "waypoint_ball_goal" );

        if ( var_2 == "allies" )
            _id_A75A::_id_7FA8( var_1._id_9C02, "waypoint_esports_uplink_blue" );
        else
            _id_A75A::_id_7FA8( var_1._id_9C02, "waypoint_esports_uplink_red" );

        var_1._id_9C02 _id_A78A::_id_834C( "any" );
        var_1._id_9C02 _id_A78A::_id_0AB2( "enemy" );
        var_1._id_9C02 _id_A78A::_id_7F93( level._id_12D9 );
        var_1._id_9C02 _id_A78A::_id_8346( 0 );
        var_1._id_9C02._id_64F5 = ::_id_128A;
        var_1._id_9C02._id_1AFB = ::_id_129E;
        var_1._id_534A = spawn( "script_model", var_1._id_02E6 );
        var_1._id_534A _meth_834D( "large explosive" );
    }
}

_id_1281()
{
    var_0 = _id_A7AF::_id_40DB( level._id_8923 );
    level._id_91FA["axis"] = [];
    level._id_91FA["allies"] = [];
    var_1 = level._id_12A2["allies"]._id_440D;
    var_2 = level._id_12A2["axis"]._id_440D;

    foreach ( var_4 in var_0 )
    {
        var_4._id_91E3 = undefined;
        var_5 = _id_129B( var_1, var_4._id_02E6 );
        var_6 = _id_129B( var_2, var_4._id_02E6 );

        if ( isdefined( var_4._id_039B ) )
        {
            if ( game["switchedsides"] && var_4._id_039B == "axis_override" || !game["switchedsides"] && var_4._id_039B == "allies_override" )
            {
                var_4._id_91E3 = "allies";
                var_4.friendlyflag = level._id_12A2["allies"];
                var_4.friendlyflagdist = var_5;
                var_4.enemyflagdist = var_6;
            }
            else if ( game["switchedsides"] && var_4._id_039B == "allies_override" || !game["switchedsides"] && var_4._id_039B == "axis_override" )
            {
                var_4._id_91E3 = "axis";
                var_4.friendlyflag = level._id_12A2["axis"];
                var_4.friendlyflagdist = var_6;
                var_4.enemyflagdist = var_5;
            }
        }

        if ( !isdefined( var_4._id_91E3 ) )
        {
            var_4._id_91E3 = _id_A4F0::_id_928D( var_5 < var_6, "allies", "axis" );
            var_4.friendlyflag = _id_A4F0::_id_928D( var_5 < var_6, level._id_12A2["allies"], level._id_12A2["axis"] );
            var_4.friendlyflagdist = _id_A4F0::_id_928D( var_5 < var_6, var_5, var_6 );
            var_4.enemyflagdist = _id_A4F0::_id_928D( var_5 > var_6, var_5, var_6 );
        }

        var_7 = var_4.friendlyflagdist / var_4.enemyflagdist;

        if ( var_4.friendlyflag.highestspawndistratio < var_7 )
            var_4.friendlyflag.highestspawndistratio = var_7;

        level._id_91FA[var_4._id_91E3][level._id_91FA[var_4._id_91E3].size] = var_4;
    }
}

_id_129B( var_0, var_1 )
{
    if ( _id_A7AF::_id_516D() )
    {
        var_2 = getpathdist( var_0, var_1, 999999 );

        if ( isdefined( var_2 ) && var_2 >= 0 )
            return var_2;
    }

    return distance( var_0, var_1 );
}

_id_129F()
{
    foreach ( var_2, var_1 in level._id_12A2 )
    {
        var_1._id_7889["friendly"] = spawnfx( _id_A4F0::_id_3FA6( "ball_goal_activated_friendly" ), var_1._id_02E6, ( 1, 0, 0 ) );
        var_1._id_7889["enemy"] = spawnfx( _id_A4F0::_id_3FA6( "ball_goal_activated_enemy" ), var_1._id_02E6, ( 1, 0, 0 ) );
    }

    level thread _id_12C1();

    foreach ( var_4 in level._id_0328 )
        _id_12A0( var_4 );
}

_id_12CB( var_0 )
{
    var_1 = level._id_12CC[var_0];
    var_2 = spawn( "script_model", var_1._id_02E6 );
    var_2 _meth_80B1( "prop_drone_sphere" );
    var_2 thread _id_67F9();
    var_3 = 24;
    var_4 = getent( "ball_pickup_" + ( var_0 + 1 ), "targetname" );

    if ( isdefined( var_4 ) )
        var_4._id_02E6 = var_2._id_02E6;
    else
        var_4 = spawn( "trigger_radius", var_2._id_02E6 - ( 0, 0, var_3 / 2 ), 0, var_3, var_3 );

    var_4 _meth_8069();
    var_4 _meth_804D( var_2 );
    var_4._id_6103 = 1;
    var_5 = [ var_2 ];
    var_6 = _id_A78A::_id_23E9( "any", var_4, var_5, ( 0, 0, 32 ) );
    var_6._id_62FD = 1;
    var_6 _id_A78A::_id_0AA1( "any" );
    var_6 _id_12D4();
    var_6 _id_A78A::_id_834C( "any" );
    var_6._id_6307 = 1;
    var_6._id_6310 = 1.0;
    var_6._id_0AB5 = 0;
    var_6._id_1BBB = "iw5_carrydrone_mp";
    var_6._id_52D9 = 1;
    var_6._id_A28D = 0;
    var_6._id_9E92 = ( 0, 0, 30 );
    var_6._id_1AFB = ::_id_1285;
    var_6._id_64BF = ::_id_12AE;
    var_6._id_7F57 = ::_id_12C9;
    var_6._id_64DD = ::_id_12B1;
    var_6._id_1BBC = ::_id_12B3;
    var_6._id_4C01 = 0;
    var_6._id_5582 = 0;
    var_6._id_740C = 1;
    var_6 _id_1280( var_1 );
    level._id_12D9[level._id_12D9.size] = var_6;
    var_6 _id_1298();
    var_6 thread _id_12AA( var_0 );
    setomnvar( "ui_mlg_game_mode_status_1", -1 );
    setomnvar( "ui_mlg_game_mode_status_2", -1 );
    setomnvar( "ui_mlg_game_mode_status_3", 3 );
}

_id_67F9()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "physics_impact", var_0, var_1, var_2, var_3 );
        var_4 = level._id_058F["ball_physics_impact"];

        if ( isdefined( var_3 ) && isdefined( level._id_058F["ball_physics_impact_" + var_3] ) )
            var_4 = level._id_058F["ball_physics_impact_" + var_3];

        playfx( var_4, var_0, var_1 );
        wait 0.3;
    }
}

_id_12AA( var_0 )
{
    if ( var_0 > 4 || var_0 < 0 )
        return;

    for (;;)
    {
        var_1 = _id_A4F0::_id_A067( "pickup_object", "dropped", "reset" );

        switch ( var_1 )
        {
            case "pickup_object":
                setomnvar( "ui_uplink_ball_carrier" + ( var_0 + 1 ), self._id_1BAF _meth_81B1() );
                continue;
            case "dropped":
                setomnvar( "ui_uplink_ball_carrier" + ( var_0 + 1 ), -2 );
                continue;
            case "reset":
                setomnvar( "ui_uplink_ball_carrier" + ( var_0 + 1 ), -1 );
                continue;
            default:
                continue;
        }
    }
}

_id_12D4()
{
    _id_A78A::_id_7F0C( "friendly", "waypoint_ball" );
    _id_A78A::_id_7F0C( "enemy", "waypoint_ball" );
    _id_A78A::_id_7F0D( "friendly", "waypoint_ball" );
    _id_A78A::_id_7F0D( "enemy", "waypoint_ball" );
    _id_A75A::_id_7FA8( self, "waypoint_esports_uplink_ball_white" );
}

_id_12D3()
{
    _id_A78A::_id_7F0C( "friendly", "waypoint_ball_friendly" );
    _id_A78A::_id_7F0C( "enemy", "waypoint_ball_enemy" );
    _id_A78A::_id_7F0D( "friendly", "waypoint_ball_friendly" );
    _id_A78A::_id_7F0D( "enemy", "waypoint_ball_enemy" );

    if ( self._id_6637 == "allies" )
        _id_A75A::_id_7FA8( self, "waypoint_esports_uplink_ball_blue" );
    else
        _id_A75A::_id_7FA8( self, "waypoint_esports_uplink_ball_red" );
}

_id_12D2()
{
    _id_A78A::_id_7F0C( "friendly", "waypoint_ball_download" );
    _id_A78A::_id_7F0C( "enemy", "waypoint_ball_download" );
    _id_A78A::_id_7F0D( "friendly", "waypoint_ball_download" );
    _id_A78A::_id_7F0D( "enemy", "waypoint_ball_download" );
    _id_A75A::_id_7FA8( self, "waypoint_esports_uplink_ball_white" );
}

_id_12D5()
{
    _id_A78A::_id_7F0C( "friendly", "waypoint_ball_upload" );
    _id_A78A::_id_7F0C( "enemy", "waypoint_ball_upload" );
    _id_A78A::_id_7F0D( "friendly", "waypoint_ball_upload" );
    _id_A78A::_id_7F0D( "enemy", "waypoint_ball_upload" );
    _id_A75A::_id_7FA8( self, "waypoint_esports_uplink_ball_white" );
}

_id_1293()
{
    self._id_9E93[0] _meth_8092();
    self._id_1297 = 0;
}

_id_1298()
{
    if ( !_id_1297() )
    {
        var_0 = self._id_9E93[0];
        playfxontag( _id_A4F0::_id_3FA6( "ball_trail" ), var_0, "tag_origin" );
        playfxontag( _id_A4F0::_id_3FA6( "ball_idle" ), var_0, "tag_origin" );
        self._id_1297 = 1;
    }
}

_id_1299( var_0 )
{
    if ( _id_1297() )
    {
        var_1 = self._id_9E93[0];
        playfxontagforclients( _id_A4F0::_id_3FA6( "ball_trail" ), var_1, "tag_origin", var_0 );
        playfxontagforclients( _id_A4F0::_id_3FA6( "ball_idle" ), var_1, "tag_origin", var_0 );
    }
}

_id_129A()
{
    if ( _id_1297() )
    {
        var_0 = self._id_9E93[0];
        stopfxontag( _id_A4F0::_id_3FA6( "ball_trail" ), var_0, "tag_origin" );
        killfxontag( _id_A4F0::_id_3FA6( "ball_idle" ), var_0, "tag_origin" );
    }

    self._id_1297 = 0;
}

_id_1297()
{
    return isdefined( self._id_1297 ) && self._id_1297;
}

_id_12B3()
{
    self endon( "disconnect" );
    thread _id_12B7();
    thread _id_12CA();
    self._id_1BB6 waittill( "dropped" );
}

_id_12B7()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    for (;;)
    {
        self waittill( "ball_pass", var_0 );

        if ( var_0 != "iw5_carrydrone_mp" )
            continue;

        if ( !isdefined( self._id_66AF ) )
        {
            self _meth_826E( "No Pass Target" );
            continue;
        }

        break;
    }

    if ( isdefined( self._id_1BB6 ) )
    {
        thread _id_12B4();
        var_1 = self._id_66AF;
        var_2 = self._id_66AF._id_02E6;
        wait 0.15;

        if ( isdefined( self._id_66AF ) )
            var_1 = self._id_66AF;

        self._id_1BB6 thread _id_12B5( self, var_1, var_2 );
    }
}

_id_12B5( var_0, var_1, var_2 )
{
    _id_12C9( 1 );

    if ( isdefined( var_1 ) )
        var_2 = var_1._id_02E6;

    var_3 = ( 0, 0, 40 );
    var_4 = vectornormalize( var_2 + var_3 - self._id_9E93[0]._id_02E6 );
    var_5 = var_4 * 1000;
    self._id_700E = _func_071( "gamemode_ball", self._id_9E93[0]._id_02E6, var_5, 30, var_0, 1 );

    if ( isdefined( var_1 ) )
        self._id_700E _meth_81D9( var_1 );

    self._id_9E93[0] _meth_804D( self._id_700E );
    _id_1293();
    _id_1290();
    _id_128D();
    thread _id_12B0();
    thread _id_12AF();
    thread _id_12B6();
}

_id_1290()
{
    if ( isdefined( self._id_534A ) )
        self._id_534A delete();

    self._id_534A = spawn( "script_model", self._id_9E93[0]._id_02E6 );
    self._id_534A _meth_804D( self._id_9E93[0] );
    self._id_534A _meth_80BE( 0 );
    self._id_534A _meth_834D( "explosive" );
}

_id_128D()
{
    self._id_9E93[0]._id_6397 = self._id_9E93[0] _meth_80BE( 0 );
}

_id_12C5()
{
    if ( isdefined( self._id_9E93[0]._id_6397 ) )
    {
        self._id_9E93[0] _meth_80BE( self._id_9E93[0]._id_6397 );
        self._id_9E93[0]._id_6397 = undefined;
    }
}

_id_12B0()
{
    self endon( "pass_end" );
    self._id_700E waittill( "projectile_impact_player", var_0 );
    self._id_04C6 notify( "trigger", var_0 );
}

_id_12AF()
{
    self._id_700E waittill( "death" );
    var_0 = self._id_9E93[0];

    if ( !isdefined( self._id_1BAF ) && !self._id_4C01 )
    {
        if ( var_0._id_02E6 != var_0._id_1315 + ( 0, 0, 4000 ) )
            _id_12BB( ( 0, 0, 10 ) );
    }

    _id_12C5();
    var_0 notify( "pass_end" );
}

_id_12CA()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );
    var_0 = getdvarfloat( "scr_ball_shoot_extra_pitch", -12 );
    var_1 = getdvarfloat( "scr_ball_shoot_force", 320 );

    for (;;)
    {
        self waittill( "weapon_fired", var_2 );

        if ( var_2 != "iw5_carrydrone_mp" )
            continue;

        break;
    }

    if ( isdefined( self._id_1BB6 ) )
    {
        var_3 = self _meth_833B();
        var_3 += ( var_0, 0, 0 );
        var_3 = ( clamp( var_3[0], -85, 85 ), var_3[1], var_3[2] );
        var_4 = anglestoforward( var_3 );
        thread _id_12B4();
        wait 0.25;
        self _meth_809A( "mp_ul_ball_throw" );
        thread _id_128C( self._id_1BB6 );
        self._id_1BB6 _id_1290();
        self._id_1BB6 thread _id_12BC( var_4 * var_1, self );
    }
}

_id_12B4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self._id_66AC = 1;
    self _meth_8130( 0 );

    while ( "iw5_carrydrone_mp" == self _meth_8311() )
        waittillframeend;

    self _meth_8130( 1 );
    self._id_66AC = 0;
}

_id_12BC( var_0, var_1 )
{
    _id_12C9( 1 );
    _id_12BB( var_0, var_1 );
}

_id_12BB( var_0, var_1 )
{
    var_2 = self._id_9E93[0];
    var_2._id_6594 = undefined;
    _id_1298();
    var_2 _meth_8276( var_2._id_02E6, var_0 );
    thread _id_12BD();
    thread _id_12BE( var_1 );
    thread _id_12B9();
    thread _id_12C0();
    thread _id_12BF( var_1 );
}

_id_12C6()
{
    self._id_4C01 = 0;
    var_0 = self._id_9E93[0];
    playsoundatpos( var_0._id_02E6, "uplink_out_of_bounds" );
    playfx( _id_A4F0::_id_3FA6( "ball_teleport" ), var_0._id_02E6 );

    if ( isdefined( self._id_1BAF ) )
        self._id_1BAF _id_A75A::_id_27EE( 0.05, ::_id_6C43 );

    thread _id_A78A::_id_74DC();
}

_id_12BD()
{
    self endon( "reset" );
    self endon( "pickup_object" );
    var_0 = self._id_9E93[0];
    var_1[0] = 200;
    var_1[1] = 200;
    var_1[2] = 1000;
    var_2[0] = 200;
    var_2[1] = 200;
    var_2[2] = 200;

    for (;;)
    {
        for ( var_3 = 0; var_3 < 2; var_3++ )
        {
            if ( var_0._id_02E6[var_3] > level._id_12AB[var_3] + var_1[var_3] )
            {
                _id_12C6();
                return;
            }

            if ( var_0._id_02E6[var_3] < level._id_12AC[var_3] - var_2[var_3] )
            {
                _id_12C6();
                return;
            }
        }

        waittillframeend;
    }
}

_id_12BE( var_0 )
{
    self endon( "reset" );
    self endon( "pickup_object" );
    self endon( "score_event" );
    var_1 = getdvarfloat( "scr_ball_reset_time", 15 );
    var_2 = 10;
    var_3 = 3;

    if ( var_1 >= var_2 )
    {
        setomnvar( "ui_mlg_game_mode_status_1", var_3 );
        setomnvar( "ui_mlg_game_mode_status_2", -1 );
        var_4 = getomnvar( "ui_mlg_game_mode_status_3" );

        if ( !isdefined( var_0 ) )
        {
            if ( var_4 == 1 || var_4 == 4 || var_4 == 5 )
                setomnvar( "ui_mlg_game_mode_status_3", 5 );
            else
                setomnvar( "ui_mlg_game_mode_status_3", 7 );
        }
        else if ( var_4 == 1 || var_4 == 4 || var_4 == 5 )
            setomnvar( "ui_mlg_game_mode_status_3", 4 );
        else
            setomnvar( "ui_mlg_game_mode_status_3", 6 );

        wait(var_3);
        var_1 -= var_3;
    }

    setomnvar( "ui_mlg_game_mode_status_1", int( var_1 ) );
    setomnvar( "ui_mlg_game_mode_status_2", -1 );
    setomnvar( "ui_mlg_game_mode_status_3", 0 );
    wait(var_1);
    _id_12C6();
}

_id_12B9()
{
    self._id_9E93[0] endon( "physics_finished" );
    thread _id_12B8();
    wait 0.1;

    for (;;)
    {
        if ( _id_A78A::_id_51D4() )
        {
            _id_12C6();
            return;
        }

        waittillframeend;
    }
}

_id_12B8()
{
    self endon( "pickup_object" );
    self endon( "reset" );
    self endon( "score_event" );
    var_0 = self._id_9E93[0];
    var_0 endon( "death" );
    var_0 waittill( "physics_finished" );

    if ( _id_A78A::_id_51D4() )
    {
        _id_12C6();
        return;
    }
}

_id_12C0()
{
    var_0 = self._id_9E93[0];
    var_0 endon( "physics_finished" );
    _id_12CE( var_0 );
}

_id_12BF( var_0 )
{
    var_1 = self._id_9E93[0];
    var_2 = self._id_04C6;
    var_1 endon( "physics_finished" );

    for (;;)
    {
        var_2 waittill( "trigger", var_3 );

        if ( isdefined( var_0 ) && var_0 == var_3 && var_3 _id_6BA9() )
            continue;

        if ( self._id_2F93 >= gettime() )
            continue;

        if ( var_1._id_02E6 == var_1._id_1315 + ( 0, 0, 4000 ) )
            continue;

        if ( !_id_1285( var_3 ) )
            thread _id_12BA();
    }
}

_id_12BA()
{
    var_0 = self._id_9E93[0];

    if ( !var_0 _meth_852A() )
        return;

    var_1 = var_0 _meth_8414();
    var_2 = length( var_1 ) / 10;
    var_3 = -1 * vectornormalize( var_1 );
    var_0 _meth_84E1();
    var_0 _meth_8276( var_0._id_02E6, var_3 * var_2 );
}

_id_12B6()
{
    var_0 = self._id_9E93[0];
    var_0 endon( "pass_end" );
    _id_12CE( var_0 );
}

_id_12CE( var_0 )
{
    for (;;)
    {
        foreach ( var_5, var_2 in level._id_12A2 )
        {
            if ( self._id_5583 == var_5 )
                continue;

            if ( !var_2._id_9C02 _id_129E() )
                continue;

            var_3 = distance( var_0._id_02E6, var_2._id_02E6 );

            if ( var_3 <= var_2._id_0354 )
            {
                thread _id_12CF( var_2 );
                return;
            }

            if ( isdefined( var_0._id_6594 ) )
            {
                var_4 = _id_5765( var_0._id_6594, var_0._id_02E6, var_2._id_02E6, var_2._id_0354 );

                if ( var_4 )
                {
                    thread _id_12CF( var_2 );
                    return;
                }
            }
        }

        waittillframeend;
    }
}

_id_129E( var_0 )
{
    var_1 = self._id_01C1;

    if ( var_1._id_12A4 )
        return 0;

    return 1;
}

_id_128A( var_0 )
{
    var_1 = getdvarint( "scr_ball_points_touchdown", 2 );

    if ( !isdefined( var_0 ) || !isdefined( var_0._id_1BB6 ) )
        return;

    if ( isdefined( var_0._id_1BB6.scorefrozenuntil ) && var_0._id_1BB6.scorefrozenuntil > gettime() )
        return;

    var_0._id_1BB6.scorefrozenuntil = gettime() + 10000;
    var_0 _id_A72E::_id_93FD( var_1 );
    _id_128B( var_0, 1 );
    var_0 thread _id_12D1();
    var_2 = self._id_01C1._id_04A8;
    var_3 = _id_A75A::_id_4065( var_2 );
    _id_A75A::_id_5648( "enemy_carry_score", var_2, "status" );
    _id_A75A::_id_5648( "ally_carry_score", var_3, "status" );

    if ( _id_846D( var_3, var_1 ) )
    {
        var_4 = self._id_01C1._id_534A;
        var_5 = var_4 _meth_81B1();
        var_6 = var_4._id_007D;

        if ( !isdefined( var_6 ) )
            var_6 = 0;

        var_0._id_2670 = gettime();
        _id_A783::_id_7286( 5.0, var_0, var_0, var_0 _meth_81B1(), var_5, var_6, "none", 0, 0, undefined, "score" );
    }

    _id_12C3( self._id_01C1 );
    _id_12C8( var_3 );

    if ( isdefined( var_0._id_83D3 ) )
        var_0._id_83D3._id_020E = 0;

    var_7 = var_0._id_1BB6;
    var_7._id_5582 = 1;
    var_7 _id_12C9( 1 );
    var_7 thread _id_12C7( self._id_01C1 );
    _id_129D( var_3, var_1 );
}

_id_12D1()
{
    waitframe;
    var_0 = _id_A75A::_id_408D( "fieldgoal" );
    var_1 = _id_A75A::_id_408D( "touchdown" );
    var_2 = getdvarint( "scr_ball_points_fieldgoal", 1 );
    var_3 = getdvarint( "scr_ball_points_touchdown", 2 );
    _id_A75A::_id_7F65( var_0 * var_2 + var_1 * var_3 );
}

_id_846D( var_0, var_1 )
{
    var_2 = _id_A78B::_id_05BD( var_0 );
    var_3 = _id_A78B::_id_05BD( _id_A75A::_id_4065( var_0 ) );
    return var_2 + var_1 >= var_3;
}

_id_5765( var_0, var_1, var_2, var_3 )
{
    var_4 = vectornormalize( var_1 - var_0 );
    var_5 = vectordot( var_4, var_0 - var_2 );
    var_5 *= var_5;
    var_6 = var_0 - var_2;
    var_6 *= var_6;
    var_7 = var_3 * var_3;
    return var_5 - var_6 + var_7 >= 0;
}

_id_12CF( var_0 )
{
    _id_12C3( var_0 );
    var_1 = getdvarint( "scr_ball_points_fieldgoal", 1 );

    if ( isdefined( self.scorefrozenuntil ) && self.scorefrozenuntil > gettime() )
        return;

    self.scorefrozenuntil = gettime() + 10000;
    var_2 = var_0._id_04A8;
    var_3 = _id_A75A::_id_4065( var_2 );
    _id_A75A::_id_5648( "enemy_throw_score", var_2, "status" );
    _id_A75A::_id_5648( "ally_throw_score", var_3, "status" );

    if ( isdefined( self._id_5581 ) )
    {
        self._id_5582 = 1;
        self._id_5581 _id_A72E::_id_36A1( var_1 );
        _id_128B( self._id_5581, 0 );
        self._id_5581 thread _id_12D1();

        if ( isdefined( self._id_534A ) && _id_846D( var_3, var_1 ) )
        {
            var_4 = self._id_534A;
            var_5 = var_4 _meth_81B1();
            var_6 = var_4._id_007D;

            if ( !isdefined( var_6 ) )
                var_6 = 0;

            var_7 = self._id_5581;
            var_0._id_534A._id_2670 = gettime();
            _id_A783::_id_7286( 5.0, var_0._id_534A, var_7, var_7 _meth_81B1(), var_5, var_6, "none", 0, 0, undefined, "score" );
        }
    }

    if ( isdefined( self._id_534A ) )
        self._id_534A _meth_804F();

    _id_12C8( var_3 );
    thread _id_12C7( var_0 );
    _id_129D( var_3, var_1 );
    setomnvar( "ui_mlg_game_mode_status_1", -1 );

    if ( isdefined( self._id_5581 ) )
        setomnvar( "ui_mlg_game_mode_status_2", self._id_5581 _meth_81B1() );
    else
        setomnvar( "ui_mlg_game_mode_status_2", -1 );

    if ( var_3 == "allies" )
        setomnvar( "ui_mlg_game_mode_status_3", 1 );
    else
        setomnvar( "ui_mlg_game_mode_status_3", 2 );
}

_id_129D( var_0, var_1 )
{
    level _id_A78B::_id_4209( var_0, var_1 );

    if ( game["status"] == "overtime" )
    {
        game["ball_overtime_team"] = var_0;
        game["round_time_to_beat"] = _id_A75A::_id_4022();
        level thread _id_A789::_id_315E( "overtime_halftime", game["end_reason"]["switching_sides"] );
    }
    else if ( game["status"] == "overtime_halftime" )
    {
        var_2 = _id_A78B::_id_05BD( var_0 );
        var_3 = _id_A78B::_id_05BD( _id_A75A::_id_4065( var_0 ) );

        if ( var_2 >= var_3 )
            level thread _id_A789::_id_315E( var_0, game["end_reason"]["score_limit_reached"] );
    }
}

_id_12C7( var_0 )
{
    self notify( "score_event" );
    self._id_4C01 = 1;
    var_0._id_12A4 = 1;
    var_1 = self._id_9E93[0];

    if ( isdefined( self._id_700E ) )
        self._id_700E delete();

    var_1 _meth_84E1();
    _id_A78A::_id_0AA1( "none" );
    _id_12D5();
    var_2 = 0.4;
    var_3 = 1.2;
    var_4 = 1.0;
    playsoundatpos( var_0._id_02E6, "uplink_goal_point" );
    var_5 = var_2 + var_4;
    var_6 = var_5 + var_3;
    var_1 _meth_82AE( var_0._id_02E6, var_2, 0, var_2 );
    var_1 _meth_82BD( ( 1080, 1080, 0 ), var_6, var_6, 0 );
    wait(var_5);
    var_0._id_12A4 = 0;
    var_1 _meth_82B1( 4000, var_3, var_3 * 0.1, 0 );
    wait(var_3);
    _id_A78A::_id_0AA1( "any" );
    _id_12C6();
}

_id_128B( var_0, var_1 )
{
    if ( !isdefined( var_0._id_66B8 ) || !isdefined( var_0._id_66B7 ) )
        return;

    if ( var_0._id_66B8 + 3000 < gettime() )
        return;

    var_0._id_66B7 _id_A72E::_id_12DA();

    if ( var_1 )
        var_0 _id_A7A0::_id_6FF3( "ch_ball_alleyoop" );
}

_id_12C3( var_0 )
{
    var_0._id_7889["friendly"] _meth_8054();
    var_0._id_7889["enemy"] _meth_8054();

    foreach ( var_2 in level._id_0328 )
    {
        var_3 = _id_129C( var_2 );

        if ( var_3 == var_0._id_04A8 )
        {
            var_0._id_7889["friendly"] _meth_8007( var_2 );
            continue;
        }

        var_0._id_7889["enemy"] _meth_8007( var_2 );
    }

    triggerfx( var_0._id_7889["friendly"] );
    triggerfx( var_0._id_7889["enemy"] );
}

_id_12C8( var_0 )
{
    _id_12C2( var_0, "mp_obj_notify_pos_lrg", "mp_obj_notify_neg_lrg" );
}

_id_12C2( var_0, var_1, var_2 )
{
    var_3 = _id_A75A::_id_4065( var_0 );

    foreach ( var_5 in level._id_0328 )
    {
        if ( var_5._id_04A8 == var_0 )
        {
            var_5 _meth_82F4( var_1 );
            continue;
        }

        if ( var_5._id_04A8 == var_3 )
            var_5 _meth_82F4( var_2 );
    }
}

_id_1285( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( isdefined( var_0._id_99FC ) && var_0._id_99FC )
        return 0;

    if ( isdefined( self._id_2F93 ) && self._id_2F93 >= gettime() )
        return 0;

    if ( !var_0 _id_A4F0::_id_5204() )
        return 0;

    if ( var_0 _meth_8342() )
        return 0;

    if ( isdefined( var_0._id_5978 ) && var_0._id_5978 )
        return 0;

    if ( isdefined( var_0._id_9C1E ) && var_0._id_9C1E )
        return 0;

    var_1 = var_0 _meth_8311();

    if ( isdefined( var_1 ) )
    {
        if ( !_id_9C3C( var_1 ) )
            return 0;
    }

    var_2 = var_0._id_1C87;

    if ( isdefined( var_2 ) && var_0 _meth_8337() )
    {
        if ( !_id_9C3C( var_2 ) )
            return 0;
    }

    if ( isdefined( var_0._id_34E9 ) && var_0._id_34E9 == 1 )
        return 0;

    if ( var_0 _id_A75A::_id_512E() )
        return 0;

    if ( var_0 _id_6BA9() )
        return 0;

    return 1;
}

_id_9C3C( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( var_0 == "iw5_carrydrone_mp" )
        return 0;

    if ( _id_A75A::_id_513A( var_0 ) )
        return 0;

    if ( var_0 == "iw5_combatknifegoliath_mp" )
        return 0;

    return 1;
}

_id_6BA9()
{
    return isdefined( self._id_6154 ) && self._id_6154 > gettime();
}

_id_12AE( var_0 )
{
    level._id_9C0C = 0;
    var_1 = self._id_9E93[0] _meth_83EC();

    if ( isdefined( var_1 ) )
        self._id_9E93[0] _meth_804F();

    self._id_9E93[0] _meth_84E1();
    self._id_9E93[0] _id_A747::_id_6210();
    self._id_9E93[0] _meth_8053();
    self._id_9E93[0] _meth_8510();
    self._id_9E93[0] _meth_8568( 0 );
    self._id_04C6 _id_A747::_id_8E8D();
    self._id_24FB._id_4C0D = 0;
    var_2 = 0;

    if ( isdefined( self._id_700E ) )
    {
        var_2 = 1;
        self._id_700E delete();
    }

    var_3 = var_0._id_04A8;
    var_4 = _id_A75A::_id_4065( var_0._id_04A8 );

    if ( var_2 )
    {
        if ( self._id_5583 == var_0._id_04A8 )
        {
            _id_A75A::_id_5648( "pass_complete", var_3, "status" );
            var_0._id_66B8 = gettime();
            var_0._id_66B7 = self._id_5581;
        }
        else
        {
            _id_A75A::_id_5648( "pass_intercepted", var_3, "status" );
            var_0 _id_A72E::_id_4EA7();
        }
    }
    else
    {
        _id_A75A::_id_5648( "ally_own_drone", var_3, "status", [ var_0 ] );
        var_0 _id_A75A::_id_5652( "you_own_drone", "status" );
        _id_A75A::_id_5648( "enemy_own_drone", var_4, "status" );
    }

    var_0 _meth_809A( "mp_ul_ball_catch" );
    _id_12C2( var_3, "mp_obj_notify_pos_sml", "mp_obj_notify_neg_sml" );
    _id_129A();
    self._id_5582 = 0;
    self._id_5581 = var_0;
    self._id_5583 = var_0._id_04A8;
    self._id_6637 = var_0._id_04A8;
    _id_12D3();
    var_0 _meth_82F6( "iw5_carrydrone_mp", 1 );
    var_0.balldropdelay = getdvarint( "scr_ball_water_drop_delay", 10 );
    var_0 _id_A75A::_id_41F5( "specialty_ballcarrier", 0 );
    var_0._id_1287 = self;
    var_0._id_02D6 = 1;
    setomnvar( "ui_mlg_game_mode_status_1", -1 );
    setomnvar( "ui_mlg_game_mode_status_2", self._id_1BAF _meth_81B1() );

    if ( self._id_1BAF._id_04A8 == "allies" )
        setomnvar( "ui_mlg_game_mode_status_3", 1 );
    else
        setomnvar( "ui_mlg_game_mode_status_3", 2 );

    var_0._id_473B = var_0 _meth_82A7( "specialty_sprintfire", 1 );
    var_0 _id_A75A::_id_41F5( "specialty_sprintfire", 0 );
    var_0 _id_A4F0::_id_0586();
    var_0 _id_A7BB::_id_6D65();
    var_5 = getdvarint( "scr_ball_armor", 100 );

    if ( var_5 > 0 )
        var_0 thread _id_A7DB::_id_7F9A( var_5 );
    else
        var_0 thread _id_A7DB::_id_9A74();

    var_0 thread _id_6C42( self );
    _id_A789::_id_7F7F( var_0, 1 );
}

_id_128C( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 endon( "reset" );
    var_1 = spawnstruct();
    var_1 endon( "timer_done" );
    var_1 thread _id_9370( 1.5 );
    var_0 waittill( "pickup_object" );
    var_1 _id_936D();

    if ( !isdefined( var_0._id_1BAF ) || var_0._id_1BAF._id_04A8 == self._id_04A8 )
        return;

    var_0._id_1BAF endon( "disconnect" );
    var_1 thread _id_9370( 5 );
    var_0._id_1BAF waittill( "death", var_2 );
    var_1 _id_936D();

    if ( !isdefined( var_2 ) || var_2 != self )
        return;

    var_1 thread _id_9370( 2 );
    var_0 waittill( "pickup_object" );
    var_1 _id_936D();

    if ( isdefined( var_0._id_1BAF ) && var_0._id_1BAF == self )
        _id_A72E::_id_66B5();
}

_id_9370( var_0 )
{
    self endon( "cancel_timer" );
    wait(var_0);
    self notify( "timer_done" );
}

_id_936D()
{
    self notify( "cancel_timer" );
}

_id_6C42( var_0 )
{
    self endon( "disconnect" );
    self endon( "cancel_update_pass_target" );
    _id_6C43();
    childthread _id_6B75();
    var_1 = 0.8;

    for (;;)
    {
        var_2 = undefined;

        if ( !self _meth_801A() )
        {
            var_3 = anglestoforward( self _meth_833B() );
            var_4 = self _meth_80A8();
            var_5 = [];

            foreach ( var_7 in level._id_0328 )
            {
                if ( var_7._id_04A8 != self._id_04A8 )
                    continue;

                if ( !_id_A75A::_id_5186( var_7 ) )
                    continue;

                if ( !var_0 _id_1285( var_7 ) )
                    continue;

                var_8 = var_7 _meth_80A8();
                var_9 = distancesquared( var_8, var_4 );

                if ( var_9 > 1000000 )
                    continue;

                var_10 = vectornormalize( var_8 - var_4 );
                var_11 = vectordot( var_3, var_10 );

                if ( var_11 > var_1 )
                {
                    var_7._id_66A7 = var_11;
                    var_7._id_66AD = var_8;
                    var_5[var_5.size] = var_7;
                }
            }

            var_5 = _id_A75A::_id_70A1( var_5, ::_id_20C4 );

            foreach ( var_7 in var_5 )
            {
                if ( sighttracepassed( var_4, var_7._id_66AD, 0, self, var_7 ) )
                {
                    var_2 = var_7;
                    break;
                }
            }
        }

        _id_6C03( var_2 );
        waittillframeend;
    }
}

_id_6B75()
{
    for (;;)
    {
        level waittill( "joined_team", var_0 );
        _id_6C43();
    }
}

_id_6C43()
{
    if ( !isdefined( self ) )
        return;

    self _meth_8423( level._id_0328 );

    foreach ( var_1 in level._id_0328 )
        var_1 _meth_8421( self );

    var_3 = [];
    var_4 = [];
    var_5 = _id_A75A::_id_4065( self._id_04A8 );

    foreach ( var_1 in level._id_0328 )
    {
        if ( var_1 == self )
            continue;

        if ( var_1._id_04A8 == self._id_04A8 )
        {
            var_3[var_3.size] = var_1;
            continue;
        }

        if ( var_1._id_04A8 == var_5 )
            var_4[var_4.size] = var_1;
    }

    if ( isdefined( self._id_1BB6 ) )
    {
        foreach ( var_1 in var_3 )
        {
            var_9 = isdefined( self._id_66AF ) && self._id_66AF == var_1;

            if ( !var_9 )
                var_1 _meth_8420( self, 4, 0 );
        }

        if ( isdefined( self._id_66AF ) )
            self._id_66AF _meth_8420( self, 5, 0 );

        if ( var_4.size > 0 )
            self _meth_8422( var_4, 0, 1 );

        if ( var_3.size > 0 )
            self _meth_8422( var_3, 5, 0 );
    }
}

_id_6C03( var_0 )
{
    if ( isdefined( self._id_66AF ) && isdefined( var_0 ) && self._id_66AF == var_0 )
        return;

    if ( !isdefined( self._id_66AF ) && !_func_294( self._id_66AF ) && !isdefined( var_0 ) )
        return;

    _id_6AAE();

    if ( isdefined( var_0 ) )
    {
        var_1 = ( 0, 0, 80 );
        self._id_66A9 = var_0 _id_A72D::_id_7F80( self, "waypoint_ball_pass", var_1, 10, 10, 0, 0.05, 0, 1, 0, 0, "tag_origin" );
        self._id_66AF = var_0;
        var_2 = [];

        foreach ( var_4 in level._id_0328 )
        {
            if ( var_4._id_04A8 == self._id_04A8 && var_4 != self && var_4 != var_0 )
                var_2[var_2.size] = var_4;
        }

        self _meth_82FB( "ui_uplink_can_pass", 1 );
        self _meth_850E( 1 );
    }

    _id_6C43();
}

_id_6AAE()
{
    if ( isdefined( self._id_66A9 ) )
        self._id_66A9 _meth_8088();

    self _meth_82FB( "ui_uplink_can_pass", 0 );
    var_0 = [];

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2._id_04A8 == self._id_04A8 && var_2 != self )
            var_0[var_0.size] = var_2;
    }

    self._id_66AF = undefined;
    self _meth_850E( 0 );
    _id_6C43();
}

_id_20C4( var_0, var_1 )
{
    return var_0._id_66A7 >= var_1._id_66A7;
}

_id_12C9( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    self._id_518B = 1;
    self._id_2F93 = gettime();
    self notify( "dropped" );
    var_1 = self._id_1BAF;

    if ( isdefined( var_1 ) && var_1._id_04A8 != "spectator" )
        var_2 = var_1._id_02E6;
    else
        var_2 = self._id_77C9;

    var_2 += ( 0, 0, 40 );
    var_3 = ( 0, 0, 0 );

    for ( var_4 = 0; var_4 < self._id_9E93.size; var_4++ )
    {
        self._id_9E93[var_4]._id_02E6 = var_2;
        self._id_9E93[var_4]._id_0041 = var_3;
        self._id_9E93[var_4] _meth_8053();
        self._id_9E93[var_4] _meth_8568( 1 );
    }

    self._id_04C6._id_02E6 = var_2;
    _id_1293();
    self._id_24C8 = self._id_04C6._id_02E6;
    _id_1288();
    _id_1298();
    self._id_6637 = "any";
    _id_12D4();
    _id_A78A::_id_1EE6();

    if ( isdefined( var_1 ) )
        var_1 _id_6C43();

    _id_A78A::_id_9B01();
    _id_A78A::_id_9BA1();
    self._id_518B = 0;

    if ( !var_0 )
    {
        var_5 = self._id_5583;
        var_6 = _id_A75A::_id_4065( var_5 );
        _id_A75A::_id_5648( "ally_drop_drone", var_5, "status" );
        _id_A75A::_id_5648( "enemy_drop_drone", var_6, "status" );
        _id_12BB( ( 0, 0, 80 ) );
    }

    var_7 = spawnstruct();
    var_7._id_1BB6 = self;
    var_7._id_2662 = ::_id_12B2;
    self._id_04C6 thread _id_A747::_id_45BC( var_7 );
    return 1;
}

_id_12B2( var_0 )
{

}

_id_127F()
{
    var_0 = undefined;
    var_1 = _id_A4F0::_id_0CF5( level._id_12CC );

    foreach ( var_3 in var_1 )
    {
        if ( var_3._id_4C0D )
            continue;

        var_0 = var_3;
        break;
    }

    if ( !isdefined( var_0 ) )
        return;

    _id_1280( var_0 );
}

_id_1280( var_0 )
{
    foreach ( var_2 in self._id_9E93 )
        var_2._id_1315 = var_0._id_02E6;

    self._id_04C6._id_1315 = var_0._id_02E6;
    self._id_24FB = var_0;
    var_0._id_4C0D = 1;
}

_id_12B1()
{
    _id_127F();
    var_0 = self._id_9E93[0];
    var_0 _id_A747::_id_6210();
    var_1 = var_0 _meth_83EC();

    if ( isdefined( var_1 ) )
        var_0 _meth_804F();

    var_0 _meth_84E1();
    _id_1293();

    if ( isdefined( self._id_700E ) )
        self._id_700E delete();

    var_2 = "none";
    var_3 = self._id_5583;

    if ( isdefined( var_3 ) )
        var_2 = _id_A75A::_id_4065( var_3 );

    _id_1288();
    setomnvar( "ui_mlg_game_mode_status_1", -1 );
    setomnvar( "ui_mlg_game_mode_status_2", -1 );
    setomnvar( "ui_mlg_game_mode_status_3", 3 );
    self._id_04C6 _id_A747::_id_8E8D();
    _id_12D2();
    _id_A78A::_id_7FED( var_0._id_1315 + ( 0, 0, 4000 ), ( 0, 0, 0 ) );
    var_4 = 3;
    var_0 _meth_82AE( var_0._id_1315, var_4, 0, var_4 );
    var_0 _meth_82BD( ( 0, 720, 0 ), var_4, 0, var_4 );
    playsoundatpos( var_0._id_1315, "uplink_ball_reset" );

    if ( !self._id_5582 && isdefined( var_3 ) && isdefined( var_2 ) )
    {
        _id_A75A::_id_5648( "drone_reset", var_3, "status" );
        _id_A75A::_id_5648( "drone_reset", var_2, "status" );

        if ( isdefined( self._id_5581 ) )
            thread _id_A75A::_id_91F3( "callout_ballreset", self._id_5581 );
    }

    self._id_6637 = "any";
    _id_12D2();
    thread _id_1295( var_4 );
    thread _id_1294( var_0, var_4 );
}

_id_1294( var_0, var_1 )
{
    playfxontag( level._id_058F["ball_download"], var_0, "tag_origin" );
    _id_A4F0::_id_A097( "pickup_object", var_1 );
    stopfxontag( level._id_058F["ball_download"], var_0, "tag_origin" );
    self.scorefrozenuntil = 0;
}

_id_1295( var_0 )
{
    self endon( "pickup_object" );
    wait(var_0);
    _id_12D4();
    playfx( level._id_058F["ball_download_end"], self._id_24FB._id_440D );
    _id_1298();
}

_id_1288()
{
    if ( isdefined( self._id_1BAF ) )
    {
        self._id_1BAF.balldropdelay = undefined;
        self._id_1BAF._id_6154 = gettime() + 500;
        self._id_1BAF _id_6AAE();
        self._id_1BAF notify( "cancel_update_pass_target" );
        self._id_1BAF _id_A75A::_id_067B( "specialty_ballcarrier" );
        self._id_1BAF._id_1287 = undefined;
        self._id_1BAF thread _id_A7DB::_id_9A74();

        if ( !self._id_1BAF._id_473B )
            self._id_1BAF _id_A75A::_id_067B( "specialty_sprintfire" );

        self._id_1BAF _id_A4F0::_id_0594();
        self._id_1BAF _id_A7BB::_id_6D5F();
        self._id_1BAF _meth_850E( 0 );
        self._id_1BAF _meth_82FB( "ui_uplink_can_pass", 0 );
        self._id_1BAF._id_02D6 = 0;
    }
}

_id_1296( var_0 )
{
    var_1 = self._id_02E6 + ( 0, 0, 32 );
    var_2 = self._id_02E6 + ( 0, 0, -1000 );
    var_3 = bullettrace( var_1, var_2, 0, undefined );
    self._id_440D = var_3["position"];
    return var_3["fraction"] != 0 && var_3["fraction"] != 1;
}

_id_1291( var_0 )
{
    var_1 = var_0;

    if ( game["switchedsides"] )
        var_1 = _id_A75A::_id_4065( var_1 );

    var_2 = 0;
    var_3 = _id_A4F0::_id_40F9( "ball_goal_" + var_1, "targetname" );

    if ( !_id_A75A::_id_50C1() )
    {
        var_4 = _id_A4F0::_id_40F9( "ball_goal_non_augmented_" + var_1, "targetname" );

        if ( isdefined( var_4 ) )
            var_3 = var_4;
        else
            var_2 = 1;
    }

    if ( isdefined( var_3 ) )
    {
        var_3 _id_1296();

        if ( var_2 )
            var_3._id_02E6 = var_3._id_440D + ( 0, 0, 90 );
    }
    else
    {
        var_3 = spawnstruct();

        switch ( level._id_0391 )
        {
            default:
                break;
        }

        if ( !isdefined( var_3._id_02E6 ) )
            var_3._id_02E6 = level._id_277D[var_0];

        var_3 _id_1296();

        if ( _id_A75A::_id_50C1() )
            var_3._id_02E6 = var_3._id_440D + ( 0, 0, 220 );
        else
            var_3._id_02E6 = var_3._id_440D + ( 0, 0, 90 );
    }

    var_3._id_0354 = 70;
    var_3._id_04A8 = var_0;
    var_3._id_12A4 = 0;
    var_3.highestspawndistratio = 0;
    level._id_12A2[var_0] = var_3;
}

_id_128F( var_0 )
{
    var_1 = _id_A4F0::_id_40FB( "ball_start", "targetname" );

    if ( !_id_A75A::_id_50C1() )
    {
        var_2 = _id_A4F0::_id_40FB( "ball_start_non_augmented", "targetname" );

        if ( var_2.size > 0 )
            var_1 = var_2;
    }

    var_1 = _id_A4F0::_id_0CF5( var_1 );

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4._id_7A13 ) )
            var_4._id_7A13 = 100;
    }

    var_1 = _id_A75A::_id_70A1( var_1, ::_id_20C5 );

    foreach ( var_4 in var_1 )
        _id_127E( var_4._id_02E6 );

    var_8 = 30;

    if ( var_1.size == 0 )
    {
        var_9 = ( 0, 0, 0 );

        switch ( level._id_0391 )
        {
            default:
                break;
        }

        if ( !isdefined( var_9 ) )
            var_9 = level._id_2777;

        _id_127E( var_9 );
    }

    var_10 = var_0 - level._id_12CC.size;

    if ( var_10 <= 0 )
        return;

    var_11 = level._id_12CC[0]._id_02E6;
    var_12 = getnodesinradius( var_11, 200, 20, 50 );
    var_12 = _id_A4F0::_id_0CF5( var_12 );

    for ( var_13 = 0; var_13 < var_10 && var_13 < var_12.size; var_13++ )
        _id_127E( var_12[var_13]._id_02E6 );
}

_id_127E( var_0 )
{
    var_1 = 30;
    var_2 = spawnstruct();
    var_2._id_02E6 = var_0;
    var_2 _id_1296();
    var_2._id_02E6 = var_2._id_440D + ( 0, 0, var_1 );
    var_2._id_4C0D = 0;
    level._id_12CC[level._id_12CC.size] = var_2;
}

_id_20C5( var_0, var_1 )
{
    return var_0._id_7A13 <= var_1._id_7A13;
}

_id_12AD()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_129F = [];
        var_0 thread _id_6BAA();
    }
}

_id_6BAA()
{
    self waittill( "disconnect" );
    _id_6AC6();
}

_id_12A0( var_0 )
{
    var_1 = _id_129C( var_0 );
    var_0 _id_6AC6();

    foreach ( var_6, var_3 in level._id_12A2 )
    {
        var_4 = _id_A4F0::_id_928D( var_6 == var_1, "ball_goal_friendly", "ball_goal_enemy" );
        var_5 = _func_272( _id_A4F0::_id_3FA6( var_4 ), var_3._id_02E6, var_0, ( 1, 0, 0 ) );
        setwinningteam( var_5, 1 );
        var_0._id_129F[var_4] = var_5;
        triggerfx( var_5 );
    }
}

_id_129C( var_0 )
{
    var_1 = var_0._id_04A8;

    if ( var_1 != "allies" && var_1 != "axis" )
        var_1 = "allies";

    return var_1;
}

_id_6AC6()
{
    foreach ( var_1 in self._id_129F )
    {
        if ( isdefined( var_1 ) )
            var_1 delete();
    }
}

_id_12C1()
{
    for (;;)
    {
        level waittill( "joined_team", var_0 );
        _id_12A0( var_0 );
    }
}
