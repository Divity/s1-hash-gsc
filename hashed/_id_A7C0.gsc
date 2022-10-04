// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_058F["emp_grenade"] = loadfx( "vfx/explosion/emp_grenade_explosion" );
    level._id_058F["antenna_light_mp"] = loadfx( "vfx/lights/light_reconugv_antenna" );
    level._id_058F["recon_drone_marker_threat"] = loadfx( "vfx/ui/vfx_marker_drone_recon" );
    level._id_058F["recon_drone_marker_emp"] = loadfx( "vfx/ui/vfx_marker_drone_recon2" );
    level._id_058F["recond_drone_exhaust"] = loadfx( "vfx/vehicle/vehicle_mp_recon_drone_smoke" );
    level._id_99E6 = [];
    thread _id_64C5();
    level._id_5398["recon_ugv"] = ::_id_98B9;
    level._id_53AC["recon_drone_turret_mp"] = "recon_ugv";
    level._id_53AC["emp_grenade_killstreak_mp"] = "recon_ugv";
    level._id_53AC["paint_grenade_killstreak_mp"] = "recon_ugv";
    game["dialog"]["ks_recdrone_destroyed"] = "ks_recdrone_destroyed";
}

_id_3F6D()
{
    var_0 = _id_A7BF::_id_2F0A();
    return var_0;
}

_id_98B9( var_0, var_1 )
{
    if ( _id_A75A::_id_2508() >= _id_A75A::_id_5A56() || level._id_3692 + 1 >= _id_A75A::_id_5A56() )
    {
        self _meth_826E( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    _id_A75A::_id_4C3C();
    var_2 = _id_3F6D();

    if ( !var_2._id_6862 )
    {
        self _meth_826E( &"MP_DRONE_PLACEMENT_INVALID" );
        _id_A75A::_id_2760();
        return 0;
    }

    _id_A4F0::_id_0588();
    var_3 = _id_A7C3::_id_4E00( "recon_ugv" );

    if ( var_3 != "success" )
    {
        _id_A4F0::_id_0596();
        _id_A75A::_id_2760();
        return 0;
    }

    _id_A75A::_id_8347( "recon_ugv" );
    var_4 = _id_2439( var_0, var_1, var_2._id_02E6, var_2._id_0041 );
    _id_A4F0::_id_0596();
    self _meth_8315( "killstreak_predator_missile_mp" );

    if ( isdefined( var_4 ) )
    {
        _id_A744::_id_5838( "recon_ugv", self._id_02E6 );
        thread _id_A75A::_id_91F3( "used_recon_ugv", self );
        return 1;
    }
    else
    {
        _id_A75A::_id_2760();
        return 0;
    }
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D3();
    }
}

_id_64D3()
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    var_0 = spawnstruct();
    var_0._id_59AB = [];
    var_0._id_59AD = [];
    var_0._id_02E9 = self;
    var_0._id_5E7F = 0;
    level._id_99E6 = _id_A4F0::_id_0CDA( level._id_99E6, var_0 );
}

_id_2439( var_0, var_1, var_2, var_3 )
{
    var_4 = "recon_uav_mp";
    var_5 = "vehicle_atlas_aerial_drone_02_patrol_mp_static_75p";
    var_6 = spawnhelicopter( self, var_2, var_3, var_4, var_5 );

    if ( !isdefined( var_6 ) )
        return undefined;

    thread _id_6C7A( var_6, var_1, var_0 );
    var_6._id_0275 = 250;
    var_6._id_04FE = "drone_recon";
    var_6._id_9D76 = "recon_uav";
    var_6._id_59A3 = 1500;

    if ( var_6._id_472E )
        var_7 = 45.0;
    else
        var_7 = 30.0;

    var_6._id_56F5 = var_7;
    var_6._id_31C7 = gettime() + var_7 * 1000;
    var_6 thread _id_A783::_id_7F5F( var_6._id_0275, undefined, ::_id_64DA, _id_A7B5::_id_47D3, 1 );

    if ( var_6._id_4721 )
        thread _id_A7BF::_id_2EFF( var_6, var_6._id_4721 );

    _id_8D40( var_6 );
    thread _id_5ED7( var_6 );
    thread _id_5E9A( var_6 );
    thread _id_5EA8( var_6 );
    thread _id_5E9C( var_6 );
    thread _id_7275( var_6 );
    thread _id_7274( var_6 );
    thread _id_7273( var_6 );
    thread _id_7277( var_6 );
    thread _id_A7BF::playerwatchfordroneemp( var_6 );
    var_8 = spawnstruct();
    var_8._id_9C43 = 1;
    var_8._id_2662 = ::_id_6617;
    var_6 thread _id_A747::_id_45BC( var_8 );
    var_6._id_40F1 = ::_id_727D;
    return var_6;
}

_id_727D()
{
    return self _meth_8180( "tag_origin" );
}

_id_6617( var_0 )
{
    self notify( "death" );
}

_id_8324( var_0 )
{
    if ( isbot( self ) )
        return;

    self _meth_82DD( "recon_fire_main", "+attack" );
    self _meth_82DD( "recon_fire_main", "+attack_akimbo_accessible" );
    self _meth_82DD( "recon_fire_secondary", "+speed_throw" );
    self _meth_82DD( "recon_fire_secondary", "+toggleads_throw" );
    self _meth_82DD( "recon_fire_secondary", "+ads_akimbo_accessible" );

    if ( _id_A4F0::_id_0CE4( var_0, "recon_ugv_cloak" ) )
    {
        self _meth_82DD( "Cloak", "+activate" );
        self _meth_82DD( "Cloak", "+usereload" );
    }
}

_id_2B20( var_0 )
{
    if ( isbot( self ) )
        return;

    self _meth_849C( "recon_fire_main", "+attack" );
    self _meth_849C( "recon_fire_main", "+attack_akimbo_accessible" );
    self _meth_849C( "recon_fire_secondary", "+speed_throw" );
    self _meth_849C( "recon_fire_secondary", "+toggleads_throw" );
    self _meth_849C( "recon_fire_secondary", "+ads_akimbo_accessible" );

    if ( isdefined( var_0 ) && var_0._id_4721 )
    {
        self _meth_849C( "Cloak", "+activate" );
        self _meth_849C( "Cloak", "+usereload" );
    }
}

_id_6C7A( var_0, var_1, var_2 )
{
    self endon( "reconStreakComplete" );
    var_0 endon( "death" );
    self._id_9C1D = 0;
    var_0._id_56F4 = var_2;
    var_0._id_04A8 = self._id_04A8;
    var_0._id_02E9 = self;
    var_0._id_0102 = 0;
    var_0._id_28E3 = 0;
    var_0._id_3086 = 0;
    var_0._id_259B = 1.0;
    var_0._id_59AC = [];
    var_0._id_5D57 = var_1;
    var_0._id_4716 = _id_A4F0::_id_0CE4( var_0._id_5D57, "recon_ugv_ar_hud" );
    var_0._id_473A = 1;
    var_0._id_4717 = _id_A4F0::_id_0CE4( var_0._id_5D57, "recon_ugv_assist_points" );
    var_0._id_4744 = _id_A4F0::_id_0CE4( var_0._id_5D57, "recon_ugv_stun" );
    var_0._id_472E = _id_A4F0::_id_0CE4( var_0._id_5D57, "recon_ugv_increased_time" );
    var_0._id_4721 = _id_A4F0::_id_0CE4( var_0._id_5D57, "recon_ugv_cloak" );
    var_0._id_4728 = _id_A4F0::_id_0CE4( var_0._id_5D57, "recon_ugv_emp" );
    var_0 _meth_8054();
    var_0 _meth_80C0();
    var_0 _meth_8202( 23, -9, 23 );
    var_0 _meth_82C0( 1 );
    var_0 _id_A4F0::_id_5920( var_0._id_04A8 );
    _id_727C( var_0 );
    thread _id_A7BF::_id_2F27( var_0, var_0._id_4721 );
    wait 1.6;
    _id_8324( var_1 );
    thread _id_621A( var_0 );
    var_3 = "recon_drone_marker_threat";

    if ( var_0._id_4728 )
        var_3 = "recon_drone_marker_emp";

    thread _id_A7BF::_id_9B62( var_0, _id_A4F0::_id_3FA6( var_3 ), 1 );
    thread _id_A7BF::_id_6CB7( var_0, "recond_drone_exhaust", "tag_exhaust" );
    var_0._id_5BD2 _meth_8106( var_0._id_91C2 );
    thread _id_727A( var_0 );
}

_id_727C( var_0 )
{
    var_1 = "recon_drone_turret_mp";
    var_2 = "tag_turret";
    var_3 = "vehicle_atlas_aerial_drone_02_patrol_mp_turret_75p";
    var_4 = spawnturret( "misc_turret", var_0 _meth_8180( var_2 ), var_1, 0 );
    var_4._id_0041 = var_0 _meth_8181( var_2 );
    var_4 _meth_80B1( var_3 );
    var_4 _meth_815A( 45.0 );
    var_4 _meth_804D( var_0, var_2, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_4._id_02E9 = var_0._id_02E9;
    var_4._id_01E7 = 99999;
    var_4._id_0275 = 1000;
    var_4._id_0102 = 0;
    var_4._id_8F6E = 0;
    var_4._id_8F70 = 0.0;
    var_4 _meth_82C0( 0 );
    var_4 _meth_82C1( 0 );
    var_4 _meth_80C0();
    var_4._id_04A8 = var_0._id_04A8;
    var_4._id_030D["team"] = var_0._id_04A8;

    if ( level._id_91E4 )
        var_4 _meth_8135( var_0._id_04A8 );

    var_4 _meth_8065( "sentry_manual" );
    var_4 _meth_8103( var_0._id_02E9 );
    var_4 _meth_8105( 0 );
    var_4._id_1D48 = var_0;
    var_4 _meth_80BE( 0 );
    var_4._id_37E6 = spawn( "script_model", var_0 _meth_8180( var_2 ) );
    var_4._id_37E6 _meth_80B1( "tag_origin" );
    var_4._id_37E6 _meth_8446( var_0, var_2, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_4._id_37E6 _meth_80BE( 0 );
    var_4 _meth_8054();
    var_0._id_5BD2 = var_4;

    if ( var_0._id_473A )
        thread _id_37EA( var_0 );

    if ( var_0._id_4728 )
        thread _id_37D5( var_0 );
}

_id_37EA( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    var_1 = gettime();
    var_2 = 0;

    for (;;)
    {
        self waittill( "recon_fire_main" );
        self notify( "ForceUncloak" );
        var_3 = var_0._id_5BD2 _meth_8180( "tag_aim" );
        var_4 = var_0._id_91C2._id_02E6;

        if ( var_0._id_4744 && gettime() >= var_1 )
        {
            var_1 = gettime() + 6000;
            var_2 = 1;
        }

        _id_A7B5::_id_6C9C( var_0._id_5BD2._id_37E6, var_3, var_4, var_2, var_0 );
        self _meth_82FB( "ui_recondrone_paint", 2 );
        wait 2;
        self _meth_82FB( "ui_recondrone_paint", 1 );
        var_2 = 0;
    }
}

_id_37D5( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "recon_fire_secondary" );
        self notify( "ForceUncloak" );
        var_1 = var_0._id_5BD2 _meth_8180( "tag_aim" );
        var_2 = var_0._id_91C2._id_02E6;
        _id_A7B5::_id_6C9B( var_0._id_5BD2._id_37E6, var_1, var_2 );
        self _meth_82FB( "ui_recondrone_emp", 2 );
        wait 5;
        self _meth_82FB( "ui_recondrone_emp", 1 );
    }
}

_id_621A( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );

    for (;;)
    {
        var_1 = _id_A4F0::_id_A067( "recon_fire_main", "recon_fire_secondary", "Cloak" );

        if ( isdefined( var_1 ) )
            var_0 notify( var_1 );
    }
}

_id_8D40( var_0 )
{
    var_1 = self;

    if ( getdvarint( "camera_thirdPerson" ) )
        var_1 _id_A75A::_id_802B( 0 );

    var_1 _id_A75A::_id_6D3C();
    var_1 _meth_81E2( var_0, "tag_origin" );
    var_1 _meth_8206( var_0 );
    var_1 thread _id_A7BF::_id_7F56( 1.5, var_0 );
    var_1._id_9C1D = 1;

    if ( var_1 _id_A75A::_id_512E() )
        var_1._id_52A3._id_0037 = 0;
}

_id_7277( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    _id_7276( var_0 );
    wait 0.5;
    self _meth_82FB( "ui_recondrone_toggle", 1 );
    _id_A7B5::_id_6C96();
    self _meth_82FB( "ui_recondrone_countdown", var_0._id_31C7 );

    if ( var_0._id_4721 )
        self _meth_82FB( "ui_drone_cloak", 2 );

    if ( var_0._id_473A )
        self _meth_82FB( "ui_recondrone_paint", 1 );

    if ( var_0._id_4728 )
        self _meth_82FB( "ui_recondrone_emp", 1 );

    if ( var_0._id_4716 )
        self _meth_80B8();
}

_id_7276( var_0 )
{
    self _meth_82FB( "ui_recondrone_toggle", 0 );
    self _meth_82FB( "ui_recondrone_countdown", 0 );
    self _meth_82FB( "ui_drone_cloak", 0 );
    self _meth_82FB( "ui_drone_cloak_time", 0 );
    self _meth_82FB( "ui_drone_cloak_cooldown", 0 );
    self _meth_82FB( "ui_recondrone_paint", 0 );
    self _meth_82FB( "ui_recondrone_emp", 0 );
    _id_A7B5::_id_6C89();
}

_id_5ED7( var_0 )
{
    self endon( "reconStreakComplete" );
    thread _id_A7B5::_id_6CB4( var_0, "reconStreakComplete" );
    thread _id_A7B5::_id_6CB9( var_0, "reconStreakComplete" );
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
    self endon( "reconStreakComplete" );
    _id_A4F0::_id_A060( "joined_team", "joined_spectators" );
    var_0 notify( "death" );
}

_id_5E9C( var_0 )
{
    self endon( "reconStreakComplete" );
    level waittill( "game_ended" );
    var_0 notify( "death" );
}

_id_64DA( var_0, var_1, var_2, var_3 )
{
    self notify( "death", var_0, var_2, var_1 );
    _id_A783::_id_64B3( var_0, var_1, var_2, var_3, "recon_drone_destroyed", undefined, "callout_destroyed_drone_recon", 1 );
}

_id_7275( var_0 )
{
    var_0 endon( "death" );
    var_1 = 10.0;
    var_2 = 1.0;
    _id_A79A::_id_A049( var_0._id_56F5 - var_1 );

    while ( var_1 > 0 )
    {
        var_0 _meth_809A( "mp_warbird_outofbounds_warning" );
        var_1 -= var_2;
        wait(var_2);
    }

    var_0 notify( "death" );
}

_id_7274( var_0 )
{
    var_0 endon( "death" );
    _id_A79A::_id_A049( var_0._id_56F5 );
    var_0 notify( "death" );
}

_id_7273( var_0 )
{
    var_1 = var_0 _meth_81B1();
    var_0 _id_A7BF::_id_2EF4( var_1 );
    var_0 waittill( "death", var_2 );

    if ( isdefined( var_0 ) )
        var_0 _meth_8510();

    if ( isdefined( var_0._id_5BD2 ) )
        var_0._id_5BD2 _meth_8510();

    if ( isdefined( self ) )
        _id_A75A::_id_3A30( 1 );

    self notify( "reconStreakComplete" );
    self notify( "StopWaitForDisconnect" );
    var_0 _meth_809A( "assault_drn_death" );
    var_0 _id_A7BF::_id_2F17( var_1 );
    waittillframeend;
    playfxontag( level._id_058F["remote_tank_explode"], var_0, "tag_origin" );
    wait 1;
    _id_A79A::_id_A0D4();

    if ( isdefined( self ) && !level._id_3BD8 )
        _id_A75A::_id_3A30( 0 );

    if ( isdefined( self ) && isdefined( var_2 ) && self != var_2 )
        thread _id_A75A::_id_5652( "ks_recdrone_destroyed", undefined, undefined, self._id_02E6 );

    if ( isdefined( self ) && ( self._id_9C1D || _id_A75A::_id_51E0() ) )
    {
        _id_727B( var_0 );
        self._id_9C1D = 0;

        if ( _id_A75A::_id_512E() )
            self._id_52A3._id_0037 = 1;
    }

    _id_A75A::_id_2760();

    if ( isdefined( var_0._id_5BD2 ) )
    {
        if ( isdefined( var_0._id_5BD2._id_37E6 ) )
            var_0._id_5BD2._id_37E6 delete();

        var_0._id_5BD2 delete();
    }

    if ( isdefined( var_0._id_9304 ) )
        var_0._id_9304 delete();

    var_0 delete();
}

_id_727B( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = self;

    if ( isdefined( var_1._id_9C1D ) && var_1._id_9C1D )
    {
        var_1 notify( "end_remote" );
        var_1 _meth_8207( var_0 );
        var_1 _meth_80B9();
        thread _id_A7BF::_id_739C( 1.5 );
        var_1 _id_7276( var_0 );
        var_1 _id_2B20( var_0 );

        if ( var_1 _id_A75A::_id_51E0() && !level._id_3BD8 )
            var_1 _id_A75A::_id_1F0D();

        var_2 = _id_A75A::_id_3FF7( "recon_ugv" );
        var_1 _meth_830F( var_2 );
        var_1 _meth_8322();
        var_1 _meth_8315( _id_A4F0::_id_3FFB() );
        var_1 _id_A75A::_id_6D35();

        if ( getdvarint( "camera_thirdPerson" ) )
            var_1 _id_A75A::_id_802B( 1 );

        if ( isdefined( var_1._id_2B09 ) && var_1._id_2B09 )
            var_1 _id_A4F0::_id_0594();

        var_1._id_9C1D = 0;
    }
}

_id_727A( var_0 )
{
    if ( !isdefined( self ) )
        return;

    var_1 = self;
    level endon( "game_ended" );
    var_1 endon( "disconnect" );
    var_0 endon( "death" );

    for (;;)
    {
        var_2 = 0;

        while ( var_1 _meth_833C() )
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
