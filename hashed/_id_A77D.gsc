// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_058F["vlobby_dust"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_dust" );
    level._id_058F["vlobby_steam"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_steam" );
    level._id_058F["expround_asphalt_1"] = loadfx( "vfx/weaponimpact/expround_asphalt_1" );
    level._id_058F["recovery_scoring_add1"] = loadfx( "vfx/map/recovery/recovery_scoring_add1" );
    level._id_058F["recovery_scoring_add2"] = loadfx( "vfx/map/recovery/recovery_scoring_add2" );
    level._id_058F["recovery_scoring_add25"] = loadfx( "vfx/map/recovery/recovery_scoring_add25" );
    level._id_058F["recovery_scoring_add50"] = loadfx( "vfx/map/recovery/recovery_scoring_add50" );
    level._id_058F["recovery_scoring_add75"] = loadfx( "vfx/map/recovery/recovery_scoring_add75" );
    level._id_058F["recovery_scoring_add100"] = loadfx( "vfx/map/recovery/recovery_scoring_add100" );
    level._id_058F["recovery_scoring_minus1"] = loadfx( "vfx/map/recovery/recovery_scoring_minus1" );
    level._id_058F["recovery_scoring_minus2"] = loadfx( "vfx/map/recovery/recovery_scoring_minus2" );
    level._id_058F["recovery_scoring_minus25"] = loadfx( "vfx/map/recovery/recovery_scoring_minus25" );
    level._id_058F["recovery_scoring_minus50"] = loadfx( "vfx/map/recovery/recovery_scoring_minus50" );
    level._id_058F["recovery_scoring_minus75"] = loadfx( "vfx/map/recovery/recovery_scoring_minus75" );
    level._id_058F["recovery_scoring_minus100"] = loadfx( "vfx/map/recovery/recovery_scoring_minus100" );
    level._id_058F["recovery_scoring_target_shutter_enemy"] = loadfx( "vfx/map/recovery/recovery_scoring_target_shutter" );
    level._id_058F["recovery_scoring_target_shutter_friendly"] = loadfx( "vfx/map/recovery/recovery_scoring_hostage_shutter" );
    level._id_058F["mp_ref_elev_rain_inner"] = loadfx( "vfx/map/mp_refraction/mp_ref_elev_rain_inner" );
    level._id_058F["steam_cylinder_lrg"] = loadfx( "vfx/steam/steam_cylinder_lrg" );
    level._id_058F["electrical_sparks_runner"] = loadfx( "vfx/explosion/electrical_sparks_runner" );
    level._id_058F["emergency_lt_red_off"] = loadfx( "vfx/lights/emergency_lt_red_off" );
    level._id_058F["emergency_lt_red_on"] = loadfx( "vfx/lights/emergency_lt_red_on" );
    level._id_058F["sparks_burst_b"] = loadfx( "vfx/explosion/sparks_burst_b" );
    level._id_058F["emergency_lt_red_pulse_lp"] = loadfx( "vfx/lights/emergency_lt_red_pulse_lp" );
    level._id_058F["vlobby_spt_shadow"] = loadfx( "vfx/lights/mp_vlobby_refraction/vlobby_spt_shadow" );
    thread _id_3048();
    thread _id_3053();
    thread _id_5732();
    _id_A75A::_id_27EE( 0.1, ::_id_A1A6 );
}

_id_302C()
{
    wait 1;
    level thread _id_A4ED::_id_06F5( 213 );
}

_id_3048()
{
    wait 1;
    level._id_70F4 = _id_A4F0::_id_8953();
    level._id_70F4 _meth_8053();
    wait 1;
    level._id_70F4._id_02E6 = ( 24, 1144, 6459 );
    level._id_70F4._id_0041 = ( 270, 0, 0 );
    playfxontag( _id_A4F0::_id_3FA6( "mp_ref_elev_rain_inner" ), level._id_70F4, "tag_origin" );
}

_id_3047()
{
    wait 8;
    stopfxontag( _id_A4F0::_id_3FA6( "mp_ref_elev_rain_inner" ), level._id_70F4, "tag_origin" );
    level._id_70F4 delete();
}

_id_3053()
{
    wait 1;
    level._id_8E17 = _id_A4F0::_id_8953();
    level._id_8E17 _meth_8053();
    wait 1;
    level._id_8E17._id_02E6 = ( -10, 1150, 1482 );
    level._id_8E17._id_0041 = ( 270, 0, 0 );
    playfxontag( _id_A4F0::_id_3FA6( "steam_cylinder_lrg" ), level._id_8E17, "tag_origin" );
}

_id_3052()
{
    wait 8;
    stopfxontag( _id_A4F0::_id_3FA6( "steam_cylinder_lrg" ), level._id_8E17, "tag_origin" );
    level._id_8E17 delete();
}

_id_3037()
{
    wait 7;
    level thread _id_A4ED::_id_06F5( 201 );
}

_id_302F()
{
    wait 2;
    level thread _id_A4ED::_id_06F5( 202 );
}

_id_3034()
{
    wait 1;
    level thread _id_A4ED::_id_06F5( 203 );
}

_id_3059()
{
    wait 13;
    level thread _id_A4ED::_id_06F5( 204 );
}

_id_304D()
{
    wait 10;
    level thread _id_A4ED::_id_06F5( 205 );
}

_id_302B()
{
    wait 10;
    level thread _id_A4ED::_id_06F5( 206 );
}

_id_3044()
{
    wait 9;
    level thread _id_A4ED::_id_06F5( 207 );
}

_id_304F()
{
    wait 7.5;
    level thread _id_A4ED::_id_06F5( 211 );
}

_id_8E19()
{
    wait 12;
    level thread _id_A4ED::_id_06F5( 214 );
}

_id_0DE3()
{
    wait 1;
    var_0 = getent( "elevator_lock_b", "targetname" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_off" ), var_0, "TAG_VFX_LIGHT1" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_off" ), var_0, "TAG_VFX_LIGHT2" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_off" ), var_0, "TAG_VFX_LIGHT3" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_off" ), var_0, "TAG_VFX_LIGHT4" );
    wait 0.1;
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_off" ), var_0, "TAG_VFX_LIGHT5" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_off" ), var_0, "TAG_VFX_LIGHT6" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_off" ), var_0, "TAG_VFX_LIGHT7" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_off" ), var_0, "TAG_VFX_LIGHT8" );
}

_id_6698()
{
    wait 6;
    var_0 = getent( "elevator_lock_b", "targetname" );
    level thread _id_A4ED::_id_06F5( 212 );
    wait 0.1;
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT7" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT6" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT2" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT3" );
    wait 0.55;
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT8" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT5" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT4" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT1" );
}

_id_6697()
{
    wait 1;
    var_0 = getent( "elevator_lock_b", "targetname" );
    wait 2;
    stopfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT1" );
    stopfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT2" );
    stopfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT3" );
    stopfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT4" );
    wait 0.55;
    stopfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT5" );
    stopfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT6" );
    stopfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT7" );
    stopfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_pulse_lp" ), var_0, "TAG_VFX_LIGHT8" );
    wait 8;
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_on" ), var_0, "TAG_VFX_LIGHT1" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_on" ), var_0, "TAG_VFX_LIGHT8" );
    wait 0.5;
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_on" ), var_0, "TAG_VFX_LIGHT2" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_on" ), var_0, "TAG_VFX_LIGHT7" );
    wait 0.5;
    playfxontag( _id_A4F0::_id_3FA6( "sparks_burst_b" ), var_0, "TAG_VFX_LIGHT3" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_on" ), var_0, "TAG_VFX_LIGHT6" );
    wait 0.5;
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_on" ), var_0, "TAG_VFX_LIGHT4" );
    playfxontag( _id_A4F0::_id_3FA6( "emergency_lt_red_on" ), var_0, "TAG_VFX_LIGHT5" );
    wait 0.5;
    playfxontag( _id_A4F0::_id_3FA6( "electrical_sparks_runner" ), var_0, "TAG_VFX_LIGHT3" );
}

_id_3040()
{
    wait 10.2;
    level thread _id_A4ED::_id_06F5( 208 );
}

_id_A1A6()
{
    var_0 = getentarray( "warning_signs", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 _meth_8054();
}

_id_A1A7()
{
    var_0 = getentarray( "warning_signs", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 _meth_8053();

    level thread _id_A4ED::_id_06F5( 210 );
}

_id_5732()
{
    for (;;)
    {
        wait(randomfloatrange( 2, 6 ));
        var_0 = 220 + randomint( 8 );
        _func_222( var_0 );
    }
}
