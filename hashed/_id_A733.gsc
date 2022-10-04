// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_34B4()
{
    self notify( "exo_ping_taken" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_ping_taken" );

    if ( !self _meth_8314( "exoping_equipment_mp" ) )
        return;

    _id_34B2();
    thread _id_93C4();
    thread _id_9FAD();
    thread _id_9F9B();
}

_id_34B2()
{
    self._id_34B3 = 0;
    self _meth_84A6( "exoping_equipment_mp", 1.0 );
    var_0 = self _meth_84A5( "exoping_equipment_mp" );

    if ( self _meth_831A() == "exoping_equipment_mp" )
    {
        self _meth_82FB( "ui_exo_battery_level0", var_0 );
        self _meth_82FB( "exo_ability_nrg_req0", _func_298( "exoping_equipment_mp" ) );
        self _meth_82FB( "exo_ability_nrg_total0", var_0 );
    }
    else if ( self _meth_8345() == "exoping_equipment_mp" )
    {
        self _meth_82FB( "ui_exo_battery_level1", var_0 );
        self _meth_82FB( "exo_ability_nrg_req1", _func_298( "exoping_equipment_mp" ) );
        self _meth_82FB( "exo_ability_nrg_total1", var_0 );
    }

    if ( !isdefined( level._id_34B6 ) )
        level._id_34B6 = loadfx( "vfx/unique/exo_ping_inactive" );

    if ( !isdefined( level._id_34B5 ) )
        level._id_34B5 = loadfx( "vfx/unique/exo_ping_active" );

    wait 0.05;

    if ( !_id_A75A::_id_4FA3() )
        playfxontag( level._id_34B6, self, "J_SpineUpper" );
}

_id_93C4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_ping_taken" );

    for (;;)
    {
        self waittill( "exo_ability_activate", var_0 );

        if ( var_0 != "exoping_equipment_mp" )
            continue;

        if ( self._id_34B3 == 1 )
        {
            thread _id_8E77();
            continue;
        }

        if ( self _meth_8314( "exoping_equipment_mp" ) )
        {
            if ( self _meth_84A2( "exoping_equipment_mp" ) > 0 )
                _id_8B98();
        }
    }
}

_id_5D9B()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_ping_taken" );
    self endon( "stop_exo_ping" );

    while ( self._id_34B3 == 1 )
    {
        if ( self _meth_84A2( "exoping_equipment_mp" ) <= 0 )
            thread _id_8E77();

        wait 0.05;
    }
}

_id_9110()
{
    self notify( "kill_battery" );
    self notify( "exo_ping_taken" );
    self _meth_830F( "exoping_equipment_mp" );
}

_id_41BF()
{
    self _meth_830E( "exoping_equipment_mp" );
    thread _id_34B4();
}

_id_5370()
{
    if ( isdefined( self._id_681F ) )
    {
        self._id_681F delete();
        self._id_681F = undefined;
    }
}

_id_8B98()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_ping_taken" );
    self endon( "stop_exo_ping" );
    self._id_34B3 = 1;
    self._id_488E = _id_A756::_id_299E( self, -1 );
    self _meth_82A6( "specialty_exo_ping", 1, 0 );
    self _meth_84A1( "exoping_equipment_mp", _func_297( "exoping_equipment_mp" ) );
    self _meth_849F( "exoping_equipment_mp" );
    _id_A72F::_id_7E17( "exoping_equipment_mp", "ui_exo_battery_toggle", 1 );
    thread _id_A72F::_id_9AB1( "exoping_equipment_mp" );
    thread _id_5D9B();
    _id_A750::_id_8706( "mp_exo_ping_activate" );
    _id_5370();

    if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
    {
        self._id_681F = _func_2C1( level._id_34B5, self, "J_SpineUpper" );
        triggerfx( self._id_681F );
    }
}

_id_8E77( var_0 )
{
    if ( !isdefined( self._id_34B3 ) || !self._id_34B3 )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    self notify( "stop_exo_ping" );
    self._id_34B3 = 0;

    if ( isdefined( self._id_488E ) )
        _id_A756::_id_299C( self._id_488E );

    self _meth_82A9( "specialty_exo_ping", 1 );
    self _meth_84A0( "exoping_equipment_mp" );
    _id_A72F::_id_7E17( "exoping_equipment_mp", "ui_exo_battery_toggle", 0 );
    _id_5370();

    if ( var_0 == 1 )
    {
        _id_A750::_id_8706( "mp_exo_ping_deactivate" );
        wait 0.05;

        if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
        {
            self._id_681F = _func_2C1( level._id_34B6, self, "J_SpineUpper" );
            triggerfx( self._id_681F );
        }
    }
}

_id_9FAD()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "death", "joined_team", "faux_spawn", "exo_ping_taken" );
    thread _id_8E77( 0 );
}

_id_9F9B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_ping_taken" );
    level waittill( "game_ended" );
    thread _id_8E77( 0 );
}
