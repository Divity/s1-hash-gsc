// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_34AA()
{
    self notify( "exo_mute_taken" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_mute_taken" );

    if ( !self _meth_8314( "exomute_equipment_mp" ) )
        return;

    _id_34A9();
    thread _id_5DDD();
    thread _id_9F9B();

    for (;;)
    {
        self waittill( "exo_ability_activate", var_0 );

        if ( var_0 == "exomute_equipment_mp" )
            thread _id_988B();
    }
}

_id_34A9()
{
    self._id_601E = 0;
    self _meth_84A6( "exomute_equipment_mp", 1.0 );
    var_0 = self _meth_84A5( "exomute_equipment_mp" );

    if ( self _meth_831A() == "exomute_equipment_mp" )
    {
        self _meth_82FB( "exo_ability_nrg_req0", 0 );
        self _meth_82FB( "exo_ability_nrg_total0", var_0 );
        self _meth_82FB( "ui_exo_battery_level0", var_0 );
    }
    else if ( self _meth_8345() == "exomute_equipment_mp" )
    {
        self _meth_82FB( "exo_ability_nrg_req1", 0 );
        self _meth_82FB( "exo_ability_nrg_total1", var_0 );
        self _meth_82FB( "ui_exo_battery_level1", var_0 );
    }

    if ( !isdefined( level._id_34A8 ) )
        level._id_34A8 = loadfx( "vfx/unique/exo_mute_3p" );

    wait 0.05;

    if ( !_id_A75A::_id_4FA3() )
        return;
}

_id_988B()
{
    self endon( "exo_mute_taken" );

    if ( self._id_601E == 1 )
        thread _id_8E76( 1 );
    else
        thread _id_8B97();
}

_id_536B()
{
    if ( isdefined( self._id_601B ) )
    {
        self._id_601B delete();
        self._id_601B = undefined;
    }
}

_id_8B97()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_mute_taken" );
    self endon( "end_exo_mute" );
    self._id_601E = 1;
    _id_A75A::_id_41F5( "specialty_quieter", 0 );
    self _meth_849F( "exomute_equipment_mp" );
    _id_A72F::_id_7E17( "exomute_equipment_mp", "ui_exo_battery_toggle", 1 );
    thread _id_A72F::_id_9AB1( "exomute_equipment_mp" );
    thread _id_5DC8();
    _id_A750::_id_8706( "mp_exo_mute_activate" );
    wait 0.05;

    if ( !self._id_601E )
        return;

    if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
    {
        self._id_601B = _func_2C1( level._id_34A8, self, "TAG_ORIGIN" );
        triggerfx( self._id_601B );
    }
}

_id_8E76( var_0 )
{
    if ( !isdefined( self._id_601E ) || !self._id_601E )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    self notify( "end_exo_mute" );
    self._id_601E = 0;
    self _meth_82A9( "specialty_quieter", 1 );
    self _meth_84A0( "exomute_equipment_mp" );
    _id_A72F::_id_7E17( "exomute_equipment_mp", "ui_exo_battery_toggle", 0 );
    _id_536B();

    if ( var_0 == 1 )
    {
        _id_A750::_id_8706( "mp_exo_mute_deactivate" );
        wait 0.05;

        if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
            return;
    }
}

_id_5DDD()
{
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "death", "joined_team", "faux_spawn", "exo_mute_taken" );
    thread _id_8E76( 0 );
}

_id_5DC8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_mute_taken" );
    self endon( "end_exo_mute" );

    while ( self._id_601E == 1 )
    {
        if ( self _meth_84A2( "exomute_equipment_mp" ) <= 0 )
            thread _id_8E76( 1 );

        wait 0.05;
    }
}

_id_910E()
{
    self notify( "kill_battery" );
    self notify( "exo_mute_taken" );
    self _meth_830F( "exomute_equipment_mp" );
}

_id_41BD()
{
    self _meth_830E( "exomute_equipment_mp" );
    thread _id_34AA();
}

_id_9F9B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_mute_taken" );
    level waittill( "game_ended" );
    thread _id_8E76( 0 );
}
