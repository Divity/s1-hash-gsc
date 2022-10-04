// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_40D5( var_0 )
{
    var_0 = _id_1CFA( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];

    foreach ( var_3 in var_0 )
    {
        _id_4E13( var_3 );
        var_3._id_2477 = _id_2474( var_3 );
        var_1[var_3._id_2477][var_1[var_3._id_2477].size] = var_3;
    }

    if ( var_1["primary"].size )
        var_5 = _id_78A5( var_1["primary"] );
    else if ( var_1["secondary"].size )
        var_5 = _id_78A5( var_1["secondary"] );
    else
        var_5 = _id_78A5( var_0 );

    foreach ( var_3 in var_0 )
    {
        _id_726B( var_3 );
        var_3._id_2477 = undefined;
    }

    return var_5;
}

_id_78A5( var_0 )
{
    var_1 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        _id_789A( var_3 );

        if ( var_3._id_93F9 > var_1._id_93F9 )
            var_1 = var_3;
    }

    var_1 = _id_7C5C( var_1, var_0 );
    return var_1;
}

_id_40DA( var_0, var_1 )
{
    var_0 = _id_1CFA( var_0 );
    var_2["primary"] = [];
    var_2["secondary"] = [];
    var_2["bad"] = [];

    foreach ( var_4 in var_0 )
    {
        _id_4E13( var_4 );
        var_4._id_2477 = _id_2474( var_4 );
        var_2[var_4._id_2477][var_2[var_4._id_2477].size] = var_4;
    }

    if ( var_2["primary"].size )
        var_6 = _id_78A8( var_2["primary"], var_1 );
    else if ( var_2["secondary"].size )
        var_6 = _id_78A8( var_2["secondary"], var_1 );
    else
        var_6 = _id_78A8( var_0, var_1 );

    foreach ( var_4 in var_0 )
    {
        if ( !isagent( self ) )
            _id_726B( var_4 );

        var_4._id_2477 = undefined;
    }

    return var_6;
}

_id_78A8( var_0, var_1 )
{
    var_2 = var_0[0];

    foreach ( var_4 in var_0 )
    {
        _id_789D( var_4, var_1 );

        if ( var_4._id_93F9 > var_2._id_93F9 )
            var_2 = var_4;
    }

    var_2 = _id_7C5C( var_2, var_0 );
    return var_2;
}

_id_1CFA( var_0 )
{
    if ( isdefined( level._id_2FF1 ) )
        var_0 = [[ level._id_2FF1 ]]( var_0 );

    return var_0;
}

_id_7C5C( var_0, var_1 )
{
    var_2 = var_0;
    var_3 = 0;
    var_4 = [];

    foreach ( var_6 in var_1 )
    {
        if ( var_6._id_93F9 == var_2._id_93F9 )
            var_4[var_4.size] = var_6;
    }

    var_2 = var_4[randomint( var_4.size )];

    foreach ( var_6 in var_1 )
    {
        if ( var_6._id_93F9 > 0 )
            var_3++;
    }

    if ( var_3 == 0 )
    {
        if ( var_2._id_93F9 == 0 )
        {
            var_2 = var_1[randomint( var_1.size )];
            var_2._id_5185 = 1;
        }
    }

    var_2._id_6290 = var_3;
    return var_2;
}

recon_log_spawnpoint_info_wrapper( var_0 )
{
    _id_726B( var_0 );
}

_id_726B( var_0 )
{
    if ( !isdefined( var_0._id_5185 ) )
        var_0._id_5185 = 0;

    if ( !isdefined( var_0._id_91E3 ) )
        var_0._id_91E3 = "none";

    if ( !isdefined( var_0._id_55DB ) )
        var_0._id_55DB = "none";

    if ( !isdefined( var_0._id_55DC ) )
        var_0._id_55DC = -1;

    if ( level._id_91E4 )
    {
        var_1 = var_0._id_3AE0["allies"];
        var_2 = var_0._id_3AE0["axis"];
        var_3 = var_0._id_222B["allies"];
        var_4 = var_0._id_222B["axis"];
        var_5 = var_0._id_5C42["allies"];
        var_6 = var_0._id_5C42["axis"];
    }
    else
    {
        var_1 = var_0._id_3AE0["all"];
        var_2 = -1;
        var_3 = var_0._id_222B["all"];
        var_4 = -1;
        var_5 = var_0._id_5C42["all"];
        var_6 = -1;
    }

    var_7 = -1;
    var_8 = -1;
    var_9 = -1;
    var_10 = -1;
    var_11 = -1;
    var_12 = -1;
    var_13 = -1;
    var_14 = -1;
    var_15 = "_spawnscoring.gsc";
    var_16 = gettime();
    var_17 = var_0._id_00AB;
    var_18 = var_0._id_93F9;
    var_19 = var_0._id_2477;
    var_20 = var_0._id_91E3;
    var_21 = var_0._id_65CE;

    if ( isdefined( var_0._id_2720[0] ) )
        var_7 = var_0._id_2720[0];

    if ( isdefined( var_0._id_2720[1] ) )
        var_8 = var_0._id_2720[1];

    if ( isdefined( var_0._id_2720[2] ) )
        var_9 = var_0._id_2720[2];

    if ( isdefined( var_0._id_2720[3] ) )
        var_10 = var_0._id_2720[3];

    if ( isdefined( var_0._id_2720[4] ) )
        var_11 = var_0._id_2720[4];

    if ( isdefined( var_0._id_2720[5] ) )
        var_12 = var_0._id_2720[5];

    if ( isdefined( var_0._id_2720[6] ) )
        var_13 = var_0._id_2720[6];

    if ( isdefined( var_0._id_2720[7] ) )
        var_14 = var_0._id_2720[7];

    var_22 = var_0._id_93F8;
    var_23 = -1;
    var_24 = -1;
    var_25 = -1;
    var_26 = -1;
    var_27 = -1;
    var_28 = -1;
    var_29 = -1;
    var_30 = -1;

    if ( isdefined( var_0._id_2732[0] ) )
        var_23 = var_0._id_2732[0];

    if ( isdefined( var_0._id_2732[1] ) )
        var_24 = var_0._id_2732[1];

    if ( isdefined( var_0._id_2732[2] ) )
        var_25 = var_0._id_2732[2];

    if ( isdefined( var_0._id_2732[3] ) )
        var_26 = var_0._id_2732[3];

    if ( isdefined( var_0._id_2732[4] ) )
        var_27 = var_0._id_2732[4];

    if ( isdefined( var_0._id_2732[5] ) )
        var_28 = var_0._id_2732[5];

    if ( isdefined( var_0._id_2732[6] ) )
        var_29 = var_0._id_2732[6];

    if ( isdefined( var_0._id_2732[7] ) )
        var_30 = var_0._id_2732[7];

    reconspatialevent( var_0._id_02E6, "script_mp_spawnpoint_score: player_name %s, life_id %d, script_file %s, gameTime %d, classname %s, totalscore %d, totalPossibleScore %d, score_data0 %d, score_data1 %d, score_data2 %d, score_data3 %d, score_data4 %d, score_data5 %d, score_data6 %d, score_data7 %d, fullsights_allies %d, fullsights_axis %d, cornersights_allies %d, cornersights_axis %d, min_dist_squared_allies %d, min_dist_squared_axis %d, criticalResult %s, critical_data0 %d, critical_data1 %d, critical_data2 %d, critical_data3 %d, critical_data4 %d, critical_data5 %d, critical_data6 %d, critical_data7 %d, teambase %s, outside %d", self._id_02AB, self._id_56F4, var_15, var_16, var_17, var_18, var_22, var_23, var_24, var_25, var_26, var_27, var_28, var_29, var_30, var_1, var_2, var_3, var_4, var_5, var_6, var_19, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_20, var_21 );
}

_id_3786( var_0, var_1 )
{
    if ( var_1.size < 2 )
        return var_0;

    var_2 = var_1[0];

    if ( var_2 == var_0 )
        var_2 = var_1[1];

    foreach ( var_4 in var_1 )
    {
        if ( var_4 == var_0 )
            continue;

        if ( var_4._id_93F9 > var_2._id_93F9 )
            var_2 = var_4;
    }

    return var_2;
}

_id_3779()
{
    var_0 = spawnstruct();
    _id_4E13( var_0 );
    var_1 = _id_4118( self._id_04A8 );
    var_2 = spawnstruct();
    var_2._id_5A52 = 18;
    var_2._id_2529 = 0;

    foreach ( var_4 in var_1 )
    {
        var_5 = _id_3789( var_4 );

        if ( !isdefined( var_5 ) )
            continue;

        if ( _id_5196( var_4, var_5, var_2 ) )
        {
            var_0._id_93F9 = 999;
            var_0._id_1836 = 1;
            var_0._id_02E6 = var_5;
            var_0._id_0041 = _id_3F1A( var_4, var_0._id_02E6 );
            break;
        }

        if ( var_2._id_2529 == var_2._id_5A52 )
            break;
    }

    return var_0;
}

_id_3F1A( var_0, var_1 )
{
    var_2 = ( 0, var_0._id_0041[1], 0 );
    var_3 = _func_20D( var_1 );

    if ( isdefined( var_3 ) && var_3.size > 0 )
        var_2 = vectortoangles( var_3[0]._id_02E6 - var_1 );

    return var_2;
}

_id_4118( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_0328 )
    {
        if ( var_3._id_04A8 != var_0 )
            continue;

        if ( var_3._id_03BC != "playing" )
            continue;

        if ( !_id_A75A::_id_5186( var_3 ) )
            continue;

        if ( var_3 == self )
            continue;

        if ( _id_5174( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return _id_A4F0::_id_0CF5( var_1 );
}

_id_5174( var_0 )
{
    if ( var_0 _meth_82EA() )
        return 1;

    if ( !var_0 _meth_8341() )
        return 1;

    if ( var_0 _meth_801A() )
        return 1;

    if ( var_0 _id_A4F0::_id_5105() )
        return 1;

    var_1 = 3000;

    if ( var_0._id_01E7 < var_0._id_0275 && isdefined( var_0._id_558C ) && gettime() < var_0._id_558C + var_1 )
        return 1;

    if ( !_id_A7AE::_id_11FB( var_0 ) )
        return 1;

    if ( !_id_A7AE::_id_11FF( var_0 ) )
        return 1;

    return 0;
}

_id_3789( var_0 )
{
    var_1 = _id_A7AF::_id_408F( var_0, 1 );
    var_2 = _id_3778( var_0, var_1, 0.5 );

    if ( isdefined( var_2 ) )
        return var_2._id_02E6;

    return undefined;
}

_id_3778( var_0, var_1, var_2 )
{
    var_3 = getnodesinradiussorted( var_0._id_02E6, 192, 64, var_1, "Path" );
    var_4 = undefined;

    if ( isdefined( var_3 ) && var_3.size > 0 )
    {
        var_5 = anglestoforward( var_0._id_0041 );

        foreach ( var_7 in var_3 )
        {
            var_8 = vectornormalize( var_7._id_02E6 - var_0._id_02E6 );
            var_9 = vectordot( var_5, var_8 );

            if ( var_9 <= var_2 && !getstarttime( var_7._id_02E6 ) )
            {
                if ( sighttracepassed( var_0._id_02E6 + ( 0, 0, var_1 ), var_7._id_02E6 + ( 0, 0, var_1 ), 0, var_0 ) )
                {
                    var_4 = var_7;

                    if ( var_9 <= 0.0 )
                        break;
                }
            }
        }
    }

    return var_4;
}

_id_5196( var_0, var_1, var_2 )
{
    if ( var_0 _meth_82EA() )
        return 0;

    foreach ( var_4 in level._id_0328 )
    {
        if ( var_2._id_2529 == var_2._id_5A52 )
            return 0;

        if ( var_4._id_04A8 == self._id_04A8 )
            continue;

        if ( var_4._id_03BC != "playing" )
            continue;

        if ( !_id_A75A::_id_5186( var_4 ) )
            continue;

        if ( var_4 == self )
            continue;

        var_2._id_2529++;
        var_5 = _id_A7AF::_id_408F( var_4 );
        var_6 = var_4 _meth_80A8();
        var_6 = ( var_6[0], var_6[1], var_4._id_02E6[2] + var_5 );
        var_7 = spawnsighttrace( var_2, var_1 + ( 0, 0, var_5 ), var_6, 0 );

        if ( var_7 > 0 )
            return 0;
    }

    return 1;
}

_id_4E13( var_0 )
{
    var_0._id_93F9 = 0;
    var_0._id_6290 = 0;
    var_0._id_1836 = 0;
    var_0._id_2732 = [];
    var_0._id_2720 = [];
    var_0._id_93F8 = 0;
}

_id_2474( var_0 )
{
    if ( !_id_A7AE::_id_2470( _id_A7AE::_id_11F9, var_0 ) )
        return "bad";

    if ( !_id_A7AE::_id_2470( _id_A7AE::_id_11FB, var_0 ) )
        return "bad";

    if ( !_id_A7AE::_id_2470( _id_A7AE::_id_11FA, var_0 ) )
        return "bad";

    if ( !_id_A7AE::_id_2470( _id_A7AE::_id_11FF, var_0 ) )
        return "bad";

    if ( !_id_A7AE::_id_2470( _id_A7AE::_id_11F4, var_0 ) )
        return "bad";

    if ( !_id_A7AE::_id_2470( _id_A7AE::_id_11F5, var_0 ) )
        return "bad";

    if ( !_id_A7AE::_id_2470( _id_A7AE::_id_1203, var_0 ) )
        return "bad";

    if ( !_id_A7AE::_id_2470( _id_A7AE::_id_11F8, var_0 ) )
        return "bad";

    if ( level._id_01B5 == "hp" )
    {
        if ( !_id_A7AE::_id_2470( _id_A7AE::avoidspawninzone, var_0, level._id_A3D4 ) )
            return "bad";
    }

    if ( level._id_01B5 == "twar" )
    {
        if ( !_id_A7AE::_id_2470( _id_A7AE::avoidspawninzone, var_0, level._id_99D4._id_A3D4 ) )
            return "bad";
    }

    if ( !_id_A7AE::_id_2470( _id_A7AE::_id_11F6, var_0 ) )
        return "secondary";

    return "primary";
}

_id_789A( var_0 )
{
    var_1 = _id_A7AE::_id_7888( 1.25, _id_A7AE::_id_6EE9, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 1.25, _id_A7AE::_id_1200, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_11F7, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_11FE, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_11FD, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_1201, var_0 );
    var_0._id_93F9 += var_1;
}

_id_789D( var_0, var_1 )
{
    var_2 = _id_A7AE::_id_7888( 1.5, _id_A7AE::avoidzone, var_0, var_1 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_6EED, var_0 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_11F7, var_0 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( -100.0, _id_A7AE::avoidbadspawns, var_0 );
    var_0._id_93F9 += var_2;
}

_id_40D2( var_0, var_1 )
{
    var_0 = _id_1CFA( var_0 );
    var_2["primary"] = [];
    var_2["secondary"] = [];
    var_2["bad"] = [];

    foreach ( var_4 in var_0 )
    {
        _id_4E13( var_4 );
        var_4._id_2477 = _id_2472( var_4 );
        var_2[var_4._id_2477][var_2[var_4._id_2477].size] = var_4;
    }

    if ( var_2["primary"].size )
        var_6 = _id_78A2( var_2["primary"], var_1 );
    else if ( var_2["secondary"].size )
        var_6 = _id_78A2( var_2["secondary"], var_1 );
    else
        var_6 = _id_78A2( var_0, var_1 );

    foreach ( var_4 in var_0 )
    {
        _id_726B( var_4 );
        var_4._id_2477 = undefined;
    }

    return var_6;
}

_id_78A2( var_0, var_1 )
{
    var_2 = var_0[0];

    foreach ( var_4 in var_0 )
    {
        _id_7897( var_4, var_1 );

        if ( var_4._id_93F9 > var_2._id_93F9 )
            var_2 = var_4;
    }

    var_2 = _id_7C5C( var_2, var_0 );
    return var_2;
}

_id_2472( var_0 )
{
    return _id_2474( var_0 );
}

_id_7897( var_0, var_1 )
{
    var_2 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_6EEB, var_0, var_1 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_6EED, var_0 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 0.5, _id_A7AE::_id_1200, var_0 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 1.5, _id_A7AE::_id_11F7, var_0 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_11FE, var_0 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_1201, var_0 );
    var_0._id_93F9 += var_2;
}

_id_40D3( var_0 )
{
    var_0 = _id_1CFA( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];

    foreach ( var_3 in var_0 )
    {
        _id_4E13( var_3 );
        var_3._id_2477 = _id_2473( var_3 );
        var_1[var_3._id_2477][var_1[var_3._id_2477].size] = var_3;
    }

    if ( var_1["primary"].size )
        var_5 = _id_78A3( var_1["primary"] );
    else if ( var_1["secondary"].size )
        var_5 = _id_78A3( var_1["secondary"] );
    else
        var_5 = _id_78A3( var_0 );

    foreach ( var_3 in var_0 )
    {
        _id_726B( var_3 );
        var_3._id_2477 = undefined;
    }

    return var_5;
}

_id_78A3( var_0 )
{
    var_1 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        _id_7898( var_3 );

        if ( var_3._id_93F9 > var_1._id_93F9 )
            var_1 = var_3;
    }

    var_1 = _id_7C5C( var_1, var_0 );
    return var_1;
}

_id_2473( var_0 )
{
    return _id_2474( var_0 );
}

_id_7898( var_0 )
{
    var_1 = _id_A7AE::_id_7888( 1.5, _id_A7AE::_id_11F7, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_1200, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_11FE, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_11FD, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_1201, var_0 );
    var_0._id_93F9 += var_1;
}

_id_40D8( var_0 )
{
    var_0 = _id_1CFA( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];

    foreach ( var_3 in var_0 )
    {
        _id_4E13( var_3 );
        var_3._id_2477 = _id_2476( var_3 );
        var_1[var_3._id_2477][var_1[var_3._id_2477].size] = var_3;
    }

    if ( var_1["primary"].size )
        var_5 = _id_78A7( var_1["primary"] );
    else if ( var_1["secondary"].size )
        var_5 = _id_78A7( var_1["secondary"] );
    else
        var_5 = _id_78A7( var_0 );

    foreach ( var_3 in var_0 )
    {
        _id_726B( var_3 );
        var_3._id_2477 = undefined;
    }

    return var_5;
}

_id_78A7( var_0 )
{
    var_1 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        _id_789C( var_3 );

        if ( var_3._id_93F9 > var_1._id_93F9 )
            var_1 = var_3;
    }

    var_1 = _id_7C5C( var_1, var_0 );
    return var_1;
}

_id_2476( var_0 )
{
    return _id_2474( var_0 );
}

_id_789C( var_0 )
{
    var_1 = _id_A7AE::_id_7888( 3.0, _id_A7AE::_id_11F7, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_6EE9, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 0.5, _id_A7AE::_id_11FE, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 0.5, _id_A7AE::_id_11FD, var_0 );
    var_0._id_93F9 += var_1;
}

_id_40D4( var_0 )
{
    var_0 = _id_1CFA( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];
    var_2 = var_0[randomint( var_0.size )];

    foreach ( var_4 in var_0 )
    {
        _id_4E13( var_4 );
        var_4._id_2477 = _id_2474( var_4 );

        if ( var_4._id_2477 == "bad" )
            continue;

        var_1[var_4._id_2477][var_1[var_4._id_2477].size] = var_4;
    }

    if ( var_1["primary"].size )
        var_2 = _id_78A4( var_1["primary"] );
    else if ( var_1["secondary"].size )
        var_2 = _id_78A4( var_1["secondary"] );
    else
        var_2 = _id_78A4( var_0 );

    foreach ( var_4 in var_0 )
    {
        _id_726B( var_4 );
        var_4._id_2477 = undefined;
    }

    return var_2;
}

_id_78A4( var_0 )
{
    var_1 = var_0[randomint( var_0.size )];

    foreach ( var_3 in var_0 )
    {
        _id_7899( var_3 );

        if ( var_3._id_93F9 > var_1._id_93F9 )
            var_1 = var_3;
    }

    var_1 = _id_7C5C( var_1, var_0 );
    return var_1;
}

_id_7899( var_0 )
{
    var_1 = _id_A7AE::_id_7888( 1.5, _id_A7AE::avoidzone, var_0, level._id_A3D4 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_6EED, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_11F7, var_0 );
    var_0._id_93F9 += var_1;
}

getspawnpoint_ctf( var_0, var_1 )
{
    var_0 = _id_1CFA( var_0 );
    var_2["primary"] = [];
    var_2["secondary"] = [];
    var_2["bad"] = [];

    foreach ( var_4 in var_0 )
    {
        _id_4E13( var_4 );
        var_4._id_2477 = _id_2471( var_4 );
        var_2[var_4._id_2477][var_2[var_4._id_2477].size] = var_4;
    }

    if ( var_2["primary"].size )
        var_6 = scorespawns_ctf( var_2["primary"], var_1 );
    else if ( var_2["secondary"].size )
        var_6 = scorespawns_ctf( var_2["secondary"], var_1 );
    else
        var_6 = scorespawns_ctf( var_0, var_1 );

    foreach ( var_4 in var_0 )
    {
        _id_726B( var_4 );
        var_4._id_2477 = undefined;
    }

    return var_6;
}

scorespawns_ctf( var_0, var_1 )
{
    var_2 = var_0[0];

    foreach ( var_4 in var_0 )
    {
        scorefactors_ctf( var_4, var_1 );

        if ( var_4._id_93F9 > var_2._id_93F9 )
            var_2 = var_4;
    }

    var_2 = _id_7C5C( var_2, var_0 );
    return var_2;
}

scorefactors_ctf( var_0, var_1 )
{
    var_2 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_11F7, var_0 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_1201, var_0 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 0.75, _id_A7AE::avoidflagbydistance, var_0 );
    var_0._id_93F9 += var_2;
}

_id_40D1( var_0, var_1 )
{
    var_0 = _id_1CFA( var_0 );
    var_2["primary"] = [];
    var_2["secondary"] = [];
    var_2["bad"] = [];

    foreach ( var_4 in var_0 )
    {
        _id_4E13( var_4 );
        var_4._id_2477 = _id_2471( var_4 );
        var_2[var_4._id_2477][var_2[var_4._id_2477].size] = var_4;
    }

    if ( var_2["primary"].size )
        var_6 = _id_78A1( var_2["primary"], var_1 );
    else if ( var_2["secondary"].size )
        var_6 = _id_78A1( var_2["secondary"], var_1 );
    else
        var_6 = _id_78A1( var_0, var_1 );

    foreach ( var_4 in var_0 )
    {
        _id_726B( var_4 );
        var_4._id_2477 = undefined;
    }

    return var_6;
}

_id_78A1( var_0, var_1 )
{
    var_2 = var_0[0];

    foreach ( var_4 in var_0 )
    {
        _id_7896( var_4, var_1 );

        if ( var_4._id_93F9 > var_2._id_93F9 )
            var_2 = var_4;
    }

    var_2 = _id_7C5C( var_2, var_0 );
    return var_2;
}

_id_2471( var_0 )
{
    return _id_2474( var_0 );
}

_id_7896( var_0, var_1 )
{
    var_2 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_11F7, var_0 );
    var_0._id_93F9 += var_2;
    var_2 = _id_A7AE::_id_7888( 0.25, _id_A7AE::_id_1201, var_0 );
    var_0._id_93F9 += var_2;
}

_id_40D7( var_0 )
{
    var_0 = _id_1CFA( var_0 );
    var_1["primary"] = [];
    var_1["secondary"] = [];
    var_1["bad"] = [];

    foreach ( var_3 in var_0 )
    {
        _id_4E13( var_3 );
        var_3._id_2477 = _id_2475( var_3 );
        var_1[var_3._id_2477][var_1[var_3._id_2477].size] = var_3;
    }

    if ( var_1["primary"].size )
        var_5 = _id_78A6( var_1["primary"] );
    else if ( var_1["secondary"].size )
        var_5 = _id_78A6( var_1["secondary"] );
    else
        var_5 = _id_78A6( var_0 );

    foreach ( var_3 in var_0 )
        var_3._id_2477 = undefined;

    return var_5;
}

_id_78A6( var_0 )
{
    var_1 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        _id_789B( var_3 );

        if ( var_3._id_93F9 > var_1._id_93F9 )
            var_1 = var_3;
    }

    var_1 = _id_7C5C( var_1, var_0 );
    return var_1;
}

_id_2475( var_0 )
{
    return _id_2474( var_0 );
}

_id_789B( var_0 )
{
    var_1 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_7129, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 1.0, _id_A7AE::_id_6EE9, var_0 );
    var_0._id_93F9 += var_1;
    var_1 = _id_A7AE::_id_7888( 0.5, _id_A7AE::_id_11F7, var_0 );
    var_0._id_93F9 += var_1;
}
