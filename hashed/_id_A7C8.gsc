// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_0606 = [];
    level._id_655A = [];
    level._id_058F["ocp_death"] = loadfx( "vfx/explosion/exo_droppod_explosion" );
    level._id_058F["ocp_midair"] = loadfx( "vfx/explosion/exo_droppod_split" );
    level._id_058F["ocp_ground_marker"] = loadfx( "vfx/unique/vfx_marker_killstreak_guide_carepackage" );
    level._id_058F["ocp_ground_marker_bad"] = loadfx( "vfx/unique/vfx_marker_killstreak_guide_carepackage_fizzle" );
    level._id_058F["ocp_exhaust"] = loadfx( "vfx/vehicle/vehicle_ocp_exhaust" );
    level._id_058F["ocp_thruster_small"] = loadfx( "vfx/vehicle/vehicle_ocp_thrusters_small" );
    level._id_058F["vfx_ocp_steam"] = loadfx( "vfx/steam/vfx_ocp_steam" );
    level._id_058F["vfx_ocp_steam2"] = loadfx( "vfx/steam/vfx_ocp_steam2" );
    level._id_058F["ocp_glow"] = loadfx( "vfx/unique/orbital_carepackage_glow" );
    level._id_5398["orbital_carepackage"] = ::_id_98A5;
    level._id_53AC["orbital_carepackage_pod_mp"] = "orbital_carepackage";
    level._id_5398["orbital_carepackage_juggernaut_exosuit"] = ::_id_98B6;
    map_restart( "orbital_care_package_open" );
    map_restart( "orbital_care_package_fan_spin" );
    level.ocp_weap_name = "orbital_carepackage_pod_mp";

    if ( !isdefined( level.missileitemclipdelay ) )
        level.missileitemclipdelay = 3.0;
}

_id_98A5( var_0, var_1 )
{
    return _id_98B5( var_0, "orbital_carepackage", var_1 );
}

_id_98B6( var_0, var_1 )
{
    return _id_98B5( var_0, "orbital_carepackage_juggernaut_exosuit", var_1 );
}

_id_98B5( var_0, var_1, var_2 )
{
    if ( _id_A4F0::_id_0CE4( var_2, "orbital_carepackage_drone" ) && _id_A75A::_id_2508() >= _id_A75A::_id_5A56() || level._id_3692 + 1 >= _id_A75A::_id_5A56() )
    {
        self _meth_826E( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    var_3 = _id_6CD7( var_1, var_2 );

    if ( !isdefined( var_3 ) || !var_3 )
        return 0;

    if ( var_1 == "orbital_carepackage" )
        _id_A7A0::_id_6FF3( "ch_streak_orbitalcare", 1 );

    return 1;
}

_id_6CD7( var_0, var_1 )
{
    var_2 = _id_A7CA::_id_6CAA( "carepackage" );
    var_3 = undefined;

    if ( isdefined( var_2 ) )
        var_3 = var_2._id_02E6;
    else if ( isdefined( level._id_511A ) && level._id_511A )
    {
        var_2 = [[ level._id_4995 ]]();
        var_3 = var_2._id_02E6;
    }
    else
    {
        thread _id_A7CA::_id_6D22( _id_A4F0::_id_3FA6( "ocp_ground_marker_bad" ) );
        self _meth_82FB( "ui_invalid_orbital_care_package", 1 );
        return 0;
    }

    var_4 = undefined;

    if ( _id_A4F0::_id_0CE4( var_1, "orbital_carepackage_drone" ) )
    {
        var_4 = spawnhelicopter( self, var_3 + ( 0, 0, 200 ), ( 0, 0, 0 ), "orbital_carepackage_drone_mp", "orbital_carepackage_pod_01_vehicle" );

        if ( !isdefined( var_4 ) )
            return 0;

        var_4 _meth_8054();
    }

    var_5 = _id_37E1( level.ocp_weap_name, self, var_2, var_0, var_1, var_4, undefined, undefined, 1 );
    return isdefined( var_5 );
}

_id_37E1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_6 ) )
        var_6 = var_1 _id_A7CA::_id_6CA9( var_2, "carepackage" );

    var_9 = var_2._id_02E6;

    if ( !isdefined( var_7 ) )
        var_7 = [];

    var_10 = magicbullet( var_0, var_6, var_9, var_1, 0, 1 );

    if ( !isdefined( var_10 ) )
        return;

    var_10 thread _id_7FA6( level.missileitemclipdelay );

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
        var_10 thread _id_96A7( var_1 );

    var_11 = var_1 _id_2432( var_10 );
    var_11._id_8F20 = var_3;
    var_11._id_5D57 = var_4;
    var_11._id_2F8D = var_2._id_02E6;
    var_11._id_2E19 = var_5;
    var_11._id_41DF = var_8;
    var_10._id_04A8 = var_1._id_04A8;
    var_10._id_02E9 = var_1;
    var_10._id_04D8 = "remote";
    return _id_5E4C( var_1, var_10, var_11, var_3, var_7, var_0 );
}

_id_96A7( var_0 )
{
    self endon( "death" );
    var_1 = self._id_02E6;

    while ( isdefined( self ) )
    {
        if ( !level._id_91E4 )
            _id_1B45( 10000, self._id_02E6, var_1, 30, undefined, var_0 );
        else
            _id_1B45( 10000, self._id_02E6, var_1, 30, level._id_65B0[var_0._id_04A8], var_0 );

        var_1 = self._id_02E6;
        wait 0.05;
    }
}

_id_1B45( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = var_2 - var_1;
    var_7 = vectornormalize( var_6 );
    var_8 = length( var_6 );
    var_9 = var_3 * var_3;

    foreach ( var_11 in level._id_1C8E )
    {
        if ( !isalive( var_11 ) )
            continue;

        if ( var_11 != var_5 && isdefined( var_4 ) && isdefined( var_11._id_04A8 ) && var_11._id_04A8 != var_4 )
            continue;

        var_12 = var_11._id_02E6 - var_1;
        var_13 = vectordot( var_12, var_7 );

        if ( var_13 > var_3 * -1 && var_13 < var_8 + var_3 )
        {
            var_14 = var_1 + var_7 * var_13;
            var_15 = distancesquared( var_14, var_11._id_02E6 );

            if ( var_15 <= var_9 )
                var_11 _meth_8051( var_0, var_14, var_5, self, "MOD_EXPLOSIVE", level.ocp_weap_name );
        }
    }
}

_id_7FA6( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self _meth_851C( 1 );
}

_id_2432( var_0 )
{
    var_1 = 0;

    if ( !isdefined( level._id_0606 ) )
        level._id_0606 = [];
    else
    {
        level._id_0606 = _id_A75A::_id_1E5D( level._id_0606 );
        var_1 = level._id_0606.size;
    }

    level._id_0606[var_1] = spawnstruct();
    level._id_0606[var_1]._id_4730 = 0;
    level._id_0606[var_1]._id_6E13 = var_0;
    level._id_0606[var_1]._id_6E13._id_0275 = 100;
    level._id_0606[var_1]._id_6E13._id_01E7 = 100;
    level._id_0606[var_1]._id_6E13._id_0102 = 0;
    level._id_0606[var_1]._id_6E13._id_517B = 1;
    level._id_0606[var_1]._id_02E9 = self;
    level._id_0606[var_1]._id_09DC = 1;
    return level._id_0606[var_1];
}

_id_756A()
{
    var_0 = self _meth_81B1();
    level._id_7591[var_0] = self;
    self waittill( "death" );

    if ( isdefined( level.orbitaldropupgrade ) && level.orbitaldropupgrade == 1 )
        _func_071( "dna_aoe_grenade_throw_zombie_mp", self._id_02E6 + ( 0, 0, 64 ), ( 0, 0, 0 ), 3.0, level._id_031D, 1 );

    level._id_7591[var_0] = undefined;

    if ( isdefined( self._id_534A ) )
    {
        self._id_534A _meth_804F();
        self._id_534A._id_02E6 += ( 0, 0, 300 );
    }
}

_id_3F6E( var_0 )
{
    switch ( var_0 )
    {
        case "orbital_carepackage_juggernaut_exosuit":
            return "orbital_carepackage_juggernaut_exosuit";
        case "airdrop_reinforcement_common":
            return "airdrop_reinforcement_common";
        case "airdrop_reinforcement_uncommon":
            return "airdrop_reinforcement_uncommon";
        case "airdrop_reinforcement_rare":
            return "airdrop_reinforcement_rare";
        case "airdrop_reinforcement_practice":
            return "airdrop_reinforcement_practice";
        case "horde_support_drop":
            return "horde_support_drop";
        default:
            return "airdrop_assault";
    }
}

_id_0AA3( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( level._id_91E4 && level._id_91E7[var_0._id_04A8] )
        return 0;

    if ( !level._id_91E4 && isdefined( level._id_308B ) && level._id_308B != var_0 )
        return 0;

    return 1;
}

_id_5E4C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3F6E( var_3 );

    if ( var_6 == "airdrop_assault" && _id_A4F0::_id_0CE4( var_2._id_5D57, "orbital_carepackage_odds" ) )
        var_6 = "airdrop_assault_odds";

    if ( isdefined( level.getcratefordroptype ) )
        var_7 = [[ level.getcratefordroptype ]]( var_6 );
    else
        var_7 = _id_A7B7::_id_3F3E( var_6 );

    thread _id_5E4D( var_0, var_1, var_2, var_6, var_7, var_5 );
    return var_7;
}

_id_5E4D( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level endon( "game_ended" );
    var_1 thread _id_756A();
    var_6 = _id_A4F0::_id_0CE4( var_2._id_5D57, "orbital_carepackage_trap" );
    var_7 = var_0 _id_A7B7::_id_23E2( var_0, var_3, var_4, var_1._id_02E6, undefined, var_6, 0 );
    var_7._id_5D58 = _id_A4F0::_id_0CE4( var_2._id_5D57, "orbital_carepackage_trap" );
    var_7._id_5D54 = _id_A4F0::_id_0CE4( var_2._id_5D57, "orbital_carepackage_hide" );
    var_7._id_5D56 = _id_A4F0::_id_0CE4( var_2._id_5D57, "orbital_carepackage_roll" );
    var_7._id_5D55 = _id_A4F0::_id_0CE4( var_2._id_5D57, "orbital_carepackage_fast_pickup" );
    var_7._id_0041 = ( 0, 0, 0 );
    var_7.en_route_in_air = 1;
    var_1._id_534A = var_7._id_534A;

    if ( var_5 == "orbital_carepackage_pod_plane_mp" )
        var_1._id_534A._id_534F = gettime();

    var_8 = _id_A4F0::_id_0CE4( var_2._id_5D57, "orbital_carepackage_drone" );
    var_9 = spawn( "script_model", var_2._id_2F8D + ( 0, 0, 5 ) );
    var_9._id_0041 = ( -90, 0, 0 );
    var_9 _meth_80B1( "tag_origin" );
    var_9 _meth_8054();
    var_9 _meth_8007( var_0 );
    playfxontag( _id_A4F0::_id_3FA6( "ocp_ground_marker" ), var_9, "tag_origin" );
    var_9 thread _id_1B9D( var_2._id_5D57, var_0 );
    _id_A7CA::_id_07DF( var_9 );

    if ( var_8 )
        var_0 thread _id_6D15( var_1, var_2, var_9, var_7 );

    var_7 _meth_804D( var_1, "tag_origin", ( 0, 0, 0 ), ( -90, 0, 0 ) );
    var_1 waittill( "death", var_10, var_11, var_12 );

    if ( isdefined( var_1 ) && !var_8 && var_1._id_02E6[2] > var_2._id_2F8D[2] && distancesquared( var_1._id_02E6, var_2._id_2F8D ) > 22500 )
    {
        if ( var_2._id_41DF )
        {
            if ( isdefined( level._id_511A ) && level._id_511A )
            {
                var_13 = [[ level._id_4995 ]]();
                _id_37E1( level.ocp_weap_name, self, var_13, "horde_support_drop", var_2._id_5D57, 0, undefined, undefined, 1 );
            }
            else if ( isdefined( var_0 ) )
                var_0 _id_6CAE( var_2 );
        }

        level thread _id_1E8A( var_2, var_7, var_9 );
        return;
    }

    if ( var_8 && _id_0AA3( var_0 ) && isdefined( var_2._id_2E19 ) )
        var_2._id_2E19 _meth_8053();
    else
    {
        earthquake( 0.4, 1, var_2._id_2F8D, 800 );
        playrumbleonposition( "artillery_rumble", var_2._id_2F8D );
    }

    killfxontag( _id_A4F0::_id_3FA6( "ocp_ground_marker" ), var_9, "tag_origin" );
    var_2._id_09DC = 0;

    if ( var_8 && _id_0AA3( var_0 ) && isdefined( var_2._id_2E19 ) )
    {
        var_2._id_2E19 waittill( "delivered" );
        var_7 _meth_80BE( var_7._id_63C4 );
        var_7._id_63C4 = undefined;
    }

    var_9 thread _id_1B8E( var_7 );
    var_7 _meth_8278( level._id_0996 );
    var_7._id_2F75 = 1;
    var_7 _meth_804F();
    var_7 _meth_8276( ( 0, 0, 0 ) );
    var_7 thread _id_2374();
    var_7 thread _id_655D( var_3, var_4, var_0 );
    level thread _id_73D1( var_7, var_2 );
    var_7.en_route_in_air = 0;
}

_id_2376( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = getnodesinradiussorted( self._id_02E6, 300, 0, 300 );

    foreach ( var_3 in level._id_1C8E )
    {
        if ( !isalive( var_3 ) )
            continue;

        if ( _func_285( var_3, var_0 ) )
        {
            if ( var_3 _meth_80A9( self ) )
            {
                foreach ( var_5 in var_1 )
                {
                    if ( distancesquared( var_5._id_02E6, self._id_02E6 ) > 10000 )
                    {
                        var_3 _meth_8338( var_5._id_02E6, 1 );
                        var_1 = _id_A4F0::_id_0CF6( var_1, var_5 );
                        break;
                    }
                }
            }
        }
    }
}

_id_2374()
{
    self endon( "physics_finished" );
    self endon( "death" );
    var_0 = 4;
    var_1 = var_0 / 0.05;
    var_2 = 25;
    var_3 = 0;
    var_4 = self._id_02E6;

    for (;;)
    {
        waittillframeend;
        var_5 = distancesquared( var_4, self._id_02E6 );

        if ( var_5 < var_2 )
            var_3++;
        else
            var_3 = 0;

        var_4 = self._id_02E6;

        if ( var_3 >= var_1 )
        {
            self _meth_84E1();
            return;
        }
    }
}

_id_6CAE( var_0 )
{
    var_1 = _id_A7C3::_id_40F4( "orbital_carepackage" );
    var_2 = _id_A7C3::getnextkillstreakslotindex( "orbital_carepackage", 0 );
    thread _id_A79C::_id_53A6( "orbital_carepackage", var_1, undefined, var_0._id_5D57, var_2 );
    thread _id_A7C3::_id_41EB( "orbital_carepackage", 0, 0, self, var_0._id_5D57 );
}

_id_1E8A( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
    {
        thread _id_73D1( var_1, var_0 );
        var_1 delete();
    }

    if ( isdefined( var_0._id_2E19 ) )
        var_0._id_2E19 _id_A7BE::_id_1B94();

    if ( isdefined( var_2 ) )
    {
        if ( isdefined( var_2._id_6305 ) )
            _id_A75A::_id_0603( var_2._id_6305 );

        if ( isdefined( var_2._id_6304 ) )
            _id_A75A::_id_0603( var_2._id_6304 );

        killfxontag( _id_A4F0::_id_3FA6( "ocp_ground_marker" ), var_2, "tag_origin" );
        waittillframeend;
        var_2 delete();
    }
}

_id_655D( var_0, var_1, var_2 )
{
    self endon( "death" );
    _id_A7B7::_id_6802( var_0, var_1 );
    self _meth_809A( "orbital_pkg_panel" );

    if ( isdefined( self._id_32B4 ) )
    {
        self._id_32B4 thread _id_6559();
        self._id_32B4 _meth_82BE();
    }

    if ( isdefined( self._id_3AB6 ) )
    {
        self._id_3AB6 thread _id_6559();
        self._id_3AB6 _meth_82BE();
    }

    thread _id_2376( var_2 );
}

_id_6559( var_0 )
{
    self endon( "death" );

    if ( !isdefined( var_0 ) || !var_0 )
        wait 0.75;

    if ( isdefined( var_0 ) && var_0 )
        self _meth_8279( "orbital_care_package_open_loop" );
    else
        self _meth_8279( "orbital_care_package_open" );

    playfxontag( _id_A4F0::_id_3FA6( "ocp_glow" ), self, "TAG_ORIGIN" );

    if ( !isdefined( var_0 ) || !var_0 )
    {
        waittillframeend;
        playfxontag( _id_A4F0::_id_3FA6( "vfx_ocp_steam2" ), self, "TAG_FX_PANEL_F" );
        playfxontag( _id_A4F0::_id_3FA6( "vfx_ocp_steam2" ), self, "TAG_FX_PANEL_K" );
        waittillframeend;
        playfxontag( _id_A4F0::_id_3FA6( "vfx_ocp_steam" ), self, "TAG_FX_PANEL_FR" );
        playfxontag( _id_A4F0::_id_3FA6( "vfx_ocp_steam" ), self, "TAG_FX_PANEL_KL" );
        waittillframeend;
        playfxontag( _id_A4F0::_id_3FA6( "vfx_ocp_steam" ), self, "TAG_FX_PANEL_FL" );
        playfxontag( _id_A4F0::_id_3FA6( "vfx_ocp_steam" ), self, "TAG_FX_PANEL_KR" );
    }
}

_id_27D0( var_0 )
{
    wait 5;
    var_0 delete();
}

_id_73D1( var_0, var_1 )
{
    var_0 waittill( "death" );
    wait 15;

    for ( var_2 = 0; var_2 < level._id_0606.size; var_2++ )
    {
        if ( isdefined( level._id_0606[var_2] ) && level._id_0606[var_2] == var_1 )
        {
            if ( level._id_0606[var_2]._id_09DC == 0 )
                level._id_0606[var_2] = undefined;
        }
    }

    if ( isdefined( var_1 ) )
        var_1 = undefined;
}

_id_1B9D( var_0, var_1 )
{
    self endon( "death" );

    if ( _id_A4F0::_id_0CE4( var_0, "orbital_carepackage_hide" ) )
        return;

    var_2 = _id_A78A::_id_403F();
    objective_add( var_2, "invisible", ( 0, 0, 0 ) );
    objective_position( var_2, self._id_02E6 );
    objective_state( var_2, "active" );
    var_3 = "compass_objpoint_ammo_friendly";
    objective_icon( var_2, var_3 );

    if ( !level._id_91E4 )
        objective_playerteam( var_2, var_1 _meth_81B1() );
    else
        objective_team( var_2, var_1._id_04A8 );

    self._id_6305 = var_2;

    if ( !( isdefined( level._id_511A ) && level._id_511A ) )
    {
        var_2 = _id_A78A::_id_403F();
        objective_add( var_2, "invisible", ( 0, 0, 0 ) );
        objective_position( var_2, self._id_02E6 );
        objective_state( var_2, "active" );
        objective_icon( var_2, "compass_objpoint_ammo_enemy" );

        if ( !level._id_91E4 )
            objective_playerenemyteam( var_2, var_1 _meth_81B1() );
        else
            objective_team( var_2, level._id_65B0[var_1._id_04A8] );

        self._id_6304 = var_2;
    }

    if ( _id_A4F0::_id_0CE4( var_0, "orbital_carepackage_drone" ) )
    {
        self waittill( "linkedToDrone" );
        objective_onentity( self._id_6305, self );

        if ( isdefined( self._id_6304 ) )
        {
            objective_onentity( self._id_6304, self );
            self _meth_8053();
        }
    }
}

_id_1B8E( var_0 )
{
    var_0 _id_A4F0::_id_A060( "physics_finished", "death" );

    if ( isdefined( self._id_6305 ) )
        _id_A75A::_id_0603( self._id_6305 );

    if ( isdefined( self._id_6304 ) )
        _id_A75A::_id_0603( self._id_6304 );

    killfxontag( _id_A4F0::_id_3FA6( "ocp_glow" ), self, "TAG_ORIGIN" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_0 notify( "drop_pod_cleared" );

    waittillframeend;
    self delete();
}

_id_8304( var_0 )
{
    var_0._id_01E7 = 500;
    var_0._id_0275 = var_0._id_01E7;
    var_0._id_71E1 = 0;
    _id_8305( var_0._id_3AB6 );
    _id_8305( var_0._id_32B4 );
}

_id_8305( var_0 )
{
    var_0 thread _id_A783::_id_7F5F( 9999, undefined, undefined, ::_id_2375, 1 );
}

_id_2AFF( var_0 )
{
    _id_2B00( var_0._id_3AB6 );
    _id_2B00( var_0._id_32B4 );
}

_id_2B00( var_0 )
{
    var_0._id_258D = undefined;
    var_0 _meth_82C0( 0 );
    var_0 _meth_8495( 0 );
}

_id_2375( var_0, var_1, var_2, var_3 )
{
    var_4 = self;

    if ( isdefined( self._id_6684 ) )
        var_4 = self._id_6684;

    var_5 = _id_A783::_id_5D4C( var_0, var_1, var_2, var_3 );
    var_4._id_01E7 -= var_5;

    if ( var_4._id_01E7 <= 0 )
    {
        _id_2AFF( var_4 );
        var_4 notify( "disabled" );
    }

    return 0;
}

_id_6D15( var_0, var_1, var_2, var_3 )
{
    self endon( "disconenct" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    var_4 = 576;
    var_5 = 250000;
    var_6 = var_1._id_2F8D;
    var_7 = var_0._id_02E6;
    var_8 = distancesquared( var_7, var_6 );
    _id_8304( var_3 );
    var_9 = var_1._id_2E19;
    var_9 thread _id_1B9A( var_3 );
    var_3._id_63C4 = var_3 _meth_80BE( 0 );
    var_3._id_3AB6 _meth_82BE();
    var_3._id_32B4 _meth_82BE();

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            break;

        var_7 = var_0._id_02E6;
        var_8 = distancesquared( var_7, var_6 );

        if ( var_8 <= var_5 )
            break;

        waittillframeend;
    }

    if ( var_8 > var_5 )
    {
        if ( var_1._id_41DF && _id_0AA3( self ) )
            _id_6CAE( var_1 );

        level thread _id_1E8A( var_1, var_3, var_2 );
        return;
    }

    if ( !isdefined( self ) )
    {
        level thread _id_1E8A( var_1, var_3, var_2 );
        return;
    }

    if ( !_id_0AA3( self ) )
    {
        level thread _id_1E8A( var_3, undefined, undefined );
        return;
    }

    var_9 thread _id_1B9B();
    var_9 endon( "death" );
    var_9 _meth_827C( var_3._id_02E6, var_3._id_0041, 0, 0 );
    var_3 _meth_804D( var_9, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3._id_3AB6 _meth_8279( "orbital_care_package_fan_spin", "nothing" );
    var_3._id_32B4 _meth_8279( "orbital_care_package_fan_spin", "nothing" );
    _id_A7BE::_id_82FC( var_9, 1 );
    var_9._id_2361 = var_3;

    if ( isdefined( var_0 ) )
    {
        var_7 = var_0._id_02E6;
        var_0 notify( "death" );
        var_0 delete();
    }

    playsoundatpos( var_7, "orbital_pkg_pod_midair_exp" );
    playfx( _id_A4F0::_id_3FA6( "ocp_midair" ), var_7, getdvarvector( "scr_ocp_forward", ( 0, 0, -1 ) ) );
    var_9 thread _id_2EDE();
    var_10 = var_1._id_2F8D + ( 0, 0, 35 );
    var_9 _meth_825B( var_10, 1 );
    var_9 _meth_8284( getdvarfloat( "scr_ocp_dropspeed", 30 ), getdvarfloat( "scr_ocp_dropa", 20 ), getdvarfloat( "scr_ocp_dropd", 1 ) );
    var_9 _meth_8253( 30, 5, 5 );
    var_9 _meth_8294( 15, 15 );

    while ( distancesquared( var_9._id_02E6, var_10 ) > var_4 && var_3._id_01E7 > 0 )
        waittillframeend;

    if ( var_3._id_01E7 > 0 )
        wait 1;

    if ( var_3._id_01E7 > 0 )
    {
        var_2 _meth_804D( var_9, "tag_origin" );
        var_2 notify( "linkedToDrone" );
        var_9 thread _id_A7BE::_id_1B91();
        var_9 _id_1B98();
    }

    _id_2AFF( var_3 );
    var_3 _meth_8438( "orbital_pkg_drone_jets_off" );

    if ( isdefined( var_9 ) )
        var_9 _id_2EC7();

    var_3._id_3AB6 _meth_827A( "orbital_care_package_fan_spin", "nothing" );
    var_3._id_32B4 _meth_827A( "orbital_care_package_fan_spin", "nothing" );
    waittillframeend;

    if ( isdefined( var_9 ) )
        var_9 _id_A7BE::_id_1B90();
}

_id_1B9B()
{
    self endon( "delivered" );
    self waittill( "death" );
    self notify( "delivered" );
}

_id_1B9A( var_0 )
{
    self endon( "delivered" );
    var_0 waittill( "disabled" );
    self notify( "delivered" );
}

_id_1B98()
{
    var_0 = self._id_02E9;
    var_0 endon( "disconnect" );
    self endon( "death" );
    self endon( "delivered" );
    var_1 = 22500;
    var_2 = 1;
    var_3 = gettime();

    for (;;)
    {
        var_4 = _id_A75A::_id_5186( var_0 );

        if ( !var_4 )
        {
            var_2 = 1;
            waittillframeend;
        }

        if ( var_3 < gettime() || var_2 )
        {
            var_2 = 0;
            self _meth_83F9( var_0, ( 0, -100, 15 ) );
            var_3 = gettime() + 1000;
        }

        var_5 = distancesquared( self._id_02E6, var_0._id_02E6 + ( 0, 0, 15 ) );

        if ( var_5 < var_1 )
        {
            wait(getdvarfloat( "scr_ocp_waitDeliver", 1 ));
            self notify( "delivered" );
            return;
        }

        waittillframeend;
    }
}

_id_2EDE()
{
    self endon( "death" );
    playfxontag( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_fl" );
    playfxontag( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_fr" );
    playfxontag( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_kl" );
    playfxontag( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_kr" );
    waittillframeend;
    waittillframeend;

    if ( isdefined( self ) )
        playfxontag( _id_A4F0::_id_3FA6( "ocp_exhaust" ), self, "tag_fx" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        thread _id_2EE3( var_0 );
    }
}

_id_2EE3( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 waittill( "spawned_player" );

    if ( isdefined( var_0 ) && isdefined( self ) )
        _id_2EE2( var_0 );
}

_id_2EE2( var_0 )
{
    var_0 endon( "disconnect" );
    self endon( "death" );
    playfxontagforclients( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_fl", var_0 );
    playfxontagforclients( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_fr", var_0 );
    playfxontagforclients( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_kl", var_0 );
    playfxontagforclients( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_kr", var_0 );
    waittillframeend;
    waittillframeend;

    if ( isdefined( self ) )
        playfxontagforclients( _id_A4F0::_id_3FA6( "ocp_exhaust" ), self, "tag_fx", var_0 );
}

_id_2EC7()
{
    killfxontag( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_fl" );
    killfxontag( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_fr" );
    killfxontag( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_kl" );
    killfxontag( _id_A4F0::_id_3FA6( "ocp_thruster_small" ), self, "j_thruster_kr" );
    waittillframeend;
    waittillframeend;

    if ( isdefined( self ) )
        killfxontag( _id_A4F0::_id_3FA6( "ocp_exhaust" ), self, "tag_fx" );
}
