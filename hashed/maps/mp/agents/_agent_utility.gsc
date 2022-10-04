// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_08A6( var_0 )
{
    return level._id_0897[self._id_08A0][var_0];
}

_id_7DAB( var_0, var_1 )
{
    self._id_04A8 = var_0;
    self._id_001D = var_0;
    self._id_030D["team"] = var_0;
    self._id_02E9 = var_1;
    self _meth_8383( var_1 );
    self _meth_8385( var_1 );
}

_id_4D7C()
{
    self._id_08A0 = "player";
    self._id_030D = [];
    self._id_4723 = 0;
    self._id_50A3 = 0;
    self._id_50A8 = 1;
    self._id_A1C9 = 0;
    self._id_51A8 = 0;
    self._id_03DD = 0;
    self._id_3313 = self _meth_81B1();
    self._id_089F = 0;
    self._id_0898 = 0;
    self._id_1AD6 = 0;
    self._id_001C = undefined;
    self._id_01FC = 0;
    self._id_0200 = 0;
    self _meth_802B();
    _id_4DFC( 0 );
}

_id_4DFC( var_0 )
{
    if ( !var_0 )
    {
        self._id_1E2E = undefined;
        self._id_5586 = undefined;
        self._id_5F78 = undefined;
        self._id_11FC = undefined;
        self._id_444D = undefined;
        self._id_02AB = undefined;
        self._id_780E = undefined;
        self._id_030B = undefined;
        self._id_A2D4 = undefined;
        self._id_6433 = undefined;
        self._id_6300 = undefined;
        self._id_9408 = undefined;
        self._id_1BB6 = undefined;
        self._id_1E23 = undefined;
        self._id_1AD7 = undefined;
        self._id_535C = undefined;
        self._id_03BD = undefined;
        self._id_03BC = undefined;
        self._id_55DC = undefined;
        self._id_55DA = undefined;
        self._id_2B0A = undefined;
        self._id_2B0B = undefined;
        self._id_2B04 = undefined;
        self._id_2B09 = undefined;
        self._id_83C0 = undefined;
        self._id_83BF = undefined;
    }
    else
    {
        self._id_5F78 = level._id_1317;
        self._id_11FC = 5;
        self._id_444D = _id_A75A::_id_4141();
        self._id_02AB = self._id_444D;
        self._id_03BD = self._id_04A8;
        self._id_03BC = "playing";
        self._id_83C0 = 0;
        self._id_83BF = 0;
        self._id_0898 = 1;
        _id_A7A7::_id_8335();
        thread _id_A7DC::_id_64D3();

        if ( _id_A75A::_id_510F( self ) )
        {
            self._id_6300 = 1;
            _id_A78A::_id_4D31();
            self._id_2B0A = 0;
            self._id_2B0B = 0;
            self._id_2B04 = 0;
        }
    }

    self._id_2B09 = 1;
}

_id_3FA0( var_0 )
{
    var_1 = undefined;

    if ( isdefined( level._id_08A1 ) )
    {
        foreach ( var_3 in level._id_08A1 )
        {
            if ( ( !isdefined( var_3._id_50A3 ) || !var_3._id_50A3 ) && ( !isdefined( var_3._id_518A ) || !var_3._id_518A ) )
            {
                if ( isdefined( var_3._id_A041 ) && var_3._id_A041 )
                    continue;

                if ( isdefined( level.despawning_agents ) && _id_A4F0::_id_0CE4( level.despawning_agents, var_3 ) )
                    continue;

                var_1 = var_3;
                var_1 _id_4D7C();

                if ( isdefined( var_0 ) )
                    var_1._id_08A0 = var_0;

                break;
            }
        }
    }

    return var_1;
}

_id_070B()
{
    self._id_50A3 = 1;
}

_id_2630()
{
    thread _id_2631();
}

_id_2631()
{
    self notify( "deactivateAgentDelayed" );
    self endon( "deactivateAgentDelayed" );

    if ( !isdefined( level.despawning_agents ) )
        level.despawning_agents = [];

    if ( !_id_A4F0::_id_0CE4( level.despawning_agents, self ) )
        level.despawning_agents = _id_A4F0::_id_0CDA( level.despawning_agents, self );

    if ( _id_A75A::_id_510F( self ) )
        _id_A7AF::_id_73A9();

    _id_A7AF::_id_73A4();
    wait 0.05;
    self._id_50A3 = 0;
    self._id_4723 = 0;
    self._id_02E9 = undefined;
    self._id_214F = undefined;
    self._id_A041 = undefined;

    foreach ( var_1 in level._id_1C8E )
    {
        if ( isdefined( var_1._id_0E34 ) )
        {
            foreach ( var_4, var_3 in var_1._id_0E34 )
            {
                if ( var_3 == self )
                    var_1._id_0E34[var_4] = undefined;
            }
        }
    }

    self._id_477A = undefined;
    self _meth_802B();
    self notify( "disconnect" );
    self _meth_848A();
    level.despawning_agents = _id_A4F0::_id_0CF6( level.despawning_agents, self );
}

_id_4052( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "all";

    var_1 = _id_3ED7( var_0 );
    return var_1.size;
}

_id_3ED7( var_0 )
{
    var_1 = [];

    if ( !isdefined( level._id_08A1 ) )
        return var_1;

    foreach ( var_3 in level._id_08A1 )
    {
        if ( isdefined( var_3._id_50A3 ) && var_3._id_50A3 )
        {
            if ( var_0 == "all" || var_3._id_08A0 == var_0 )
                var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

_id_4054( var_0 )
{
    return _id_4055( var_0, "all" );
}

_id_4055( var_0, var_1 )
{
    var_2 = 0;

    if ( !isdefined( level._id_08A1 ) )
        return var_2;

    foreach ( var_4 in level._id_08A1 )
    {
        if ( isdefined( var_4._id_50A3 ) && var_4._id_50A3 )
        {
            if ( isdefined( var_4._id_02E9 ) && var_4._id_02E9 == var_0 )
            {
                if ( var_1 == "all" || var_4._id_08A0 == var_1 )
                    var_2++;
            }
        }
    }

    return var_2;
}

_id_414A( var_0, var_1 )
{
    var_2 = getnodesinradius( self._id_02E6, 350, 64, 128, "Path" );

    if ( !isdefined( var_2 ) || var_2.size == 0 )
        return undefined;

    if ( isdefined( level._id_A28E ) && isdefined( level._id_981A ) )
    {
        var_3 = var_2;
        var_2 = [];

        foreach ( var_5 in var_3 )
        {
            if ( var_5._id_02E6[2] > level._id_A28E || !_func_22A( var_5._id_02E6, level._id_981A ) )
                var_2[var_2.size] = var_5;
        }
    }

    var_7 = anglestoforward( self._id_0041 );
    var_8 = -10;
    var_9 = _id_A7AF::_id_408F( self );
    var_10 = ( 0, 0, var_9 );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_11 = [];
    var_12 = [];

    foreach ( var_14 in var_2 )
    {
        if ( !var_14 _meth_8035( "stand" ) )
            continue;

        var_15 = vectornormalize( var_14._id_02E6 - self._id_02E6 );
        var_16 = vectordot( var_7, var_15 );

        for ( var_17 = 0; var_17 < var_12.size; var_17++ )
        {
            if ( var_16 > var_12[var_17] )
            {
                for ( var_18 = var_12.size; var_18 > var_17; var_18-- )
                {
                    var_12[var_18] = var_12[var_18 - 1];
                    var_11[var_18] = var_11[var_18 - 1];
                }

                break;
            }
        }

        var_11[var_17] = var_14;
        var_12[var_17] = var_16;
    }

    for ( var_17 = 0; var_17 < var_11.size; var_17++ )
    {
        var_14 = var_11[var_17];
        var_20 = self._id_02E6 + var_10;
        var_21 = var_14._id_02E6 + var_10;

        if ( var_17 > 0 )
            wait 0.05;

        if ( !sighttracepassed( var_20, var_21, 0, self ) )
            continue;

        if ( var_1 )
        {
            if ( var_17 > 0 )
                wait 0.05;

            var_22 = playerphysicstrace( var_14._id_02E6 + var_10, var_14._id_02E6 );

            if ( distancesquared( var_22, var_14._id_02E6 ) > 1 )
                continue;
        }

        if ( var_0 )
        {
            if ( var_17 > 0 )
                wait 0.05;

            var_22 = physicstrace( var_20, var_21 );

            if ( distancesquared( var_22, var_21 ) > 1 )
                continue;
        }

        return var_14;
    }

    if ( var_11.size > 0 && isdefined( level._id_511A ) )
        return var_11[0];
}

_id_5346( var_0 )
{
    var_0 _meth_8051( var_0._id_01E7 + 500000, var_0._id_02E6 );
}

_id_5357()
{
    self [[ _id_08A6( "on_damaged" ) ]]( level, undefined, self._id_01E7 + 1, 0, "MOD_CRUSH", "none", ( 0, 0, 0 ), ( 0, 0, 0 ), "none", 0 );
}
