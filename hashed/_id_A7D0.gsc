// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_058F["uav_explode"] = loadfx( "vfx/explosion/vehicle_uav_explosion" );
    level._id_058F["uav_exit"] = loadfx( "vfx/trail/smoketrail_uav" );
    level._id_058F["uav_trail"] = loadfx( "vfx/trail/smoketrail_uav" );
    level._id_5398["uav"] = ::_id_98CC;
    level._id_5398["uav_support"] = ::_id_98CC;
    level._id_5398["counter_uav"] = ::_id_98CC;
    var_0 = getentarray( "minimap_corner", "targetname" );

    if ( var_0.size )
        var_1 = _id_A7AF::_id_3777( var_0[0]._id_02E6, var_0[1]._id_02E6 );
    else
        var_1 = ( 0, 0, 0 );

    level._id_99E3 = spawn( "script_model", var_1 );
    level._id_99E3 _meth_80B1( "c130_zoomrig" );
    level._id_99E3._id_0041 = ( 0, 115, 0 );
    level._id_99E3 _meth_8054();
    level._id_99E3._id_04A7 = "uavrig_script_model";
    level._id_99E3 thread _id_7606();

    if ( level._id_91E4 )
    {
        level._id_0351["allies"] = "normal_radar";
        level._id_0351["axis"] = "normal_radar";
        level._id_0725["allies"] = 0;
        level._id_0725["axis"] = 0;
        level._id_071D["allies"] = 0;
        level._id_071D["axis"] = 0;
        level._id_99E1["allies"] = [];
        level._id_99E1["axis"] = [];
    }
    else
    {
        level._id_0351 = [];
        level._id_0725 = [];
        level._id_071D = [];
        level._id_99E1 = [];
    }

    level thread _id_64C5();
    level thread _id_99E4();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !level._id_91E4 )
        {
            level._id_0725[var_0._id_444D] = 0;
            level._id_0725[var_0._id_444D + "_radarStrength"] = 0;
            level._id_071D[var_0._id_444D] = 0;
            level._id_0351[var_0._id_444D] = "normal_radar";
        }

        var_0 thread _id_64D3();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        level notify( "uav_update" );
    }
}

_id_7606()
{
    for (;;)
    {
        self _meth_82B7( -360, 60 );
        wait 60;
    }
}

_id_6DE3()
{
    self endon( "death" );
    level endon( "game_ended" );
    playfxontag( level._id_058F["uav_trail"], self, "tag_origin" );
}

_id_5630( var_0, var_1, var_2, var_3 )
{
    var_4 = spawn( "script_model", level._id_99E3 _meth_8180( "tag_origin" ) );
    var_4._id_5D57 = var_3;
    var_4._id_9C4B = 1;

    if ( _id_A4F0::_id_0CE4( var_4._id_5D57, "uav_advanced_updates" ) )
        var_4._id_9C4B = 2;

    if ( _id_A4F0::_id_0CE4( var_4._id_5D57, "uav_enemy_direction" ) )
        var_4._id_9C4B = 3;

    if ( _id_A4F0::_id_0CE4( var_4._id_5D57, "uav_scrambler" ) )
        var_5 = 1;
    else
        var_5 = 0;

    var_4 _meth_80B1( "uav_drone_static" );
    var_4 thread _id_6DE3();
    var_4 thread _id_A783::_id_7F5F( 1000, undefined, ::_id_99E2, undefined, 1 );
    var_4._id_04A8 = var_1;
    var_4._id_02E9 = var_0;
    var_4._id_9378 = 0;
    var_4._id_654A = _id_A4F0::_id_0CE4( var_4._id_5D57, "uav_orbit" );
    var_4._id_665D = _id_A4F0::_id_0CE4( var_4._id_5D57, "uav_paint_outline" );
    var_4._id_0D7A = _id_A4F0::_id_0CE4( var_4._id_5D57, "uav_assist_points" );
    var_4 _id_A4F0::_id_5920( var_1 );
    var_4 thread _id_4661();
    var_4._id_8F1F = var_0._id_8F1F;
    var_4 _id_0858();
    thread _id_391C( var_4 );
    var_4 thread _id_9B8A();
    var_4 thread _id_A7C3::_id_9AE8();
    var_4 _id_07C5();

    if ( var_5 )
        var_4 _id_07C4();

    if ( isdefined( level._id_0725[var_1] ) )
    {
        foreach ( var_7 in level._id_99E1[var_1] )
        {
            if ( var_7 == var_4 )
                continue;

            if ( var_5 )
            {
                var_7._id_9378 += 5;
                continue;
            }

            if ( !var_5 )
                var_7._id_9378 += 5;
        }
    }

    waittillframeend;
    level notify( "uav_update" );
    var_9 = 30;

    if ( _id_A4F0::_id_0CE4( var_4._id_5D57, "uav_increased_time" ) )
        var_9 += 15;

    var_4 _id_A098( "death", var_9 );

    if ( var_4._id_0102 < var_4._id_0275 )
    {
        var_4 _meth_804F();
        var_10 = var_4._id_02E6 + anglestoforward( var_4._id_0041 ) * 20000;
        var_4 _meth_82AE( var_10, 60 );
        playfxontag( _id_A4F0::_id_3FA6( "uav_exit" ), var_4, "tag_origin" );
        var_4 _id_A098( "death", 3 );

        if ( var_4._id_0102 < var_4._id_0275 )
        {
            var_4 notify( "leaving" );
            var_4._id_5143 = 1;
            var_4 _meth_82AE( var_10, 4, 4, 0.0 );
        }

        var_4 _id_A098( "death", 4 + var_4._id_9378 );
    }

    if ( var_5 )
        var_4 _id_738F();

    var_4 _id_7391();
    var_4 delete();
    var_4 _id_73E3();
    level notify( "uav_update" );
}

_id_391C( var_0 )
{
    var_0 _meth_8054();
    var_1 = randomintrange( 3000, 5000 );

    if ( isdefined( level._id_89FB ) )
        var_2 = level._id_89FB;
    else
        var_2 = level._id_8D37;

    var_3 = var_2[0];

    foreach ( var_5 in var_2 )
    {
        if ( var_5._id_02E6[2] < var_3._id_02E6[2] )
            var_3 = var_5;
    }

    var_7 = var_3._id_02E6[2];
    var_8 = level._id_99E3._id_02E6[2];

    if ( var_7 < 0 )
    {
        var_8 += var_7 * -1;
        var_7 = 0;
    }

    var_9 = var_8 - var_7;

    if ( var_9 + var_1 > 8100.0 )
        var_1 -= ( var_9 + var_1 - 8100.0 );

    var_10 = randomint( 360 );
    var_11 = randomint( 2000 ) + 5000;
    var_12 = cos( var_10 ) * var_11;
    var_13 = sin( var_10 ) * var_11;
    var_14 = vectornormalize( ( var_12, var_13, var_1 ) );
    var_14 *= randomintrange( 6000, 7000 );
    var_0 _meth_804D( level._id_99E3, "tag_origin", var_14, ( 0, var_10 - 90, 135 ) );
    waittillframeend;
    var_15 = var_0._id_02E6;
    var_0 _meth_804F();
    var_0._id_02E6 = var_15 + anglestoforward( var_0._id_0041 ) * -20000;
    var_0 _meth_82AE( var_15, 4, 0, 2 );
    wait 4;

    if ( isdefined( var_0 ) )
        var_0 _meth_804D( level._id_99E3, "tag_origin" );
}

_id_A098( var_0, var_1 )
{
    self endon( var_0 );
    _id_A79A::_id_A049( var_1 );
}

_id_9B8A()
{
    self endon( "death" );

    for (;;)
    {
        level _id_A4F0::_id_A07E( "joined_team", "uav_update" );
        self _meth_8054();

        foreach ( var_1 in level._id_0328 )
        {
            if ( level._id_91E4 )
            {
                if ( var_1._id_04A8 != self._id_04A8 && !self._id_654A )
                    self _meth_8007( var_1 );

                continue;
            }

            if ( isdefined( self._id_02E9 ) && var_1 == self._id_02E9 || self._id_654A )
                continue;

            self _meth_8007( var_1 );
        }
    }
}

_id_99E2( var_0, var_1, var_2, var_3 )
{
    self _meth_8054();
    self notify( "death" );
    var_4 = anglestoright( self._id_0041 ) * 200;
    playfx( _id_A4F0::_id_3FA6( "uav_explode" ), self._id_02E6, var_4 );
    playsoundatpos( self._id_02E6, "uav_air_death" );
    _id_A783::_id_64B3( var_0, var_1, var_2, var_3, "uav_destroyed", undefined, "callout_destroyed_uav", 1 );
}

_id_98CC( var_0, var_1 )
{
    if ( isdefined( self._id_030D["killstreaks"][self._id_539A]._id_8F20 ) )
        var_2 = self._id_030D["killstreaks"][self._id_539A]._id_8F20;
    else
        var_2 = "uav_support";

    if ( isdefined( level._id_511A ) && level._id_511A && self._id_539A == 1 )
        self notify( "used_horde_uav" );

    return _id_9C13( var_2, var_1 );
}

_id_9C13( var_0, var_1 )
{
    _id_A744::_id_5838( var_0, self._id_02E6 );
    var_2 = self._id_030D["team"];
    level thread _id_5630( self, var_2, var_0, var_1 );
    return 1;
}

_id_99E4()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "uav_update" );

        if ( level._id_91E4 )
        {
            _id_9B7F( "allies" );
            _id_9B7F( "axis" );
            continue;
        }

        _id_9B44();
    }
}

_id_05B9( var_0, var_1, var_2 )
{
    var_3 = 0;
    var_4 = 0;

    foreach ( var_6 in level._id_99E1[var_0] )
        var_3 += var_6._id_9C4B;

    foreach ( var_6 in level._id_99E1[level._id_65B0[var_0]] )
    {
        if ( var_6._id_99E5 != "counter" )
            continue;

        var_4 += var_6._id_9C4B;
    }

    if ( var_4 > 0 )
        var_10 = -3;
    else
        var_10 = var_3;

    var_11 = _func_179();
    var_12 = getuavstrengthmax();

    if ( var_10 <= var_11 )
        var_10 = var_11;
    else if ( var_10 >= var_12 )
        var_10 = var_12;

    return var_10;
}

_id_05BC( var_0 )
{
    var_1 = 0;
    var_2 = 0;

    foreach ( var_4 in level._id_99E1[var_0] )
    {
        if ( var_4._id_665D )
            var_1 += var_4._id_9C4B;
    }

    if ( var_1 > 0 )
        var_2 = 1;
    else
        var_2 = 0;

    return var_2;
}

_id_05B7( var_0 )
{
    var_1 = 0;
    var_2 = 0;

    foreach ( var_4 in level._id_99E1 )
    {
        if ( isdefined( var_4._id_02E9 ) && var_4._id_02E9 == var_0 && var_4._id_665D )
            var_1 += var_4._id_9C4B;
    }

    if ( var_1 > 0 )
        var_2 = 1;
    else
        var_2 = 0;

    return var_2;
}

_id_9B7F( var_0 )
{
    var_1 = _id_05B9( var_0 );
    var_2 = _id_05BC( var_0 );
    _id_9B79( var_0, var_2 );
    _func_177( var_0, var_1 );

    if ( var_1 >= getuavstrengthlevelneutral() )
    {
        _id_9B7B( var_0, 0 );
        unblockteamradar( var_0 );
    }
    else
    {
        _id_9B7B( var_0, 1 );
        blockteamradar( var_0 );
    }

    if ( var_1 <= getuavstrengthlevelneutral() )
    {
        _id_8026( var_0, 0 );
        _id_9B80( var_0 );
        return;
    }

    if ( var_1 >= getuavstrengthlevelshowenemyfastsweep() )
        level._id_0351[var_0] = "fast_radar";
    else
        level._id_0351[var_0] = "normal_radar";

    _id_9B80( var_0 );
    _id_8026( var_0, 1 );
}

_id_9B44()
{
    var_0 = _func_179();
    var_1 = getuavstrengthmax();
    var_2 = getuavstrengthlevelshowenemydirectional();

    foreach ( var_4 in level._id_0328 )
    {
        var_5 = level._id_0725[var_4._id_444D + "_radarStrength"];
        var_6 = _id_05B7( var_4 );
        _id_9B3E( var_4, var_6 );

        foreach ( var_8 in level._id_0328 )
        {
            if ( var_8 == var_4 )
                continue;

            var_9 = level._id_071D[var_8._id_444D];

            if ( var_9 > 0 )
            {
                var_5 = -3;
                break;
            }
        }

        if ( var_5 <= var_0 )
            var_5 = var_0;
        else if ( var_5 >= var_1 )
            var_5 = var_1;

        var_4._id_0353 = var_5;

        if ( var_5 >= getuavstrengthlevelneutral() )
        {
            _id_9B43( var_4, 0 );
            var_4._id_0213 = 0;
        }
        else
        {
            _id_9B43( var_4, 1 );
            var_4._id_0213 = 1;
        }

        if ( var_5 <= getuavstrengthlevelneutral() )
        {
            var_4._id_01E0 = 0;
            var_4._id_0352 = 0;
            continue;
        }

        if ( var_5 >= getuavstrengthlevelshowenemyfastsweep() )
            var_4._id_0351 = "fast_radar";
        else
            var_4._id_0351 = "normal_radar";

        var_4._id_0352 = var_5 >= var_2;
        var_4._id_01E0 = 1;
    }
}

_id_9B80( var_0, var_1 )
{
    var_2 = _id_05B9( var_0 ) >= getuavstrengthlevelshowenemydirectional();

    foreach ( var_4 in level._id_0328 )
    {
        if ( var_4._id_04A8 == "spectator" )
            continue;

        var_5 = _id_A78A::_id_3F7F( var_4._id_04A8 );
        var_4._id_0351 = level._id_0351[var_4._id_04A8];
        var_4._id_0149 = level._id_0351[var_5];

        if ( var_4._id_04A8 == var_0 )
            var_4._id_0352 = var_2;
    }
}

_id_9B79( var_0, var_1 )
{
    level endon( "game_ended" );

    foreach ( var_3 in level._id_0328 )
    {
        if ( isdefined( var_3 ) && var_3._id_04A8 == var_0 )
            var_3 _id_6D4F( var_1 );
    }
}

_id_9B3E( var_0, var_1 )
{
    level endon( "game_ended" );
    var_0 _id_6D4F( var_1 );
}

_id_6D4F( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_99E0 ) )
            self._id_99E0 = _id_A756::_id_299E( self, -1 );

        self _meth_82A6( "specialty_uav_paint", 1, 0 );
    }
    else
    {
        if ( isdefined( self._id_99E0 ) )
        {
            _id_A756::_id_299C( self._id_99E0 );
            self._id_99E0 = undefined;
        }

        self _meth_82A9( "specialty_uav_paint", 1 );
    }
}

_id_9B7B( var_0, var_1 )
{
    foreach ( var_3 in level._id_0328 )
    {
        if ( isdefined( var_3 ) && var_3._id_04A8 == var_0 )
            _id_9B43( var_3, var_1 );
    }
}

_id_9B43( var_0, var_1 )
{
    if ( !var_1 || !var_0 _id_A75A::_id_05CB( "specialty_class_hardwired" ) )
        var_0 _meth_82FB( "ui_uav_scrambler_on", var_1 );
}

_id_8026( var_0, var_1 )
{
    _func_175( var_0, var_1 );
    level notify( "radar_status_change", var_0 );
}

_id_4661()
{
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "stinger_fired", var_0, var_1 );

        if ( !_id_A752::_id_0C99( var_1, self ) )
            continue;

        foreach ( var_3 in var_1 )
        {
            if ( !isdefined( var_3 ) )
                continue;

            var_3 thread _id_8E52( var_3._id_580C, var_0 );
        }
    }
}

_id_8E52( var_0, var_1 )
{
    self endon( "death" );
    var_2 = distance( self._id_02E6, var_0 _meth_8216( 0, 0, 0 ) );
    var_3 = var_0 _meth_8216( 0, 0, 0 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            var_4 = var_3;
        else
            var_4 = var_0 _meth_8216( 0, 0, 0 );

        var_3 = var_4;
        var_5 = distance( self._id_02E6, var_4 );

        if ( var_5 < var_2 )
            var_2 = var_5;

        if ( var_5 > var_2 )
        {
            if ( var_5 > 1536 )
                return;

            radiusdamage( self._id_02E6, 1536, 600, 600, var_1, "MOD_EXPLOSIVE", "stinger_mp" );
            playfx( level._id_8E40, self._id_02E6 );
            self _meth_8054();
            self notify( "deleted" );
            wait 0.05;
            self delete();
            var_1 notify( "killstreak_destroyed" );
        }

        wait 0.05;
    }
}

_id_0858()
{
    if ( level._id_91E4 )
        level._id_99E1[self._id_04A8][level._id_99E1[self._id_04A8].size] = self;
    else
        level._id_99E1[self._id_02E9._id_444D + "_" + gettime()] = self;
}

_id_73E3()
{
    var_0 = [];

    if ( level._id_91E4 )
    {
        var_1 = self._id_04A8;

        foreach ( var_3 in level._id_99E1[var_1] )
        {
            if ( !isdefined( var_3 ) )
                continue;

            var_0[var_0.size] = var_3;
        }

        level._id_99E1[var_1] = var_0;
    }
    else
    {
        foreach ( var_3 in level._id_99E1 )
        {
            if ( !isdefined( var_3 ) )
                continue;

            var_0[var_0.size] = var_3;
        }

        level._id_99E1 = var_0;
    }
}

_id_07C5()
{
    self._id_99E5 = "standard";

    if ( level._id_91E4 )
        level._id_0725[self._id_04A8]++;
    else
    {
        level._id_0725[self._id_02E9._id_444D]++;
        level._id_0725[self._id_02E9._id_444D + "_radarStrength"] = level._id_0725[self._id_02E9._id_444D + "_radarStrength"] + self._id_9C4B;
    }
}

_id_07C4()
{
    self._id_99E5 = "counter";

    if ( level._id_91E4 )
        level._id_071D[self._id_04A8]++;
    else
        level._id_071D[self._id_02E9._id_444D]++;
}

_id_7391()
{
    if ( level._id_91E4 )
    {
        level._id_0725[self._id_04A8]--;

        if ( !level._id_0725[self._id_04A8] )
            return;
    }
    else if ( isdefined( self._id_02E9 ) )
    {
        level._id_0725[self._id_02E9._id_444D]--;
        level._id_0725[self._id_02E9._id_444D + "_radarStrength"] = level._id_0725[self._id_02E9._id_444D + "_radarStrength"] - self._id_9C4B;
    }
}

_id_738F()
{
    if ( level._id_91E4 )
    {
        level._id_071D[self._id_04A8]--;

        if ( !level._id_071D[self._id_04A8] )
            return;
    }
    else if ( isdefined( self._id_02E9 ) )
        level._id_071D[self._id_02E9._id_444D]--;
}
