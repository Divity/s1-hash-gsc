// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_15BE()
{
    var_0 = [];
    var_1 = [];
    var_2 = 0;

    foreach ( var_4 in level._id_1555 )
    {
        var_0[var_2] = _id_A4F0::_id_710B( var_4._id_174F )._id_02E6;
        var_1[var_2] = "zone" + var_4._id_0245;
        var_2++;
    }

    _id_15BD( var_0, var_1 );
}

_id_15BF( var_0, var_1, var_2, var_3 )
{
    wait 1.0;
    var_4 = [];
    var_5 = [];
    var_6 = 0;

    foreach ( var_10, var_8 in var_0 )
    {
        if ( isdefined( var_0[var_10]._id_174E ) )
            var_4[var_6] = var_0[var_10]._id_174E._id_02E6;
        else
        {
            var_0[var_10]._id_606E = getclosestnodeinsight( var_0[var_10]._id_02E6 );

            if ( !isdefined( var_0[var_10]._id_606E ) )
            {
                var_9 = getnodesinradiussorted( var_0[var_10]._id_02E6, 256, 0 );

                if ( var_9.size > 0 )
                    var_0[var_10]._id_606E = var_9[0];
            }

            if ( !isdefined( var_0[var_10]._id_606E ) )
                continue;

            if ( distance( var_0[var_10]._id_606E._id_02E6, var_0[var_10]._id_02E6 ) > 128 )
            {
                var_0[var_10]._id_606E = undefined;
                continue;
            }

            var_4[var_6] = var_0[var_10]._id_606E._id_02E6;
        }

        var_5[var_6] = var_1 + var_0[var_10]._id_0397;
        var_6++;
    }

    _id_15BD( var_4, var_5, var_2, var_3 );
}

_id_15BD( var_0, var_1, var_2, var_3 )
{
    var_4 = !isdefined( var_2 ) || !var_2;
    var_5 = isdefined( var_3 ) && var_3;
    wait 0.1;

    if ( var_5 && var_4 )
    {
        var_6 = getallnodes();

        foreach ( var_8 in var_6 )
            var_8._id_6441 = undefined;
    }

    var_10 = [];

    for ( var_11 = 0; var_11 < var_0.size; var_11++ )
    {
        var_12 = var_1[var_11];
        var_10[var_12] = _func_20D( var_0[var_11] );
        wait 0.05;

        for ( var_13 = 0; var_13 < var_10[var_12].size; var_13++ )
        {
            var_14 = var_10[var_12][var_13];
            var_14._id_506C = 1;
            var_14._id_701D[var_12] = maps\mp\bots\_bots_util::_id_332A( var_14._id_02E6, var_0[var_11], "prone" );
            wait 0.05;
            var_14._id_2480[var_12] = maps\mp\bots\_bots_util::_id_332A( var_14._id_02E6, var_0[var_11], "crouch" );
            wait 0.05;
        }
    }

    var_15 = [];

    if ( var_4 )
    {
        for ( var_11 = 0; var_11 < var_0.size; var_11++ )
        {
            for ( var_13 = var_11 + 1; var_13 < var_0.size; var_13++ )
            {
                var_16 = maps\mp\bots\_bots_util::_id_3D62( var_0[var_11], var_0[var_13] );

                foreach ( var_8 in var_16 )
                    var_8._id_6441[var_1[var_11]][var_1[var_13]] = 1;
            }
        }
    }

    if ( !isdefined( level._id_3320 ) )
        level._id_3320 = [];

    if ( !isdefined( level._id_331F ) )
        level._id_331F = [];

    if ( !isdefined( level._id_3321 ) )
        level._id_3321 = [];

    if ( var_5 )
    {
        level._id_3320 = var_0;
        level._id_331F = var_1;
        level._id_3321 = var_10;
    }
    else
    {
        level._id_3320 = _id_A4F0::_id_0CDD( level._id_3320, var_0 );
        level._id_331F = _id_A4F0::_id_0CDD( level._id_331F, var_1 );
        level._id_3321 = _id_A4F0::_id_0CE1( level._id_3321, var_10 );
    }

    level._id_3322 = 1;
}

_id_15A3( var_0, var_1 )
{
    if ( var_1._id_00AB == "trigger_radius" )
    {
        var_2 = getnodesinradius( var_1._id_02E6, var_1._id_0354, 0, 100 );
        var_3 = _id_A4F0::_id_0CF7( var_2, var_0._id_6136 );

        if ( var_3.size > 0 )
        {
            var_0._id_6136 = _id_A4F0::_id_0CDD( var_0._id_6136, var_3 );
            return;
        }
    }
    else if ( var_1._id_00AB == "trigger_multiple" || var_1._id_00AB == "trigger_use_touch" )
    {
        var_4[0] = var_1 _meth_8216( 1, 1, 1 );
        var_4[1] = var_1 _meth_8216( 1, 1, -1 );
        var_4[2] = var_1 _meth_8216( 1, -1, 1 );
        var_4[3] = var_1 _meth_8216( 1, -1, -1 );
        var_4[4] = var_1 _meth_8216( -1, 1, 1 );
        var_4[5] = var_1 _meth_8216( -1, 1, -1 );
        var_4[6] = var_1 _meth_8216( -1, -1, 1 );
        var_4[7] = var_1 _meth_8216( -1, -1, -1 );
        var_5 = 0;

        foreach ( var_7 in var_4 )
        {
            var_8 = distance( var_7, var_1._id_02E6 );

            if ( var_8 > var_5 )
                var_5 = var_8;
        }

        var_2 = getnodesinradius( var_1._id_02E6, var_5, 0, 100 );

        foreach ( var_11 in var_2 )
        {
            if ( !_func_22A( var_11._id_02E6, var_1 ) )
            {
                if ( _func_22A( var_11._id_02E6 + ( 0, 0, 40 ), var_1 ) || _func_22A( var_11._id_02E6 + ( 0, 0, 80 ), var_1 ) || _func_22A( var_11._id_02E6 + ( 0, 0, 120 ), var_1 ) )
                    var_0._id_6136 = _id_A4F0::_id_0CDA( var_0._id_6136, var_11 );
            }
        }
    }
}

_id_16F1()
{
    wait 1.0;
    _id_16F2( level._id_1555 );
    level._id_16EA = 1;
}

_id_16F2( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_174F ) )
        {
            var_2._id_174F = [];
            var_3 = _func_1FE( var_2._id_04C6 );

            foreach ( var_5 in var_3 )
            {
                if ( !var_5 _meth_8386() )
                    var_2._id_174F = _id_A4F0::_id_0CDA( var_2._id_174F, var_5 );
            }

            var_2._id_6136 = var_2._id_174F;
            _id_15A3( var_2, var_2._id_04C6 );
            var_2._id_174F = var_2._id_6136;
            var_2._id_6136 = undefined;
        }
    }
}

_id_1625( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_669A )
    {
        if ( _id_A75A::_id_51CB( var_3 ) && isdefined( var_3._id_04A8 ) && var_3._id_04A8 == var_0 )
            var_1++;
    }

    return var_1;
}

_id_1623( var_0, var_1, var_2 )
{
    var_3 = _id_1626( "attacker", var_0 );

    foreach ( var_5 in level._id_0328 )
    {
        if ( !isai( var_5 ) && isdefined( var_5._id_04A8 ) && var_5._id_04A8 == var_0 )
        {
            if ( distancesquared( var_1, var_5._id_02E6 ) > squared( var_2 ) )
                var_3 = _id_A4F0::_id_0CDA( var_3, var_5 );
        }
    }

    return var_3;
}

_id_1624( var_0, var_1, var_2 )
{
    var_3 = _id_1626( "defender", var_0 );

    foreach ( var_5 in level._id_0328 )
    {
        if ( !isai( var_5 ) && isdefined( var_5._id_04A8 ) && var_5._id_04A8 == var_0 )
        {
            if ( distancesquared( var_1, var_5._id_02E6 ) <= squared( var_2 ) )
                var_3 = _id_A4F0::_id_0CDA( var_3, var_5 );
        }
    }

    return var_3;
}

_id_1629( var_0 )
{
    self._id_7597 = var_0;
    self _meth_8356();
    maps\mp\bots\_bots_strategy::_id_15EF();
}

_id_1626( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level._id_669A )
    {
        if ( isdefined( var_4._id_04A8 ) && isalive( var_4 ) && _id_A75A::_id_51CB( var_4 ) && var_4._id_04A8 == var_1 && isdefined( var_4._id_7597 ) && var_4._id_7597 == var_0 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_1627()
{
    var_0 = [[ level._id_161C ]]( self._id_04A8 );
    var_1 = [[ level._id_161D ]]( self._id_04A8 );
    var_2 = [[ level._id_161F ]]( self._id_04A8 );
    var_3 = [[ level._id_1622 ]]( self._id_04A8 );
    var_4 = level._id_16B2[self._id_67DC];

    if ( var_4 == "active" )
    {
        if ( var_0.size >= var_2 )
        {
            var_5 = 0;

            foreach ( var_7 in var_0 )
            {
                if ( isai( var_7 ) && level._id_16B2[var_7._id_67DC] == "stationary" )
                {
                    var_7._id_7597 = undefined;
                    var_5 = 1;
                    break;
                }
            }

            if ( var_5 )
            {
                _id_1629( "attacker" );
                return;
            }

            _id_1629( "defender" );
            return;
        }
        else
            _id_1629( "attacker" );
    }
    else if ( var_4 == "stationary" )
    {
        if ( var_1.size >= var_3 )
        {
            var_5 = 0;

            foreach ( var_10 in var_1 )
            {
                if ( isai( var_10 ) && level._id_16B2[var_10._id_67DC] == "active" )
                {
                    var_10._id_7597 = undefined;
                    var_5 = 1;
                    break;
                }
            }

            if ( var_5 )
            {
                _id_1629( "defender" );
                return;
            }

            _id_1629( "attacker" );
            return;
        }
        else
            _id_1629( "defender" );
    }
}

_id_161E()
{
    level notify( "bot_gametype_attacker_defender_ai_director_update" );
    level endon( "bot_gametype_attacker_defender_ai_director_update" );
    level endon( "game_ended" );
    var_0 = [ "allies", "axis" ];
    var_1 = gettime() + 2000;

    for (;;)
    {
        if ( gettime() > var_1 )
        {
            var_1 = gettime() + 1000;

            foreach ( var_3 in var_0 )
            {
                var_4 = [[ level._id_161C ]]( var_3 );
                var_5 = [[ level._id_161D ]]( var_3 );
                var_6 = [[ level._id_161F ]]( var_3 );
                var_7 = [[ level._id_1622 ]]( var_3 );

                if ( var_4.size > var_6 )
                {
                    var_8 = [];
                    var_9 = 0;

                    foreach ( var_11 in var_4 )
                    {
                        if ( isai( var_11 ) )
                        {
                            if ( level._id_16B2[var_11._id_67DC] == "stationary" )
                            {
                                var_11 _id_1629( "defender" );
                                var_9 = 1;
                                break;
                            }
                            else
                                var_8 = _id_A4F0::_id_0CDA( var_8, var_11 );
                        }
                    }

                    if ( !var_9 && var_8.size > 0 )
                        _id_A4F0::_id_710B( var_8 ) _id_1629( "defender" );
                }

                if ( var_5.size > var_7 )
                {
                    var_13 = [];
                    var_14 = 0;

                    foreach ( var_16 in var_5 )
                    {
                        if ( isai( var_16 ) )
                        {
                            if ( level._id_16B2[var_16._id_67DC] == "active" )
                            {
                                var_16 _id_1629( "attacker" );
                                var_14 = 1;
                                break;
                            }
                            else
                                var_13 = _id_A4F0::_id_0CDA( var_13, var_16 );
                        }
                    }

                    if ( !var_14 && var_13.size > 0 )
                        _id_A4F0::_id_710B( var_13 ) _id_1629( "attacker" );
                }
            }
        }

        wait 0.05;
    }
}
