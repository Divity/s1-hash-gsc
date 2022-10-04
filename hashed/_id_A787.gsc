// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A259()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self._id_9831 = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "trophy" || var_1 == "trophy_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            var_0 _meth_8054();
            var_0 waittill( "missile_stuck" );
            var_2 = 40;

            if ( var_2 * var_2 < distancesquared( var_0._id_02E6, self._id_02E6 ) )
            {
                var_3 = bullettrace( self._id_02E6, self._id_02E6 - ( 0, 0, var_2 ), 0, self );

                if ( var_3["fraction"] == 1 )
                {
                    var_0 delete();
                    self _meth_82F7( "trophy_mp", self _meth_82F9( "trophy_mp" ) + 1 );
                    continue;
                }

                var_0._id_02E6 = var_3["position"];
            }

            var_0 _meth_8053();
            self._id_9831 = _id_A4F0::_id_0D01( self._id_9831 );

            if ( self._id_9831.size >= level._id_5A47 )
                self._id_9831[0] thread _id_9832();

            var_4 = spawn( "script_model", var_0._id_02E6 );
            var_4 _meth_80B1( "mp_trophy_system" );
            var_4 thread _id_A7B4::_id_23E6( "mp_trophy_system_bombsquad", "tag_origin", self );
            var_4._id_0041 = var_0._id_0041;
            self._id_9831[self._id_9831.size] = var_4;
            var_4._id_02E9 = self;
            var_4._id_04A8 = self._id_04A8;
            var_4._id_A2D6 = var_1;
            var_4._id_8F6E = 0;
            level._id_9820[level._id_9820.size] = var_4;

            if ( isdefined( self._id_983D ) && self._id_983D > 0 )
                var_4._id_0B6E = self._id_983D;
            else
                var_4._id_0B6E = 2;

            var_4._id_04C6 = spawn( "script_origin", var_4._id_02E6 );
            var_4 thread _id_9834( self );
            var_4 thread _id_982C( self );
            var_4 thread _id_9835( self );
            var_4 thread _id_983C( self );
            var_4 thread _id_9843( self );
            var_4 thread _id_A7B4::_id_1973();

            if ( level._id_91E4 )
                var_4 _id_A72D::_id_8022( var_4._id_04A8, ( 0, 0, 65 ) );
            else
                var_4 _id_A72D::_id_7FDF( var_4._id_02E9, ( 0, 0, 65 ) );

            wait 0.05;

            if ( isdefined( var_0 ) )
                var_0 delete();
        }
    }
}

_id_983F()
{
    if ( self._id_8F6E )
        return;

    self._id_8F6E = 1;
    playfxontag( _id_A4F0::_id_3FA6( "mine_stunned" ), self, "tag_origin" );
}

_id_9840()
{
    self._id_8F6E = 0;
    stopfxontag( _id_A4F0::_id_3FA6( "mine_stunned" ), self, "tag_origin" );
}

_id_9833( var_0 )
{
    if ( isdefined( self._id_3316 ) )
        self._id_3316 _meth_8088();

    self notify( "change_owner" );
    self._id_02E9 = var_0;
    self._id_04A8 = var_0._id_04A8;
    var_0._id_9831[var_0._id_9831.size] = self;

    if ( level._id_91E4 )
        _id_A72D::_id_8022( self._id_04A8, ( 0, 0, 65 ) );
    else
        _id_A72D::_id_7FDF( self._id_02E9, ( 0, 0, 65 ) );

    thread _id_9834( var_0 );
    thread _id_982C( var_0 );
    thread _id_9835( var_0 );
    thread _id_983C( var_0 );
}

_id_9843( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self._id_04C6 _meth_80DA( "HINT_NOICON" );
    self._id_04C6 _meth_80DB( &"MP_PICKUP_TROPHY" );
    self._id_04C6 _id_A75A::_id_7FFF( var_0 );
    self._id_04C6 thread _id_A75A::_id_623D( var_0 );

    for (;;)
    {
        self._id_04C6 waittill( "trigger", var_0 );
        var_0 _meth_82F4( "scavenger_pack_pickup" );
        var_1 = var_0 _meth_82F8( "trophy_mp" );
        var_0 _meth_82F6( "trophy_mp", var_1 + 1 );
        var_0._id_983D = self._id_0B6E;
        self._id_04C6 delete();
        self delete();
        self notify( "death" );
    }
}

_id_983C( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "change_owner" );
    var_0 waittill( "spawned" );
    thread _id_9832();
}

_id_9835( var_0 )
{
    self endon( "death" );
    self endon( "change_owner" );
    var_0 waittill( "disconnect" );
    thread _id_9832();
}

_id_982C( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "disconnect" );
    self endon( "death" );
    self endon( "change_owner" );
    self endon( "trophyDisabled" );

    if ( !isdefined( var_1 ) )
        var_1 = 384;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = "exorepulsor_equipment_mp";

    var_4 = var_1 * var_1;

    for (;;)
    {
        if ( !isdefined( level._id_4404 ) || level._id_4404.size < 1 && level._id_5CBF.size < 1 && level._id_94EA.size < 1 || isdefined( self._id_2AFC ) || self._id_8F6E == 1 )
        {
            wait 0.05;
            continue;
        }

        var_5 = _id_A4F0::_id_0CDD( level._id_4404, level._id_5CBF );
        var_5 = _id_A4F0::_id_0CDD( var_5, level._id_94EA );

        if ( var_5.size < 1 )
        {
            wait 0.05;
            continue;
        }

        foreach ( var_7 in var_5 )
        {
            wait 0.05;

            if ( !isdefined( var_7 ) )
                continue;

            if ( var_7 == self )
                continue;

            if ( isdefined( var_7._id_A2D6 ) )
            {
                switch ( var_7._id_A2D6 )
                {
                    case "claymore_mp":
                    case "orbital_carepackage_pod_mp":
                    case "orbital_carepackage_droppod_mp":
                        continue;
                }
            }

            switch ( var_7._id_02A0 )
            {
                case "weapon_parabolic_knife":
                case "weapon_jammer":
                case "weapon_radar":
                case "mp_trophy_system":
                    continue;
            }

            if ( !isdefined( var_7._id_02E9 ) )
                var_7._id_02E9 = getmissileowner( var_7 );

            if ( isdefined( var_7._id_02E9 ) && level._id_91E4 && var_7._id_02E9._id_04A8 == var_0._id_04A8 )
                continue;

            if ( isdefined( var_7._id_02E9 ) && var_7._id_02E9 == var_0 )
                continue;

            if ( !_id_9844( var_7 ) )
                continue;

            var_8 = distancesquared( var_7._id_02E6, self._id_02E6 );

            if ( var_8 < var_4 )
            {
                if ( bullettracepassed( var_7._id_02E6, self._id_02E6, 0, self ) )
                {
                    var_9 = self._id_02E6 + ( 0, 0, 32 );

                    if ( isdefined( self._id_54F1 ) )
                        var_9 = self._id_54F1._id_02E6;

                    playfx( level._id_7CA7, var_9, var_7._id_02E6 - self._id_02E6, anglestoup( self._id_0041 ) );
                    thread _id_983A( var_0, var_7 );
                    self _meth_809A( "trophy_detect_projectile" );

                    if ( isdefined( var_7._id_00AB ) && var_7._id_00AB == "rocket" && ( isdefined( var_7._id_04D8 ) && var_7._id_04D8 == "remote" ) )
                    {
                        if ( isdefined( var_7._id_04D8 ) && var_7._id_04D8 == "remote" )
                        {
                            level thread _id_A7A0::_id_9D70( var_7._id_02E9, var_0, undefined, var_0, undefined, "MOD_EXPLOSIVE", var_3 );
                            level thread _id_A75A::_id_91F3( "callout_destroyed_predator_missile", var_0 );
                            level thread _id_A7AA::_id_1208( "kill", var_0, var_3, undefined, "MOD_EXPLOSIVE" );
                            var_0 notify( "destroyed_killstreak", var_3 );
                        }

                        if ( isdefined( level._id_1D55["explode"]["medium"] ) )
                            playfx( level._id_1D55["explode"]["medium"], var_7._id_02E6 );

                        if ( isdefined( level._id_12E8 ) )
                            var_7 _meth_809A( level._id_12E8 );
                    }

                    if ( isdefined( var_7._id_04D8 ) && var_7._id_04D8 == "tracking_drone" )
                        var_7 thread _id_A757::_id_94D2();
                    else
                    {
                        var_0 thread _id_7010( var_7, self );
                        var_0 _id_A7A0::_id_6FF3( "ch_noboomforyou" );
                    }

                    if ( !var_2 )
                        self._id_0B6E--;

                    if ( self._id_0B6E <= 0 )
                        thread _id_9832();
                }
            }
        }
    }
}

_id_983E( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    self._id_5C43 = var_0;
    self._id_9830 = var_1;
}

_id_9844( var_0 )
{
    if ( !isdefined( self._id_5C43 ) )
        return 1;

    var_1 = anglestoforward( self._id_0041 + self._id_9830 );
    var_2 = vectornormalize( var_0._id_02E6 - self._id_02E6 );
    var_3 = vectordot( var_1, var_2 );
    return var_3 > self._id_5C43;
}

_id_983A( var_0, var_1 )
{
    if ( !isdefined( self._id_54F1 ) )
        return;

    var_0 endon( "disconnect" );
    self endon( "death" );
    self endon( "change_owner" );
    self endon( "trophyDisabled" );
    self._id_54F1 endon( "death" );
    self notify( "trophyDelayClearLaser" );
    self endon( "trophyDelayClearLaser" );
    self._id_54F1._id_0041 = vectortoangles( var_1._id_02E6 - self._id_54F1._id_02E6 );
    self._id_54F1 _meth_80B2( "tracking_drone_laser" );
    wait 0.7;
    self._id_54F1 _meth_80B3();
}

_id_982D( var_0, var_1 )
{
    self._id_54F1 = spawn( "script_model", self._id_02E6 );
    self._id_54F1 _meth_80B1( "tag_laser" );
    self._id_54F1._id_0041 = self._id_0041;
    self._id_54F1._id_54FA = var_0;
    self._id_54F1._id_54F3 = var_1;
    thread _id_9842();
}

_id_9842()
{
    self endon( "death" );
    self endon( "change_owner" );
    self endon( "trophyDisabled" );
    self._id_54F1 endon( "death" );

    for (;;)
    {
        var_0 = anglestoforward( self._id_0041 + self._id_54F1._id_54F3 );
        self._id_54F1._id_02E6 = self._id_02E6 + var_0 * self._id_54F1._id_54FA;
        waittillframeend;
    }
}

_id_7010( var_0, var_1 )
{
    self endon( "death" );
    var_2 = var_0._id_02E6;
    var_3 = var_0._id_02A0;
    var_4 = var_0._id_0041;

    if ( var_3 == "weapon_light_marker" )
    {
        playfx( level._id_3088, var_2, anglestoforward( var_4 ), anglestoup( var_4 ) );
        var_1 thread _id_9832();
        var_0 delete();
        return;
    }

    var_0 delete();
    var_1 _meth_809A( "trophy_fire" );
    playfx( level._id_5C45, var_2, anglestoforward( var_4 ), anglestoup( var_4 ) );
    radiusdamage( var_2, 128, 105, 10, self, "MOD_EXPLOSIVE", "trophy_mp" );
}

_id_9834( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    self endon( "change_owner" );
    self _meth_82C0( 1 );
    self._id_01E7 = 999999;
    self._id_0275 = 100;
    self._id_0102 = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !isplayer( var_2 ) )
            continue;

        if ( !_id_A7B4::_id_3AA4( self._id_02E9, var_2 ) )
            continue;

        if ( isdefined( var_10 ) )
            var_11 = _id_A75A::_id_8F56( var_10, "_lefthand" );
        else
            var_11 = undefined;

        if ( isdefined( var_11 ) )
        {
            switch ( var_11 )
            {
                case "flash_grenade_mp":
                case "concussion_grenade_mp":
                case "stun_grenade_mp":
                case "smoke_grenade_mp":
                case "stun_grenade_var_mp":
                case "smoke_grenade_var_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( _id_A75A::_id_514D( var_5 ) )
            self._id_0102 += self._id_0275;

        if ( isdefined( var_9 ) && var_9 & level._id_4B59 )
            self._id_A1BC = 1;

        self._id_A1BA = 1;

        if ( isdefined( var_11 ) && ( var_11 == "emp_grenade_mp" || var_11 == "emp_grenade_var_mp" || var_11 == "emp_grenade_killstreak_mp" ) )
            self._id_0102 += self._id_0275;

        self._id_0102 += var_1;

        if ( isplayer( var_2 ) )
            var_2 _id_A784::_id_9B04( "trophy" );

        if ( self._id_0102 >= self._id_0275 )
        {
            if ( isdefined( var_0 ) && var_2 != var_0 )
                var_2 notify( "destroyed_explosive" );

            thread _id_9832();
        }
    }
}

_id_9832()
{
    playfxontag( _id_A4F0::_id_3FA6( "sentry_explode_mp" ), self, "tag_origin" );
    playfxontag( _id_A4F0::_id_3FA6( "sentry_smoke_mp" ), self, "tag_origin" );
    self _meth_809A( "sentry_explode" );
    self notify( "death" );
    var_0 = self._id_02E6;
    self._id_04C6 _meth_80C0();

    if ( isdefined( self._id_54F1 ) )
        self._id_54F1 delete();

    wait 3;

    if ( isdefined( self._id_04C6 ) )
        self._id_04C6 delete();

    if ( isdefined( self ) )
        self delete();
}
