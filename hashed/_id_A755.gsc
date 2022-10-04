// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread _id_5903();
}

_id_5903()
{
    var_0 = _id_A4F0::_id_40FB( "teleport_world_origin", "targetname" );
    var_1 = level._id_01B5;

    if ( !var_0.size || !( var_1 == "dom" || var_1 == "ctf" || var_1 == "hp" || var_1 == "ball" ) )
        return;

    _id_A4F0::_id_383B( "teleport_setup_complete" );
    level._id_9222 = [];
    level._id_9209 = 1;
    level._id_9248 = 0;
    level._id_9247 = 0;
    level._id_921C = 0;
    level._id_921E = 0;
    level._id_9215 = undefined;
    level._id_923A = [];
    level._id_9239 = [];
    level._id_9223 = [];
    level._id_9235 = [];
    level._id_922B = level._id_64E9;
    level._id_64E9 = ::_id_922B;
    level._id_9255 = ::_id_9216;
    level._id_9256 = ::_id_9217;
}

_id_921F()
{
    level._id_9245 = [];
    var_0 = _id_A4F0::_id_40FB( "teleport_world_origin", "targetname" );

    if ( !var_0.size )
        return;

    level._id_9253 = [];

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_039B ) )
            var_2._id_039B = "zone_" + level._id_9253.size;

        var_2._id_02AB = var_2._id_039B;
        _id_9234( var_2 );
        level._id_9223[var_2._id_02AB] = [];
        level._id_9235[var_2._id_02AB] = [];
        level._id_9253[var_2._id_039B] = var_2;
    }

    var_4 = getallnodes();

    foreach ( var_6 in var_4 )
    {
        var_2 = _id_920E( var_6._id_02E6 );
        level._id_9223[var_2._id_02AB][level._id_9223[var_2._id_02AB].size] = var_6;
    }

    for ( var_8 = 0; var_8 < _func_201(); var_8++ )
    {
        var_2 = _id_920E( _func_205( var_8 ) );
        level._id_9235[var_2._id_02AB][level._id_9235[var_2._id_02AB].size] = var_8;
    }

    if ( !isdefined( level._id_9252 ) )
    {
        if ( isdefined( level._id_9253["start"] ) )
            _id_9241( "start" );
        else
        {
            foreach ( var_11, var_10 in level._id_9253 )
            {
                _id_9241( var_11 );
                break;
            }
        }
    }
}

_id_922B()
{
    _id_921F();
    var_0 = undefined;
    var_1 = undefined;

    switch ( level._id_01B5 )
    {
        case "dom":
            var_1 = ::_id_9228;
            break;
        case "ctf":
            var_1 = ::_id_9227;
            break;
        case "hp":
            var_1 = ::_id_922A;
            break;
        case "ball":
            var_1 = ::_id_9225;
            break;
        default:
            break;
    }

    if ( isdefined( var_0 ) )
        level [[ var_0 ]]();

    level [[ level._id_922B ]]();

    if ( isdefined( var_1 ) )
        level [[ var_1 ]]();

    _id_A4F0::_id_383D( "teleport_setup_complete" );
}

_id_923D()
{
    _id_923C();
}

_id_923B()
{
    _id_923C();
}

_id_923C()
{
    foreach ( var_1 in level._id_9253 )
    {
        var_1._id_7B6A = [];
        var_1._id_7B4C = [];
        var_1._id_7B4D = [];
    }

    var_3 = getentarray( "sd_bomb_pickup_trig", "targetname" );

    foreach ( var_5 in var_3 )
    {
        var_6 = _id_920E( var_5._id_02E6 );

        if ( isdefined( var_6 ) )
        {
            var_6._id_7B6A[var_6._id_7B6A.size] = var_5;
            _id_920D( var_5, var_6._id_02AB );
        }
    }

    var_8 = getentarray( "sd_bomb", "targetname" );

    foreach ( var_10 in var_8 )
    {
        var_6 = _id_920E( var_10._id_02E6 );

        if ( isdefined( var_6 ) )
        {
            var_6._id_7B4C[var_6._id_7B4C.size] = var_10;
            _id_920D( var_10, var_6._id_02AB );
        }
    }

    var_12 = getentarray( "bombzone", "targetname" );

    foreach ( var_14 in var_12 )
    {
        var_6 = _id_920E( var_14._id_02E6 );

        if ( isdefined( var_6 ) )
        {
            var_6._id_7B4D[var_6._id_7B4D.size] = var_14;
            _id_920D( var_14, var_6._id_02AB );
        }
    }

    var_16 = [];

    foreach ( var_1 in level._id_9253 )
    {
        if ( var_1._id_7B6A.size && var_1._id_7B6A.size && var_1._id_7B6A.size )
            var_16[var_16.size] = var_1._id_02AB;
    }

    _id_9214( var_16 );
    var_19 = level._id_9253[level._id_9252];
    _id_923E( var_19._id_7B6A );
    _id_923E( var_19._id_7B4C );
    _id_923E( var_19._id_7B4D );
}

_id_9229()
{
    foreach ( var_1 in level._id_9253 )
        var_1._id_4947 = [];

    var_3 = _id_A4F0::_id_40FB( "horde_drop", "targetname" );

    foreach ( var_5 in var_3 )
    {
        var_6 = _id_920E( var_5._id_02E6 );

        if ( isdefined( var_6 ) )
            var_6._id_4947[var_6._id_4947.size] = var_5;
    }

    var_8 = [];

    foreach ( var_1 in level._id_9253 )
    {
        if ( var_1._id_4947.size )
            var_8[var_8.size] = var_1._id_02AB;
    }

    _id_9214( var_8 );
    var_11 = level._id_9253[level._id_9252];
    level._id_8F5E["targetname"]["horde_drop"] = var_11._id_4947;
}

_id_920D( var_0, var_1 )
{
    if ( !isarray( var_0 ) )
        var_0 = [ var_0 ];

    if ( !isdefined( var_1 ) )
        var_1 = "hide_from_getEnt";

    foreach ( var_3 in var_0 )
    {
        var_3._id_7812 = var_3._id_04A7;
        var_3._id_04A7 = var_3._id_04A7 + "_" + var_1;
    }
}

_id_9214( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = getarraykeys( level._id_9253 );

    var_1 = game["teleport_zone_dom"];

    if ( !isdefined( var_1 ) )
    {
        var_1 = _id_A4F0::_id_710B( var_0 );
        game["teleport_zone_dom"] = var_1;
    }

    _id_924B( var_1, 0 );
    level._id_9209 = 0;
}

_id_923E( var_0 )
{
    if ( !isarray( var_0 ) )
        var_0 = [ var_0 ];

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_7812 ) )
            var_2._id_04A7 = var_2._id_7812;
    }
}

_id_9227()
{
    level._id_9215 = ::_id_922E;
}

_id_922A()
{
    if ( !isdefined( level._id_628D ) )
        level._id_628D = 5;

    level._id_6E9D = [];
    level._id_6E6C = [];
    level._id_09E2 = level._id_A3ED;

    foreach ( var_1 in level._id_A3ED )
    {
        if ( var_1._id_7A13 > level._id_628D )
        {
            level._id_6E6C[level._id_6E6C.size] = var_1;
            continue;
        }

        level._id_6E9D[level._id_6E9D.size] = var_1;
    }

    level._id_A3ED = level._id_6E9D;
    level._id_9215 = ::_id_9230;
}

_id_9225()
{
    level._id_9215 = ::_id_922C;
}

_id_9228()
{
    foreach ( var_1 in level._id_9253 )
    {
        var_1._id_3869 = [];
        var_1._id_2CF8 = [];
    }

    level._id_09E0 = level._id_3869;

    foreach ( var_4 in level._id_3869 )
    {
        var_5 = _id_920E( var_4._id_02E6 );

        if ( isdefined( var_5 ) )
        {
            var_4._id_9251 = var_5._id_02AB;
            var_5._id_3869[var_5._id_3869.size] = var_4;
            var_5._id_2CF8[var_5._id_2CF8.size] = var_4._id_9C01;
        }
    }

    level._id_2CEE = [];

    foreach ( var_1 in level._id_9253 )
    {
        foreach ( var_9 in var_1._id_3869 )
        {
            var_10 = spawnstruct();
            var_10._id_97C8 = var_9._id_02E6;
            var_10._id_9E91 = var_9._id_9C01._id_9E93[0]._id_02E6;
            var_10._id_1307 = var_9._id_9C01._id_1307;
            var_10._id_1306 = var_9._id_9C01._id_1306;
            var_10._id_1308 = var_9._id_9C01._id_1308;
            var_10._id_62CC = var_9._id_9C01._id_24C8;
            var_10._id_62DA = [];

            foreach ( var_12 in level._id_91F0 )
            {
                var_13 = "objpoint_" + var_12 + "_" + var_9._id_9C01._id_331B;
                var_14 = _id_A7A2::_id_405C( var_13 );

                if ( isdefined( var_14 ) )
                    var_10._id_62DA[var_12] = ( var_14._id_0530, var_14._id_0538, var_14._id_053B );
            }

            var_13 = "objpoint_mlg_" + var_9._id_9C01._id_331B;
            var_14 = _id_A7A2::_id_405C( var_13 );

            if ( isdefined( var_14 ) )
                var_10._id_62DA["mlg"] = ( var_14._id_0530, var_14._id_0538, var_14._id_053B );

            level._id_2CEE[var_1._id_02AB][var_9._id_9C01._id_0245] = var_10;
        }
    }

    level._id_3869 = level._id_9253[level._id_9252]._id_3869;
    level._id_2CF8 = level._id_9253[level._id_9252]._id_2CF8;

    foreach ( var_1 in level._id_9253 )
    {
        foreach ( var_4 in var_1._id_3869 )
        {
            if ( var_1._id_02AB == level._id_9252 )
                continue;

            var_4._id_9C01._id_9E93[0] delete();
            var_4._id_9C01 _id_A78A::_id_2873();
        }
    }

    level._id_9215 = ::_id_922F;
    _id_922F( level._id_9252 );
    level._id_9210 = 1;
    level thread _id_9211();
}

_id_9211()
{
    while ( !isdefined( level._id_1628 ) )
        wait 0.05;

    foreach ( var_1 in level._id_9253 )
    {
        foreach ( var_3 in var_1._id_3869 )
        {
            var_4 = level._id_2CEE[var_1._id_02AB][var_3._id_9C01._id_0245];
            var_4._id_6136 = var_3._id_6136;

            if ( var_1._id_02AB != level._id_9252 )
                var_3 delete();
        }
    }
}

_id_9226()
{
    level._id_9215 = ::_id_922D;
}

_id_922F( var_0 )
{
    var_1 = level._id_9253[level._id_9252];
    var_2 = level._id_9253[var_0];

    if ( var_0 == level._id_9252 )
        return;

    foreach ( var_4 in level._id_2CF8 )
    {
        var_4 _id_A78A::_id_7FD4( "neutral" );
        var_4 _id_A78A::_id_7F0C( "enemy", "waypoint_captureneutral" + var_4._id_0245 );
        var_4 _id_A78A::_id_7F0D( "enemy", "waypoint_captureneutral" + var_4._id_0245 );
        var_4 _id_A78A::_id_7F0C( "friendly", "waypoint_captureneutral" + var_4._id_0245 );
        var_4 _id_A78A::_id_7F0D( "friendly", "waypoint_captureneutral" + var_4._id_0245 );
        var_4 _id_A78A::_id_7F0C( "mlg", "waypoint_esports_dom_white" + var_4._id_0245 );
        var_4 _id_A78A::_id_7F0D( "mlg", "waypoint_esports_dom_white" + var_4._id_0245 );
        var_4._id_3816 = 1;
    }

    foreach ( var_4 in level._id_3869 )
    {
        var_7 = level._id_2CEE[var_0][var_4._id_9C01._id_0245];
        var_4._id_02E6 = var_7._id_97C8;
        var_4._id_9C01._id_9E93[0]._id_02E6 = var_7._id_9E91;
        var_4._id_9C01._id_1307 = var_7._id_1307;
        var_4._id_9C01._id_1306 = var_7._id_1306;
        var_4._id_9C01 maps\mp\gametypes\dom::_id_9B99();
        var_4._id_9251 = var_0;
        var_4._id_6136 = var_7._id_6136;

        if ( isdefined( var_4._id_9C01._id_6302 ) )
            objective_position( var_4._id_9C01._id_6302, var_7._id_62CC );

        if ( isdefined( var_4._id_9C01._id_6303 ) )
            objective_position( var_4._id_9C01._id_6303, var_7._id_62CC );

        if ( isdefined( var_4._id_9C01._id_6306 ) )
            objective_position( var_4._id_9C01._id_6306, var_7._id_62CC );

        foreach ( var_9 in level._id_91F0 )
        {
            var_10 = "objpoint_" + var_9 + "_" + var_4._id_9C01._id_331B;
            var_11 = _id_A7A2::_id_405C( var_10 );
            var_11._id_0530 = var_7._id_62DA[var_9][0];
            var_11._id_0538 = var_7._id_62DA[var_9][1];
            var_11._id_053B = var_7._id_62DA[var_9][2];
        }

        var_10 = "objpoint_mlg_" + var_4._id_9C01._id_331B;
        var_11 = _id_A7A2::_id_405C( var_10 );
        var_11._id_0530 = var_7._id_62DA["mlg"][0];
        var_11._id_0538 = var_7._id_62DA["mlg"][1];
        var_11._id_053B = var_7._id_62DA["mlg"][2];
    }

    maps\mp\gametypes\dom::_id_386B();

    foreach ( var_15 in level._id_2CF8 )
    {
        var_16 = var_15._id_0245;

        foreach ( var_18 in level._id_9253["start"]._id_2CF8 )
        {
            if ( var_18._id_0245 == var_16 )
                var_15._id_56D6 = var_18._id_56D6;
        }
    }

    foreach ( var_15 in level._id_3869 )
    {
        var_16 = var_15._id_0245;

        foreach ( var_23 in level._id_9253["start"]._id_3869 )
        {
            if ( var_23._id_0245 == var_16 )
                var_15._id_56D6 = var_23._id_56D6;
        }
    }
}

_id_921A( var_0, var_1 )
{
    foreach ( var_3 in level._id_9253[var_1]._id_3869 )
    {
        if ( var_0._id_9C01._id_0245 == var_3._id_9C01._id_0245 )
            return var_3;
    }

    return undefined;
}

_id_922E( var_0 )
{
    if ( game["switchedsides"] )
    {
        level._id_24AF["axis"] = getent( "post_event_capzone_allies", "targetname" );
        level._id_24AF["allies"] = getent( "post_event_capzone_axis", "targetname" );
    }
    else
    {
        level._id_24AF["allies"] = getent( "post_event_capzone_allies", "targetname" );
        level._id_24AF["axis"] = getent( "post_event_capzone_axis", "targetname" );
    }

    var_1 = [];
    var_1["allies"] = level._id_1B60["allies"];
    var_1["axis"] = level._id_1B60["axis"];
    var_2["allies"] = level._id_91E8["allies"];
    var_2["axis"] = level._id_91E8["axis"];
    var_3["allies"] = level._id_24AF["allies"]._id_02E6;
    var_3["axis"] = level._id_24AF["axis"]._id_02E6;

    foreach ( var_5 in var_1 )
    {
        var_5 _id_A78A::_id_5F3A( var_3[var_5._id_6637], ( 0, 0, 85 ) );
        var_5._id_04C6 _id_A4F0::_id_97C4();
    }

    foreach ( var_8 in level._id_91E8 )
    {
        var_8 _id_A78A::_id_5F3A( var_3[var_8._id_6637], ( 0, 0, 85 ) );

        if ( isdefined( var_8._id_1BAF ) )
        {
            var_8 _id_A78A::_id_834C( "any" );
            var_8 _id_A78A::_id_7F0C( "friendly", level._id_4B41 );
            var_8 _id_A78A::_id_7F0D( "friendly", level._id_4B42 );
            var_8 _id_A78A::_id_7F0C( "enemy", level._id_4B3F );
            var_8 _id_A78A::_id_7F0D( "enemy", level._id_4B40 );
            level._id_1B60[var_8._id_6637] _id_A78A::_id_0AB2( "none" );
            level._id_1B60[var_8._id_6637] _id_A78A::_id_834C( "friendly" );
            level._id_1B60[var_8._id_6637] _id_A78A::_id_7F0C( "friendly", level._id_4B4E );
            level._id_1B60[var_8._id_6637] _id_A78A::_id_7F0D( "friendly", level._id_4B4F );

            if ( var_8._id_6637 == "allies" )
            {
                level._id_1B60[var_8._id_6637] _id_A78A::_id_7F0C( "mlg", level._id_4B43 );
                level._id_1B60[var_8._id_6637] _id_A78A::_id_7F0D( "mlg", level._id_4B43 );
                continue;
            }

            level._id_1B60[var_8._id_6637] _id_A78A::_id_7F0C( "mlg", level._id_4B44 );
            level._id_1B60[var_8._id_6637] _id_A78A::_id_7F0D( "mlg", level._id_4B44 );
        }
    }

    maps\mp\gametypes\ctf::_id_1B5E();
    maps\mp\gametypes\ctf::_id_71E9();

    foreach ( var_5 in var_1 )
        var_5._id_04C6 _id_A4F0::_id_97C6();
}

_id_9230( var_0 )
{
    level._id_A3ED = level._id_6E6C;

    if ( level._id_712D == 0 )
        level._id_6F78 = level._id_A3ED.size - 1;
    else
    {
        level._id_A3EF = [];
        maps\mp\gametypes\hp::_id_8544();
    }

    setomnvar( "ui_hardpoint_timer", 0 );
    level notify( "zone_moved" );
}

_id_922C( var_0 )
{
    level._id_12CD = _id_A4F0::_id_40FB( "ball_start_post_event", "targetname" );

    if ( game["switchedsides"] )
    {
        level._id_12A3["allies"] = _id_A4F0::_id_40F9( "ball_goal_axis_post_event", "targetname" );
        level._id_12A3["axis"] = _id_A4F0::_id_40F9( "ball_goal_allies_post_event", "targetname" );
    }
    else
    {
        level._id_12A3["axis"] = _id_A4F0::_id_40F9( "ball_goal_axis_post_event", "targetname" );
        level._id_12A3["allies"] = _id_A4F0::_id_40F9( "ball_goal_allies_post_event", "targetname" );
    }

    var_1 = [];
    var_1["allies"] = level._id_12A2["allies"];
    var_1["axis"] = level._id_12A2["axis"];
    var_2 = [];
    var_2["allies"] = level._id_12A3["allies"]._id_02E6;
    var_2["axis"] = level._id_12A3["axis"]._id_02E6;

    foreach ( var_4 in var_1 )
    {
        var_5 = ( 0, 0, var_4._id_0354 / 2 * 1.1 );
        var_4._id_9C02 _id_A78A::_id_5F3A( var_2[var_4._id_04A8], var_5 );
        var_4 maps\mp\gametypes\ball::_id_1296();

        foreach ( var_7 in level._id_0328 )
            maps\mp\gametypes\ball::_id_12A0( var_7 );
    }

    _id_16F0();
    var_10 = _func_202( level._id_12A2["allies"]._id_02E6 );

    if ( isdefined( var_10 ) )
        botzonesetteam( var_10, "allies" );

    var_10 = _func_202( level._id_12A2["axis"]._id_02E6 );

    if ( isdefined( var_10 ) )
        botzonesetteam( var_10, "axis" );

    level._id_12CC = [];

    foreach ( var_12 in level._id_12CD )
        maps\mp\gametypes\ball::_id_127E( var_12._id_02E6 );

    foreach ( var_15 in level._id_12D9 )
    {
        var_16 = 0;

        foreach ( var_7 in level._id_0328 )
        {
            if ( isdefined( var_7._id_1287 ) && var_7._id_1287 == var_15 )
            {
                var_16 = 1;
                break;
            }
        }

        if ( var_16 != 1 )
            var_15 maps\mp\gametypes\ball::_id_12C6();
    }
}

_id_16F0()
{
    var_0 = 400;
    wait 1.0;
    var_1 = 0;
    var_2 = 10;

    foreach ( var_4 in level._id_12A2 )
    {
        var_4._id_12A9 = [];
        var_5 = getnodesinradius( var_4._id_02E6, var_0, 0 );

        foreach ( var_7 in var_5 )
        {
            if ( var_7._id_04D8 == "End" )
                continue;

            var_1++;

            if ( _id_15B8( var_7._id_02E6, var_4, 1 ) )
                var_4._id_12A9[var_4._id_12A9.size] = var_7;

            if ( var_1 % var_2 == 0 )
                wait 0.05;
        }

        var_9 = 999999999;

        foreach ( var_7 in var_4._id_12A9 )
        {
            var_11 = _func_220( var_7._id_02E6, var_4._id_02E6 );

            if ( var_11 < var_9 )
            {
                var_4._id_606E = var_7;
                var_9 = var_11;
            }
        }

        wait 0.05;
    }
}

_id_15B8( var_0, var_1, var_2 )
{
    var_3 = _id_15BA( var_0, var_1._id_02E6 );

    if ( isdefined( var_2 ) && var_2 )
    {
        if ( !var_3 )
        {
            var_4 = var_1._id_02E6 - ( 0, 0, var_1._id_0354 * 0.5 );
            var_3 = _id_15BA( var_0, var_4 );
        }

        if ( !var_3 )
        {
            var_4 = var_1._id_02E6 + ( 0, 0, var_1._id_0354 * 0.5 );
            var_3 = _id_15BA( var_0, var_4 );
        }
    }

    return var_3;
}

_id_15BA( var_0, var_1 )
{
    if ( isdefined( self ) && ( isplayer( self ) || isagent( self ) ) )
        var_2 = playerphysicstrace( var_0, var_1, self );
    else
        var_2 = playerphysicstrace( var_0, var_1 );

    return distancesquared( var_2, var_1 ) < 1;
}

_id_922D( var_0 )
{
    var_1 = _id_3E90( var_0 );

    foreach ( var_3 in level._id_2CDE )
    {
        var_4 = var_3._id_24C8 + var_1;
        var_5 = _id_921B( var_4 );

        if ( isdefined( var_5 ) )
        {
            var_5._id_555F = gettime();
            var_6 = var_5._id_02E6 - var_3._id_24C8;
            var_3._id_24C8 += var_6;
            var_3._id_04C6._id_02E6 += var_6;
            var_3._id_9E93[0]._id_02E6 += var_6;
            var_3._id_9E93[1]._id_02E6 += var_6;
            continue;
        }

        var_3 maps\mp\gametypes\conf::_id_745E();
    }
}

_id_921B( var_0 )
{
    var_1 = gettime();
    var_2 = getnodesinradiussorted( var_0, 300, 0, 200, "Path" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( isdefined( var_4._id_555F ) && var_4._id_555F == var_1 )
            continue;

        return var_4;
    }

    return undefined;
}

_id_920E( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    foreach ( var_4 in level._id_9253 )
    {
        var_5 = distancesquared( var_4._id_02E6, var_0 );

        if ( !isdefined( var_1 ) || var_5 < var_1 )
        {
            var_1 = var_5;
            var_2 = var_4;
        }
    }

    return var_2;
}

_id_9231( var_0 )
{
    level._id_9247 = var_0;
}

_id_9232( var_0 )
{
    level._id_9248 = var_0;
}

_id_921D( var_0 )
{
    level._id_921C = var_0;
}

_id_9242( var_0, var_1 )
{
    level._id_9222[var_0] = var_1;
}

_id_9244( var_0, var_1 )
{
    level._id_923A[var_1] = var_0;
}

_id_9243( var_0, var_1 )
{
    level._id_9239[var_1] = var_0;
}

_id_9234( var_0 )
{
    if ( isdefined( var_0._id_65A6 ) && var_0._id_65A6 )
        return;

    var_0._id_9233 = [];
    var_0._id_9233["none"] = [];
    var_0._id_9233["allies"] = [];
    var_0._id_9233["axis"] = [];
    var_1 = _id_A4F0::_id_40FB( "teleport_zone_" + var_0._id_02AB, "targetname" );

    if ( isdefined( var_0._id_04A5 ) )
    {
        var_2 = _id_A4F0::_id_40FB( var_0._id_04A5, "targetname" );
        var_1 = _id_A4F0::_id_0CDD( var_2, var_1 );
    }

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_4._id_039B ) )
            var_4._id_039B = "teleport_origin";

        switch ( var_4._id_039B )
        {
            case "teleport_origin":
                var_5 = var_4._id_02E6 + ( 0, 0, 1 );
                var_6 = var_4._id_02E6 - ( 0, 0, 250 );
                var_7 = bullettrace( var_5, var_6, 0 );

                if ( var_7["fraction"] == 1.0 )
                    continue;

                var_4._id_02E6 = var_7["position"];
            case "telport_origin_nodrop":
                if ( !isdefined( var_4._id_7A93 ) )
                    var_4._id_7A93 = "none,axis,allies";

                var_8 = strtok( var_4._id_7A93, ", " );

                foreach ( var_10 in var_8 )
                {
                    if ( !isdefined( var_0._id_9233[var_10] ) )
                        continue;

                    if ( !isdefined( var_4._id_0041 ) )
                        var_4._id_0041 = ( 0, 0, 0 );

                    var_11 = var_0._id_9233[var_10].size;
                    var_0._id_9233[var_10][var_11] = var_4;
                }

                continue;
            default:
                continue;
        }
    }

    var_0._id_65A6 = 1;
}

_id_9241( var_0 )
{
    level._id_9252 = var_0;

    if ( isdefined( level._id_9222[var_0] ) )
        _id_A727::_id_831E( level._id_9222[var_0] );
}

_id_9213( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = level._id_9252;

    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4.teleport_label ) )
            var_4.teleport_label = "ent_" + var_4 _meth_81B1();

        if ( !isdefined( level._id_9245[var_4.teleport_label] ) )
            _id_9220( var_4 );

        if ( level._id_9245[var_4.teleport_label]._id_A3D4 == var_1 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_9220( var_0 )
{
    if ( !isdefined( var_0.teleport_label ) )
        var_0.teleport_label = "ent_" + var_0 _meth_81B1();

    if ( isdefined( level._id_9245[var_0.teleport_label] ) )
        return;

    var_1 = spawnstruct();
    var_1._id_03DA = var_0;
    var_2 = undefined;

    foreach ( var_4 in level._id_9253 )
    {
        var_5 = distance( var_4._id_02E6, var_0._id_02E6 );

        if ( !isdefined( var_2 ) || var_5 < var_2 )
        {
            var_2 = var_5;
            var_1._id_A3D4 = var_4._id_02AB;
        }
    }

    level._id_9245[var_0.teleport_label] = var_1;
}

_id_9221( var_0 )
{
    foreach ( var_3, var_2 in level._id_9253 )
    {
        if ( var_3 == var_0 )
            return 1;
    }

    return 0;
}

_id_924B( var_0, var_1 )
{
    if ( !level._id_9209 )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = level._id_923A[var_0];

    if ( isdefined( var_2 ) && var_1 )
        [[ var_2 ]]();

    var_3 = level._id_9253[level._id_9252];
    var_4 = level._id_9253[var_0];

    if ( !isdefined( var_3 ) || !isdefined( var_4 ) )
        return;

    if ( level._id_921E )
    {
        _id_924F( var_0 );
        _id_924C( var_0 );
    }

    if ( level._id_921C )
        _id_924E( var_0 );

    if ( isdefined( level._id_9215 ) )
        [[ level._id_9215 ]]( var_0 );

    _id_9241( var_0 );
    level notify( "teleport_to_zone", var_0 );
    var_5 = level._id_9239[var_0];

    if ( isdefined( var_5 ) && var_1 )
        [[ var_5 ]]();

    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["post_teleport"] ) )
        [[ level._id_161B["post_teleport"] ]]();
}

_id_924C( var_0 )
{
    var_1 = maps\mp\agents\_agent_utility::_id_3ED7( "all" );

    foreach ( var_3 in var_1 )
        _id_924D( var_0, var_3 );
}

_id_924F( var_0 )
{
    foreach ( var_2 in level._id_0328 )
        _id_924D( var_0, var_2 );
}

_id_924D( var_0, var_1 )
{
    var_2 = level._id_9253[level._id_9252];
    var_3 = level._id_9253[var_0];
    var_4 = gettime();

    if ( isplayer( var_1 ) && ( var_1._id_03BC == "intermission" || var_1._id_03BC == "spectator" ) )
    {
        var_5 = getentarray( "mp_global_intermission", "classname" );
        var_5 = _id_9213( var_5, var_0 );
        var_6 = var_5[0];
        var_1 _meth_8092();
        var_1 _meth_8338( var_6._id_02E6 );
        var_1 _meth_833A( var_6._id_0041 );
    }
    else
    {
        var_7 = undefined;
        var_8 = var_1._id_0041;

        if ( isplayer( var_1 ) )
            var_8 = var_1 _meth_833B();

        foreach ( var_14, var_10 in var_3._id_9233 )
        {
            var_3._id_9233[var_14] = _id_A4F0::_id_0CF5( var_10 );

            foreach ( var_12 in var_10 )
                var_12._id_1E1D = 0;
        }

        var_15 = [];

        if ( level._id_91E4 )
        {
            if ( isdefined( var_1._id_04A8 ) && isdefined( var_3._id_9233[var_1._id_04A8] ) )
                var_15 = var_3._id_9233[var_1._id_04A8];
        }
        else
            var_15 = var_3._id_9233["none"];

        foreach ( var_12 in var_15 )
        {
            if ( !var_12._id_1E1D )
            {
                var_7 = var_12._id_02E6;
                var_8 = var_12._id_0041;
                var_12._id_1E1D = 1;
                break;
            }
        }

        var_18 = var_3._id_02E6 - var_2._id_02E6;
        var_19 = var_1._id_02E6 + var_18;

        if ( !isdefined( var_7 ) && level._id_9248 )
        {
            if ( precachestatusicon( var_19 ) && !getstarttime( var_19 ) )
                var_7 = var_19;
        }

        if ( !isdefined( var_7 ) && level._id_9247 )
        {
            var_20 = getnodesinradiussorted( var_19, 300, 0, 200, "Path" );

            for ( var_21 = 0; var_21 < var_20.size; var_21++ )
            {
                var_22 = var_20[var_21];

                if ( isdefined( var_22._id_555F ) && var_22._id_555F == var_4 )
                    continue;

                var_12 = var_22._id_02E6;

                if ( precachestatusicon( var_12 ) && !getstarttime( var_12 ) )
                {
                    var_22._id_555F = var_4;
                    var_7 = var_12;
                    break;
                }
            }
        }

        if ( !isdefined( var_7 ) )
        {
            var_1 _id_A75A::_id_066F();
            return;
        }

        var_1 _meth_8439();
        var_1 _meth_8092();
        var_1 _meth_8338( var_7 );
        var_1 _meth_833A( var_8 );
        thread _id_9250( var_1 );
    }
}

_id_9250( var_0 )
{
    waittillframeend;

    if ( isdefined( var_0 ) )
    {
        var_1 = _id_920E( var_0._id_02E6 );

        if ( var_1._id_02AB != level._id_9252 )
            var_0 _id_A75A::_id_066F();
    }
}

_id_3E90( var_0 )
{
    var_1 = level._id_9253[var_0];
    var_2 = level._id_9253[level._id_9252];
    var_3 = var_1._id_02E6 - var_2._id_02E6;
    return var_3;
}

_id_924E( var_0 )
{

}

_id_9224()
{
    if ( isdefined( self ) )
        self notify( "death" );
}

_id_0D15( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_0 ) )
        return;

    _id_A4F0::_id_0D13( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_0CF1( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_0 ) )
        return;

    _id_A4F0::_id_0CF0( var_0, var_1, var_2, var_3, var_4 );
}

_id_9218()
{
    return getentarray( "care_package", "targetname" );
}

_id_9219()
{
    var_0 = [];
    var_1 = getentarray( "script_model", "classname" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_175D ) )
            var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_9236( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 300;

    var_2 = var_0._id_02E6;
    var_3 = var_0._id_02E6 - ( 0, 0, var_1 );
    var_4 = bullettrace( var_2, var_3, 0, var_0 );

    if ( var_4["fraction"] < 1 )
    {
        var_0._id_02E6 = var_4["position"];
        return 1;
    }
    else
        return 0;
}

_id_9205( var_0, var_1 )
{
    if ( _id_920F( var_0 ) )
        return;

    _id_9204( var_0, var_1 );

    if ( isdefined( var_0._id_04A5 ) )
    {
        var_2 = getentarray( var_0._id_04A5, "targetname" );
        var_3 = _id_A4F0::_id_40FB( var_0._id_04A5, "targetname" );
        var_4 = _id_A4F0::_id_0CDD( var_2, var_3 );
        _id_A4F0::_id_0CF0( var_4, ::_id_9205, var_1 );
    }
}

_id_9240( var_0 )
{
    _id_9205( self, var_0 );
}

_id_923F( var_0 )
{
    _id_9204( self, var_0 );
}

_id_9204( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        if ( !_id_920F( var_0 ) )
        {
            var_0._id_02E6 += var_1;
            var_0._id_555F = gettime();
        }
    }
}

_id_920F( var_0 )
{
    return isdefined( var_0._id_555F ) && var_0._id_555F == gettime();
}

_id_9216()
{
    return level._id_9223[level._id_9252];
}

_id_9217()
{
    return level._id_9235[level._id_9252];
}
