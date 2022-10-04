// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_34E3()
{
    self notify( "exo_repulsor_taken" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_repulsor_taken" );

    if ( !self _meth_8314( "exorepulsor_equipment_mp" ) )
        return;

    _id_350D();
    thread _id_5E99();
    thread _id_9F9B();

    for (;;)
    {
        self waittill( "exo_ability_activate", var_0 );

        if ( var_0 == "exorepulsor_equipment_mp" )
            thread _id_98C2();
    }
}

_id_350D()
{
    self._id_7404 = 0;
    self _meth_84A6( "exorepulsor_equipment_mp", 1.0 );
    var_0 = self _meth_84A5( "exorepulsor_equipment_mp" );
    self._id_7011 = 0;

    if ( self _meth_831A() == "exorepulsor_equipment_mp" )
    {
        self _meth_82FB( "exo_ability_nrg_req0", 0 );
        self _meth_82FB( "exo_ability_nrg_total0", var_0 );
        self _meth_82FB( "ui_exo_battery_level0", var_0 );
    }
    else if ( self _meth_8345() == "exorepulsor_equipment_mp" )
    {
        self _meth_82FB( "exo_ability_nrg_req1", 0 );
        self _meth_82FB( "exo_ability_nrg_total1", var_0 );
        self _meth_82FB( "ui_exo_battery_level1", var_0 );
    }

    if ( !isdefined( level._id_34E0 ) )
        level._id_34E0 = loadfx( "vfx/explosion/exo_repulsor_impact" );

    if ( !isdefined( level._id_34DE ) )
        level._id_34DE = loadfx( "vfx/unique/repulsor_bubble" );

    if ( !isdefined( level._id_34DF ) )
        level._id_34DF = loadfx( "vfx/unique/repulsor_bubble_deactivate" );

    if ( !isdefined( level._id_34E1 ) )
        level._id_34E1 = loadfx( "vfx/unique/exo_repulsor_emitter" );

    if ( !isdefined( level._id_34E2 ) )
        level._id_34E2 = loadfx( "vfx/unique/exo_repulsor_inactive" );

    wait 0.05;

    if ( !_id_A75A::_id_4FA3() )
        playfxontag( level._id_34E2, self, getrepulsortag() );
}

getrepulsortag()
{
    if ( isdefined( level.getrepulsortagfunc ) )
        return self [[ level.getrepulsortagfunc ]]();
    else
        return "TAG_JETPACK";
}

_id_98C2( var_0 )
{
    self endon( "exo_repulsor_taken" );

    if ( self._id_7404 == 1 )
        thread _id_8EB4( 1 );
    else
        thread _id_8C4E();
}

_id_5374()
{
    if ( isdefined( self._id_7403 ) )
    {
        self._id_7403 delete();
        self._id_7403 = undefined;
    }
}

_id_8C4E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "stop_exo_repulsor" );
    self endon( "exo_repulsor_taken" );
    self._id_7404 = 1;
    thread _id_2BBE();
    self _meth_849F( "exorepulsor_equipment_mp" );
    _id_A72F::_id_7E17( "exorepulsor_equipment_mp", "ui_exo_battery_toggle", 1 );
    thread _id_A72F::_id_9AB1( "exorepulsor_equipment_mp" );
    _id_A750::_id_8706( "mp_exo_repulsor_activate" );
    _id_5374();

    if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
    {
        self._id_7403 = _func_2C1( level._id_34E1, self, getrepulsortag() );
        triggerfx( self._id_7403 );
    }

    wait 0.05;

    if ( !self._id_7404 )
        return;

    if ( isdefined( level._id_34DE ) )
        playfxontagforclients( level._id_34DE, self, "j_head", self );
}

_id_8EB4( var_0 )
{
    if ( !isdefined( self._id_7404 ) || !self._id_7404 )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    self notify( "stop_exo_repulsor" );
    self._id_7404 = 0;
    self _meth_84A0( "exorepulsor_equipment_mp" );
    _id_A72F::_id_7E17( "exorepulsor_equipment_mp", "ui_exo_battery_toggle", 0 );
    _id_5374();

    if ( var_0 == 1 )
    {
        _id_A750::_id_8706( "mp_exo_repulsor_deactivate" );

        if ( !isdefined( self._id_3474 ) || self._id_3474 == 0 )
        {
            self._id_7403 = _func_2C1( level._id_34E2, self, getrepulsortag() );
            triggerfx( self._id_7403 );
        }

        wait 0.05;

        if ( isdefined( level._id_34DF ) )
            playfxontagforclients( level._id_34DF, self, "j_head", self );
    }
}

_id_5E99()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "death", "joined_team", "faux_spawn", "exo_repulsor_taken" );
    self._id_7011 = 0;
    thread _id_8EB4( 0 );
}

_id_9AB1()
{
    var_0 = self _meth_84A2( "exorepulsor_equipment_mp" );
    _id_A72F::_id_7E17( "exorepulsor_equipment_mp", "ui_exo_battery_level", var_0 );
}

_id_2BBE()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "stop_exo_repulsor" );
    self endon( "exo_repulsor_taken" );

    while ( self _meth_84A2( "exorepulsor_equipment_mp" ) > 0 )
    {
        for ( var_0 = 0; var_0 < level._id_4404.size; var_0++ )
        {
            var_1 = level._id_4404[var_0];

            if ( !isdefined( var_1._id_A2D6 ) )
                continue;

            if ( isdefined( var_1._id_A2D6 ) && _id_A75A::_id_501E( var_1._id_A2D6 ) )
                continue;

            if ( !isdefined( var_1._id_02E9 ) )
                continue;

            if ( isdefined( var_1._id_02E9 ) && var_1._id_02E9 == self )
                continue;

            if ( level._id_91E4 && isdefined( var_1._id_02E9._id_04A8 ) && var_1._id_02E9._id_04A8 == self._id_04A8 )
                continue;

            var_2 = distance( var_1._id_02E6, self._id_02E6 );

            if ( var_2 < 385 )
            {
                if ( sighttracepassed( self _meth_80A8(), var_1._id_02E6, 0, self ) )
                {
                    var_3 = var_1._id_02E6 - self._id_02E6;
                    var_4 = vectortoangles( var_3 );
                    var_5 = anglestoup( var_4 );
                    var_6 = anglestoforward( var_4 );
                    var_7 = vectornormalize( var_6 );
                    var_8 = var_1._id_02E6 - 0.2 * var_2 * var_7;
                    playfx( level._id_34E0, var_8, var_7, var_5 );
                    var_1 _id_A750::_id_8706( "mp_exo_repulsor_repel" );

                    if ( var_1._id_A2D6 == "explosive_drone_mp" )
                    {
                        var_1 notify( "mp_exo_repulsor_repel" );
                        var_1 thread _id_A739::_id_3579();
                    }
                    else
                    {
                        if ( isdefined( level.iszombiegame ) && level.iszombiegame )
                            var_1 notify( "repulsor_repel" );

                        var_1 delete();
                    }

                    self._id_7011++;
                    _id_A7A0::_id_6FF3( "ch_exoability_repulser" );
                    self _meth_84A1( "exorepulsor_equipment_mp", int( self _meth_84A5( "exorepulsor_equipment_mp" ) / 2 ) );
                    _id_9AB1();
                }
            }
        }

        for ( var_0 = 0; var_0 < level._id_5CBF.size; var_0++ )
        {
            var_9 = level._id_5CBF[var_0];

            if ( !isdefined( var_9._id_02E9 ) )
                continue;

            if ( isdefined( var_9._id_02E9 ) && var_9._id_02E9 == self )
                continue;

            if ( level._id_91E4 && isdefined( var_9._id_02E9._id_04A8 ) && var_9._id_02E9._id_04A8 == self._id_04A8 )
                continue;

            var_10 = distance( var_9._id_02E6, self._id_02E6 );

            if ( var_10 < 385 )
            {
                if ( sighttracepassed( self _meth_80A8(), var_9._id_02E6, 0, self ) )
                {
                    var_11 = var_9._id_02E6 - self._id_02E6;
                    var_12 = vectortoangles( var_11 );
                    var_13 = anglestoup( var_12 );
                    var_14 = anglestoforward( var_12 );
                    var_15 = vectornormalize( var_14 );
                    var_8 = var_9._id_02E6 - 0.2 * var_10 * var_15;
                    playfx( level._id_34E0, var_8, var_15, var_13 );
                    var_9 _id_A750::_id_8706( "mp_exo_repulsor_repel" );

                    if ( isdefined( var_9._id_A2D6 ) && var_9._id_A2D6 == "iw5_exocrossbow_mp" )
                        stopfxontag( _id_A4F0::_id_3FA6( "exocrossbow_sticky_blinking" ), var_9._id_3B75, "tag_origin" );

                    var_9 delete();
                    self._id_7011++;
                    _id_A7A0::_id_6FF3( "ch_exoability_repulser" );
                    self _meth_84A1( "exorepulsor_equipment_mp", int( self _meth_84A5( "exorepulsor_equipment_mp" ) / 2 ) );
                    _id_9AB1();
                }
            }
        }

        for ( var_0 = 0; var_0 < level._id_3574.size; var_0++ )
        {
            var_16 = level._id_3574[var_0];

            if ( isdefined( var_16 ) )
            {
                if ( !isdefined( var_16._id_02E9 ) )
                    continue;

                if ( isdefined( var_16._id_02E9 ) && var_16._id_02E9 == self )
                    continue;

                if ( level._id_91E4 && isdefined( var_16._id_02E9._id_04A8 ) && var_16._id_02E9._id_04A8 == self._id_04A8 )
                    continue;

                var_17 = distance( var_16._id_02E6, self._id_02E6 );

                if ( var_17 < 385 )
                {
                    if ( sighttracepassed( self _meth_80A8(), var_16._id_02E6, 0, self ) )
                    {
                        var_18 = var_16._id_02E6 - self._id_02E6;
                        var_19 = vectortoangles( var_18 );
                        var_20 = anglestoup( var_19 );
                        var_21 = anglestoforward( var_19 );
                        var_22 = vectornormalize( var_21 );
                        var_8 = var_16._id_02E6 - 0.2 * var_17 * var_22;
                        playfx( level._id_34E0, var_8, var_22, var_20 );
                        var_16 _id_A750::_id_8706( "mp_exo_repulsor_repel" );

                        if ( isdefined( var_16._id_3550 ) )
                            var_16._id_3550 delete();

                        var_16 delete();
                        self._id_7011++;
                        _id_A7A0::_id_6FF3( "ch_exoability_repulser" );
                        self _meth_84A1( "exorepulsor_equipment_mp", int( self _meth_84A5( "exorepulsor_equipment_mp" ) / 2 ) );
                        _id_9AB1();
                    }
                }
            }
        }

        foreach ( var_24 in level._id_94EA )
        {
            if ( !isdefined( var_24._id_02E9 ) )
                continue;

            if ( isdefined( var_24._id_02E9 ) && var_24._id_02E9 == self )
                continue;

            if ( level._id_91E4 && isdefined( var_24._id_02E9._id_04A8 ) && var_24._id_02E9._id_04A8 == self._id_04A8 )
                continue;

            var_25 = distance( var_24._id_02E6, self._id_02E6 );

            if ( var_25 < 385 )
            {
                if ( sighttracepassed( self _meth_80A8(), var_24._id_02E6, 0, self ) )
                {
                    var_26 = var_24._id_02E6 - self._id_02E6;
                    var_27 = vectortoangles( var_26 );
                    var_28 = anglestoup( var_27 );
                    var_29 = anglestoforward( var_27 );
                    var_30 = vectornormalize( var_29 );
                    var_8 = var_24._id_02E6 - 0.2 * var_25 * var_30;
                    playfx( level._id_34E0, var_8, var_30, var_28 );
                    var_24 _id_A750::_id_8706( "mp_exo_repulsor_repel" );

                    if ( !_func_294( var_24 ) && isdefined( var_24 ) )
                    {
                        var_24 notify( "death" );
                        _id_A75A::_id_2760();
                    }

                    self._id_7011++;
                    _id_A7A0::_id_6FF3( "ch_exoability_repulser" );
                    self _meth_84A1( "exorepulsor_equipment_mp", int( self _meth_84A5( "exorepulsor_equipment_mp" ) / 2 ) );
                    _id_9AB1();
                }
            }
        }

        if ( self._id_7011 >= 2 )
        {
            if ( !isdefined( level._id_511A ) )
                thread _id_A72E::_id_39F5();

            self._id_7011 -= 2;
        }

        wait 0.05;
    }

    thread _id_8EB4( 1 );
}

_id_9111()
{
    self notify( "kill_battery" );
    self notify( "exo_repulsor_taken" );
    self _meth_830F( "exorepulsor_equipment_mp" );
}

_id_41C0()
{
    self _meth_830E( "exorepulsor_equipment_mp" );
    thread _id_34E3();
}

_id_9F9B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "exo_repulsor_taken" );
    level waittill( "game_ended" );
    thread _id_8EB4( 0 );
}
