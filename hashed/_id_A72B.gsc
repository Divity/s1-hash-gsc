// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_2FE6( var_0, var_1, var_2 )
{
    if ( getdvarint( "r_reflectionProbeGenerate" ) )
        return;

    if ( isdefined( level._id_2FED ) )
    {
        if ( level._id_2FED == 1 )
            return;

        if ( level._id_2FED == 2 )
        {
            if ( isdefined( var_2 ) )
                level [[ var_2 ]]();

            return;
        }
    }

    setdvarifuninitialized( "scr_dynamic_event_state", "on" );

    if ( getdvar( "scr_dynamic_event_state", "on" ) == "off" )
        return;
    else if ( getdvar( "scr_dynamic_event_state", "on" ) == "endstate" )
    {
        if ( isdefined( var_2 ) )
            level [[ var_2 ]]();

        return;
    }

    if ( !isdefined( level._id_2FE6 ) )
        level._id_2FE6 = [];

    if ( level._id_01B5 == "sd" || level._id_01B5 == "sr" )
        level thread _id_4603( var_0, var_2 );
    else
        level thread _id_4569( var_0, var_1, 0 );

    level thread _id_5820();
}

_id_5820()
{
    level endon( "game_ended" );
    level waittill( "dynamic_event_starting" );
    var_0 = _id_A75A::_id_412C();
    setmatchdata( "dynamicEventTimeDeciSecondsFromMatchStart", _id_A75A::_id_1E29( var_0 ) );
}

_id_4603( var_0, var_1 )
{
    game["dynamicEvent_switchedsides"] = game["switchedsides"];

    if ( level._id_01B5 == "sd" )
        game["dynamicEvent_scorelimit"] = getdvarint( "scr_sd_winlimit", 6 );
    else if ( level._id_01B5 == "sr" )
        game["dynamicEvent_scorelimit"] = getdvarint( "scr_sr_winlimit", 6 );

    if ( !isdefined( game["dynamicEvent_switchedsides"] ) )
        game["dynamicEvent_switchedsides"] = 0;

    if ( !isdefined( game["dynamicEvent_teamA_RoundTally"] ) )
        game["dynamicEvent_teamA_RoundTally"] = 0;

    if ( !isdefined( game["dynamicEvent_teamB_RoundTally"] ) )
        game["dynamicEvent_teamB_RoundTally"] = 0;

    if ( game["dynamicEvent_switchedsides"] == 0 )
    {
        game["dynamicEvent_teamA_RoundTally"]++;
        check_do_event( var_0, var_1, game["dynamicEvent_teamA_RoundTally"] );
    }
    else if ( game["dynamicEvent_switchedsides"] == 1 )
    {
        game["dynamicEvent_teamB_RoundTally"]++;
        check_do_event( var_0, var_1, game["dynamicEvent_teamB_RoundTally"] );
    }
}

check_do_event( var_0, var_1, var_2 )
{
    var_3 = int( game["dynamicEvent_scorelimit"] / 2 );

    if ( var_3 == 0 )
        var_3 = 3;

    if ( var_2 == var_3 )
    {
        wait 10;
        level notify( "dynamic_event_starting" );

        if ( isdefined( var_0 ) && isdefined( var_1 ) )
            level [[ var_0 ]]();
    }
    else if ( var_2 > var_3 )
    {
        if ( isdefined( var_0 ) && isdefined( var_1 ) )
            level [[ var_1 ]]();
    }
}

_id_4569( var_0, var_1, var_2 )
{
    var_3 = _id_3F76();
    var_4 = _id_3F75();
    var_5 = undefined;
    var_6 = _id_A75A::_id_40C0();

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    while ( var_3 > var_4 && ( !var_2 || !isdefined( var_5 ) || var_5 <= var_6 * level._id_2FE6["start_percent"] ) )
    {
        if ( isdefined( level._id_511A ) && level._id_511A )
        {
            if ( isdefined( level.dynamiceventstartnow ) && level.dynamiceventstartnow )
                var_3 = var_4;
        }

        wait 1;
        _id_A79A::_id_A0D4();
        var_3 -= 1;
        var_5 = _id_3F74();
    }

    level notify( "dynamic_event_starting" );

    if ( isdefined( var_0 ) )
        level [[ var_0 ]]();
}

_id_7F59( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.5;

    if ( var_0 < 0 || var_0 > 1 )
    {

    }

    level._id_2FE6["start_percent"] = var_0;
}

_id_3F75()
{
    if ( !isdefined( level._id_2FE6["start_percent"] ) )
        _id_7F59();

    var_0 = _id_3F76();
    var_1 = var_0 - var_0 * level._id_2FE6["start_percent"];
    return var_1;
}

_id_3F74()
{
    var_0 = undefined;

    if ( level._id_91E4 )
    {
        var_1 = _id_A78B::_id_416C();

        if ( isdefined( var_1 ) && var_1 == "none" && isdefined( level._id_91F0 ) )
            var_0 = _id_A78B::_id_05BD( level._id_91F0[0] );
        else if ( isdefined( var_1 ) )
            var_0 = _id_A78B::_id_05BD( var_1 );
    }
    else
    {
        var_2 = _id_A78B::_id_3FC7();

        if ( !isdefined( var_2 ) && isdefined( level._id_0328 ) && level._id_0328.size > 0 )
            var_0 = _id_A78B::_id_05B8( level._id_0328[0] );
        else if ( isdefined( var_2 ) )
            var_0 = _id_A78B::_id_05B8( var_2 );
    }

    return var_0;
}

_id_3F76()
{
    var_0 = _id_A75A::_id_4129();

    if ( var_0 == 0 )
        var_0 = 600;
    else
        var_0 *= 60;

    var_1 = _id_A75A::_id_3FBE();

    if ( isdefined( var_1 ) && var_1 )
        var_0 /= 2;

    return var_0;
}
