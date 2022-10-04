// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8E50()
{
    thread _id_8E4D();
    thread _id_8E4B();
}

_id_8E4D()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self._id_8E48 = spawnstruct();
    self._id_8E48._id_580A = [];
    self._id_8E48._id_5811 = 0;
    var_0 = 0;

    for (;;)
    {
        var_1 = self _meth_8311();
        var_2 = 0;

        if ( issubstr( var_1, "stingerm7" ) )
            var_2 = 1;
        else if ( issubstr( var_1, "dlcgun11loot2" ) )
            var_2 = 1;

        if ( var_2 && self _meth_8340() > 0.99 )
        {
            var_0 = 1;

            if ( self._id_8E48._id_580A.size > 0 )
                _id_7363();

            self._id_8E48._id_580A = _id_0CF8( _id_A4F0::_id_0D01( self._id_8E48._id_580A ) );

            if ( isdefined( self._id_8E48._id_580F ) )
            {
                if ( !_id_5810( self._id_8E48._id_580F ) )
                {
                    self._id_8E48._id_580F = undefined;
                    self notify( "stop_javelin_locking_feedback" );
                }
            }

            if ( isdefined( self._id_8E48._id_580F ) )
                self._id_8E48._id_5811 += 0.05;
            else
            {
                self._id_8E48._id_5811 = 0;

                if ( self._id_8E48._id_580A.size < 4 )
                {
                    self._id_8E48._id_580F = _id_3CD7();

                    if ( isdefined( self._id_8E48._id_580F ) )
                        thread _id_580E();
                }
            }

            if ( self._id_8E48._id_5811 >= 1 && isdefined( self._id_8E48._id_580F ) && self._id_8E48._id_580A.size < 4 )
            {
                self notify( "stop_javelin_locking_feedback" );
                self._id_8E48._id_580A[self._id_8E48._id_580A.size] = self._id_8E48._id_580F;
                thread _id_5807();
                self._id_8E48._id_580F = undefined;
            }

            if ( self._id_8E48._id_580A.size > 0 )
                self _meth_82E5( self._id_8E48._id_580A[0] );
            else
            {
                self _meth_82E6();
                self notify( "stop_javelin_locked_feedback" );
            }
        }
        else if ( var_0 == 1 )
        {
            var_0 = 0;
            self _meth_82E6();
            self notify( "stop_javelin_locking_feedback" );
            self notify( "stop_javelin_locked_feedback" );
            self._id_8E48._id_580A = [];

            if ( isdefined( self._id_8E48._id_580F ) )
                self._id_8E48._id_580F = undefined;

            self._id_8E48._id_5811 = 0;
        }

        wait 0.05;
    }
}

_id_8E4B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );

    for (;;)
    {
        self waittill( "missile_fire", var_0, var_1 );

        if ( issubstr( var_1, "stingerm7" ) || issubstr( var_1, "dlcgun11loot2" ) )
            thread _id_8E37( self, var_0, var_1 );
    }
}

_id_8E37( var_0, var_1, var_2 )
{
    var_3 = ( 0, 0, 0 );
    var_4 = ( 0, 0, 0 );

    if ( isdefined( var_1 ) )
    {
        var_3 = var_1._id_02E6;
        var_4 = var_1._id_0041;
        var_1 delete();
    }
    else
        return;

    var_0._id_8E48._id_580A = _id_0CF8( _id_A4F0::_id_0D01( self._id_8E48._id_580A ) );
    var_5 = [];

    for ( var_6 = 0; var_6 < 4; var_6++ )
    {
        var_7 = var_4 + _id_7117( 20, 20, 20 );
        var_8 = anglestoforward( var_7 );
        var_9 = magicbullet( var_2, var_3, var_3 + var_8, var_0 );
        var_9._id_02E9 = var_0;

        if ( var_0._id_8E48._id_580A.size > 0 )
        {
            var_10 = undefined;

            if ( var_6 < var_0._id_8E48._id_580A.size )
                var_10 = var_0._id_8E48._id_580A[var_6];
            else
                var_10 = var_0._id_8E48._id_580A[randomint( var_0._id_8E48._id_580A.size )];

            var_9 _meth_81D9( var_10, _id_8E45( var_10 ) );
            var_9._id_580C = var_10;
        }

        var_5[var_5.size] = var_9;
    }

    level notify( "stinger_fired", var_0, var_5 );
    var_0 _meth_82F6( var_2, 0 );
}

_id_0C99( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3._id_580C ) && var_3._id_580C == var_1 )
            return 1;
    }

    return 0;
}

_id_3CD7()
{
    var_0 = _id_A75A::_id_4065( self._id_04A8 );
    var_1 = [];

    foreach ( var_3 in level._id_0328 )
    {
        if ( level._id_91E4 && var_3._id_04A8 == self._id_04A8 )
            continue;

        if ( !_id_A75A::_id_5186( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    var_5 = vehicle_getarray();
    var_6 = [];

    foreach ( var_8 in var_5 )
    {
        if ( !isdefined( var_8._id_02E9 ) )
            continue;

        if ( var_8 _id_A7B5::_id_9D6F() )
            continue;

        if ( level._id_91E4 && var_8._id_02E9._id_04A8 == self._id_04A8 )
            continue;

        var_6[var_6.size] = var_8;
    }

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        foreach ( var_11 in level._id_08A1 )
        {
            if ( level._id_91E4 && var_11._id_04A8 == self._id_04A8 )
                continue;

            if ( !_id_A75A::_id_5186( var_11 ) )
                continue;

            var_1[var_1.size] = var_11;
        }

        foreach ( var_8 in var_5 )
        {
            if ( var_8 _id_A7B5::_id_9D6F() )
                continue;

            if ( level._id_91E4 && var_8._id_04A8 == self._id_04A8 )
                continue;

            var_6[var_6.size] = var_8;
        }
    }

    var_15 = _id_A7C3::_id_3EDA( var_0 );
    var_16 = _id_A4F0::_id_0CDD( var_1, var_6 );
    var_16 = _id_A4F0::_id_0CDD( var_16, var_15 );

    if ( isdefined( level._id_8E41 ) )
        var_16 = _id_A4F0::_id_0CDD( var_16, [[ level._id_8E41 ]]( self ) );

    var_17 = self _meth_80A8();
    var_18 = anglestoforward( self _meth_833B() );
    var_19 = undefined;
    var_20 = cos( 5 );

    foreach ( var_22 in var_16 )
    {
        if ( !_id_A4F0::_id_0CE4( self._id_8E48._id_580A, var_22 ) )
        {
            var_23 = _id_8E46( var_22 );
            var_24 = vectordot( vectornormalize( var_23 - var_17 ), var_18 );

            if ( var_24 > var_20 )
            {
                var_25 = undefined;
                var_26 = !1;

                if ( !var_26 )
                {
                    var_27 = bullettracepassed( var_17, var_23, 0, var_22 );

                    if ( var_27 )
                        var_26 = 1;
                }

                if ( var_26 )
                {
                    var_19 = var_22;
                    var_20 = var_24;
                }
            }
        }
    }

    return var_19;
}

_id_5810( var_0 )
{
    var_1 = self _meth_80A8();
    var_2 = anglestoforward( self _meth_833B() );
    var_3 = _id_8E46( var_0 );

    if ( ( isplayer( var_0 ) || isbot( var_0 ) || isdefined( level._id_511A ) && level._id_511A && isagent( var_0 ) ) && !_id_A75A::_id_5186( var_0 ) )
        return 0;

    if ( vectordot( vectornormalize( var_3 - var_1 ), var_2 ) > cos( 5 ) )
    {
        if ( !1 || bullettracepassed( var_1, var_3, 0, var_0 ) )
            return 1;
    }

    return 0;
}

_id_7363()
{
    for ( var_0 = 0; var_0 <= self._id_8E48._id_580A.size; var_0++ )
    {
        if ( isdefined( self._id_8E48._id_580A[var_0] ) && isdefined( self._id_8E48._id_580A[var_0]._id_02E6 ) )
        {
            if ( !isdefined( self._id_8E48._id_580A[var_0]._id_855F ) )
                self._id_8E48._id_580A[var_0]._id_855F = -1;

            var_1 = ( 0, 0, 0 );

            if ( isplayer( self._id_8E48._id_580A[var_0] ) || isbot( self._id_8E48._id_580A[var_0] ) )
                var_1 = ( 0, 0, 64 );

            if ( self _meth_8215( self._id_8E48._id_580A[var_0]._id_02E6 + var_1, 50, 400, 200 ) )
            {
                if ( bullettracepassed( self _meth_80A8(), self._id_8E48._id_580A[var_0]._id_02E6 + var_1, 0, self._id_8E48._id_580A[var_0] ) )
                {
                    self._id_8E48._id_580A[var_0]._id_855F = -1;
                    continue;
                }
            }

            if ( self._id_8E48._id_580A[var_0]._id_855F == -1 )
            {
                self._id_8E48._id_580A[var_0]._id_855F = gettime();
                continue;
            }

            if ( gettime() - self._id_8E48._id_580A[var_0]._id_855F >= 500 )
            {
                self._id_8E48._id_580A[var_0]._id_855F = -1;
                self._id_8E48._id_580A[var_0] = undefined;
            }
        }
    }
}

_id_8E46( var_0 )
{
    if ( isdefined( var_0._id_40F1 ) )
        return var_0 [[ var_0._id_40F1 ]]();

    return var_0 _meth_8216( 0, 0, 0 );
}

_id_8E45( var_0 )
{
    return _id_8E46( var_0 ) - var_0._id_02E6;
}

_id_580E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self endon( "stop_javelin_locking_feedback" );

    for (;;)
    {
        if ( isdefined( level._id_89A1 ) )
        {
            foreach ( var_1 in level._id_89A1 )
            {
                if ( isdefined( var_1._id_02E9 ) && isdefined( var_1._id_031D ) && isdefined( self._id_8E48._id_580F ) && self._id_8E48._id_580F == var_1 )
                    var_1._id_02E9 _meth_82F4( "wpn_stingerm7_enemy_locked" );
            }
        }

        if ( isdefined( level._id_656C ) && isdefined( self._id_8E48._id_580F ) && self._id_8E48._id_580F == level._id_656B )
            level._id_656C _meth_82F4( "wpn_stingerm7_enemy_locked" );

        self _meth_82F4( "wpn_stingerm7_locking" );
        self _meth_80AD( "heavygun_fire" );
        wait 0.6;
    }
}

_id_5807()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self endon( "stop_javelin_locked_feedback" );

    for (;;)
    {
        if ( isdefined( level._id_89A1 ) )
        {
            foreach ( var_1 in level._id_89A1 )
            {
                if ( isdefined( var_1._id_02E9 ) && isdefined( var_1._id_031D ) && isdefined( self._id_8E48._id_580A ) && _id_511D( self._id_8E48._id_580A, var_1 ) )
                    var_1._id_02E9 _meth_82F4( "wpn_stingerm7_enemy_locked" );
            }
        }

        if ( isdefined( level._id_656C ) && isdefined( self._id_8E48._id_580A ) && _id_511D( self._id_8E48._id_580A, level._id_656B ) )
            level._id_656C _meth_82F4( "wpn_stingerm7_enemy_locked" );

        self _meth_82F4( "wpn_stingerm7_locked" );
        self _meth_80AD( "heavygun_fire" );
        wait 0.25;
    }
}

_id_0CF8( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isalive( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_7117( var_0, var_1, var_2 )
{
    return ( randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_1 ) - var_1 * 0.5, randomfloat( var_2 ) - var_2 * 0.5 );
}

_id_511D( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        foreach ( var_3 in var_0 )
        {
            if ( var_3 == var_1 )
                return 1;
        }
    }

    return 0;
}
