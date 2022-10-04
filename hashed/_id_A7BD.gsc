// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_058F["assault_c4_explode"] = loadfx( "vfx/vehicle/vehicle_assault_drone_rocket" );
    level._id_058F["remote_tank_explode"] = loadfx( "vfx/explosion/vehicle_assault_drone_death" );
    level._id_058F["c4_forward_blur"] = loadfx( "vfx/unique/forward_view_radial_blur" );
    level._id_058F["assault_drone_exhaust"] = loadfx( "vfx/vehicle/vehicle_mp_assault_drone_exhaust" );
    level._id_058F["assault_drone_thruster"] = loadfx( "vfx/vehicle/vehicle_mp_assault_drone_thruster" );
    level._id_058F["assault_drone_marker"] = loadfx( "vfx/ui/vfx_marker_drone_assault" );
    level._id_058F["assault_drone_exhaust_bottom"] = loadfx( "vfx/vehicle/vehicle_mp_assault_drone_exhaust" );
    level._id_5398["assault_ugv"] = ::_id_98A3;
    level._id_53AC["drone_assault_remote_turret_mp"] = "assault_ugv";
    level._id_53AC["ugv_missile_mp"] = "assault_ugv";
    level._id_53AC["assaultdrone_c4_mp"] = "assault_ugv";
    level._id_53AC["killstreak_terrace_mp"] = "mp_terrace";
    thread _id_A7B9::_id_0D47();
    game["dialog"]["ks_adrone_destroyed"] = "ks_adrone_destroyed";
}

_id_3F6D( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;
    var_4 = spawnstruct();
    var_4._id_6862 = 1;

    if ( _id_A4F0::_id_0CE4( var_0, "mp_terrace" ) )
    {
        var_5 = getent( "killstreak_orbit_initial", "targetname" );
        var_6 = getent( "killstreak_orbit_lookat", "targetname" );

        if ( isdefined( var_5 ) && isdefined( var_6 ) )
        {
            var_4._id_02E6 = var_5._id_02E6;
            var_4._id_0041 = vectortoangles( var_6._id_02E6 - var_5._id_02E6 );
        }
        else
        {
            var_7 = _id_A4F0::_id_40F9( "mp_terrace_killstreak_start", "targetname" );
            var_4._id_02E6 = var_7._id_02E6;
            var_4._id_0041 = var_7._id_0041;
        }
    }
    else
        var_4 = _id_A7BF::_id_2F0A();

    return var_4;
}

_id_98A3( var_0, var_1 )
{
    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( isdefined( self._id_088E ) )
            self._id_088E notify( "death" );
    }

    var_2 = 1;

    if ( _id_A75A::_id_2508() >= _id_A75A::_id_5A56() || level._id_3692 + var_2 >= _id_A75A::_id_5A56() )
    {
        self _meth_826E( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    _id_A75A::_id_4C3C();
    var_3 = _id_3F6D( var_1 );

    if ( !var_3._id_6862 )
    {
        self _meth_826E( &"MP_DRONE_PLACEMENT_INVALID" );
        _id_A75A::_id_2760();
        return 0;
    }

    var_4 = _id_A4F0::_id_0CE4( var_1, "assault_ugv_ai" );

    if ( !var_4 )
    {
        _id_A4F0::_id_0588();
        var_5 = _id_A7C3::_id_4E00( "assault_ugv" );

        if ( var_5 != "success" )
        {
            _id_A4F0::_id_0596();
            _id_A75A::_id_2760();
            return 0;
        }

        _id_A75A::_id_8347( "assault_ugv" );
    }

    var_6 = _id_23E4( var_0, var_1, var_3._id_02E6, var_3._id_0041 );

    if ( !var_4 )
    {
        _id_A4F0::_id_0596();
        self _meth_8315( "killstreak_predator_missile_mp" );
    }

    if ( isdefined( var_6 ) )
    {
        if ( _id_A4F0::_id_0CE4( var_1, "mp_terrace" ) )
        {
            _id_A744::_id_5838( "mp_terrace", self._id_02E6 );
            thread _id_A75A::_id_91F3( "used_mp_terrace", self );
        }
        else
        {
            _id_A744::_id_5838( "assault_ugv", self._id_02E6 );
            thread _id_A75A::_id_91F3( "used_assault_ugv", self );
        }

        if ( isdefined( level._id_511A ) && level._id_511A )
            self._id_088E = var_6;

        return 1;
    }
    else
        return 0;
}

_id_23E4( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_A4F0::_id_0CE4( var_1, "assault_ugv_mg" ) || _id_A4F0::_id_0CE4( var_1, "assault_ugv_rockets" ) || _id_A4F0::_id_0CE4( var_1, "mp_terrace" );
    var_5 = _id_A4F0::_id_0CE4( var_1, "mp_terrace" );
    var_6 = "assault_uav_mp";
    var_7 = 30;

    if ( var_4 )
    {
        var_6 = "mg_assault_uav_mp";
        var_7 = 45;
    }

    var_8 = "vehicle_atlas_aerial_drone_01_assult_mp_noturret_clr_50p";

    if ( !var_4 )
        var_8 = "vehicle_atlas_aerial_drone_01_patrol_mp_static_clr_01_50p";

    if ( var_5 )
    {
        var_6 = "assault_uav_mp_terrace";
        var_8 = "vehicle_sniper_drone_cloak_mp";
        var_7 = 30;
    }

    var_9 = spawnhelicopter( self, var_2, var_3, var_6, var_8 );

    if ( !isdefined( var_9 ) )
        return;

    thread _id_82FE( var_9, var_0, var_7, var_1 );
    var_9._id_40F1 = ::_id_0D37;
    return var_9;
}

_id_0D37()
{
    return self _meth_8180( "tag_origin" );
}

_id_8324( var_0 )
{
    if ( isbot( self ) )
        return;

    if ( isdefined( var_0 ) && var_0._id_4714 )
        return;

    self _meth_82DD( "FirePrimaryWeapon", "+attack" );
    self _meth_82DD( "FirePrimaryWeapon", "+attack_akimbo_accessible" );
    self _meth_82DD( "FireSecondaryWeapon", "+speed_throw" );
    self _meth_82DD( "FireSecondaryWeapon", "+toggleads_throw" );
    self _meth_82DD( "FireSecondaryWeapon", "+ads_akimbo_accessible" );

    if ( isdefined( var_0 ) && var_0._id_4721 )
    {
        self _meth_82DD( "Cloak", "+usereload" );
        self _meth_82DD( "Cloak", "+activate" );
    }
}

_id_2B20( var_0 )
{
    if ( isbot( self ) )
        return;

    if ( isdefined( var_0 ) && var_0._id_4714 )
        return;

    self _meth_849C( "FirePrimaryWeapon", "+attack" );
    self _meth_849C( "FirePrimaryWeapon", "+attack_akimbo_accessible" );
    self _meth_849C( "FireSecondaryWeapon", "+speed_throw" );
    self _meth_849C( "FireSecondaryWeapon", "+toggleads_throw" );
    self _meth_849C( "FireSecondaryWeapon", "+ads_akimbo_accessible" );

    if ( isdefined( var_0 ) && var_0._id_4721 )
    {
        self _meth_849C( "Cloak", "+usereload" );
        self _meth_849C( "Cloak", "+activate" );
    }
}

_id_82FE( var_0, var_1, var_2, var_3 )
{
    var_0 _meth_80C0();
    var_0 _meth_8202( 23, 23, 23 );
    var_0._id_56F4 = var_1;
    var_0._id_04A8 = self._id_04A8;
    var_0._id_02E9 = self;
    var_0._id_0275 = 250;
    var_0._id_28E3 = 0;
    var_0._id_04FE = "drone_assault";
    var_0 _id_A4F0::_id_5920( self._id_04A8 );
    var_0._id_5D57 = var_3;
    var_0._id_5FCF = _id_A4F0::_id_0CE4( var_3, "mp_terrace" );
    var_0._id_46C8 = _id_A4F0::_id_0CE4( var_3, "assault_ugv_hardened" );
    var_0._id_4736 = _id_A4F0::_id_0CE4( var_3, "assault_ugv_mg" ) || var_0._id_5FCF;
    var_0._id_473F = _id_A4F0::_id_0CE4( var_3, "assault_ugv_rockets" );
    var_0._id_4721 = _id_A4F0::_id_0CE4( var_3, "assault_ugv_cloak" );
    var_0._id_4714 = _id_A4F0::_id_0CE4( var_3, "assault_ugv_ai" );
    var_0._id_4716 = _id_A4F0::_id_0CE4( var_3, "assault_ugv_ar_hud" ) || var_0._id_5FCF;
    var_0._id_474A = var_0._id_4736 || var_0._id_473F;
    var_0._id_31C7 = gettime() + var_2 * 1000;

    if ( var_0._id_46C8 )
        var_0._id_0275 = int( var_0._id_0275 * 1.3 );

    if ( !var_0._id_4714 )
    {
        _id_8324( var_0 );
        thread _id_61F8( var_0 );
    }

    var_0 _meth_82C0( 1 );
    var_0._id_3086 = 0;
    var_0._id_259B = 1.0;
    var_0 thread _id_A783::_id_7F5F( var_0._id_0275, undefined, ::_id_644C, _id_A7B5::_id_47D3, 1 );
    var_0 _meth_8510();
    thread _id_A7BF::_id_2F27( var_0, var_0._id_4721 );

    if ( var_0._id_4721 )
        thread _id_A7BF::_id_2EFF( var_0, var_0._id_4721 );

    self._id_9C1D = !var_0._id_4714;
    self._id_4713 = var_0._id_4714;

    if ( !var_0._id_4714 )
    {
        _id_6D60( var_0 );
        thread _id_0D51( var_0 );
        thread _id_5ED7( var_0 );
    }
    else
        thread _id_A7B9::_id_09A1( var_0 );

    thread _id_5E9A( var_0 );
    thread _id_0D4E( var_0 );
    thread _id_5EA8( var_0 );
    thread _id_5E9C( var_0 );
    thread _id_A7BF::playerwatchfordroneemp( var_0 );

    if ( var_0._id_5FCF )
    {
        var_4 = getent( "killstreak_orbit_origin", "targetname" );
        var_5 = getent( "killstreak_orbit_initial", "targetname" );
        var_6 = getent( "killstreak_orbit_lookat", "targetname" );

        if ( isdefined( var_4 ) && isdefined( var_5 ) && isdefined( var_6 ) )
            var_0 _meth_850B( self, var_4, var_5, var_6 );
    }

    if ( !var_0._id_5FCF )
    {
        thread _id_A7BF::_id_6CB7( var_0, "assault_drone_exhaust", "TAG_EXHAUST_REAR", "assaultDroneHunterKiller" );
        thread _id_A7BF::_id_6CB7( var_0, "assault_drone_exhaust_bottom", "tag_exhaust_lt" );
        thread _id_A7BF::_id_6CB7( var_0, "assault_drone_exhaust_bottom", "tag_exhaust_rt" );
    }

    if ( !isdefined( level._id_511A ) || isdefined( level._id_511A ) && self _meth_8447( "ui_horde_player_class" ) != "drone" )
        thread _id_0D4F( var_0, var_2 );

    _id_0D55( var_0 );
    thread _id_A7BF::_id_9B62( var_0, _id_A4F0::_id_3FA6( "assault_drone_marker" ) );
    thread _id_26C3( var_0 );
    var_7 = spawnstruct();
    var_7._id_9C43 = 1;
    var_7._id_2662 = ::_id_6617;
    var_0 thread _id_A747::_id_45BC( var_7 );
    return var_0;
}

_id_6617( var_0 )
{
    self notify( "death" );
}

_id_26C3( var_0 )
{

}

_id_61F8( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );

    for (;;)
    {
        var_1 = _id_A4F0::_id_A067( "FirePrimaryWeapon", "FireSecondaryWeapon", "Cloak" );

        if ( isdefined( var_1 ) )
            var_0 notify( var_1 );
    }
}

_id_6D60( var_0 )
{
    var_1 = self;

    if ( getdvarint( "camera_thirdPerson" ) )
        var_1 _id_A75A::_id_802B( 0 );

    var_1 _id_A75A::_id_6D3C();

    if ( !var_0._id_5FCF )
        var_1 _meth_81E2( var_0, "tag_origin" );

    var_1 _meth_8206( var_0 );
    var_1 thread _id_A7BF::_id_7F56( 1.5, var_0 );
    var_1._id_9C1D = 1;
    return 1;
}

_id_0D55( var_0 )
{
    if ( var_0._id_474A )
        thread _id_89EE( var_0 );
    else
        thread _id_A00D( var_0 );

    if ( var_0._id_473F )
        thread _id_8333( var_0 );

    thread _id_0D53( var_0 );
}

_id_3F06()
{
    return 200;
}

_id_A00D( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( !var_0._id_4714 )
        thread _id_6CC5( var_0 );

    wait 2;
    var_0 waittill( "FirePrimaryWeapon" );
    self notify( "ForceUncloak" );
    _id_6C8D( var_0 );
    var_0 _meth_81D5( var_0._id_02E6 + ( 0, 0, 50 ), _id_3F06(), 200, 200, self, "MOD_EXPLOSIVE", "AssaultDrone_C4_mp" );
    playfx( _id_A4F0::_id_3FA6( "assault_c4_explode" ), var_0._id_02E6 );
    var_0 notify( "death" );
}

_id_6CC5( var_0 )
{
    foreach ( var_2 in level._id_0328 )
    {
        if ( self._id_04A8 != var_2._id_04A8 && !var_2 _id_A75A::_id_05CB( "specialty_blindeye" ) )
            var_2 _meth_8420( self, 0, 1 );
    }

    var_0 waittill( "death" );

    if ( !isdefined( self ) )
        return;

    foreach ( var_2 in level._id_0328 )
    {
        if ( self._id_04A8 != var_2._id_04A8 )
            var_2 _meth_8421( self );
    }
}

_id_64CD( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_1 );

        if ( !isdefined( self ) )
            return;

        if ( self._id_04A8 != var_1._id_04A8 )
            var_1 thread _id_64D6();
    }
}

_id_64D6( var_0 )
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );

    if ( isdefined( var_0 ) )
        self _meth_8420( var_0, 0, 1 );
}

_id_6C8D( var_0 )
{
    var_1 = 7000;
    var_2 = 22500;
    var_3 = 3600;
    self notify( "assaultDroneHunterKiller" );
    var_0._id_4B07 = 1;

    if ( var_0._id_4714 )
        var_4 = var_0._id_02E6;
    else
        var_4 = self _meth_845C( 1 );

    var_5 = var_0._id_91C2._id_02E6;
    var_6 = vectornormalize( var_5 - var_4 );
    var_5 = var_4 + var_6 * 20000;
    var_7 = bullettrace( var_4, var_5, 0, var_0, 0, 0, 1, 0, 0 );
    var_8 = var_7["position"];
    var_9 = distancesquared( var_0._id_02E6, var_8 );

    if ( var_9 > var_3 )
    {
        var_10 = undefined;

        if ( var_0._id_4714 )
        {
            var_11 = var_0._id_02E6;
            var_12 = var_0._id_0041;
        }
        else
        {
            var_11 = self _meth_845C( 1 );
            var_12 = self _meth_833B();
            var_0._id_1A2F = spawn( "script_model", var_11 );
            var_0._id_1A2F _meth_80B1( "tag_player" );
            var_0._id_1A2F._id_0041 = var_12;
            var_0._id_1A2F _meth_804D( var_0, "tag_origin" );
            waittillframeend;
            self _meth_807E( var_0._id_1A2F, "tag_player", 1, 0, 0, 0, 0, 1 );
            self _meth_80A0( 0 );
            self _meth_8207();
            earthquake( 0.2, 1, var_11, 100 );
            var_10 = _func_272( _id_A4F0::_id_3FA6( "c4_forward_blur" ), var_11, self );
            triggerfx( var_10 );
        }

        stopfxontag( _id_A4F0::_id_3FA6( "assault_drone_exhaust" ), var_0, "TAG_EXHAUST_REAR" );
        var_0 notify( "stopShootLocationUpdate" );
        var_0 _meth_8383( undefined );
        var_0 _meth_827C( var_0._id_02E6, var_0._id_0041, 0, 0 );
        waittillframeend;
        thread _id_6D23( var_0, var_8 );
        thread _id_6D24( var_0 );
        var_13 = gettime() + var_1;
        var_14 = 120;
        var_15 = var_14 * 4 / 5;
        var_0 _meth_8283( var_14, var_15 );
        var_0 _meth_825B( var_8, 0 );
        var_0._id_8D6E = 0.3;
        var_0._id_0B0E = 1;
        var_0 _meth_80BE( 0 );
        waittillframeend;
        playfxontag( _id_A4F0::_id_3FA6( "assault_drone_thruster" ), var_0, "TAG_EXHAUST_REAR" );
        var_9 = distancesquared( var_0._id_02E6, var_8 );

        while ( gettime() < var_13 && var_9 > var_2 )
        {
            waittillframeend;
            var_9 = distancesquared( var_0._id_02E6, var_8 );
            glassradiusdamage( var_0._id_02E6, 70, 200, 200 );
        }

        if ( !var_0._id_4714 )
            var_0._id_1A2F _meth_804F();

        while ( gettime() < var_13 && var_9 > var_3 )
        {
            waittillframeend;
            var_9 = distancesquared( var_0._id_02E6, var_8 );
            glassradiusdamage( var_0._id_02E6, 70, 200, 200 );
        }

        var_0 _meth_8284( 0 );

        if ( !var_0._id_4714 )
            var_10 delete();
    }
}

_id_6D24( var_0 )
{
    var_1 = spawn( "script_model", var_0._id_02E6 );
    var_1 _meth_804D( var_0, "tag_origin" );
    var_1 _meth_8054();

    foreach ( var_3 in level._id_0328 )
    {
        if ( self == var_3 )
            continue;

        var_1 _meth_8007( var_3 );
    }

    var_1 _meth_8438( "assault_drn_kamikaze_boost_npc" );
    self _meth_82F4( "assault_drn_kamikaze_boost_plr" );
    wait 2;
    var_1 delete();
}

_id_6D23( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_1 );
    var_2 _meth_80B1( "tag_origin" );
    var_2._id_0041 = ( -90, 0, 0 );
    playfxontagforclients( _id_A4F0::_id_3FA6( "assault_drone_marker" ), var_2, "tag_origin", self );
    var_0 waittill( "death" );
    stopfxontag( _id_A4F0::_id_3FA6( "assault_drone_marker" ), var_2, "tag_origin" );
    waittillframeend;
    var_2 delete();
}

_id_89EE( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    var_1 = "drone_assault_remote_turret_mp";
    var_2 = "vehicle_atlas_aerial_drone_01_mp_turret_50p";
    var_3 = 0.0;
    var_4 = "tag_origin";
    var_5 = ( 0, 0, 0 );
    var_6 = ( 0, 0, 0 );

    if ( var_0._id_5FCF )
    {
        var_1 = "killstreak_terrace_mp";
        var_2 = "vehicle_sniper_drone_turret_mp_cloak";
    }

    var_7 = var_0 _meth_8180( var_4 );
    var_8 = spawnturret( "misc_turret", var_7, var_1, 0 );
    var_8._id_0041 = var_0._id_0041;
    var_8 _meth_80B1( var_2 );
    var_8 _meth_815A( var_3 );
    var_8 _meth_804D( var_0, var_4, var_5, var_6 );
    var_8._id_02E9 = self;
    var_8._id_01E7 = 99999;
    var_8 _meth_82C0( 0 );
    var_8 _meth_82C1( 0 );
    var_8._id_9130 = var_0;
    var_8 _meth_80C0();

    if ( var_0._id_4714 )
        var_8._id_534A = var_0;

    var_0._id_5BD2 = var_8;
    var_0._id_5BD2 _meth_8065( "sentry_manual" );
    var_0._id_5BD2 _meth_8103( self );
    var_0._id_5BD2 _meth_8105( 0 );
    var_0._id_5BD2 _meth_844B();

    if ( !var_0._id_4736 )
        var_0._id_5BD2 _meth_815C();

    if ( var_0._id_5FCF )
    {
        self _meth_80FE( 0.2, 0.3, 0.8, 0.8 );
        thread _id_9290( var_0 );
    }

    if ( !var_0._id_4714 )
    {
        if ( var_0._id_5FCF )
            thread _id_217E( var_0, 0.0 );
        else
            thread _id_217E( var_0, 1.6 );
    }

    thread _id_283C( var_0 );

    if ( var_0._id_4721 && var_0._id_4736 )
        thread _id_A233( var_0 );
}

_id_217E( var_0, var_1 )
{
    var_2 = 0.0;

    if ( var_1 > 0 )
        wait(var_1);

    if ( isdefined( self ) && isdefined( var_0 ) && isdefined( var_0._id_5BD2 ) )
        self _meth_80E8( var_0._id_5BD2, var_2 );
}

_id_A233( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        var_0 waittill( "FirePrimaryWeapon" );
        self notify( "ForceUncloak" );
    }
}

_id_9290( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    waittillframeend;
    playfxontagforclients( level._id_058F["sniper_drone_thruster_view"], var_0._id_5BD2, "tag_fx2", self );
    waittillframeend;
    playfxontagforclients( level._id_058F["sniper_drone_wind_marker"], var_0._id_5BD2, "tag_fx1", self );
}

_id_283C( var_0 )
{
    var_0 waittill( "death" );

    if ( isdefined( self ) && isdefined( var_0._id_4714 ) && !var_0._id_4714 )
    {
        self _meth_80E9( var_0._id_5BD2 );
        self _meth_80B9();
    }

    if ( var_0._id_5FCF )
    {
        stopfxontag( level._id_058F["sniper_drone_thruster_view"], var_0._id_5BD2, "tag_fx2" );
        stopfxontag( level._id_058F["sniper_drone_wind_marker"], var_0._id_5BD2, "tag_fx1" );
    }

    var_0._id_5BD2 delete();
}

_id_8333( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    var_0._id_7589 = 3;

    if ( self _meth_8447( "ui_assaultdrone_toggle" ) )
        self _meth_82FB( "ui_assaultdrone_rockets", var_0._id_7589 );

    for (;;)
    {
        if ( var_0._id_4736 )
            var_0 waittill( "FireSecondaryWeapon" );
        else
            var_0 waittill( "FirePrimaryWeapon" );

        self notify( "ForceUncloak" );
        earthquake( 0.3, 1, var_0._id_02E6, 500 );
        self _meth_80AD( "damage_heavy" );
        var_1 = var_0._id_5BD2 _meth_8180( "tag_flash" );
        var_2 = var_0._id_91C2._id_02E6;

        if ( var_0._id_4714 )
            var_3 = var_0 _meth_8287();
        else
            var_3 = var_0 _meth_81B2();

        var_4 = magicbullet( "ugv_missile_mp", var_1 + var_3 / 10, var_2, self );
        var_4 _meth_81D9( var_0._id_91C2 );
        var_4 _meth_81DC();

        if ( var_0._id_4714 )
            var_4._id_534A = var_0;

        var_0._id_7589--;

        if ( var_0._id_7589 > 0 )
        {
            self _meth_82FB( "ui_assaultdrone_rockets", var_0._id_7589 );
            wait 1;
            continue;
        }

        self _meth_82FB( "ui_assaultdrone_rockets", 4 );
        wait 5;
        var_0._id_7589 = 3;
        self _meth_82FB( "ui_assaultdrone_rockets", var_0._id_7589 );
    }
}

_id_0D51( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    _id_0D50( var_0 );
    wait 0.5;
    self _meth_82FB( "ui_assaultdrone_toggle", 1 );

    if ( var_0._id_5FCF )
        self _meth_8532();

    _id_A7B5::_id_6C96();
    self _meth_82FB( "ui_assaultdrone_countdown", var_0._id_31C7 );

    if ( !var_0._id_474A )
        self _meth_82FB( "ui_assaultdrone_weapon", 2 );
    else if ( var_0._id_5FCF )
        self _meth_82FB( "ui_assaultdrone_weapon", 3 );
    else if ( var_0._id_4736 )
        self _meth_82FB( "ui_assaultdrone_weapon", 1 );

    if ( var_0._id_473F && isdefined( var_0._id_7589 ) )
        self _meth_82FB( "ui_assaultdrone_rockets", var_0._id_7589 );

    if ( var_0._id_4721 )
        self _meth_82FB( "ui_drone_cloak", 2 );

    if ( isdefined( level._id_511A ) && level._id_511A && self _meth_8447( "ui_horde_player_class" ) == "drone" )
        self _meth_82FB( "ui_horde_drone_heal", 1 );

    if ( var_0._id_4716 )
        self _meth_80B8();
}

_id_0D50( var_0 )
{
    self _meth_82FB( "ui_assaultdrone_toggle", 0 );
    self _meth_82FB( "ui_assaultdrone_countdown", 0 );
    self _meth_82FB( "ui_drone_cloak", 0 );
    self _meth_82FB( "ui_drone_cloak_time", 0 );
    self _meth_82FB( "ui_drone_cloak_cooldown", 0 );
    self _meth_82FB( "ui_assaultdrone_weapon", 0 );
    self _meth_82FB( "ui_assaultdrone_rockets", 0 );
    _id_A7B5::_id_6C89();

    if ( var_0._id_5FCF )
        self _meth_8533();
}

_id_5ED7( var_0 )
{
    self endon( "assaultStreakComplete" );

    if ( var_0._id_5FCF )
        return;

    thread _id_A7B5::_id_6CB4( var_0, "assaultStreakComplete" );
    thread _id_A7B5::_id_6CB9( var_0, "assaultStreakComplete" );
    var_0 waittill( "outOfBounds" );
    wait 2;
    var_0 notify( "death" );
}

_id_5E9A( var_0 )
{
    self endon( "StopWaitForDisconnect" );
    var_0 endon( "death" );
    self waittill( "disconnect" );
    var_0 notify( "death" );
}

_id_5EA8( var_0 )
{
    self endon( "assaultStreakComplete" );
    _id_A4F0::_id_A060( "joined_team", "joined_spectators" );
    var_0 notify( "death" );
}

_id_5E9C( var_0 )
{
    self endon( "assaultStreakComplete" );
    level waittill( "game_ended" );
    var_0 notify( "death" );
}

_id_644C( var_0, var_1, var_2, var_3 )
{
    self notify( "death", var_0, var_2, var_1 );

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( isdefined( var_0._id_511C ) && var_0._id_511C || isdefined( var_0.ishordeenemywarbird ) && var_0.ishordeenemywarbird )
            return;
    }

    if ( self._id_5FCF )
        _id_A783::_id_64B3( var_0, var_1, var_2, var_3, "map_killstreak_destroyed", undefined, "callout_destroyed_terrace_sniper_drone", 1 );
    else
        _id_A783::_id_64B3( var_0, var_1, var_2, var_3, "assault_drone_destroyed", undefined, "callout_destroyed_drone_assault", 1 );
}

_id_0D4F( var_0, var_1 )
{
    var_0 endon( "death" );
    _id_A79A::_id_A049( var_1 - 10 );
    var_2 = 10;

    while ( var_2 != 0 )
    {
        if ( !var_0._id_4714 )
            var_0 _meth_809A( "mp_warbird_outofbounds_warning" );

        var_2 -= 1;
        wait 1;
    }

    if ( isdefined( var_0._id_4B07 ) )
        return;

    var_0 notify( "death" );
}

_id_0D4E( var_0 )
{
    var_1 = var_0 _meth_81B1();
    var_0 _id_A7BF::_id_2EF4( var_1 );
    var_0 waittill( "death", var_2 );

    if ( isdefined( var_0._id_1A2F ) )
        var_0._id_1A2F _meth_804F();

    if ( isdefined( var_0 ) )
        var_0 _meth_8510();

    if ( isdefined( var_0._id_5BD2 ) )
        var_0._id_5BD2 _meth_8510();

    if ( isdefined( self ) && !var_0._id_4714 )
        _id_A75A::_id_3A30( 1 );

    self notify( "assaultStreakComplete" );
    self notify( "StopWaitForDisconnect" );
    var_0 _meth_809A( "assault_drn_death" );
    playfx( level._id_058F["remote_tank_explode"], var_0._id_02E6 );
    var_0 _id_A7BF::_id_2F17( var_1 );

    if ( isdefined( self ) && !var_0._id_474A && !var_0._id_4714 && !level._id_3BD8 )
    {
        wait 1;
        _id_A7B5::_id_6D51();
        wait 0.8;
        _id_A79A::_id_A0D4();
    }

    if ( isdefined( self ) && isdefined( var_2 ) && self != var_2 )
        thread _id_A75A::_id_5652( "ks_adrone_destroyed", undefined, undefined, self._id_02E6 );

    if ( !var_0._id_4714 )
    {
        if ( isdefined( self ) && !level._id_3BD8 )
            _id_A75A::_id_3A30( 0 );

        if ( isdefined( self ) && ( self._id_9C1D || _id_A75A::_id_51E0() ) )
        {
            _id_0D54( var_0 );
            self._id_9C1D = 0;
        }
    }
    else if ( isdefined( self ) )
        self._id_4713 = 0;

    _id_A75A::_id_2760();

    if ( isdefined( var_0._id_1A2F ) )
        var_0._id_1A2F delete();

    var_0 delete();
}

_id_0D54( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = self;

    if ( isdefined( var_1._id_9C1D ) && var_1._id_9C1D )
    {
        var_1 notify( "end_remote" );
        var_1 _meth_80FF();
        var_1 _meth_8207( var_0 );
        var_1 _meth_80B9();
        thread _id_A7BF::_id_739C( 1.5 );
        var_1 _meth_804F();

        if ( var_1 _id_A75A::_id_51E0() && !level._id_3BD8 )
            var_1 _id_A75A::_id_1F0D();

        var_1 _id_9070();
        var_1 _id_A75A::_id_6D35();
        var_1 _id_2B20( var_0 );
        thread _id_0D50( var_0 );

        if ( getdvarint( "camera_thirdPerson" ) )
            var_1 _id_A75A::_id_802B( 1 );

        if ( isdefined( var_1._id_2B09 ) && var_1._id_2B09 )
            var_1 _id_A4F0::_id_0594();

        var_1._id_9C1D = 0;
    }
}

_id_9070()
{
    var_0 = _id_A75A::_id_3FF7( "orbitalsupport" );
    self _meth_830F( var_0 );
    self _meth_8322();
    self _meth_8315( _id_A4F0::_id_3FFB() );
}

_id_0D53( var_0 )
{
    if ( !isdefined( self ) )
        return;

    var_1 = self;
    level endon( "game_ended" );
    var_1 endon( "disconnect" );
    var_1 endon( "assaultDroneHunterKiller" );
    var_0 endon( "death" );

    for (;;)
    {
        var_2 = 0;

        while ( !var_0._id_4714 && var_1 _meth_833C() )
        {
            var_2 += 0.05;

            if ( var_2 > 0.75 )
            {
                var_0 notify( "death" );
                return;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}
