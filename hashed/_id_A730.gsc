// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_41BA()
{
    var_0 = _id_3D5A();

    if ( self _meth_8314( var_0 ) )
        return;

    self _meth_830E( var_0 );
    self _meth_84A6( var_0, 1.0 );
    self._id_3474 = 0;
    self._id_3473 = undefined;

    if ( self _meth_831A() == var_0 )
    {
        self _meth_82FB( "ui_exo_battery_level0", self _meth_84A2( var_0 ) );
        self _meth_82FB( "exo_ability_nrg_req0", _func_298( var_0 ) );
        self _meth_82FB( "exo_ability_nrg_total0", self _meth_84A5( var_0 ) );
    }
    else if ( self _meth_8345() == var_0 )
    {
        self _meth_82FB( "ui_exo_battery_level1", self _meth_84A2( var_0 ) );
        self _meth_82FB( "exo_ability_nrg_req1", _func_298( var_0 ) );
        self _meth_82FB( "exo_ability_nrg_total1", self _meth_84A5( var_0 ) );
    }

    if ( !isdefined( self._id_3500 ) )
        self._id_3500 = spawnstruct();

    self._id_3500._id_2236 = [];
    self._id_3500._id_2236["viewmodel"] = self _meth_82ED();
    self._id_3500._id_2236["body"] = self _meth_83B8();
    self notify( "exo_cloak_reset" );
    thread _id_9F8D();
    thread _id_9F8E();
    thread _id_9FAD();
    thread _id_9F9B();
}

_id_9F8E()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self endon( "exo_cloak_reset" );

    for (;;)
    {
        self waittill( "exo_ability_activate", var_0 );

        if ( var_0 == level._id_1FC9 )
        {
            if ( !self _meth_84F8() )
                thread _id_4575();
            else
                _id_0714( 1 );

            continue;
        }

        if ( !_id_A75A::_id_501E( var_0 ) )
            _id_0714( 1 );
    }
}

_id_9F8D()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self endon( "exo_cloak_reset" );

    for (;;)
    {
        _id_A4F0::_id_A060( "using_remote", "weapon_fired", "melee_fired", "ground_slam", "grenade_fire" );
        _id_0714( 1 );
    }
}

_id_9FAD()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "exo_cloak_reset" );
    _id_A4F0::_id_A060( "death", "faux_spawn", "joined_team" );
    _id_0714( 1 );
}

_id_4575()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self endon( "exo_cloak_disabled" );
    self endon( "exo_cloak_reset" );

    if ( self _meth_84A2( level._id_1FC9 ) > 0 )
    {
        _id_0715();

        while ( self _meth_84A2( level._id_1FC9 ) > 0 )
            wait 0.05;

        _id_0714( 1 );
    }
}

_id_0715()
{
    self._id_3474 = 1;
    self._id_3473 = undefined;
    self _meth_844B();
    _id_486A();
    self _meth_849F( level._id_1FC9 );
    _id_A72F::_id_7E17( level._id_1FC9, "ui_exo_battery_toggle", 1 );
    thread _id_A72F::_id_9AB1( level._id_1FC9 );
    _id_A750::_id_8706( "mp_exo_cloak_activate" );
    self._id_030D["numberOfTimesCloakingUsed"]++;

    if ( isdefined( level._id_511A ) )
    {
        wait 2;
        self._id_0200 = 1;
    }
}

_id_0714( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( !self _meth_84F8() )
        return;

    self._id_3474 = 0;
    self._id_3473 = gettime();
    self _meth_844C();
    _id_84F9();

    if ( isdefined( level._id_511A ) )
        self._id_0200 = 0;

    self _meth_84A0( level._id_1FC9 );
    _id_A72F::_id_7E17( level._id_1FC9, "ui_exo_battery_toggle", 0 );

    if ( var_0 )
        _id_A750::_id_8706( "mp_exo_cloak_deactivate" );

    self notify( "exo_cloak_disabled" );
}

_id_910B()
{
    var_0 = _id_3D5A();
    self notify( "kill_battery" );
    _id_0714( 0 );
    self _meth_830F( var_0 );
    self notify( "exo_cloak_reset" );
}

_id_9F9B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_cloak_reset" );
    level waittill( "game_ended" );
    _id_0714( 1 );
}

_id_486A()
{
    if ( self _meth_8314( "adrenaline_mp" ) )
    {
        if ( isdefined( self._id_65D5 ) && self._id_65D5 == 1 )
        {
            killfxontag( level._id_34AD, self, "J_Hip_LE" );
            killfxontag( level._id_34AF, self, "J_Hip_RI" );
        }
        else
        {
            killfxontag( level._id_34AE, self, "J_Hip_LE" );
            killfxontag( level._id_34B0, self, "J_Hip_RI" );
        }
    }

    if ( self _meth_8314( "exorepulsor_equipment_mp" ) )
    {
        if ( isdefined( self._id_7404 ) && self._id_7404 == 1 )
            killfxontag( level._id_34E1, self, "TAG_JETPACK" );
        else
            killfxontag( level._id_34E2, self, "TAG_JETPACK" );
    }

    if ( self _meth_8314( "exoping_equipment_mp" ) )
    {
        if ( isdefined( self._id_34B3 ) && self._id_34B3 == 1 )
            killfxontag( level._id_34B5, self, "J_SpineUpper" );
        else
            killfxontag( level._id_34B6, self, "J_SpineUpper" );
    }

    if ( self _meth_8314( "extra_health_mp" ) )
    {
        if ( isdefined( self._id_348D ) && self._id_348D == 1 )
        {
            killfxontag( level._id_348B, self, "J_Shoulder_LE" );
            killfxontag( level._id_348E, self, "J_Shoulder_RI" );
        }
        else
        {
            killfxontag( level._id_348C, self, "J_Shoulder_LE" );
            killfxontag( level._id_348F, self, "J_Shoulder_RI" );
        }
    }
}

_id_84F9()
{
    if ( self _meth_8314( "adrenaline_mp" ) )
    {
        if ( isdefined( self._id_65D5 ) && self._id_65D5 == 1 )
        {
            playfxontag( level._id_34AD, self, "J_Hip_LE" );
            playfxontag( level._id_34AF, self, "J_Hip_RI" );
        }
        else
        {
            playfxontag( level._id_34AE, self, "J_Hip_LE" );
            playfxontag( level._id_34B0, self, "J_Hip_RI" );
        }
    }

    if ( self _meth_8314( "exorepulsor_equipment_mp" ) )
    {
        if ( isdefined( self._id_7404 ) && self._id_7404 == 1 )
            playfxontag( level._id_34E1, self, "TAG_JETPACK" );
        else
            playfxontag( level._id_34E2, self, "TAG_JETPACK" );
    }

    if ( self _meth_8314( "exoping_equipment_mp" ) )
    {
        if ( isdefined( self._id_34B3 ) && self._id_34B3 == 1 )
            playfxontag( level._id_34B5, self, "J_SpineUpper" );
        else
            playfxontag( level._id_34B6, self, "J_SpineUpper" );
    }

    if ( self _meth_8314( "extra_health_mp" ) )
    {
        if ( isdefined( self._id_348D ) && self._id_348D == 1 )
        {
            playfxontag( level._id_348B, self, "J_Shoulder_LE" );
            playfxontag( level._id_348E, self, "J_Shoulder_RI" );
        }
        else
        {
            playfxontag( level._id_348C, self, "J_Shoulder_LE" );
            playfxontag( level._id_348F, self, "J_Shoulder_RI" );
        }
    }
}

_id_3D5A()
{
    if ( isdefined( level._id_1FC9 ) )
        return level._id_1FC9;

    level._id_1FC9 = "exocloak_equipment_mp";

    if ( isdefined( level._id_511A ) )
        level._id_1FC9 = "exocloakhorde_equipment_mp";

    return level._id_1FC9;
}
