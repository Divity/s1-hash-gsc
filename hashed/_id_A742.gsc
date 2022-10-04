// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( isdefined( level._id_05E5 ) )
        return;

    level._id_05E5 = 1;
    level._id_9E4D = getdvarint( "virtualLobbyActive", 0 );
    _id_A75A::_id_7DED();
    level._id_2409 = getdvar( "createfx" ) != "";
    _id_A4F0::_id_8F5D();
    _id_A75A::_id_4DBD();
    _id_A75A::_id_4DED();
    _id_A75A::_id_4DBE();
    level._id_3C9B = 0;
    level._id_3844 = spawnstruct();
    level._id_3844 _id_A4F0::_id_0D6F();

    if ( !isdefined( level._id_382C ) )
    {
        level._id_382C = [];
        level._id_386A = [];
    }

    level._id_7409 = getdvarfloat( "scr_RequiredMapAspectratio", 1 );
    level._id_23EE = _id_A79D::_id_2401;
    level._id_4AFA = _id_A79D::_id_7FE8;
    level._id_5653 = _id_A75A::_id_5652;
    thread _id_A7B3::_id_0209();

    if ( !isdefined( level._id_3AE2 ) )
        level._id_3AE2 = [];

    level._id_3AE2["precacheMpAnim"] = ::map_restart;
    level._id_3AE2["scriptModelPlayAnim"] = ::_meth_8279;
    level._id_3AE2["scriptModelClearAnim"] = ::_meth_827A;

    if ( !level._id_2409 )
    {
        thread _id_A747::_id_0209();
        thread _id_A74F::main();
        thread _id_A72A::_id_0209();
        thread _id_A4EC::_id_0209();
        thread maps\mp\_dynamic_world::_id_0209();
        thread common_scripts\_destructible::_id_0209();
    }

    game["thermal_vision"] = "default";
    visionsetnaked( "", 0 );
    visionsetnight( "default_night_mp" );
    visionsetmissilecam( "orbital_strike" );
    visionsetthermal( game["thermal_vision"] );
    visionsetpain( "near_death_mp", 0 );
    var_0 = getentarray( "lantern_glowFX_origin", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread _id_54BA();

    _id_A724::_id_4CB3();
    _id_A723::main();
    _id_830D();
    thread _id_A4EE::_id_4DBC();

    if ( level._id_2409 )
    {
        _id_A7AF::_id_7FA0();
        _id_A728::_id_2402();
    }

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        _id_284C();
        _id_A7AF::_id_7FA0();
        _id_A73F::main();
        level waittill( "eternity" );
    }

    thread _id_A73F::main();

    for ( var_2 = 0; var_2 < 6; var_2++ )
    {
        switch ( var_2 )
        {
            case 0:
                var_3 = "trigger_multiple";
                break;
            case 1:
                var_3 = "trigger_once";
                break;
            case 2:
                var_3 = "trigger_use";
                break;
            case 3:
                var_3 = "trigger_radius";
                break;
            case 4:
                var_3 = "trigger_lookat";
                break;
            default:
                var_3 = "trigger_damage";
                break;
        }

        var_4 = getentarray( var_3, "classname" );

        for ( var_1 = 0; var_1 < var_4.size; var_1++ )
        {
            if ( isdefined( var_4[var_1]._id_7AA0 ) )
                var_4[var_1]._id_79BA = var_4[var_1]._id_7AA0;

            if ( isdefined( var_4[var_1]._id_79BA ) )
                level thread _id_352D( var_4[var_1] );
        }
    }

    var_5 = getentarray( "trigger_hurt", "classname" );

    foreach ( var_7 in var_5 )
    {
        if ( isdefined( level.hurttriggerfunc ) )
        {
            var_7 thread [[ level.hurttriggerfunc ]]();
            continue;
        }

        var_7 thread _id_4B09();
    }

    thread _id_A721::main();
    level._id_3AE2["damagefeedback"] = _id_A784::_id_9B04;
    level._id_3AE2["setTeamHeadIcon"] = _id_A72D::_id_8022;
    level._id_54F9 = ::_meth_80B2;
    level._id_54F6 = ::_meth_80B3;
    level._id_214E = ::_meth_8058;
    level._id_2B38 = ::_meth_8057;
    setdvar( "sm_spotLightScoreModelScale", 0.1 );
    setdvar( "sm_spotShadowFadeTime", 1.0 );
    setdvar( "r_specularcolorscale", 2.5 );
    setdvar( "r_diffusecolorscale", 1 );
    setdvar( "r_lightGridEnableTweaks", 0 );
    setdvar( "r_lightGridIntensity", 1 );
    setdvar( "r_lightGridContrast", 0 );
    setdvar( "r_dof_physical_enable", 1 );
    setdvar( "r_volumeLightScatter", 0 );
    setdvar( "r_uiblurdstmode", 0 );
    setdvar( "r_blurdstgaussianblurradius", 1 );
    setdvar( "r_dof_physical_bokehEnable", 0 );

    if ( level._id_02B3 )
        setdvar( "sm_polygonOffsetPreset", 0 );

    _id_8308();

    if ( level._id_9E4D == 0 && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
        precacheitem( "bomb_site_mp" );

    level._id_3692 = 0;
    _id_57BF();
}

_id_352D( var_0 )
{
    level endon( "killexplodertridgers" + var_0._id_79BA );
    var_0 waittill( "trigger" );

    if ( isdefined( var_0._id_796A ) && randomfloat( 1 ) > var_0._id_796A )
    {
        if ( isdefined( var_0._id_0395 ) )
            wait(var_0._id_0395);
        else
            wait 4;

        level thread _id_352D( var_0 );
        return;
    }

    _id_A4ED::_id_3526( var_0._id_79BA );
    level notify( "killexplodertridgers" + var_0._id_79BA );
}

_id_830D()
{
    var_0 = getentarray( "script_brushmodel", "classname" );
    var_1 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_7AA0 ) )
            var_0[var_2]._id_79BA = var_0[var_2]._id_7AA0;

        if ( isdefined( var_0[var_2]._id_79BA ) )
        {
            if ( var_0[var_2]._id_02A0 == "fx" && ( !isdefined( var_0[var_2]._id_04A7 ) || var_0[var_2]._id_04A7 != "exploderchunk" ) )
            {
                var_0[var_2] _meth_8054();
                continue;
            }

            if ( isdefined( var_0[var_2]._id_04A7 ) && var_0[var_2]._id_04A7 == "exploder" )
            {
                var_0[var_2] _meth_8054();
                var_0[var_2] _meth_82BF();
                continue;
            }

            if ( isdefined( var_0[var_2]._id_04A7 ) && var_0[var_2]._id_04A7 == "exploderchunk" )
            {
                var_0[var_2] _meth_8054();
                var_0[var_2] _meth_82BF();
            }
        }
    }

    var_3 = [];
    var_4 = getentarray( "script_brushmodel", "classname" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        if ( isdefined( var_4[var_2]._id_7AA0 ) )
            var_4[var_2]._id_79BA = var_4[var_2]._id_7AA0;

        if ( isdefined( var_4[var_2]._id_79BA ) )
            var_3[var_3.size] = var_4[var_2];
    }

    var_4 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        if ( isdefined( var_4[var_2]._id_7AA0 ) )
            var_4[var_2]._id_79BA = var_4[var_2]._id_7AA0;

        if ( isdefined( var_4[var_2]._id_79BA ) )
            var_3[var_3.size] = var_4[var_2];
    }

    var_4 = getentarray( "item_health", "classname" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        if ( isdefined( var_4[var_2]._id_7AA0 ) )
            var_4[var_2]._id_79BA = var_4[var_2]._id_7AA0;

        if ( isdefined( var_4[var_2]._id_79BA ) )
            var_3[var_3.size] = var_4[var_2];
    }

    if ( !isdefined( level._id_2417 ) )
        level._id_2417 = [];

    var_5 = [];
    var_5["exploderchunk visible"] = 1;
    var_5["exploderchunk"] = 1;
    var_5["exploder"] = 1;

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
    {
        var_6 = var_3[var_2];
        var_7 = _id_A4F0::_id_23FE( var_6._id_79EC );
        var_7._id_9C3A = [];
        var_7._id_9C3A["origin"] = var_6._id_02E6;
        var_7._id_9C3A["angles"] = var_6._id_0041;
        var_7._id_9C3A["delay"] = var_6._id_0395;
        var_7._id_9C3A["firefx"] = var_6._id_79C6;
        var_7._id_9C3A["firefxdelay"] = var_6._id_79C7;
        var_7._id_9C3A["firefxsound"] = var_6._id_79C8;
        var_7._id_9C3A["firefxtimeout"] = var_6._id_79C9;
        var_7._id_9C3A["earthquake"] = var_6._id_79B0;
        var_7._id_9C3A["damage"] = var_6._id_797C;
        var_7._id_9C3A["damage_radius"] = var_6._id_7AAC;
        var_7._id_9C3A["soundalias"] = var_6._id_7AC5;
        var_7._id_9C3A["repeat"] = var_6._id_7AB0;
        var_7._id_9C3A["delay_min"] = var_6._id_7989;
        var_7._id_9C3A["delay_max"] = var_6._id_7988;
        var_7._id_9C3A["target"] = var_6._id_04A5;
        var_7._id_9C3A["ender"] = var_6._id_79B3;
        var_7._id_9C3A["type"] = "exploder";

        if ( !isdefined( var_6._id_79EC ) )
            var_7._id_9C3A["fxid"] = "No FX";
        else
            var_7._id_9C3A["fxid"] = var_6._id_79EC;

        var_7._id_9C3A["exploder"] = var_6._id_79BA;

        if ( !isdefined( var_7._id_9C3A["delay"] ) )
            var_7._id_9C3A["delay"] = 0;

        if ( isdefined( var_6._id_04A5 ) )
        {
            var_8 = getentarray( var_7._id_9C3A["target"], "targetname" )[0];

            if ( isdefined( var_8 ) )
            {
                var_9 = var_8._id_02E6;
                var_7._id_9C3A["angles"] = vectortoangles( var_9 - var_7._id_9C3A["origin"] );
            }
            else
            {
                var_8 = _id_A4F0::_id_3E87( var_7._id_9C3A["target"] );

                if ( isdefined( var_8 ) )
                {
                    var_9 = var_8._id_02E6;
                    var_7._id_9C3A["angles"] = vectortoangles( var_9 - var_7._id_9C3A["origin"] );
                }
            }
        }

        if ( var_6._id_00AB == "script_brushmodel" || isdefined( var_6._id_02A0 ) )
        {
            var_7._id_02A0 = var_6;
            var_7._id_02A0._id_2B33 = var_6._id_799B;
        }

        if ( isdefined( var_6._id_04A7 ) && isdefined( var_5[var_6._id_04A7] ) )
            var_7._id_9C3A["exploder_type"] = var_6._id_04A7;
        else
            var_7._id_9C3A["exploder_type"] = "normal";

        var_7 common_scripts\_createfx::_id_6E6A();
    }
}

_id_54BA()
{
    _id_A4EE::_id_5879( "lantern_light", self._id_02E6, 0.3, self._id_02E6 + ( 0, 0, 1 ) );
}

_id_4B09()
{
    level endon( "game_ended" );
    wait(randomfloat( 1.0 ));

    for (;;)
    {
        foreach ( var_1 in level._id_0328 )
        {
            if ( var_1 _meth_80A9( self ) && _id_A75A::_id_5186( var_1 ) )
                var_1 _id_A75A::_id_066F();
        }

        wait 0.5;
    }
}

_id_8308()
{
    var_0 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_2 in var_0 )
    {
        switch ( getdvar( "mapname" ) )
        {
            case "mp_interchange":
                if ( var_2._id_02E6[2] > 150.0 )
                    continue;

                break;
        }

        var_3 = var_2._id_02E6 + ( 0, 0, 5 );
        var_4 = var_2._id_02E6 + ( 0, 0, 128 );
        var_5 = bullettrace( var_3, var_4, 0, var_2 );
        var_2._id_534A = spawn( "script_model", var_5["position"] );
        var_2._id_534A._id_04A7 = "killCamEnt_destructible_vehicle";
        var_2._id_534A _meth_834D( "explosive" );
        var_2 thread _id_284B();
    }

    var_7 = getentarray( "destructible_toy", "targetname" );

    foreach ( var_2 in var_7 )
    {
        var_3 = var_2._id_02E6 + ( 0, 0, 5 );
        var_4 = var_2._id_02E6 + ( 0, 0, 128 );
        var_5 = bullettrace( var_3, var_4, 0, var_2 );
        var_2._id_534A = spawn( "script_model", var_5["position"] );
        var_2._id_534A._id_04A7 = "killCamEnt_destructible_toy";
        var_2._id_534A _meth_834D( "explosive" );
        var_2 thread _id_284B();
    }

    var_10 = getentarray( "explodable_barrel", "targetname" );

    foreach ( var_2 in var_10 )
    {
        var_3 = var_2._id_02E6 + ( 0, 0, 5 );
        var_4 = var_2._id_02E6 + ( 0, 0, 128 );
        var_5 = bullettrace( var_3, var_4, 0, var_2 );
        var_2._id_534A = spawn( "script_model", var_5["position"] );
        var_2._id_534A._id_04A7 = "killCamEnt_explodable_barrel";
        var_2._id_534A _meth_834D( "explosive" );
        var_2 thread _id_284B();
    }
}

_id_284B()
{
    level endon( "game_ended" );
    var_0 = self._id_534A;
    var_0 endon( "death" );
    self waittill( "death" );
    wait 10;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_284C()
{
    var_0 = getentarray( "boost_jump_border", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    var_0 = getentarray( "mp_recovery_signage", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 delete();

    var_6 = getentarray( "horde_dome", "targetname" );

    foreach ( var_8 in var_6 )
        var_8 delete();

    var_10 = getentarray( "hp_zone_center", "targetname" );

    foreach ( var_12 in var_10 )
    {
        if ( isdefined( var_12._id_04A5 ) )
        {
            var_0 = getentarray( var_12._id_04A5, "targetname" );

            foreach ( var_2 in var_0 )
                var_2 delete();
        }
    }

    var_16 = getentarray( "orbital_bad_spawn_overlay", "targetname" );

    foreach ( var_18 in var_16 )
        var_18 delete();
}

_id_57BF()
{
    if ( isdefined( level._id_2239 ) )
        return;

    level._id_2239 = [ "gender", "shirt", "head", "pants", "gloves", "shoes", "kneepads", "gear", "hat", "eyewear", "exo" ];
    level._id_2238 = [];

    for ( var_0 = 0; var_0 < level._id_2239.size; var_0++ )
    {
        var_1 = level._id_2239[var_0];
        level._id_2238[var_1] = var_0;
    }

    level.costumetypehexids = [];
    level.costumetypehexids["gender"] = "0x61";
    level.costumetypehexids["shirt"] = "0x62";
    level.costumetypehexids["head"] = "0x63";
    level.costumetypehexids["pants"] = "0x64";
    level.costumetypehexids["gloves"] = "0x69";
    level.costumetypehexids["shoes"] = "0x6a";
    level.costumetypehexids["kneepads"] = "0x68";
    level.costumetypehexids["gear"] = "0x67";
    level.costumetypehexids["hat"] = "0x66";
    level.costumetypehexids["eyewear"] = "0x6c";
    level.costumetypehexids["exo"] = "0x6b";
}
