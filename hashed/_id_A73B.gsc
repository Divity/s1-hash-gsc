// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A212()
{
    self notify( "exo_health_taken" );
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_health_taken" );

    if ( !self _meth_8314( "extra_health_mp" ) )
        return;

    _id_35AB();
    thread _id_5E99();
    thread _id_9F9B();

    for (;;)
    {
        self waittill( "exo_ability_activate", var_0 );

        if ( var_0 == "extra_health_mp" )
        {
            if ( !isalive( self ) )
                return;

            thread _id_98A9();
        }
    }
}

_id_35AB()
{
    self._id_348D = 0;
    self _meth_84A6( "extra_health_mp", 1.0 );
    var_0 = self _meth_84A5( "extra_health_mp" );

    if ( self _meth_831A() == "extra_health_mp" )
    {
        self _meth_82FB( "exo_ability_nrg_req0", 0 );
        self _meth_82FB( "exo_ability_nrg_total0", var_0 );
        self _meth_82FB( "ui_exo_battery_level0", var_0 );
    }
    else if ( self _meth_8345() == "extra_health_mp" )
    {
        self _meth_82FB( "exo_ability_nrg_req1", 0 );
        self _meth_82FB( "exo_ability_nrg_total1", var_0 );
        self _meth_82FB( "ui_exo_battery_level1", var_0 );
    }

    if ( !isdefined( level._id_348C ) )
        level._id_348C = loadfx( "vfx/unique/exo_health_le_inactive" );

    if ( !isdefined( level._id_348B ) )
        level._id_348B = loadfx( "vfx/unique/exo_health_le_active" );

    if ( !isdefined( level._id_348F ) )
        level._id_348F = loadfx( "vfx/unique/exo_health_rt_inactive" );

    if ( !isdefined( level._id_348E ) )
        level._id_348E = loadfx( "vfx/unique/exo_health_rt_active" );

    wait 0.05;

    if ( !_id_A75A::_id_4FA3() )
    {
        playfxontag( level._id_348C, self, "J_Shoulder_LE" );
        playfxontag( level._id_348F, self, "J_Shoulder_RI" );
    }
}

_id_98A9()
{
    self endon( "exo_health_taken" );

    if ( self._id_348D == 1 )
        thread _id_8EDE( 1 );
    else
        thread _id_8D0F();
}

_id_537E()
{
    if ( isdefined( self._id_8E33 ) )
    {
        self._id_8E33 delete();
        self._id_8E33 = undefined;
    }

    if ( isdefined( self._id_8E34 ) )
    {
        self._id_8E34 delete();
        self._id_8E34 = undefined;
    }
}

_id_8D0F()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_health_taken" );
    self endon( "EndExtraHealth" );
    self._id_348D = 1;
    self._id_0275 = int( self._id_0275 * 1.4 );
    self._id_4BB6 = 1;
    self._id_478F = 0.99;
    self notify( "damage" );
    self _meth_849F( "extra_health_mp" );
    _id_A72F::_id_7E17( "extra_health_mp", "ui_exo_battery_toggle", 1 );
    thread _id_A72F::_id_9AB1( "extra_health_mp" );
    thread _id_5EDF();
    _id_A750::_id_8706( "mp_exo_health_activate" );
    _id_537E();
    wait 0.05;

    if ( !self._id_348D )
        return;

    if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
    {
        self._id_8E33 = _func_2C1( level._id_348B, self, "J_Shoulder_LE" );
        self._id_8E34 = _func_2C1( level._id_348E, self, "J_Shoulder_RI" );
        triggerfx( self._id_8E33 );
        triggerfx( self._id_8E34 );
    }
}

_id_8EDE( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_health_taken" );

    if ( !isdefined( self._id_348D ) || !self._id_348D )
        return;

    self notify( "EndExtraHealth" );
    self endon( "EndExtraHealth" );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    self._id_348D = 0;

    if ( isdefined( level._id_511A ) )
        self._id_0275 = self._id_1E37 + self._id_4957 * 40;
    else
        self._id_0275 = int( self._id_0275 / 1.4 );

    if ( self._id_01E7 > self._id_0275 )
        self._id_01E7 = self._id_0275;

    self._id_478F = undefined;
    self _meth_84A0( "extra_health_mp" );
    _id_A72F::_id_7E17( "extra_health_mp", "ui_exo_battery_toggle", 0 );
    _id_537E();

    if ( var_0 == 1 )
    {
        _id_A750::_id_8706( "mp_exo_health_deactivate" );
        wait 0.05;

        if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
        {
            self._id_8E33 = _func_2C1( level._id_348C, self, "J_Shoulder_LE" );
            self._id_8E34 = _func_2C1( level._id_348F, self, "J_Shoulder_RI" );
            triggerfx( self._id_8E33 );
            triggerfx( self._id_8E34 );
        }
    }
}

_id_5E99()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "death", "joined_team", "faux_spawn", "exo_health_taken" );
    thread _id_8EDE( 0 );
}

_id_5EDF()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_health_taken" );

    while ( self._id_348D == 1 )
    {
        if ( self _meth_84A2( "extra_health_mp" ) <= 0 )
            thread _id_8EDE( 1 );

        wait 0.05;
    }
}

_id_910C()
{
    self notify( "kill_battery" );
    self notify( "exo_health_taken" );
    self _meth_830F( "extra_health_mp" );
}

_id_41BB()
{
    self _meth_830E( "extra_health_mp" );
    thread _id_A212();
}

_id_9F9B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_health_taken" );
    level waittill( "game_ended" );
    thread _id_8EDE( 0 );
}
