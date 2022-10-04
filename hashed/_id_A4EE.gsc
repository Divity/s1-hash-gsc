// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_4DBC()
{
    if ( !isdefined( level._id_3AE2 ) )
        level._id_3AE2 = [];

    if ( !isdefined( level._id_3AE2["create_triggerfx"] ) )
        level._id_3AE2["create_triggerfx"] = ::_id_23DD;

    if ( !isdefined( level._id_05B2 ) )
        level._id_05B2 = spawnstruct();

    _id_A4F0::_id_23C8( "createfx_looper", 20 );
    level._id_3BA4 = 1;
    level._id_05B2._id_3537 = _id_A4ED::_id_3528;
    waitframe;
    waitframe;
    level._id_05B2._id_3537 = _id_A4ED::_id_3527;
    level._id_05B2._id_7D98 = 0;

    if ( getdvarint( "serverCulledSounds" ) == 1 )
        level._id_05B2._id_7D98 = 1;

    if ( level._id_2409 )
        level._id_05B2._id_7D98 = 0;

    if ( level._id_2409 )
        level waittill( "createfx_common_done" );

    for ( var_0 = 0; var_0 < level._id_2417.size; var_0++ )
    {
        var_1 = level._id_2417[var_0];
        var_1 common_scripts\_createfx::_id_7E3A();

        switch ( var_1._id_9C3A["type"] )
        {
            case "loopfx":
                var_1 thread _id_5880();
                continue;
            case "oneshotfx":
                var_1 thread _id_649D();
                continue;
            case "soundfx":
                var_1 thread _id_23CA();
                continue;
            case "soundfx_interval":
                var_1 thread _id_23C3();
                continue;
            case "reactive_fx":
                var_1 _id_078A();
                continue;
            case "soundfx_dynamic":
                var_1 thread _id_23AF();
                continue;
        }
    }

    _id_1CB4();
}

_id_7343()
{

}

_id_1CB4()
{

}

_id_1CD1( var_0, var_1 )
{

}

_id_6F96( var_0, var_1, var_2, var_3 )
{
    if ( getdvar( "debug" ) == "1" )
        return;
}

_id_688C()
{
    if ( isdefined( self._id_9C3A["platform"] ) && isdefined( level._id_00E4 ) )
    {
        var_0 = self._id_9C3A["platform"];

        if ( var_0 == "cg" && !level._id_00E4 || var_0 == "ng" && !level._id_02B3 || var_0 == "xenon" && !level._id_0532 || var_0 == "ps3" && !level._id_034C || var_0 == "pc" && !level._id_0300 || var_0 == "xb3" && !level._id_0531 || var_0 == "ps4" && !level._id_034D || var_0 == "pccg" && !level._id_0301 || var_0 == "!cg" && level._id_00E4 || var_0 == "!ng" && level._id_02B3 || var_0 == "!xenon" && level._id_0532 || var_0 == "!ps3" && level._id_034C || var_0 == "!pc" && level._id_0300 || var_0 == "!xb3" && level._id_0531 || var_0 == "!ps4" && level._id_034D || var_0 == "!pccg" && level._id_0301 )
            return 0;
    }

    return 1;
}

_id_649C( var_0, var_1, var_2, var_3 )
{

}

_id_3538( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17 )
{
    if ( 1 )
    {
        var_18 = _id_A4F0::_id_23FE( var_1 );
        var_18._id_9C3A["origin"] = var_2;
        var_18._id_9C3A["angles"] = ( 0, 0, 0 );

        if ( isdefined( var_4 ) )
            var_18._id_9C3A["angles"] = vectortoangles( var_4 - var_2 );

        var_18._id_9C3A["delay"] = var_3;
        var_18._id_9C3A["exploder"] = var_0;

        if ( isdefined( level._id_241A ) )
        {
            var_19 = level._id_241A[var_18._id_9C3A["exploder"]];

            if ( !isdefined( var_19 ) )
                var_19 = [];

            var_19[var_19.size] = var_18;
            level._id_241A[var_18._id_9C3A["exploder"]] = var_19;
        }

        return;
    }

    var_20 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_20._id_02E6 = var_2;
    var_20._id_0041 = vectortoangles( var_4 - var_2 );
    var_20._id_79BA = var_0;
    var_20._id_79EC = var_1;
    var_20._id_0395 = var_3;
    var_20._id_79C6 = var_5;
    var_20._id_79C7 = var_6;
    var_20._id_79C8 = var_7;
    var_20._id_7AC4 = var_8;
    var_20._id_79B0 = var_9;
    var_20._id_797C = var_10;
    var_20._id_7AAC = var_15;
    var_20._id_7AC5 = var_11;
    var_20._id_79C9 = var_16;
    var_20._id_7AB0 = var_12;
    var_20._id_7989 = var_13;
    var_20._id_7988 = var_14;
    var_20._id_79BC = var_17;
    var_21 = anglestoforward( var_20._id_0041 );
    var_21 *= 150;
    var_20._id_91D1 = var_2 + var_21;

    if ( !isdefined( level._id_062E ) )
        level._id_062E = [];

    level._id_062E[level._id_062E.size] = var_20;
}

_id_5879( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _id_A4F0::_id_2428( var_0 );
    var_7._id_9C3A["origin"] = var_1;
    var_7._id_9C3A["angles"] = ( 0, 0, 0 );

    if ( isdefined( var_3 ) )
        var_7._id_9C3A["angles"] = vectortoangles( var_3 - var_1 );

    var_7._id_9C3A["delay"] = var_2;
}

_id_23C9()
{
    self._id_5878 = playloopedfx( level._id_058F[self._id_9C3A["fxid"]], self._id_9C3A["delay"], self._id_9C3A["origin"], 0, self._id_9C3A["forward"], self._id_9C3A["up"] );
    _id_23CA();
}

_id_23CA()
{
    if ( !_id_688C() )
        return;

    self notify( "stop_loop" );

    if ( !isdefined( self._id_9C3A["soundalias"] ) )
        return;

    if ( self._id_9C3A["soundalias"] == "nil" )
        return;

    var_0 = 0;
    var_1 = undefined;

    if ( isdefined( self._id_9C3A["stopable"] ) && self._id_9C3A["stopable"] )
    {
        if ( isdefined( self._id_5878 ) )
            var_1 = "death";
        else
            var_1 = "stop_loop";
    }
    else if ( level._id_05B2._id_7D98 && isdefined( self._id_9C3A["server_culled"] ) )
        var_0 = self._id_9C3A["server_culled"];

    var_2 = self;

    if ( isdefined( self._id_5878 ) )
        var_2 = self._id_5878;

    var_3 = undefined;

    if ( level._id_2409 )
        var_3 = self;

    var_2 _id_A4F0::_id_5871( self._id_9C3A["soundalias"], self._id_9C3A["origin"], self._id_9C3A["angles"], var_0, var_1, var_3 );
}

_id_23C3()
{
    if ( !_id_688C() )
        return;

    self notify( "stop_loop" );

    if ( !isdefined( self._id_9C3A["soundalias"] ) )
        return;

    if ( self._id_9C3A["soundalias"] == "nil" )
        return;

    var_0 = undefined;
    var_1 = self;

    if ( isdefined( self._id_9C3A["stopable"] ) && self._id_9C3A["stopable"] || level._id_2409 )
    {
        if ( isdefined( self._id_5878 ) )
        {
            var_1 = self._id_5878;
            var_0 = "death";
        }
        else
            var_0 = "stop_loop";
    }

    var_1 thread _id_A4F0::_id_5870( self._id_9C3A["soundalias"], self._id_9C3A["origin"], self._id_9C3A["angles"], var_0, undefined, self._id_9C3A["delay_min"], self._id_9C3A["delay_max"] );
}

_id_23AF()
{
    if ( !_id_688C() )
        return;

    if ( !isdefined( self._id_9C3A["ambiencename"] ) )
        return;

    if ( self._id_9C3A["ambiencename"] == "nil" )
        return;

    if ( _id_A4F0::_id_51AB() )
        return;

    if ( getdvar( "createfx" ) == "on" )
        _id_A4F0::_id_3848( "createfx_started" );

    if ( isdefined( self._id_25CB ) )
        level._id_031D _meth_847E( self._id_25CB._id_9A21 );

    self._id_25CB = spawnstruct();
    self._id_25CB _id_A4F0::_id_0D6F();
    level._id_031D _meth_847D( self._id_9C3A["ambiencename"], self._id_9C3A["origin"], self._id_9C3A["dynamic_distance"], self._id_25CB._id_9A21 );
    return;
}

_id_5880()
{
    waittillframeend;

    if ( isdefined( self._id_3BB7 ) )
        level waittill( "start fx" + self._id_3BB7 );

    for (;;)
    {
        _id_23C9();

        if ( isdefined( self._id_9364 ) )
            thread _id_587F( self._id_9364 );

        if ( isdefined( self._id_3BB8 ) )
            level waittill( "stop fx" + self._id_3BB8 );
        else
            return;

        if ( isdefined( self._id_5878 ) )
            self._id_5878 delete();

        if ( isdefined( self._id_3BB7 ) )
        {
            level waittill( "start fx" + self._id_3BB7 );
            continue;
        }

        return;
    }
}

_id_587C( var_0 )
{
    self endon( "death" );
    var_0 waittill( "effect id changed", var_1 );
}

_id_587D( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_0 waittill( "effect org changed", var_1 );
        self._id_02E6 = var_1;
    }
}

_id_587B( var_0 )
{
    self endon( "death" );
    var_0 waittill( "effect delay changed", var_1 );
}

_id_587E( var_0 )
{
    self endon( "death" );
    var_0 waittill( "effect deleted" );
    self delete();
}

_id_587F( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self._id_5878 delete();
}

_id_588D( var_0, var_1, var_2 )
{
    level thread _id_588F( var_0, var_1, var_2 );
}

_id_588F( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_1 );
    var_3._id_02E6 = var_1;
    var_3 _meth_8075( var_0 );
}

_id_4467( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    thread _id_4468( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_4468( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    level endon( "stop all gunfireloopfx" );
    waittillframeend;

    if ( var_7 < var_6 )
    {
        var_8 = var_7;
        var_7 = var_6;
        var_6 = var_8;
    }

    var_9 = var_6;
    var_10 = var_7 - var_6;

    if ( var_5 < var_4 )
    {
        var_8 = var_5;
        var_5 = var_4;
        var_4 = var_8;
    }

    var_11 = var_4;
    var_12 = var_5 - var_4;

    if ( var_3 < var_2 )
    {
        var_8 = var_3;
        var_3 = var_2;
        var_2 = var_8;
    }

    var_13 = var_2;
    var_14 = var_3 - var_2;
    var_15 = spawnfx( level._id_058F[var_0], var_1 );

    if ( !level._id_2409 )
        var_15 _meth_80E1();

    for (;;)
    {
        var_16 = var_13 + randomint( var_14 );

        for ( var_17 = 0; var_17 < var_16; var_17++ )
        {
            triggerfx( var_15 );
            wait(var_11 + randomfloat( var_12 ));
        }

        wait(var_9 + randomfloat( var_10 ));
    }
}

_id_4469( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    thread _id_446A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

_id_446A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    level endon( "stop all gunfireloopfx" );
    waittillframeend;

    if ( var_8 < var_7 )
    {
        var_9 = var_8;
        var_8 = var_7;
        var_7 = var_9;
    }

    var_10 = var_7;
    var_11 = var_8 - var_7;

    if ( var_6 < var_5 )
    {
        var_9 = var_6;
        var_6 = var_5;
        var_5 = var_9;
    }

    var_12 = var_5;
    var_13 = var_6 - var_5;

    if ( var_4 < var_3 )
    {
        var_9 = var_4;
        var_4 = var_3;
        var_3 = var_9;
    }

    var_14 = var_3;
    var_15 = var_4 - var_3;
    var_2 = vectornormalize( var_2 - var_1 );
    var_16 = spawnfx( level._id_058F[var_0], var_1, var_2 );

    if ( !level._id_2409 )
        var_16 _meth_80E1();

    for (;;)
    {
        var_17 = var_14 + randomint( var_15 );

        for ( var_18 = 0; var_18 < int( var_17 / level._id_3BA4 ); var_18++ )
        {
            triggerfx( var_16 );
            var_19 = ( var_12 + randomfloat( var_13 ) ) * level._id_3BA4;

            if ( var_19 < 0.05 )
                var_19 = 0.05;

            wait(var_19);
        }

        wait(var_12 + randomfloat( var_13 ));
        wait(var_10 + randomfloat( var_11 ));
    }
}

_id_7F68( var_0 )
{
    level._id_3BA4 = 1 / var_0;
}

_id_8118()
{
    if ( !isdefined( self._id_79EC ) || !isdefined( self._id_79EB ) || !isdefined( self._id_0395 ) )
        return;

    if ( isdefined( self._id_02A0 ) )
    {
        if ( self._id_02A0 == "toilet" )
        {
            thread _id_1929();
            return;
        }
    }

    var_0 = undefined;

    if ( isdefined( self._id_04A5 ) )
    {
        var_1 = getent( self._id_04A5, "targetname" );

        if ( isdefined( var_1 ) )
            var_0 = var_1._id_02E6;
    }

    var_2 = undefined;

    if ( isdefined( self._id_79ED ) )
        var_2 = self._id_79ED;

    var_3 = undefined;

    if ( isdefined( self._id_79EE ) )
        var_3 = self._id_79EE;

    if ( self._id_79EB == "OneShotfx" )
        _id_649C( self._id_79EC, self._id_02E6, self._id_0395, var_0 );

    if ( self._id_79EB == "loopfx" )
        _id_5879( self._id_79EC, self._id_02E6, self._id_0395, var_0, var_2, var_3 );

    if ( self._id_79EB == "loopsound" )
        _id_588D( self._id_79EC, self._id_02E6, self._id_0395 );

    self delete();
}

_id_1929()
{
    var_0 = ( 0, 0, self._id_0041[1] );
    var_1 = level._id_058F[self._id_79EC];
    var_2 = self._id_02E6;
    wait 1;
    level thread _id_192A( var_0, var_2, var_1 );
    self delete();
}

_id_192A( var_0, var_1, var_2 )
{
    for (;;)
    {
        playfx( var_2, var_1 );
        wait(30 + randomfloat( 40 ));
    }
}

_id_23DD()
{
    if ( !_id_9D7E( self._id_9C3A["fxid"] ) )
        return;

    self._id_5878 = spawnfx( level._id_058F[self._id_9C3A["fxid"]], self._id_9C3A["origin"], self._id_9C3A["forward"], self._id_9C3A["up"] );
    triggerfx( self._id_5878, self._id_9C3A["delay"] );

    if ( !level._id_2409 )
        self._id_5878 _meth_80E1();

    _id_23CA();
}

_id_9D7E( var_0 )
{
    if ( isdefined( level._id_058F[var_0] ) )
        return 1;

    if ( !isdefined( level._id_05F3 ) )
        level._id_05F3 = [];

    level._id_05F3[self._id_9C3A["fxid"]] = var_0;
    _id_9D7F( var_0 );
    return 0;
}

_id_9D7F( var_0 )
{
    level notify( "verify_effects_assignment_print" );
    level endon( "verify_effects_assignment_print" );
    wait 0.05;
    var_1 = getarraykeys( level._id_05F3 );

    foreach ( var_3 in var_1 )
    {

    }
}

_id_649D()
{
    wait 0.05;

    if ( !_id_688C() )
        return;

    if ( self._id_9C3A["delay"] > 0 )
        wait(self._id_9C3A["delay"]);

    [[ level._id_3AE2["create_triggerfx"] ]]();
}

_id_078A()
{
    if ( !_id_688C() )
        return;

    if ( !_id_A4F0::_id_51AB() && getdvar( "createfx" ) == "" )
        return;

    if ( !isdefined( level._id_05B2._id_718D ) )
    {
        level._id_05B2._id_718D = 1;
        level thread _id_718B();
    }

    if ( !isdefined( level._id_05B2._id_718A ) )
        level._id_05B2._id_718A = [];

    level._id_05B2._id_718A[level._id_05B2._id_718A.size] = self;
    self._id_60BD = 3000;
}

_id_718B()
{
    if ( !_id_A4F0::_id_51AB() )
    {
        if ( getdvar( "createfx" ) == "on" )
            _id_A4F0::_id_3848( "createfx_started" );
    }

    level._id_05B2._id_718C = [];
    var_0 = 256;

    for (;;)
    {
        level waittill( "code_damageradius", var_1, var_0, var_2, var_3 );
        var_4 = _id_888C( var_2, var_0 );

        foreach ( var_7, var_6 in var_4 )
            var_6 thread _id_6995( var_7 );
    }
}

_id_9C69( var_0 )
{
    return ( var_0[0], var_0[1], 0 );
}

_id_888C( var_0, var_1 )
{
    var_2 = [];
    var_3 = gettime();

    foreach ( var_5 in level._id_05B2._id_718A )
    {
        if ( var_5._id_60BD > var_3 )
            continue;

        var_6 = var_5._id_9C3A["reactive_radius"] + var_1;
        var_6 *= var_6;

        if ( distancesquared( var_0, var_5._id_9C3A["origin"] ) < var_6 )
            var_2[var_2.size] = var_5;
    }

    foreach ( var_5 in var_2 )
    {
        var_9 = _id_9C69( var_5._id_9C3A["origin"] - level._id_031D._id_02E6 );
        var_10 = _id_9C69( var_0 - level._id_031D._id_02E6 );
        var_11 = vectornormalize( var_9 );
        var_12 = vectornormalize( var_10 );
        var_5._id_2D7F = vectordot( var_11, var_12 );
    }

    for ( var_14 = 0; var_14 < var_2.size - 1; var_14++ )
    {
        for ( var_15 = var_14 + 1; var_15 < var_2.size; var_15++ )
        {
            if ( var_2[var_14]._id_2D7F > var_2[var_15]._id_2D7F )
            {
                var_16 = var_2[var_14];
                var_2[var_14] = var_2[var_15];
                var_2[var_15] = var_16;
            }
        }
    }

    foreach ( var_5 in var_2 )
    {
        var_5._id_02E6 = undefined;
        var_5._id_2D7F = undefined;
    }

    for ( var_14 = 4; var_14 < var_2.size; var_14++ )
        var_2[var_14] = undefined;

    return var_2;
}

_id_6995( var_0 )
{
    var_1 = _id_3E4B();

    if ( !isdefined( var_1 ) )
        return;

    self._id_60BD = gettime() + 3000;
    var_1._id_02E6 = self._id_9C3A["origin"];
    var_1._id_5069 = 1;
    wait(var_0 * randomfloatrange( 0.05, 0.1 ));

    if ( _id_A4F0::_id_51AB() )
    {
        var_1 _meth_809A( self._id_9C3A["soundalias"], "sounddone" );
        var_1 waittill( "sounddone" );
    }
    else
    {
        var_1 _meth_809A( self._id_9C3A["soundalias"] );
        wait 2;
    }

    wait 0.1;
    var_1._id_5069 = 0;
}

_id_3E4B()
{
    foreach ( var_1 in level._id_05B2._id_718C )
    {
        if ( !var_1._id_5069 )
            return var_1;
    }

    if ( level._id_05B2._id_718C.size < 4 )
    {
        var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_1._id_5069 = 0;
        level._id_05B2._id_718C[level._id_05B2._id_718C.size] = var_1;
        return var_1;
    }

    return undefined;
}
