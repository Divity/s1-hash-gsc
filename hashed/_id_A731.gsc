// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3492()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_hover_taken" );

    if ( !self _meth_8314( level._id_4AA0 ) )
        return;

    _id_3490();

    for (;;)
    {
        if ( self _meth_84A8( level._id_4AA0 ) == 0 )
            self waittillmatch( "battery_discharge_begin", level._id_4AA0 );

        self._id_3491 = 1;
        _id_A789::_id_7F7F( self, 1 );
        self._id_030D["numberOfTimesHoveringUsed"]++;
        _id_A72F::_id_7E17( level._id_4AA0, "ui_exo_battery_toggle", 1 );
        thread _id_A72F::_id_9AB1( level._id_4AA0 );
        thread _id_3493();
        thread _id_692D();

        if ( _id_A75A::_id_05CB( "specialty_exo_blastsuppressor" ) )
            _id_A750::_id_8706( "mp_suppressed_exo_hover" );
        else
            _id_A750::_id_8706( "mp_regular_exo_hover" );

        thread _id_312B();

        if ( self _meth_84A8( level._id_4AA0 ) == 1 )
            self waittillmatch( "battery_discharge_end", level._id_4AA0 );

        _id_A72F::_id_7E17( level._id_4AA0, "ui_exo_battery_toggle", 0 );
        self._id_3491 = 0;
        self notify( "stop_exo_hover_effects" );
    }
}

_id_3490()
{
    self _meth_84A6( level._id_4AA0, 1.0 );
    var_0 = self _meth_84A5( level._id_4AA0 );

    if ( self _meth_831A() == level._id_4AA0 )
    {
        self _meth_82FB( "exo_ability_nrg_req0", 0 );
        self _meth_82FB( "exo_ability_nrg_total0", var_0 );
        self _meth_82FB( "ui_exo_battery_level0", var_0 );
    }
    else if ( self _meth_8345() == level._id_4AA0 )
    {
        self _meth_82FB( "exo_ability_nrg_req1", 0 );
        self _meth_82FB( "exo_ability_nrg_total1", var_0 );
        self _meth_82FB( "ui_exo_battery_level1", var_0 );
    }

    if ( !isdefined( level._id_72FD ) )
        level._id_72FD = loadfx( "vfx/smoke/exohover_exhaust_continuous" );

    if ( !isdefined( level._id_8FDF ) )
        level._id_8FDF = loadfx( "vfx/smoke/exohover_exhaust_continuous_suppressed" );

    if ( level._id_01B5 == "horde" )
        setdynamicdvar( "hover_max_travel_distance", 1000 );
    else
        setdynamicdvar( "hover_max_travel_distance", 350 );
}

_id_312B()
{
    self endon( "stop_exo_hover_effects" );
    _id_A4F0::_id_A060( "death", "disconnect", "joined_team", "faux_spawn", "exo_hover_taken" );
    _id_A72F::_id_7E17( level._id_4AA0, "ui_exo_battery_toggle", 0 );
    self._id_3491 = 0;
    self notify( "stop_exo_hover_effects" );
}

_id_910D()
{
    level._id_4AA0 = "exohover_equipment_mp";

    if ( isdefined( level._id_511A ) )
        level._id_4AA0 = "exohoverhorde_equipment_mp";

    self notify( "kill_battery" );
    self notify( "exo_hover_taken" );
    self _meth_830F( level._id_4AA0 );
}

_id_41BC()
{
    level._id_4AA0 = "exohover_equipment_mp";

    if ( isdefined( level._id_511A ) )
        level._id_4AA0 = "exohoverhorde_equipment_mp";

    self _meth_830E( level._id_4AA0 );
    thread _id_3492();
}

_id_3493()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_hover_taken" );
    self endon( "stop_exo_hover_effects" );
    var_0 = self _meth_84A7( level._id_4AA0 );
    var_1 = self _meth_84A5( level._id_4AA0 );

    for (;;)
    {
        self _meth_80AD( "damage_heavy" );
        var_2 = self _meth_8339();
        var_3 = length2d( var_2 );
        var_4 = 1.0;

        if ( level._id_01B5 == "horde" )
        {
            if ( isdefined( self._id_498C ) )
                var_4 = 1.0 + self._id_498C * -0.1;
        }

        self _meth_84A6( level._id_4AA0, max( var_4, var_1 * var_3 / getdvarint( "hover_max_travel_distance", 350 ) * var_0 ) );
        wait 0.1;
    }
}

_id_692D()
{
    level endon( "game_ended" );
    var_0 = 0;

    if ( _id_A75A::_id_05CB( "specialty_exo_blastsuppressor" ) )
    {
        var_0 = 1;
        var_1 = _func_2C1( level._id_8FDF, self, "tag_jetpack" );
    }
    else
        var_1 = _func_2C1( level._id_72FD, self, "tag_jetpack" );

    triggerfx( var_1 );
    _id_A4F0::_id_A060( "disconnect", "death", "joined_team", "faux_spawn", "exo_hover_taken", "stop_exo_hover_effects" );

    if ( isdefined( var_1 ) )
        var_1 delete();
}
