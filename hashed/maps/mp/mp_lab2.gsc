// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_A76A::main();
    _id_A6D1::main();
    _id_A769::main();
    _id_A75A::setlightingstate_patched( 1 );
    _id_A742::main();
    thread _id_804D();
    thread _id_7E66();
    thread _id_7EE0();
    level._id_65AB = "mp_lab2_osp";
    level._id_65A9 = "mp_lab2_osp";
    level._id_A197 = "mp_lab2_osp";
    level._id_A18C = "mp_lab2_osp";
    level._id_9F74 = "mp_lab2_osp";
    level._id_9F73 = "mp_lab2_osp";
    _id_A727::_id_831E( "compass_map_mp_lab2" );
    setdvar( "sm_minSpotLightScore", 0.0007 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";

    if ( level._id_02B3 )
        level._id_088A = 350;

    precachemodel( "lab2_cannister_holder_01" );
    precachemodel( "lab2_industrial_crane_01" );
    map_restart( "lab2_dynamic_event_helicopter_anim" );
    map_restart( "lab2_dynamic_event_harness_anim" );
    map_restart( "lab2_dynamic_event_building_anim" );
    map_restart( "lab2_industrial_crane_anim" );
    map_restart( "lab2_dynamic_event_harness_invis_anim" );
    precacheshellshock( "mp_lab_gas" );
    precacheshader( "lab_gas_overlay" );
    level._id_5CBD = spawnstruct();
    level._id_5CBD._id_8A98 = loadfx( "vfx/water/industrial_hot_water_sprayer" );
    level._id_5CBD._id_8A99 = loadfx( "vfx/water/industrial_hot_water_sprayer_drips" );
    level._id_5CBD._id_1ACB = loadfx( "vfx/map/mp_lab/canister_drips" );
    level._id_5CBD._id_1ACC = loadfx( "vfx/map/mp_lab/canister_steam" );
    level._id_5CBD._id_2FA3 = loadfx( "vfx/map/mp_lab/industrial_dryer_fan" );
    level._id_5CBD._id_88B4 = loadfx( "vfx/map/mp_lab/flare_sparks_ambient_green" );
    level._id_5CBD._id_43D8 = loadfx( "vfx/smoke/smoke_flare_marker_green_windy" );
    level._id_5CBD._id_43D9 = loadfx( "vfx/map/mp_lab/chem_smoke_green" );
    level._id_5CBD._id_5CB5 = loadfx( "vfx/explosion/poison_gas_canister_explosion" );
    level._id_5CBD._id_22F9 = loadfx( "vfx/sparks/crane_scrape_sparks_small_looping" );
    level._id_09BF = loadfx( "vfx/lights/mp_lab2/lab2_crane_red_alarm" );

    if ( isdefined( level._id_2409 ) && level._id_2409 )
        return;

    thread _id_8303();
    thread _id_64C9();
    thread _id_830B();
    thread _id_8332();
    thread _id_A75A::_id_3772( "animated_prop", 1 );
    thread _id_8A28();
    setdvar( "r_reactivemotionfrequencyscale", 0.5 );
    setdvar( "r_reactivemotionamplitudescale", 0.5 );
    setdvar( "r_gunSightColorEntityScale", "7" );
    setdvar( "r_gunSightColorNoneScale", "0.8" );
    level._id_543E = 9;
    level._id_543F = 4;
    level._id_5440 = -2;
    level._id_6573 = ::_id_543D;
    level._id_655B = ::_id_5437;
    thread _id_5436();
    thread lab2botkilltrigger();
    thread lab2playerkilltrigger();
    thread lab2playerkilltrigger_snowledge();
    thread scriptpatchclip();
}

scriptpatchclip()
{
    thread patchclipvehiclelowercanyon();
    thread patchclipdoorway();
    thread patchclipelevatorcage();
    thread wallledgefromcranecontrolbuilding();
}

wallledgefromcranecontrolbuilding()
{
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( 45, -1670, 329 ), ( 0, 269.2, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( 45, -1670, 585 ), ( 0, 269.2, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( 45, -1670, 841 ), ( 0, 269.2, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -203.5, -1704, 329 ), ( 0, 286.4, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -203.5, -1704, 585 ), ( 0, 286.4, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -203.5, -1704, 841 ), ( 0, 286.4, 0 ) );
}

patchclipvehiclelowercanyon()
{
    _id_A75A::spawnpatchclip( "patchclip_vehicle_128_128_128", ( -2068, 829, -306 ), ( 0, 0, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_vehicle_128_128_128", ( -2068, 805, -178 ), ( 0, 0, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_vehicle_128_128_128", ( -2028, 665, -42 ), ( 0, 0, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_vehicle_128_128_128", ( -2028, 641, 86 ), ( 0, 0, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_vehicle_128_128_128", ( -2112, 576, 98 ), ( 0, 0, 48.5 ) );
    _id_A75A::spawnpatchclip( "patchclip_vehicle_128_128_128", ( -2240, 576, 98 ), ( 0, 0, 48.5 ) );
    _id_A75A::spawnpatchclip( "patchclip_vehicle_128_128_128", ( -2149, 652, 40 ), ( 0, 0, 37.7 ) );
}

patchclipdoorway()
{
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( 2, 871, 296 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( 2, 862, 296 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( 2, 846, 296 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -362, 871, 296 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -362, 862, 296 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -362, 846, 296 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( 2, 871, 552 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( 2, 846, 552 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -362, 846, 552 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -362, 871, 552 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -176, 871, 552 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -176, 862, 552 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_256_256", ( -176, 846, 552 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_vehicle_16_256_256", ( -362, 846, 348 ), ( 0, 270, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_vehicle_16_256_256", ( 2, 846, 348 ), ( 0, 270, 0 ) );
}

patchclipelevatorcage()
{
    _id_A75A::spawnpatchclip( "patchclip_player_16_64_64", ( -2117.6, 1517, 317.168 ), ( 13.8, 0, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_64_64", ( -2117.6, 1577, 317.168 ), ( 13.8, 0, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_64_64", ( -2103.33, 1517, 378.821 ), ( 13.8, 0, 0 ) );
    _id_A75A::spawnpatchclip( "patchclip_player_16_64_64", ( -2103.33, 1577, 378.821 ), ( 13.8, 0, 0 ) );
}

_id_7EE0()
{
    setdvar( "r_umbraAccurateOcclusionThreshold", 128 );
}

_id_8A28()
{
    thread _id_A002();
}

_id_A002()
{
    level endon( "game_ended" );

    if ( level._id_01B5 == "sd" )
    {
        while ( !isdefined( level._id_7B6E ) )
            wait 0.05;

        level._id_7B6E thread _id_A200();
    }
    else if ( level._id_01B5 == "sab" )
    {
        while ( !isdefined( level._id_7746 ) )
            wait 0.05;

        level._id_7746 thread _id_A200();
    }
    else if ( level._id_01B5 == "tdef" )
    {
        while ( !isdefined( level._id_3BDB ) )
            wait 0.05;

        level._id_3BDB thread _id_A200();
    }
    else if ( level._id_01B5 == "ball" )
    {
        while ( !isdefined( level._id_12D9 ) )
            wait 0.05;

        foreach ( var_1 in level._id_12D9 )
            var_1 thread _id_A200();
    }
    else if ( level._id_01B5 == "ctf" )
    {
        while ( !isdefined( level._id_91E8 ) || !isdefined( level._id_91E8[game["defenders"]] ) || !isdefined( level._id_91E8[game["attackers"]] ) )
            wait 0.05;

        level._id_91E8[game["defenders"]] thread _id_A200();
        level._id_91E8[game["attackers"]] thread _id_A200();
    }
}

_id_A200()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "dropped" );
        wait 0.1;

        if ( _id_5168() )
        {
            _id_A78A::_id_74DC();
            continue;
        }

        if ( isdefined( level._id_392E ) && level._id_392E._id_3921 == 1 && isdefined( level._id_392E._id_980B ) && isdefined( level._id_392E._id_980C ) )
        {
            while ( level._id_392E._id_3921 == 1 )
            {
                if ( self._id_9E93[0] _meth_80A9( level._id_392E._id_980B ) || self._id_9E93[0] _meth_80A9( level._id_392E._id_980C ) )
                {
                    _id_A78A::_id_74DC();
                    break;
                }

                wait 0.05;
            }
        }
    }
}

_id_5168()
{
    var_0 = getentarray( "radiation", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !self._id_9E93[0] _meth_80A9( var_0[var_1] ) )
            continue;

        return 1;
    }

    var_2 = getentarray( "minefield", "targetname" );

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
    {
        if ( !self._id_9E93[0] _meth_80A9( var_2[var_1] ) )
            continue;

        return 1;
    }

    var_3 = getentarray( "trigger_hurt", "classname" );

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
    {
        if ( !self._id_9E93[0] _meth_80A9( var_3[var_1] ) )
            continue;

        return 1;
    }

    var_4 = getentarray( "object_out_of_bounds", "targetname" );

    for ( var_1 = 0; var_1 < var_4.size; var_1++ )
    {
        if ( !self._id_9E93[0] _meth_80A9( var_4[var_1] ) )
            continue;

        return 1;
    }

    return 0;
}

_id_830B()
{
    var_0 = getentarray( "ground_shadow_patch_before", "targetname" );
    var_1 = getentarray( "ground_shadow_patch_after", "targetname" );
    var_2 = getent( "teleport_from", "targetname" );
    var_3 = getent( "teleport_to", "targetname" );

    foreach ( var_5 in var_0 )
        var_5._id_02E6 += var_3._id_02E6 - var_2._id_02E6;

    foreach ( var_5 in var_1 )
        var_5 _meth_8054();

    _id_A75A::setlightingstate_patched( 2 );
    var_9 = getentarray( "dynamic_building_master_prefab", "targetname" );
    var_10 = undefined;
    var_11 = [];

    foreach ( var_13 in var_9 )
    {
        if ( isdefined( var_13._id_039B ) && var_13._id_039B == "origin" )
        {
            var_10 = spawn( "script_origin", var_13._id_02E6 );
            continue;
        }

        var_11[var_11.size] = var_13;
    }

    if ( !isdefined( var_10 ) )
        var_10 = spawn( "script_origin", var_9[0]._id_02E6 );

    var_10._id_70B4 = var_10._id_02E6;
    var_10._id_3921 = 0;
    var_10._id_66A4 = var_11;
    var_10._id_980B = getent( "building_hurt_01", "targetname" );
    var_10._id_980C = getent( "building_hurt_02", "targetname" );
    var_10._id_980F = getent( "vehicle_kill_heli", "targetname" );
    var_10._id_9810 = ( 525, 36, 635 );
    var_10._id_980F._id_02E6 += ( 0, 0, -10000 );
    var_10._id_980D = getent( "vehicle_kill_building", "targetname" );
    var_10._id_980E = var_10._id_980D._id_02E6 - var_10._id_02E6;
    var_10._id_980D._id_02E6 += ( 0, 0, -10000 );

    foreach ( var_13 in var_10._id_66A4 )
    {
        if ( var_13._id_00AB == "info_null_meter" )
            continue;
        else if ( isdefined( var_13._id_039B ) && var_13._id_039B == "trigger_origin_01" )
            var_10._id_9811 = var_13;
        else if ( isdefined( var_13._id_039B ) && var_13._id_039B == "trigger_origin_02" )
            var_10._id_9817 = var_13;

        var_13 _meth_8446( var_10 );
    }

    var_10._id_2FEF = getent( "flying_building_paths_unblock", "targetname" );
    var_10._id_2FF0 = getent( "flying_building_path_ramp_switch", "targetname" );
    var_10._id_2FEF _meth_8446( var_10 );
    var_10._id_6389 = ( 15959.8, -24712.9, 5209.89 );
    var_10._id_6386 = ( 15940.7, -24711.6, 5888.01 );
    var_10._id_02E6 = var_10._id_6389;
    wait 0.05;
    var_10._id_980B._id_02E6 = var_10._id_9811._id_02E6;
    var_10._id_980B._id_0041 = var_10._id_9811._id_0041;
    var_10._id_980C._id_02E6 = var_10._id_9817._id_02E6;
    var_10._id_980C._id_0041 = var_10._id_9817._id_0041;
    _id_651E( var_10 );

    foreach ( var_13 in var_10._id_66A4 )
    {
        if ( var_13._id_00AB == "info_null_meter" )
            continue;

        var_13 _meth_8054();
    }

    var_10 _meth_8054();
    level._id_392E = var_10;
    level thread _id_A72B::_id_2FE6( ::_id_2FEB, undefined, ::_id_2FEA );
}

_id_651E( var_0 )
{
    var_0._id_2FF0._id_02E6 += ( 0, 0, -10000 );
    var_0._id_2FEF _meth_8058();

    foreach ( var_2 in var_0._id_66A4 )
    {
        if ( isdefined( var_2._id_039B ) )
        {
            if ( var_2._id_039B == "flying_building_collision_shell" || var_2._id_039B == "collision" || var_2._id_039B == "building_brush_geo" )
            {
                var_2 _meth_8058();

                if ( var_2._id_039B == "flying_building_collision_shell" )
                    var_2 _meth_8384( 0 );
            }
        }
    }

    if ( level._id_01B5 == "dom" )
    {
        wait 0.05;
        maps\mp\gametypes\dom::_id_386B();
    }
}

_id_2FEB()
{
    if ( isdefined( level._id_392E ) && !isdefined( level._id_511A ) )
        level._id_392E _id_5F4E();
}

_id_2FEA()
{
    var_0 = getentarray( "ground_shadow_patch_before", "targetname" );
    var_1 = getentarray( "ground_shadow_patch_after", "targetname" );
    var_1[0] _meth_8053();
    var_0[0] _meth_8054();

    if ( isdefined( level._id_392E ) )
    {
        level._id_392E._id_2FEF _meth_804F();
        level._id_392E._id_2FEF._id_02E6 += ( 0, 0, -10000 );
        level._id_392E _meth_8092();
        level._id_392E._id_02E6 = level._id_392E._id_70B4;
        wait 0.05;
        level._id_392E._id_980B _meth_8092();
        level._id_392E._id_980C _meth_8092();
        level._id_392E._id_980B._id_02E6 += ( 0, 0, -10000 );
        level._id_392E._id_980C._id_02E6 += ( 0, 0, -10000 );

        foreach ( var_3 in level._id_392E._id_66A4 )
        {
            var_3 _meth_804F();
            var_3 _meth_8053();
            var_3._id_9A53 = 0;

            if ( isdefined( var_3._id_039B ) )
            {
                if ( var_3._id_039B == "flying_building_collision_shell" )
                {
                    var_3 _meth_8057();
                    var_3 _meth_8384( 1 );
                    continue;
                }

                if ( var_3._id_039B == "collision" )
                    var_3 delete();
            }
        }

        level._id_392E._id_2FF0 _meth_8058();
        level thread _id_A4ED::_id_06F5( 100 );
    }

    if ( level._id_01B5 == "dom" )
        _id_2CED();
}

_id_4036( var_0 )
{
    var_1 = var_0 / 360.0;
    var_2 = ( var_1 - floor( var_1 ) ) * 360.0;
    var_3 = var_2 - 360.0;

    if ( var_3 >= 0 )
        var_2 = var_3;

    var_4 = int( floor( var_2 * 4095 / 360 + 0.5 ) );
    var_0 = var_4 * 360 / 4095.0;
    return var_0;
}

_id_2CED()
{
    wait 0.05;
    var_0 = _id_A4F0::_id_40F9( "dom_point_b_location", "targetname" );

    foreach ( var_2 in level._id_3869 )
    {
        if ( var_2._id_0397 == "_b" )
        {
            var_2._id_02E6 = var_0._id_02E6;
            var_2._id_9C01._id_9E93[0]._id_02E6 = var_0._id_02E6 + ( 0, 0, 1.125 );
            var_2._id_9C01._id_9E93[0]._id_1315 = var_0._id_02E6 + ( 0, 0, 1.125 );
            var_2._id_9C01._id_24C8 = var_0._id_02E6 + ( 0, 0, 1.125 );
            var_2._id_9C01._id_1307 = var_0._id_02E6 + ( 0, 0, 1.125 );
            var_2._id_9C01 maps\mp\gametypes\dom::_id_9B99();

            if ( isdefined( var_2._id_9C01._id_6302 ) )
                objective_position( var_2._id_9C01._id_6302, var_0._id_02E6 );

            if ( isdefined( var_2._id_9C01._id_6303 ) )
                objective_position( var_2._id_9C01._id_6303, var_0._id_02E6 );

            var_3 = var_0._id_02E6 + ( 0, 0, 100 );

            foreach ( var_5 in level._id_91F0 )
            {
                var_6 = "objpoint_" + var_5 + "_" + var_2._id_9C01._id_331B;
                var_7 = _id_A7A2::_id_405C( var_6 );
                var_7._id_0530 = var_3[0];
                var_7._id_0538 = var_3[1];
                var_7._id_053B = var_3[2];
            }
        }
    }

    level notify( "dom_flags_moved" );
    maps\mp\gametypes\dom::_id_386B();
}

_id_5F4E()
{
    var_0 = level._id_543E;
    var_1 = level._id_543F;
    var_2 = level._id_5440;
    self._id_4796 = spawn( "script_model", self._id_6386 + ( var_2, var_1, var_0 ) );
    var_3 = _id_4036( 36.078 );
    self._id_4796._id_0041 = ( 0, 36.044, 0 );
    self._id_4796 _meth_80B1( "vehicle_heavy_lift_helicopter_01" );
    self._id_46DA = spawn( "script_model", self._id_4796 _meth_8180( "tag_crane" ) );
    self._id_46DA._id_0041 = self._id_4796 _meth_8181( "tag_crane" ) + ( 0, 0, 0 );
    self._id_46DA _meth_80B1( "heavy_lift_wires" );
    self._id_187F = spawn( "script_model", self._id_6389 + ( 0, 0, var_0 ) );
    self._id_187F._id_0041 = self._id_46DA _meth_8181( "tag_cargo" ) + ( 0, 180, 0 );
    self._id_187F _meth_80B1( "tag_origin_animate" );
    self._id_3921 = 1;
    wait 0.05;
    self._id_980F thread _id_A7B5::_id_8157();
    self._id_980D thread _id_A7B5::_id_8157();
    thread _id_53B0( self._id_980D );
    thread _id_53B0( self._id_980F );

    foreach ( var_5 in self._id_66A4 )
        var_5 _meth_8053();

    wait 0.05;

    foreach ( var_8 in self._id_66A4 )
        var_8._id_9A53 = 1;

    self._id_02E6 = self._id_6389 + ( 0, 0, var_0 );
    self._id_0041 = self._id_46DA _meth_8181( "tag_cargo" ) + ( 0, 180, 0 );
    self _meth_8446( self._id_46DA, "tag_cargo" );
    wait 0.05;
    self._id_4796 _meth_827B( "lab2_dynamic_event_helicopter_anim", "building_unlink_notify" );
    self._id_46DA _meth_827B( "lab2_dynamic_event_harness_anim" );
    self._id_4796 thread _id_10C3();
    thread _id_5F44();
    self._id_4796 thread _id_A769::_id_8D16();
    self._id_4796 waittillmatch( "building_unlink_notify", "vfx_heligroundfx_start" );
    self._id_4796 thread _id_A769::_id_8D17();
    self._id_4796 waittillmatch( "building_unlink_notify", "vfx_crane_sparks_start" );
    playfxontag( _id_A4F0::_id_3FA6( "crane_sparks" ), self._id_4796, "TAG_CRANE" );
    self._id_4796 waittillmatch( "building_unlink_notify", "helicopter_descend" );
    var_10 = [];

    foreach ( var_5 in self._id_66A4 )
    {
        if ( isdefined( var_5._id_039B ) && var_5._id_039B == "collision" )
        {
            var_5 _meth_804F();
            var_5 delete();
            continue;
        }

        var_10[var_10.size] = var_5;
    }

    self._id_66A4 = var_10;
    self._id_2FEF _meth_804F();
    self._id_2FEF delete();
    self._id_4796 thread _id_0E82();
    self._id_4796 waittillmatch( "building_unlink_notify", "vfx_crane_sparks_stop" );
    stopfxontag( _id_A4F0::_id_3FA6( "crane_sparks" ), self._id_4796, "TAG_CRANE" );
    self._id_4796 waittillmatch( "building_unlink_notify", "vfx_building_land" );
    _id_A4ED::_id_06F5( 99 );
    self._id_4796 waittillmatch( "building_unlink_notify", "drop_building" );
    self._id_46DA thread _id_A769::_id_1E27();
    self._id_4796 thread _id_0E81();
    var_13 = getentarray( "ground_shadow_patch_before", "targetname" );
    var_14 = getentarray( "ground_shadow_patch_after", "targetname" );
    var_14[0] _meth_8053();
    var_13[0] _meth_8054();
    self _meth_804F();
    self._id_3921 = 0;

    foreach ( var_5 in self._id_66A4 )
    {
        if ( isdefined( var_5 ) )
        {
            var_5 _meth_804F();
            var_5._id_9A53 = 0;

            if ( isdefined( var_5._id_039B ) )
            {
                if ( var_5._id_039B == "flying_building_collision_shell" )
                {
                    var_5 _meth_8057();
                    var_5 _meth_8384( 1 );
                }
            }
        }
    }

    self._id_2FF0 _meth_8058();

    if ( level._id_01B5 == "dom" )
        _id_2CED();

    _id_A4ED::_id_06F5( 100 );
    self._id_4796 waittillmatch( "building_unlink_notify", "vfx_heligroundfx_stop" );
    self._id_4796 thread _id_A769::_id_8EE7();
    self._id_4796 waittillmatch( "building_unlink_notify", "helicopter_end" );
    self._id_4796 delete();
    self._id_46DA delete();
}

_id_53B0( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        while ( self._id_3921 == 1 )
        {
            if ( isdefined( level._id_89A1 ) )
            {
                foreach ( var_2 in level._id_89A1 )
                {
                    if ( isdefined( var_2 ) )
                    {
                        if ( var_2 _meth_80A9( var_0 ) )
                            var_2 thread _id_A7B5::_id_47B8( 1 );
                    }
                }
            }

            wait 0.05;
        }
    }
}

_id_5F44()
{
    while ( self._id_3921 == 1 )
    {
        self._id_980B._id_02E6 = self._id_9811._id_02E6;
        self._id_980B._id_0041 = self._id_9811._id_0041;
        self._id_980C._id_02E6 = self._id_9817._id_02E6;
        self._id_980C._id_0041 = self._id_9817._id_0041;
        var_0 = self._id_4796 _meth_8181( "body_animate_jnt" );
        var_1 = 360 - var_0[0];
        var_2 = var_0[1] + 180;
        var_3 = 360 - var_0[2];
        self._id_980F._id_0041 = ( var_1, var_2, var_3 );
        self._id_980F._id_02E6 = self._id_4796._id_02E6 + self._id_9810;
        self._id_980D._id_02E6 = self._id_02E6 + self._id_980E;
        self._id_980D._id_0041 = self._id_0041;
        wait 0.05;
    }

    self._id_980B _meth_8092();
    self._id_980C _meth_8092();
    self._id_980F _meth_8092();
    self._id_980D _meth_8092();
    self._id_980B._id_02E6 += ( 0, 0, -10000 );
    self._id_980C._id_02E6 += ( 0, 0, -10000 );
    self._id_980F._id_02E6 += ( 0, 0, -10000 );
    self._id_980D._id_02E6 += ( 0, 0, -10000 );
}

_id_543D()
{
    level._id_6574._id_898B = 70;
    level._id_6574._id_898A = 150;
    level._id_6574._id_89DC = 7500;
    level._id_6574._id_8A00 = 5000;
    level._id_6574._id_0252 = 30;
    level._id_6574._id_0380 = 30;
    level._id_6574._id_04BD = -42;
    level._id_6574._id_0089 = 67;
}

_id_5437()
{
    var_0 = _id_A7B5::_id_3FC1();
    level._id_655C._id_89DC = var_0._id_02E6[2] + 2724;
}

_id_5436()
{
    if ( !isdefined( level._id_099D ) )
        level._id_099D = spawnstruct();

    level._id_099D._id_89DC = 1700;
}

lab2botkilltrigger()
{
    level endon( "game_ended" );
    var_0 = spawn( "trigger_radius", ( -584, 1728, 176 ), 0, 300, 128 );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isbot( var_1 ) || isagent( var_1 ) )
            var_1 _meth_8051( var_1._id_01E7 + 999, var_0._id_02E6 );
    }
}

lab2playerkilltrigger()
{
    level endon( "game_ended" );
    var_0 = spawn( "trigger_radius", ( -566, 1636, 220 ), 0, 64, 64 );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 _meth_8051( var_1._id_01E7 + 999, var_0._id_02E6 );
    }
}

lab2playerkilltrigger_snowledge()
{
    level endon( "game_ended" );
    var_0 = spawn( "trigger_radius", ( -174, 2022, 192 ), 0, 300, 64 );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );
        var_1 _meth_8051( var_1._id_01E7 + 999, var_0._id_02E6 );
    }
}

_id_64C9()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_3C2C = 0;
        var_0 thread _id_241D();
    }
}

_id_7E66()
{
    if ( _func_235() )
    {
        for (;;)
        {
            level waittill( "connected", var_0 );
            var_0 _meth_82FD( "r_tonemap", "1" );
        }
    }
}

_id_75FD( var_0 )
{
    for (;;)
    {
        self _meth_82B7( 360, var_0 );
        wait(var_0);
    }
}

_id_8303()
{
    level._id_09C1 = spawnstruct();
    level._id_09C1._id_8A5A = getentarray( "horizontal_spinner", "targetname" );
    level._id_09C1._id_09C0 = getent( "alarm_missile_sound01", "targetname" );
    level._id_3C1F = spawnstruct();
    level._id_3C1F._id_93FA = [];
    level._id_3C1F._id_22F7 = [];
    level._id_3C1F._id_22F5 = [];
    level._id_3C1F._id_354A = 72;
    level._id_3C1F._id_3549 = ( -90, 0, 0 );
    level._id_3C1F._id_58C1 = getentarray( "sparkgroup", "targetname" );
    level._id_3C1F._id_8A97 = getentarray( "dripgroup", "targetname" );
    level._id_3C1F._id_6699 = _id_A4F0::_id_40F9( "particle_dryer", "targetname" );
    level._id_3C1F._id_1D2C = 0;
    level._id_3C1F._id_1D2D = 1;
    level._id_3C1F._id_1D2B = _id_A4F0::_id_40FB( "missile_rack_start01", "targetname" );
    level._id_3C1F._id_25AA = 375;
    level._id_3C1F._id_5A28 = 300;
    level._id_3C1F._id_5C3E = 75;
    level._id_3C1F._id_8A9D = 1;
    level._id_3C1F._id_93F0 = 100;
    level._id_3C1F._id_669F = ( 0, 0, 0 );
    level._id_3C1F._id_2FA0 = getent( "dryer_fan", "targetname" );
    level._id_3C1F._id_2FA1 = ( 0, 1400, 0 );
    level._id_3C1F._id_3C2B = 170;
    var_0 = level._id_3C1F._id_1D2B[0];

    for (;;)
    {
        if ( isdefined( var_0._id_04A5 ) )
        {
            var_1 = _id_A4F0::_id_40F9( var_0._id_04A5, "targetname" );
            level._id_3C1F._id_1D2B = _id_A4F0::_id_07A5( level._id_3C1F._id_1D2B, var_1 );
            var_0 = var_1;
            continue;
        }
        else
            break;

        wait 0.05;
    }

    level._id_3C1F._id_22F7 = getentarray( "crane_collision01", "targetname" );
    level._id_3C1F._id_22F6 = level._id_3C1F._id_22F7;

    foreach ( var_3 in level._id_3C1F._id_22F7 )
        var_3._id_9A53 = 1;

    level._id_3C1F._id_22F5 = getentarray( "rack_collision01", "targetname" );
    level._id_3C1F._id_22F4 = level._id_3C1F._id_22F5;

    foreach ( var_3 in level._id_3C1F._id_22F5 )
        var_3._id_9A53 = 1;

    _id_22FA( level._id_3C1F._id_1D2B );
}

_id_0853()
{
    level._id_3C1F._id_93FA = _id_A4F0::_id_07A5( level._id_3C1F._id_93FA, self );
}

_id_73AD()
{
    wait 0.05;
    level._id_3C1F._id_93FA = _id_A4F0::_id_0D01( level._id_3C1F._id_93FA );
}

_id_22FA( var_0 )
{
    var_1 = 5;
    var_2 = 5;

    for (;;)
    {
        if ( level._id_3C1F._id_1D2D == 1 )
        {
            if ( level._id_3C1F._id_22F6.size > 0 )
            {
                var_3 = randomint( 100 );

                if ( var_3 > 40 )
                {
                    var_4 = _id_8996( var_0, 1 );

                    if ( isdefined( var_4 ) )
                        var_4 thread _id_8D2C( var_2, var_1 );
                }
            }

            wait(var_1 + var_2 + randomfloatrange( 3.0, 7.0 ));
            continue;
        }

        wait 1;
    }
}

_id_8D2C( var_0, var_1 )
{
    thread _id_A204( var_0, var_1 );
}

_id_A204( var_0, var_1 )
{
    self endon( "death" );
    self endon( "deleted" );

    for (;;)
    {
        self waittill( "crane_note_track", var_2 );

        if ( var_2 == "crane_move_start" )
        {
            if ( level._id_3C1F._id_1D2D == 0 )
            {
                if ( isdefined( self ) && self._id_671B == 0 )
                {
                    self _meth_84BD( 1 );
                    self._id_671B = 1;
                    _id_1D06();
                }
            }
            else
            {
                thread _id_A724::_id_8732( "emt_conveyor_belt_gears", self );
                thread _id_A724::_id_8732( "emt_conveyor_belt_sparks", self );
                playfxontag( level._id_5CBD._id_22F9, self, "TAG_ORIGIN" );
            }

            continue;
        }

        if ( var_2 == "crane_move_stop" )
        {
            thread _id_8EDA();
            stopfxontag( level._id_5CBD._id_22F9, self, "TAG_ORIGIN" );
            continue;
        }

        if ( var_2 == "crane_wiggle_stop" )
            continue;

        if ( var_2 == "crane_particle_01" || var_2 == "crane_particle_02" || var_2 == "crane_particle_03" )
        {
            thread _id_8A95( var_0, var_2 );
            continue;
        }

        if ( var_2 == "rotate_start" )
        {
            thread _id_7603( var_0 );
            continue;
        }

        if ( var_2 == "rotate_stop" )
        {
            thread _id_8EDA();
            continue;
        }

        if ( var_2 == "crane_finish" )
            thread _id_73D2();
    }
}

_id_1D06()
{
    self endon( "death" );
    self endon( "deleted" );

    for (;;)
    {
        if ( isdefined( self ) )
        {
            if ( level._id_3C1F._id_1D2D == 1 )
            {
                if ( self._id_671B == 1 )
                {
                    self _meth_84BD( 0 );
                    self._id_671B = 0;
                    thread _id_A724::_id_8732( "emt_conveyor_belt_gears", self );
                    thread _id_A724::_id_8732( "emt_conveyor_belt_sparks", self );
                    playfxontag( level._id_5CBD._id_22F9, self, "TAG_ORIGIN" );
                    break;
                }
            }
        }
        else
            break;

        wait 0.5;
    }
}

_id_8332()
{
    var_0 = getentarray( "lab2_robot_arm", "targetname" );

    foreach ( var_2 in var_0 )
    {
        wait(randomfloatrange( 0.0, 1 ));
        var_2 _meth_827B( "lab2_robot_arm_01_idle_anim", "emt_servo_sparks" );
        var_2 thread _id_A24C();
    }
}

_id_A24C()
{
    self endon( "death" );
    self endon( "deleted" );

    for (;;)
    {
        self waittill( "emt_servo_sparks", var_0 );

        if ( isdefined( var_0 ) && var_0 == "robot_arm_sparks_on" )
        {
            playfxontag( _id_A4F0::_id_3FA6( "welding_sparks" ), self, "wristSwivel" );
            continue;
        }

        if ( isdefined( var_0 ) && var_0 == "emt_servo_sparks" )
            thread _id_A724::_id_8732( "emt_servo_sparks", self );
    }
}

_id_8EDA()
{
    self _meth_80AC();
    wait 0.05;
    thread _id_A724::_id_8732( "mp_lab_missilerack_stop01", self );
}

_id_7603( var_0 )
{
    if ( self._id_46E3 == 1 )
    {
        if ( level._id_3C1F._id_1D2D == 1 )
        {
            thread _id_A724::_id_8730( "emt_air_blast_turn", level._id_3C1F._id_6699._id_02E6 );
            thread _id_A724::_id_8730( "emt_air_blast_clean", level._id_3C1F._id_6699._id_02E6 );
            level._id_3C1F._id_6699 thread _id_66A0( level._id_5CBD._id_2FA3, level._id_3C1F._id_6699._id_0041, 3 );
            thread _id_8CFA( level._id_5CBD._id_1ACC, var_0 );
            thread _id_75F8();
        }
    }
}

_id_75F8()
{
    level._id_3C1F._id_2FA0 _meth_82BD( level._id_3C1F._id_2FA1, 7, 1, 5 );
}

_id_8A95( var_0, var_1 )
{
    if ( self._id_46E3 == 1 )
    {
        if ( level._id_3C1F._id_1D2D == 1 )
        {
            thread _id_66A1( var_1, var_0 );
            thread _id_8CFA( level._id_5CBD._id_1ACB, var_0 );
        }
    }
}

_id_8996( var_0, var_1 )
{
    var_2 = -210;
    var_3 = spawn( "script_model", var_0[0]._id_02E6 + ( 0, 0, var_2 ) );
    var_3 _id_6A36();
    var_4 = _id_3F39( level._id_3C1F._id_22F6 );

    if ( isdefined( var_4 ) && isdefined( var_4._id_202E ) )
    {
        var_3 _meth_80B1( "lab2_industrial_crane_01" );
        var_3._id_671B = 0;
        var_3._id_22F6 = var_4._id_202E;
        level._id_3C1F._id_22F6 = var_4._id_6E2C;
        var_3._id_22F6._id_02E6 = var_3._id_02E6;
        var_3._id_22F6._id_0041 = var_3._id_0041;
        var_3._id_22F6 _meth_8446( var_3 );
        var_3 _meth_82BE();
    }
    else
    {
        if ( isdefined( var_3 ) )
            var_3 delete();

        return undefined;
    }

    var_3 _id_0853();
    wait 0.5;
    playfxontag( _id_A4F0::_id_3FA6( "lab_crane_arm_01_lights" ), var_3, "TAG_ORIGIN" );
    playfxontag( level._id_5CBD._id_22F9, var_3, "TAG_ORIGIN" );

    if ( var_1 == 1 )
    {
        var_4 = _id_3F39( level._id_3C1F._id_22F4 );

        if ( isdefined( var_4 ) && isdefined( var_4._id_202E ) )
        {
            var_3._id_1D2A = spawn( "script_model", var_3 _meth_8180( "tag_cargo" ) );
            var_3._id_353B = 0;
            var_3._id_1D2A _meth_80B1( "lab2_cannister_holder_01" );
            var_3._id_1D2A _meth_804D( var_3, "tag_cargo" );
            var_3._id_1D2A _id_0853();
            var_3._id_46E3 = 1;
            var_3._id_1D2A _meth_82BE();
            thread _id_6DC8( var_3._id_1D2A );
            var_3._id_1D2A._id_25AA = level._id_3C1F._id_25AA;
            var_3._id_1D2A._id_5A28 = level._id_3C1F._id_5A28;
            var_3._id_1D2A._id_5C3E = level._id_3C1F._id_5C3E;
            var_3._id_1D2A thread _id_A205( var_3 );
            var_3._id_1D2A._id_22F4 = var_4._id_202E;
            level._id_3C1F._id_22F4 = var_4._id_6E2C;
            var_3._id_1D2A._id_22F4 thread _id_A4F0::_id_3314( 1 );
            var_3._id_1D2A._id_22F4._id_02E6 = var_3._id_1D2A._id_02E6;
            var_3._id_1D2A._id_22F4._id_0041 = var_3._id_1D2A._id_0041;
            var_3._id_1D2A._id_22F4 _meth_8446( var_3._id_1D2A );
        }
        else
            var_3._id_46E3 = 0;
    }
    else
        var_3._id_46E3 = 0;

    var_3 _meth_827B( "lab2_industrial_crane_anim", "crane_note_track" );
    return var_3;
}

_id_6DC8( var_0 )
{
    var_1 = 3;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        wait 0.05;

        if ( isdefined( var_0 ) && !_func_294( var_0 ) )
        {
            var_0 _meth_8053();

            if ( var_2 == 2 )
            {
                var_3 = playfxontag( _id_A4F0::_id_3FA6( "lab_canister_liquid_orange" ), var_0, "tag_origin" );
                var_0 _meth_8053();
            }

            continue;
        }

        return;
    }
}

_id_6A36()
{
    var_0 = 0.05;
    var_1 = level._id_3C1F._id_669F;
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    var_2 = self._id_02E6 + var_1;
    wait(var_0);
    return;
}

_id_3F39( var_0 )
{
    if ( var_0.size > 0 )
    {
        var_1 = spawnstruct();
        var_1._id_202E = var_0[var_0.size - 1];
        var_0 = _id_A4F0::_id_0CF6( var_0, var_1._id_202E );
        var_0 = _id_A4F0::_id_0CF9( var_0 );
        var_1._id_6E2C = var_0;
        return var_1;
    }
    else
        return;
}

_id_07D9( var_0 )
{
    self notify( "entity_path_disconnect_thread" );
    self _meth_804F();
    self._id_02E6 = ( 0, 0, -5000 );
    var_0 = _id_A4F0::_id_07A5( var_0, self );
    return var_0;
}

_id_A205( var_0 )
{
    self endon( "deleted" );
    self endon( "death" );
    self._id_01E7 = 10000000;
    self._id_3650 = level._id_3C1F._id_93F0;
    self _meth_82C0( 1 );
    self _meth_82C1( 1 );
    self._id_565A = 0;

    for (;;)
    {
        if ( isdefined( self ) )
        {
            self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

            if ( isdefined( var_10 ) )
            {
                var_11 = _id_A75A::_id_8F56( var_10, "_lefthand" );

                switch ( var_11 )
                {
                    case "mp_lab_gas":
                    case "concussion_grenade_mp":
                    case "flash_grenade_mp":
                    case "smoke_grenade_mp":
                    case "mp_lab_gas_explosion":
                    case "paint_grenade_mp":
                        continue;
                }

                if ( issubstr( var_10, "m990" ) )
                {
                    if ( var_5 == "MOD_PISTOL_BULLET" )
                        var_1 = 50;
                    else if ( var_5 == "MOD_EXPLOSIVE" )
                        var_1 = 100;
                }
            }

            if ( isdefined( var_5 ) )
            {
                if ( _id_A75A::_id_514D( var_5 ) || var_5 == "MOD_TRIGGER_HURT" )
                    continue;
            }

            if ( isdefined( var_2 ) )
                var_2 _id_A784::_id_9B04( "standard" );

            if ( var_0._id_353B == 0 )
            {
                self._id_3650 += var_1 * -1;

                if ( self._id_3650 <= 0 )
                {
                    thread _id_6722();
                    thread _id_14C0( var_0, var_2 );
                    level notify( "Chemical_Exploded" );
                    break;
                }
            }
            else if ( var_0._id_353B == 1 )
                break;
        }
        else if ( !isdefined( self ) )
            break;
    }
}

_id_9357( var_0 )
{
    self endon( "deleted" );
    self endon( "death" );
    thread _id_9358( level._id_5CBD._id_88B4 );
    var_1 = level._id_3C1F._id_93F0 * 0.05;
    var_1 = int( var_1 );

    while ( isdefined( self ) )
    {
        wait 1;
        self notify( "damage", var_1, var_0 );
    }
}

_id_9358( var_0 )
{
    thread _id_A4F0::_id_6972( "mp_lab_gas_leak_loop01", ( 0, 0, 64 ) );
    playfxontag( var_0, self, "tag_origin" );
}

_id_14C0( var_0, var_1 )
{
    var_0 endon( "death" );
    var_2 = 0.1;
    var_0._id_353B = 1;
    var_3 = self._id_02E6;

    if ( isdefined( self ) && !_func_294( self ) )
    {
        if ( isdefined( self._id_22F4 ) )
        {
            self notify( "entity_path_disconnect_thread" );
            self._id_22F4 _meth_8058();
        }
    }

    var_4 = level._id_3C1F._id_354A;
    var_5 = level._id_3C1F._id_3549;
    var_6 = thread _id_A4F0::_id_8953();
    var_6 _meth_8053();
    var_6 _meth_8092();
    var_6._id_02E6 = var_0._id_02E6 + ( 0, 0, var_4 );
    var_6._id_0041 = var_5;
    var_6 _meth_8446( var_0, "tag_origin" );
    playfxontag( level._id_5CBD._id_5CB5, var_6, "tag_origin" );
    var_6 thread _id_284F( var_0, self, 0.05 );
    var_7 = var_0._id_02E6 + ( 0, 0, var_4 );
    thread _id_0FF9( var_7 );
    wait 0.05;

    if ( isdefined( self ) && !_func_294( self ) )
    {
        if ( isdefined( self._id_22F4 ) )
            level._id_3C1F._id_22F4 = self._id_22F4 _id_07D9( level._id_3C1F._id_22F4 );

        killfxontag( _id_A4F0::_id_3FA6( "lab_canister_liquid_orange" ), self, "tag_origin" );
        _id_A75A::_id_27EE( var_2, ::_id_9A2C );
    }

    if ( isdefined( var_0 ) && !_func_294( var_0 ) )
        var_0._id_46E3 = 0;

    wait(var_2 + 0.05);
    thread _id_5CB5( var_1, var_3 );
    thread _id_5CB3( level._id_5CBD._id_43D9, var_3 + ( 0, 0, -70 ), var_1 );
}

_id_284F( var_0, var_1, var_2 )
{
    var_1 _id_A4F0::_id_A060( "death", "deleted" );
    wait(var_2);

    if ( isdefined( self ) && !_func_294( self ) )
        self delete();
}

_id_5352()
{
    self endon( "death" );
    wait 0.05;

    if ( isdefined( self ) && !_func_294( self ) )
    {
        killfxontag( _id_A4F0::_id_3FA6( "lab_canister_liquid_orange" ), self, "tag_origin" );
        wait 0.05;

        if ( isdefined( self ) && !_func_294( self ) )
            self delete();
    }
}

_id_9A2C()
{
    if ( isdefined( self ) && !_func_294( self ) )
    {
        self _meth_804F();
        self delete();
    }
}

_id_5CB5( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        radiusdamage( var_1 + ( 0, 0, -44 ), level._id_3C1F._id_25AA, level._id_3C1F._id_5A28, level._id_3C1F._id_5C3E, var_0, "MOD_EXPLOSIVE", "mp_lab_gas_explosion" );
    else
        radiusdamage( var_1 + ( 0, 0, -44 ), level._id_3C1F._id_25AA, level._id_3C1F._id_5A28, level._id_3C1F._id_5C3E, undefined, "MOD_EXPLOSIVE", "mp_lab_gas_explosion" );
}

_id_5CB3( var_0, var_1, var_2 )
{
    level._id_3C2A = level._id_6723 * 0.15;
    var_3 = spawnfx( var_0, var_1 + ( 0, 0, 0 ) );
    var_4 = spawn( "script_origin", var_1 );
    thread _id_1D29( var_4, var_1, var_2 );
    wait(level._id_3C2A);
    wait 5;
    var_4 notify( "Gas_Particle_Gone" );
    wait 1;
    var_4 _id_2849();
    var_3 _id_2849();
}

_id_2849()
{
    if ( isdefined( self ) )
        self delete();
}

_id_1D29( var_0, var_1, var_2 )
{
    var_0 endon( "Gas_Particle_Gone" );

    for (;;)
    {
        if ( isdefined( var_2 ) )
            var_2 _meth_81D5( var_1, level._id_3C1F._id_3C2B, 10, 10, var_2, "MOD_TRIGGER_HURT", "mp_lab_gas" );
        else
            radiusdamage( var_1, level._id_3C1F._id_3C2B, 10, 10, undefined, "MOD_TRIGGER_HURT", "mp_lab_gas" );

        thread _id_3787( var_1 );
        wait 1;
    }
}

_id_3787( var_0 )
{
    var_1 = level._id_3C1F._id_3C2B * level._id_3C1F._id_3C2B;

    foreach ( var_3 in level._id_0328 )
    {
        if ( !var_3 _id_A75A::_id_51E0() )
        {
            var_4 = distancesquared( var_3._id_02E6, var_0 );

            if ( var_4 < var_1 && !var_3 _id_A75A::_id_05CB( "specialty_stun_resistance" ) )
                var_3 thread _id_83CC();
        }
    }
}

_id_83CC()
{
    if ( self._id_3C2C <= 0 )
    {
        thread _id_35F0();
        thread _id_73EA();
    }

    self._id_3C2C = 2;
    self _meth_8182( "mp_lab_gas", 1 );

    while ( self._id_3C2C > 0 )
    {
        self._id_3C2C--;
        wait 1;
    }

    self notify( "gas_end" );
    _id_3165();
}

_id_73EA()
{
    self endon( "gas_end" );
    self waittill( "death" );
    thread _id_3166();
}

_id_66A1( var_0, var_1 )
{
    foreach ( var_3 in level._id_3C1F._id_58C1 )
    {
        if ( var_3._id_039B == var_0 )
        {
            self _meth_809A( "emt_water_spray_hard" );
            var_3 thread _id_66A0( level._id_5CBD._id_8A98, var_3._id_0041, var_1 );
        }
    }

    foreach ( var_3 in level._id_3C1F._id_8A97 )
    {
        if ( var_3._id_039B == var_0 )
            var_3 thread _id_8A96( level._id_5CBD._id_8A99, var_3._id_0041, var_1 );
    }
}

_id_8CFA( var_0, var_1 )
{
    wait(var_1);
    var_2 = 0;
    var_3 = 0.1;

    while ( var_2 < 4.25 )
    {
        if ( isdefined( self ) && self._id_46E3 == 1 )
        {
            var_4 = self._id_02E6 + ( 0, 0, -8 );
            var_5 = self._id_0041 + ( 270, 0, 0 );
            playfx( var_0, var_4, anglestoforward( var_5 ), anglestoup( var_5 ) );
            wait(var_3);
            var_2 += var_3;
            continue;
        }

        return;
    }
}

_id_66A0( var_0, var_1, var_2 )
{
    var_3 = spawnfx( var_0, self._id_02E6, anglestoforward( var_1 ), anglestoup( var_1 ) );
    triggerfx( var_3 );

    if ( isdefined( var_2 ) )
        wait(var_2);

    if ( isdefined( var_3 ) )
        var_3 delete();
}

_id_8A96( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        wait(var_2);

    playfx( var_0, self._id_02E6, anglestoforward( var_1 ), anglestoup( var_1 ) );
}

_id_73D2()
{
    if ( isdefined( self ) && !_func_294( self ) )
    {
        if ( isdefined( self._id_1D2A ) && !_func_294( self._id_1D2A ) )
            killfxontag( _id_A4F0::_id_3FA6( "lab_canister_liquid_orange" ), self._id_1D2A, "tag_origin" );

        wait 0.05;

        if ( isdefined( self ) && !_func_294( self ) )
        {
            if ( isdefined( self._id_1D2A ) && !_func_294( self._id_1D2A ) )
            {
                if ( isdefined( self._id_1D2A._id_22F4 ) )
                    level._id_3C1F._id_22F4 = self._id_1D2A._id_22F4 _id_07D9( level._id_3C1F._id_22F4 );

                self._id_1D2A _meth_804F();
                self._id_1D2A delete();
            }

            level._id_3C1F._id_22F6 = self._id_22F6 _id_07D9( level._id_3C1F._id_22F6 );
            self notify( "deleted" );
            self delete();
        }
    }

    thread _id_73AD();
}

_id_6722()
{
    if ( !isdefined( level._id_6723 ) )
        level._id_6723 = 20;

    level._id_3C1F._id_1D2C = level._id_6723;

    if ( level._id_3C1F._id_1D2D == 1 )
        _id_A4F0::_id_0D13( level._id_09C1._id_8A5A, ::_id_8A58 );

    if ( level._id_3C1F._id_1D2D == 1 )
        thread _id_6A21();
    else
        return;

    for ( level._id_3C1F._id_1D2D = 0; level._id_3C1F._id_1D2C > 0; level._id_3C1F._id_1D2C-- )
        wait 1;

    _id_A4F0::_id_0D13( level._id_09C1._id_8A5A, ::_id_8A59 );
    level._id_3C1F._id_1D2D = 1;
    level notify( "Restarting_System" );
}

_id_8A58()
{
    self _meth_8054();
    level thread _id_A4ED::_id_06F5( 200 );
}

_id_8A59()
{
    self _meth_8053();
    _func_292( 200 );
}

_id_6A21()
{
    var_0 = spawn( "script_origin", level._id_09C1._id_09C0._id_02E6 );
    var_0 _meth_8075( "mp_lab_alarm_shutdown01" );
    wait 5;
    var_0 _meth_80AC();
    wait 0.05;
    var_0 delete();
}

_id_241D()
{
    if ( !isdefined( self._id_3C2D ) )
    {
        self._id_3C2D = newclienthudelem( self );
        self._id_3C2D._id_0530 = 0;
        self._id_3C2D._id_0538 = 0;
        self._id_3C2D _meth_80CC( "lab_gas_overlay", 640, 480 );
        self._id_3C2D._id_002C = "left";
        self._id_3C2D._id_002D = "top";
        self._id_3C2D._id_01F4 = "fullscreen";
        self._id_3C2D._id_0500 = "fullscreen";
        self._id_3C2D._id_0037 = 0;
    }
}

_id_35F0()
{
    level endon( "game_ended" );
    self endon( "gas_end" );
    self endon( "death" );

    if ( isdefined( self._id_3C2D ) )
    {
        for (;;)
        {
            self._id_3C2D _meth_8084( 0.4 );
            self._id_3C2D._id_0037 = 1;
            wait 0.5;
            self._id_3C2D _meth_8084( 0.4 );
            self._id_3C2D._id_0037 = 0.5;
            wait 0.5;
        }
    }
}

_id_3165()
{
    if ( isdefined( self._id_3C2D ) )
    {
        self._id_3C2D _meth_8084( 0.2 );
        self._id_3C2D._id_0037 = 0.0;
    }
}

_id_3166()
{
    if ( isdefined( self._id_3C2D ) )
        self._id_3C2D._id_0037 = 0.0;
}

_id_804D()
{

}

_id_0FF9( var_0 )
{
    thread _id_A724::_id_8730( "lab2_tank_exp", var_0 );
}

_id_10C3()
{
    var_0 = self;
    var_1 = "veh_drone_heavy_lifter_lp";
    thread _id_A724::_id_8734( var_1, var_0 );
    var_0 thread _id_10E6();
}

_id_10E6()
{
    wait 32;
    thread _id_A724::_id_8732( "vo_heli_warn_ext", self );
    wait 6.5;
    thread _id_A724::_id_8732( "vo_heli_warn_ext", self );
}

_id_0E82()
{
    thread _id_A724::_id_8732( "lab2_building_sway", self );
}

_id_0E81()
{
    thread _id_A724::_id_8732( "lab2_building_drop", self );
}
