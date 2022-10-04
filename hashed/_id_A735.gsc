// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_34EA()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_shield_taken" );
    self notify( "exo_shield_think_end" );
    self endon( "exo_shield_think_end" );
    var_0 = _id_3D5C();

    if ( !self _meth_8314( var_0 ) )
        return;

    self _meth_84A6( var_0, 1.0 );
    var_1 = _func_297( var_0 );
    var_2 = self _meth_84A5( var_0 );

    if ( self _meth_831A() == var_0 )
    {
        self _meth_82FB( "ui_exo_battery_level0", var_2 );
        self _meth_82FB( "exo_ability_nrg_req0", var_1 );
        self _meth_82FB( "exo_ability_nrg_total0", var_2 );
    }
    else if ( self _meth_8345() == var_0 )
    {
        self _meth_82FB( "ui_exo_battery_level1", var_2 );
        self _meth_82FB( "exo_ability_nrg_req1", var_1 );
        self _meth_82FB( "exo_ability_nrg_total1", var_2 );
    }

    thread _id_9FAD( var_0 );

    for (;;)
    {
        self waittillmatch( "grenade_pullback", var_0 );
        _id_A750::_id_8706( "mp_exo_shield_activate" );
        self._id_030D["numberOfTimesShieldUsed"]++;
        _id_A72F::_id_7E17( var_0, "ui_exo_battery_toggle", 1 );
        self._id_34E9 = 1;

        if ( !isagent( self ) )
            thread _id_A72F::_id_9AB1( var_0 );

        if ( self _meth_84A8( var_0 ) == 1 )
            self waittillmatch( "battery_discharge_end", var_0 );

        _id_A750::_id_8706( "mp_exo_shield_deactivate" );
        _id_A72F::_id_7E17( var_0, "ui_exo_battery_toggle", 0 );
        self._id_34E9 = 0;
    }
}

_id_9112()
{
    self notify( "kill_battery" );
    self notify( "exo_shield_taken" );
    self _meth_830F( _id_3D5C() );
}

_id_41C1()
{
    self _meth_830E( _id_3D5C() );
    thread _id_34EA();
}

_id_3D5C()
{
    if ( isdefined( level._id_350F ) )
        return level._id_350F;

    level._id_350F = "exoshield_equipment_mp";

    if ( isdefined( level._id_511A ) )
        level._id_350F = "exoshieldhorde_equipment_mp";

    return level._id_350F;
}

_id_9FAD( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "death", "joined_team", "faux_spawn", "exo_shield_taken" );
    _id_A72F::_id_7E17( var_0, "ui_exo_battery_toggle", 0 );
    self._id_34E9 = 0;
    self _meth_84C6();
}
