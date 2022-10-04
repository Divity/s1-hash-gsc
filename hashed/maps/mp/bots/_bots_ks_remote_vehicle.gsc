// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_731F()
{
    while ( !isdefined( level._id_1729 ) )
        wait 0.05;

    if ( isdefined( level._id_1656 ) )
        return;

    level._id_65D1 = [];

    if ( isdefined( level._id_9256 ) )
        var_0 = [[ level._id_9256 ]]();
    else
    {
        var_0 = [];

        for ( var_1 = 0; var_1 < level._id_A3E6; var_1++ )
            var_0[var_0.size] = var_1;
    }

    foreach ( var_3 in var_0 )
    {
        if ( botzonegetindoorpercent( var_3 ) < 0.25 )
            level._id_65D1 = _id_A4F0::_id_0CDA( level._id_65D1, var_3 );
    }

    level._id_1656 = 1;
}

_id_1678( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        return 0;

    var_5 = 1;
    var_6 = 1;
    var_7 = undefined;

    if ( isdefined( self._id_611E ) )
    {
        var_8 = self _meth_835B();
        var_9 = distancesquared( self._id_02E6, self._id_611E._id_02E6 );

        if ( var_9 < squared( var_8 ) )
        {
            var_5 = 0;
            var_6 = 0;
        }
        else if ( var_9 < squared( 200 ) )
            var_5 = 0;
    }

    var_10 = var_0._id_8F20 == "vanguard" && _id_503D();

    if ( var_10 || var_5 )
    {
        var_11 = getnodesinradius( self._id_02E6, 500, 0, 512 );

        if ( isdefined( var_11 ) && var_11.size > 0 )
        {
            if ( isdefined( var_4 ) && var_4 )
            {
                var_12 = var_11;
                var_11 = [];

                foreach ( var_14 in var_12 )
                {
                    if ( _func_20C( var_14 ) )
                    {
                        var_15 = getlinkednodes( var_14 );
                        var_16 = 0;

                        foreach ( var_18 in var_15 )
                        {
                            if ( _func_20C( var_18 ) )
                                var_16++;
                        }

                        if ( var_16 / var_15.size > 0.5 )
                            var_11 = _id_A4F0::_id_0CDA( var_11, var_14 );
                    }
                }
            }

            if ( var_10 )
            {
                var_21 = self _meth_8380( var_11, "node_exposed" );

                foreach ( var_14 in var_21 )
                {
                    if ( bullettracepassed( var_14._id_02E6 + ( 0, 0, 30 ), var_14._id_02E6 + ( 0, 0, 400 ), 0, self ) )
                    {
                        var_7 = var_14;
                        break;
                    }

                    wait 0.05;
                }
            }
            else if ( var_11.size > 0 )
                var_7 = self _meth_8364( var_11, min( 3, var_11.size ), "node_hide" );

            if ( !isdefined( var_7 ) )
                return 0;

            self _meth_8355( var_7, "tactical" );
        }
    }

    if ( var_6 )
    {
        var_24 = maps\mp\bots\_bots_util::_id_172E();

        if ( var_24 != "goal" )
        {
            _id_9882( var_7 );
            return 1;
        }
    }

    if ( isdefined( var_2 ) && !self [[ var_2 ]]() )
    {
        _id_9882( var_7 );
        return 0;
    }

    if ( !maps\mp\bots\_bots_util::_id_15AB() )
    {
        _id_9882( var_7 );
        return 1;
    }

    if ( !isdefined( var_7 ) )
    {
        if ( self _meth_817C() == "prone" )
            self _meth_8352( "prone" );
        else if ( self _meth_817C() == "crouch" )
            self _meth_8352( "crouch" );
    }
    else if ( self _meth_837B( "strategyLevel" ) > 0 )
    {
        if ( randomint( 100 ) > 50 )
            self _meth_8352( "prone" );
        else
            self _meth_8352( "crouch" );
    }

    maps\mp\bots\_bots_ks::_id_1708( var_0, var_1, var_0._id_0512 );
    self._id_9C8D = undefined;
    self thread [[ var_3 ]]();
    thread _id_1605();
    thread _id_1607( var_7 );
    self waittill( "control_func_done" );
    return 1;
}

_id_1605()
{
    self endon( "disconnect" );
    self endon( "control_func_done" );
    level endon( "game_ended" );
    self waittill( "spawned_player" );
    self notify( "control_func_done" );
}

_id_1607( var_0 )
{
    self endon( "disconnect" );
    self waittill( "control_func_done" );
    _id_9882( var_0 );
    self _meth_8352( "none" );
    self _meth_8353( 0, 0 );
    self _meth_8351( "disable_movement", 0 );
    self _meth_8351( "disable_rotation", 0 );
    self._id_9C8D = undefined;
}

_id_9882( var_0 )
{
    if ( isdefined( var_0 ) && self _meth_8365() && isdefined( self _meth_8376() ) && self _meth_8376() == var_0 )
        self _meth_8356();
}

_id_1606( var_0 )
{
    var_0 waittill( "death" );
    self notify( "control_func_done" );
}

_id_1730( var_0 )
{
    var_1 = gettime();

    while ( !self [[ level._id_167E["isUsing"][var_0] ]]() )
    {
        wait 0.05;

        if ( gettime() - var_1 > 5000 )
            return 0;
    }

    return 1;
}

_id_503D()
{
    return level._id_0391 == "mp_sovereign";
}

_id_15BB()
{
    return isdefined( self._id_3691 ) && self._id_3691;
}

_id_47D6( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = 0;

    foreach ( var_5 in var_0 )
    {
        var_6 = distancesquared( level._id_1698, [[ level._id_167E["heli_node_get_origin"][var_1] ]]( var_5 ) );

        if ( var_6 > var_3 )
        {
            var_3 = var_6;
            var_2 = var_5;
        }
    }

    if ( isdefined( var_2 ) )
        return var_2;
    else
        return _id_A4F0::_id_710B( var_0 );
}

_id_47BF( var_0 )
{
    return var_0._id_02E6;
}

_id_3759( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = 99999999;

    foreach ( var_5 in level._id_164B )
    {
        var_6 = _func_220( var_0, [[ level._id_167E["heli_node_get_origin"][var_1] ]]( var_5 ) );

        if ( var_6 < var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    return var_2;
}

_id_1673( var_0 )
{
    var_1 = _id_1670( var_0 );
    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_A3E6; var_3++ )
        var_2[var_3] = [];

    foreach ( var_5 in var_1 )
    {
        var_6 = var_5 _meth_8387();
        var_7 = _func_206( var_6 );

        if ( isdefined( var_7 ) )
            var_2[var_7] = _id_A4F0::_id_0CDA( var_2[var_7], var_5 );
    }

    return var_2;
}

_id_1674( var_0 )
{
    var_1 = _id_1671( var_0 );
    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_A3E6; var_3++ )
        var_2[var_3] = [];

    foreach ( var_5 in var_1 )
    {
        var_6 = var_5 _meth_8387();
        var_7 = _func_206( var_6 );
        var_2[var_7] = _id_A4F0::_id_0CDA( var_2[var_7], var_5 );
    }

    return var_2;
}

_id_1671( var_0 )
{
    return _id_1672( self._id_04A8, "enemy", var_0 );
}

_id_1670( var_0 )
{
    return _id_1672( self._id_04A8, "ally", var_0 );
}

_id_1672( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = level._id_669A;

    if ( isdefined( var_2 ) && var_2 )
        var_4 = level._id_0328;

    foreach ( var_6 in var_4 )
    {
        if ( var_6 == self || !isalive( var_6 ) )
            continue;

        var_7 = 0;

        if ( var_1 == "ally" )
            var_7 = level._id_91E4 && var_0 == var_6._id_04A8;
        else if ( var_1 == "enemy" )
            var_7 = !level._id_91E4 || var_0 != var_6._id_04A8;

        if ( var_7 )
        {
            var_8 = var_6 _meth_8387();

            if ( isdefined( var_8 ) && _func_20C( var_8 ) )
                var_3 = _id_A4F0::_id_0CDA( var_3, var_6 );
        }
    }

    var_3 = _id_A4F0::_id_0CF6( var_3, self );
    return var_3;
}

_id_164A( var_0 )
{
    var_1 = 99;
    var_2 = [];

    foreach ( var_4 in var_0._id_608D )
    {
        if ( isdefined( var_4._id_0399 ) )
        {
            var_5 = var_4._id_172B[self._id_3313];

            if ( var_5 < var_1 )
            {
                var_2 = [];
                var_2[0] = var_4;
                var_1 = var_5;
            }
            else if ( var_5 == var_1 )
                var_2[var_2.size] = var_4;
        }
    }

    return var_2;
}

_id_15E0( var_0 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "control_func_done" );
    level endon( "game_ended" );
    var_1 = _id_1730( var_0 );

    if ( !var_1 )
        self notify( "control_func_done" );

    foreach ( var_3 in level._id_57B5 )
    {
        if ( var_3._id_02E9 == self )
            self._id_9C8D = var_3;
    }

    childthread _id_1606( self._id_9C8D );
    self._id_9C8D endon( "death" );

    if ( isdefined( level._id_167E["control_other"][var_0] ) )
        self childthread [[ level._id_167E["control_other"][var_0] ]]();

    self [[ level._id_167E["waittill_initial_goal"][var_0] ]]();
    self childthread [[ level._id_167E["control_aiming"][var_0] ]]();
    _id_15E1( var_0, 1 );
    self notify( "control_func_done" );
}

_id_1630( var_0 )
{
    if ( var_0 )
        return squared( 100 );
    else
        return squared( 30 );
}

_id_1631( var_0 )
{
    if ( var_0 )
        return squared( 300 );
    else
        return squared( 90 );
}

_id_15E1( var_0, var_1 )
{
    foreach ( var_3 in level._id_164B )
        var_3._id_172B[self._id_3313] = 0;

    var_5 = _id_3759( self._id_9C8D._id_02E6, var_0 );
    var_6 = undefined;
    self._id_60B8 = 0;
    var_7 = "needs_new_goal";
    var_8 = undefined;
    var_9 = self._id_9C8D._id_02E6;
    var_10 = 3.0;
    var_11 = 0.05;

    while ( self [[ level._id_167E["isUsing"][var_0] ]]() )
    {
        if ( gettime() > self._id_60B8 && var_7 == "needs_new_goal" )
        {
            var_12 = var_5;
            var_5 = [[ level._id_167E["heli_pick_node"][var_0] ]]( var_5 );
            var_6 = undefined;

            if ( isdefined( var_5 ) )
            {
                var_13 = [[ level._id_167E["heli_node_get_origin"][var_0] ]]( var_5 );

                if ( var_1 )
                {
                    var_14 = var_5._id_02E6 + ( _id_A75A::_id_3FC2() + level._id_164C );
                    var_15 = var_5._id_02E6 + _id_A75A::_id_3FC2() - level._id_164C;
                    var_16 = bullettrace( var_14, var_15, 0, undefined, 0, 0, 1 );
                    var_6 = var_16["position"] - _id_A75A::_id_3FC2() + level._id_167F[var_0];
                }
                else
                    var_6 = var_13;
            }

            if ( isdefined( var_6 ) )
            {
                self _meth_8351( "disable_movement", 0 );
                var_7 = "waiting_till_goal";
                var_10 = 3.0;
                var_9 = self._id_9C8D._id_02E6;
            }
            else
            {
                var_5 = var_12;
                self._id_60B8 = gettime() + 2000;
            }
        }
        else if ( var_7 == "waiting_till_goal" )
        {
            if ( !var_1 )
            {
                var_17 = var_6[2] - self._id_9C8D._id_02E6[2];

                if ( var_17 > 10 )
                    self _meth_837E( "lethal" );
                else if ( var_17 < -10 )
                    self _meth_837E( "tactical" );
            }

            var_18 = var_6 - self._id_9C8D._id_02E6;

            if ( var_1 )
                var_8 = length2dsquared( var_18 );
            else
                var_8 = lengthsquared( var_18 );

            if ( var_8 < _id_1630( var_1 ) )
            {
                self _meth_8353( 0, 0 );
                self _meth_8351( "disable_movement", 1 );

                if ( self _meth_836B() == "recruit" )
                    self._id_60B8 = gettime() + randomintrange( 5000, 7000 );
                else
                    self._id_60B8 = gettime() + randomintrange( 3000, 5000 );

                var_7 = "needs_new_goal";
            }
            else
            {
                var_18 = var_6 - self._id_9C8D._id_02E6;
                var_19 = vectortoangles( var_18 );
                var_20 = _id_A4F0::_id_928D( var_8 < _id_1631( var_1 ), 0.5, 1.0 );
                self _meth_8353( var_19[1], var_11, var_20 );
                var_10 -= var_11;

                if ( var_10 <= 0.0 )
                {
                    if ( distancesquared( self._id_9C8D._id_02E6, var_9 ) < 225 )
                    {
                        var_5._id_172B[self._id_3313]++;
                        var_7 = "needs_new_goal";
                    }

                    var_9 = self._id_9C8D._id_02E6;
                    var_10 = 3.0;
                }
            }
        }

        wait(var_11);
    }
}

_id_3E42()
{
    var_0 = [];

    foreach ( var_2 in level._id_65D1 )
    {
        var_3 = botzonegetcount( var_2, self._id_04A8, "enemy_predict" );

        if ( var_3 > 0 )
            var_0 = _id_A4F0::_id_0CDA( var_0, var_2 );
    }

    var_5 = undefined;

    if ( var_0.size > 0 )
    {
        var_6 = _id_A4F0::_id_710B( var_0 );
        var_7 = _id_A4F0::_id_710B( _func_203( var_6 ) );
        var_5 = var_7._id_02E6;
    }
    else
    {
        if ( isdefined( level._id_9255 ) )
            var_8 = [[ level._id_9255 ]]();
        else
            var_8 = getallnodes();

        var_9 = 0;

        while ( var_9 < 10 )
        {
            var_9++;
            var_10 = var_8[randomint( var_8.size )];
            var_5 = var_10._id_02E6;

            if ( _func_20C( var_10 ) && _func_220( var_10._id_02E6, self._id_9C8D._id_02E6 ) > 62500 )
                break;
        }
    }

    return var_5;
}
