// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4E27()
{
    self._id_8E53 = undefined;
    self._id_8E54 = undefined;
    self._id_8E42 = undefined;
    self._id_8E43 = undefined;
    thread _id_745D();
}

_id_745C()
{
    if ( !isdefined( self._id_8E56 ) )
        return;

    self._id_8E56 = undefined;
    self notify( "stop_javelin_locking_feedback" );
    self notify( "stop_javelin_locked_feedback" );
    self _meth_82E6();
    _id_4E27();
}

_id_745D()
{
    self endon( "disconnect" );
    self notify( "ResetStingerLockingOnDeath" );
    self endon( "ResetStingerLockingOnDeath" );

    for (;;)
    {
        self waittill( "death" );
        _id_745C();
    }
}

_id_8E32( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !self _meth_8214( var_0._id_02E6, 65, 85 ) )
        return 0;

    if ( isdefined( level._id_06CE ) && self._id_8E54 == level._id_06CE._id_6879 && !isdefined( level._id_06D1 ) )
        return 0;

    if ( isdefined( level._id_656B ) && self._id_8E54 == level._id_656B && !isdefined( level._id_656C ) )
        return 0;

    return 1;
}

_id_5891()
{
    self endon( "faux_spawn" );
    self endon( "stop_javelin_locking_feedback" );

    for (;;)
    {
        if ( isdefined( level._id_1D48 ) && isdefined( level._id_1D48._id_4470 ) && isdefined( self._id_8E54 ) && self._id_8E54 == level._id_1D48._id_4470 )
            level._id_1D48._id_4470 _meth_82F4( "missile_locking" );

        if ( isdefined( level._id_06D1 ) && isdefined( self._id_8E54 ) && self._id_8E54 == level._id_06CE._id_6879 )
            level._id_06D1 _meth_82F4( "missile_locking" );

        self _meth_82F4( "stinger_locking" );
        self _meth_80AD( "ac130_25mm_fire" );
        wait 0.6;
    }
}

_id_5890()
{
    self endon( "faux_spawn" );
    self endon( "stop_javelin_locked_feedback" );

    for (;;)
    {
        if ( isdefined( level._id_1D48 ) && isdefined( level._id_1D48._id_4470 ) && isdefined( self._id_8E54 ) && self._id_8E54 == level._id_1D48._id_4470 )
            level._id_1D48._id_4470 _meth_82F4( "missile_locking" );

        if ( isdefined( level._id_06D1 ) && isdefined( self._id_8E54 ) && self._id_8E54 == level._id_06CE._id_6879 )
            level._id_06D1 _meth_82F4( "missile_locking" );

        self _meth_82F4( "stinger_locked" );
        self _meth_80AD( "ac130_25mm_fire" );
        wait 0.25;
    }
}

_id_5815( var_0 )
{
    var_1 = self _meth_80A8();

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = sighttracepassed( var_1, var_0._id_02E6, 0, var_0 );

    if ( var_2 )
        return 1;

    var_3 = var_0 _meth_8216( 1, 0, 0 );
    var_2 = sighttracepassed( var_1, var_3, 0, var_0 );

    if ( var_2 )
        return 1;

    var_4 = var_0 _meth_8216( -1, 0, 0 );
    var_2 = sighttracepassed( var_1, var_4, 0, var_0 );

    if ( var_2 )
        return 1;

    return 0;
}

_id_8E3F( var_0 )
{

}

_id_885C()
{
    var_0 = 500;

    if ( _id_5815( self._id_8E54 ) )
    {
        self._id_8E43 = 0;
        return 1;
    }

    if ( self._id_8E43 == 0 )
        self._id_8E43 = gettime();

    var_1 = gettime() - self._id_8E43;

    if ( var_1 >= var_0 )
    {
        _id_745C();
        return 0;
    }

    return 1;
}

_id_4105()
{
    var_0 = [];

    if ( _id_A75A::_id_4FA3() )
        return var_0;

    if ( level._id_91E4 )
    {
        if ( isdefined( level._id_1D48 ) && ( level._id_1D48._id_04A8 != self._id_04A8 || isdefined( level._id_1D48._id_02E9 ) && level._id_1D48._id_02E9 == self ) )
            var_0[var_0.size] = level._id_1D48;

        if ( isdefined( level._id_06D1 ) && level._id_06D1._id_04A8 != self._id_04A8 )
            var_0[var_0.size] = level._id_06CE._id_6879;

        if ( isdefined( level._id_656C ) && level._id_656C._id_04A8 != self._id_04A8 )
            var_0[var_0.size] = level._id_656B;

        if ( isdefined( level._id_89A1 ) )
        {
            foreach ( var_2 in level._id_89A1 )
            {
                if ( isdefined( var_2 ) && var_2._id_04A8 != self._id_04A8 )
                    var_0[var_0.size] = var_2;
            }
        }

        if ( isdefined( level._id_46DC ) )
        {
            foreach ( var_5 in level._id_46DC )
            {
                if ( isdefined( var_5 ) && ( var_5._id_04A8 != self._id_04A8 || isdefined( var_5._id_02E9 ) && var_5._id_02E9 == self ) )
                    var_0[var_0.size] = var_5;
            }
        }

        if ( level._id_5FE9 )
        {
            for ( var_7 = 0; var_7 < level._id_91F0.size; var_7++ )
            {
                if ( self._id_04A8 != level._id_91F0[var_7] )
                {
                    if ( level._id_99E1[level._id_91F0[var_7]].size )
                    {
                        foreach ( var_9 in level._id_99E1[level._id_91F0[var_7]] )
                            var_0[var_0.size] = var_9;
                    }
                }
            }
        }
        else if ( level._id_99E1[level._id_65B0[self._id_04A8]].size )
        {
            foreach ( var_9 in level._id_99E1[level._id_65B0[self._id_04A8]] )
                var_0[var_0.size] = var_9;
        }

        if ( isdefined( level._id_57B5 ) )
        {
            foreach ( var_14 in level._id_57B5 )
            {
                if ( isdefined( var_14 ) && ( var_14._id_04A8 != self._id_04A8 || isdefined( var_14._id_02E9 ) && var_14._id_02E9 == self ) )
                    var_0[var_0.size] = var_14;
            }
        }

        if ( isdefined( level._id_99E7 ) )
        {
            foreach ( var_17 in level._id_99E7 )
            {
                if ( isdefined( var_17 ) && ( var_17._id_04A8 != self._id_04A8 || isdefined( var_17._id_02E9 ) && var_17._id_02E9 == self ) )
                    var_0[var_0.size] = var_17;
            }
        }
    }
    else
    {
        if ( isdefined( level._id_1D48 ) )
            var_0[var_0.size] = level._id_1D48;

        if ( isdefined( level._id_06D1 ) )
            var_0[var_0.size] = level._id_06CE._id_6879;

        if ( isdefined( level._id_46DC ) )
        {
            foreach ( var_5 in level._id_46DC )
            {
                if ( isdefined( var_5 ) )
                    var_0[var_0.size] = var_5;
            }
        }

        if ( level._id_99E1.size )
        {
            foreach ( var_22, var_9 in level._id_99E1 )
            {
                if ( isdefined( var_9._id_02E9 ) && var_9._id_02E9 == self )
                    continue;

                var_0[var_0.size] = var_9;
            }
        }

        if ( isdefined( level._id_57B5 ) )
        {
            foreach ( var_14 in level._id_57B5 )
            {
                if ( !isdefined( var_14 ) )
                    continue;

                var_0[var_0.size] = var_14;
            }
        }

        if ( isdefined( level._id_99E7 ) )
        {
            foreach ( var_17 in level._id_99E7 )
            {
                if ( !isdefined( var_17 ) )
                    continue;

                var_0[var_0.size] = var_17;
            }
        }
    }

    return var_0;
}

_id_8E55()
{
    if ( !isplayer( self ) )
        return;

    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = 1000;
    _id_4E27();

    for (;;)
    {
        wait 0.05;

        if ( self _meth_8340() < 0.95 )
        {
            _id_745C();
            continue;
        }

        var_1 = self _meth_8311();

        if ( issubstr( var_1, "stingerm7" ) )
            continue;

        if ( var_1 != "stinger_mp" && var_1 != "iw5_maaws_mp" )
        {
            _id_745C();
            continue;
        }

        self._id_8E56 = 1;

        if ( !isdefined( self._id_8E53 ) )
            self._id_8E53 = 0;

        _id_8E3F( self._id_8E54 );

        if ( self._id_8E53 == 0 )
        {
            var_2 = _id_4105();

            if ( var_2.size == 0 )
                continue;

            var_3 = [];

            foreach ( var_5 in var_2 )
            {
                if ( !isdefined( var_5 ) )
                    continue;

                var_6 = self _meth_8214( var_5._id_02E6, 65, 75 );

                if ( var_6 )
                    var_3[var_3.size] = var_5;
            }

            if ( var_3.size == 0 )
                continue;

            var_8 = sortbydistance( var_3, self._id_02E6 );

            if ( !_id_5815( var_8[0] ) )
                continue;

            thread _id_5891();
            self._id_8E54 = var_8[0];
            self._id_8E42 = gettime();
            self._id_8E53 = 1;
            self._id_8E43 = 0;
        }

        if ( self._id_8E53 == 1 )
        {
            if ( !_id_8E32( self._id_8E54 ) )
            {
                _id_745C();
                continue;
            }

            var_9 = _id_885C();

            if ( !var_9 )
                continue;

            var_10 = gettime() - self._id_8E42;

            if ( _id_A75A::_id_05CB( "specialty_fasterlockon" ) )
            {
                if ( var_10 < var_0 * 0.5 )
                    continue;
            }
            else if ( var_10 < var_0 )
                continue;

            self notify( "stop_javelin_locking_feedback" );
            thread _id_5890();
            self _meth_82E5( self._id_8E54 );
            self._id_8E53 = 2;
        }

        if ( self._id_8E53 == 2 )
        {
            var_9 = _id_885C();

            if ( !var_9 )
                continue;

            if ( !_id_8E32( self._id_8E54 ) )
            {
                _id_745C();
                continue;
            }
        }
    }
}
