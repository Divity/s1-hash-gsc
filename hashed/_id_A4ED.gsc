// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3F8C( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
        return level._id_241A[var_0];

    var_1 = [];

    foreach ( var_3 in level._id_2417 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3._id_9C3A["type"] != "exploder" )
            continue;

        if ( !isdefined( var_3._id_9C3A["exploder"] ) )
            continue;

        if ( var_3._id_9C3A["exploder"] == var_0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_8149( var_0 )
{
    var_1 = var_0._id_79BA;

    if ( !isdefined( level._id_353A[var_1] ) )
        level._id_353A[var_1] = [];

    var_2 = var_0._id_04A7;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    level._id_353A[var_1][level._id_353A[var_1].size] = var_0;

    if ( _id_3530( var_0 ) )
    {
        var_0 _meth_8054();
        return;
    }

    if ( _id_352F( var_0 ) )
    {
        var_0 _meth_8054();
        var_0 _meth_82BF();

        if ( isdefined( var_0._id_03DB ) && var_0._id_03DB & 1 )
        {
            if ( isdefined( var_0._id_799B ) )
                var_0 _meth_8058();
        }

        return;
    }

    if ( _id_352E( var_0 ) )
    {
        var_0 _meth_8054();
        var_0 _meth_82BF();

        if ( isdefined( var_0._id_03DB ) && var_0._id_03DB & 1 )
            var_0 _meth_8058();

        return;
    }
}

_id_830D()
{
    level._id_353A = [];
    var_0 = getentarray( "script_brushmodel", "classname" );
    var_1 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4._id_7AA0 ) )
            var_4._id_79BA = var_4._id_7AA0;

        if ( isdefined( var_4._id_59D3 ) )
            continue;

        if ( isdefined( var_4._id_79BA ) )
            _id_8149( var_4 );
    }

    var_6 = [];
    var_7 = getentarray( "script_brushmodel", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA0 ) )
            var_7[var_2]._id_79BA = var_7[var_2]._id_7AA0;

        if ( isdefined( var_7[var_2]._id_79BA ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA0 ) )
            var_7[var_2]._id_79BA = var_7[var_2]._id_7AA0;

        if ( isdefined( var_7[var_2]._id_79BA ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "script_origin", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA0 ) )
            var_7[var_2]._id_79BA = var_7[var_2]._id_7AA0;

        if ( isdefined( var_7[var_2]._id_79BA ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "item_health", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_7AA0 ) )
            var_7[var_2]._id_79BA = var_7[var_2]._id_7AA0;

        if ( isdefined( var_7[var_2]._id_79BA ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = level.struct;

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( !isdefined( var_7[var_2] ) )
            continue;

        if ( isdefined( var_7[var_2]._id_7AA0 ) )
            var_7[var_2]._id_79BA = var_7[var_2]._id_7AA0;

        if ( isdefined( var_7[var_2]._id_79BA ) )
        {
            if ( !isdefined( var_7[var_2]._id_0041 ) )
                var_7[var_2]._id_0041 = ( 0, 0, 0 );

            var_6[var_6.size] = var_7[var_2];
        }
    }

    if ( !isdefined( level._id_2417 ) )
        level._id_2417 = [];

    var_8 = [];
    var_8["exploderchunk visible"] = 1;
    var_8["exploderchunk"] = 1;
    var_8["exploder"] = 1;
    thread _id_80FD();

    for ( var_2 = 0; var_2 < var_6.size; var_2++ )
    {
        var_9 = var_6[var_2];
        var_4 = _id_A4F0::_id_23FE( var_9._id_79EC );
        var_4._id_9C3A = [];
        var_4._id_9C3A["origin"] = var_9._id_02E6;
        var_4._id_9C3A["angles"] = var_9._id_0041;
        var_4._id_9C3A["delay"] = var_9._id_0395;
        var_4._id_9C3A["delay_post"] = var_9._id_798A;
        var_4._id_9C3A["firefx"] = var_9._id_79C6;
        var_4._id_9C3A["firefxdelay"] = var_9._id_79C7;
        var_4._id_9C3A["firefxsound"] = var_9._id_79C8;
        var_4._id_9C3A["firefxtimeout"] = var_9._id_79C9;
        var_4._id_9C3A["earthquake"] = var_9._id_79B0;
        var_4._id_9C3A["rumble"] = var_9._id_7AB5;
        var_4._id_9C3A["damage"] = var_9._id_797C;
        var_4._id_9C3A["damage_radius"] = var_9._id_7AAC;
        var_4._id_9C3A["soundalias"] = var_9._id_7AC5;
        var_4._id_9C3A["repeat"] = var_9._id_7AB0;
        var_4._id_9C3A["delay_min"] = var_9._id_7989;
        var_4._id_9C3A["delay_max"] = var_9._id_7988;
        var_4._id_9C3A["target"] = var_9._id_04A5;
        var_4._id_9C3A["ender"] = var_9._id_79B3;
        var_4._id_9C3A["physics"] = var_9._id_7A9A;
        var_4._id_9C3A["type"] = "exploder";

        if ( !isdefined( var_9._id_79EC ) )
            var_4._id_9C3A["fxid"] = "No FX";
        else
            var_4._id_9C3A["fxid"] = var_9._id_79EC;

        var_4._id_9C3A["exploder"] = var_9._id_79BA;

        if ( isdefined( level._id_241A ) )
        {
            var_10 = level._id_241A[var_4._id_9C3A["exploder"]];

            if ( !isdefined( var_10 ) )
                var_10 = [];

            var_10[var_10.size] = var_4;
            level._id_241A[var_4._id_9C3A["exploder"]] = var_10;
        }

        if ( !isdefined( var_4._id_9C3A["delay"] ) )
            var_4._id_9C3A["delay"] = 0;

        if ( isdefined( var_9._id_04A5 ) )
        {
            var_11 = getentarray( var_4._id_9C3A["target"], "targetname" )[0];

            if ( isdefined( var_11 ) )
            {
                var_12 = var_11._id_02E6;
                var_4._id_9C3A["angles"] = vectortoangles( var_12 - var_4._id_9C3A["origin"] );
            }
            else
            {
                var_11 = _id_A4F0::_id_3E87( var_4._id_9C3A["target"] );

                if ( isdefined( var_11 ) )
                {
                    var_12 = var_11._id_02E6;
                    var_4._id_9C3A["angles"] = vectortoangles( var_12 - var_4._id_9C3A["origin"] );
                }
            }
        }

        if ( !isdefined( var_9._id_00AD ) )
        {
            var_4._id_02A0 = var_9;

            if ( isdefined( var_4._id_02A0._id_7A37 ) )
                precachemodel( var_4._id_02A0._id_7A37 );
        }
        else if ( var_9._id_00AD == "script_brushmodel" || isdefined( var_9._id_02A0 ) )
        {
            var_4._id_02A0 = var_9;
            var_4._id_02A0._id_2B33 = var_9._id_799B;
        }

        if ( isdefined( var_9._id_04A7 ) && isdefined( var_8[var_9._id_04A7] ) )
            var_4._id_9C3A["exploder_type"] = var_9._id_04A7;
        else
            var_4._id_9C3A["exploder_type"] = "normal";

        if ( isdefined( var_9._id_59D3 ) )
        {
            var_4._id_9C3A["masked_exploder"] = var_9._id_02A0;
            var_4._id_9C3A["masked_exploder_spawnflags"] = var_9._id_03DB;
            var_4._id_9C3A["masked_exploder_script_disconnectpaths"] = var_9._id_799B;
            var_9 delete();
        }

        var_4 common_scripts\_createfx::_id_6E6A();
    }
}

_id_80FD()
{
    waitframe;
    waitframe;
    waitframe;
    var_0 = [];

    foreach ( var_2 in level._id_2417 )
    {
        if ( var_2._id_9C3A["type"] != "exploder" )
            continue;

        var_3 = var_2._id_9C3A["flag"];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == "nil" )
            var_2._id_9C3A["flag"] = undefined;

        var_0[var_3] = 1;
    }

    foreach ( var_7, var_6 in var_0 )
        thread _id_352C( var_7 );
}

_id_352C( var_0 )
{
    if ( !_id_A4F0::_id_3837( var_0 ) )
        _id_A4F0::_id_383B( var_0 );

    _id_A4F0::_id_3848( var_0 );

    foreach ( var_2 in level._id_2417 )
    {
        if ( var_2._id_9C3A["type"] != "exploder" )
            continue;

        var_3 = var_2._id_9C3A["flag"];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 != var_0 )
            continue;

        var_2 _id_A4F0::_id_06FD();
    }
}

_id_352F( var_0 )
{
    return isdefined( var_0._id_04A7 ) && var_0._id_04A7 == "exploder";
}

_id_3530( var_0 )
{
    return var_0._id_02A0 == "fx" && ( !isdefined( var_0._id_04A7 ) || var_0._id_04A7 != "exploderchunk" );
}

_id_352E( var_0 )
{
    return isdefined( var_0._id_04A7 ) && var_0._id_04A7 == "exploderchunk";
}

_id_84C9( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( !_id_3530( var_3._id_02A0 ) && !_id_352F( var_3._id_02A0 ) && !_id_352E( var_3._id_02A0 ) )
                    var_3._id_02A0 _meth_8053();

                if ( isdefined( var_3._id_1820 ) )
                    var_3._id_02A0 _meth_8053();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_9C3A["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3._id_9C3A["exploder"] ) )
                continue;

            if ( var_3._id_9C3A["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3._id_02A0 ) )
            {
                if ( !_id_3530( var_3._id_02A0 ) && !_id_352F( var_3._id_02A0 ) && !_id_352E( var_3._id_02A0 ) )
                    var_3._id_02A0 _meth_8053();

                if ( isdefined( var_3._id_1820 ) )
                    var_3._id_02A0 _meth_8053();
            }
        }
    }
}

_id_8E79( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( !isdefined( var_3._id_5878 ) )
                    continue;

                var_3._id_5878 delete();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_9C3A["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3._id_9C3A["exploder"] ) )
                continue;

            if ( var_3._id_9C3A["exploder"] + "" != var_0 )
                continue;

            if ( !isdefined( var_3._id_5878 ) )
                continue;

            var_3._id_5878 delete();
        }
    }
}

_id_3D5E( var_0 )
{
    var_0 += "";
    var_1 = [];

    if ( isdefined( level._id_241A ) )
    {
        var_2 = level._id_241A[var_0];

        if ( isdefined( var_2 ) )
            var_1 = var_2;
    }
    else
    {
        foreach ( var_4 in level._id_2417 )
        {
            if ( var_4._id_9C3A["type"] != "exploder" )
                continue;

            if ( !isdefined( var_4._id_9C3A["exploder"] ) )
                continue;

            if ( var_4._id_9C3A["exploder"] + "" != var_0 )
                continue;

            var_1[var_1.size] = var_4;
        }
    }

    return var_1;
}

_id_484D( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3._id_02A0 ) )
                    var_3._id_02A0 _meth_8054();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_9C3A["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3._id_9C3A["exploder"] ) )
                continue;

            if ( var_3._id_9C3A["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3._id_02A0 ) )
                var_3._id_02A0 _meth_8054();
        }
    }
}

_id_280D( var_0 )
{
    var_0 += "";

    if ( isdefined( level._id_241A ) )
    {
        var_1 = level._id_241A[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3._id_02A0 ) )
                    var_3._id_02A0 delete();
            }
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level._id_2417.size; var_5++ )
        {
            var_3 = level._id_2417[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_9C3A["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3._id_9C3A["exploder"] ) )
                continue;

            if ( var_3._id_9C3A["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3._id_02A0 ) )
                var_3._id_02A0 delete();
        }
    }

    level notify( "killexplodertridgers" + var_0 );
}

_id_3529()
{
    if ( isdefined( self._id_9C3A["delay"] ) )
        var_0 = self._id_9C3A["delay"];
    else
        var_0 = 0;

    if ( isdefined( self._id_9C3A["damage_radius"] ) )
        var_1 = self._id_9C3A["damage_radius"];
    else
        var_1 = 128;

    var_2 = self._id_9C3A["damage"];
    var_3 = self._id_9C3A["origin"];
    wait(var_0);

    if ( isdefined( level._id_254E ) )
        [[ level._id_254E ]]( var_3, var_1, var_2 );
    else
        radiusdamage( var_3, var_1, var_2, var_2 );
}

_id_06FE()
{
    if ( isdefined( self._id_9C3A["firefx"] ) )
        thread _id_37AB();

    if ( isdefined( self._id_9C3A["fxid"] ) && self._id_9C3A["fxid"] != "No FX" )
        thread _id_1AD3();
    else if ( isdefined( self._id_9C3A["soundalias"] ) && self._id_9C3A["soundalias"] != "nil" )
        thread _id_8896();

    if ( isdefined( self._id_9C3A["loopsound"] ) && self._id_9C3A["loopsound"] != "nil" )
        thread _id_301B();

    if ( isdefined( self._id_9C3A["damage"] ) )
        thread _id_3529();

    if ( isdefined( self._id_9C3A["earthquake"] ) )
        thread _id_352B();

    if ( isdefined( self._id_9C3A["rumble"] ) )
        thread _id_3534();

    if ( self._id_9C3A["exploder_type"] == "exploder" )
        thread _id_181F();
    else if ( self._id_9C3A["exploder_type"] == "exploderchunk" || self._id_9C3A["exploder_type"] == "exploderchunk visible" )
        thread _id_1821();
    else
        thread _id_181E();
}

_id_181E()
{
    var_0 = self._id_9C3A["exploder"];

    if ( isdefined( self._id_9C3A["delay"] ) && self._id_9C3A["delay"] >= 0 )
        wait(self._id_9C3A["delay"]);
    else
        wait 0.05;

    if ( !isdefined( self._id_02A0 ) )
        return;

    if ( isdefined( self._id_02A0._id_00AB ) )
    {
        if ( _id_A4F0::_id_51AB() && self._id_02A0._id_03DB & 1 )
            self._id_02A0 call [[ level._id_214E ]]();
    }

    if ( level._id_2409 )
    {
        if ( isdefined( self._id_3525 ) )
            return;

        self._id_3525 = 1;
        self._id_02A0 _meth_8054();
        self._id_02A0 _meth_82BF();
        wait 3;
        self._id_3525 = undefined;
        self._id_02A0 _meth_8053();
        self._id_02A0 _meth_82BE();
        return;
    }

    if ( !isdefined( self._id_9C3A["fxid"] ) || self._id_9C3A["fxid"] == "No FX" )
        self._id_9C3A["exploder"] = undefined;

    waitframe;

    if ( isdefined( self._id_02A0 ) && isdefined( self._id_02A0._id_00AB ) )
        self._id_02A0 delete();
}

_id_1821()
{
    if ( isdefined( self._id_9C3A["delay"] ) )
        wait(self._id_9C3A["delay"]);

    var_0 = undefined;

    if ( isdefined( self._id_9C3A["target"] ) )
        var_0 = _id_A4F0::_id_3E87( self._id_9C3A["target"] );

    if ( !isdefined( var_0 ) )
    {
        self._id_02A0 delete();
        return;
    }

    self._id_02A0 _meth_8053();

    if ( isdefined( self._id_9C3A["delay_post"] ) )
        wait(self._id_9C3A["delay_post"]);

    var_1 = self._id_9C3A["origin"];
    var_2 = self._id_9C3A["angles"];
    var_3 = var_0._id_02E6;
    var_4 = var_3 - self._id_9C3A["origin"];
    var_5 = var_4[0];
    var_6 = var_4[1];
    var_7 = var_4[2];
    var_8 = isdefined( self._id_9C3A["physics"] );

    if ( var_8 )
    {
        var_9 = undefined;

        if ( isdefined( var_0._id_04A5 ) )
            var_9 = var_0 _id_A4F0::_id_3E87();

        if ( !isdefined( var_9 ) )
        {
            var_10 = var_1;
            var_11 = var_0._id_02E6;
        }
        else
        {
            var_10 = var_0._id_02E6;
            var_11 = ( var_9._id_02E6 - var_0._id_02E6 ) * self._id_9C3A["physics"];
        }

        self._id_02A0 _meth_82C2( var_10, var_11 );
        return;
    }
    else
    {
        self._id_02A0 _meth_82BD( ( var_5, var_6, var_7 ), 12 );
        self._id_02A0 _meth_82B2( ( var_5, var_6, var_7 ), 12 );
    }

    if ( level._id_2409 )
    {
        if ( isdefined( self._id_3525 ) )
            return;

        self._id_3525 = 1;
        wait 3;
        self._id_3525 = undefined;
        self._id_9C3A["origin"] = var_1;
        self._id_9C3A["angles"] = var_2;
        self._id_02A0 _meth_8054();
        return;
    }

    self._id_9C3A["exploder"] = undefined;
    wait 6;
    self._id_02A0 delete();
}

_id_181F()
{
    if ( isdefined( self._id_9C3A["delay"] ) )
        wait(self._id_9C3A["delay"]);

    if ( !isdefined( self._id_02A0._id_7A37 ) )
    {
        self._id_02A0 _meth_8053();
        self._id_02A0 _meth_82BE();
    }
    else
    {
        var_0 = self._id_02A0 _id_A4F0::_id_8953();

        if ( isdefined( self._id_02A0._id_0399 ) )
            var_0._id_0399 = self._id_02A0._id_0399;

        var_0 _meth_80B1( self._id_02A0._id_7A37 );
        var_0 _meth_8053();
    }

    self._id_1820 = 1;

    if ( _id_A4F0::_id_51AB() && !isdefined( self._id_02A0._id_7A37 ) && self._id_02A0._id_03DB & 1 )
    {
        if ( !isdefined( self._id_02A0._id_2B33 ) )
            self._id_02A0 call [[ level._id_214E ]]();
        else
            self._id_02A0 call [[ level._id_2B38 ]]();
    }

    if ( level._id_2409 )
    {
        if ( isdefined( self._id_3525 ) )
            return;

        self._id_3525 = 1;
        wait 3;
        self._id_3525 = undefined;

        if ( !isdefined( self._id_02A0._id_7A37 ) )
        {
            self._id_02A0 _meth_8054();
            self._id_02A0 _meth_82BF();
        }
    }
}

_id_3534()
{
    if ( !_id_A4F0::_id_51AB() )
        return;

    _id_352A();
    level._id_031D _meth_80AD( self._id_9C3A["rumble"] );
}

_id_352A()
{
    if ( !isdefined( self._id_9C3A["delay"] ) )
        self._id_9C3A["delay"] = 0;

    var_0 = self._id_9C3A["delay"];
    var_1 = self._id_9C3A["delay"] + 0.001;

    if ( isdefined( self._id_9C3A["delay_min"] ) )
        var_0 = self._id_9C3A["delay_min"];

    if ( isdefined( self._id_9C3A["delay_max"] ) )
        var_1 = self._id_9C3A["delay_max"];

    if ( var_0 > 0 )
        wait(randomfloatrange( var_0, var_1 ));
}

_id_301B()
{
    if ( isdefined( self._id_588E ) )
        self._id_588E delete();

    var_0 = self._id_9C3A["origin"];
    var_1 = self._id_9C3A["loopsound"];
    _id_352A();
    self._id_588E = _id_A4F0::_id_6977( var_1, var_0 );
}

_id_8896()
{
    _id_301C();
}

_id_301C()
{
    var_0 = self._id_9C3A["origin"];
    var_1 = self._id_9C3A["soundalias"];
    _id_352A();
    _id_A4F0::_id_69BF( var_1, var_0 );
}

_id_352B()
{
    _id_352A();
    _id_A4F0::_id_2BBC( self._id_9C3A["earthquake"], self._id_9C3A["origin"] );
}

_id_3533()
{
    if ( !isdefined( self._id_9C3A["soundalias"] ) || self._id_9C3A["soundalias"] == "nil" )
        return;

    _id_A4F0::_id_69BF( self._id_9C3A["soundalias"], self._id_9C3A["origin"] );
}

_id_37AB()
{
    var_0 = self._id_9C3A["forward"];
    var_1 = self._id_9C3A["up"];
    var_2 = undefined;
    var_3 = self._id_9C3A["firefxsound"];
    var_4 = self._id_9C3A["origin"];
    var_5 = self._id_9C3A["firefx"];
    var_6 = self._id_9C3A["ender"];

    if ( !isdefined( var_6 ) )
        var_6 = "createfx_effectStopper";

    var_7 = 0.5;

    if ( isdefined( self._id_9C3A["firefxdelay"] ) )
        var_7 = self._id_9C3A["firefxdelay"];

    _id_352A();

    if ( isdefined( var_3 ) )
        _id_A4F0::_id_5871( var_3, var_4, ( 0, 0, 0 ), 1, var_6 );

    playfx( level._id_058F[var_5], self._id_9C3A["origin"], var_0, var_1 );
}

_id_1AD3()
{
    if ( isdefined( self._id_9C3A["repeat"] ) )
    {
        thread _id_3533();

        for ( var_0 = 0; var_0 < self._id_9C3A["repeat"]; var_0++ )
        {
            playfx( level._id_058F[self._id_9C3A["fxid"]], self._id_9C3A["origin"], self._id_9C3A["forward"], self._id_9C3A["up"] );
            _id_352A();
        }

        return;
    }

    if ( !isdefined( self._id_9C3A["delay"] ) )
        self._id_9C3A["delay"] = 0;

    if ( self._id_9C3A["delay"] >= 0 )
    {
        _id_352A();
        var_1 = 0;
    }
    else
        var_1 = self._id_9C3A["delay"];

    if ( isdefined( self._id_5878 ) )
        self._id_5878 delete();

    self._id_5878 = spawnfx( _id_A4F0::_id_3FA6( self._id_9C3A["fxid"] ), self._id_9C3A["origin"], self._id_9C3A["forward"], self._id_9C3A["up"] );

    if ( level._id_2409 )
        setwinningteam( self._id_5878, 1 );

    if ( self._id_9C3A["delay"] >= 0 )
        triggerfx( self._id_5878 );
    else
        triggerfx( self._id_5878, var_1 );

    _id_3533();
}

_id_06F9( var_0, var_1, var_2 )
{
    var_0 += "";
    level notify( "exploding_" + var_0 );
    var_3 = 0;

    if ( isdefined( level._id_241A ) && !level._id_2409 )
    {
        var_4 = level._id_241A[var_0];

        if ( isdefined( var_4 ) )
        {
            foreach ( var_6 in var_4 )
            {
                if ( !var_6 _id_1CB9() )
                    continue;

                var_6 _id_A4F0::_id_06FD();
                var_3 = 1;
            }
        }
    }
    else
    {
        for ( var_8 = 0; var_8 < level._id_2417.size; var_8++ )
        {
            var_6 = level._id_2417[var_8];

            if ( !isdefined( var_6 ) )
                continue;

            if ( var_6._id_9C3A["type"] != "exploder" )
                continue;

            if ( !isdefined( var_6._id_9C3A["exploder"] ) )
                continue;

            if ( var_6._id_9C3A["exploder"] + "" != var_0 )
                continue;

            if ( !var_6 _id_1CB9() )
                continue;

            var_6 _id_A4F0::_id_06FD();
            var_3 = 1;
        }
    }

    if ( !_id_84A2() && !var_3 )
        _id_06F5( var_0, var_1, var_2 );
}

_id_3526( var_0, var_1, var_2 )
{
    [[ level._id_05B2._id_3537 ]]( var_0, var_1, var_2 );
}

_id_5306( var_0 )
{
    var_1 = _id_3F8C( var_0 );

    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3._id_5878 ) )
                setwinningteam( var_3._id_5878, 1 );
        }

        waittillframeend;

        foreach ( var_3 in var_1 )
            var_3 _id_A4F0::_id_671C();
    }
}

_id_1CB9()
{
    var_0 = self;

    if ( isdefined( var_0._id_9C3A["platform"] ) && isdefined( level._id_00E4 ) )
    {
        var_1 = var_0._id_9C3A["platform"];

        if ( var_1 == "cg" && !level._id_00E4 || var_1 == "ng" && !level._id_02B3 )
            return 0;
    }

    return 1;
}

_id_06F5( var_0, var_1, var_2 )
{
    if ( !_id_5097( var_0 ) )
        return;

    var_3 = int( var_0 );
    _func_222( var_3, var_1, var_2 );
}

_id_262A( var_0, var_1, var_2 )
{
    if ( !_id_5097( var_0 ) )
        return;

    var_3 = int( var_0 );
    _func_292( var_3, var_1, var_2 );
}

_id_5097( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = var_0;

    if ( isstring( var_0 ) )
    {
        var_1 = int( var_0 );

        if ( var_1 == 0 && var_0 != "0" )
            return 0;
    }

    return var_1 >= 0;
}

_id_84A2()
{
    if ( _id_A4F0::_id_51AB() )
        return 1;

    if ( !isdefined( level._id_2409 ) )
        level._id_2409 = getdvar( "createfx" ) != "";

    if ( level._id_2409 )
        return 1;
    else
        return getdvar( "clientSideEffects" ) != "1";
}

_id_3528( var_0, var_1, var_2 )
{
    waitframe;
    waitframe;
    _id_06F9( var_0, var_1, var_2 );
}

_id_3527( var_0, var_1, var_2 )
{
    _id_06F9( var_0, var_1, var_2 );
}
