// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A257()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );

    if ( !isdefined( level._id_94EB ) )
        _id_94E8();

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = _id_A75A::_id_8F56( var_1, "_lefthand" );

        if ( var_2 == "tracking_drone_mp" )
        {
            var_0 thread _id_28CD();
            wait 0.5;

            if ( !_func_294( var_0 ) && isdefined( var_0 ) )
            {
                self._id_94ED = var_0._id_02E6;
                self._id_94EC = var_0._id_0041;
                var_0 _id_2870();

                if ( !_id_6F4E( self._id_94ED ) )
                    _id_98CA( var_1 );
            }
        }
    }
}

_id_94E8()
{
    level._id_94E9 = 1;
    level._id_94EB = spawnstruct();
    level._id_94EB._id_9364 = 20.0;
    level._id_94EB._id_3580 = 30.0;
    level._id_94EB._id_01E7 = 999999;
    level._id_94EB._id_0275 = 60;
    level._id_94EB._id_9D6D = "vehicle_tracking_drone_mp";
    level._id_94EB._id_5D3A = "npc_drone_tracking";
    level._id_94EB._id_3BAF = loadfx( "vfx/sparks/direct_hack_stun" );
    level._id_94EB._id_3BAB = loadfx( "vfx/lights/tracking_drone_laser_blue" );
    level._id_94EB._id_3BA9 = loadfx( "vfx/explosion/tracking_drone_explosion" );
    level._id_94EB._id_3BAD = loadfx( "vfx/explosion/frag_grenade_default" );
    level._id_94EB._id_3BB2 = loadfx( "vfx/lights/light_tracking_drone_blink_warning" );
    level._id_94EB._id_3BA7 = loadfx( "vfx/lights/light_tracking_drone_blink_enemy" );
    level._id_94EB._id_3BAA = loadfx( "vfx/lights/light_tracking_drone_blink_friendly" );
    level._id_94EB._id_3BB0 = loadfx( "vfx/distortion/tracking_drone_distortion_down" );
    level._id_94EB._id_3BB1 = loadfx( "vfx/distortion/tracking_drone_distortion_up" );
    level._id_94EB._id_3BA8 = loadfx( "vfx/distortion/tracking_drone_distortion_hemi" );
    level._id_94EB._id_8898 = "veh_tracking_drone_explode";
    level._id_94EB._id_889A = "veh_tracking_drone_lock_lp";
    level._id_94EA = [];

    foreach ( var_1 in level._id_0328 )
        var_1._id_4FFF = 0;

    level thread _id_64EF();
    level._id_94EE = level._id_94EB._id_9364;
    level._id_3576 = level._id_94EB._id_3580;
    level._id_94E3 = 0;
    level._id_94E4 = 65;
    level._id_94E5 = 0;
}

_id_98CA( var_0 )
{
    var_1 = 1;

    if ( _id_A75A::_id_51E0() )
        return 0;
    else if ( _id_33E2() )
    {
        self _meth_826E( &"MP_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( _id_A75A::_id_2508() >= _id_A75A::_id_5A56() || level._id_3692 + var_1 >= _id_A75A::_id_5A56() )
    {
        self _meth_826E( &"MP_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    if ( !isdefined( self._id_94E2 ) )
        self._id_94E2 = [];

    if ( self._id_94E2.size )
    {
        self._id_94E2 = _id_A4F0::_id_0D01( self._id_94E2 );

        if ( self._id_94E2.size >= level._id_94E9 )
        {
            if ( isdefined( self._id_94E2[0] ) )
                self._id_94E2[0] thread _id_94D2();
        }
    }

    _id_A75A::_id_4C3C();
    var_2 = _id_2448( var_0 );

    if ( !isdefined( var_2 ) )
    {
        _id_A75A::_id_2760();
        return 0;
    }

    var_2._id_A2D6 = var_0;
    self._id_94E2[self._id_94E2.size] = var_2;
    level._id_94EA = _id_A4F0::_id_0D01( level._id_94EA );
    level._id_94EA[level._id_94EA.size] = var_2;
    thread _id_8D3E( var_2 );
    return 1;
}

_id_2448( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !var_1 )
    {
        var_5 = self _meth_80A8();
        var_6 = anglestoforward( self _meth_833B() );
        var_7 = self _meth_833B();
        var_6 = anglestoforward( var_7 );
        var_8 = anglestoright( var_7 );
        var_9 = var_6 * 50;
        var_10 = var_8 * 0;
        var_11 = 80;

        switch ( self _meth_817C() )
        {
            case "stand":
                var_11 = 80;
                break;
            case "crouch":
                var_11 = 65;
                break;
            case "prone":
                var_11 = 37;
                break;
        }

        var_12 = ( 0, 0, var_11 );
        var_12 += var_10;
        var_12 += var_9;

        if ( isdefined( self._id_94ED ) && isdefined( self._id_94EC ) )
        {
            var_13 = self._id_94ED;
            var_7 = self._id_94EC;
        }
        else
            var_13 = self._id_02E6 + var_12;
    }
    else
    {
        var_13 = var_2;
        var_14 = var_2;
        var_7 = var_3;
    }

    var_15 = self;

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_15 = level._id_031D;

    var_16 = spawnhelicopter( var_15, var_13, var_7, level._id_94EB._id_9D6D, level._id_94EB._id_5D3A );

    if ( !isdefined( var_16 ) )
        return;

    if ( isdefined( var_4 ) )
    {
        var_16._id_04D8 = "explosive_drone";
        var_16 _meth_80B1( "vehicle_pdrone" );
    }
    else
        var_16._id_04D8 = "tracking_drone";

    var_16 _id_A4F0::_id_5920( self._id_04A8 );
    var_16 _meth_83F3( 1 );
    var_16 _id_0854();
    var_16 thread _id_73AE();
    var_16._id_01E7 = level._id_94EB._id_01E7;
    var_16._id_0275 = level._id_94EB._id_0275;
    var_16._id_0102 = 0;
    var_16._id_03E3 = 20;
    var_16._id_3978 = 20;
    var_16._id_02E9 = self;
    var_16._id_04A8 = self._id_04A8;
    var_16 _meth_8283( var_16._id_03E3, 10, 10 );
    var_16 _meth_8292( 120, 90 );
    var_16 _meth_825A( 64 );
    var_16 _meth_8253( 4, 5, 5 );
    var_16._id_3B88 = undefined;

    if ( isdefined( var_16._id_04D8 ) )
    {
        if ( var_16._id_04D8 == "tracking_drone" )
            var_16._id_3B88 = "fx_joint_0";
        else if ( var_16._id_04D8 == "explosive_drone" )
            var_16._id_3B88 = "TAG_EYE";
    }

    if ( level._id_91E4 )
        var_16 _id_A72D::_id_8022( self._id_04A8, ( 0, 0, 25 ), var_16._id_3B88 );
    else
        var_16 _id_A72D::_id_7FDF( self._id_02E9, ( 0, 0, 25 ), var_16._id_3B88 );

    var_16._id_5A54 = 2000;
    var_16._id_5A3A = 300;
    var_16._id_94B6 = undefined;
    var_17 = 45;
    var_18 = 45;
    var_16 _meth_8294( var_17, var_18 );
    var_16._id_91D1 = var_13;
    var_16._id_0E53 = 10000;
    var_16._id_0E52 = 150;
    var_16._id_0E54 = missile_createattractorent( var_16, var_16._id_0E53, var_16._id_0E52 );
    var_16._id_4724 = 0;
    var_16._id_8F6E = 0;
    var_16._id_4C0E = 0;
    var_16 thread _id_A783::_id_7F5F( var_16._id_0275, undefined, ::_id_64EE, undefined, 0 );
    var_16 thread _id_94DA();
    var_16 thread _id_94D9();
    var_16 thread _id_94DE();
    var_16 thread _id_94DD();
    var_16 thread _id_94DF();
    var_16 thread _id_94DC();

    if ( !isdefined( level._id_511A ) )
        var_16 thread _id_94E1();

    if ( var_16._id_04D8 == "tracking_drone" )
    {
        var_16 thread _id_94CE();
        var_16 thread _id_94D0();
        var_16 thread _id_2EDE();
    }

    return var_16;
}

_id_4B82( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_1 = anglestoforward( self._id_0041 );

    for (;;)
    {
        if ( _id_A75A::_id_5186( self ) && !_id_A75A::_id_51E0() && anglestoforward( self._id_0041 ) != var_1 )
        {
            var_1 = anglestoforward( self._id_0041 );
            var_2 = self._id_02E6 + var_1 * -100 + ( 0, 0, 40 );
            var_0 _meth_82AE( var_2, 0.5 );
        }

        wait 0.5;
    }
}

_id_94D3( var_0, var_1 )
{
    var_1 endon( "disconnect" );
    playfxontagforclients( var_0, self, "fx_light_1", var_1 );
    wait 0.05;
    playfxontagforclients( var_0, self, "fx_light_2", var_1 );
    wait 0.05;
    playfxontagforclients( var_0, self, "fx_light_3", var_1 );
    wait 0.05;
    playfxontagforclients( var_0, self, "fx_light_4", var_1 );
}

_id_94CE()
{
    self endon( "death" );

    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1 ) && issentient( var_1 ) && issentient( self ) && var_1._id_04A8 != self._id_04A8 )
        {
            childthread _id_94D3( level._id_94EB._id_3BA7, var_1 );
            wait 0.2;
        }
    }
}

_id_94D0()
{
    self endon( "death" );

    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1 ) && issentient( var_1 ) && issentient( self ) && var_1._id_04A8 == self._id_04A8 )
        {
            childthread _id_94D3( level._id_94EB._id_3BAA, var_1 );
            wait 0.2;
        }
    }

    thread _id_A202();
    thread _id_A22D();
}

_id_2EDE()
{
    self endon( "death" );

    foreach ( var_1 in level._id_0328 )
    {
        wait 0.1;

        if ( isdefined( var_1 ) && isdefined( self ) && isdefined( level._id_94EB._id_3BB0 ) )
            playfxontagforclients( level._id_94EB._id_3BB0, self, "fx_thruster_down_F", var_1 );

        wait 0.1;

        if ( isdefined( var_1 ) && isdefined( self ) && isdefined( level._id_94EB._id_3BB0 ) )
            playfxontagforclients( level._id_94EB._id_3BB0, self, "fx_thruster_down_K", var_1 );

        wait 0.1;

        if ( isdefined( var_1 ) && isdefined( self ) && isdefined( level._id_94EB._id_3BB0 ) )
            playfxontagforclients( level._id_94EB._id_3BB0, self, "fx_thruster_down_L", var_1 );

        wait 0.1;

        if ( isdefined( var_1 ) && isdefined( self ) && isdefined( level._id_94EB._id_3BB0 ) )
            playfxontagforclients( level._id_94EB._id_3BB0, self, "fx_thruster_down_R", var_1 );

        wait 0.1;

        if ( isdefined( var_1 ) && isdefined( self ) && isdefined( level._id_94EB._id_3BA8 ) )
            playfxontagforclients( level._id_94EB._id_3BA8, self, "TAG_WEAPON", var_1 );

        wait 0.25;
    }

    for (;;)
    {
        level waittill( "connected", var_1 );
        var_1 waittill( "spawned_player" );
        wait 0.1;

        if ( isdefined( var_1 ) && isdefined( self ) && isdefined( level._id_94EB._id_3BB0 ) )
            playfxontagforclients( level._id_94EB._id_3BB0, self, "fx_thruster_down_F", var_1 );

        wait 0.1;

        if ( isdefined( var_1 ) && isdefined( self ) && isdefined( level._id_94EB._id_3BB0 ) )
            playfxontagforclients( level._id_94EB._id_3BB0, self, "fx_thruster_down_K", var_1 );

        wait 0.1;

        if ( isdefined( var_1 ) && isdefined( self ) && isdefined( level._id_94EB._id_3BB0 ) )
            playfxontagforclients( level._id_94EB._id_3BB0, self, "fx_thruster_down_L", var_1 );

        wait 0.1;

        if ( isdefined( var_1 ) && isdefined( self ) && isdefined( level._id_94EB._id_3BB0 ) )
            playfxontagforclients( level._id_94EB._id_3BB0, self, "fx_thruster_down_R", var_1 );

        wait 0.1;
        playfxontagforclients( level._id_94EB._id_3BA8, self, "TAG_WEAPON", var_1 );
        wait 0.25;
    }
}

_id_A202()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 waittill( "spawned_player" );

        if ( isdefined( var_0 ) && var_0._id_04A8 == self._id_04A8 )
        {
            childthread _id_94D3( level._id_94EB._id_3BAA, var_0 );
            wait 0.2;
        }
    }
}

_id_A22D()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "joined_team", var_0 );
        var_0 waittill( "spawned_player" );

        if ( isdefined( var_0 ) && var_0._id_04A8 == self._id_04A8 )
        {
            childthread _id_94D3( level._id_94EB._id_3BAA, var_0 );
            wait 0.2;
        }
    }
}

_id_8D3E( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 thread _id_94CF();
    var_0 thread _id_0EE6();

    if ( isdefined( var_0._id_04D8 ) )
    {
        if ( var_0._id_04D8 == "explosive_drone" )
            var_0 thread _id_1D02();
        else if ( var_0._id_04D8 == "tracking_drone" && !isdefined( level._id_511A ) )
            var_0 thread _id_94D1();
    }
}

_id_1D02()
{
    level endon( "game_ended" );
    level endon( "host_migration_begin" );
    self endon( "death" );
    self endon( "leaving" );

    for (;;)
    {
        _id_A4F0::_id_A060( "goal", "near_goal", "hit_goal" );

        if ( self._id_94B6 != self._id_02E9 && _id_A75A::_id_5186( self._id_94B6 ) )
        {
            var_0 = distancesquared( self._id_94B6._id_02E6, self._id_02E6 );

            if ( var_0 <= 16384 )
            {
                self notify( "exploding" );
                thread _id_14C3();
                break;
            }
        }
    }
}

_id_14C3()
{
    var_0 = 2;
    var_1 = undefined;

    if ( isdefined( self._id_02E9 ) )
        var_1 = self._id_02E9;

    if ( isdefined( self ) )
    {
        thread _id_992D();
        self _meth_809A( "drone_warning_beap" );
    }

    wait(var_0);

    if ( isdefined( self ) )
    {
        self _meth_809A( "drone_bomb_explosion" );
        var_2 = anglestoup( self._id_0041 );
        var_3 = anglestoforward( self._id_0041 );
        playfx( level._id_94EB._id_3BAD, self._id_02E6, var_3, var_2 );

        if ( isdefined( var_1 ) )
            self _meth_81D5( self._id_02E6, 256, 1000, 25, var_1, "MOD_EXPLOSIVE", "killstreak_missile_strike_mp" );
        else
            self _meth_81D5( self._id_02E6, 256, 1000, 25, undefined, "MOD_EXPLOSIVE", "killstreak_missile_strike_mp" );

        self notify( "death" );
    }
}

_id_992D()
{
    if ( isdefined( self ) )
    {
        stopfxontag( level._id_94EB._id_3BA7, self, "tag_fx_beacon_0" );
        stopfxontag( level._id_94EB._id_3BA7, self, "tag_fx_beacon_1" );
        stopfxontag( level._id_94EB._id_3BA7, self, "tag_fx_beacon_2" );
        stopfxontag( level._id_94EB._id_3BAA, self, "tag_fx_beacon_0" );
        stopfxontag( level._id_94EB._id_3BAA, self, "tag_fx_beacon_1" );
        stopfxontag( level._id_94EB._id_3BAA, self, "tag_fx_beacon_2" );
    }

    wait 0.05;

    if ( isdefined( self ) )
    {
        playfxontag( level._id_94EB._id_3BB2, self, "tag_fx_beacon_0" );
        playfxontag( level._id_94EB._id_3BB2, self, "tag_fx_beacon_1" );
    }

    wait 0.15;

    if ( isdefined( self ) )
        playfxontag( level._id_94EB._id_3BB2, self, "tag_fx_beacon_2" );
}

_id_94CF()
{
    level endon( "game_ended" );
    level endon( "host_migration_begin" );
    self endon( "death" );
    self endon( "leaving" );
    self endon( "exploding" );

    if ( !isdefined( self._id_02E9 ) )
    {
        thread _id_94D2();
        return;
    }

    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    self _meth_8283( self._id_3978, 10, 10 );
    self._id_6F66 = self._id_02E9;
    self._id_94B6 = undefined;

    if ( isdefined( level._id_511A ) && level._id_511A )
        self._id_94B6 = self._id_02E9;

    for (;;)
    {
        if ( isdefined( self._id_8F6E ) && self._id_8F6E )
        {
            wait 0.5;
            continue;
        }

        if ( isdefined( self._id_02E9 ) && isalive( self._id_02E9 ) )
        {
            var_0 = self._id_5A54 * self._id_5A54;
            var_1 = var_0;

            if ( !isdefined( level._id_511A ) )
            {
                if ( !isdefined( self._id_94B6 ) || self._id_94B6 == self._id_02E9 )
                {
                    foreach ( var_3 in level._id_0328 )
                    {
                        if ( isdefined( var_3 ) && isalive( var_3 ) && var_3._id_04A8 != self._id_04A8 && !var_3 _id_A75A::_id_05CB( "specialty_blindeye" ) )
                        {
                            var_4 = distancesquared( self._id_02E6, var_3._id_02E6 );

                            if ( var_4 < var_1 )
                            {
                                var_1 = var_4;
                                self._id_94B6 = var_3;
                                thread _id_A242( var_3 );
                            }
                        }
                    }
                }
            }

            if ( !isdefined( self._id_94B6 ) )
                self._id_94B6 = self._id_02E9;

            if ( isdefined( self._id_94B6 ) )
                _id_94D4( self._id_94B6 );

            if ( self._id_94B6 != self._id_6F66 )
            {
                _id_8EE8( self._id_6F66 );
                self._id_6F66 = self._id_94B6;
            }
        }

        wait 1;
    }
}

_id_A242( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "exploding" );
    var_0 _id_A4F0::_id_A060( "death", "disconnect", "faux_spawn", "joined_team" );

    if ( isdefined( var_0 ) )
    {
        if ( var_0._id_4FFF == 1 )
        {
            if ( !isalive( var_0 ) )
                var_0._id_2A52 = 1;

            thread _id_94D2();
        }
        else
            self._id_94B6 = undefined;
    }
}

_id_94D4( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    self notify( "trackingDrone_moveToPlayer" );
    self endon( "trackingDrone_moveToPlayer" );
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        var_1 = 0;
        var_2 = 30;

        switch ( var_0 _meth_817C() )
        {
            case "stand":
                var_3 = 105;
                break;
            case "crouch":
                var_3 = 75;
                break;
            case "prone":
                var_3 = 45;
                break;
        }
    }
    else
    {
        var_1 = -65;
        var_2 = 0;

        switch ( var_0 _meth_817C() )
        {
            case "stand":
                var_3 = 65;
                break;
            case "crouch":
                var_3 = 50;
                break;
            case "prone":
                var_3 = 22;
                break;
        }
    }

    var_4 = ( var_2, var_1, var_3 );
    self _meth_83F9( var_0, var_4 );
    self._id_4EC1 = 1;
    thread _id_94DB();
    thread _id_94E0();
}

_id_94D5()
{
    self _meth_825B( self._id_02E6, 1 );
    self._id_4EC1 = 0;
    self._id_4C0E = 1;
}

_id_94CD( var_0 )
{
    _id_A75A::_id_4C3C();
    var_1 = var_0 _id_2448( self._id_A2D6, 1, self._id_02E6, self._id_0041 );

    if ( !isdefined( var_1 ) )
    {
        _id_A75A::_id_2760();
        return 0;
    }

    if ( !isdefined( var_0._id_94E2 ) )
        var_0._id_94E2 = [];

    var_0._id_94E2[var_0._id_94E2.size] = var_1;
    level._id_94EA = _id_A4F0::_id_0D01( level._id_94EA );
    level._id_94EA[level._id_94EA.size] = var_1;
    var_0 thread _id_8D3E( var_1 );

    if ( isdefined( level._id_94EB._id_3BAF ) )
        stopfxontag( level._id_94EB._id_3BAF, self, self._id_3B88 );

    _id_73E0();
    return 1;
}

_id_94D1()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );

    if ( !isdefined( self._id_02E9 ) )
    {
        thread _id_94D2();
        return;
    }

    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "joined_team" );
    self._id_02E9 endon( "joined_spectators" );
    self._id_54FE = spawn( "script_model", self._id_02E6 );
    self._id_54FE _meth_80B1( "tag_laser" );

    for (;;)
    {
        if ( isdefined( self._id_94B6 ) )
        {
            self._id_54FE._id_02E6 = self _meth_8180( "tag_weapon" );
            var_0 = 20;
            var_1 = ( randomfloat( var_0 ), randomfloat( var_0 ), randomfloat( var_0 ) ) - ( 10, 10, 10 );
            var_2 = 65;

            switch ( self._id_94B6 _meth_817C() )
            {
                case "stand":
                    var_2 = 65;
                    break;
                case "crouch":
                    var_2 = 50;
                    break;
                case "prone":
                    var_2 = 22;
                    break;
            }

            self._id_54FE._id_0041 = vectortoangles( self._id_94B6._id_02E6 + ( 0, 0, var_2 - 20 ) + var_1 - self._id_02E6 );
        }

        if ( isdefined( self._id_8F6E ) && self._id_8F6E )
        {
            wait 0.5;
            continue;
        }

        var_3 = undefined;

        if ( isdefined( self._id_94B6 ) )
        {
            var_4 = bullettrace( self._id_02E6, self._id_94B6._id_02E6, 1, self );
            var_3 = var_4["entity"];
        }

        if ( isdefined( self._id_94B6 ) && self._id_94B6 != self._id_02E9 && isdefined( var_3 ) && var_3 == self._id_94B6 && distancesquared( self._id_02E6, self._id_94B6._id_02E6 ) < self._id_5A3A * self._id_5A3A )
        {
            if ( self._id_94B6._id_4FFF == 0 )
                _id_8D18( self._id_94B6 );
        }
        else if ( isdefined( self._id_94B6 ) && self._id_94B6._id_4FFF == 1 )
            _id_8EE8( self._id_94B6 );

        wait 0.05;
    }
}

_id_8D18( var_0 )
{
    self._id_54FE _meth_80B2( "tracking_drone_laser" );
    playfxontag( level._id_94EB._id_3BAB, self._id_54FE, "tag_laser" );

    if ( isdefined( level._id_94EB._id_889A ) )
        self _meth_8075( level._id_94EB._id_889A );

    var_0 _meth_82A6( "specialty_radararrow", 1, 0 );

    if ( var_0._id_4FFF == 0 )
    {
        var_0._id_4FFF = 1;
        var_0._id_94B5 = self._id_02E9;
    }
}

_id_8EE8( var_0 )
{
    if ( isdefined( self._id_54FE ) )
    {
        self._id_54FE _meth_80B3();
        stopfxontag( level._id_94EB._id_3BAB, self._id_54FE, "tag_laser" );
    }

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( level._id_94EB._id_889A ) )
            self _meth_80AB();

        if ( var_0 _meth_82A7( "specialty_radararrow", 1 ) )
            var_0 _meth_82A9( "specialty_radararrow", 1 );

        var_0 notify( "player_not_tracked" );
        var_0._id_4FFF = 0;
        var_0._id_94B5 = undefined;
    }
}

_id_64EF()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_4FFF = 0;

        foreach ( var_0 in level._id_0328 )
        {
            if ( !isdefined( var_0._id_4FFF ) )
                var_0._id_4FFF = 0;
        }
    }
}

_id_94DB()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    self notify( "trackingDrone_watchForGoal" );
    self endon( "trackingDrone_watchForGoal" );
    var_0 = _id_A4F0::_id_A067( "goal", "near_goal", "hit_goal" );
    self._id_4EC1 = 0;
    self._id_4C0E = 0;
    self notify( "hit_goal" );
}

_id_94D9()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self waittill( "death" );
    thread _id_94E6();
}

_id_94E1()
{
    level endon( "game_ended" );
    level endon( "host_migration_begin" );
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    var_0 = level._id_94EE;

    if ( self._id_04D8 == "explosive_drone" )
        var_0 = level._id_3576;

    wait(var_0);
    thread _id_94D2();
}

_id_94DE()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 _id_A4F0::_id_A060( "disconnect", "joined_team", "joined_spectators" );
    self notify( "owner_gone" );
    thread _id_94D2();
}

_id_94DD()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );

    for (;;)
    {
        self._id_02E9 waittill( "death" );
        thread _id_94D2();
    }
}

_id_94E0()
{
    level endon( "game_ended" );
    level endon( "host_migration_begin" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    self notify( "trackingDrone_watchTargetDisconnect" );
    self endon( "trackingDrone_watchTargetDisconnect" );
    self._id_94B6 waittill( "disconnect" );
    _id_8EE8( self._id_94B6 );
    _id_94D4( self._id_02E9 );
}

_id_94DF()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    level _id_A4F0::_id_A060( "round_end_finished", "game_ended" );
    thread _id_94D2();
}

_id_94DC()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    level waittill( "host_migration_begin" );
    _id_8EE8( self._id_94B6 );
    _id_94D5();
    _id_A79A::_id_A0D4();
    thread _id_94CD( self._id_02E9 );
}

_id_94D2()
{
    self endon( "death" );
    self notify( "leaving" );
    _id_8EE8( self._id_94B6 );
    _id_94E7();
}

_id_64EE( var_0, var_1, var_2, var_3 )
{
    self notify( "death" );
}

_id_94DA()
{
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        thread _id_94D8();
    }
}

_id_94D8()
{
    self notify( "trackingDrone_stunned" );
    self endon( "trackingDrone_stunned" );
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    level endon( "game_ended" );
    _id_94D6();
    wait 10.0;
    _id_94D7();
}

_id_94D6()
{
    if ( self._id_8F6E )
        return;

    self._id_8F6E = 1;

    if ( isdefined( level._id_94EB._id_3BAF ) )
        playfxontag( level._id_94EB._id_3BAF, self, self._id_3B88 );

    thread _id_8EE8( self._id_94B6 );
    self._id_94B6 = undefined;
    self._id_6F66 = self._id_02E9;
    thread _id_94D5();
}

_id_94D7()
{
    if ( isdefined( level._id_94EB._id_3BAF ) )
        killfxontag( level._id_94EB._id_3BAF, self, self._id_3B88 );

    self._id_8F6E = 0;
    self._id_4C0E = 0;
}

_id_94E6()
{
    if ( !isdefined( self ) )
        return;

    _id_8EE8( self._id_94B6 );
    _id_94D7();
    _id_94E7();
}

_id_94E7()
{
    if ( isdefined( level._id_94EB._id_3BA9 ) )
        playfx( level._id_94EB._id_3BA9, self._id_02E6 );

    if ( isdefined( level._id_94EB._id_8898 ) )
        self _meth_809A( level._id_94EB._id_8898 );

    self notify( "explode" );
    _id_73E0();
}

_id_2870()
{
    if ( !_func_294( self ) && isdefined( self ) )
    {
        if ( isdefined( self._id_0E54 ) )
            missile_deleteattractor( self._id_0E54 );

        self delete();
    }
}

_id_73E0()
{
    _id_A75A::_id_2760();

    if ( isdefined( self._id_02E9 ) && isdefined( self._id_02E9._id_94CC ) )
        self._id_02E9._id_94CC = undefined;

    if ( isdefined( self._id_54FE ) )
        self._id_54FE delete();

    _id_2870();
}

_id_0854()
{
    level._id_94EA[self _meth_81B1()] = self;
}

_id_73AE()
{
    var_0 = self _meth_81B1();
    self waittill( "death" );
    level._id_94EA[var_0] = undefined;
    level._id_94EA = _id_A4F0::_id_0D01( level._id_94EA );
}

_id_33E2()
{
    if ( level._id_94EA.size >= _id_A75A::_id_5A56() )
        return 1;
    else
        return 0;
}

_id_0EE6()
{
    self _meth_8075( "veh_tracking_drone_jets_lp" );
}

_id_28CD()
{
    self endon( "death" );

    if ( !isdefined( level._id_A284 ) )
        return;

    for (;;)
    {
        foreach ( var_1 in level._id_A284 )
        {
            if ( self _meth_80A9( var_1 ) )
            {
                if ( isdefined( level._id_94EB._id_3BA9 ) )
                    playfx( level._id_94EB._id_3BA9, self._id_02E6 );

                if ( isdefined( level._id_94EB._id_8898 ) )
                    self _meth_809A( level._id_94EB._id_8898 );

                _id_2870();
            }
        }

        wait 0.05;
    }
}

_id_6F4E( var_0 )
{
    if ( !isdefined( level._id_A284 ) )
        return 0;

    foreach ( var_2 in level._id_A284 )
    {
        if ( _func_22A( var_0, var_2 ) )
            return 1;
    }

    return 0;
}
