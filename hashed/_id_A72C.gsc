// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    _func_080();
    thread _id_64C5();
    precachestring( &"MP_EMP_REBOOTING" );
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D3();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_5E4F();
    }
}

_id_5E4F()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self._id_3081 = 0;

    for (;;)
    {
        self waittill( "emp_grenaded", var_0 );

        if ( !isalive( self ) )
            continue;

        if ( isdefined( self._id_9C2C ) )
            continue;

        if ( _id_A75A::_id_05CB( "specialty_empimmune" ) )
            continue;

        var_1 = 1;
        var_2 = 0;

        if ( level._id_91E4 && isdefined( var_0 ) && isdefined( var_0._id_030D["team"] ) && var_0._id_030D["team"] == self._id_030D["team"] && var_0 != self )
        {
            if ( level._id_01A9 == 0 )
                continue;
            else if ( level._id_01A9 == 1 )
            {
                var_2 = 0;
                var_1 = 1;
            }
            else if ( level._id_01A9 == 2 )
            {
                var_1 = 0;
                var_2 = 1;
            }
            else if ( level._id_01A9 == 3 )
            {
                var_2 = 1;
                var_1 = 1;
            }
        }
        else if ( isdefined( var_0 ) )
        {
            var_0 notify( "emp_hit" );

            if ( var_0 != self )
                var_0 _id_A7A0::_id_6FF3( "ch_onthepulse" );
        }

        if ( var_1 && isdefined( self ) )
            thread _id_0CAB();

        if ( var_2 && isdefined( var_0 ) )
            var_0 thread _id_0CAB();
    }
}

_id_306D( var_0 )
{
    _id_A7AB::_id_6D47( var_0 );
}

_id_0CAB()
{
    self notify( "applyEmp" );
    self endon( "applyEmp" );
    self endon( "death" );
    self endon( "disconnect" );
    wait 0.05;
    self._id_307C = 3;
    var_0 = 2;

    if ( _id_A75A::_id_50C1() )
    {
        var_0 = 1;
        _id_A75A::_id_6C5F( 0, "empgrenade" );
        _id_A75A::_id_6C60( 0, "empgrenade" );
        _id_A75A::_id_6C5D( 0, "empgrenade" );
        _id_A75A::_id_6C61( 0, "empgrenade" );
        _id_A75A::_id_6C5E( 0, "empgrenade" );
    }

    self._id_3086 = 1;
    self._id_3081 = gettime() + self._id_307C * 1000;
    var_1 = _id_A7AB::_id_6D46( self._id_3081, var_0, "emp" );
    thread _id_2A63( self._id_307C, var_1 );
    thread _id_308D( 0.75 );
    self _meth_821D( 1 );
    thread _id_3087( var_1 );
    wait(self._id_307C);
    self notify( "empGrenadeTimedOut" );
    _id_1D21( var_1 );
}

_id_2A63( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self _meth_84BE( "digital_distort_mp" );
    self _meth_8064( 1.0, 1.0 );
    thread _id_A209( var_1 );
    wait 0.1;
    var_2 = var_0;
    var_3 = 0.95;
    var_4 = 0.2;
    var_5 = var_3 - var_4;
    var_6 = 0.1;
    var_7 = var_3;

    while ( var_2 > 0 )
    {
        var_7 = var_5 * var_2 / var_0 + var_4;
        self _meth_8064( var_7, 1.0 );
        var_2 -= var_6;
        wait(var_6);
    }

    self _meth_8064( 0.0, 0.0 );
}

_id_A209( var_0 )
{
    _id_A4F0::_id_A060( "death", "disconnect", "faux_spawn", "joined_team" );

    if ( isdefined( self ) )
    {
        self _meth_8064( 0.0, 0.0 );
        _id_306D( var_0 );
    }
}

_id_3087( var_0 )
{
    self notify( "empGrenadeDeathWaiter" );
    self endon( "empGrenadeDeathWaiter" );
    self endon( "empGrenadeTimedOut" );
    self waittill( "death" );
    _id_1D21( var_0 );
}

_id_1D21( var_0 )
{
    self._id_3086 = 0;
    self _meth_821D( 0 );

    if ( _id_A75A::_id_50C1() )
    {
        _id_A75A::_id_6C5F( 1, "empgrenade" );
        _id_A75A::_id_6C60( 1, "empgrenade" );
        _id_A75A::_id_6C5D( 1, "empgrenade" );
        _id_A75A::_id_6C61( 1, "empgrenade" );
        _id_A75A::_id_6C5E( 1, "empgrenade" );
    }

    self _meth_8064( 0.0, 0.0 );
    _id_306D( var_0 );
}

_id_308D( var_0 )
{
    self endon( "emp_rumble_loop" );
    self notify( "emp_rumble_loop" );
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        self _meth_80AD( "damage_heavy" );
        wait 0.05;
    }
}

_id_50F8()
{
    return isdefined( self._id_3081 ) && gettime() < self._id_3081;
}
