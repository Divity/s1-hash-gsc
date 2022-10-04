// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( !isdefined( level._id_2C7A ) )
    {
        level._id_2C7A["nearStart"] = 0;
        level._id_2C7A["nearEnd"] = 0;
        level._id_2C7A["farStart"] = 0;
        level._id_2C7A["farEnd"] = 0;
        level._id_2C7A["nearBlur"] = 6;
        level._id_2C7A["farBlur"] = 1.8;
    }
}

_id_8105()
{

}

_id_4E2E()
{

}

_id_99DB()
{

}

_id_99D9()
{

}

_id_3A02()
{

}

_id_215C()
{
    if ( !isdefined( level._id_9E64 ) )
        level._id_9E64 = [];

    var_0 = getentarray( "trigger_multiple_visionset", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_03A4 ) )
            _id_215D( var_2._id_03A4 );

        if ( isdefined( var_2._id_7B19 ) )
            _id_215D( var_2._id_7B19 );

        if ( isdefined( var_2._id_7B18 ) )
            _id_215D( var_2._id_7B18 );
    }
}

_id_215D( var_0 )
{
    if ( isdefined( level._id_9E64[var_0] ) )
        return;

    _id_23AA( var_0 );
    _id_23E0( var_0 );
    iprintlnbold( "new vision: " + var_0 );
}

_id_23E0( var_0 )
{
    if ( !isdefined( level._id_9E6A ) )
        level._id_9E6A = [];

    var_1 = spawnstruct();
    var_1._id_02AB = var_0;
    level._id_9E6A[var_0] = var_1;
    return var_1;
}

_id_07BB()
{

}

_id_07BA( var_0 )
{

}

_id_23AA( var_0 )
{
    var_1 = _id_23DF( var_0 );
    var_1._id_8D02 = 3764.17;
    var_1._id_44FD = 19391;
    var_1._id_7296 = 0.661137;
    var_1._id_43D5 = 0.554261;
    var_1._id_14C5 = 0.454014;
    var_1._id_5A44 = 0.7;
    var_1._id_9715 = 0;
    var_1._id_85C7 = 0;
    var_1._id_85C9 = 0;
    var_1._id_85C8 = 0;
    var_1._id_479C = 0;
    var_1._id_479B = 0;
    var_1._id_479D = 1000;
}

_id_23DF( var_0 )
{
    if ( !isdefined( level._id_9E64 ) )
        level._id_9E64 = [];

    var_1 = spawnstruct();
    var_1._id_02AB = var_0;
    var_1._id_85C7 = 0;
    var_1._id_85C9 = 0;
    var_1._id_85C8 = 0;
    var_1._id_479C = 0;
    var_1._id_479B = 0;
    var_1._id_479D = 1000;
    level._id_9E64[tolower( var_0 )] = var_1;
    return var_1;
}

_id_7E2E( var_0, var_1 )
{
    level._id_9E69._id_9E62 = var_0;
    level._id_9E69._id_04B8 = var_1;
    var_2 = _id_3D74( var_0 );

    if ( getdvarint( "scr_art_tweak" ) != 0 )
    {
        _id_971E( var_2 );
        var_1 = 0;
    }

    _id_A4F0::_id_7E30( var_2, var_1 );
}

_id_971E( var_0 )
{

}

_id_4AC3()
{
    var_0 = 7;
    var_1 = [];
    var_2 = 15;
    var_3 = int( var_0 / 2 );
    var_4 = 240 + var_3 * var_2;
    var_5 = 0.5 / var_3;
    var_6 = var_5;

    for ( var_7 = 0; var_7 < var_0; var_7++ )
    {
        var_1[var_7] = _id_05FD();
        var_1[var_7]._id_57F1 = 0;
        var_1[var_7]._id_002C = "left";
        var_1[var_7]._id_002D = "middle";
        var_1[var_7]._id_019A = 1;
        var_1[var_7]._id_018C = 2;
        var_1[var_7]._id_03D5 = 20;

        if ( var_7 == var_3 )
            var_1[var_7]._id_0037 = 1;
        else
            var_1[var_7]._id_0037 = var_6;

        var_1[var_7]._id_0530 = 20;
        var_1[var_7]._id_0538 = var_4;
        var_1[var_7] _id_0641( "." );

        if ( var_7 == var_3 )
            var_5 *= -1;

        var_6 += var_5;
        var_4 -= var_2;
    }

    level._id_88B1 = var_1;
}

_id_05FD()
{
    if ( !isdefined( level._id_7B30 ) )
        level._id_7B30 = [];

    var_0 = newhudelem();
    level._id_7B30[level._id_7B30.size] = var_0;
    return var_0;
}

_id_0641( var_0 )
{
    self._id_71E7 = var_0;
    self _meth_80CA( "_" );
    thread _id_0567();
    var_1 = 0;

    foreach ( var_3 in level._id_7B30 )
    {
        if ( isdefined( var_3._id_71E7 ) )
        {
            var_1 += var_3._id_71E7.size;
            var_3 _meth_80CA( var_3._id_71E7 );
        }
    }
}

_id_0567()
{
    if ( getdvar( "netconststrings_enabled" ) != "0" )
        return;

    if ( level._id_0567 )
        return;

    level._id_0567 = 1;
    self _meth_80CB();
    wait 0.05;
    level._id_0567 = 0;
}

_id_7F7C()
{
    _id_7423();
    var_0 = undefined;
    var_1 = getarraykeys( level._id_9E64 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] == level._id_9E69._id_9E62 )
        {
            var_0 = var_2 + 1;
            break;
        }
    }

    if ( var_0 == var_1.size )
        return;

    _id_7F3E( var_1[var_0] );
}

_id_7F7B()
{
    _id_7423();
    var_0 = undefined;
    var_1 = getarraykeys( level._id_9E64 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] == level._id_9E69._id_9E62 )
        {
            var_0 = var_2 - 1;
            break;
        }
    }

    if ( var_0 < 0 )
        return;

    _id_7F3E( var_1[var_0] );
}

_id_7423()
{

}

vision_set_fog_changes_mp( var_0, var_1 )
{
    foreach ( var_3 in level._id_0328 )
    {
        var_3 _meth_82D4( var_0, var_1 );
        var_3 _meth_8323( "dev_vision_exec" );
        wait 0.05;
        var_3 _meth_8325( "dev_vision_exec" );
    }

    _id_7E2E( var_0, var_1 );
}

_id_7F3E( var_0 )
{
    var_1 = getarraykeys( level._id_9E64 );

    if ( level._id_00E4 )
    {
        var_2 = var_0 + "_cg";
        var_3 = _id_A4F0::_id_0CE8( var_1, var_2 );

        if ( isdefined( var_3 ) )
            var_0 = var_2;
    }

    level._id_88B2 = var_0;
    var_4 = 0;
    var_5 = int( level._id_88B1.size / 2 );

    for ( var_6 = 0; var_6 < var_1.size; var_6++ )
    {
        if ( var_1[var_6] == var_0 )
        {
            var_4 = var_6;
            break;
        }
    }

    level._id_88B1[var_5] _id_0641( var_1[var_4] );

    for ( var_6 = 1; var_6 < level._id_88B1.size - var_5; var_6++ )
    {
        if ( var_4 - var_6 < 0 )
        {
            level._id_88B1[var_5 + var_6] _id_0641( "." );
            continue;
        }

        level._id_88B1[var_5 + var_6] _id_0641( var_1[var_4 - var_6] );
    }

    for ( var_6 = 1; var_6 < level._id_88B1.size - var_5; var_6++ )
    {
        if ( var_4 + var_6 > var_1.size - 1 )
        {
            level._id_88B1[var_5 - var_6] _id_0641( "." );
            continue;
        }

        level._id_88B1[var_5 - var_6] _id_0641( var_1[var_4 + var_6] );
    }

    vision_set_fog_changes_mp( var_1[var_4], 0 );
}

_id_3D74( var_0 )
{
    if ( !isdefined( level._id_9E64 ) )
        level._id_9E64 = [];

    var_1 = level._id_9E64[var_0];
    return var_1;
}

_id_4CF0()
{
    if ( !isdefined( level._id_395F ) )
    {
        level._id_395F = spawnstruct();
        level._id_395F._id_3962 = "";
        level._id_395F._id_04B8 = 0;
    }
}

_id_6CC9()
{
    var_0 = level._id_9E69._id_9E62;
    level._id_9E69._id_9E62 = "";
    level._id_9E69._id_04B8 = "";
    _id_4CF0();
    level._id_395F._id_3962 = "";
    level._id_395F._id_04B8 = "";
    _id_7F3E( var_0 );
}

_id_1949( var_0, var_1 )
{
    var_2 = level._id_031D _meth_824C( var_0 );

    if ( !var_2 )
        var_2 = level._id_031D _meth_824C( var_1 );

    if ( !isdefined( level._id_1963[var_0] ) )
        level._id_1963[var_0] = 0;

    if ( gettime() < level._id_1963[var_0] )
        return 0;

    level._id_1963[var_0] = gettime() + 400;
    return var_2;
}

_id_2FC7()
{

}

_id_0D36()
{
    _id_A4F0::_id_36B7();
}

_id_0D2D()
{
    return _id_A4F0::_id_36B6( "\\share\\raw\\vision\\" + level._id_0391 + ".vision", 1 );
}

_id_0D35()
{
    _id_A4F0::_id_36B7();
}

_id_0D2C()
{
    return _id_A4F0::_id_36B6( "\\share\\raw\\maps\\createart\\" + level._id_0391 + "_art.gsc", 1 );
}

_id_0D2E()
{
    _id_A4F0::_id_36B5( "" );
    _id_A4F0::_id_36B5( "\\t//* Fog section * " );
    _id_A4F0::_id_36B5( "" );
    _id_A4F0::_id_36B5( "\\tsetDevDvar( \"scr_fog_disable\", \"" + getdvarint( "scr_fog_disable" ) + "\"" + " );" );
    _id_A4F0::_id_36B5( "" );
    _id_A4F0::_id_36B5( "\\t/$" );

    if ( _func_235() )
        _id_A4F0::_id_36B5( "\\tlevel._art_fog_setup = maps\\createart\\" + level._id_0391 + "_fog_hdr::main;" );
    else
        _id_A4F0::_id_36B5( "\\tlevel._art_fog_setup = maps\\createart\\" + level._id_0391 + "_fog::main;" );

    _id_A4F0::_id_36B5( "\\t$/" );
}

_id_0D2B()
{

}

_id_23C7( var_0 )
{
    if ( !isdefined( level._id_5708 ) )
        level._id_5708 = [];

    var_1 = spawnstruct();
    var_1._id_02AB = var_0;
    level._id_5708[var_0] = var_1;
    return var_1;
}
