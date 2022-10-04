// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3FC7()
{
    _id_9B41();

    if ( !level._id_685E["all"].size )
        return undefined;
    else
        return level._id_685E["all"][0];
}

_id_3FC8( var_0 )
{
    var_1 = [];

    if ( var_0 < 0 )
        return var_1;

    _id_9B41();

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        if ( level._id_685E["all"].size == var_2 )
            break;

        var_1[var_2] = level._id_685E["all"][var_2];
    }

    return var_1;
}

_id_400E()
{
    _id_9B41();
    var_0 = level._id_685E["all"];
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == level._id_685E["all"][0] )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_9B5D( var_0, var_1 )
{
    if ( level._id_91E4 )
        return;

    var_0 _id_A7A4::_id_8D74( "round", "score", var_0._id_0169 );
    var_0 _id_A7A4::_id_8D4A( "score", var_1 );

    if ( var_1 > 0 )
        var_0 _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_veteran", var_1 );
}

_id_41F9( var_0, var_1, var_2 )
{
    if ( isdefined( var_1._id_02E9 ) )
        var_1 = var_1._id_02E9;

    if ( !isplayer( var_1 ) )
        return;

    var_1 _id_A7C3::_id_41DB( var_0 );
    var_3 = var_1._id_030D["score"];
    _id_64D2( var_0, var_1, var_2 );
    var_4 = var_1._id_030D["score"] - var_3;

    if ( var_4 == 0 )
        return;

    if ( var_1._id_030D["score"] < 65535 )
        var_1._id_0390 = var_1._id_030D["score"];

    if ( level._id_91E4 )
    {
        var_1 _id_A7A4::_id_8D74( "round", "score", var_1._id_0390 );
        var_1 _id_A7A4::_id_8D4A( "score", var_4 );

        if ( var_4 > 0 )
            var_1 _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_veteran", var_4 );
    }

    if ( !level._id_91E4 )
    {
        level thread _id_7C81();
        var_1 _id_A789::_id_1D16();
    }

    var_1 _id_A789::_id_1D1A();
}

_id_64D2( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isdefined( level._id_64D2 ) )
        var_3 = [[ level._id_64D2 ]]( var_0, var_1, var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = _id_A7AA::_id_40BF( var_0 );

    var_1._id_030D["score"] += var_3 * level._id_62FE;
}

_id_063D( var_0, var_1 )
{
    if ( var_1 == var_0._id_030D["score"] )
        return;

    var_0._id_030D["score"] = var_1;
    var_0._id_0390 = var_0._id_030D["score"];
    var_0 thread _id_A789::_id_1D1A();
}

_id_05B8( var_0 )
{
    return var_0._id_030D["score"];
}

_id_4209( var_0, var_1 )
{
    var_1 *= level._id_62FE;
    _id_0640( var_0, _id_05BD( var_0 ) + var_1 );
    level notify( "update_team_score", var_0, _id_05BD( var_0 ) );
    thread _id_420A();
}

_id_420A()
{
    level endon( "update_team_score" );
    level endon( "game_ended" );
    waitframe;
    var_0 = _id_416C();

    if ( !level._id_8A76 && var_0 != "none" && var_0 != level._id_A1CB && gettime() - level._id_55F9 > 5000 && _id_A75A::_id_40C0() != 1 )
    {
        level._id_55F9 = gettime();
        _id_A75A::_id_5648( "lead_taken", var_0, "status" );

        if ( level._id_A1CB != "none" )
            _id_A75A::_id_5648( "lead_lost", level._id_A1CB, "status" );
    }

    if ( var_0 != "none" )
    {
        level._id_A1CB = var_0;
        var_1 = _id_05BD( var_0 );
        var_2 = _id_A75A::_id_415B( "scorelimit" );

        if ( var_1 == 0 || var_2 == 0 )
            return;

        var_3 = var_1 / var_2 * 100;

        if ( var_3 > level._id_789F )
            _func_25F( 1 );
    }
}

_id_416C()
{
    if ( _id_A75A::_id_6E98() )
        return "none";

    var_0 = level._id_91F0;
    var_1 = var_0[0];
    var_2 = game["teamScores"][var_0[0]];
    var_3 = 1;

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        if ( game["teamScores"][var_0[var_4]] > var_2 )
        {
            var_1 = var_0[var_4];
            var_2 = game["teamScores"][var_0[var_4]];
            var_3 = 1;
            continue;
        }

        if ( game["teamScores"][var_0[var_4]] == var_2 )
        {
            var_3 += 1;
            var_1 = "none";
        }
    }

    return var_1;
}

_id_0640( var_0, var_1 )
{
    if ( var_1 == game["teamScores"][var_0] )
        return;

    game["teamScores"][var_0] = var_1;
    _id_9B7C( var_0 );

    if ( _id_A75A::_id_4E3C() && !isdefined( level._id_662B ) || isdefined( level._id_662B ) && !level._id_662B )
        thread _id_A789::_id_64E3();
    else
    {
        thread _id_A789::_id_1D1F( var_0 );
        thread _id_A789::_id_1D1A();
    }
}

_id_9B7C( var_0 )
{
    var_1 = 0;

    if ( !_id_A75A::_id_5191() || !_id_A75A::_id_515D() )
        var_1 = _id_05BD( var_0 );
    else
        var_1 = game["roundsWon"][var_0];

    updateclientnames( var_0, var_1 );
}

_id_05BD( var_0 )
{
    return game["teamScores"][var_0];
}

_id_7C82()
{
    level notify( "updating_scores" );
    level endon( "updating_scores" );
    wait 0.05;
    _id_A75A::_id_A0EB();

    foreach ( var_1 in level._id_0328 )
        var_1 _meth_829F();
}

_id_7C81()
{
    level notify( "updating_dm_scores" );
    level endon( "updating_dm_scores" );
    wait 0.05;
    _id_A75A::_id_A0EB();

    for ( var_0 = 0; var_0 < level._id_0328.size; var_0++ )
    {
        level._id_0328[var_0] _meth_82A0();
        level._id_0328[var_0]._id_9B07 = 1;
    }
}

_id_739B()
{
    var_0 = 0;
    var_1 = level._id_685E["all"].size;
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        if ( level._id_685E["all"][var_3] == self )
            var_2 = 1;

        if ( var_2 )
            level._id_685E["all"][var_3] = level._id_685E["all"][var_3 + 1];
    }

    if ( !var_2 )
        return;

    level._id_685E["all"][var_1 - 1] = undefined;

    if ( level._id_5FE9 )
        _id_5FDB();

    if ( level._id_91E4 )
    {
        _id_9B7A();
        return;
    }

    var_1 = level._id_685E["all"].size;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        var_4 = level._id_685E["all"][var_3];
        var_4 notify( "update_outcome" );
    }
}

_id_9B41()
{
    var_0 = [];

    foreach ( var_2 in level._id_0328 )
    {
        if ( isdefined( var_2._id_214A ) )
            continue;

        if ( var_2._id_030D["team"] == "spectator" || var_2._id_030D["team"] == "none" )
            continue;

        var_0[var_0.size] = var_2;
    }

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        var_2 = var_0[var_4];
        var_5 = var_2._id_0390;

        if ( !level._id_91E4 )
            var_5 = var_2._id_0169;

        for ( var_6 = var_4 - 1; var_6 >= 0 && _id_3F17( var_2, var_0[var_6] ) == var_2; var_6-- )
            var_0[var_6 + 1] = var_0[var_6];

        var_0[var_6 + 1] = var_2;
    }

    level._id_685E["all"] = var_0;

    if ( level._id_5FE9 )
        _id_5FDB();
    else if ( level._id_91E4 )
        _id_9B7A();
}

_id_3F17( var_0, var_1 )
{
    if ( var_0._id_0390 > var_1._id_0390 )
        return var_0;

    if ( var_1._id_0390 > var_0._id_0390 )
        return var_1;

    if ( var_0._id_010E < var_1._id_010E )
        return var_0;

    if ( var_1._id_010E < var_0._id_010E )
        return var_1;

    if ( _id_A4F0::_id_2006() )
        return var_0;
    else
        return var_1;
}

_id_9B7A()
{
    var_0["allies"] = [];
    var_0["axis"] = [];
    var_0["spectator"] = [];
    var_1 = level._id_685E["all"];
    var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = var_1[var_3];
        var_5 = var_4._id_030D["team"];
        var_0[var_5][var_0[var_5].size] = var_4;
    }

    level._id_685E["allies"] = var_0["allies"];
    level._id_685E["axis"] = var_0["axis"];
}

_id_5FDB()
{
    var_0["spectator"] = [];

    foreach ( var_2 in level._id_91F0 )
        var_0[var_2] = [];

    var_4 = level._id_685E["all"];
    var_5 = var_4.size;

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        var_7 = var_4[var_6];
        var_8 = var_7._id_030D["team"];
        var_0[var_8][var_0[var_8].size] = var_7;
    }

    foreach ( var_2 in level._id_91F0 )
        level._id_685E[var_2] = var_0[var_2];
}

_id_4DD2()
{
    wait 0.2;
    var_0 = 0;

    for (;;)
    {
        var_1 = 0;
        var_2 = level._id_0328;

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            var_4 = var_2[var_3];

            if ( !isdefined( var_4 ) )
                continue;

            if ( isdefined( var_4._id_9B07 ) )
                continue;

            var_4._id_9B07 = 1;
            var_4 _meth_82A0();
            var_1 = 1;
            wait 0.5;
        }

        if ( !var_1 )
            wait 3;
    }
}
