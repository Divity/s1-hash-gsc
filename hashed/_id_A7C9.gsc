// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_058F["orbital_laser_clouds"] = loadfx( "vfx/unique/vfx_odin_parallax_clouds" );
    level._id_058F["orbital_laser_warmup"] = loadfx( "vfx/beam/orbital_laser_warmup" );
    level._id_058F["orbital_laser_warmup_water"] = loadfx( "vfx/beam/orbital_laser_water_boiling" );
    level._id_058F["orbital_laser_warmup_wide"] = loadfx( "vfx/beam/orbital_laser_warmup_large" );
    level._id_058F["orbital_laser_warmup_wide_water"] = loadfx( "vfx/beam/orbital_laser_water_boiling" );
    level._id_058F["orbital_laser_warmup_lightshow"] = loadfx( "vfx/beam/orbital_laser_warmup_lightshow" );
    level._id_058F["orbital_laser_warmup_lightshow_water"] = loadfx( "vfx/beam/orbital_laser_water_boiling" );
    level._id_058F["orbital_laser_warmup_lightshow_wide"] = loadfx( "vfx/beam/orbital_laser_warmup_lightshow_large" );
    level._id_058F["orbital_laser_warmup_lightshow_wide_water"] = loadfx( "vfx/beam/orbital_laser_water_boiling" );
    level._id_058F["orbital_laser_fire"] = loadfx( "vfx/beam/orbital_laser_fire_small" );
    level._id_058F["orbital_laser_fire_water"] = loadfx( "vfx/beam/orbital_laser_water_sm" );
    level._id_058F["orbital_laser_fire_wide"] = loadfx( "vfx/beam/orbital_laser_fire_large" );
    level._id_058F["orbital_laser_fire_wide_water"] = loadfx( "vfx/beam/orbital_laser_water_sm" );
    level._id_058F["orbital_laser_fire_lightshow"] = loadfx( "vfx/beam/orbital_laser_fire_lightshow" );
    level._id_058F["orbital_laser_fire_lightshow_water"] = loadfx( "vfx/beam/orbital_laser_water_sm" );
    level._id_058F["orbital_laser_fire_lightshow_wide"] = loadfx( "vfx/beam/orbital_laser_fire_lightshow_large" );
    level._id_058F["orbital_laser_fire_lightshow_wide_water"] = loadfx( "vfx/beam/orbital_laser_water_sm" );
    level._id_058F["orbital_laser_ending"] = loadfx( "vfx/beam/orbital_laser_ending" );
    level._id_058F["orbital_laser_ending_water"] = loadfx( "vfx/beam/orbital_laser_water_aftermath" );
    level._id_058F["orbital_laser_beam"] = loadfx( "vfx/beam/orbital_laser_lightbeam" );
    level._id_058F["orbital_laser_beam_wide"] = loadfx( "vfx/beam/orbital_laser_lightbeam_lg" );
    level._id_058F["orbital_laser_beam_lightshow"] = loadfx( "vfx/beam/orbital_laser_lightbeam_lightshow" );
    level._id_058F["orbital_laser_beam_lightshow_wide"] = loadfx( "vfx/beam/orbital_laser_lightbeam_lightshow_lg" );
    level._id_058F["orbital_laser_smoldering"] = loadfx( "vfx/beam/orbital_laser_smoldering" );
    level._id_058F["orbital_laser_death"] = loadfx( "vfx/beam/orbital_laser_lightbeam_burnmark" );
    level._id_0607 = [];
    level._id_0607 = spawnstruct();
    level._id_0607._id_9C76 = "orbital_laser_strike_mp";
    level._id_0607._id_4815 = "OrbitalStrike";
    level._id_0607._id_0275 = 9999999;
    level._id_5398["orbital_strike_laser"] = ::_id_98B7;
    level._id_53AC["orbital_laser_fov_mp"] = "orbital_strike_laser";

    if ( !isdefined( level._id_654F ) )
        level._id_654F = [];

    if ( level._id_91E4 )
    {
        level._id_654E = 0;
        level._id_654D = 0;
    }

    level._id_655C = spawnstruct();
    level._id_655C._id_89DC = undefined;
    level._id_655C._id_89F7 = undefined;

    if ( isdefined( level._id_655B ) )
        [[ level._id_655B ]]();
}

_id_98B7( var_0, var_1 )
{
    if ( _id_1D14() )
    {
        self _meth_826E( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    if ( _id_A75A::_id_2508() >= _id_A75A::_id_5A56() || level._id_3692 + 1 >= _id_A75A::_id_5A56() )
    {
        self _meth_826E( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    _id_A75A::_id_4C3C();
    var_2 = undefined;

    if ( level._id_91E4 )
    {
        var_2 = self._id_04A8;
        _id_7FCA( var_2, 1 );
    }

    var_3 = _id_A7C3::_id_4E00( "orbital_strike" );

    if ( var_3 != "success" )
    {
        _id_A75A::_id_2760();

        if ( level._id_91E4 )
            _id_7FCA( var_2, 0 );

        return 0;
    }

    if ( isdefined( level._id_511A ) && level._id_511A && self._id_539A == 1 )
        self notify( "used_horde_orbital" );

    _id_A75A::_id_8347( "orbital_strike" );
    var_3 = _id_8322( var_0, var_1 );
    _id_A744::_id_5838( "orbital_strike", self._id_02E6 );
    return var_3;
}

_id_1D14()
{
    if ( level._id_91E4 )
    {
        if ( self._id_04A8 == "allies" )
            return level._id_654D;
        else
            return level._id_654E;
    }
    else
        return level._id_654F.size >= 2;
}

_id_7FCA( var_0, var_1 )
{
    if ( var_0 == "allies" )
        level._id_654D = var_1;
    else
        level._id_654E = var_1;
}

orbitalstrikesetupdelay( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    waittillframeend;
    var_0 _meth_8000();
}

_id_8322( var_0, var_1 )
{
    _id_6C5A();
    var_2 = _id_3776();
    var_3 = spawnhelicopter( self, var_2._id_02E6, ( 0, 0, 0 ), level._id_0607._id_9C76, "tag_origin" );

    if ( !isdefined( var_3 ) )
        return 0;

    thread orbitalstrikesetupdelay( var_3 );
    level._id_654F = _id_A4F0::_id_0CDA( level._id_654F, var_3 );
    var_3._id_5D57 = var_1;
    var_3._id_04FE = "orbital_strike";
    var_3._id_56F4 = var_0;
    var_3._id_04A8 = self._id_030D["team"];
    var_3._id_030D["team"] = self._id_030D["team"];
    var_3._id_02E9 = self;
    var_3._id_0275 = level._id_0607._id_0275;
    var_3._id_A3C2 = ( 0, 0, 0 );
    var_3._id_91C5 = level._id_47F7;
    var_3._id_6F89 = undefined;
    var_3._id_7BF6 = undefined;
    var_3._id_0055 = undefined;
    var_3._id_1FC7 = 0;
    var_3._id_6293 = 1;

    if ( _id_A4F0::_id_0CE4( var_3._id_5D57, "orbital_strike_laser_burst1" ) )
        var_3._id_6293++;

    if ( _id_A4F0::_id_0CE4( var_3._id_5D57, "orbital_strike_laser_burst2" ) )
        var_3._id_6293++;

    var_3._id_A310 = _id_A4F0::_id_0CE4( var_3._id_5D57, "orbital_strike_laser_width" );
    var_3._id_1363 = _id_A4F0::_id_0CE4( var_3._id_5D57, "orbital_strike_laser_beam" );
    var_3._id_37D4 = 6;

    if ( _id_A4F0::_id_0CE4( var_3._id_5D57, "orbital_strike_laser_duration" ) )
        var_3._id_37D4 *= 1.5;

    self._id_2199 = 1;
    thread _id_5E8A( var_3 );
    thread _id_5E88( var_3 );
    thread _id_5E9A( var_3 );
    thread _id_5EA9( var_3 );
    thread _id_5E60( var_3 );
    thread _id_6C7C( var_3 );
    thread _id_A1F5( var_3, self );
    thread _id_64C5( var_3, self );
    return 1;
}

_id_64C5( var_0, var_1 )
{
    var_1 endon( "OrbitalStrikeStreakComplete" );
    var_1 endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "PossessHoldTimeComplete" );
    var_0 endon( "leaving" );

    for (;;)
    {
        level waittill( "connected", var_2 );
        var_2 thread _id_A01C( var_0, var_1 );
    }
}

_id_A3F5( var_0 )
{
    var_1 = spawn( "script_model", var_0._id_02E6 + ( 0, 0, 3000 ) );
    var_1._id_0041 = vectortoangles( ( 0, 0, 1 ) );
    var_1 _meth_80B1( "tag_origin" );
    var_1 thread _id_9FFC( 5 );
    var_2 = _id_A4F0::_id_0CDA( _id_A75A::_id_3E32(), self );

    foreach ( var_4 in var_2 )
    {
        var_4 _meth_82FB( "cam_scene_name", "odin_zoom_down" );
        var_4 _meth_82FB( "cam_scene_lead", var_0 _meth_81B1() );
        var_4 _meth_82FB( "cam_scene_support", var_1 _meth_81B1() );
        var_4 _meth_82F4( "vulcan_hud_transition" );
        var_4 thread _id_1FEE( var_0 );
    }
}

_id_1FEE( var_0 )
{
    level endon( "game_ended" );
    var_1 = spawn( "script_model", var_0._id_02E6 + ( 0, 0, -1000 ) );
    var_1._id_0041 = vectortoangles( ( 0, 0, 1 ) );
    var_1 _meth_80B1( "tag_origin" );
    var_1 thread _id_9FFC( 5 );
    playfxontagforclients( level._id_058F["orbital_laser_clouds"], var_1, "tag_origin", self );
}

_id_9FFC( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait(var_0);
    self delete();
}

_id_992C()
{
    self _meth_82FB( "ui_orbital_laser", 1 );
    self _meth_82FB( "ui_orbital_laser_mode", 0 );
    self _meth_82FB( "ui_orbital_laser_charge", 0 );
    self _meth_82FB( "ui_orbital_laser_bursts", 0 );
    _id_A7B5::_id_6C96();
}

_id_851C( var_0 )
{
    thread _id_070F();
    self _meth_82FB( "ui_orbital_laser_mode", 1 );
    self _meth_82FB( "ui_orbital_laser_bursts", var_0._id_6293 );
    _id_A7B5::_id_6C96();
}

_id_655F( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "OrbitalStrikeStreakComplete" );
    var_2 = gettime() + var_1 * 1000;
    self _meth_82FB( "ui_orbital_laser_charge", var_2 );
    self _meth_82FB( "ui_orbital_laser_mode", 1 );
    self _meth_80AD( "orbital_laser_charge" );
    _id_6DEA( var_0, 0 );
    wait 0.1;
    _id_6DE9( var_0 );
}

_id_655E( var_0, var_1 )
{
    var_2 = gettime() + var_1 * 1000;
    self _meth_82FB( "ui_orbital_laser_charge", var_2 );
    self _meth_80AF( "orbital_laser_charge" );
    self _meth_80AD( "orbital_laser_charge_quick" );
    _id_6DEA( var_0, 1 );
}

_id_6560( var_0 )
{
    self _meth_82FB( "ui_orbital_laser_charge", 0 );
    self _meth_80AF( "orbital_laser_charge" );
    self _meth_80AF( "orbital_laser_charge_quick" );
    self _meth_80AE( "orbital_laser_fire" );
}

_id_242F( var_0, var_1 )
{
    var_2 = gettime() + var_1 * 1000;
    thread _id_655F( var_0, var_1 );
    _id_A75A::_id_A035( var_1, "StartFire" );
    var_3 = var_2 - gettime();

    if ( var_3 > 2500 )
    {
        _id_655E( var_0, 1.1 );
        wait 1.1;
    }
    else
        _id_8F06( var_0 );

    _id_6560( var_0 );
}

_id_486F( var_0 )
{
    self _meth_82FB( "ui_orbital_laser_mode", 2 );
}

_id_7F85( var_0 )
{
    self _meth_82FB( "ui_orbital_laser_bursts", var_0._id_6293 );
}

_id_4061()
{
    if ( isdefined( level._id_655C._id_89DC ) )
        return level._id_655C._id_89DC;

    var_0 = _id_A7B5::_id_3FC1();
    var_1 = var_0._id_02E6[2] + 1024;

    if ( isdefined( level._id_099D ) && isdefined( level._id_099D._id_89DC ) )
        var_1 += level._id_099D._id_89DC;

    return var_1;
}

_id_3776()
{
    if ( !isdefined( self._id_8F4B ) )
        self._id_8F4B = spawnstruct();

    var_0 = _id_A7B5::_id_3FC1();
    var_1 = _id_4061();
    var_2 = level._id_5983;

    if ( isdefined( level._id_655C._id_89F7 ) )
        var_2 = level._id_655C._id_89F7;

    self._id_8F4B._id_02E6 = var_2 + ( 0, 0, var_1 );
    self._id_8F4B._id_0041 = ( 0, self._id_0041[1], 0 );
    return self._id_8F4B;
}

_id_5E89( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    thread _id_A7B5::_id_6CB4( var_0, "OrbitalStrikeStreakComplete" );
    var_0 waittill( "outOfBounds" );
    wait 2;
    var_0 notify( "leaving" );
}

_id_6C7C( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    thread _id_A75A::_id_3A30( 1 );
    thread _id_5E89( var_0 );
    _id_A75A::_id_6D3C();
    wait 0.45;
    thread _id_834D( 0.5 );
    _id_A3F5( var_0 );
    _id_992C();
    wait 1.5;
    _id_A7B5::_id_6D51();
    thread _id_A75A::_id_3A30( 0 );
    _id_A75A::_id_05C0( "orbital_laser_fov_mp" );
    self _meth_8315( "orbital_laser_fov_mp" );
    _id_A4F0::_id_0588();
    self _meth_804F();
    var_0 _meth_8253( 0, 0, 0 );
    var_0 _meth_8252( ( 0, 0, 0 ), 0, 0 );
    thread _id_5665( var_0 );
    thread _id_6DB6( var_0 );
    self _meth_833A( ( 0, 0, 0 ) );
    self _meth_8206( var_0 );
    wait 0.05;
    self _meth_81E2( var_0, "tag_origin" );
    wait 0.55;
    _id_A79A::_id_A0D4();
    var_0._id_534F = gettime();
    _id_851C( var_0 );
    thread _id_A2DF( var_0 );
}

_id_7FE3()
{
    if ( self _meth_817C() == "prone" )
        self _meth_817D( "crouch" );
}

_id_5665( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 endon( "death" );
    var_1 = 5;

    for (;;)
    {
        self waittill( "ToggleControlState" );
        thread _id_1ABE();
        self._id_493C = 1;

        for ( var_2 = 0; var_2 <= var_1; var_2++ )
        {
            wait 0.1;

            if ( self._id_493C == 1 && var_2 == var_1 )
            {
                var_0 notify( "PossessHoldTimeComplete" );
                continue;
            }

            if ( self._id_493C == 0 )
                break;
        }
    }
}

_id_1ABE()
{
    self endon( "OrbitalStrikeStreakComplete" );
    self endon( "PossessHoldTimeComplete" );
    self waittill( "ToggleControlCancel" );
    self._id_493C = 0;
}

_id_070F()
{
    self _meth_851A( 0 );
    self _meth_80B8();
    self _meth_82D9( 1.1, 0 );
    var_0 = 0.125;
    var_1 = 8500;
    var_2 = 0.125;
    var_3 = 5500;
    var_4 = 20;
    var_5 = 30;
    thread _id_A7B5::_id_92FD( "OrbitalStrikeStreakComplete", var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_6DB6( var_0 )
{
    var_1 = _id_A4F0::_id_0CDA( _id_A75A::_id_3E32(), self );

    if ( isdefined( var_0 ) )
        var_0 thread _id_A75A::_id_6DC2( "vulcan_interior_loop_plr", undefined, var_1 );

    _id_A4F0::_id_A060( "OrbitalStrikeStreakComplete" );

    if ( isdefined( var_0 ) )
        var_0 _id_A4F0::_id_8E9B( "vulcan_interior_loop_plr" );
}

_id_A2D5( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_1 = gettime() + var_0._id_37D4 * 1000;
    self _meth_82FB( "ui_orbital_laser_fire", var_1 );
    wait(var_0._id_37D4);
    self _meth_82FB( "ui_orbital_laser_fire", 0 );
    var_0 notify( "stop_charge" );
}

_id_3FF9( var_0 )
{
    if ( var_0._id_A310 )
        return 256;
    else
        return 128;
}

_id_A2DF( var_0 )
{
    var_1 = anglestoforward( var_0._id_0041 );
    var_2 = anglestoright( var_0._id_0041 );
    var_3 = var_0 _meth_8180( "tag_origin" ) + var_1 * 30;
    var_4 = ( 0, 0, -1 );
    var_5 = var_3 + var_4 * 5000;
    var_6 = bullettrace( var_3, var_5, 0, var_0 );
    var_7 = var_6["position"];
    var_8 = _id_3FF9( var_0 );
    var_0._id_A2D3 = spawn( "script_model", var_3 );
    var_0._id_A2D3 _meth_80B1( "generic_prop_raven" );
    var_0._id_A2D3 _meth_8446( var_0, "tag_origin" );
    var_9 = var_7;
    var_10 = vectortoangles( var_9 - var_3 );
    var_11 = spawn( "script_model", var_3 );
    var_11 _meth_80B1( "tag_origin" );
    var_11._id_0041 = var_10;
    var_11 _meth_8446( var_0._id_A2D3, "tag_origin" );
    var_0._id_A2E5 = var_11;
    var_12 = spawn( "script_model", var_9 );
    var_12._id_0041 = ( -90, 0, 0 );
    var_12 _meth_80B1( "tag_origin" );
    var_12 _meth_8383( var_11 );
    var_12 _meth_8053();
    var_0._id_A2E5._id_91C0 = var_12;

    if ( var_0._id_1363 )
    {
        var_9 = var_7 + var_1 * var_8;
        var_10 = vectortoangles( var_9 - var_3 );
        var_13 = spawn( "script_model", var_3 );
        var_13 _meth_80B1( "tag_origin" );
        var_13._id_0041 = var_10;
        var_13 _meth_8446( var_0._id_A2D3, "j_prop_1" );
        var_0._id_A2E6 = var_13;
        var_14 = spawn( "script_model", var_9 );
        var_14._id_0041 = ( -90, 0, 0 );
        var_14 _meth_80B1( "tag_origin" );
        var_14 _meth_8383( var_13 );
        var_14 _meth_8053();
        var_0._id_A2E6._id_91C0 = var_14;
        var_15 = sin( 60 ) * var_8;
        var_16 = cos( 60 ) * var_8;
        var_9 = var_7 - var_1 * var_16 + var_2 * var_15;
        var_10 = vectortoangles( var_9 - var_3 );
        var_17 = spawn( "script_model", var_3 );
        var_17 _meth_80B1( "tag_origin" );
        var_17._id_0041 = var_10;
        var_17 _meth_8446( var_0._id_A2D3, "j_prop_1" );
        var_0._id_A2E7 = var_17;
        var_18 = spawn( "script_model", var_9 );
        var_18._id_0041 = ( -90, 0, 0 );
        var_18 _meth_80B1( "tag_origin" );
        var_18 _meth_8383( var_17 );
        var_18 _meth_8053();
        var_0._id_A2E7._id_91C0 = var_18;
        var_9 = var_7 - var_1 * var_16 - var_2 * var_15;
        var_10 = vectortoangles( var_9 - var_3 );
        var_19 = spawn( "script_model", var_3 );
        var_19 _meth_80B1( "tag_origin" );
        var_19._id_0041 = var_10;
        var_19 _meth_8446( var_0._id_A2D3, "j_prop_1" );
        var_0._id_A2E8 = var_19;
        var_20 = spawn( "script_model", var_9 );
        var_20._id_0041 = ( -90, 0, 0 );
        var_20 _meth_80B1( "tag_origin" );
        var_20 _meth_8383( var_19 );
        var_20 _meth_8053();
        var_0._id_A2E8._id_91C0 = var_20;
    }

    thread _id_8A5C( var_0 );
    thread _id_5E8B( var_0 );
}

_id_2875( var_0 )
{
    if ( isdefined( var_0._id_A2E5 ) )
    {
        var_0._id_A2E5._id_91C0 delete();
        var_0._id_A2E5 delete();

        if ( var_0._id_1363 )
        {
            var_0._id_A2E6._id_91C0 delete();
            var_0._id_A2E6 delete();
            var_0._id_A2E7._id_91C0 delete();
            var_0._id_A2E7 delete();
            var_0._id_A2E8._id_91C0 delete();
            var_0._id_A2E8 delete();
        }
    }

    if ( isdefined( var_0._id_A2D3 ) )
        var_0._id_A2D3 delete();
}

_id_8A5C( var_0 )
{
    var_0._id_A2D3 _meth_8279( "mp_generic_prop_spin", "hello" );
}

_id_5E8B( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 _meth_8263();
    wait 1;
    var_1 = 6;

    while ( var_0._id_6293 > 0 )
    {
        _id_242F( var_0, var_1 );
        var_0._id_6293--;
        _id_7F85( var_0 );
        thread _id_A2D5( var_0 );
        _id_486F( var_0 );
        _id_54FF( var_0 );
        wait 0.1;
    }

    var_0 notify( "done" );
}

_id_64A0( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 5.0;

    var_2 = spawn( "script_model", self._id_02E6 );
    var_2 _meth_80B1( "tag_origin" );
    var_2 _meth_8446( self );
    var_2 _meth_809A( var_0 );
    var_2 thread _id_9FFC( var_1 );
}

_id_64A1( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 5.0;

    var_2 = spawn( "script_model", self._id_02E6 );
    var_2 _meth_80B1( "tag_origin" );
    var_2 _meth_809A( var_0 );
    var_2 thread _id_9FFC( var_1 );
}

_id_8D23( var_0 )
{
    var_0._id_6DB4 = 1;
    var_1 = _id_A4F0::_id_0CDA( _id_A75A::_id_3E32(), self );
    var_0._id_A2E5._id_91C0 thread _id_A4F0::_id_6972( "vulcan_beam_loop_npc" );
    var_0._id_A2E5._id_91C0 thread _id_A4F0::_id_6972( "vulcan_impact_loop_npc" );
    var_0._id_A2E5._id_91C0 _id_64A0( "vulcan_shot_snap_npc" );
    var_0._id_A2E5._id_91C0 _id_64A0( "vulcan_shot_tail_npc" );
    var_2 = "vulcan_std_beam_loop_plr";

    if ( var_0._id_1363 )
        var_2 = "vulcan_lshow_beam_loop_plr";
    else if ( var_0._id_A310 )
        var_2 = "vulcan_wide_beam_loop_plr";

    var_0 thread _id_A75A::_id_6DC2( "vulcan_beam_loop_plr", undefined, var_1 );
    var_0 thread _id_A75A::_id_6DC2( var_2, undefined, var_1 );
    var_3 = "vulcan_shot_snap_plr";

    if ( var_0._id_1363 )
        var_3 = "vulcan_shot_snap_lshow_plr";
    else if ( var_0._id_A310 )
        var_3 = "vulcan_shot_snap_wide_plr";

    self _meth_82F4( var_3 );
    self _meth_82F4( "vulcan_shot_tail_plr" );
}

_id_8EEF( var_0 )
{
    if ( isdefined( var_0._id_A2E5 ) )
    {
        var_0._id_A2E5._id_91C0 _id_A4F0::_id_8E9B( "vulcan_beam_loop_npc" );
        var_0._id_A2E5._id_91C0 _id_A4F0::_id_8E9B( "vulcan_impact_loop_npc" );

        if ( var_0._id_1363 )
        {
            var_0._id_A2E6._id_91C0 _id_A4F0::_id_8E9B( "vulcan_beam_loop_npc" );
            var_0._id_A2E6._id_91C0 _id_A4F0::_id_8E9B( "vulcan_impact_loop_npc" );
            var_0._id_A2E7._id_91C0 _id_A4F0::_id_8E9B( "vulcan_beam_loop_npc" );
            var_0._id_A2E7._id_91C0 _id_A4F0::_id_8E9B( "vulcan_impact_loop_npc" );
            var_0._id_A2E8._id_91C0 _id_A4F0::_id_8E9B( "vulcan_beam_loop_npc" );
            var_0._id_A2E8._id_91C0 _id_A4F0::_id_8E9B( "vulcan_impact_loop_npc" );
        }
    }

    var_1 = "vulcan_std_beam_loop_plr";

    if ( var_0._id_A310 )
        var_1 = "vulcan_wide_beam_loop_plr";

    var_0 _id_A4F0::_id_8E9B( "vulcan_beam_loop_plr" );
    var_0 _id_A4F0::_id_8E9B( var_1 );

    if ( isdefined( var_0._id_6DB4 ) && var_0._id_6DB4 )
    {
        var_0._id_6DB4 = 0;

        if ( isdefined( var_0._id_A2E5 ) )
        {
            var_0._id_A2E5._id_91C0 _id_64A1( "vulcan_beam_stop_npc" );

            if ( var_0._id_1363 )
            {
                var_0._id_A2E6._id_91C0 _id_64A1( "vulcan_beam_stop_npc" );
                var_0._id_A2E7._id_91C0 _id_64A1( "vulcan_beam_stop_npc" );
                var_0._id_A2E8._id_91C0 _id_64A1( "vulcan_beam_stop_npc" );
            }
        }

        if ( self._id_2199 )
        {
            var_2 = 1;

            if ( isdefined( self ) && var_2 )
                self _meth_82F4( "vulcan_beam_stop_plr" );
        }
    }
}

_id_54FF( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    _id_8F05( var_0 );
    waittillframeend;
    waittillframeend;
    thread _id_37D8( var_0 );
    thread _id_54FB( var_0 );
    thread _id_54FD( var_0 );
    thread _id_54F0( var_0 );
    thread _id_54EF( var_0 );
    self _meth_84E2( 0.3 );
    var_0 waittill( "stop_charge" );
    self _meth_84E2( 1.0 );
}

_id_54EF( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 endon( "death" );
    var_0 endon( "PossessHoldTimeComplete" );
    var_0 endon( "leaving" );
    var_0 endon( "stop_charge" );
    var_1 = _id_3FF9( var_0 );

    for (;;)
    {
        var_0 _meth_81D5( var_0._id_A2E5._id_91C0._id_02E6 + ( 0, 0, 8 ), var_1, 90, 90, self, "MOD_TRIGGER_HURT", "orbital_laser_fov_mp" );

        if ( isdefined( level._id_511A ) && level._id_511A && isdefined( level._id_392B ) )
        {
            foreach ( var_3 in level._id_392B )
            {
                if ( var_3._id_02E6[2] > var_0._id_A2E5._id_91C0._id_02E6[2] && _func_220( var_3._id_02E6, var_0._id_A2E5._id_91C0._id_02E6 ) < int( var_1 * var_1 / 9 ) )
                    var_3 _meth_8051( 90, var_0._id_A2E5._id_91C0._id_02E6, self, self, "MOD_TRIGGER_HURT", "orbital_laser_fov_mp" );
            }
        }

        if ( var_0._id_1363 )
        {
            var_0 _meth_81D5( var_0._id_A2E6._id_91C0._id_02E6 + ( 0, 0, 8 ), var_1, 90, 90, self, "MOD_TRIGGER_HURT", "orbital_laser_fov_mp" );
            var_0 _meth_81D5( var_0._id_A2E7._id_91C0._id_02E6 + ( 0, 0, 8 ), var_1, 90, 90, self, "MOD_TRIGGER_HURT", "orbital_laser_fov_mp" );
            var_0 _meth_81D5( var_0._id_A2E8._id_91C0._id_02E6 + ( 0, 0, 8 ), var_1, 90, 90, self, "MOD_TRIGGER_HURT", "orbital_laser_fov_mp" );
        }

        glassradiusdamage( var_0._id_A2E5._id_91C0._id_02E6 + ( 0, 0, 32 ), var_1 * 2, 200, 200 );

        if ( var_0._id_1363 )
        {
            glassradiusdamage( var_0._id_A2E6._id_91C0._id_02E6 + ( 0, 0, 32 ), var_1 * 2, 200, 200 );
            glassradiusdamage( var_0._id_A2E7._id_91C0._id_02E6 + ( 0, 0, 32 ), var_1 * 2, 200, 200 );
            glassradiusdamage( var_0._id_A2E8._id_91C0._id_02E6 + ( 0, 0, 32 ), var_1 * 2, 200, 200 );
        }

        wait 0.15;
    }
}

_id_A1F5( var_0, var_1 )
{
    foreach ( var_3 in level._id_0328 )
        var_3 thread _id_A01C( var_0, var_1 );
}

_id_A01C( var_0, var_1 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 endon( "death" );
    var_0 endon( "PossessHoldTimeComplete" );
    var_0 endon( "leaving" );

    for (;;)
    {
        self waittill( "death", var_2, var_3, var_4 );

        if ( isdefined( var_4 ) && isdefined( var_2 ) && var_2 == var_1 && var_4 == "orbital_laser_fov_mp" )
        {
            var_5 = 10;

            for ( var_6 = 0; var_6 < var_5; var_6++ )
            {
                wait 0.05;

                if ( isdefined( self ) && isdefined( self._id_0087 ) )
                {
                    playfxontag( level._id_058F["orbital_laser_death"], self._id_0087, "tag_origin" );
                    break;
                }
            }
        }

        wait 0.05;
    }
}

_id_54F0( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 endon( "death" );
    var_0 endon( "PossessHoldTimeComplete" );
    var_0 endon( "leaving" );
    var_0 endon( "stop_charge" );
    var_1 = _id_3FF9( var_0 );
    var_2 = 2;

    for (;;)
    {
        var_3 = randomfloatrange( 0.65, 0.8 );
        var_4 = randomintrange( -180, 180 );
        var_5 = ( var_0._id_A2E5._id_91C0._id_0041[0] * var_3, var_4, var_4 );
        var_6 = anglestoforward( var_5 );
        physicsexplosionsphere( var_0._id_A2E5._id_91C0._id_02E6 + ( 0, 0, 1 ), var_1, 96, var_2 );
        wait 0.4;
    }
}

_id_37D8( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 endon( "death" );
    _id_6D9A( var_0 );
    _id_6A2C( var_0 );
    _id_8D23( var_0 );
    var_0 waittill( "stop_charge" );

    if ( isdefined( var_0 ) )
    {
        _id_8EDF( var_0 );
        _id_8ED8( var_0 );
        _id_8EEF( var_0 );
    }
}

_id_54FB( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 endon( "death" );
    var_0 endon( "stop_weapon" );
    var_0 endon( "stop_charge" );
    var_1 = 0.25;
    earthquake( 0.07, var_1, var_0._id_02E6, 256 );
    wait(var_1);
}

_id_54FD( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 endon( "death" );
    var_0 endon( "stop_weapon" );
    var_0 endon( "stop_charge" );
    var_1 = 0.25;
    earthquake( 0.5, var_1, var_0._id_A2E5._id_91C0._id_02E6 + ( 0, 0, 16 ), 384 );
    wait(var_1);
}

_id_6A3F( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    self endon( "death" );
    var_3 = self _meth_850D();

    if ( var_3 )
        playfxontag( var_1, self, "tag_origin" );
    else
        playfxontag( var_0, self, "tag_origin" );

    for (;;)
    {
        var_4 = var_3;
        var_3 = self _meth_850D();

        if ( var_3 != var_4 )
        {
            if ( var_3 )
            {
                stopfxontag( var_0, self, "tag_origin" );
                playfxontag( var_1, self, "tag_origin" );
            }
            else
            {
                stopfxontag( var_1, self, "tag_origin" );
                playfxontag( var_0, self, "tag_origin" );
            }
        }

        var_5 = _id_A4F0::_id_A099( var_2, 0.05 );

        if ( !isdefined( var_5 ) || var_5 != "timeout" )
            break;
    }

    if ( var_3 )
        stopfxontag( var_1, self, "tag_origin" );
    else
        stopfxontag( var_0, self, "tag_origin" );
}

_id_6DE9( var_0 )
{
    var_1 = "stop_warmup_fx";
    var_2 = _id_4159( var_0 );
    var_3 = _id_4159( var_0, 1 );
    var_0._id_A2E5._id_91C0 thread _id_6A3F( var_2, var_3, var_1 );

    if ( var_0._id_1363 )
    {
        var_4 = _id_415A( var_0 );
        var_5 = _id_415A( var_0, 1 );
        var_0._id_A2E6._id_91C0 thread _id_6A3F( var_4, var_5, var_1 );
        var_0._id_A2E7._id_91C0 thread _id_6A3F( var_4, var_5, var_1 );
        var_0._id_A2E8._id_91C0 thread _id_6A3F( var_4, var_5, var_1 );
    }
}

_id_8F05( var_0 )
{
    var_1 = "stop_warmup_fx";

    if ( isdefined( var_0._id_A2E5 ) )
    {
        var_0._id_A2E5._id_91C0 notify( var_1 );

        if ( var_0._id_1363 )
        {
            var_0._id_A2E6._id_91C0 notify( var_1 );
            var_0._id_A2E7._id_91C0 notify( var_1 );
            var_0._id_A2E8._id_91C0 notify( var_1 );
        }
    }
}

_id_4159( var_0, var_1 )
{
    var_2 = "orbital_laser_warmup";

    if ( var_0._id_A310 )
        var_2 += "_wide";

    if ( isdefined( var_1 ) && var_1 )
        var_2 += "_water";

    return _id_A4F0::_id_3FA6( var_2 );
}

_id_415A( var_0, var_1 )
{
    var_2 = "orbital_laser_warmup_lightshow";

    if ( var_0._id_A310 )
        var_2 += "_wide";

    if ( isdefined( var_1 ) && var_1 )
        var_2 += "_water";

    return _id_A4F0::_id_3FA6( var_2 );
}

_id_6DEA( var_0, var_1 )
{
    _id_8F06( var_0 );
    var_2 = "vulcan_charge_start_npc";
    var_3 = "vulcan_charge_start_plr";

    if ( var_1 )
    {
        var_2 = "vulcan_charge_up_npc";
        var_3 = "vulcan_charge_up_plr";
    }

    var_0._id_A2E5._id_91C0 _meth_8438( var_2 );

    if ( var_0._id_1363 )
    {
        var_0._id_A2E6._id_91C0 _meth_8438( var_2 );
        var_0._id_A2E7._id_91C0 _meth_8438( var_2 );
        var_0._id_A2E8._id_91C0 _meth_8438( var_2 );
    }

    self _meth_82F4( var_3 );
}

_id_8F06( var_0 )
{
    if ( isdefined( var_0._id_A2E5 ) )
    {
        var_0._id_A2E5._id_91C0 _meth_80AC();

        if ( var_0._id_1363 )
        {
            var_0._id_A2E6._id_91C0 _meth_80AC();
            var_0._id_A2E7._id_91C0 _meth_80AC();
            var_0._id_A2E8._id_91C0 _meth_80AC();
        }
    }

    if ( isdefined( self ) )
    {
        self _meth_82F5( "vulcan_charge_start_plr" );
        self _meth_82F5( "vulcan_charge_up_plr" );
    }
}

_id_6D9A( var_0 )
{
    var_1 = "stop_fire_fx";
    var_2 = _id_3F92( var_0 );
    var_3 = _id_3F92( var_0, 1 );
    var_4 = _id_3F93( var_0 );
    var_5 = _id_3F93( var_0, 1 );

    if ( var_0._id_1363 )
    {
        var_0._id_A2E5._id_91C0 thread _id_6A3F( var_4, var_5, var_1 );
        var_0._id_A2E6._id_91C0 thread _id_6A3F( var_4, var_5, var_1 );
        var_0._id_A2E7._id_91C0 thread _id_6A3F( var_4, var_5, var_1 );
        var_0._id_A2E8._id_91C0 thread _id_6A3F( var_4, var_5, var_1 );
    }
    else
        var_0._id_A2E5._id_91C0 thread _id_6A3F( var_2, var_3, var_1 );
}

_id_8EDF( var_0 )
{
    var_1 = "stop_fire_fx";

    if ( isdefined( var_0._id_A2E5 ) )
    {
        var_0._id_A2E5._id_91C0 notify( var_1 );

        if ( var_0._id_1363 )
        {
            var_0._id_A2E6._id_91C0 notify( var_1 );
            var_0._id_A2E7._id_91C0 notify( var_1 );
            var_0._id_A2E8._id_91C0 notify( var_1 );
        }

        _id_6DBB( var_0 );
    }
}

_id_6DBB( var_0 )
{
    var_1 = var_0._id_A2E5._id_91C0;

    if ( var_1 _meth_850D() )
        playfx( level._id_058F["orbital_laser_ending_water"], var_1._id_02E6, anglestoforward( var_1._id_0041 ), anglestoup( var_1._id_0041 ) );
    else
        playfx( level._id_058F["orbital_laser_ending"], var_1._id_02E6, anglestoforward( var_1._id_0041 ), anglestoup( var_1._id_0041 ) );
}

_id_3F92( var_0, var_1 )
{
    var_2 = "orbital_laser_fire";

    if ( var_0._id_A310 )
        var_2 += "_wide";

    if ( isdefined( var_1 ) && var_1 )
        var_2 += "_water";

    return _id_A4F0::_id_3FA6( var_2 );
}

_id_3F93( var_0, var_1 )
{
    var_2 = "orbital_laser_fire_lightshow";

    if ( var_0._id_A310 )
        var_2 += "_wide";

    if ( isdefined( var_1 ) && var_1 )
        var_2 += "_water";

    return _id_A4F0::_id_3FA6( var_2 );
}

_id_6A2C( var_0 )
{
    var_1 = _id_3F10( var_0 );
    playfxontag( var_1, var_0._id_A2E5._id_91C0, "tag_origin" );

    if ( var_0._id_1363 )
    {
        var_2 = _id_4002( var_0 );
        playfxontag( var_2, var_0._id_A2E6._id_91C0, "tag_origin" );
        playfxontag( var_2, var_0._id_A2E7._id_91C0, "tag_origin" );
        playfxontag( var_2, var_0._id_A2E8._id_91C0, "tag_origin" );
    }
}

_id_8ED8( var_0 )
{
    var_1 = _id_3F10( var_0 );
    waittillframeend;

    if ( isdefined( var_0._id_A2E5 ) )
    {
        stopfxontag( var_1, var_0._id_A2E5._id_91C0, "tag_origin" );

        if ( var_0._id_1363 )
        {
            var_2 = _id_4002( var_0 );
            stopfxontag( var_2, var_0._id_A2E6._id_91C0, "tag_origin" );
            stopfxontag( var_2, var_0._id_A2E7._id_91C0, "tag_origin" );
            stopfxontag( var_2, var_0._id_A2E8._id_91C0, "tag_origin" );
        }
    }
}

_id_6DBC( var_0 )
{
    playfxontag( "orbital_laser_smoldering", var_0._id_A2E5._id_91C0, "tag_origin" );
}

_id_3F10( var_0 )
{
    var_1 = "orbital_laser_beam";

    if ( var_0._id_A310 )
        var_1 += "_wide";

    return _id_A4F0::_id_3FA6( var_1 );
}

_id_4002( var_0 )
{
    var_1 = "orbital_laser_beam_lightshow";

    if ( var_0._id_A310 )
        var_1 += "_wide";

    return _id_A4F0::_id_3FA6( var_1 );
}

_id_6562( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "OrbitalStrikeStreakComplete" );
    wait(var_0);
    var_1 notify( "leaving" );
}

_id_5E88( var_0 )
{
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 waittill( "death", var_1, var_2, var_3 );
    var_0 _id_A783::_id_64B3( var_1, var_3, var_2, var_0._id_01E7 + 1, "vulcan_destroyed", undefined, undefined, 1 );
    var_0 notify( "finish_death" );
}

_id_5E8A( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    var_0 _id_A4F0::_id_A060( "leaving", "crashing", "PossessHoldTimeComplete", "done", "finish_death" );
    thread _id_6561( var_0 );
}

_id_41E1( var_0 )
{
    if ( isdefined( var_0 ) && isdefined( var_0._id_A2E5 ) )
    {
        var_0._id_A2E5._id_91C0 _meth_8383( undefined );

        if ( var_0._id_1363 )
        {
            var_0._id_A2E6._id_91C0 _meth_8383( undefined );
            var_0._id_A2E7._id_91C0 _meth_8383( undefined );
            var_0._id_A2E8._id_91C0 _meth_8383( undefined );
        }
    }

    self _meth_82FB( "ui_orbital_laser_charge", 0 );
    self _meth_82FB( "ui_orbital_laser_mode", 0 );
    self _meth_82FB( "ui_orbital_laser_bursts", 0 );
    self _meth_82FB( "ui_orbital_laser_fire", 0 );
    self _meth_82FB( "ui_orbital_laser", 0 );
    _id_A7B5::_id_6C89();
    self _meth_830F( "orbital_laser_fov_mp" );

    if ( self._id_2B0B > 0 )
        _id_A4F0::_id_0596();

    self _meth_82D9( 0, 0 );
    self _meth_851A( 1 );
    _id_A7B5::_id_2B1E( self );
    self _meth_80B9();
    self _meth_8207();
    self _meth_8201();
    self _meth_81E3();

    if ( _id_A75A::_id_51E0() )
        _id_A75A::_id_1F0D();

    thread _id_27D1();
    thread _id_73E5( 0.5 );

    if ( getdvarint( "camera_thirdPerson" ) )
        _id_A75A::_id_802B( 1 );

    _id_A75A::_id_6D35();
    self notify( "player_control_strike_over" );
}

_id_27D1()
{
    self _meth_8329( 1 );
    wait 0.5;
    self _meth_8329( 0 );
}

_id_5E9A( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    self waittill( "disconnect" );
    thread _id_6561( var_0, 1 );
}

_id_5EA9( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    _id_A4F0::_id_A07E( "joined_team", "joined_spectators" );
    thread _id_6561( var_0 );
}

_id_5E60( var_0 )
{
    self endon( "OrbitalStrikeStreakComplete" );
    level waittill( "game_ended" );
    thread _id_6561( var_0 );
}

_id_6561( var_0, var_1 )
{
    self notify( "OrbitalStrikeStreakComplete" );
    waitframe;

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !var_1 )
    {
        self._id_2199 = 0;
        _id_41E1( var_0 );
        _id_6D2D();
    }

    level._id_654F = _id_A4F0::_id_0CF6( level._id_654F, var_0 );

    if ( level._id_91E4 )
        _id_7FCA( var_0._id_04A8, 0 );

    _id_8F06( var_0 );
    _id_8EEF( var_0 );
    _id_8F05( var_0 );
    _id_8EDF( var_0 );
    _id_8ED8( var_0 );
    _id_2875( var_0 );
    var_0 delete();
    _id_A75A::_id_2760();
    waittillframeend;

    if ( isdefined( self ) )
    {
        self _meth_80AF( "orbital_laser_charge" );
        self _meth_80AF( "orbital_laser_charge_quick" );
    }

    waittillframeend;

    if ( isdefined( self ) )
        self _meth_80AF( "orbital_laser_fire" );
}

_id_6C5A()
{
    if ( !isbot( self ) )
    {
        self _meth_82DD( "SwitchVisionMode", "+actionslot 1" );
        self _meth_82DD( "ToggleControlState", "+activate" );
        self _meth_82DD( "ToggleControlCancel", "-activate" );
        self _meth_82DD( "ToggleControlState", "+usereload" );
        self _meth_82DD( "ToggleControlCancel", "-usereload" );
        self _meth_82DD( "StartFire", "+attack" );
        self _meth_82DD( "StartFire", "+attack_akimbo_accessible" );
    }
}

_id_6D2D()
{
    if ( !isbot( self ) )
    {
        self _meth_849C( "SwitchVisionMode", "+actionslot 1" );
        self _meth_849C( "ToggleControlState", "+activate" );
        self _meth_849C( "ToggleControlCancel", "-activate" );
        self _meth_849C( "ToggleControlState", "+usereload" );
        self _meth_849C( "ToggleControlCancel", "-usereload" );
        self _meth_849C( "StartFire", "+attack" );
        self _meth_849C( "StartFire", "+attack_akimbo_accessible" );
    }
}

_id_834D( var_0 )
{
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "OrbitalStrikeStreakComplete" );
    wait(var_0);

    if ( isdefined( level._id_9F74 ) )
        self _meth_847A( level._id_9F74, 0 );

    if ( isdefined( level._id_9F73 ) )
        self _meth_83C0( level._id_9F73 );

    _id_A7B5::_id_45F0();
}

_id_73E5( var_0 )
{
    self _meth_847A( "", var_0 );
    self _meth_83C0( "" );
    _id_A7B5::_id_45E2();
}
