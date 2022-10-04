// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A1F2()
{
    self notify( "exo_overclock_taken" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_overclock_taken" );

    if ( !self _meth_8314( "adrenaline_mp" ) )
        return;

    _id_0868();
    thread _id_5E99();
    thread _id_9F9B();

    for (;;)
    {
        self waittill( "exo_adrenaline_fire" );

        if ( !isalive( self ) )
            return;

        thread _id_98A1();
    }
}

_id_0868()
{
    self._id_65D5 = 0;
    self _meth_84A6( "adrenaline_mp", 1.0 );
    var_0 = self _meth_84A5( "adrenaline_mp" );

    if ( self _meth_831A() == "adrenaline_mp" )
    {
        self _meth_82FB( "exo_ability_nrg_req0", 0 );
        self _meth_82FB( "exo_ability_nrg_total0", var_0 );
        self _meth_82FB( "ui_exo_battery_level0", var_0 );
    }
    else if ( self _meth_8345() == "adrenaline_mp" )
    {
        self _meth_82FB( "exo_ability_nrg_req1", 0 );
        self _meth_82FB( "exo_ability_nrg_total1", var_0 );
        self _meth_82FB( "ui_exo_battery_level1", var_0 );
    }

    if ( !isdefined( level._id_34AD ) )
        level._id_34AD = loadfx( "vfx/lights/exo_overclock_hip_le_start" );

    if ( !isdefined( level._id_34AF ) )
        level._id_34AF = loadfx( "vfx/lights/exo_overclock_hip_ri_start" );

    if ( !isdefined( level._id_34AE ) )
        level._id_34AE = loadfx( "vfx/lights/exo_overclock_hip_le_inactive" );

    if ( !isdefined( level._id_34B0 ) )
        level._id_34B0 = loadfx( "vfx/lights/exo_overclock_hip_ri_inactive" );

    wait 0.05;

    if ( !_id_A75A::_id_4FA3() )
    {
        playfxontag( level._id_34AE, self, "J_Hip_LE" );
        playfxontag( level._id_34B0, self, "J_Hip_RI" );
    }
}

_id_98A1()
{
    self endon( "exo_overclock_taken" );

    if ( self._id_65D5 == 1 )
        thread _id_8ED6( 1 );
    else
        thread _id_8CF5();
}

_id_536F()
{
    if ( isdefined( self._id_65D3 ) )
    {
        self._id_65D3 delete();
        self._id_65D3 = undefined;
    }

    if ( isdefined( self._id_65D4 ) )
    {
        self._id_65D4 delete();
        self._id_65D4 = undefined;
    }
}

_id_8CF5()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_overclock_taken" );
    self endon( "EndAdrenaline" );
    self._id_65D5 = 1;
    _id_A789::_id_7F7F( self, 1 );
    self._id_0867 = 1.12;

    if ( _id_A75A::_id_05CB( "specialty_lightweight" ) )
        self._id_5F78 = self._id_0867 + _id_A75A::_id_575E() - 1;
    else
        self._id_5F78 = self._id_0867;

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        var_0 = self _meth_8447( "ui_horde_player_class" );
        self._id_5F78 = min( level._id_1E3A[var_0]["speed"] + 0.25, 1.12 );
    }

    _id_A7B4::_id_9B35();
    self _meth_849F( "adrenaline_mp" );
    _id_A72F::_id_7E17( "adrenaline_mp", "ui_exo_battery_toggle", 1 );
    thread _id_A72F::_id_9AB1( "adrenaline_mp" );
    thread _id_5DD2();
    _id_A750::_id_8706( "mp_exo_overclock_activate" );
    _id_536F();
    wait 0.05;

    if ( !self._id_65D5 )
        return;

    if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
    {
        self._id_65D3 = _func_2C1( level._id_34AD, self, "J_Hip_LE" );
        self._id_65D4 = _func_2C1( level._id_34AF, self, "J_Hip_RI" );
        triggerfx( self._id_65D3 );
        triggerfx( self._id_65D4 );
    }
}

_id_8ED6( var_0 )
{
    if ( !isdefined( self._id_65D5 ) || !self._id_65D5 )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    self notify( "EndAdrenaline" );
    self._id_65D5 = 0;

    if ( _id_A75A::_id_05CB( "specialty_lightweight" ) )
        self._id_5F78 = _id_A75A::_id_575E();
    else
        self._id_5F78 = level._id_1317;

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        var_1 = self _meth_8447( "ui_horde_player_class" );
        self._id_5F78 = level._id_1E3A[var_1]["speed"];
    }

    _id_A7B4::_id_9B35();
    self._id_0867 = undefined;
    self _meth_84A0( "adrenaline_mp" );
    _id_A72F::_id_7E17( "adrenaline_mp", "ui_exo_battery_toggle", 0 );
    _id_536F();

    if ( var_0 == 1 )
    {
        _id_A750::_id_8706( "mp_exo_overclock_deactivate" );
        wait 0.05;

        if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
        {
            self._id_65D3 = _func_2C1( level._id_34AE, self, "J_Hip_LE" );
            self._id_65D4 = _func_2C1( level._id_34B0, self, "J_Hip_RI" );
            triggerfx( self._id_65D3 );
            triggerfx( self._id_65D4 );
        }
    }
}

_id_5E99()
{
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "death", "joined_team", "faux_spawn", "exo_overclock_taken" );
    thread _id_8ED6( 0 );
}

_id_5DD2()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_overclock_taken" );
    self endon( "EndAdrenaline" );

    while ( self._id_65D5 == 1 )
    {
        if ( self _meth_84A2( "adrenaline_mp" ) <= 0 )
            thread _id_8ED6( 1 );

        wait 0.05;
    }
}

_id_910F()
{
    self notify( "kill_battery" );
    self notify( "exo_overclock_taken" );
    self _meth_830F( "adrenaline_mp" );
}

_id_41BE()
{
    self _meth_830E( "adrenaline_mp" );
    thread _id_A1F2();
}

_id_9F9B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_overclock_taken" );
    level waittill( "game_ended" );
    thread _id_8ED6( 0 );
}
