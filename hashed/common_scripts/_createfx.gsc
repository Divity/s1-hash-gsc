// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_88A8()
{
    return getdvar( "scr_createfx_type", "0" ) == "2";
}

_id_3BB3()
{
    return getdvar( "scr_createfx_type", "0" ) == "1";
}

_id_9502( var_0 )
{
    if ( isdefined( level._id_94B3 ) )
    {
        if ( !isdefined( level._id_94B4 ) )
            level._id_94B4 = [];

        level._id_94B4[level._id_94B4.size] = level._id_94B3._id_9C3A;
    }

    level._id_94B3 = var_0;
}

_id_23FB( var_0, var_1 )
{
    var_2 = spawnstruct();

    if ( _id_88A8() )
        _id_9502( var_2 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_2;
    }

    var_2._id_9C3A = [];
    var_2._id_9C3A["type"] = var_0;
    var_2._id_9C3A["fxid"] = var_1;
    var_2._id_9C3A["angles"] = ( 0, 0, 0 );
    var_2._id_9C3A["origin"] = ( 0, 0, 0 );
    var_2._id_2DDA = 1;

    if ( isdefined( var_1 ) && isdefined( level._id_2415 ) )
    {
        var_3 = level._id_2415[var_1];

        if ( !isdefined( var_3 ) )
            var_3 = [];

        var_3[var_3.size] = var_2;
        level._id_2415[var_1] = var_3;
    }

    return var_2;
}

_id_400D()
{
    return 0.5;
}

_id_405F()
{
    return -15;
}

_id_3F8B()
{
    return 0;
}

_id_3FD8()
{
    return 0.75;
}

_id_3FD7()
{
    return 2;
}

_id_2429()
{
    var_0 = spawnstruct();

    if ( _id_3BB3() )
        _id_9502( var_0 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_0;
    }

    var_0._id_9C3A = [];
    var_0._id_9C3A["type"] = "soundfx";
    var_0._id_9C3A["fxid"] = "No FX";
    var_0._id_9C3A["soundalias"] = "nil";
    var_0._id_9C3A["angles"] = ( 0, 0, 0 );
    var_0._id_9C3A["origin"] = ( 0, 0, 0 );
    var_0._id_9C3A["server_culled"] = 1;

    if ( getdvar( "serverCulledSounds" ) != "1" )
        var_0._id_9C3A["server_culled"] = 0;

    var_0._id_2DDA = 1;
    return var_0;
}

_id_2422()
{
    var_0 = _id_2429();
    var_0._id_9C3A["type"] = "soundfx_interval";
    var_0._id_9C3A["delay_min"] = _id_3FD8();
    var_0._id_9C3A["delay_max"] = _id_3FD7();
    return var_0;
}

_id_23F9()
{
    var_0 = spawnstruct();

    if ( _id_3BB3() )
        _id_9502( var_0 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_0;
    }

    var_0._id_9C3A = [];
    var_0._id_9C3A["origin"] = ( 0, 0, 0 );
    var_0._id_9C3A["dynamic_distance"] = 1000;
    var_0._id_9C3A["fxid"] = "No FX";
    var_0._id_9C3A["type"] = "soundfx_dynamic";
    var_0._id_9C3A["ambiencename"] = "nil";
    return var_0;
}

_id_242D()
{
    var_0 = spawnstruct();

    if ( _id_3BB3() )
        _id_9502( var_0 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_0;
    }

    var_0._id_9C3A = [];
    var_0._id_9C3A["type"] = "exploder";
    var_0._id_9C3A["fxid"] = "No FX";
    var_0._id_9C3A["soundalias"] = "nil";
    var_0._id_9C3A["loopsound"] = "nil";
    var_0._id_9C3A["angles"] = ( 0, 0, 0 );
    var_0._id_9C3A["origin"] = ( 0, 0, 0 );
    var_0._id_9C3A["exploder"] = 1;
    var_0._id_9C3A["flag"] = "nil";
    var_0._id_9C3A["exploder_type"] = "normal";
    var_0._id_2DDA = 1;
    return var_0;
}

_id_23FF( var_0, var_1 )
{
    var_2 = _id_A4F0::_id_23FE( var_0 );
    var_2._id_9C3A["exploder"] = var_1;
    return var_2;
}

_id_2438()
{
    var_0 = spawnstruct();

    if ( _id_88A8() )
        _id_9502( var_0 );
    else
    {
        if ( !isdefined( level._id_2417 ) )
            level._id_2417 = [];

        level._id_2417[level._id_2417.size] = var_0;
    }

    var_0._id_9C3A = [];
    var_0._id_9C3A["origin"] = ( 0, 0, 0 );
    var_0._id_9C3A["reactive_radius"] = 200;
    var_0._id_9C3A["fxid"] = "No FX";
    var_0._id_9C3A["type"] = "reactive_fx";
    var_0._id_9C3A["soundalias"] = "nil";
    return var_0;
}

_id_7E89( var_0, var_1 )
{
    if ( isdefined( level._id_2411 ) )
        var_0 += level._id_2411;

    self._id_9C3A["origin"] = var_0;
    self._id_9C3A["angles"] = var_1;
}

_id_7E3A()
{
    self._id_9C3A["up"] = anglestoup( self._id_9C3A["angles"] );
    self._id_9C3A["forward"] = anglestoforward( self._id_9C3A["angles"] );
}

_id_21A8()
{
    setdvarifuninitialized( "curr_exp_num", 1 );
    var_0 = getdvarint( "curr_exp_num" );

    for ( var_1 = 0; var_1 < level._id_0575._id_7C60.size; var_1++ )
    {
        var_2 = level._id_0575._id_7C60[var_1];
        setwinningteam( var_2._id_5878, 1 );
        waittillframeend;
        var_2 _id_A4F0::_id_671C();
        var_2._id_9C3A["type"] = "exploder";
        var_2._id_9C3A["exploder"] = var_0;
        var_2._id_9C3A["exploder_type"] = "normal";
        var_2 _id_A4F0::_id_06FD();
    }

    level._id_0575._id_52C9 = 1;
}

_id_2407()
{
    precacheshader( "black" );
    level._id_0575 = spawnstruct();
    level._id_0575._id_01CD = spawn( "script_origin", ( 0, 0, 0 ) );
    level._id_0575._id_01CD._id_3B21 = loadfx( "vfx/explosion/frag_grenade_default" );
    level._id_0575._id_01CD._id_8893 = "null";
    level._id_0575._id_01CD._id_0354 = 256;

    if ( level._id_5FA9 )
        _id_44E5( "painter_mp" );
    else
        _id_44E5( "painter" );

    _id_A4F0::_id_383B( "createfx_saving" );
    _id_A4F0::_id_383B( "createfx_started" );

    if ( !isdefined( level._id_2402 ) )
        level._id_2402 = [];

    level._id_240F = 0;
    setdvar( "ui_hidehud", "1" );
    level notify( "createfx_common_done" );
}

_id_4D04()
{
    level._id_0575._id_7C65 = 0;
    level._id_0575._id_7C63 = 0;
    level._id_0575._id_7C64 = 0;
    level._id_0575._id_7C66 = 0;
    level._id_0575._id_7C67 = 0;
    level._id_0575._id_7C68 = 0;
    level._id_0575._id_7C5F = [];
    level._id_0575._id_7C60 = [];
    level._id_0575._id_52C9 = 0;
    level._id_0575._id_0358 = 1;
    level._id_0575._id_86B7 = 0;
    level._id_0575._id_86B8 = 0;
    level._id_0575._id_57ED = 0;
    level._id_0575._id_121A = 0;
    level._id_0575._id_7C54 = 0;
    level._id_0575._id_6C16 = getdvarfloat( "g_speed" );
    _id_7E96();
}

_id_4D0F()
{
    level._id_0575._id_580B = [];
    level._id_0575._id_580B["escape"] = 1;
    level._id_0575._id_580B["BUTTON_LSHLDR"] = 1;
    level._id_0575._id_580B["BUTTON_RSHLDR"] = 1;
    level._id_0575._id_580B["mouse1"] = 1;
    level._id_0575._id_580B["ctrl"] = 1;
}

_id_4CC8()
{
    var_0 = [];
    var_0["loopfx"]["selected"] = ( 1, 1, 0.2 );
    var_0["loopfx"]["highlighted"] = ( 0.4, 0.95, 1 );
    var_0["loopfx"]["default"] = ( 0.3, 0.8, 1 );
    var_0["oneshotfx"]["selected"] = ( 1, 1, 0.2 );
    var_0["oneshotfx"]["highlighted"] = ( 0.3, 0.6, 1 );
    var_0["oneshotfx"]["default"] = ( 0.1, 0.2, 1 );
    var_0["exploder"]["selected"] = ( 1, 1, 0.2 );
    var_0["exploder"]["highlighted"] = ( 1, 0.2, 0.2 );
    var_0["exploder"]["default"] = ( 1, 0.1, 0.1 );
    var_0["rainfx"]["selected"] = ( 1, 1, 0.2 );
    var_0["rainfx"]["highlighted"] = ( 0.95, 0.4, 0.95 );
    var_0["rainfx"]["default"] = ( 0.78, 0, 0.73 );
    var_0["soundfx"]["selected"] = ( 1, 1, 0.2 );
    var_0["soundfx"]["highlighted"] = ( 0.2, 1, 0.2 );
    var_0["soundfx"]["default"] = ( 0.1, 1, 0.1 );
    var_0["soundfx_interval"]["selected"] = ( 1, 1, 0.2 );
    var_0["soundfx_interval"]["highlighted"] = ( 0.3, 1, 0.3 );
    var_0["soundfx_interval"]["default"] = ( 0.1, 1, 0.1 );
    var_0["reactive_fx"]["selected"] = ( 1, 1, 0.2 );
    var_0["reactive_fx"]["highlighted"] = ( 0.5, 1, 0.75 );
    var_0["reactive_fx"]["default"] = ( 0.2, 0.9, 0.2 );
    var_0["soundfx_dynamic"]["selected"] = ( 1, 1, 0.2 );
    var_0["soundfx_dynamic"]["highlighted"] = ( 0.3, 1, 0.3 );
    var_0["soundfx_dynamic"]["default"] = ( 0.1, 1, 0.1 );
    level._id_0575._id_2058 = var_0;
}

_id_241B()
{
    waitframe;
    wait 0.05;

    if ( !isdefined( level._id_058F ) )
        level._id_058F = [];

    if ( getdvar( "createfx_map" ) == "" )
    {

    }
    else if ( getdvar( "createfx_map" ) == _id_A4F0::_id_3E92() )
        [[ level._id_3AEC ]]();

    _id_4CCB();
    common_scripts\_createfxmenu::_id_4D13();
    _id_4CFB();
    _id_4D68();
    _id_4CCB();
    _id_4D04();
    _id_4D0F();
    _id_4CC8();

    if ( getdvar( "createfx_use_f4" ) == "" )
    {

    }

    if ( getdvar( "createfx_no_autosave" ) == "" )
    {

    }

    level._id_2408 = 1;
    level._id_5516 = undefined;
    level._id_195A = [];
    var_0 = ( 0, 0, 0 );
    _id_A4F0::_id_383D( "createfx_started" );

    if ( !level._id_5FA9 )
        var_0 = level._id_031D._id_02E6;

    var_1 = undefined;
    level._id_3B81 = 0;
    common_scripts\_createfxmenu::_id_7FA4( "none" );
    level._id_2414 = 0;
    var_2 = newhudelem();
    var_2._id_0530 = -120;
    var_2._id_0538 = 200;
    var_2._id_019A = 0;
    var_2 _meth_80CC( "black", 250, 160 );
    var_2._id_0037 = 0;
    level._id_240D = 0;

    foreach ( var_4 in level._id_2417 )
        var_4 _id_6E6A();

    thread _id_2DAE();
    var_6 = undefined;
    thread _id_2404();
    level._id_240E = 0;
    thread _id_780B();
    thread _id_8164();

    for (;;)
    {
        var_7 = 0;
        var_8 = anglestoright( level._id_031D _meth_833B() );
        var_9 = anglestoforward( level._id_031D _meth_833B() );
        var_10 = anglestoup( level._id_031D _meth_833B() );
        var_11 = 0.85;
        var_12 = var_9 * 750;
        level._id_2416 = bullettrace( level._id_031D _meth_80A8(), level._id_031D _meth_80A8() + var_12, 0, undefined );
        var_13 = undefined;
        level._id_1958 = [];
        level._id_194E = [];
        _id_6FDD();
        var_14 = _id_194D( "ctrl", "BUTTON_LSHLDR" );
        var_15 = _id_194C( "mouse1", "BUTTON_A" );
        var_16 = _id_194D( "mouse1", "BUTTON_A" );
        var_17 = _id_194D( "shift" );
        common_scripts\_createfxmenu::_id_23B9();
        var_18 = "F5";

        if ( getdvarint( "createfx_use_f4" ) )
            var_18 = "F4";

        if ( _id_194C( var_18 ) )
        {

        }

        if ( getdvarint( "scr_createfx_dump" ) )
            _id_3C82();

        if ( _id_194C( "F2" ) )
            _id_93C2();

        if ( _id_194C( "ins" ) )
            _id_4E80();

        if ( _id_194C( "del" ) )
            _id_282E();

        if ( _id_194C( "escape" ) )
            _id_1ED6();

        if ( _id_194C( "rightarrow", "space" ) && !level._id_2410 )
            _id_7E83();

        if ( _id_194C( "leftarrow" ) && !level._id_2410 )
            _id_9905();

        if ( _id_194C( "f" ) )
            _id_3A0B();

        if ( _id_194C( "u" ) )
            _id_7C55();

        if ( _id_194C( "c" ) )
            _id_21A8();

        _id_5D4A();

        if ( !var_14 && _id_194C( "g" ) )
        {
            _id_7C53( "exploder" );
            _id_7C53( "flag" );
        }

        if ( _id_194C( "h", "F1" ) )
            _id_84D1();

        if ( _id_194C( "BUTTON_LSTICK" ) )
            _id_21D6();

        if ( _id_194C( "BUTTON_RSTICK" ) )
            _id_66B9();

        if ( _id_194C( "z" ) )
            _id_9A1B();

        if ( _id_194C( "z" ) && var_17 )
            _id_729F();

        if ( var_14 )
        {
            if ( _id_194C( "c" ) )
                _id_21D6();

            if ( _id_194C( "v" ) )
                _id_66B9();

            if ( _id_194C( "g" ) )
                _id_88FE();
        }

        if ( isdefined( level._id_0575._id_7C61 ) )
            common_scripts\_createfxmenu::_id_5BAB();

        for ( var_19 = 0; var_19 < level._id_2417.size; var_19++ )
        {
            var_4 = level._id_2417[var_19];
            var_20 = vectornormalize( var_4._id_9C3A["origin"] - level._id_031D._id_02E6 + ( 0, 0, 55 ) );
            var_21 = vectordot( var_9, var_20 );

            if ( var_21 < var_11 )
                continue;

            var_11 = var_21;
            var_13 = var_4;
        }

        level._id_3B55 = var_13;

        if ( isdefined( var_13 ) )
        {
            if ( isdefined( var_1 ) )
            {
                if ( var_1 != var_13 )
                {
                    if ( !_id_32E7( var_1 ) )
                        var_1 thread _id_3310();

                    if ( !_id_32E7( var_13 ) )
                        var_13 thread _id_3311();
                }
            }
            else if ( !_id_32E7( var_13 ) )
                var_13 thread _id_3311();
        }

        _id_596A( var_13, var_15, var_16, var_14, var_8 );
        var_7 = _id_4606( var_7 );
        wait 0.05;

        if ( var_7 )
            _id_9AD4();

        if ( !level._id_5FA9 )
            var_0 = [[ level._id_3AED ]]( var_0 );

        var_1 = var_13;

        if ( _id_5552( var_6 ) )
        {
            level._id_3019 = 0;
            _id_1ED6();
            common_scripts\_createfxmenu::_id_7FA4( "none" );
        }

        if ( level._id_0575._id_7C60.size )
        {
            var_6 = level._id_0575._id_7C60[level._id_0575._id_7C60.size - 1];
            continue;
        }

        var_6 = undefined;
    }
}

_id_5D4A()
{
    var_0 = 0;
    var_1 = _id_194D( "ctrl" );

    if ( _id_194D( "." ) )
    {
        if ( var_1 )
        {
            if ( level._id_0575._id_6C16 < 190 )
                level._id_0575._id_6C16 = 190;
            else
                level._id_0575._id_6C16 += 10;
        }
        else
            level._id_0575._id_6C16 += 5;

        var_0 = 1;
    }
    else if ( _id_194D( "," ) )
    {
        if ( var_1 )
        {
            if ( level._id_0575._id_6C16 > 190 )
                level._id_0575._id_6C16 = 190;
            else
                level._id_0575._id_6C16 -= 10;
        }
        else
            level._id_0575._id_6C16 -= 5;

        var_0 = 1;
    }

    if ( var_0 )
    {
        level._id_0575._id_6C16 = clamp( level._id_0575._id_6C16, 5, 500 );
        [[ level._id_3AEB ]]();
        _id_7E96();
    }
}

_id_7E96()
{
    if ( !isdefined( level._id_0575._id_6C1B ) )
    {
        var_0 = newhudelem();
        var_0._id_002C = "right";
        var_0._id_019A = 1;
        var_0._id_018C = 1.2;
        var_0._id_0037 = 1.0;
        var_0._id_0530 = 120;
        var_0._id_0538 = 420;
        var_1 = newhudelem();
        var_1._id_002C = "left";
        var_1._id_019A = 1;
        var_1._id_018C = 1.2;
        var_1._id_0037 = 1.0;
        var_1._id_0530 = 120;
        var_1._id_0538 = 420;
        var_0._id_4AD7 = var_1;
        level._id_0575._id_6C1B = var_0;
    }

    level._id_0575._id_6C1B._id_4AD7 _meth_80D7( level._id_0575._id_6C16 );
}

_id_93C2()
{
    level._id_2408 = !level._id_2408;
}

_id_4E80()
{
    common_scripts\_createfxmenu::_id_7FA4( "creation" );
    level._id_3019 = 0;
    _id_1EB9();
    _id_7E3C( "Pick effect type to create:" );
    _id_7E3C( "1. One Shot FX" );
    _id_7E3C( "2. Looping FX" );
    _id_7E3C( "3. Looping sound" );
    _id_7E3C( "4. Exploder" );
    _id_7E3C( "5. One Shot Sound" );
    _id_7E3C( "6. Reactive Sound" );
    _id_7E3C( "7. Dynamic Ambience" );
    _id_7E3C( "(c) Cancel >" );
    _id_7E3C( "(x) Exit >" );
}

_id_596A( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !level._id_2408 )
        return;

    if ( level._id_0575._id_7C54 )
    {
        level._id_0575._id_7C54 = 0;
        var_0 = undefined;
    }
    else if ( _id_7C56() )
        var_0 = undefined;

    for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
    {
        var_6 = level._id_2417[var_5];

        if ( !var_6._id_2DDA )
            continue;

        var_7 = getdvarfloat( "createfx_scaleid" );

        if ( isdefined( var_0 ) && var_6 == var_0 )
        {
            if ( !common_scripts\_createfxmenu::_id_330D() )
                common_scripts\_createfxmenu::_id_2B48( var_6 );

            if ( var_1 )
            {
                var_8 = _id_4C3F( var_5 );
                level._id_240B = 0;
                level._id_2414 = !var_8;

                if ( !var_3 )
                {
                    var_9 = level._id_0575._id_7C60.size;
                    _id_1EB5();

                    if ( var_8 && var_9 == 1 )
                        _id_7C57( var_5, var_6 );
                }

                _id_93C3( var_5, var_6 );
            }
            else if ( var_2 )
            {
                if ( var_3 )
                {
                    if ( level._id_2414 )
                        _id_7C57( var_5, var_6 );

                    if ( !level._id_2414 )
                        _id_28B2( var_5, var_6 );
                }
            }

            var_10 = "highlighted";
        }
        else
            var_10 = "default";

        if ( _id_4C3F( var_5 ) )
            var_10 = "selected";

        var_6 _id_2413( var_10, var_7, var_4 );
    }
}

_id_2413( var_0, var_1, var_2 )
{
    if ( getdvarint( "fx_showLightGridSampleOffset" ) != 0 )
    {
        var_3 = getdvarfloat( "fx_lightGridSampleOffset" );
        var_4 = anglestoforward( self._id_9C3A["angles"] ) * var_3;
    }

    if ( self._id_92B4 > 0 )
    {
        var_5 = _id_3E3A();
        var_6 = var_2 * ( var_5.size * -2.93 );
        var_7 = level._id_0575._id_2058[self._id_9C3A["type"]][var_0];

        if ( isdefined( self._id_5069 ) )
            var_7 = ( 1, 0.5, 0 );

        if ( isdefined( self._id_9C3A["reactive_radius"] ) )
            return;

        if ( isdefined( self._id_9C3A["dynamic_distance"] ) )
            return;

        return;
    }
}

_id_3E3A()
{
    switch ( self._id_9C3A["type"] )
    {
        case "reactive_fx":
            return "reactive: " + self._id_9C3A["soundalias"];
        case "soundfx_interval":
            return self._id_9C3A["soundalias"];
        case "soundfx_dynamic":
            return "dynamic: " + self._id_9C3A["ambiencename"];
        case "soundfx":
            return self._id_9C3A["soundalias"];
        case "exploder":
            if ( isdefined( self._id_9C3A["soundalias"] ) && self._id_9C3A["soundalias"] != "nil" )
            {
                if ( self._id_9C3A["fxid"] == "No FX" )
                    return "@)) " + self._id_9C3A["soundalias"];
                else
                    return self._id_9C3A["fxid"] + " @))";
            }
            else
                return self._id_9C3A["fxid"];
        case "oneshotfx":
            if ( isdefined( self._id_9C3A["soundalias"] ) && self._id_9C3A["soundalias"] != "nil" )
                return self._id_9C3A["fxid"] + " @))";
            else
                return self._id_9C3A["fxid"];
        default:
            return self._id_9C3A["fxid"];
    }
}

_id_7C55()
{
    level._id_3019 = 0;
    _id_1EB9();
    common_scripts\_createfxmenu::_id_7FA4( "select_by_name" );
    common_scripts\_createfxmenu::_id_2DB2();
}

_id_4606( var_0 )
{
    if ( level._id_0575._id_7C60.size > 0 && level._id_240B == 0 )
    {
        var_0 = _id_7C5E( var_0 );

        if ( !_id_24F0( "selected_ents" ) )
        {
            _id_60A6( "selected_ents" );
            _id_7ED5( "Mode:", "move" );
            _id_7ED5( "Move Rate( -/+ ):", level._id_0575._id_0358 );

            if ( level._id_0575._id_86B7 )
            {
                var_1 = "on";
                var_2 = ( 0, 1, 0 );
            }
            else
            {
                var_1 = "off";
                var_2 = ( 0.5, 0.5, 0.5 );
            }

            _id_7ED5( "Snap2Normal( S ):", var_1, var_2 );

            if ( level._id_0575._id_86B8 )
            {
                var_3 = "on";
                var_4 = ( 0, 1, 0 );
            }
            else
            {
                var_3 = "off";
                var_4 = ( 0.5, 0.5, 0.5 );
            }

            _id_7ED5( "90deg Snap( L ):", var_3, var_4 );

            if ( level._id_0575._id_57ED )
            {
                var_5 = "on";
                var_6 = ( 0, 1, 0 );
            }
            else
            {
                var_5 = "off";
                var_6 = ( 0.5, 0.5, 0.5 );
            }

            _id_7ED5( "Local Rotation( R ):", var_5, var_6 );
        }

        if ( level._id_0575._id_121A && level._id_0575._id_7C60.size > 0 )
        {
            _id_7ED5( "Mode:", "rotate" );
            thread [[ level._id_3AEE ]]();

            if ( _id_194C( "p" ) )
                _id_7420();

            if ( _id_194C( "o" ) )
                _id_0968();

            if ( _id_194C( "v" ) )
                _id_21D0();

            for ( var_7 = 0; var_7 < level._id_0575._id_7C60.size; var_7++ )
                level._id_0575._id_7C60[var_7] _id_2DA0();

            if ( level._id_7C66 != 0 || level._id_7C68 != 0 || level._id_7C67 != 0 )
                var_0 = 1;
        }
        else
        {
            _id_7ED5( "Mode:", "move" );
            var_8 = _id_3E5A();

            for ( var_7 = 0; var_7 < level._id_0575._id_7C60.size; var_7++ )
            {
                var_9 = level._id_0575._id_7C60[var_7];

                if ( isdefined( var_9._id_02A0 ) )
                    continue;

                var_9 _id_2DAA();
                var_9._id_9C3A["origin"] += var_8;
            }

            if ( distance( ( 0, 0, 0 ), var_8 ) > 0 )
            {
                thread _id_780B();
                level._id_240E = 0;
                var_0 = 1;
            }
        }
    }
    else
        _id_1EDB();

    return var_0;
}

_id_7C5E( var_0 )
{
    if ( _id_194C( "BUTTON_X" ) )
        _id_93BD();

    _id_5D4B();

    if ( _id_194C( "s" ) )
        _id_93D5();

    if ( _id_194C( "l" ) )
        _id_93D6();

    if ( _id_194C( "r" ) )
        _id_93CD();

    if ( _id_194C( "end" ) )
    {
        _id_2F65();
        var_0 = 1;
    }

    if ( _id_194C( "tab", "BUTTON_RSHLDR" ) )
    {
        _id_5F23();
        var_0 = 1;
    }

    return var_0;
}

_id_5D4B()
{
    var_0 = _id_194D( "shift" );
    var_1 = _id_194D( "ctrl" );

    if ( _id_194C( "=" ) )
    {
        if ( var_0 )
            level._id_0575._id_0358 += 0.025;
        else if ( var_1 )
        {
            if ( level._id_0575._id_0358 < 1 )
                level._id_0575._id_0358 = 1;
            else
                level._id_0575._id_0358 += 10;
        }
        else
            level._id_0575._id_0358 += 0.1;
    }
    else if ( _id_194C( "-" ) )
    {
        if ( var_0 )
            level._id_0575._id_0358 -= 0.025;
        else if ( var_1 )
        {
            if ( level._id_0575._id_0358 > 1 )
                level._id_0575._id_0358 = 1;
            else
                level._id_0575._id_0358 = 0.1;
        }
        else
            level._id_0575._id_0358 -= 0.1;
    }

    level._id_0575._id_0358 = clamp( level._id_0575._id_0358, 0.025, 100 );
    _id_7ED5( "Move Rate( -/+ ):", level._id_0575._id_0358 );
}

_id_93BD()
{
    level._id_0575._id_121A = !level._id_0575._id_121A;
}

_id_93D5()
{
    level._id_0575._id_86B7 = !level._id_0575._id_86B7;

    if ( level._id_0575._id_86B7 )
    {
        var_0 = "on";
        var_1 = ( 0, 1, 0 );
    }
    else
    {
        var_0 = "off";
        var_1 = ( 0.5, 0.5, 0.5 );
    }

    _id_7ED5( "Snap2Normal( S ):", var_0, var_1 );
}

_id_93D6()
{
    level._id_0575._id_86B8 = !level._id_0575._id_86B8;

    if ( level._id_0575._id_86B8 )
    {
        var_0 = "on";
        var_1 = ( 0, 1, 0 );
    }
    else
    {
        var_0 = "off";
        var_1 = ( 0.5, 0.5, 0.5 );
    }

    _id_7ED5( "90deg Snap( L ):", var_0, var_1 );
}

_id_93CD()
{
    level._id_0575._id_57ED = !level._id_0575._id_57ED;

    if ( level._id_0575._id_57ED )
    {
        var_0 = "on";
        var_1 = ( 0, 1, 0 );
    }
    else
    {
        var_0 = "off";
        var_1 = ( 0.5, 0.5, 0.5 );
    }

    _id_7ED5( "Local Rotation( R ):", var_0, var_1 );
}

_id_21D0()
{
    thread _id_780B();
    level notify( "new_ent_selection" );

    for ( var_0 = 0; var_0 < level._id_0575._id_7C60.size; var_0++ )
    {
        var_1 = level._id_0575._id_7C60[var_0];
        var_1._id_9C3A["angles"] = level._id_0575._id_7C60[level._id_0575._id_7C60.size - 1]._id_9C3A["angles"];
        var_1 _id_7E3A();
    }

    _id_9AD4();
    level._id_240E = 0;
}

_id_0968()
{
    thread _id_780B();
    level notify( "new_ent_selection" );
    var_0 = level._id_0575._id_7C60[level._id_0575._id_7C60.size - 1];

    for ( var_1 = 0; var_1 < level._id_0575._id_7C60.size - 1; var_1++ )
    {
        var_2 = level._id_0575._id_7C60[var_1];
        var_3 = vectortoangles( var_0._id_9C3A["origin"] - var_2._id_9C3A["origin"] );
        var_2._id_9C3A["angles"] = var_3;
        var_2 _id_7E3A();
    }

    _id_9AD4();
    level._id_240E = 0;
}

_id_7420()
{
    level notify( "new_ent_selection" );
    thread _id_780B();

    for ( var_0 = 0; var_0 < level._id_0575._id_7C60.size; var_0++ )
    {
        var_1 = level._id_0575._id_7C60[var_0];
        var_1._id_9C3A["angles"] = ( 0, 0, 0 );
        var_1 _id_7E3A();
    }

    _id_9AD4();
    level._id_240E = 0;
}

_id_5552( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( !common_scripts\_createfxmenu::_id_330D() )
            return 1;
    }
    else
        return common_scripts\_createfxmenu::_id_330D();

    return var_0 != level._id_0575._id_7C60[level._id_0575._id_7C60.size - 1];
}

_id_2F65()
{
    thread _id_780B();

    for ( var_0 = 0; var_0 < level._id_0575._id_7C60.size; var_0++ )
    {
        var_1 = level._id_0575._id_7C60[var_0];
        var_2 = bullettrace( var_1._id_9C3A["origin"], var_1._id_9C3A["origin"] + ( 0, 0, -2048 ), 0, undefined );
        var_1._id_9C3A["origin"] = var_2["position"];
    }

    level._id_240E = 0;
}

_id_7E83()
{
    level notify( "createfx_exploder_reset" );
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_0575._id_7C60.size; var_1++ )
    {
        var_2 = level._id_0575._id_7C60[var_1];

        if ( isdefined( var_2._id_9C3A["exploder"] ) )
            var_0[var_2._id_9C3A["exploder"]] = 1;
    }

    var_3 = getarraykeys( var_0 );

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        _id_A4ED::_id_3526( var_3[var_1] );
}

_id_9905()
{
    level notify( "createfx_exploder_reset" );
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_0575._id_7C60.size; var_1++ )
    {
        var_2 = level._id_0575._id_7C60[var_1];

        if ( isdefined( var_2._id_9C3A["exploder"] ) )
            var_0[var_2._id_9C3A["exploder"]] = 1;
    }

    var_3 = getarraykeys( var_0 );

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        _id_A4ED::_id_5306( var_3[var_1] );
}

_id_2DAE()
{
    var_0 = 0;

    if ( getdvarint( "createfx_drawdist" ) == 0 )
    {

    }

    for (;;)
    {
        var_1 = getdvarint( "createfx_drawdist" );
        var_1 *= var_1;

        for ( var_2 = 0; var_2 < level._id_2417.size; var_2++ )
        {
            var_3 = level._id_2417[var_2];
            var_3._id_2DDA = distancesquared( level._id_031D._id_02E6, var_3._id_9C3A["origin"] ) <= var_1;
            var_0++;

            if ( var_0 > 100 )
            {
                var_0 = 0;
                wait 0.05;
            }
        }

        if ( level._id_2417.size == 0 )
            wait 0.05;
    }
}

_id_2404()
{
    setdvarifuninitialized( "createfx_autosave_time", "300" );

    for (;;)
    {
        wait(getdvarint( "createfx_autosave_time" ));
        _id_A4F0::_id_3855( "createfx_saving" );

        if ( getdvarint( "createfx_no_autosave" ) )
            continue;

        _id_3C82( 1 );
    }
}

_id_75EF( var_0, var_1 )
{
    level endon( "new_ent_selection" );
    var_2 = 0.1;

    for ( var_3 = 0; var_3 < var_2 * 20; var_3++ )
    {
        if ( level._id_7C66 != 0 )
            var_0 _meth_82B9( level._id_7C66 );
        else if ( level._id_7C67 != 0 )
            var_0 _meth_82BA( level._id_7C67 );
        else
            var_0 _meth_82BB( level._id_7C68 );

        wait 0.05;
        var_0 _id_2DA0();

        for ( var_4 = 0; var_4 < level._id_0575._id_7C60.size; var_4++ )
        {
            var_5 = level._id_0575._id_7C60[var_4];

            if ( isdefined( var_5._id_02A0 ) )
                continue;

            var_5._id_9C3A["origin"] = var_1[var_4]._id_02E6;
            var_5._id_9C3A["angles"] = var_1[var_4]._id_0041;
        }
    }
}

_id_282E()
{
    if ( level._id_240D )
    {
        _id_737B();
        return;
    }

    _id_2832();
}

_id_737B()
{
    if ( !isdefined( level._id_0575._id_7C61 ) )
        return;

    var_0 = level._id_0575._id_6549[level._id_0575._id_7C61]["name"];

    for ( var_1 = 0; var_1 < level._id_2417.size; var_1++ )
    {
        var_2 = level._id_2417[var_1];

        if ( !_id_32E7( var_2 ) )
            continue;

        var_2 _id_7372( var_0 );
    }

    _id_9AD4();
    _id_1ED6();
}

_id_7372( var_0 )
{
    self._id_9C3A[var_0] = undefined;
}

_id_2832()
{
    _id_780B();
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_2417.size; var_1++ )
    {
        var_2 = level._id_2417[var_1];

        if ( _id_32E7( var_2 ) )
        {
            if ( isdefined( var_2._id_5878 ) )
                var_2._id_5878 delete();

            var_2 notify( "stop_loop" );
            continue;
        }

        var_0[var_0.size] = var_2;
    }

    level._id_2417 = var_0;
    level._id_0575._id_7C5F = [];
    level._id_0575._id_7C60 = [];
    _id_1EB9();
    _id_7809();
}

_id_5F23()
{
    thread _id_780B();
    var_0 = level._id_2416["position"];

    if ( level._id_0575._id_7C60.size <= 0 )
        return;

    var_1 = _id_3CE5( level._id_0575._id_7C60 );
    var_2 = var_1 - var_0;

    for ( var_3 = 0; var_3 < level._id_0575._id_7C60.size; var_3++ )
    {
        var_4 = level._id_0575._id_7C60[var_3];

        if ( isdefined( var_4._id_02A0 ) )
            continue;

        var_4._id_9C3A["origin"] -= var_2;

        if ( level._id_0575._id_86B7 )
        {
            if ( isdefined( level._id_2416["normal"] ) )
                var_4._id_9C3A["angles"] = vectortoangles( level._id_2416["normal"] );
        }
    }

    level._id_240E = 0;
}

_id_7C59()
{
    _id_7C57( level._id_2417.size - 1, level._id_2417[level._id_2417.size - 1] );
}

_id_741A()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_2417.size; var_1++ )
    {
        if ( _id_4C3F( var_1 ) )
            var_0[var_0.size] = var_1;
    }

    _id_1EB5();
    _id_7C58( var_0 );
}

_id_7C53( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_0575._id_7C60 )
    {
        if ( !isdefined( var_3._id_9C3A[var_0] ) )
            continue;

        var_4 = var_3._id_9C3A[var_0];
        var_1[var_4] = 1;
    }

    foreach ( var_4, var_7 in var_1 )
    {
        foreach ( var_9, var_3 in level._id_2417 )
        {
            if ( _id_4C3F( var_9 ) )
                continue;

            if ( !isdefined( var_3._id_9C3A[var_0] ) )
                continue;

            if ( var_3._id_9C3A[var_0] != var_4 )
                continue;

            _id_7C57( var_9, var_3 );
        }
    }

    _id_9AD4();
}

_id_21D6()
{
    if ( level._id_0575._id_7C60.size <= 0 )
        return;

    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_0575._id_7C60.size; var_1++ )
    {
        var_2 = level._id_0575._id_7C60[var_1];
        var_3 = spawnstruct();
        var_3._id_9C3A = var_2._id_9C3A;
        var_3 _id_6E6A();
        var_0[var_0.size] = var_3;
    }

    level._id_8F0E = var_0;
}

_id_6E6A()
{
    self._id_92B4 = 0;
    self._id_2DDA = 1;
}

_id_66B9()
{
    if ( !isdefined( level._id_8F0E ) )
        return;

    _id_1EB5();

    for ( var_0 = 0; var_0 < level._id_8F0E.size; var_0++ )
        _id_0731( level._id_8F0E[var_0] );

    _id_5F23();
    _id_9AD4();
    level._id_8F0E = [];
    _id_21D6();
}

_id_0731( var_0 )
{
    level._id_2417[level._id_2417.size] = var_0;
    _id_7C59();
}

_id_3CE5( var_0 )
{
    var_1 = ( 0, 0, 0 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1 = ( var_1[0] + var_0[var_2]._id_9C3A["origin"][0], var_1[1] + var_0[var_2]._id_9C3A["origin"][1], var_1[2] + var_0[var_2]._id_9C3A["origin"][2] );

    return ( var_1[0] / var_0.size, var_1[1] / var_0.size, var_1[2] / var_0.size );
}

_id_3E3F( var_0 )
{
    var_1 = var_0[0]._id_9C3A["origin"];
    var_2 = var_0[0]._id_9C3A["origin"];
    var_3 = var_1[0];
    var_4 = var_1[1];
    var_5 = var_1[2];
    var_6 = var_2[0];
    var_7 = var_2[1];
    var_8 = var_2[2];

    for ( var_9 = 0; var_9 < var_0.size; var_9++ )
    {
        var_10 = var_0[var_9]._id_9C3A["origin"];

        if ( var_10[0] < var_1[0] )
            var_3 = var_10[0];

        if ( var_10[0] > var_2[0] )
            var_6 = var_10[0];

        if ( var_10[1] < var_1[1] )
            var_4 = var_10[1];

        if ( var_10[1] > var_2[1] )
            var_7 = var_10[1];

        if ( var_10[2] < var_1[2] )
            var_5 = var_10[2];

        if ( var_10[2] > var_2[2] )
            var_8 = var_10[2];
    }

    var_1 = ( var_3, var_4, var_5 );
    var_2 = ( var_6, var_7, var_8 );
    var_11 = distance( var_2, var_1 );
    return var_11;
}

_id_32D6()
{
    self endon( "death" );

    for (;;)
    {
        _id_2DA0();
        wait 0.05;
    }
}

_id_760A()
{
    if ( level._id_7C67 != 0 )
        return 1;

    if ( level._id_7C66 != 0 )
        return 1;

    return level._id_7C68 != 0;
}

_id_6F95( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level._id_0575._id_6549.size; var_3++ )
    {
        var_4 = level._id_0575._id_6549[var_3];

        if ( isdefined( var_4["nowrite"] ) && var_4["nowrite"] )
            continue;

        var_5 = var_4["name"];

        if ( !isdefined( var_0._id_9C3A[var_5] ) )
            continue;

        if ( !common_scripts\_createfxmenu::_id_59CF( var_4["mask"], var_0._id_9C3A["type"] ) )
            continue;

        if ( !level._id_5FA9 )
        {
            if ( common_scripts\_createfxmenu::_id_59CF( "fx", var_0._id_9C3A["type"] ) && var_5 == "fxid" )
                continue;

            if ( var_0._id_9C3A["type"] == "exploder" && var_5 == "exploder" )
                continue;

            var_6 = var_0._id_9C3A["type"] + "/" + var_5;

            if ( isdefined( level._id_0575._id_279B[var_6] ) && level._id_0575._id_279B[var_6] == var_0._id_9C3A[var_5] )
                continue;
        }

        if ( var_4["type"] == "string" )
        {
            var_7 = var_0._id_9C3A[var_5] + "";

            if ( var_7 == "nil" )
                continue;

            if ( var_5 == "platform" && var_7 == "all" )
                continue;

            _id_1C19( var_1 + "ent.v[ \"" + var_5 + "\" ] = \"" + var_0._id_9C3A[var_5] + "\";" );
            continue;
        }

        _id_1C19( var_1 + "ent.v[ \"" + var_5 + "\" ] = " + var_0._id_9C3A[var_5] + ";" );
    }
}

_id_3310()
{
    self notify( "highlight change" );
    self endon( "highlight change" );

    for (;;)
    {
        self._id_92B4 *= 0.85;
        self._id_92B4 -= 0.05;

        if ( self._id_92B4 < 0 )
            break;

        wait 0.05;
    }

    self._id_92B4 = 0;
}

_id_3311()
{
    self notify( "highlight change" );
    self endon( "highlight change" );

    for (;;)
    {
        self._id_92B4 += 0.05;
        self._id_92B4 *= 1.25;

        if ( self._id_92B4 > 1 )
            break;

        wait 0.05;
    }

    self._id_92B4 = 1;
}

_id_1ED6()
{
    level._id_240D = 0;
    level._id_0575._id_7C61 = undefined;
    _id_742A();
}

_id_742A()
{
    for ( var_0 = 0; var_0 < level._id_0575._id_4ADE; var_0++ )
        level._id_0575._id_4AE6[var_0][0]._id_00C5 = ( 1, 1, 1 );
}

_id_93C3( var_0, var_1 )
{
    if ( isdefined( level._id_0575._id_7C5F[var_0] ) )
        _id_28B2( var_0, var_1 );
    else
        _id_7C57( var_0, var_1 );
}

_id_7C57( var_0, var_1 )
{
    if ( isdefined( level._id_0575._id_7C5F[var_0] ) )
        return;

    _id_1ED6();
    level notify( "new_ent_selection" );
    var_1 thread _id_3311();
    level._id_0575._id_7C5F[var_0] = 1;
    level._id_0575._id_7C60[level._id_0575._id_7C60.size] = var_1;
    level._id_2410 = 0;
}

_id_32E6( var_0 )
{
    if ( !isdefined( level._id_3B55 ) )
        return 0;

    return var_0 == level._id_3B55;
}

_id_28B2( var_0, var_1 )
{
    if ( !isdefined( level._id_0575._id_7C5F[var_0] ) )
        return;

    _id_1ED6();
    level notify( "new_ent_selection" );
    level._id_0575._id_7C5F[var_0] = undefined;

    if ( !_id_32E6( var_1 ) )
        var_1 thread _id_3310();

    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_0575._id_7C60.size; var_3++ )
    {
        if ( level._id_0575._id_7C60[var_3] != var_1 )
            var_2[var_2.size] = level._id_0575._id_7C60[var_3];
    }

    level._id_0575._id_7C60 = var_2;
}

_id_4C3F( var_0 )
{
    return isdefined( level._id_0575._id_7C5F[var_0] );
}

_id_32E7( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_0575._id_7C60.size; var_1++ )
    {
        if ( level._id_0575._id_7C60[var_1] == var_0 )
            return 1;
    }

    return 0;
}

_id_1EB5()
{
    for ( var_0 = 0; var_0 < level._id_0575._id_7C60.size; var_0++ )
    {
        if ( !_id_32E6( level._id_0575._id_7C60[var_0] ) )
            level._id_0575._id_7C60[var_0] thread _id_3310();
    }

    level._id_0575._id_7C5F = [];
    level._id_0575._id_7C60 = [];
}

_id_2DA0()
{

}

_id_2DAA()
{

}

_id_2405( var_0 )
{
    thread _id_2406( var_0 );
}

_id_2406( var_0 )
{
    level notify( "new_createfx_centerprint" );
    level endon( "new_createfx_centerprint" );

    for ( var_1 = 0; var_1 < 5; var_1++ )
    {

    }

    wait 4.5;

    for ( var_1 = 0; var_1 < 5; var_1++ )
    {

    }
}

_id_3E5A()
{
    var_0 = level._id_031D _meth_833B()[1];
    var_1 = ( 0, var_0, 0 );
    var_2 = anglestoright( var_1 );
    var_3 = anglestoforward( var_1 );
    var_4 = anglestoup( var_1 );
    var_5 = 0;
    var_6 = level._id_0575._id_0358;

    if ( _id_1959( "DPAD_UP" ) )
    {
        if ( level._id_7C63 < 0 )
            level._id_7C63 = 0;

        level._id_7C63 += var_6;
    }
    else if ( _id_1959( "DPAD_DOWN" ) )
    {
        if ( level._id_7C63 > 0 )
            level._id_7C63 = 0;

        level._id_7C63 -= var_6;
    }
    else
        level._id_7C63 = 0;

    if ( _id_1959( "DPAD_RIGHT" ) )
    {
        if ( level._id_7C64 < 0 )
            level._id_7C64 = 0;

        level._id_7C64 += var_6;
    }
    else if ( _id_1959( "DPAD_LEFT" ) )
    {
        if ( level._id_7C64 > 0 )
            level._id_7C64 = 0;

        level._id_7C64 -= var_6;
    }
    else
        level._id_7C64 = 0;

    if ( _id_1959( "BUTTON_Y" ) )
    {
        if ( level._id_7C65 < 0 )
            level._id_7C65 = 0;

        level._id_7C65 += var_6;
    }
    else if ( _id_1959( "BUTTON_B" ) )
    {
        if ( level._id_7C65 > 0 )
            level._id_7C65 = 0;

        level._id_7C65 -= var_6;
    }
    else
        level._id_7C65 = 0;

    var_7 = ( 0, 0, 0 );
    var_7 += var_3 * level._id_7C63;
    var_7 += var_2 * level._id_7C64;
    var_7 += var_4 * level._id_7C65;
    return var_7;
}

_id_7DB5()
{
    if ( !level._id_0575._id_86B8 )
        var_0 = level._id_0575._id_0358;
    else
        var_0 = 90;

    if ( _id_1959( "kp_uparrow", "DPAD_UP" ) )
    {
        if ( level._id_7C66 < 0 )
            level._id_7C66 = 0;

        level._id_7C66 += var_0;
    }
    else if ( _id_1959( "kp_downarrow", "DPAD_DOWN" ) )
    {
        if ( level._id_7C66 > 0 )
            level._id_7C66 = 0;

        level._id_7C66 -= var_0;
    }
    else
        level._id_7C66 = 0;

    if ( _id_1959( "DPAD_LEFT" ) )
    {
        if ( level._id_7C68 < 0 )
            level._id_7C68 = 0;

        level._id_7C68 += var_0;
    }
    else if ( _id_1959( "DPAD_RIGHT" ) )
    {
        if ( level._id_7C68 > 0 )
            level._id_7C68 = 0;

        level._id_7C68 -= var_0;
    }
    else
        level._id_7C68 = 0;

    if ( _id_1959( "BUTTON_Y" ) )
    {
        if ( level._id_7C67 < 0 )
            level._id_7C67 = 0;

        level._id_7C67 += var_0;
    }
    else if ( _id_1959( "BUTTON_B" ) )
    {
        if ( level._id_7C67 > 0 )
            level._id_7C67 = 0;

        level._id_7C67 -= var_0;
    }
    else
        level._id_7C67 = 0;
}

_id_9AD4()
{
    var_0 = 0;

    foreach ( var_2 in level._id_0575._id_7C60 )
    {
        if ( var_2._id_9C3A["type"] == "reactive_fx" )
            var_0 = 1;

        var_2 [[ level._id_3AEF ]]();
    }

    if ( var_0 )
        _id_72BE();
}

_id_44E5( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "painter_mp";

    precachemenu( var_0 );
    wait 0.05;

    if ( var_0 == "painter_mp" )
        return;

    level._id_031D _meth_8323( var_0 );
    level._id_031D _meth_8325( var_0 );
}

_id_8E88()
{
    if ( isdefined( self._id_5878 ) )
        self._id_5878 delete();

    _id_8E9D();
}

_id_8E9D()
{
    self notify( "stop_loop" );
}

_id_3AE6()
{
    if ( !isdefined( level._id_0590 ) )
        var_0 = getarraykeys( level._id_058F );
    else
    {
        var_0 = getarraykeys( level._id_058F );

        if ( var_0.size == level._id_0590.size )
            return level._id_0590;
    }

    var_0 = _id_A4F0::_id_0AF9( var_0 );
    level._id_0590 = var_0;
    return var_0;
}

_id_7487()
{
    _id_8E88();
    _id_7E3A();

    switch ( self._id_9C3A["type"] )
    {
        case "loopfx":
            _id_A4EE::_id_23C9();
            break;
        case "oneshotfx":
            _id_A4EE::_id_23DD();
            break;
        case "soundfx":
            _id_A4EE::_id_23CA();
            break;
        case "soundfx_interval":
            _id_A4EE::_id_23C3();
            break;
        case "soundfx_dynamic":
            _id_A4EE::_id_23AF();
            break;
    }
}

_id_72BE()
{
    level._id_05B2._id_718A = undefined;

    foreach ( var_1 in level._id_2417 )
    {
        if ( var_1._id_9C3A["type"] == "reactive_fx" )
        {
            var_1 _id_7E3A();
            var_1 _id_A4EE::_id_078A();
        }
    }
}

_id_6FE9()
{
    if ( level._id_3B81 )
    {
        thread _id_780B();
        level._id_240E = 0;
        return;
    }

    _id_7DB5();

    if ( !_id_760A() )
        return;

    level._id_3B81 = 1;

    if ( level._id_0575._id_7C60.size > 1 && !level._id_0575._id_57ED )
    {
        var_0 = _id_3CE5( level._id_0575._id_7C60 );
        var_1 = spawn( "script_origin", var_0 );
        var_1._id_9C3A["angles"] = level._id_0575._id_7C60[0]._id_9C3A["angles"];
        var_1._id_9C3A["origin"] = var_0;
        var_2 = [];

        for ( var_3 = 0; var_3 < level._id_0575._id_7C60.size; var_3++ )
        {
            var_2[var_3] = spawn( "script_origin", level._id_0575._id_7C60[var_3]._id_9C3A["origin"] );
            var_2[var_3]._id_0041 = level._id_0575._id_7C60[var_3]._id_9C3A["angles"];
            var_2[var_3] _meth_8446( var_1 );
        }

        _id_75EF( var_1, var_2 );
        var_1 delete();

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_2[var_3] delete();
    }
    else if ( level._id_0575._id_7C60.size > 0 )
    {
        foreach ( var_5 in level._id_0575._id_7C60 )
        {
            var_2 = spawn( "script_origin", ( 0, 0, 0 ) );
            var_2._id_0041 = var_5._id_9C3A["angles"];

            if ( level._id_7C66 != 0 )
                var_2 _meth_82B9( level._id_7C66 );
            else if ( level._id_7C68 != 0 )
                var_2 _meth_82BA( level._id_7C68 );
            else
                var_2 _meth_82BB( level._id_7C67 );

            var_5._id_9C3A["angles"] = var_2._id_0041;
            var_2 delete();
        }

        wait 0.05;
    }

    level._id_3B81 = 0;
}

_id_88FE()
{
    playfx( level._id_0575._id_01CD._id_3B21, level._id_2416["position"] );
    level._id_0575._id_01CD _meth_809A( level._id_0575._id_01CD._id_8893 );
    radiusdamage( level._id_2416["position"], level._id_0575._id_01CD._id_0354, 50, 5, undefined, "MOD_EXPLOSIVE" );
    level notify( "code_damageradius", undefined, level._id_0575._id_01CD._id_0354, level._id_2416["position"] );
}

_id_84D1()
{
    if ( level._id_240B == 1 )
    {
        _id_1EB9();
        level._id_240B = 0;
        level._id_2410 = 0;
        _id_741A();
    }
    else
    {
        level._id_240B = 1;
        level._id_2410 = 1;
        common_scripts\_createfxmenu::_id_2DB5();
        thread common_scripts\_createfxmenu::_id_4836();
        _id_1EDB();
    }

    wait 0.2;
}

_id_3C82( var_0 )
{

}

_id_A355( var_0, var_1 )
{
    var_2 = "\\t";

    if ( getdvarint( "scr_map_exploder_dump" ) )
    {
        if ( !isdefined( var_0._id_02A0 ) )
            return;
    }
    else if ( isdefined( var_0._id_02A0 ) )
        return;

    if ( var_0._id_9C3A["type"] == "loopfx" )
        _id_1C19( var_2 + "ent = createLoopEffect( \"" + var_0._id_9C3A["fxid"] + "\" );" );

    if ( var_0._id_9C3A["type"] == "oneshotfx" )
        _id_1C19( var_2 + "ent = createOneshotEffect( \"" + var_0._id_9C3A["fxid"] + "\" );" );

    if ( var_0._id_9C3A["type"] == "exploder" )
    {
        if ( isdefined( var_0._id_9C3A["exploder"] ) && !level._id_5FA9 )
            _id_1C19( var_2 + "ent = createExploderEx( \"" + var_0._id_9C3A["fxid"] + "\", \"" + var_0._id_9C3A["exploder"] + "\" );" );
        else
            _id_1C19( var_2 + "ent = createExploder( \"" + var_0._id_9C3A["fxid"] + "\" );" );
    }

    if ( var_0._id_9C3A["type"] == "soundfx" )
        _id_1C19( var_2 + "ent = createLoopSound();" );

    if ( var_0._id_9C3A["type"] == "soundfx_interval" )
        _id_1C19( var_2 + "ent = createIntervalSound();" );

    if ( var_0._id_9C3A["type"] == "reactive_fx" )
        _id_1C19( var_2 + "ent = createReactiveEnt();" );

    if ( var_0._id_9C3A["type"] == "soundfx_dynamic" )
        _id_1C19( var_2 + "ent = createDynamicAmbience();" );

    _id_1C19( var_2 + "ent set_origin_and_angles( " + var_0._id_9C3A["origin"] + ", " + var_0._id_9C3A["angles"] + " );" );
    _id_6F95( var_0, var_2, var_1 );
    _id_1C19( "" );
}

_id_A356( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "\\t";
    _id_1C1B();
    _id_1C19( "//_createfx generated. Do not touch!!" );
    _id_1C19( "#include common_scripts\\utility;" );
    _id_1C19( "#include common_scripts\\_createfx;\\n" );
    _id_1C19( "" );
    _id_1C19( "main()" );
    _id_1C19( "{" );
    var_6 = var_0.size;

    if ( isdefined( var_4 ) )
        var_6 += var_4.size;

    _id_1C19( var_5 + "// CreateFX " + var_1 + " entities placed: " + var_6 );

    foreach ( var_8 in var_0 )
    {
        if ( level._id_240F > 16 )
        {
            level._id_240F = 0;
            wait 0.1;
        }

        level._id_240F++;
        _id_A355( var_8, var_2 );
    }

    if ( isdefined( var_4 ) )
    {
        foreach ( var_11 in var_4 )
        {
            if ( level._id_240F > 16 )
            {
                level._id_240F = 0;
                wait 0.1;
            }

            level._id_240F++;
            var_8 = spawnstruct();
            var_8._id_9C3A = var_11;
            _id_A355( var_8, var_2 );
        }
    }

    _id_1C19( "}" );
    _id_1C19( " " );
    _id_1C1A( var_2, var_3, var_1 );
}

_id_2403()
{
    var_0 = 0.1;

    foreach ( var_2 in level._id_2417 )
    {
        var_3 = [];
        var_4 = [];

        for ( var_5 = 0; var_5 < 3; var_5++ )
        {
            var_3[var_5] = var_2._id_9C3A["origin"][var_5];
            var_4[var_5] = var_2._id_9C3A["angles"][var_5];

            if ( var_3[var_5] < var_0 && var_3[var_5] > var_0 * -1 )
                var_3[var_5] = 0;

            if ( var_4[var_5] < var_0 && var_4[var_5] > var_0 * -1 )
                var_4[var_5] = 0;
        }

        var_2._id_9C3A["origin"] = ( var_3[0], var_3[1], var_3[2] );
        var_2._id_9C3A["angles"] = ( var_4[0], var_4[1], var_4[2] );
    }
}

_id_3D1A( var_0 )
{
    var_1 = _id_3D1B( var_0 );
    var_2 = [];

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = [];

    foreach ( var_7 in level._id_2417 )
    {
        var_8 = 0;

        foreach ( var_5, var_0 in var_1 )
        {
            if ( var_7._id_9C3A["type"] != var_0 )
                continue;

            var_8 = 1;
            var_2[var_5][var_2[var_5].size] = var_7;
            break;
        }
    }

    var_11 = [];

    for ( var_12 = 0; var_12 < var_1.size; var_12++ )
    {
        foreach ( var_7 in var_2[var_12] )
            var_11[var_11.size] = var_7;
    }

    return var_11;
}

_id_3D1B( var_0 )
{
    var_1 = [];

    if ( var_0 == "fx" )
    {
        var_1[0] = "loopfx";
        var_1[1] = "oneshotfx";
        var_1[2] = "exploder";
    }
    else
    {
        var_1[0] = "soundfx";
        var_1[1] = "soundfx_interval";
        var_1[2] = "reactive_fx";
        var_1[3] = "soundfx_dynamic";
    }

    return var_1;
}

_id_500C( var_0, var_1 )
{
    var_2 = _id_3D1B( var_1 );

    foreach ( var_4 in var_2 )
    {
        if ( var_0._id_9C3A["type"] == var_4 )
            return 1;
    }

    return 0;
}

_id_240A()
{
    var_0 = [];
    var_0[0] = "soundfx";
    var_0[1] = "loopfx";
    var_0[2] = "oneshotfx";
    var_0[3] = "exploder";
    var_0[4] = "soundfx_interval";
    var_0[5] = "reactive_fx";
    var_0[6] = "soundfx_dynamic";
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_4] = [];

    foreach ( var_6 in level._id_2417 )
    {
        var_7 = 0;

        foreach ( var_4, var_9 in var_0 )
        {
            if ( var_6._id_9C3A["type"] != var_9 )
                continue;

            var_7 = 1;
            var_1[var_4][var_1[var_4].size] = var_6;
            break;
        }
    }

    var_11 = [];

    for ( var_12 = 0; var_12 < var_0.size; var_12++ )
    {
        foreach ( var_6 in var_1[var_12] )
            var_11[var_11.size] = var_6;
    }

    level._id_2417 = var_11;
}

_id_1C1B()
{
    _id_A4F0::_id_36B7();
}

_id_1C19( var_0 )
{
    _id_A4F0::_id_36B5( var_0 );
}

_id_1C1A( var_0, var_1, var_2 )
{
    var_3 = 1;

    if ( var_1 != "" || var_0 )
        var_3 = 0;

    if ( _id_A4F0::_id_51AB() )
    {
        var_4 = _id_A4F0::_id_3E92() + var_1 + "_" + var_2 + ".gsc";

        if ( var_0 )
            var_4 = "backup_" + var_2 + ".gsc";
    }
    else
    {
        var_4 = _id_A4F0::_id_3E92() + var_1 + "_" + var_2 + ".gsc";

        if ( var_0 )
            var_4 = "backup.gsc";
    }

    _id_A4F0::_id_36B6( "/share/raw/maps/createfx/" + var_4, var_3 );
}

_id_6FDD()
{
    _id_073A( "mouse1" );
    _id_073A( "BUTTON_RSHLDR" );
    _id_073A( "BUTTON_LSHLDR" );
    _id_073A( "BUTTON_RSTICK" );
    _id_073A( "BUTTON_LSTICK" );
    _id_073A( "BUTTON_A" );
    _id_073A( "BUTTON_B" );
    _id_073A( "BUTTON_X" );
    _id_073A( "BUTTON_Y" );
    _id_073A( "DPAD_UP" );
    _id_073A( "DPAD_LEFT" );
    _id_073A( "DPAD_RIGHT" );
    _id_073A( "DPAD_DOWN" );
    _id_076B( "shift" );
    _id_076B( "ctrl" );
    _id_076B( "escape" );
    _id_076B( "F1" );
    _id_076B( "F5" );
    _id_076B( "F4" );
    _id_076B( "F2" );
    _id_076B( "a" );
    _id_076B( "g" );
    _id_076B( "c" );
    _id_076B( "h" );
    _id_076B( "i" );
    _id_076B( "f" );
    _id_076B( "k" );
    _id_076B( "l" );
    _id_076B( "m" );
    _id_076B( "o" );
    _id_076B( "p" );
    _id_076B( "r" );
    _id_076B( "s" );
    _id_076B( "u" );
    _id_076B( "v" );
    _id_076B( "x" );
    _id_076B( "y" );
    _id_076B( "z" );
    _id_076B( "del" );
    _id_076B( "end" );
    _id_076B( "tab" );
    _id_076B( "ins" );
    _id_076B( "add" );
    _id_076B( "space" );
    _id_076B( "enter" );
    _id_076B( "1" );
    _id_076B( "2" );
    _id_076B( "3" );
    _id_076B( "4" );
    _id_076B( "5" );
    _id_076B( "6" );
    _id_076B( "7" );
    _id_076B( "8" );
    _id_076B( "9" );
    _id_076B( "0" );
    _id_076B( "-" );
    _id_076B( "=" );
    _id_076B( "," );
    _id_076B( "." );
    _id_076B( "[" );
    _id_076B( "]" );
    _id_076B( "leftarrow" );
    _id_076B( "rightarrow" );
    _id_076B( "uparrow" );
    _id_076B( "downarrow" );
}

_id_5806( var_0 )
{
    if ( isdefined( level._id_0575._id_580B[var_0] ) )
        return 0;

    return _id_52D0( var_0 );
}

_id_52D0( var_0 )
{
    return level._id_240D && isdefined( level._id_194E[var_0] );
}

_id_073A( var_0 )
{
    if ( _id_5806( var_0 ) )
        return;

    if ( !isdefined( level._id_195A[var_0] ) )
    {
        if ( level._id_031D _meth_824C( var_0 ) )
        {
            level._id_195A[var_0] = 1;
            level._id_1958[var_0] = 1;
        }
    }
    else if ( !level._id_031D _meth_824C( var_0 ) )
        level._id_195A[var_0] = undefined;
}

_id_076B( var_0 )
{
    level._id_194E[var_0] = 1;
    _id_073A( var_0 );
}

_id_1959( var_0, var_1 )
{
    return _id_1962( var_0 ) || _id_1962( var_1 );
}

_id_1962( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( _id_52D0( var_0 ) )
        return 0;

    return level._id_031D _meth_824C( var_0 );
}

_id_194D( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        if ( isdefined( level._id_195A[var_1] ) )
            return 1;
    }

    return isdefined( level._id_195A[var_0] );
}

_id_194C( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        if ( isdefined( level._id_1958[var_1] ) )
            return 1;
    }

    return isdefined( level._id_1958[var_0] );
}

_id_4CFB()
{
    level._id_0575._id_4AE6 = [];
    level._id_0575._id_4ADE = 30;
    var_0 = [];
    var_1 = [];
    var_0[0] = 0;
    var_1[0] = 0;
    var_0[1] = 1;
    var_1[1] = 1;
    var_0[2] = -2;
    var_1[2] = 1;
    var_0[3] = 1;
    var_1[3] = -1;
    var_0[4] = -2;
    var_1[4] = -1;
    level._id_1F0A = newhudelem();
    level._id_1F0A._id_0037 = 0;

    for ( var_2 = 0; var_2 < level._id_0575._id_4ADE; var_2++ )
    {
        var_3 = [];

        for ( var_4 = 0; var_4 < 1; var_4++ )
        {
            var_5 = newhudelem();
            var_5._id_002C = "left";
            var_5._id_57F1 = 0;
            var_5._id_019A = 1;
            var_5._id_018C = 1.4;
            var_5._id_03D5 = 20 - var_4;
            var_5._id_0037 = 1;
            var_5._id_0530 = 0 + var_0[var_4];
            var_5._id_0538 = 60 + var_1[var_4] + var_2 * 15;

            if ( var_4 > 0 )
                var_5._id_00C5 = ( 0, 0, 0 );

            var_3[var_3.size] = var_5;
        }

        level._id_0575._id_4AE6[var_2] = var_3;
    }

    var_3 = [];

    for ( var_4 = 0; var_4 < 5; var_4++ )
    {
        var_5 = newhudelem();
        var_5._id_002C = "center";
        var_5._id_57F1 = 0;
        var_5._id_019A = 1;
        var_5._id_018C = 1.4;
        var_5._id_03D5 = 20 - var_4;
        var_5._id_0037 = 1;
        var_5._id_0530 = 320 + var_0[var_4];
        var_5._id_0538 = 80 + var_1[var_4];

        if ( var_4 > 0 )
            var_5._id_00C5 = ( 0, 0, 0 );

        var_3[var_3.size] = var_5;
    }

    level._id_2405 = var_3;
}

_id_4CCB()
{
    var_0 = newhudelem();
    var_0._id_57F1 = 0;
    var_0._id_002C = "center";
    var_0._id_002D = "middle";
    var_0._id_019A = 1;
    var_0._id_018C = 2;
    var_0._id_03D5 = 20;
    var_0._id_0037 = 1;
    var_0._id_0530 = 320;
    var_0._id_0538 = 233;
}

_id_1EB9()
{
    level._id_1F0A _meth_80CB();

    for ( var_0 = 0; var_0 < level._id_0575._id_4ADE; var_0++ )
    {
        for ( var_1 = 0; var_1 < 1; var_1++ )
        {

        }
    }

    level._id_3BA5 = 0;
}

_id_7E3C( var_0 )
{
    for ( var_1 = 0; var_1 < 1; var_1++ )
    {

    }

    level._id_3BA5++;
}

_id_4D68()
{
    if ( !isdefined( level._id_0575._id_93E4 ) )
        level._id_0575._id_93E4 = [];

    if ( !isdefined( level._id_0575._id_93E3 ) )
        level._id_0575._id_93E3 = 1;

    if ( !isdefined( level._id_0575._id_93E2 ) )
        level._id_0575._id_93E2 = "";
}

_id_60A6( var_0 )
{
    foreach ( var_3, var_2 in level._id_0575._id_93E4 )
    {
        if ( isdefined( var_2._id_9C4C ) )
            var_2._id_9C4C _meth_8088();

        var_2 _meth_8088();
        level._id_0575._id_93E4[var_3] = undefined;
    }

    level._id_0575._id_93E2 = var_0;
}

_id_24F0( var_0 )
{
    return level._id_0575._id_93E2 == var_0;
}

_id_1EDB()
{
    _id_60A6( "" );
}

_id_60A7( var_0 )
{
    var_1 = newhudelem();
    var_1._id_002C = "left";
    var_1._id_57F1 = 0;
    var_1._id_019A = 1;
    var_1._id_018C = 1.2;
    var_1._id_0037 = 1;
    var_1._id_0530 = 0;
    var_1._id_0538 = 320 + var_0 * 15;
    return var_1;
}

_id_3E97( var_0 )
{
    if ( isdefined( level._id_0575._id_93E4[var_0] ) )
        return level._id_0575._id_93E4[var_0];

    return undefined;
}

_id_7ED5( var_0, var_1, var_2 )
{
    var_3 = _id_3E97( var_0 );

    if ( !isdefined( var_3 ) )
    {
        var_3 = _id_60A7( level._id_0575._id_93E4.size );
        level._id_0575._id_93E4[var_0] = var_3;
        var_3._id_92AB = var_0;
    }

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_3._id_9C4C ) )
            var_4 = var_3._id_9C4C;
        else
        {
            var_4 = _id_60A7( level._id_0575._id_93E4.size );
            var_4._id_0530 += 110;
            var_4._id_0538 = var_3._id_0538;
            var_3._id_9C4C = var_4;
        }

        if ( isdefined( var_4._id_92AB ) && var_4._id_92AB == var_1 )
            return;

        var_4._id_92AB = var_1;

        if ( !isdefined( var_2 ) )
            var_2 = ( 1, 1, 1 );

        var_4._id_00C5 = var_2;
    }
}

_id_7C56()
{
    var_0 = getdvar( "select_by_substring" );

    if ( var_0 == "" )
        return 0;

    setdvar( "select_by_substring", "" );
    var_1 = [];

    foreach ( var_4, var_3 in level._id_2417 )
    {
        if ( issubstr( var_3._id_9C3A["fxid"], var_0 ) )
            var_1[var_1.size] = var_4;
    }

    if ( var_1.size == 0 )
        return 0;

    _id_28B1();
    _id_7C58( var_1 );

    foreach ( var_6 in var_1 )
    {
        var_3 = level._id_2417[var_6];
        _id_7C57( var_6, var_3 );
    }

    return 1;
}

_id_7C58( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_3 = level._id_2417[var_2];
        _id_7C57( var_2, var_3 );
    }
}

_id_28B1()
{
    foreach ( var_2, var_1 in level._id_0575._id_7C60 )
        _id_28B2( var_2, var_1 );
}

_id_8164()
{
    wait 0.5;

    for (;;)
    {
        level._id_240E += 0.05;

        if ( level._id_240E == 0.15 )
        {
            foreach ( var_1 in level._id_0575._id_7C60 )
            {
                if ( var_1._id_9C3A["type"] == "exploder" )
                    var_1 _id_A4F0::_id_06FD();
            }

            common_scripts\_createfxmenu::_id_2B45();
            _id_7809();
        }

        if ( level._id_240E == 0.05 )
        {
            var_1 = common_scripts\_createfxmenu::_id_3DB1();
            common_scripts\_createfxmenu::_id_2B45();
        }

        wait 0.05;
    }
}

_id_3A0B()
{
    if ( level._id_0575._id_7C60.size < 1 )
        return;

    if ( level._id_0575._id_7C60.size > 1 )
    {
        var_0 = _id_3CE5( level._id_0575._id_7C60 );
        var_1 = _id_3E3F( level._id_0575._id_7C60 ) + 200;
    }
    else
    {
        var_0 = level._id_0575._id_7C60[0]._id_9C3A["origin"];
        var_1 = 200;
    }

    var_2 = anglestoforward( level._id_031D _meth_833B() );
    var_3 = var_2 * ( -1 * var_1 );
    var_4 = level._id_031D _meth_80A8();
    var_5 = var_4 - level._id_031D._id_02E6;
    level._id_031D _meth_8338( var_0 + var_3 - var_5 );
}

_id_1E96()
{
    foreach ( var_1 in level._id_2417 )
    {
        if ( isdefined( var_1._id_5878 ) )
            var_1._id_5878 delete();

        var_1 _id_8E9D();
    }
}

_id_7488()
{
    foreach ( var_1 in level._id_2417 )
    {
        if ( var_1._id_9C3A["type"] == "oneshotfx" )
            var_1 _id_7487();
    }
}

_id_7489()
{
    foreach ( var_1 in level._id_0575._id_7C60 )
    {
        if ( isdefined( var_1 ) && var_1._id_9C3A["type"] == "exploder" )
            var_1 _id_A4F0::_id_06FD();
    }
}

_id_780B()
{
    if ( isdefined( level._id_2417 ) && level._id_240E > 0.15 )
        level._id_2419 = _id_21DA( level._id_2417 );
}

_id_7809()
{
    if ( isdefined( level._id_2417 ) )
        level._id_2418 = _id_21DA( level._id_2417 );
}

_id_9A1B()
{
    if ( isdefined( level._id_2419 ) )
    {
        _id_1E96();
        level._id_2417 = [];
        level._id_2417 = _id_21DA( level._id_2419 );
        _id_1EB9();
        _id_741A();
        _id_7488();
        _id_7489();
    }
}

_id_729F()
{
    if ( isdefined( level._id_2418 ) )
    {
        _id_1E96();
        level._id_2417 = [];
        level._id_2417 = _id_21DA( level._id_2418 );
        _id_1EB9();
        _id_741A();
        _id_7488();
        _id_7489();
    }
}

_id_21DA( var_0 )
{
    var_1 = [];

    if ( var_0.size > 0 )
    {
        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            var_3 = spawnstruct();

            if ( isdefined( var_0[var_2]._id_9C3A ) )
            {
                var_3._id_9C3A = [];
                var_3._id_9C3A["type"] = var_0[var_2]._id_9C3A["type"];
                var_3._id_9C3A["fxid"] = var_0[var_2]._id_9C3A["fxid"];
                var_3._id_9C3A["soundalias"] = var_0[var_2]._id_9C3A["soundalias"];
                var_3._id_9C3A["loopsound"] = var_0[var_2]._id_9C3A["loopsound"];
                var_3._id_9C3A["angles"] = var_0[var_2]._id_9C3A["angles"];
                var_3._id_9C3A["origin"] = var_0[var_2]._id_9C3A["origin"];
                var_3._id_9C3A["exploder"] = var_0[var_2]._id_9C3A["exploder"];
                var_3._id_9C3A["flag"] = var_0[var_2]._id_9C3A["flag"];
                var_3._id_9C3A["exploder_type"] = var_0[var_2]._id_9C3A["exploder_type"];
                var_3._id_9C3A["server_culled"] = var_0[var_2]._id_9C3A["server_culled"];
                var_3._id_9C3A["delay_min"] = var_0[var_2]._id_9C3A["delay_min"];
                var_3._id_9C3A["delay_max"] = var_0[var_2]._id_9C3A["delay_max"];
                var_3._id_9C3A["soundalias"] = var_0[var_2]._id_9C3A["soundalias"];
                var_3._id_9C3A["delay"] = var_0[var_2]._id_9C3A["delay"];
                var_3._id_9C3A["forward"] = var_0[var_2]._id_9C3A["forward"];
                var_3._id_9C3A["up"] = var_0[var_2]._id_9C3A["up"];
                var_1[var_2] = var_3;
            }

            var_1[var_2]._id_2DDA = var_0[var_2]._id_2DDA;
            var_1[var_2]._id_92B4 = var_0[var_2]._id_92B4;
        }
    }

    return var_1;
}

_id_73B0( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in level._id_2417 )
    {
        if ( isdefined( var_3._id_02A0 ) && var_3._id_02A0 == var_0 )
            continue;

        var_1[var_1.size] = var_3;
    }

    level._id_2417 = var_1;
}
