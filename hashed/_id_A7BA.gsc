// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( !isdefined( level._id_7CC6 ) )
        level._id_7CC6 = [];

    level._id_7CC6["sentry_minigun"] = "sentry";
    level._id_7CC6["sam_turret"] = "sam_turret";
    level._id_5398[level._id_7CC6["sentry_minigun"]] = ::_id_98A4;
    level._id_5398[level._id_7CC6["sam_turret"]] = ::_id_98C5;

    if ( !isdefined( level._id_7CC5 ) )
        level._id_7CC5 = [];

    level._id_7CC5["sentry_minigun"] = spawnstruct();
    level._id_7CC5["sentry_minigun"]._id_01E7 = 999999;
    level._id_7CC5["sentry_minigun"]._id_0275 = 1000;
    level._id_7CC5["sentry_minigun"]._id_1933 = 20;
    level._id_7CC5["sentry_minigun"]._id_1932 = 120;
    level._id_7CC5["sentry_minigun"]._id_6721 = 0.15;
    level._id_7CC5["sentry_minigun"]._id_6720 = 0.35;
    level._id_7CC5["sentry_minigun"]._id_7CC4 = "sentry";
    level._id_7CC5["sentry_minigun"]._id_7CC3 = "sentry_offline";
    level._id_7CC5["sentry_minigun"]._id_9364 = 90.0;
    level._id_7CC5["sentry_minigun"]._id_8A5D = 0.05;
    level._id_7CC5["sentry_minigun"]._id_65F2 = 8.0;
    level._id_7CC5["sentry_minigun"]._id_21B4 = 0.1;
    level._id_7CC5["sentry_minigun"]._id_3BBD = 0.3;
    level._id_7CC5["sentry_minigun"]._id_8F20 = "sentry";
    level._id_7CC5["sentry_minigun"]._id_051C = "sentry_minigun_mp";
    level._id_7CC5["sentry_minigun"]._id_5D3A = "sentry_minigun_weak";
    level._id_7CC5["sentry_minigun"]._id_5D40 = "sentry_minigun_weak_obj";
    level._id_7CC5["sentry_minigun"]._id_5D41 = "sentry_minigun_weak_obj_red";
    level._id_7CC5["sentry_minigun"]._id_5D3C = "sentry_minigun_weak_destroyed";
    level._id_7CC5["sentry_minigun"]._id_01F2 = &"SENTRY_PICKUP";
    level._id_7CC5["sentry_minigun"]._id_01E4 = 1;
    level._id_7CC5["sentry_minigun"]._id_91FB = "used_sentry";
    level._id_7CC5["sentry_minigun"]._id_84AA = 0;
    level._id_7CC5["sentry_minigun"]._id_9F28 = "sentry_destroyed";
    level._id_7CC5["sam_turret"] = spawnstruct();
    level._id_7CC5["sam_turret"]._id_01E7 = 999999;
    level._id_7CC5["sam_turret"]._id_0275 = 1000;
    level._id_7CC5["sam_turret"]._id_1933 = 20;
    level._id_7CC5["sam_turret"]._id_1932 = 120;
    level._id_7CC5["sam_turret"]._id_6721 = 0.15;
    level._id_7CC5["sam_turret"]._id_6720 = 0.35;
    level._id_7CC5["sam_turret"]._id_7CC4 = "sentry_manual";
    level._id_7CC5["sam_turret"]._id_7CC3 = "sentry_offline";
    level._id_7CC5["sam_turret"]._id_9364 = 90.0;
    level._id_7CC5["sam_turret"]._id_8A5D = 0.05;
    level._id_7CC5["sam_turret"]._id_65F2 = 8.0;
    level._id_7CC5["sam_turret"]._id_21B4 = 0.1;
    level._id_7CC5["sam_turret"]._id_3BBD = 0.3;
    level._id_7CC5["sam_turret"]._id_8F20 = "sam_turret";
    level._id_7CC5["sam_turret"]._id_051C = "sam_mp";
    level._id_7CC5["sam_turret"]._id_5D3A = "mp_sam_turret";
    level._id_7CC5["sam_turret"]._id_5D40 = "mp_sam_turret_placement";
    level._id_7CC5["sam_turret"]._id_5D41 = "mp_sam_turret_placement_failed";
    level._id_7CC5["sam_turret"]._id_5D3C = "mp_sam_turret";
    level._id_7CC5["sam_turret"]._id_01F2 = &"SENTRY_PICKUP";
    level._id_7CC5["sam_turret"]._id_01E4 = 1;
    level._id_7CC5["sam_turret"]._id_91FB = "used_sam_turret";
    level._id_7CC5["sam_turret"]._id_84AA = 0;
    level._id_7CC5["sam_turret"]._id_9F28 = "sam_destroyed";
    level._id_058F["sentry_overheat_mp"] = loadfx( "vfx/distortion/sentrygun_overheat" );
    level._id_058F["sentry_explode_mp"] = loadfx( "vfx/explosion/vehicle_pdrone_explosion" );
    level._id_058F["sentry_smoke_mp"] = loadfx( "vfx/smoke/vehicle_sentrygun_damaged_smoke" );
    level._id_058F["sentry_stunned"] = loadfx( "vfx/sparks/direct_hack_stun" );
}

_id_98A4( var_0, var_1 )
{
    var_2 = _id_4201( "sentry_minigun" );

    if ( var_2 )
        _id_A744::_id_5838( level._id_7CC5["sentry_minigun"]._id_8F20, self._id_02E6 );

    return var_2;
}

_id_98C5( var_0, var_1 )
{
    var_2 = _id_4201( "sam_turret" );

    if ( var_2 )
        _id_A744::_id_5838( level._id_7CC5["sam_turret"]._id_8F20, self._id_02E6 );

    return var_2;
}

_id_4201( var_0 )
{
    if ( !_id_A75A::_id_9C47() )
        return 0;

    self._id_5553 = var_0;
    var_1 = _id_243B( var_0, self );
    _id_73CC();
    var_2 = _id_7F31( var_1, 1 );
    thread _id_A04D();
    self._id_50D7 = 0;

    if ( isdefined( var_1 ) )
        return 1;
    else
        return 0;
}

_id_7F31( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 _id_7CB8( self );
    _id_A4F0::_id_0587();

    if ( !isai( self ) )
    {
        self _meth_82DD( "place_sentry", "+attack" );
        self _meth_82DD( "place_sentry", "+attack_akimbo_accessible" );
        self _meth_82DD( "cancel_sentry", "+actionslot 4" );

        if ( !level._id_2153 )
        {
            self _meth_82DD( "cancel_sentry", "+actionslot 5" );
            self _meth_82DD( "cancel_sentry", "+actionslot 6" );
            self _meth_82DD( "cancel_sentry", "+actionslot 7" );
            self _meth_82DD( "cancel_sentry", "+actionslot 8" );
        }
    }

    for (;;)
    {
        var_2 = _id_A4F0::_id_A067( "place_sentry", "cancel_sentry", "force_cancel_placement" );

        if ( var_2 == "cancel_sentry" || var_2 == "force_cancel_placement" )
        {
            if ( !var_1 && var_2 == "cancel_sentry" )
                continue;

            if ( level._id_2153 )
            {
                var_3 = _id_A75A::_id_3FF7( level._id_7CC5[var_0._id_7CC6]._id_8F20 );

                if ( isdefined( self._id_539A ) && var_3 == _id_A75A::_id_3FF7( self._id_030D["killstreaks"][self._id_539A]._id_8F20 ) && !self _meth_82CF().size )
                {
                    _id_A75A::_id_05C0( var_3, 0 );
                    _id_A75A::_id_0634( 4, "weapon", var_3 );
                }
            }

            var_0 _id_7CB7();
            _id_A4F0::_id_0595();
            return 0;
        }

        if ( !var_0._id_1AAE )
            continue;

        var_0 _id_7CBB();
        _id_A4F0::_id_0595();
        return 1;
    }
}

_id_73E9()
{
    if ( self _meth_8314( "riotshield_mp" ) )
    {
        self._id_74B0 = "riotshield_mp";
        self _meth_830F( "riotshield_mp" );
    }
}

_id_73CC()
{
    if ( _id_A75A::_id_05CB( "specialty_explosivebullets" ) )
    {
        self._id_74A9 = "specialty_explosivebullets";
        _id_A75A::_id_067B( "specialty_explosivebullets" );
    }
}

_id_74B2()
{
    if ( isdefined( self._id_74B0 ) )
    {
        _id_A75A::_id_05C0( self._id_74B0 );
        self._id_74B0 = undefined;
    }
}

_id_74AA()
{
    if ( isdefined( self._id_74A9 ) )
    {
        _id_A75A::_id_41F5( self._id_74A9, 0 );
        self._id_74A9 = undefined;
    }
}

_id_A04D()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.05;
    _id_74AA();
}

_id_243B( var_0, var_1 )
{
    var_2 = spawnturret( "misc_turret", var_1._id_02E6, level._id_7CC5[var_0]._id_051C );
    var_2._id_0041 = var_1._id_0041;
    var_2 _id_7CAD( var_0, var_1 );
    return var_2;
}

_id_7CAD( var_0, var_1 )
{
    self._id_7CC6 = var_0;
    self._id_1AAE = 1;
    self _meth_80B1( level._id_7CC5[self._id_7CC6]._id_5D3A );
    self._id_84AA = 1;
    self _meth_82C0( 1 );

    switch ( var_0 )
    {
        case "sam_turret":
            self _meth_8138();
            self _meth_8156( 180 );
            self _meth_8155( 180 );
            self _meth_8157( 80 );
            self _meth_815A( -89.0 );
            self._id_54D7 = 0;
            var_2 = spawn( "script_model", self _meth_8180( "tag_laser" ) );
            var_2 _meth_804D( self );
            self._id_534A = var_2;
            self._id_534A _meth_834D( "explosive" );
            break;
        default:
            self _meth_8138();
            self _meth_815A( -89.0 );
            break;
    }

    self _meth_817A( 1 );
    _id_7CB9();
    _id_7CBA( var_1 );
    thread _id_7CA9();
    thread _id_7CC0();

    switch ( var_0 )
    {
        case "sam_turret":
            thread _id_7CAB();
            thread _id_7CA3();
            break;
        default:
            thread _id_7CAB();
            thread _id_7CA2();
            thread _id_7CA3();
            break;
    }
}

_id_7CC1()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        playfxontag( _id_A4F0::_id_3FA6( "sentry_stunned" ), self, "tag_aim" );
        self _meth_815A( 40 );
        self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC3 );
        wait(var_1);
        stopfxontag( _id_A4F0::_id_3FA6( "sentry_stunned" ), self, "tag_aim" );
        self _meth_815A( -89.0 );
        self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC4 );
    }
}

_id_7CA6()
{
    self endon( "death" );
    level endon( "game_ended" );
    self._id_2A69 = 0.25;

    if ( isdefined( self._id_2A6B ) && gettime() < self._id_2A6B )
    {
        self._id_2A6B = gettime() + self._id_2A69 * 1000;
        return;
    }

    playfxontag( _id_A4F0::_id_3FA6( "sentry_stunned" ), self, "tag_aim" );
    self._id_2A6B = gettime() + self._id_2A69 * 1000;
    self _meth_815A( 40 );
    self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC3 );

    for (;;)
    {
        if ( gettime() > self._id_2A6B )
            break;

        wait 0.05;
    }

    self _meth_815A( -89.0 );
    self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC4 );
    stopfxontag( _id_A4F0::_id_3FA6( "sentry_stunned" ), self, "tag_aim" );
}

_id_7CA9()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self _meth_80B1( level._id_7CC5[self._id_7CC6]._id_5D3C );
    _id_7CB9();
    self _meth_815A( 40 );
    self _meth_8103( undefined );
    self _meth_8105( 0 );

    if ( isdefined( self._id_6638 ) )
        self._id_6638 delete();

    self _meth_809A( "sentry_explode" );

    if ( isdefined( self._id_4F93 ) )
    {
        playfxontag( _id_A4F0::_id_3FA6( "sentry_explode_mp" ), self, "tag_origin" );
        playfxontag( _id_A4F0::_id_3FA6( "sentry_smoke_mp" ), self, "tag_aim" );
        self._id_4F93._id_9976 _id_A79D::_id_28E8();
        self._id_4F93 _id_74AA();
        self._id_4F93 _id_74B2();
        self notify( "deleting" );
        wait 1.0;
        stopfxontag( _id_A4F0::_id_3FA6( "sentry_explode_mp" ), self, "tag_origin" );
        stopfxontag( _id_A4F0::_id_3FA6( "sentry_smoke_mp" ), self, "tag_aim" );
    }
    else
    {
        playfxontag( _id_A4F0::_id_3FA6( "sentry_explode_mp" ), self, "tag_aim" );
        wait 1.5;
        self _meth_809A( "sentry_explode_smoke" );

        for ( var_0 = 8; var_0 > 0; var_0 -= 0.4 )
        {
            playfxontag( _id_A4F0::_id_3FA6( "sentry_smoke_mp" ), self, "tag_aim" );
            wait 0.4;
        }

        self notify( "deleting" );
    }

    if ( isdefined( self._id_534A ) )
        self._id_534A delete();

    self delete();
}

_id_7CAB()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !_id_A75A::_id_5186( var_0 ) )
            continue;

        if ( self._id_7CC6 == "sam_turret" )
            self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC3 );

        var_0 _id_7F31( self, 0 );
    }
}

_id_995B( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( !isdefined( var_0._id_6638 ) )
        return;

    var_1 = 0;

    for (;;)
    {
        if ( isalive( self ) && self _meth_80A9( var_0._id_6638 ) && !isdefined( var_0._id_4F93 ) && !isdefined( var_0._id_1BAA ) && self _meth_8341() )
        {
            if ( self _meth_833C() )
            {
                if ( isdefined( self._id_9C1E ) && self._id_9C1E )
                    continue;

                var_1 = 0;

                while ( self _meth_833C() )
                {
                    var_1 += 0.05;
                    wait 0.05;
                }

                if ( var_1 >= 0.5 )
                    continue;

                var_1 = 0;

                while ( !self _meth_833C() && var_1 < 0.5 )
                {
                    var_1 += 0.05;
                    wait 0.05;
                }

                if ( var_1 >= 0.5 )
                    continue;

                if ( !_id_A75A::_id_5186( self ) )
                    continue;

                if ( isdefined( self._id_9C1E ) && self._id_9C1E )
                    continue;

                var_0 _meth_8065( level._id_7CC5[var_0._id_7CC6]._id_7CC3 );
                thread _id_7F31( var_0, 0 );
                var_0._id_6638 delete();
                return;
            }
        }

        wait 0.05;
    }
}

_id_995D()
{
    self notify( "turret_handluse" );
    self endon( "turret_handleuse" );
    self endon( "deleting" );
    level endon( "game_ended" );
    self._id_39B8 = 0;
    var_0 = ( 1, 0.9, 0.7 );
    var_1 = ( 1, 0.65, 0 );
    var_2 = ( 1, 0.25, 0 );

    for (;;)
    {
        self waittill( "trigger", var_3 );

        if ( isdefined( self._id_1BAA ) )
            continue;

        if ( isdefined( self._id_4F93 ) )
            continue;

        if ( !_id_A75A::_id_5186( var_3 ) )
            continue;

        var_3 _id_73CC();
        var_3 _id_73E9();
        self._id_4F93 = var_3;
        self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC3 );
        _id_7CBA( var_3 );
        self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC4 );
        var_3 thread _id_9989( self );
        var_3._id_9976 = var_3 _id_A79D::_id_23E5( var_0, 100, 6 );
        var_3._id_9976 _id_A79D::_id_7FE8( "CENTER", "BOTTOM", 0, -70 );
        var_3._id_9976._id_0037 = 0.65;
        var_3._id_9976._id_12DB._id_0037 = 0.65;
        var_4 = 0;

        for (;;)
        {
            if ( !_id_A75A::_id_5186( var_3 ) )
            {
                self._id_4F93 = undefined;
                var_3._id_9976 _id_A79D::_id_28E8();
                break;
            }

            if ( !var_3 _meth_8342() )
            {
                self notify( "player_dismount" );
                self._id_4F93 = undefined;
                var_3._id_9976 _id_A79D::_id_28E8();
                var_3 _id_74AA();
                var_3 _id_74B2();
                self _meth_80DB( level._id_7CC5[self._id_7CC6]._id_01F2 );
                self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC3 );
                _id_7CBA( self._id_65A0 );
                self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC4 );
                break;
            }

            if ( self._id_4795 >= level._id_7CC5[self._id_7CC6]._id_65F2 )
                var_5 = 1;
            else
                var_5 = self._id_4795 / level._id_7CC5[self._id_7CC6]._id_65F2;

            var_3._id_9976 _id_A79D::_id_9AEF( var_5 );

            if ( self._id_39B8 || self._id_65F1 )
            {
                self _meth_815C();
                var_3._id_9976._id_12DB._id_00C5 = var_2;
                var_4 = 0;
            }
            else
            {
                var_3._id_9976._id_12DB._id_00C5 = var_0;
                self _meth_8179();
                var_4 = 0;
                self notify( "not_overheated" );
            }

            wait 0.05;
        }

        self _meth_815A( 0.0 );
    }
}

_id_7CAA()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "sentry_handleOwner" );
    self endon( "sentry_handleOwner" );
    self._id_02E9 _id_A4F0::_id_A060( "disconnect", "joined_team", "joined_spectators" );
    self notify( "death" );
}

_id_7CBA( var_0 )
{
    self._id_02E9 = var_0;
    self _meth_8103( self._id_02E9 );
    self _meth_8105( 1, self._id_7CC6 );

    if ( level._id_91E4 )
    {
        self._id_04A8 = self._id_02E9._id_04A8;
        self _meth_8135( self._id_04A8 );
    }

    thread _id_7CAA();
}

_id_7CBB()
{
    self _meth_80B1( level._id_7CC5[self._id_7CC6]._id_5D3A );

    if ( self _meth_8066() == "manual" )
        self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC3 );

    self _meth_8104( undefined );
    self _meth_82C0( 1 );
    _id_7CB0();
    self._id_1BAA _meth_80DE();
    self._id_1BAA = undefined;

    if ( isdefined( self._id_02E9 ) )
        self._id_02E9._id_50D7 = 0;

    _id_7CB6();
    self _meth_809A( "sentry_gun_plant" );
    self notify( "placed" );
}

_id_7CB7()
{
    self._id_1BAA _meth_80DE();

    if ( isdefined( self._id_02E9 ) )
        self._id_02E9._id_50D7 = 0;

    self delete();
}

_id_7CB8( var_0 )
{
    if ( isdefined( self._id_65A0 ) )
    {

    }
    else
    {

    }

    self _meth_80B1( level._id_7CC5[self._id_7CC6]._id_5D40 );
    self _meth_8104( var_0 );
    self _meth_82C0( 0 );
    _id_7CAF();
    self._id_1BAA = var_0;
    var_0._id_50D7 = 1;
    var_0 thread _id_9B5F( self );
    thread _id_7CB2( var_0 );
    thread _id_7CB3( var_0 );
    thread _id_7CB1( var_0 );
    thread _id_7CB4();
    self _meth_815A( -89.0 );
    _id_7CB9();
    self notify( "carried" );
}

_id_9B5F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "placed" );
    var_0 endon( "death" );
    var_0._id_1AAE = 1;
    var_1 = -1;

    for (;;)
    {
        var_2 = self _meth_82D2( 1, 22 );
        var_0._id_02E6 = var_2["origin"];
        var_0._id_0041 = var_2["angles"];
        var_0._id_1AAE = self _meth_8341() && var_2["result"] && abs( var_0._id_02E6[2] - self._id_02E6[2] ) < 30;

        if ( var_0._id_1AAE != var_1 )
        {
            if ( var_0._id_1AAE )
            {
                var_0 _meth_80B1( level._id_7CC5[var_0._id_7CC6]._id_5D40 );
                self _meth_80DD( &"SENTRY_PLACE" );
            }
            else
            {
                var_0 _meth_80B1( level._id_7CC5[var_0._id_7CC6]._id_5D41 );
                self _meth_80DD( &"SENTRY_CANNOT_PLACE" );
            }
        }

        var_1 = var_0._id_1AAE;
        wait 0.05;
    }
}

_id_7CB2( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "death" );

    if ( self._id_1AAE )
        _id_7CBB();
    else
        self delete();
}

_id_7CB3( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self delete();
}

_id_7CB1( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 _id_A4F0::_id_A060( "joined_team", "joined_spectators" );
    self delete();
}

_id_7CB4( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    level waittill( "game_ended" );
    self delete();
}

_id_7CB6()
{
    self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC4 );
    self _meth_80DA( "HINT_NOICON" );
    self _meth_80DB( level._id_7CC5[self._id_7CC6]._id_01F2 );

    if ( level._id_7CC5[self._id_7CC6]._id_01E4 )
    {
        if ( level._id_91E4 )
            _id_A72D::_id_8022( self._id_04A8, ( 0, 0, 65 ) );
        else
            _id_A72D::_id_7FDF( self._id_02E9, ( 0, 0, 65 ) );
    }

    self _meth_80BF();

    foreach ( var_1 in level._id_0328 )
    {
        var_2 = self _meth_81B1();
        _id_0855( var_2 );

        if ( var_1 == self._id_02E9 )
        {
            self _meth_800A( var_1 );
            continue;
        }

        self _meth_800B( var_1 );
    }

    if ( self._id_84AA )
    {
        level thread _id_A75A::_id_91F3( level._id_7CC5[self._id_7CC6]._id_91FB, self._id_02E9, self._id_02E9._id_04A8 );
        self._id_84AA = 0;
    }

    if ( self._id_7CC6 == "sam_turret" )
        thread _id_77D4();

    thread _id_7CC1();
}

_id_7CB9()
{
    self _meth_8065( level._id_7CC5[self._id_7CC6]._id_7CC3 );
    self _meth_80C0();
    self _meth_813A();
    var_0 = self _meth_81B1();
    _id_73AF( var_0 );

    if ( level._id_91E4 )
        _id_A72D::_id_8022( "none", ( 0, 0, 0 ) );
    else if ( isdefined( self._id_02E9 ) )
        _id_A72D::_id_7FDF( undefined, ( 0, 0, 0 ) );
}

_id_7CB0()
{
    self _meth_8136();
}

_id_7CAF()
{
    self _meth_80BE( 0 );
}

_id_510D( var_0 )
{
    if ( level._id_91E4 && self._id_04A8 == var_0._id_04A8 )
        return 1;

    return 0;
}

_id_0855( var_0 )
{
    level._id_99B3[var_0] = self;
}

_id_73AF( var_0 )
{
    level._id_99B3[var_0] = undefined;
}

_id_7CA2()
{
    self endon( "death" );
    level endon( "game_ended" );
    self._id_5D59 = 0;
    self._id_4795 = 0;
    self._id_65F1 = 0;
    thread _id_7CAC();

    for (;;)
    {
        _id_A4F0::_id_A07E( "turretstatechange", "cooled" );

        if ( self _meth_80E4() )
        {
            thread _id_7CA4();
            continue;
        }

        _id_7CBC();
        thread _id_7CA5();
    }
}

_id_7CC0()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level._id_7CC5[self._id_7CC6]._id_9364;

    while ( var_0 )
    {
        wait 1.0;
        _id_A79A::_id_A0D4();

        if ( !isdefined( self._id_1BAA ) )
            var_0 = max( 0, var_0 - 1.0 );
    }

    if ( isdefined( self._id_02E9 ) )
    {
        if ( self._id_7CC6 == "sam_turret" )
            self._id_02E9 thread _id_A75A::_id_5652( "sam_gone" );
        else
            self._id_02E9 thread _id_A75A::_id_5652( "sentry_gone" );
    }

    self notify( "death" );
}

_id_7CBF()
{
    self endon( "death" );
    self _meth_809A( "sentry_gun_beep" );
    wait 0.1;
    self _meth_809A( "sentry_gun_beep" );
    wait 0.1;
    self _meth_809A( "sentry_gun_beep" );
}

_id_7CBD()
{
    thread _id_7CBF();

    while ( self._id_5D59 < level._id_7CC5[self._id_7CC6]._id_8A5D )
    {
        self._id_5D59 += 0.1;
        wait 0.1;
    }
}

_id_7CBC()
{
    self._id_5D59 = 0;
}

_id_7CA4()
{
    self endon( "death" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    _id_7CBD();
    var_0 = weaponfiretime( level._id_7CC5[self._id_7CC6]._id_051C );
    var_1 = level._id_7CC5[self._id_7CC6]._id_1933;
    var_2 = level._id_7CC5[self._id_7CC6]._id_1932;
    var_3 = level._id_7CC5[self._id_7CC6]._id_6721;
    var_4 = level._id_7CC5[self._id_7CC6]._id_6720;

    for (;;)
    {
        var_5 = randomintrange( var_1, var_2 + 1 );

        for ( var_6 = 0; var_6 < var_5 && !self._id_65F1; var_6++ )
        {
            self _meth_80EA();
            self._id_4795 += var_0;
            wait(var_0);
        }

        wait(randomfloatrange( var_3, var_4 ));
    }
}

_id_7CA5()
{
    self notify( "stop_shooting" );
}

_id_9989( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "player_dismount" );
    var_1 = weaponfiretime( level._id_7CC5[var_0._id_7CC6]._id_051C );

    for (;;)
    {
        var_0 waittill( "turret_fire" );
        var_0._id_4795 += var_1;
        var_0._id_21B5 = var_1;
    }
}

_id_7CAC()
{
    self endon( "death" );
    var_0 = weaponfiretime( level._id_7CC5[self._id_7CC6]._id_051C );
    var_1 = 0;
    var_2 = 0;
    var_3 = level._id_7CC5[self._id_7CC6]._id_65F2;
    var_4 = level._id_7CC5[self._id_7CC6]._id_21B4;

    for (;;)
    {
        if ( self._id_4795 != var_1 )
            wait(var_0);
        else
            self._id_4795 = max( 0, self._id_4795 - 0.05 );

        if ( self._id_4795 > var_3 )
        {
            self._id_65F1 = 1;
            thread _id_6DA6();

            while ( self._id_4795 )
            {
                self._id_4795 = max( 0, self._id_4795 - var_4 );
                wait 0.1;
            }

            self._id_65F1 = 0;
            self notify( "not_overheated" );
        }

        var_1 = self._id_4795;
        wait 0.05;
    }
}

_id_995E()
{
    self endon( "death" );
    var_0 = level._id_7CC5[self._id_7CC6]._id_65F2;

    for (;;)
    {
        if ( self._id_4795 > var_0 )
        {
            self._id_65F1 = 1;
            thread _id_6DA6();

            while ( self._id_4795 )
                wait 0.1;

            self._id_65F1 = 0;
            self notify( "not_overheated" );
        }

        wait 0.05;
    }
}

_id_9945()
{
    self endon( "death" );

    for (;;)
    {
        if ( self._id_4795 > 0 )
        {
            if ( self._id_21B5 <= 0 )
                self._id_4795 = max( 0, self._id_4795 - 0.05 );
            else
                self._id_21B5 = max( 0, self._id_21B5 - 0.05 );
        }

        wait 0.05;
    }
}

_id_6DA6()
{
    self endon( "death" );
    self endon( "not_overheated" );
    level endon( "game_ended" );
    self notify( "playing_heat_fx" );
    self endon( "playing_heat_fx" );

    for (;;)
    {
        playfxontag( _id_A4F0::_id_3FA6( "sentry_overheat_mp" ), self, "tag_flash" );
        wait(level._id_7CC5[self._id_7CC6]._id_3BBD);
    }
}

_id_6DD3()
{
    self endon( "death" );
    self endon( "not_overheated" );
    level endon( "game_ended" );

    for (;;)
    {
        playfxontag( _id_A4F0::_id_3FA6( "sentry_smoke_mp" ), self, "tag_aim" );
        wait 0.4;
    }
}

_id_7CA3()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 3.0;

        if ( !isdefined( self._id_1BAA ) )
            self _meth_809A( "sentry_gun_beep" );
    }
}

_id_77D4()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );
    self._id_77E4 = undefined;
    self._id_77E3 = [];

    for (;;)
    {
        self._id_77E4 = _id_77D3();
        _id_77D5();
        wait 0.05;
    }
}

_id_77D3()
{
    var_0 = self _meth_8180( "tag_laser" );

    if ( !isdefined( self._id_77E4 ) )
    {
        if ( level._id_91E4 )
        {
            var_1 = [];

            if ( level._id_5FE9 )
            {
                foreach ( var_3 in level._id_91F0 )
                {
                    if ( var_3 != self._id_04A8 )
                    {
                        foreach ( var_5 in level._id_99E1[var_3] )
                            var_1[var_1.size] = var_5;
                    }
                }
            }
            else if ( isdefined( self._id_04A8 ) )
                var_1 = level._id_99E1[level._id_65B0[self._id_04A8]];

            foreach ( var_9 in var_1 )
            {
                if ( isdefined( var_9._id_5143 ) && var_9._id_5143 )
                    continue;

                if ( isdefined( var_9._id_654A ) && var_9._id_654A )
                    continue;

                if ( sighttracepassed( var_0, var_9._id_02E6, 0, self ) )
                    return var_9;
            }

            foreach ( var_12 in level._id_57B5 )
            {
                if ( isdefined( var_12._id_04A8 ) && var_12._id_04A8 == self._id_04A8 )
                    continue;

                if ( sighttracepassed( var_0, var_12._id_02E6, 0, self ) )
                    return var_12;
            }

            foreach ( var_15 in level._id_4813 )
            {
                if ( isdefined( var_15._id_04A8 ) && var_15._id_04A8 == self._id_04A8 )
                    continue;

                if ( isdefined( var_15._id_1FC7 ) && var_15._id_1FC7 < 1 )
                    continue;

                if ( sighttracepassed( var_0, var_15._id_02E6, 0, self, var_15 ) )
                    return var_15;
            }

            if ( level._id_6572 && isdefined( level._id_656B._id_02E9 ) && level._id_656B._id_02E9._id_04A8 != self._id_04A8 )
            {
                if ( sighttracepassed( var_0, level._id_656B._id_02E6, 0, self ) )
                    return level._id_656B;
            }

            if ( isdefined( level._id_0606 ) )
            {
                foreach ( var_18 in level._id_0606 )
                {
                    if ( isdefined( var_18._id_6E13 ) && var_18._id_02E9._id_04A8 != self._id_04A8 )
                    {
                        if ( sighttracepassed( var_0, var_18._id_6E13._id_02E6, 0, self ) )
                            return var_18._id_6E13;
                    }
                }
            }

            foreach ( var_21 in level._id_687B )
            {
                if ( isdefined( var_21._id_04A8 ) && var_21._id_04A8 == self._id_04A8 )
                    continue;

                if ( sighttracepassed( var_0, var_21._id_02E6, 0, self ) )
                    return var_21;
            }
        }
        else
        {
            foreach ( var_9 in level._id_99E1 )
            {
                if ( isdefined( var_9._id_5143 ) && var_9._id_5143 )
                    continue;

                if ( isdefined( var_9._id_02E9 ) && isdefined( self._id_02E9 ) && var_9._id_02E9 == self._id_02E9 )
                    continue;

                if ( isdefined( var_9._id_654A ) && var_9._id_654A )
                    continue;

                if ( sighttracepassed( var_0, var_9._id_02E6, 0, self ) )
                    return var_9;
            }

            foreach ( var_12 in level._id_57B5 )
            {
                if ( isdefined( var_12._id_02E9 ) && isdefined( self._id_02E9 ) && var_12._id_02E9 == self._id_02E9 )
                    continue;

                if ( sighttracepassed( var_0, var_12._id_02E6, 0, self ) )
                    return var_12;
            }

            foreach ( var_15 in level._id_4813 )
            {
                if ( isdefined( var_15._id_02E9 ) && isdefined( self._id_02E9 ) && var_15._id_02E9 == self._id_02E9 )
                    continue;

                if ( isdefined( var_15._id_1FC7 ) && var_15._id_1FC7 < 1 )
                    continue;

                if ( sighttracepassed( var_0, var_15._id_02E6, 0, self, var_15 ) )
                    return var_15;
            }

            if ( level._id_6572 && isdefined( level._id_656B._id_02E9 ) && isdefined( self._id_02E9 ) && level._id_656B._id_02E9 != self._id_02E9 )
            {
                if ( sighttracepassed( var_0, level._id_656B._id_02E9._id_02E6, 0, self ) )
                    return level._id_656B._id_02E9;
            }

            if ( isdefined( level._id_0606 ) )
            {
                foreach ( var_18 in level._id_0606 )
                {
                    if ( isdefined( var_18._id_6E13 ) && var_18._id_02E9 != self )
                    {
                        if ( sighttracepassed( var_0, var_18._id_6E13._id_02E6, 0, self ) )
                            return var_18._id_6E13;
                    }
                }
            }

            foreach ( var_21 in level._id_687B )
            {
                if ( isdefined( var_21._id_04A8 ) && var_21._id_02E9 == self._id_02E9 )
                    continue;

                if ( sighttracepassed( var_0, var_21._id_02E6, 0, self ) )
                    return var_21;
            }
        }

        self _meth_8108();
        return undefined;
    }
    else
    {
        if ( !sighttracepassed( var_0, self._id_77E4._id_02E6, 0, self, self._id_77E4 ) )
        {
            self _meth_8108();
            return undefined;
        }

        return self._id_77E4;
    }
}

_id_77D5()
{
    if ( isdefined( self._id_77E4 ) )
    {
        if ( self._id_77E4 == level._id_06CE._id_6879 && !isdefined( level._id_06D1 ) || isdefined( level._id_656B ) && self._id_77E4 == level._id_656B && !isdefined( level._id_656C ) )
        {
            self._id_77E4 = undefined;
            self _meth_8108();
            return;
        }

        self _meth_8106( self._id_77E4 );
        self waittill( "turret_on_target" );

        if ( !isdefined( self._id_77E4 ) )
            return;

        if ( !self._id_54D7 )
        {
            thread _id_77D7();
            thread _id_77D6();
            thread _id_77D8();
            thread _id_77D9();
        }

        wait 2.0;

        if ( !isdefined( self._id_77E4 ) )
            return;

        if ( self._id_77E4 == level._id_06CE._id_6879 && !isdefined( level._id_06D1 ) )
        {
            self._id_77E4 = undefined;
            self _meth_8108();
            return;
        }

        var_0 = [];
        var_0[0] = self _meth_8180( "tag_le_missile1" );
        var_0[1] = self _meth_8180( "tag_le_missile2" );
        var_0[2] = self _meth_8180( "tag_ri_missile1" );
        var_0[3] = self _meth_8180( "tag_ri_missile2" );
        var_1 = self._id_77E3.size;

        for ( var_2 = 0; var_2 < 4; var_2++ )
        {
            if ( !isdefined( self._id_77E4 ) )
                return;

            if ( isdefined( self._id_1BAA ) )
                return;

            self _meth_80EA();
            var_3 = magicbullet( "sam_projectile_mp", var_0[var_2], self._id_77E4._id_02E6, self._id_02E9 );
            var_3 _meth_81D9( self._id_77E4 );
            var_3 _meth_81DC();
            var_3._id_77E5 = self;
            var_3._id_77E2 = var_1;
            self._id_77E3[var_1][var_2] = var_3;
            level notify( "sam_missile_fired", self._id_02E9, var_3, self._id_77E4 );

            if ( var_2 == 3 )
                break;

            wait 0.25;
        }

        level notify( "sam_fired", self._id_02E9, self._id_77E3[var_1], self._id_77E4 );
        wait 3.0;
    }
}

_id_77D9()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "fakedeath" );

    while ( isdefined( self._id_77E4 ) && isdefined( self _meth_8109( 1 ) ) && self _meth_8109( 1 ) == self._id_77E4 )
    {
        var_0 = self _meth_8180( "tag_laser" );

        if ( !sighttracepassed( var_0, self._id_77E4._id_02E6, 0, self, self._id_77E4 ) )
        {
            self _meth_8108();
            self._id_77E4 = undefined;
            break;
        }

        wait 0.05;
    }
}

_id_77D7()
{
    self endon( "death" );
    self _meth_80B2();
    self._id_54D7 = 1;
    self notify( "laser_on" );

    while ( isdefined( self._id_77E4 ) && isdefined( self _meth_8109( 1 ) ) && self _meth_8109( 1 ) == self._id_77E4 )
        wait 0.05;

    self _meth_80B3();
    self._id_54D7 = 0;
    self notify( "laser_off" );
}

_id_77D6()
{
    self endon( "death" );
    self endon( "fakedeath" );
    self._id_77E4 endon( "death" );

    if ( !isdefined( self._id_77E4._id_4815 ) )
        return;

    self._id_77E4 waittill( "crashing" );
    self _meth_8108();
    self._id_77E4 = undefined;
}

_id_77D8()
{
    self endon( "death" );
    self endon( "fakedeath" );
    self._id_77E4 endon( "death" );

    if ( !isdefined( self._id_77E4._id_02A0 ) )
        return;

    if ( self._id_77E4._id_02A0 == "vehicle_uav_static_mp" )
    {
        self._id_77E4 waittill( "leaving" );
        self _meth_8108();
        self._id_77E4 = undefined;
    }
}
