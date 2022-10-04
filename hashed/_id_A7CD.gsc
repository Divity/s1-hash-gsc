// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( !isdefined( level._id_99BD ) )
        level._id_99BD = [];

    level._id_99BD["mg_turret"] = "remote_mg_turret";
    level._id_5398["remote_mg_turret"] = ::_id_98C0;
    level._id_5398["remote_mg_sentry_turret"] = ::_id_98BF;
    level._id_53AC["remote_energy_turret_mp"] = "remote_mg_sentry_turret";
    level._id_53AC["sentry_minigun_mp"] = "remote_mg_sentry_turret";
    level._id_53AC["killstreakmahem_mp"] = "remote_mg_sentry_turret";

    if ( !isdefined( level._id_99B4 ) )
        level._id_99B4 = [];

    level._id_99B4["mg_turret"] = spawnstruct();
    level._id_99B4["mg_turret"]._id_7CC4 = "sentry";
    level._id_99B4["mg_turret"]._id_7CC3 = "sentry_offline";
    level._id_99B4["mg_turret"]._id_9364 = 60.0;
    level._id_99B4["mg_turret"]._id_0275 = 1000;
    level._id_99B4["mg_turret"]._id_8F20 = "remote_mg_turret";
    level._id_99B4["mg_turret"]._id_91FB = "used_remote_mg_turret";
    level._id_99B4["mg_turret"]._id_4901 = &"MP_ENTER_REMOTE_TURRET";
    level._id_99B4["mg_turret"]._id_4908 = &"MP_HOLD_TO_CARRY";
    level._id_99B4["mg_turret"]._id_490C = &"MP_TURRET_RIP_OFF";
    level._id_99B4["mg_turret"]._id_48FE = &"MP_TURRET_DROP";
    level._id_99B4["mg_turret"]._id_6865 = &"MP_TURRET_PLACE";
    level._id_99B4["mg_turret"]._id_1AD4 = &"MP_TURRET_CANNOT_PLACE";
    level._id_99B4["mg_turret"]._id_54BB = "killstreak_remote_turret_mp";
    level._id_058F["sentry_explode_mp"] = loadfx( "vfx/explosion/remote_sentry_death" );
    level._id_058F["sentry_smoke_mp"] = loadfx( "vfx/smoke/vehicle_sentrygun_damaged_smoke" );
    level._id_058F["sentry_overheat_mp"] = loadfx( "vfx/distortion/sentrygun_overheat" );
    level._id_058F["antenna_light_mp"] = loadfx( "vfx/lights/light_detonator_blink" );
    level._id_058F["sentry_stunned_mp"] = loadfx( "vfx/sparks/emp_drone_damage" );
    level._id_058F["sentry_laser_flash"] = loadfx( "vfx/fire/remote_sentry_laser_flash" );
    level._id_058F["sentry_gone"] = loadfx( "vfx/explosion/remote_sentry_death_smoke" );
    level._id_058F["sentry_rocket_muzzleflash_wv"] = loadfx( "vfx/muzzleflash/rpg_flash_wv" );
    level._id_058F["sentry_rocket_muzzleflash_view"] = loadfx( "vfx/muzzleflash/rpg_flash_view" );
    game["dialog"]["ks_sentrygun_destroyed"] = "ks_sentrygun_destroyed";
}

_id_98BF( var_0, var_1 )
{
    var_2 = _id_98C1( var_0, "mg_turret", 1, var_1 );

    if ( var_2 )
        _id_A744::_id_5838( level._id_99B4["mg_turret"]._id_8F20, self._id_02E6 );

    self._id_50D7 = 0;
    return var_2;
}

_id_98C0( var_0, var_1 )
{
    var_2 = _id_98C1( var_0, "mg_turret", 0, var_1 );

    if ( var_2 )
        _id_A744::_id_5838( level._id_99B4["mg_turret"]._id_8F20, self._id_02E6 );

    self._id_50D7 = 0;
    return var_2;
}

_id_9126( var_0 )
{
    _id_A7C3::_id_9125( level._id_99B4[var_0]._id_54BB );
}

_id_98C1( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self._id_9938 ) )
    {
        self _meth_826E( &"KILLSTREAKS_SENTRY_IN_USE" );
        return 0;
    }

    var_4 = _id_244A( var_1, self, var_2, var_3 );

    if ( isdefined( level._id_511A ) && level._id_511A && self._id_539A == 1 )
        self._id_4963 = var_4;

    _id_6C5A();
    _id_73CC();
    self._id_1BAE = var_4;
    _id_7F32( var_4, 1 );
    self._id_1BAE = undefined;
    thread _id_74AA();

    if ( isdefined( var_4 ) )
        return 1;
    else
        return 0;
}

_id_8316()
{
    if ( self._id_4799 )
        self _meth_8048( "TAG_OPTIC_STANDARD" );
    else
        self _meth_8048( "TAG_OPTIC_RESISTANCE" );
}

_id_8331()
{
    if ( !self._id_7555 )
        self _meth_8048( "TAG_HANDLES" );
}

_id_7FAC()
{
    if ( isdefined( self._id_02A0 ) && self._id_02A0 != "" )
        self _meth_804C();

    if ( self._id_32CD )
        self _meth_80B1( "npc_sentry_energy_turret_empty_base" );
    else if ( self._id_7593 )
        self _meth_80B1( "npc_sentry_rocket_turret_empty_base" );
    else if ( self.disruptorturret )
        self _meth_80B1( "npc_sentry_disruptor_turret_empty_base" );
    else
        self _meth_80B1( "npc_sentry_minigun_turret_empty_base" );

    _id_8316();
    _id_8331();
}

_id_7FAB()
{
    if ( isdefined( self._id_02A0 ) && self._id_02A0 != "" )
        self _meth_804C();

    if ( self._id_32CD )
        self _meth_80B1( "npc_sentry_energy_turret_base" );
    else if ( self._id_7593 )
        self _meth_80B1( "npc_sentry_rocket_turret_base" );
    else if ( self.disruptorturret )
        self _meth_80B1( "npc_sentry_disruptor_turret_base" );
    else
        self _meth_80B1( "npc_sentry_minigun_turret_base" );

    _id_8316();
    _id_8331();
}

_id_7FAE()
{
    if ( isdefined( self._id_02A0 ) && self._id_02A0 != "" )
        self _meth_804C();

    if ( self._id_32CD )
        self _meth_80B1( "npc_sentry_energy_turret_base_yellow_obj" );
    else if ( self._id_7593 )
        self _meth_80B1( "npc_sentry_rocket_turret_base_yellow_obj" );
    else if ( self.disruptorturret )
        self _meth_80B1( "npc_sentry_disruptor_turret_base_yellow_obj" );
    else
        self _meth_80B1( "npc_sentry_minigun_turret_base_yellow_obj" );

    _id_8316();
    _id_8331();
}

_id_7FAD()
{
    if ( isdefined( self._id_02A0 ) && self._id_02A0 != "" )
        self _meth_804C();

    if ( self._id_32CD )
        self _meth_80B1( "npc_sentry_energy_turret_base_red_obj" );
    else if ( self._id_7593 )
        self _meth_80B1( "npc_sentry_rocket_turret_base_red_obj" );
    else if ( self.disruptorturret )
        self _meth_80B1( "npc_sentry_disruptor_turret_base_red_obj" );
    else
        self _meth_80B1( "npc_sentry_minigun_turret_base_red_obj" );

    _id_8316();
    _id_8331();
}

_id_7F32( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !_id_A75A::_id_5186( self ) )
    {
        var_0 delete();
        return;
    }

    var_0 _id_9980( self );
    var_2 = _id_A75A::_id_3FF7( "remote_mg_sentry_turret" );
    var_3 = self _meth_8312();

    if ( !_id_A7B4::_id_51EC( var_3 ) || var_3 == "iw5_underwater_mp" )
        var_3 = _id_A4F0::_id_3FFB();

    if ( !var_1 )
    {
        _id_A75A::_id_05C0( var_2, 0 );
        self _meth_8315( var_2 );
        self._id_A272 = var_2;
        _id_A4F0::_id_0588();
    }

    for (;;)
    {
        var_4 = _id_A4F0::_id_A067( "place_turret", "cancel_turret", "force_cancel_placement" );

        if ( var_4 == "cancel_turret" || var_4 == "force_cancel_placement" )
        {
            if ( var_4 == "cancel_turret" && !var_1 )
                continue;

            var_0 _id_997F();

            if ( !var_1 )
            {
                if ( !isdefined( self._id_99FC ) )
                    playerswitchawayfromholdingturret( var_3, var_2 );
                else
                    self._id_A272 = var_3;

                _id_A4F0::_id_0596();
            }

            return 0;
        }

        if ( isdefined( var_0 ) )
        {
            if ( !var_0._id_1AAE )
                continue;

            var_0 _id_9983();
        }

        if ( !var_1 )
        {
            if ( !isdefined( self._id_99FC ) )
                playerswitchawayfromholdingturret( var_3, var_2 );
            else
                self._id_A272 = var_3;

            _id_A4F0::_id_0596();
        }

        return 1;
    }
}

playerswitchawayfromholdingturret( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    _id_A75A::_id_9074( var_0 );

    while ( self _meth_8312() != var_0 )
        waittillframeend;

    self._id_A272 = var_0;
    _id_A7C3::_id_9125( var_1 );
}

_id_7FF9( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 _meth_82C0( 0 );
    var_0 _meth_80BE( 0 );
    var_0 _meth_813A();
    var_0._id_1BAA = self;
    self._id_50D7 = 0;
    var_0 _id_9981();
    var_0 _id_7FAC();
    var_0 notify( "carried" );
    var_0 notify( "ripped" );
    var_0 _meth_8105( 0 );
    var_0 thread _id_2844( 20 );

    if ( isdefined( var_0._id_7321 ) )
        var_0._id_7321 _id_A75A::_id_593F();

    if ( var_0._id_32CD )
        thread _id_A7CE::_id_6CAF( "turretheadenergy_mp" );
    else if ( var_0._id_7593 )
        thread _id_A7CE::_id_6CAF( "turretheadrocket_mp" );
    else if ( var_0.disruptorturret )
        thread _id_A7CE::_id_6CAF( "turretheaddisruptor_mp" );
    else
        thread _id_A7CE::_id_6CAF( "turretheadmg_mp" );

    var_0 _meth_809A( "sentry_gun_detach" );
}

_id_2844( var_0 )
{
    self endon( "death" );
    level _id_A79A::_id_A049( var_0 );

    if ( isdefined( self ) )
    {
        _id_2669();
        self delete();
    }
}

_id_2669()
{
    var_0 = self _meth_8180( "TAG_AIM_PIVOT" );
    playfx( _id_A4F0::_id_3FA6( "sentry_gone" ), var_0 );
    playsoundatpos( var_0, "sentry_gun_self_destruct" );
}

_id_73CC()
{
    if ( _id_A75A::_id_05CB( "specialty_explosivebullets" ) )
    {
        self._id_74A9 = "specialty_explosivebullets";
        _id_A75A::_id_067B( "specialty_explosivebullets" );
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

_id_9979( var_0 )
{
    self._id_709A = 1;
    self notify( "death" );
}

_id_9983()
{
    _id_7FAB();
    thread _id_7CA2();
    thread sentry_disruptor();
    self _meth_8104( undefined );
    self _meth_82C0( 1 );
    self._id_1BAA _meth_80DE();
    self._id_1BAA = undefined;

    if ( isdefined( self._id_02E9 ) )
    {
        self._id_02E9._id_50D7 = 0;
        _id_A4F0::_id_5920( self._id_02E9._id_04A8 );
    }

    var_0 = spawnstruct();
    var_0._id_5791 = self._id_6860;
    var_0._id_31BA = "carried";
    var_0._id_2662 = ::_id_9979;
    thread _id_A747::_id_45BC( var_0 );
    self _meth_809A( "sentry_gun_deploy" );
    thread _id_997E();
    self notify( "placed" );
}

_id_997F()
{
    self._id_1BAA _meth_80DE();

    if ( isdefined( self._id_02E9 ) )
        self._id_02E9._id_50D7 = 0;

    self delete();
}

_id_9980( var_0 )
{
    _id_7FAE();
    self _meth_82C0( 0 );
    self _meth_8104( var_0 );
    self _meth_80BE( 0 );
    self _meth_813A();
    self _meth_804F();
    self._id_1BAA = var_0;
    var_0._id_50D7 = 1;
    var_0 thread _id_9B89( self );
    thread _id_9973( var_0 );
    thread _id_9974( var_0 );
    thread _id_9972( var_0 );
    thread _id_9975();
    self _meth_815A( -89.0 );
    _id_9981();
    self notify( "carried" );
}

_id_9B89( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "placed" );
    var_0 endon( "death" );
    var_0._id_1AAE = 1;
    var_0._id_6860 = undefined;
    var_1 = -1;

    for (;;)
    {
        var_2 = self _meth_82D2( 1 );
        var_0._id_02E6 = var_2["origin"];
        var_0._id_0041 = var_2["angles"];
        var_0._id_1AAE = self _meth_8341() && var_2["result"] && ( abs( var_0._id_02E6[2] - self._id_02E6[2] ) < 10 && !var_0 _id_51D5() );

        if ( isdefined( var_2["entity"] ) )
            var_0._id_6860 = var_2["entity"];
        else
            var_0._id_6860 = undefined;

        if ( var_0._id_1AAE != var_1 )
        {
            if ( var_0._id_1AAE )
            {
                var_0 _id_7FAE();
                self _meth_80DD( level._id_99B4[var_0._id_99BD]._id_6865 );
            }
            else
            {
                var_0 _id_7FAD();
                self _meth_80DD( level._id_99B4[var_0._id_99BD]._id_1AD4 );
            }
        }

        var_1 = var_0._id_1AAE;
        wait 0.05;
    }
}

_id_51D5()
{
    if ( !isdefined( level._id_A284 ) )
        return 0;
    else
    {
        foreach ( var_1 in level._id_A284 )
        {
            if ( self _meth_80A9( var_1 ) )
                return 1;
        }
    }

    return 0;
}

_id_9973( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    self endon( "ripped" );
    var_0 waittill( "death" );

    if ( self._id_1AAE )
        _id_9983();
    else
    {
        if ( isdefined( self._id_02E9 ) )
            self._id_02E9._id_50D7 = 0;

        self delete();
    }
}

_id_9974( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    self endon( "ripped" );
    var_0 waittill( "disconnect" );
    self delete();
}

_id_9972( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    self endon( "ripped" );
    var_0 _id_A4F0::_id_A060( "joined_team", "joined_spectators" );
    self delete();
}

_id_9975( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    self endon( "ripped" );
    level waittill( "game_ended" );
    self delete();
}

_id_244A( var_0, var_1, var_2, var_3 )
{
    var_4 = "sentry_minigun_mp";

    if ( _id_A4F0::_id_0CE4( var_3, "sentry_energy_turret" ) )
        var_4 = "remote_energy_turret_mp";

    var_5 = spawnturret( "misc_turret", var_1._id_02E6, var_4 );
    var_5._id_0041 = var_1._id_0041;
    var_5._id_02E9 = var_1;
    var_5._id_01E7 = level._id_99B4[var_0]._id_0275;
    var_5._id_0275 = level._id_99B4[var_0]._id_0275;
    var_5._id_99BD = var_0;
    var_5._id_8F6E = 0;
    var_5._id_2A6A = 0;
    var_5._id_5D57 = var_3;
    var_5._id_4799 = _id_A4F0::_id_0CE4( var_5._id_5D57, "sentry_heavy_resistance" );
    var_5._id_0C93 = _id_A4F0::_id_0CE4( var_5._id_5D57, "sentry_anti_intrusion" );
    var_5._id_7593 = _id_A4F0::_id_0CE4( var_5._id_5D57, "sentry_rocket_turret" );
    var_5._id_32CD = _id_A4F0::_id_0CE4( var_5._id_5D57, "sentry_energy_turret" );
    var_5.disruptorturret = _id_A4F0::_id_0CE4( var_5._id_5D57, "sentry_disruptor" );
    var_5._id_7555 = _id_A4F0::_id_0CE4( var_5._id_5D57, "sentry_rippable" );
    var_5._id_5199 = _id_A4F0::_id_0CE4( var_5._id_5D57, "sentry_guardian" );
    var_5._id_50A1 = _id_A4F0::_id_0CE4( var_5._id_5D57, "sentry_360" );
    var_5._id_051C = var_4;
    var_5 _id_7FAB();

    if ( var_5._id_7593 )
    {
        var_5 _meth_815C();
        var_5._id_051C = "killstreakmahem_mp";
    }

    if ( var_5._id_7593 || var_5._id_32CD || var_5.disruptorturret )
        var_5 _meth_8424( 0 );

    var_5 _meth_817A( 1 );
    var_5 _id_9981();
    var_5 _meth_8103( var_1 );
    var_5 _meth_8105( 1, var_0 );

    if ( var_5.disruptorturret )
    {
        var_5 _meth_8156( 0 );
        var_5 _meth_8155( 0 );
    }
    else if ( var_5._id_50A1 )
    {
        var_5 _meth_8156( 180 );
        var_5 _meth_8155( 180 );
    }
    else
    {
        var_5 _meth_8156( 80 );
        var_5 _meth_8155( 80 );
    }

    var_5 _meth_8157( 50 );
    var_5 _meth_8158( 30 );
    var_5 _meth_815A( -89.0 );
    var_5 thread _id_995A();
    var_1._id_9938 = var_5;
    var_5._id_259B = 1.0;
    var_5 thread _id_9965();
    var_5 thread _id_7CA2();
    return var_5;
}

_id_997E()
{
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self _meth_80C0();
    self _meth_8136();

    if ( !isdefined( self._id_02E9 ) )
        return;

    var_0 = self._id_02E9;
    level._id_99B3[self _meth_81B1()] = self;

    if ( isdefined( var_0._id_7327 ) )
    {
        foreach ( var_2 in var_0._id_7327 )
            var_2 notify( "death" );
    }

    var_0._id_7327 = [];
    var_0._id_7327[0] = self;

    if ( !self.disruptorturret )
    {
        if ( !isdefined( self._id_7321 ) )
        {
            self._id_7321 = spawn( "script_model", self._id_02E6 + ( 0, 0, 1 ) );
            self._id_7321 _meth_80B1( "tag_origin" );
            self._id_7321._id_02E9 = var_0;
            self._id_7321 _id_A75A::_id_5940( "killstreakRemote", level._id_99B4[self._id_99BD]._id_4901, var_0 );
        }
        else
            self._id_7321 _id_A75A::_id_310F();
    }

    var_0._id_9C1E = 0;
    var_0._id_680E = undefined;
    var_0._id_32F5 = undefined;
    var_0 thread _id_A23C( self );

    if ( level._id_91E4 )
    {
        self._id_04A8 = var_0._id_04A8;
        self _meth_8135( var_0._id_04A8 );
        _id_A72D::_id_8022( self._id_04A8, ( 0, 0, 65 ), "tag_origin" );
    }
    else
        _id_A72D::_id_7FDF( self._id_02E9, ( 0, 0, 65 ), "tag_origin" );

    self._id_6638 = spawn( "trigger_radius", self._id_02E6 + ( 0, 0, 1 ), 0, 32, 64 );
    self._id_6811 = spawn( "script_model", self._id_02E6 + ( 0, 0, 1 ) );
    self._id_6811 _meth_80B1( "tag_origin" );
    self._id_6811._id_02E9 = var_0;
    var_0 thread _id_6B3B( self );
    var_0 thread _id_6B3A( self );

    if ( self._id_7555 )
        var_0 thread _id_6B3C( self );

    if ( !self.disruptorturret )
        thread _id_A20D();

    thread _id_9958();
    thread _id_A783::_id_7F5F( self._id_0275, undefined, ::_id_64F0, ::_id_996B, 1 );
    thread _id_9992();
    thread _id_9955();
    thread _id_999A();

    if ( !self._id_4799 )
        thread _id_9999();

    if ( self._id_0C93 )
        thread _id_9946();

    thread _id_995C();
    thread _id_9959();

    if ( isdefined( level._id_511A ) && level._id_511A )
        thread turret_hordeshootdronesandturrets();
}

_id_4664( var_0, var_1, var_2 )
{
    if ( _id_A75A::_id_514D( var_1 ) )
    {
        var_3 = self._id_0275 + 1;

        if ( var_3 > var_2 )
            return var_3;
    }

    return var_2;
}

_id_996B( var_0, var_1, var_2, var_3 )
{
    var_4 = var_3;
    var_4 = _id_4664( var_1, var_2, var_4 );
    var_4 = _id_A783::_id_465A( var_1, var_2, var_4, var_0 );
    var_4 = _id_A783::_id_4666( var_1, var_2, var_4 );
    var_4 = _id_A783::_id_465F( var_1, var_2, var_4 );
    var_4 = _id_A783::_id_4646( var_1, var_2, var_4, var_0 );

    if ( isdefined( self._id_02E9 ) && var_4 > 0 )
    {
        self._id_02E9 _meth_80AD( "damage_heavy" );
        self._id_02E9 thread _id_A7B5::_id_6D53();
    }

    return var_4;
}

_id_64F0( var_0, var_1, var_2, var_3 )
{
    self notify( "death", var_0, var_2, var_1 );

    if ( isdefined( self._id_90FE ) && self._id_90FE != var_0 )
        self._id_90FE thread _id_A7C5::_id_6D27( self );

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( !isplayer( var_0 ) )
            var_0 = var_0._id_02E9;
    }

    _id_A783::_id_64B3( var_0, var_1, var_2, var_3, "sentry_gun_destroyed", undefined, undefined, 0 );
    self _meth_80B3();
}

_id_6D55( var_0 )
{
    self endon( "disconnect" );
    self endon( "playerHideTurretOverlay" );
    wait 0.5;
    var_1 = 0;

    if ( var_0._id_051C == "sentry_minigun_mp" )
        var_1 = 1;
    else if ( var_0._id_051C == "remote_energy_turret_mp" )
        var_1 = 2;
    else if ( var_0._id_051C == "killstreakmahem_mp" )
        var_1 = 3;

    self _meth_82FB( "ui_sentry_ammo_type", var_1 );
    self _meth_82FB( "ui_sentry_toggle", 1 );
    _id_A7B5::_id_6C96();
}

_id_6CC3()
{
    self notify( "playerHideTurretOverlay" );
    self _meth_82FB( "ui_sentry_toggle", 0 );
    _id_A7B5::_id_6C89();
}

_id_6D86( var_0 )
{
    self endon( "weapon_change" );
    self waittill( "weapon_switch_started", var_1 );

    if ( var_0 != var_1 )
        return;

    while ( self _meth_8337() )
        waittillframeend;
}

_id_8D41( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_5 = self._id_02E9;

    if ( !var_4 )
    {
        var_5 _meth_807C( self._id_7321 );
        var_5 _meth_8081();
        var_5 _id_A75A::_id_05C0( level._id_99B4[self._id_99BD]._id_54BB );
        var_5 _meth_8315( level._id_99B4[self._id_99BD]._id_54BB );
        var_5 _meth_831F();
        var_5 _meth_84BF();
        var_5 _id_6D86( level._id_99B4[self._id_99BD]._id_54BB );
        var_6 = var_5 _meth_8311();

        if ( var_6 != level._id_99B4[self._id_99BD]._id_54BB )
        {
            var_5 _id_9126( self._id_99BD );
            var_5 _meth_8320();
            var_5 _meth_84C0();
            var_5 _meth_804F();
            return 0;
        }
    }

    self._id_7320 = 1;
    _id_7CBE();
    var_5 thread _id_6C91( self, var_4 );
    var_5 waittill( "initRideKillstreak_complete", var_7 );

    if ( !var_7 )
        return 0;

    var_5 _id_A75A::_id_6D3C();
    var_5 _id_A75A::_id_8347( self._id_99BD );
    self notify( "remoteControlledUpdate" );
    self._id_534F = gettime();
    var_5 thread _id_A051( 1.0, self );

    if ( getdvarint( "camera_thirdPerson" ) )
        var_5 _id_A75A::_id_802B( 0 );

    var_5 _meth_807E( self, "tag_player", 0, var_0, var_1, var_2, var_3, 0 );
    var_5 _meth_80A0( 0 );
    var_5 _meth_80A1( 1 );
    var_5 _meth_80E8( self );

    if ( isdefined( self._id_7321 ) )
        self._id_7321 _id_A75A::_id_2B13();

    _id_9944();
    var_5 thread _id_6D55( self );

    if ( self._id_7593 )
        var_5 thread _id_6D17( self );

    if ( var_5 _id_A75A::_id_512E() )
        var_5._id_52A3._id_0037 = 0;

    thread _id_A75A::_id_6DC2( "sentry_gun_remote_view_bg", ( 0, 0, 60 ), [ var_5 ] );
    return 1;
}

_id_A051( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "thermalVisionFOFOverlayOff" );
    var_1 endon( "death" );
    wait(var_0);
    self _meth_80B8();
}

setthermaloff()
{
    self notify( "thermalVisionFOFOverlayOff" );
    self _meth_80B9();
}

_id_8F02( var_0 )
{
    if ( !isdefined( self._id_7320 ) || !self._id_7320 )
        return;

    self._id_7320 = undefined;
    self notify( "remoteControlledUpdate" );
    var_1 = self._id_02E9;
    var_1 _id_9126( self._id_99BD );
    var_1 _meth_8320();
    var_1 _meth_84C0();
    thread _id_7CA2();
    var_2 = _id_A75A::_id_3FF7( level._id_99B4[self._id_99BD]._id_8F20 );
    var_1 _id_A7C3::_id_9125( var_2 );
    var_3 = var_1 _id_A4F0::_id_3FFB();

    if ( isdefined( var_1._id_99FC ) && var_1._id_99FC )
        var_3 = var_1 _id_A75A::_id_3EC2();

    var_1 _meth_8315( var_3 );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    var_1 _meth_804F();

    if ( var_1 _id_A75A::_id_51E0() )
    {
        var_1 setthermaloff();
        var_1 _meth_80E9( self );

        if ( var_1 _id_A75A::_id_51E0() )
            var_1 _id_A75A::_id_1F0D();

        if ( getdvarint( "camera_thirdPerson" ) )
            var_1 _id_A75A::_id_802B( 1 );
    }

    if ( _id_9967() )
        var_1 _meth_8184();

    if ( !_id_9967() && var_0 && ( !isdefined( var_1._id_9C1F ) || !var_1._id_9C1F ) )
        self._id_7321 _id_A75A::_id_310F();

    if ( var_1 _id_A75A::_id_512E() )
        var_1._id_52A3._id_0037 = 1;

    var_1 _id_6CC3();
    self notify( "stop soundsentry_gun_remote_view_bg" );

    if ( isdefined( var_1._id_534A ) )
        var_1._id_534A delete();

    _id_A75A::_id_6D35();
    self notify( "exit" );
}

_id_6C91( var_0, var_1 )
{
    var_2 = "remote_turret";

    if ( var_1 )
        var_2 = "coop";

    var_3 = _id_A7C3::_id_4E00( var_2 );

    if ( !isdefined( self ) )
        return;

    if ( var_3 != "success" || var_0 _id_9967() || isdefined( var_0._id_0108 ) )
    {
        if ( var_3 != "disconnect" || var_0 _id_9967() || isdefined( var_0._id_0108 ) )
        {
            thread _id_A75A::_id_6D2C();
            var_0 _id_8F02( !var_1 );
        }

        self notify( "initRideKillstreak_complete", 0 );
        return;
    }

    self notify( "initRideKillstreak_complete", 1 );
}

_id_A23C( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "ripped" );
    self._id_9C1F = 0;

    for (;;)
    {
        if ( isalive( self ) )
            self waittill( "death" );

        if ( isdefined( var_0._id_7321 ) )
            var_0._id_7321 _id_A75A::_id_2B13();

        var_0 _id_9944();

        if ( self._id_9C1E )
            self._id_9C1F = 1;
        else
            self._id_9C1F = 0;

        self waittill( "spawned_player" );
        self._id_9C1F = 0;

        if ( isdefined( var_0._id_7321 ) )
            var_0._id_7321 _id_A75A::_id_310F();
    }
}

_id_A20D()
{
    self endon( "death" );
    self endon( "carried" );
    level endon( "game_ended" );
    var_0 = self._id_02E9;
    thread _id_A20E();

    for (;;)
    {
        if ( var_0 _id_6C10( self ) )
        {
            if ( !isdefined( var_0._id_32F5 ) || !var_0._id_32F5 )
            {
                var_0._id_32F5 = 1;
                self._id_7321 _id_A75A::_id_2B13();
            }
        }
        else if ( isdefined( var_0._id_32F5 ) && var_0._id_32F5 )
        {
            self._id_7321 _id_A75A::_id_310F();
            var_0._id_32F5 = 0;
        }

        waittillframeend;
    }
}

_id_6C10( var_0 )
{
    var_1 = self _meth_8311();
    return var_0 _id_9967() || _id_6B72( var_0 ) || isdefined( self._id_99FC ) && self._id_99FC || self._id_9C1E || var_1 == "none" || self _meth_80A9( var_0._id_6638 ) || self _meth_8068() && !self._id_9C1E || isdefined( self._id_3086 ) && self._id_3086;
}

_id_A20E()
{
    self endon( "death" );
    self endon( "carried" );
    level endon( "game_ended" );
    var_0 = self._id_02E9;
    var_1 = 50;
    var_2 = 30;
    var_3 = 80;
    var_4 = 80;

    if ( self._id_50A1 )
    {
        var_3 = 180;
        var_4 = 180;
    }

    for (;;)
    {
        _id_A0E7();
        var_0._id_9C1E = 1;
        var_5 = _id_8D41( var_3, var_4, var_1, var_2 );

        if ( var_5 )
        {
            wait 2.0;
            _id_A0E6();
            var_0._id_9C1E = 0;
            _id_8F02();
            wait 2.0;
            continue;
        }

        var_0._id_9C1E = 0;
    }
}

_id_A0E7()
{
    var_0 = self._id_02E9;

    for (;;)
    {
        self._id_7321 waittill( "trigger" );

        if ( var_0 _id_6C69( self ) )
            return;
    }
}

_id_A0E6()
{
    var_0 = self._id_02E9;

    for (;;)
    {
        var_1 = 0;

        while ( var_0 _meth_833C() )
        {
            var_1 += 0.05;

            if ( var_1 > 0.2 && var_0 _id_6C69( self ) )
                return;

            waittillframeend;
        }

        waittillframeend;
    }
}

_id_6C69( var_0 )
{
    if ( self _meth_82EE() || isdefined( self._id_9337 ) || self _meth_82EF() )
        return 0;

    if ( self _meth_8342() || !self _meth_8341() )
        return 0;

    if ( isdefined( var_0._id_6638 ) && self _meth_80A9( var_0._id_6638 ) )
        return 0;

    if ( isdefined( self._id_3086 ) && self._id_3086 )
        return 0;

    if ( isdefined( self._id_50D7 ) && self._id_50D7 )
        return 0;

    if ( isdefined( self._id_50D4 ) && self._id_50D4 )
        return 0;

    if ( !isalive( self ) )
        return 0;

    if ( !self._id_9C1E && _id_A75A::_id_51E0() )
        return 0;

    if ( self _meth_8068() && !self._id_9C1E )
        return 0;

    return 1;
}

_id_6B72( var_0 )
{
    var_1 = self _meth_8311();
    return _id_A75A::_id_512E() || _id_A75A::_id_51E0() || _id_A75A::_id_5128() || _id_A75A::_id_513A( var_1 ) && var_1 != "killstreak_remote_turret_mp" && var_1 != "sentry_minigun_mp" && var_1 != "remote_energy_turret_mp" && var_1 != level._id_99B4[var_0._id_99BD]._id_54BB && var_1 != "none" && var_1 != "turretheadmg_mp" && var_1 != "turretheadenergy_mp" && var_1 != "turretheadrocket_mp";
}

_id_6B3A( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( isbot( self ) )
        return;

    if ( !isdefined( var_0._id_6638 ) || !isdefined( var_0._id_6811 ) )
        return;

    var_0._id_6811 endon( "death" );

    for (;;)
    {
        if ( _id_6C0F( var_0 ) )
        {
            if ( !isdefined( self._id_680E ) || !self._id_680E )
            {
                self._id_680E = 1;
                var_0 _id_9944();
            }
        }
        else if ( isdefined( self._id_680E ) && self._id_680E )
        {
            var_0 thread _id_9982();
            self._id_680E = 0;
        }

        waittillframeend;
    }
}

_id_6C0F( var_0 )
{
    var_1 = self _meth_8311();
    return var_0 _id_9967() || _id_6B72( var_0 ) || isdefined( self._id_99FC ) && self._id_99FC || self._id_9C1E || var_1 == "none" || !self _meth_80A9( var_0._id_6638 ) || !_id_A75A::_id_5186( self ) || !self _meth_8341() || isdefined( var_0._id_1BAA );
}

_id_6B3B( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( isbot( self ) )
        return;

    if ( !isdefined( var_0._id_6638 ) || !isdefined( var_0._id_6811 ) )
        return;

    var_0._id_6811 endon( "death" );
    var_1 = 0;

    for (;;)
    {
        if ( _id_6B72( var_0 ) )
        {
            waittillframeend;
            continue;
        }

        if ( !self _meth_80A9( var_0._id_6638 ) )
        {
            waittillframeend;
            continue;
        }

        if ( _id_A75A::_id_5186( self ) && self _meth_80A9( var_0._id_6638 ) && !isdefined( var_0._id_1BAA ) && self _meth_8341() )
        {
            var_2 = 0;

            while ( self _meth_833C() )
            {
                if ( !_id_A75A::_id_5186( self ) )
                    break;

                if ( !self _meth_80A9( var_0._id_6638 ) )
                    break;

                if ( self _meth_82EE() || self _meth_82EF() || isdefined( self._id_9337 ) )
                    break;

                if ( self _meth_8068() || !self _meth_8341() || self _meth_8342() || _id_A75A::_id_51E0() )
                    break;

                if ( isdefined( self._id_50D7 ) && self._id_50D7 )
                    break;

                if ( isdefined( self._id_50D4 ) && self._id_50D4 )
                    break;

                if ( isdefined( self._id_3086 ) && self._id_3086 )
                    break;

                if ( isdefined( self._id_9C1E ) && self._id_9C1E )
                    break;

                if ( isdefined( self._id_1287 ) )
                    break;

                var_2 += 0.05;

                if ( var_2 > 0.75 )
                {
                    var_0 _meth_809A( "sentry_gun_pick_up" );
                    var_0 _meth_8065( level._id_99B4[var_0._id_99BD]._id_7CC3 );
                    var_0 _id_7CBE();
                    thread _id_7F32( var_0, 0 );
                    var_0 _id_9944();
                    self._id_7327 = undefined;
                    var_0._id_6811 delete();
                    var_0._id_6638 delete();
                    return;
                }

                waittillframeend;
            }
        }

        waittillframeend;
    }
}

_id_6B3C( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( isbot( self ) )
        return;

    if ( !isdefined( var_0._id_6638 ) || !isdefined( var_0._id_6811 ) )
        return;

    var_0._id_6811 endon( "death" );
    var_1 = 0;

    for (;;)
    {
        if ( _id_6B72( var_0 ) )
        {
            wait 0.05;
            continue;
        }

        if ( _id_A7CE::_id_6CBE() )
        {
            waittillframeend;
            continue;
        }

        if ( !self _meth_80A9( var_0._id_6638 ) )
        {
            wait 0.05;
            continue;
        }

        if ( _id_A75A::_id_5186( self ) && self _meth_80A9( var_0._id_6638 ) && !isdefined( var_0._id_1BAA ) && self _meth_8341() )
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

                if ( isdefined( self._id_1287 ) )
                    continue;

                var_0 _meth_8065( level._id_99B4[var_0._id_99BD]._id_7CC3 );
                var_0 _id_7CBE();
                thread _id_7FF9( var_0 );
                var_0 _id_9944();
                self._id_7327 = undefined;
                var_0._id_6811 delete();
                var_0._id_6638 delete();
                return;
            }
        }

        wait 0.05;
    }
}

_id_993F()
{
    self endon( "death" );
    self endon( "carried" );

    for (;;)
    {
        playfxontag( _id_A4F0::_id_3FA6( "antenna_light_mp" ), self, "tag_fx" );
        wait 1.0;
        stopfxontag( _id_A4F0::_id_3FA6( "antenna_light_mp" ), self, "tag_fx" );
    }
}

_id_9981()
{
    self _meth_8065( level._id_99B4[self._id_99BD]._id_7CC3 );
    _id_7CBE();

    if ( level._id_91E4 )
        _id_A72D::_id_8022( "none", ( 0, 0, 0 ) );
    else if ( isdefined( self._id_02E9 ) )
        _id_A72D::_id_7FDF( undefined, ( 0, 0, 0 ) );

    if ( !isdefined( self._id_02E9 ) )
        return;

    var_0 = self._id_02E9;
    level._id_99B3[self _meth_81B1()] = undefined;

    if ( isdefined( self._id_7321 ) )
        self._id_7321 _id_A75A::_id_2B13();

    if ( isdefined( var_0._id_9C1E ) && var_0._id_9C1E )
    {
        var_0 _meth_80B7();
        var_0 setthermaloff();
        var_0 _meth_80E9( self );
        var_0 _meth_804F();
        var_1 = var_0 _id_A4F0::_id_3FFB();

        if ( isdefined( var_0._id_99FC ) && var_0._id_99FC )
            var_1 = var_0 _id_A75A::_id_3EC2();

        var_0 _meth_8315( var_1 );

        if ( var_0 _id_A75A::_id_51E0() )
            var_0 _id_A75A::_id_1F0D();

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 _id_A75A::_id_802B( 1 );

        if ( isdefined( var_0._id_2B09 ) && var_0._id_2B09 )
        {
            if ( isdefined( level._id_511A ) && level._id_511A && isdefined( var_0._id_024D ) && var_0._id_024D )
            {
                if ( var_0._id_2B09 > 1 )
                    var_0._id_2B09--;
            }
            else
                var_0 _id_A4F0::_id_0594();
        }

        var_0 _id_9126( self._id_99BD );

        if ( var_0 _id_A75A::_id_512E() )
            var_0._id_52A3._id_0037 = 1;
    }
}

_id_995A()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "turret_handleOwner" );
    self endon( "turret_handleOwner" );
    self._id_02E9 _id_A4F0::_id_A060( "disconnect", "joined_team", "joined_spectators" );
    self notify( "death" );
}

_id_9955()
{
    self endon( "death" );
    level waittill( "game_ended" );

    if ( isdefined( self._id_02E9 ) )
        self._id_02E9 _id_6CC3();
}

_id_9992()
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( isdefined( self._id_9368 ) )
        return;

    self._id_9368 = 1;
    var_0 = level._id_99B4[self._id_99BD]._id_9364;

    if ( self.disruptorturret )
        var_0 += 30;

    self._id_02E9 _meth_82FB( "ui_sentry_lifespan", var_0 );

    while ( var_0 )
    {
        wait 1.0;
        _id_A79A::_id_A0D4();

        if ( !isdefined( self._id_1BAA ) )
            var_0 = max( 0, var_0 - 1.0 );
    }

    if ( isdefined( self._id_02E9 ) )
        self._id_02E9 _id_6CC3();

    self notify( "death" );
}

_id_9958()
{
    self endon( "carried" );
    var_0 = self _meth_81B1();
    _id_A7BA::_id_0855( var_0 );
    self waittill( "death", var_1, var_2, var_3 );
    self _meth_8108();
    _id_994B( var_1, var_3 );
    self._id_258D = undefined;
    self _meth_82C0( 0 );
    self _meth_8495( 0 );
    self _meth_813A();
    self _meth_80B3();
    self._id_0108 = 1;
    _id_A7BA::_id_73AF( var_0 );

    if ( !isdefined( self ) )
        return;

    _id_9944();
    _id_9981();
    self _meth_815A( 35 );
    self _meth_8103( undefined );
    self _meth_8105( 0 );

    if ( isdefined( self._id_7321 ) )
        self._id_7321 _id_A75A::_id_593F();

    var_4 = self._id_02E9;

    if ( isdefined( var_4 ) )
    {
        _id_8F02();
        var_4._id_9C1E = 0;
        var_4._id_9938 = undefined;
        var_4 _id_74AA();
        var_4 _id_6D2D();

        if ( var_4 _meth_8311() == "none" )
        {
            var_5 = var_4 _id_A4F0::_id_3FFB();

            if ( isdefined( var_4._id_99FC ) && var_4._id_99FC )
                var_5 = var_4 _id_A75A::_id_3EC2();

            var_4 _meth_8315( var_5 );
        }
    }

    self _meth_809A( "sentry_gun_death_exp" );

    if ( !isdefined( self._id_709A ) || !self._id_709A )
    {
        playfxontag( _id_A4F0::_id_3FA6( "sentry_explode_mp" ), self, "TAG_AIM_PIVOT" );
        wait 1.5;

        for ( var_6 = 8; var_6 > 0; var_6 -= 0.4 )
        {
            playfxontag( _id_A4F0::_id_3FA6( "sentry_smoke_mp" ), self, "tag_aim" );
            wait 0.4;
        }
    }

    self notify( "deleting" );

    if ( isdefined( self._id_9199 ) )
        self._id_9199 delete();

    if ( isdefined( self._id_6638 ) )
        self._id_6638 delete();

    if ( isdefined( self._id_6811 ) )
        self._id_6811 delete();

    if ( isdefined( self._id_7321 ) )
        self._id_7321 delete();

    if ( isdefined( self.rocketmuzzleflashent ) )
        self.rocketmuzzleflashent delete();

    _id_2669();
    self delete();
}

_id_994B( var_0, var_1 )
{
    if ( isdefined( self._id_02E9 ) && isdefined( var_0 ) && self._id_02E9 != var_0 )
        self._id_02E9 thread _id_A75A::_id_5652( "ks_sentrygun_destroyed", undefined, undefined, self._id_02E6 );
}

_id_9965()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        if ( self._id_259B < 1.0 )
        {
            self._id_259B += 0.1;
            var_0 = 1;
        }
        else if ( var_0 )
        {
            self._id_259B = 1.0;
            var_0 = 0;
        }

        wait 0.1;
    }
}

_id_9982()
{
    self notify( "turretClearPickupHints" );
    self endon( "turretClearPickupHints" );
    self._id_6811 _meth_80BF();
    self._id_6811 _meth_80DB( level._id_99B4[self._id_99BD]._id_4908 );
    self._id_6811 _meth_80DA( "HINT_NOICON" );
    self._id_6811 _meth_849B( 1 );

    if ( self._id_7555 )
    {
        for (;;)
        {
            var_0 = 0;

            if ( !var_0 && isdefined( self._id_02E9 ) && !self._id_02E9 _id_A7CE::_id_6CBE() )
            {
                self._id_6811 _meth_80DC( level._id_99B4[self._id_99BD]._id_490C );
                var_0 = 1;
            }
            else if ( var_0 )
            {
                self._id_6811 _meth_80DC( "" );
                var_0 = 0;
            }

            waittillframeend;
        }
    }
}

_id_9944()
{
    self notify( "turretClearPickupHints" );

    if ( !isdefined( self._id_6811 ) )
        return;

    self._id_6811 _meth_80C0();
    self._id_6811 _meth_80DB( "" );
    self._id_6811 _meth_80DC( "" );
    self._id_6811 _meth_849B( 0 );
}

_id_7CBE()
{
    self notify( "sentry_stop" );
}

_id_7CA2( var_0 )
{
    if ( !self._id_5199 )
        return;

    self endon( "sentry_stop" );
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "sentry_start" );
    self._id_5D59 = 0;
    self._id_4795 = 0;
    self._id_65F1 = 0;

    if ( !self._id_7593 )
        thread _id_7CAC( "sentry_minigun_mp", 4.0, 0.1 );

    self _meth_8065( level._id_99B4["mg_turret"]._id_7CC4 );
    self._id_37E2 = gettime();

    for (;;)
    {
        _id_A4F0::_id_A07E( "turretstatechange", "cooled" );

        if ( self _meth_80E4() )
        {
            thread _id_998A( var_0 );
            continue;
        }

        thread _id_998C();
    }
}

_id_998A( var_0 )
{
    if ( self._id_7593 )
        thread _id_9953();
    else
        thread _id_7CA4( var_0 );
}

_id_998C()
{
    if ( self._id_7593 )
        thread _id_998B();
    else
    {
        _id_7CBC();
        thread _id_7CA5();
    }
}

_id_6D17( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "sentry_start" );
    var_0 endon( "exit" );
    var_0._id_37E2 = gettime();

    for (;;)
    {
        self waittill( "turret_fire" );
        _id_A79A::_id_A0D4();

        if ( isdefined( level._id_4A36 ) )
            continue;

        if ( gettime() >= var_0._id_37E2 )
            var_0 thread _id_9952( 0 );
    }
}

_id_7CBF()
{
    self endon( "death" );
    self endon( "sentry_stop" );
    self _meth_809A( "sentry_gun_beep" );
    wait 0.1;
    self _meth_809A( "sentry_gun_beep" );
    wait 0.1;
    self _meth_809A( "sentry_gun_beep" );
}

_id_7CBD()
{
    self endon( "death" );
    self endon( "sentry_stop" );
    thread _id_7CBF();

    while ( self._id_5D59 < 0.05 )
    {
        self._id_5D59 += 0.1;
        wait 0.1;
    }
}

_id_7CBC()
{
    self._id_5D59 = 0;
}

_id_7CA4( var_0 )
{
    self endon( "death" );
    self endon( "sentry_stop" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    _id_7CBD();
    var_1 = weaponfiretime( "sentry_minigun_mp" );
    var_2 = 20;
    var_3 = 120;
    var_4 = 0.15;
    var_5 = 0.35;

    for (;;)
    {
        var_6 = randomintrange( var_2, var_3 + 1 );

        for ( var_7 = 0; var_7 < var_6 && !self._id_65F1; var_7++ )
        {
            if ( isdefined( var_0 ) )
                self [[ var_0 ]]();
            else
                self _meth_80EA();

            self._id_4795 += var_1;
            wait(var_1);
        }

        wait(randomfloatrange( var_4, var_5 ));
    }
}

_id_998B()
{
    self notify( "stop_shooting" );
}

_id_9953()
{
    self endon( "death" );
    self endon( "sentry_stop" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    self._id_37E2 = gettime();

    for (;;)
    {
        if ( gettime() >= self._id_37E2 )
            thread _id_9952( 1 );

        waittillframeend;
    }
}

_id_9952( var_0 )
{
    level endon( "game_ended" );
    var_1 = self _meth_8180( "tag_flash" );
    var_2 = anglestoforward( self _meth_8181( "tag_flash" ) );
    var_3 = var_1 + var_2 * 10000;
    var_1 += var_2 * 10;
    var_4 = bullettrace( var_1, var_3, 1 );
    var_5 = var_4["entity"];
    var_6 = 0;

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_6 = isdefined( var_5 ) && isdefined( var_5._id_04A8 ) && self._id_04A8 != var_5._id_04A8;
    else
        var_6 = isdefined( var_5 ) && isplayer( var_5 ) && !_func_285( self._id_02E9, var_5 );

    if ( !var_6 && var_0 )
        return;

    self _meth_80AD( "damage_heavy" );
    var_7 = magicbullet( "killstreakmahem_mp", var_1, var_3, self._id_02E9 );

    if ( var_0 )
        var_8 = 2500;
    else
        var_8 = 1250;

    self._id_37E2 = gettime() + var_8;

    if ( !var_0 )
    {
        playfxontagforclients( _id_A4F0::_id_3FA6( "sentry_rocket_muzzleflash_view" ), self, "tag_flash", self._id_02E9 );

        if ( !isdefined( self.rocketmuzzleflashent ) )
            self.rocketmuzzleflashent = spawnmuzzleflashent( self, "tag_flash", self._id_02E9 );

        playfxontag( _id_A4F0::_id_3FA6( "sentry_rocket_muzzleflash_wv" ), self.rocketmuzzleflashent, "tag_origin" );
    }
    else
        playfxontag( _id_A4F0::_id_3FA6( "sentry_rocket_muzzleflash_wv" ), self, "tag_flash" );
}

spawnmuzzleflashent( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 _meth_80B1( "tag_origin" );
    var_3 _meth_804D( var_0, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 _meth_8054();

    foreach ( var_5 in level._id_0328 )
    {
        if ( var_5 != var_2 )
            var_3 _meth_8007( var_5 );
    }

    thread onplayerconnectmuzzleflashent( var_3 );
    return var_3;
}

onplayerconnectmuzzleflashent( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_1 );
        thread onplayerspawnedmuzzleflashent( var_0, var_1 );
    }
}

onplayerspawnedmuzzleflashent( var_0, var_1 )
{
    var_0 endon( "death" );
    var_1 endon( "disconnect" );
    var_1 waittill( "spawned_player" );
    var_0 _meth_8007( var_1 );
}

_id_7CA5()
{
    self notify( "stop_shooting" );
}

_id_7CAC( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "sentry_stop" );
    var_3 = weaponfiretime( var_0 );
    var_4 = 0;
    var_5 = 0;

    for (;;)
    {
        if ( self._id_4795 != var_4 )
            wait(var_3);
        else
            self._id_4795 = max( 0, self._id_4795 - 0.05 );

        if ( self._id_4795 > var_1 )
        {
            self._id_65F1 = 1;
            self _meth_8424( 0 );
            thread _id_6DA6();

            switch ( self._id_99BD )
            {
                case "mg_turret":
                    playfxontag( _id_A4F0::_id_3FA6( "sentry_smoke_mp" ), self, "tag_aim" );
                    break;
                default:
                    break;
            }

            while ( self._id_4795 )
            {
                self._id_4795 = max( 0, self._id_4795 - var_2 );
                wait 0.1;
            }

            self _meth_8424( 1 );
            self._id_65F1 = 0;
            self notify( "not_overheated" );
        }

        var_4 = self._id_4795;
        wait 0.05;
    }
}

_id_6DA6()
{
    self endon( "death" );
    self endon( "sentry_stop" );
    self endon( "not_overheated" );
    level endon( "game_ended" );
    self notify( "playing_heat_fx" );
    self endon( "playing_heat_fx" );

    for (;;)
    {
        playfxontag( _id_A4F0::_id_3FA6( "sentry_overheat_mp" ), self, "tag_flash" );
        wait 0.3;
    }
}

_id_999A()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "emp_damage" );
    self notify( "death" );
}

_id_9999()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "concussed" );
        var_0 = 4;
        playfxontag( _id_A4F0::_id_3FA6( "sentry_stunned_mp" ), self, "tag_aim" );
        self notify( "stunned" );
        self._id_8F6E = 1;

        if ( self._id_5199 )
        {
            self _meth_815A( 35 );
            self _meth_8065( level._id_99B4[self._id_99BD]._id_7CC3 );
        }

        if ( isdefined( self._id_7320 ) && self._id_7320 )
            _id_8F02();

        _id_A79A::_id_A049( var_0 );
        stopfxontag( _id_A4F0::_id_3FA6( "sentry_stunned_mp" ), self, "tag_aim" );

        if ( self._id_5199 )
        {
            self _meth_815A( 0 );
            self _meth_8065( level._id_99B4[self._id_99BD]._id_7CC4 );
        }

        self._id_8F6E = 0;
        self notify( "stunnedDone" );
    }
}

_id_9967()
{
    return isdefined( self._id_8F6E ) && self._id_8F6E;
}

_id_9946()
{
    var_0 = spawn( "script_model", self._id_02E6 + ( 0, 0, 60 ) );
    self._id_534A = var_0;
    _id_A4F0::_id_A060( "death", "carried" );
    wait 3;
    var_0 delete();
}

_id_9959()
{
    self endon( "death" );

    if ( !self._id_5199 )
        return;

    self _meth_80B2( "mp_sentry_turret" );
    self waittill( "carried" );
    self _meth_80B3();
}

_id_995C()
{
    self endon( "carried" );
    self endon( "death" );

    if ( self._id_5199 || self.disruptorturret )
    {
        self _meth_815A( 0 );
        return;
    }
    else
        self _meth_815A( 35 );

    for (;;)
    {
        self waittill( "remoteControlledUpdate" );

        if ( isdefined( self._id_7320 ) && self._id_7320 )
        {
            self _meth_815A( 0 );
            continue;
        }

        self _meth_815A( 35 );
    }
}

turret_hordeshootdronesandturrets()
{
    self endon( "death" );
    var_0 = ( 0, 0, 40 );

    for (;;)
    {
        var_1 = 5000000;
        var_2 = undefined;

        foreach ( var_4 in level._id_392B )
        {
            var_5 = distancesquared( self._id_02E6, var_4._id_02E6 );

            if ( var_5 < var_1 )
            {
                if ( sighttracepassed( self._id_02E6 + var_0, var_4._id_02E6, 0, undefined ) )
                {
                    var_1 = var_5;
                    var_2 = var_4;
                }
            }
        }

        var_7 = undefined;

        foreach ( var_9 in level._id_49C1 )
        {
            var_5 = distancesquared( self._id_02E6, var_9._id_02E6 );

            if ( var_5 < var_1 )
            {
                if ( sighttracepassed( self._id_02E6 + var_0, var_9._id_02E6 + var_0, 0, undefined ) )
                {
                    var_1 = var_5;
                    var_7 = var_9;
                }
            }
        }

        if ( isdefined( var_7 ) )
            self _meth_8106( var_7, var_0 );
        else if ( isdefined( var_2 ) )
            self _meth_8106( var_2 );

        waittillframeend;
    }
}

_id_6C5A()
{
    self _meth_82DD( "turret_fire", "+attack" );
    self _meth_82DD( "turret_fire", "+attack_akimbo_accessible" );
    self _meth_82DD( "place_turret", "+attack" );
    self _meth_82DD( "place_turret", "+attack_akimbo_accessible" );

    if ( !isbot( self ) )
    {
        self _meth_82DD( "cancel_turret", "weapnext" );
        self _meth_82DD( "cancel_turret", "+actionslot 4" );

        if ( !level._id_2153 )
        {
            self _meth_82DD( "cancel_turret", "+actionslot 5" );
            self _meth_82DD( "cancel_turret", "+actionslot 6" );
            self _meth_82DD( "cancel_turret", "+actionslot 7" );
            self _meth_82DD( "cancel_turret", "+actionslot 8" );
        }
    }
}

_id_6D2D()
{
    self _meth_849C( "turret_fire", "+attack" );
    self _meth_849C( "turret_fire", "+attack_akimbo_accessible" );
    self _meth_849C( "place_turret", "+attack" );
    self _meth_849C( "place_turret", "+attack_akimbo_accessible" );

    if ( !isbot( self ) )
    {
        self _meth_849C( "cancel_turret", "+actionslot 4" );

        if ( !level._id_2153 )
        {
            self _meth_849C( "cancel_turret", "weapnext" );
            self _meth_849C( "cancel_turret", "+actionslot 5" );
            self _meth_849C( "cancel_turret", "+actionslot 6" );
            self _meth_849C( "cancel_turret", "+actionslot 7" );
            self _meth_849C( "cancel_turret", "+actionslot 8" );
        }
    }
}

sentry_disruptor()
{
    level endon( "game_ended" );
    self endon( "carried" );
    self endon( "death" );

    if ( !isdefined( self._id_02E9 ) || !self.disruptorturret )
        return;

    if ( isdefined( level.turretdisruptorcustomthink ) )
    {
        self thread [[ level.turretdisruptorcustomthink ]]();
        return;
    }

    if ( !isdefined( level.turretdisruptorradiussq ) )
    {
        level.turretdisruptorradiussq = 90000;
        level.turretdisruptordetectdot = 0.5;
    }

    wait 0.5;
    thread turretdisruptorvisualsaudio();
    self.radiationlist = [];

    for (;;)
    {
        var_0 = self _meth_8180( "tag_flash" );
        var_1 = anglestoforward( self _meth_8181( "tag_flash" ) );

        foreach ( var_3 in level._id_0328 )
        {
            if ( self._id_8F6E )
                continue;

            if ( var_3 == self._id_02E9 || level._id_91E4 && var_3._id_04A8 == self._id_04A8 )
                continue;

            if ( !turretdisruptorcanhurtplayer( var_3, var_0, var_1 ) )
                continue;

            if ( _id_A4F0::_id_0CE4( self.radiationlist, var_3 ) )
                continue;

            self.radiationlist = _id_A4F0::_id_0CDA( self.radiationlist, var_3 );
            thread turretdisruptorhurtplayer( var_3 );
        }

        waittillframeend;
    }
}

turretdisruptorcanhurtplayer( var_0, var_1, var_2 )
{
    if ( !isalive( var_0 ) )
        return 0;

    var_3 = var_0._id_02E6 + ( 0, 0, 30 );
    var_4 = distancesquared( var_3, var_1 );

    if ( var_4 > level.turretdisruptorradiussq )
        return 0;

    var_5 = vectornormalize( var_0._id_02E6 - self._id_02E6 );
    var_6 = vectordot( var_2, var_5 );

    if ( var_6 < level.turretdisruptordetectdot )
        return 0;

    var_7 = var_0 _meth_81D7( var_1, self );
    return var_7 > 0;
}

turretdisruptorhurtplayer( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_1 = 0.8;
    var_2 = 16;
    var_3 = gettime();
    var_4 = gettime();
    var_5 = 2;
    var_6 = 1;

    while ( var_6 )
    {
        var_7 = self _meth_8180( "tag_flash" );
        var_8 = anglestoforward( self _meth_8181( "tag_flash" ) );

        if ( self._id_8F6E )
        {
            while ( self._id_8F6E )
                waittillframeend;

            var_6 = turretdisruptorcanhurtplayer( var_0, var_7, var_8 );
            continue;
        }

        if ( gettime() >= var_4 )
        {
            var_0 _meth_8182( "mp_radiation_med", var_5 );
            var_4 = gettime() + var_5 * 1000;
        }

        if ( gettime() >= var_3 )
        {
            var_0 _meth_8051( var_2, var_7, self._id_02E9, self, "MOD_TRIGGER_HURT", "iw5_dlcgun12loot3_mp", "torso_upper" );
            var_3 = gettime() + var_1 * 1000;

            if ( isalive( var_0 ) && !var_0 _id_A75A::_id_05CB( "specialty_empimmune" ) )
                var_0 thread _id_A72C::_id_0CAB();
        }

        var_9 = var_0 _id_A4F0::_id_A099( "death", 0.05 );

        if ( !isdefined( var_9 ) || var_9 != "timeout" )
        {
            var_0 _meth_8184();
            break;
        }

        var_6 = turretdisruptorcanhurtplayer( var_0, var_7, var_8 );
    }

    if ( isdefined( var_0 ) && !isalive( var_0 ) )
        var_0 _meth_8184();

    self.radiationlist = _id_A4F0::_id_0CF6( self.radiationlist, var_0 );
}

turretdisruptorvisualsaudio()
{
    var_0 = self _meth_8181( "tag_flash" ) + ( 90, 0, 0 );
    var_1 = spawn( "script_model", self _meth_8180( "tag_flash" ) );
    var_1._id_0041 = ( var_0[0], var_0[1], 0 );
    var_1 _meth_80B1( "tag_origin" );
    playfxontag( _id_A4F0::_id_3FA6( "turret_distortion" ), var_1, "tag_origin" );
    var_1 _meth_8438( "wpn_disruptor_snap_npc" );
    var_1 _meth_8075( "wpn_disruptor_beam_hi_npc" );
    _id_A4F0::_id_A060( "death", "carried" );
    killfxontag( _id_A4F0::_id_3FA6( "turret_distortion" ), var_1, "tag_origin" );
    var_1 _meth_8438( "wpn_disruptor_off_blast_npc" );
    var_1 _meth_80AB( "wpn_disruptor_beam_hi_npc" );
    wait 0.1;
    var_1 delete();
}
