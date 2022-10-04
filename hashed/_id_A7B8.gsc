// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_058F["airstrike_ground"] = loadfx( "vfx/explosion/clusterbomb_explode" );
    level._id_058F["airstrike_bombs"] = loadfx( "vfx/explosion/vfx_clusterbomb" );
    level._id_058F["airstrike_death"] = loadfx( "vfx/explosion/vehicle_warbird_explosion_midair" );
    level._id_058F["airstrike_engine"] = loadfx( "vfx/fire/jet_afterburner" );
    level._id_058F["airstrike_wingtip"] = loadfx( "vfx/trail/jet_contrail" );
    level._id_46DC = [];
    level._id_687B = [];
    level._id_0D33 = [];
    level._id_25ED["strafing_run_airstrike"] = 900;
    level._id_25EE["strafing_run_airstrike"] = 750;
    level._id_25EC["strafing_run_airstrike"] = 1;
    level._id_25EF["strafing_run_airstrike"] = 6.0;
    level._id_5398["strafing_run_airstrike"] = ::_id_98C8;
    level._id_53AC["stealth_bomb_mp"] = "strafing_run_airstrike";
    level._id_53AC["airstrike_missile_mp"] = "strafing_run_airstrike";
    level._id_53AC["orbital_carepackage_pod_plane_mp"] = "strafing_run_airstrike";
}

_id_98C8( var_0, var_1 )
{
    return _id_98A2( var_0, "strafing_run_airstrike", var_1 );
}

_id_98A2( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_8F19 ) )
    {
        self _meth_826E( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    var_3 = _id_7C5B( var_0, var_1, var_2 );

    if ( !isdefined( var_3 ) || !var_3 )
        return 0;

    return 1;
}

_id_2BE2( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( level._id_099C ) )
    {
        while ( isdefined( level._id_099C ) )
            level waittill( "begin_airstrike" );

        level._id_099C = 1;
        wait 2.0;
    }

    if ( !isdefined( var_3 ) )
        return;

    level._id_099C = 1;
    var_7 = _id_2F92( var_1, var_3 );
    var_8 = spawnstruct();
    var_8._id_02E6 = var_7;
    var_8._id_019B = anglestoforward( ( 0, var_2, 0 ) );
    var_8._id_8F20 = var_5;
    var_8._id_04A8 = var_4;
    level._id_0D33[level._id_0D33.size] = var_8;
    var_9 = _id_1A0B( var_0, var_3, var_7, var_2, var_5, var_6 );
    wait 1.0;
    level._id_099C = undefined;
    var_3 notify( "begin_airstrike" );
    level notify( "begin_airstrike" );
    wait 7.5;
    var_10 = 0;
    var_11 = [];

    for ( var_12 = 0; var_12 < level._id_0D33.size; var_12++ )
    {
        if ( !var_10 && level._id_0D33[var_12]._id_02E6 == var_7 )
        {
            var_10 = 1;
            continue;
        }

        var_11[var_11.size] = level._id_0D33[var_12];
    }

    level._id_0D33 = var_11;
}

_id_1EFD( var_0 )
{
    wait 2.0;
    level._id_099C = undefined;
}

_id_3EE4( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_0D33.size; var_2++ )
    {
        var_3 = level._id_0D33[var_2]._id_02E6;
        var_4 = level._id_0D33[var_2]._id_019B;
        var_5 = level._id_0D33[var_2]._id_8F20;
        var_1 += _id_40C8( var_0, var_3, var_4, var_5 );
    }

    return var_1;
}

_id_40C8( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1 + level._id_25EC[var_3] * level._id_25ED[var_3] * var_2;
    var_5 = var_0 - var_4;
    var_5 = ( var_5[0], var_5[1], 0 );
    var_6 = vectordot( var_5, var_2 ) * var_2;
    var_7 = var_5 - var_6;
    var_8 = var_7 + var_6 / level._id_25EF[var_3];
    var_9 = lengthsquared( var_8 );

    if ( var_9 > level._id_25ED[var_3] * level._id_25ED[var_3] )
        return 0;

    if ( var_9 < level._id_25EE[var_3] * level._id_25EE[var_3] )
        return 1;

    var_10 = sqrt( var_9 );
    var_11 = ( var_10 - level._id_25EE[var_3] ) / ( level._id_25ED[var_3] - level._id_25EE[var_3] );
    return 1 - var_11;
}

_id_6E24( var_0, var_1, var_2, var_3 )
{
    return distance2d( var_0, var_1 ) <= level._id_25ED[var_3] * 1.25;
}

_id_70D3( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level._id_0328;

    foreach ( var_7 in level._id_0328 )
    {
        if ( !isalive( var_7 ) )
            continue;

        if ( var_7._id_04A8 == var_4 || var_7._id_04A8 == "spectator" )
            continue;

        var_8 = var_7._id_02E6 + ( 0, 0, 32 );
        var_9 = distance( var_0, var_8 );

        if ( var_9 > var_1 )
            continue;

        var_10 = int( var_2 + ( var_3 - var_2 ) * var_9 / var_1 );
        var_7 thread _id_0D34( "default", var_10 );
    }
}

_id_0D34( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( isdefined( self._id_13A9 ) && self._id_13A9 )
        return;

    self._id_13A9 = 1;
    self _meth_8182( var_0, var_1 );
    wait(var_1 + 1);
    self._id_13A9 = 0;
}

_id_153F( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "crashing" );
    var_2 = spawnstruct();
    var_2._id_9BF3 = [];
    var_2._id_2385 = [];
    _id_A038( var_0 );
    wait 0.1;
    var_3 = gettime();
    var_2._id_2385[0] = _id_83E8( var_0, var_1, var_2 );
    var_4 = gettime();
    var_5 = 0.1 - ( var_4 - var_3 ) / 1000;

    if ( var_5 > 0 )
        wait(var_5);

    var_3 = gettime();
    var_2._id_2385[1] = _id_83E8( var_0, var_1, var_2 );
    var_4 = gettime();
    var_5 = 0.1 - ( var_4 - var_3 ) / 1000;

    if ( var_5 > 0 )
        wait(var_5);

    var_2._id_2385[2] = _id_83E8( var_0, var_1, var_2 );
}

_id_83E8( var_0, var_1, var_2 )
{
    var_3 = _id_2F92( var_0._id_02E6, var_0 );
    var_4 = _id_377A( var_3, var_0, var_2, var_0._id_2F91, var_1 );

    if ( !isdefined( var_4 ) )
    {
        var_4 = spawnstruct();
        var_4._id_02E6 = var_3;
    }

    var_5 = var_0._id_02E6 + ( 0, 0, -5 );
    return _id_A7C8::_id_37E1( "orbital_carepackage_pod_plane_mp", var_1, var_4, "airdrop_assault", [], undefined, var_5, var_2._id_2385, 0 );
}

_id_2F92( var_0, var_1 )
{
    var_2 = var_0;
    var_3 = var_2 + ( 0, 0, -1e+06 );
    var_4 = bullettrace( var_2, var_3, 0, var_1 );

    for ( var_5 = var_4["entity"]; isdefined( var_5 ) && isdefined( var_5._id_04FE ); var_5 = var_4["entity"] )
    {
        waittillframeend;
        var_2 = var_4["position"];
        var_4 = bullettrace( var_2, var_3, 0, var_5 );
    }

    return var_4["position"];
}

withinothercarepackagenodes( var_0, var_1 )
{
    var_2 = 26;
    var_3 = var_2 * 2;
    var_4 = var_3 * var_3;

    foreach ( var_6 in var_1._id_9BF3 )
    {
        var_7 = _func_220( var_6._id_02E6, var_0 );

        if ( var_7 < var_4 )
            return 1;
    }

    return 0;
}

_id_377A( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 4;
    var_6 = 5;
    var_7 = var_1._id_02E6;
    var_8 = getnodesinradiussorted( var_3, 300, 0, 1000 );
    var_9 = undefined;

    foreach ( var_11 in var_8 )
    {
        if ( var_5 <= 0 )
            break;

        if ( !_func_20C( var_11, 1 ) )
            continue;

        if ( _id_A4F0::_id_0CE4( var_2._id_9BF3, var_11 ) )
            continue;

        if ( withinothercarepackagenodes( var_11._id_02E6, var_2 ) )
            continue;

        var_12 = var_11._id_02E6 + ( 0, 0, 5 );
        var_13 = var_4;

        if ( !isdefined( var_13 ) )
            var_13 = var_1;

        var_2._id_9BF3[var_2._id_9BF3.size] = var_11;

        if ( bullettracepassed( var_7, var_12, 0, var_1 ) && _id_A7CA::_id_1B9F( var_11._id_02E6, var_13, "carepackage" ) )
        {
            var_9 = var_11;
            break;
        }

        var_6--;

        if ( var_6 <= 0 )
        {
            var_5--;
            var_6 = 5;
            waittillframeend;
        }
    }

    return var_9;
}

_id_2BE4( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( !_id_A4F0::_id_0CE4( var_6, "strafing_run_airstrike_two" ) )
        thread _id_8986( var_0, var_1, var_2, var_3, var_4, var_5, var_6, 1 );
    else
    {
        var_7 = spawnstruct();
        _id_3ED9( var_3, var_4, var_7 );
        thread _id_8986( var_0, var_1, var_2, var_7._id_8D30, var_4, var_5, var_6, 1 );
        wait 1;
        thread _id_8986( var_0, var_1, var_2, var_7._id_8D31, var_4, var_5, var_6, 0 );
    }
}

_id_3ED9( var_0, var_1, var_2 )
{
    var_3 = anglestoright( var_1 );
    var_2._id_8D30 = var_0 + var_3 * 500;
    var_2._id_8D31 = var_0 + var_3 * -1 * 500;
}

_id_8986( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = "compass_objpoint_airstrike_busy";

    if ( _id_A4F0::_id_0CE4( var_6, "strafing_run_airstrike_stealth" ) )
        var_8 = "compass_objpoint_b2_airstrike_enemy";

    var_9 = spawn( "script_model", var_3 );
    var_9._id_0041 = var_4;
    var_9 _meth_80B1( "vehicle_airplane_shrike" );
    var_9._id_5C73 = spawnplane( var_1, "script_model", var_3, "compass_objpoint_airstrike_friendly", var_8 );
    var_9._id_5C73 _meth_80B1( "tag_origin" );
    var_9._id_5C73 _meth_8446( var_9, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_9._id_5D57 = var_6;
    var_9._id_04FE = "strafing_run";
    _id_081C( var_9 );
    var_9 _meth_82C0( 1 );
    var_9 _meth_82C1( 1 );
    var_9 thread _id_A783::_id_7F5F( 1000, undefined, ::_id_644B, _id_A7B5::_id_47D3, 1 );

    if ( _id_A4F0::_id_0CE4( var_9._id_5D57, "strafing_run_airstrike_flares" ) )
        var_9 thread _id_099A();

    var_9 thread _id_4653();
    var_9 _meth_8075( "bombrun_jet_dist_loop" );
    var_9._id_56F4 = var_0;
    var_9._id_02E9 = var_1;
    var_9._id_04A8 = var_1._id_04A8;
    var_9._id_2F91 = var_2;
    var_9._id_3306 = 1;
    var_9 thread _id_6878( var_2 );
    var_9 thread _id_687A();
    thread _id_8E12( var_9, var_5 );

    if ( _id_A4F0::_id_0CE4( var_9._id_5D57, "strafing_run_airstrike_package" ) )
        thread _id_153F( var_9, var_1 );
    else
        thread _id_153E( var_9, var_1 );

    if ( level._id_91E4 && var_7 )
        level thread _id_464F( var_9, var_1 );

    var_9 endon( "death" );
    var_9 endon( "crashing" );
    _id_A038( var_9 );
    var_9._id_3306 = 0;
    var_9 waittill( "pathComplete" );
    level._id_8F19 = undefined;
    var_9 notify( "airstrike_complete" );
    _id_73CE( var_9 );
    var_9 waittillmatch( "airstrike", "end" );
    var_9 notify( "delete" );

    if ( isdefined( var_9._id_5C73 ) )
        var_9._id_5C73 delete();

    var_9 delete();
}

planehandlehostmigration()
{
    self endon( "airstrike_complete" );
    self endon( "pathComplete" );

    for (;;)
    {
        level waittill( "host_migration_begin" );
        self _meth_84BD( 1 );
        level waittill( "host_migration_end" );
        self _meth_84BD( 0 );
    }
}

_id_6878( var_0 )
{
    self endon( "airstrike_complete" );
    self _meth_827B( "strafing_run_ks_flyby", "airstrike" );
    thread planehandlehostmigration();
    self._id_8D76 = "flying_in";
    self._id_392F = 3333.33;
    wait 3;
    self._id_8D76 = "strike";
    self._id_392F = 1000.0;
    wait 10;
    self._id_8D76 = "flying_out";
    self._id_392F = 3333.33;
    wait 2.9;
    self notify( "pathComplete" );
}

_id_099A()
{
    self._id_629D = 4;
    thread _id_A7B5::_id_4661();
}

_id_644B( var_0, var_1, var_2, var_3 )
{
    thread _id_235F();
    _id_A783::_id_64B3( var_0, var_1, var_2, var_3, "strafing_run_destroyed", undefined, "callout_destroyed_airstrike", 1 );
}

_id_235F()
{
    self notify( "crashing" );
    self._id_2359 = 1;
}

_id_153E( var_0, var_1 )
{
    var_0 endon( "airstrike_complete" );

    while ( !_id_91CA( var_0, var_0._id_2F91, 5000 ) )
        wait 0.05;

    var_2 = 1;
    var_3 = 0;
    var_0 notify( "start_bombing" );
    var_0 thread _id_6A2F();

    for ( var_4 = _id_91C4( var_0, var_0._id_2F91 ); var_4 < 5000; var_4 = _id_91C4( var_0, var_0._id_2F91 ) )
    {
        if ( var_4 < 1500 && !var_3 )
            var_3 = 1;

        var_2 = !var_2;

        if ( var_4 < 4500 )
            var_0 thread _id_1A0C( var_0._id_02E6, var_1, ( 0, 0, 0 ), var_2 );

        wait 0.1;
    }

    var_0 notify( "stop_bombing" );
    level._id_8F19 = undefined;
}

_id_6A2F()
{
    self endon( "stop_bombing" );
    self endon( "airstrike_complete" );
    self._id_1532 = spawn( "script_model", ( 0, 0, 0 ) );
    self._id_1532 _meth_80B1( "tag_origin" );
    self._id_1532 _meth_804D( self, "bombaydoor_left_jnt", ( 0, 0, 0 ), ( 0, -90, 0 ) );
    self._id_1533 = spawn( "script_model", ( 0, 0, 0 ) );
    self._id_1533 _meth_80B1( "tag_origin" );
    self._id_1533 _meth_804D( self, "bombaydoor_right_jnt", ( 0, 0, 0 ), ( 0, -90, 0 ) );

    for (;;)
    {
        playfxontag( _id_A4F0::_id_3FA6( "airstrike_bombs" ), self._id_1532, "tag_origin" );
        playfxontag( _id_A4F0::_id_3FA6( "airstrike_bombs" ), self._id_1533, "tag_origin" );
        wait 0.5;
    }
}

_id_8E12( var_0, var_1 )
{
    var_0 endon( "airstrike_complete" );
    var_0 waittill( "start_bombing" );
    var_2 = anglestoforward( var_0._id_0041 );
    var_3 = spawn( "script_model", var_0._id_02E6 + ( 0, 0, 100 ) - var_2 * 200 );
    var_0._id_534A = var_3;
    var_0._id_534A _meth_834D( "airstrike" );
    var_0._id_099E = var_1;
    var_3._id_8D3B = gettime();
    var_3 thread _id_2844( 16.0 );
    var_3 _meth_804D( var_0, "tag_origin", ( -256, 768, 768 ), ( 0, 0, 0 ) );
}

_id_1A0C( var_0, var_1, var_2, var_3 )
{
    self endon( "airstrike_complete" );

    if ( !isdefined( var_1 ) || var_1 _id_A75A::_id_50F6() || var_1 _id_A75A::_id_50AB() )
    {
        self notify( "stop_bombing" );
        return;
    }

    var_4 = 512;
    var_5 = ( 0, randomint( 360 ), 0 );
    var_6 = var_0 + anglestoforward( var_5 ) * randomfloat( var_4 );
    var_7 = bullettrace( var_6, var_6 + ( 0, 0, -10000 ), 0, self );
    var_6 = var_7["position"];
    var_8 = distance( var_0, var_6 );

    if ( var_8 > 10000 )
        return;

    wait(0.85 * var_8 / 2000);

    if ( !isdefined( var_1 ) || var_1 _id_A75A::_id_50F6() || var_1 _id_A75A::_id_50AB() )
    {
        self notify( "stop_bombing" );
        return;
    }

    if ( var_3 )
    {
        playfx( _id_A4F0::_id_3FA6( "airstrike_ground" ), var_6 );
        level thread _id_A7AD::_id_8E11( var_6 );
    }

    thread _id_A75A::_id_6DD9( "bombrun_snap", var_6 );
    _id_70D3( var_6, 512, 8, 4, var_1._id_04A8 );
    self _meth_81D5( var_6 + ( 0, 0, 16 ), 896, 300, 50, var_1, "MOD_EXPLOSIVE", "stealth_bomb_mp" );

    if ( isdefined( level._id_511A ) && level._id_511A && isdefined( level._id_392B ) )
    {
        foreach ( var_10 in level._id_392B )
        {
            if ( var_10._id_02E6[2] > var_6[2] - 24 && var_10._id_02E6[2] < var_6[2] + 1000 && _func_220( var_10._id_02E6, var_6 ) < 90000 )
                var_10 _meth_8051( randomintrange( 50, 300 ), var_6 + ( 0, 0, 16 ), var_1, var_1, "MOD_EXPLOSIVE", "stealth_bomb_mp" );
        }
    }
}

_id_4653( var_0 )
{
    level endon( "game_ended" );
    self endon( "delete" );
    _id_A4F0::_id_A07E( "death", "crashing" );
    var_1 = anglestoforward( self._id_0041 );
    playfx( _id_A4F0::_id_3FA6( "airstrike_death" ), self._id_02E6, var_1 );
    _id_A75A::_id_6DD9( "bombrun_air_death", self._id_02E6 );
    self notify( "airstrike_complete" );
    _id_73CE( self );
    level._id_8F19 = undefined;

    if ( isdefined( self._id_5C73 ) )
        self._id_5C73 delete();

    self delete();
}

_id_081C( var_0 )
{
    level._id_687B[level._id_687B.size] = var_0;
}

_id_73CE( var_0 )
{
    level._id_687B = _id_A4F0::_id_0CF6( level._id_687B, var_0 );
}

_id_2844( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self delete();
}

_id_687A()
{
    self endon( "airstrike_complete" );
    waittillframeend;
    playfxontag( _id_A4F0::_id_3FA6( "airstrike_engine" ), self, "tag_engine_right" );
    playfxontag( _id_A4F0::_id_3FA6( "airstrike_engine" ), self, "tag_engine_left" );
    playfxontag( _id_A4F0::_id_3FA6( "airstrike_wingtip" ), self, "tag_right_wingtip" );
    playfxontag( _id_A4F0::_id_3FA6( "airstrike_wingtip" ), self, "tag_left_wingtip" );
}

_id_1A0B( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread _id_A75A::_id_91F3( "used_strafing_run_airstrike", var_1, var_1._id_04A8 );
    var_6 = _id_4084();
    var_1 endon( "disconnect" );
    var_7 = ( 0, var_3, 0 );
    var_8 = _id_3F9A( var_2, var_7, var_6 );
    level thread _id_2BE4( var_0, var_1, var_2, var_8, var_7, var_4, var_5 );
}

_id_4084()
{
    var_0 = 0;

    if ( isdefined( level._id_099D ) && isdefined( level._id_099D._id_89DC ) )
        var_0 = level._id_099D._id_89DC;

    var_1 = _id_A7B5::_id_3FC1();
    return var_1._id_02E6[2] + 750 + var_0;
}

_id_3F9A( var_0, var_1, var_2 )
{
    var_3 = _id_3F99() / 2;
    var_4 = var_0 + anglestoforward( var_1 ) * ( -1 * var_3 );
    var_4 *= ( 1, 1, 0 );
    var_4 += ( 0, 0, var_2 );
    return var_4;
}

_id_3F99()
{
    return 30000;
}

_id_91C4( var_0, var_1 )
{
    var_2 = _id_91CB( var_0, var_1 );

    if ( var_2 )
        var_3 = 1;
    else
        var_3 = -1;

    var_4 = _id_A4F0::_id_38C7( var_0._id_02E6 );
    var_5 = var_4 + anglestoforward( _id_A4F0::_id_38C6( var_0._id_0041 ) ) * ( var_3 * 100000 );
    var_6 = pointonsegmentnearesttopoint( var_4, var_5, var_1 );
    var_7 = distance( var_4, var_6 );
    return var_7;
}

_id_91CA( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 3000;

    var_3 = _id_91CB( var_0, var_1 );

    if ( var_3 )
        var_4 = 1;
    else
        var_4 = -1;

    var_5 = _id_A4F0::_id_38C7( var_0._id_02E6 );
    var_6 = var_5 + anglestoforward( _id_A4F0::_id_38C6( var_0._id_0041 ) ) * ( var_4 * 100000 );
    var_7 = pointonsegmentnearesttopoint( var_5, var_6, var_1 );
    var_8 = distance( var_5, var_7 );

    if ( var_8 < var_2 )
        return 1;
    else
        return 0;
}

_id_91CB( var_0, var_1 )
{
    var_2 = anglestoforward( _id_A4F0::_id_38C6( var_0._id_0041 ) );
    var_3 = vectornormalize( _id_A4F0::_id_38C7( var_1 ) - var_0._id_02E6 );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

_id_A007()
{
    self endon( "location_selection_complete" );
    self endon( "disconnect" );
    self waittill( "stop_location_selection" );
    self _meth_82D9( 0, 0.3 );
    self _meth_82FB( "ui_map_location_blocked", 0 );

    if ( _id_A79A::_id_A0D4() > 0 )
        self _meth_8315( _id_A4F0::_id_3FFB() );

    level._id_8F19 = undefined;
}

_id_7C5B( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_598D ) )
        level._id_598D = 1024;

    var_3 = level._id_598D / 6.46875;

    if ( level._id_8A76 )
        var_3 *= 1.5;

    level._id_8F19 = 1;
    var_4 = 1;
    var_5 = 1;

    if ( _id_A4F0::_id_0CE4( var_2, "strafing_run_airstrike_two" ) )
        var_5 = 2;

    self _meth_82FB( "ui_map_location_use_carepackages", _id_A4F0::_id_0CE4( var_2, "strafing_run_airstrike_package" ) );
    self _meth_82FB( "ui_map_location_num_planes", var_5 );
    self _meth_82FB( "ui_map_location_height", _id_4084() );
    _id_A75A::_id_0560( var_1, "map_artillery_selector", var_4, var_3 );
    thread _id_A007();
    self endon( "stop_location_selection" );
    self endon( "disconnect" );
    var_6 = undefined;
    var_7 = undefined;
    var_8 = 0;

    while ( !var_8 )
    {
        self waittill( "confirm_location", var_9, var_10 );

        if ( !var_4 )
            var_10 = 0;

        if ( _id_9C44( var_9, var_10, var_2, self ) )
        {
            var_6 = var_9;
            var_7 = var_10;
            self _meth_82FB( "ui_map_location_use_carepackages", 0 );
            self _meth_82FB( "ui_map_location_num_planes", 0 );
            self _meth_82FB( "ui_map_location_height", 0 );
            break;
        }
        else
            thread _id_84FA();
    }

    self _meth_82D9( 0, 0.3 );
    self notify( "location_selection_complete" );
    self _meth_82FB( "ui_map_location_blocked", 0 );
    _id_A744::_id_5838( var_1, var_6 );
    thread _id_3791( var_0, [ var_6 ], [ var_7 ], var_1, var_2 );
    return 1;
}

_id_84FA()
{
    self endon( "location_selection_complete" );
    self endon( "disconnect" );
    self endon( "stop_location_selection" );
    self notify( "airstrikeShowBlockedHUD" );
    self endon( "airstrikeShowBlockedHUD" );

    if ( self _meth_8447( "ui_map_location_blocked" ) == 0 )
        self _meth_82F4( "recon_drn_cloak_notready" );

    self _meth_82FB( "ui_map_location_blocked", 1 );
    wait 1.5;
    self _meth_82FB( "ui_map_location_blocked", 0 );
}

_id_9C44( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_4084();
    var_5 = 1;

    if ( _id_A4F0::_id_0CE4( var_2, "strafing_run_airstrike_two" ) )
        var_5 = 2;

    return _func_2CB( var_0, var_4, var_1, var_5 );
}

_id_3791( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "used" );

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_6 = var_1[var_5];
        var_7 = var_2[var_5];
        var_8 = bullettrace( level._id_5983 + ( 0, 0, 1e+06 ), level._id_5983, 0, undefined );
        var_6 = ( var_6[0], var_6[1], var_8["position"][2] - 514 );
        thread _id_2BE2( var_0, var_6, var_7, self, self._id_030D["team"], var_3, var_4 );
    }
}

_id_A038( var_0 )
{
    var_0 endon( "airstrike_complete" );

    while ( !_id_91CA( var_0, var_0._id_2F91, 200 ) )
        waittillframeend;
}

_id_6C81()
{
    self endon( "disconnect" );
    _id_A75A::_id_3A30( 1 );
    wait 0.5;
    _id_A75A::_id_3A30( 0 );
}

_id_6C91( var_0 )
{
    var_1 = _id_A7C3::_id_4E00( "coop", 0, 0.5 );

    if ( var_1 != "success" || !isdefined( var_0 ) )
    {
        if ( var_1 != "disconnect" )
        {
            if ( !isdefined( var_0 ) )
                thread _id_A75A::_id_6D2C();

            _id_6D2E( 0 );
            _id_A7BB::_id_6D2F();
        }

        self notify( "initRideKillstreak_complete", 0 );
        return;
    }

    self notify( "initRideKillstreak_complete", 1 );
}

_id_464F( var_0, var_1 )
{
    var_2 = var_1._id_04A8;

    if ( var_1._id_04A8 == "allies" )
    {
        var_3 = "SE_1mc_orbitalsupport_buddyrequest";
        var_4 = "SE_1mc_orbitalsupport_buddy";
    }
    else
    {
        var_3 = "AT_1mc_orbitalsupport_buddyrequest";
        var_4 = "AT_1mc_orbitalsupport_buddy";
    }

    _id_A0D9( var_0 );

    if ( !isdefined( var_0 ) )
        return;

    var_5 = _id_A7BB::_id_7017( var_2, &"MP_JOIN_STRAFING_RUN", "strafing_run_airstrike_coop_offensive", var_3, var_4, var_1 );
    level thread _id_A21B( var_5, var_0, var_1 );
    var_6 = _id_A0E3( var_0, "buddyJoinedStreak" );
    _id_A7BB::_id_8EF9( var_5 );

    if ( !isdefined( var_6 ) )
        return;

    var_6 = _id_A0E3( var_0, "airstrike_buddy_removed" );

    if ( !isdefined( var_6 ) )
        return;
}

_id_6224( var_0 )
{
    var_0 endon( "airstrike_complete" );

    if ( var_0._id_3306 )
        _id_A038( var_0 );

    _id_A0D7( var_0, 1.65 );
    var_0 notify( "coopJoinOver" );
}

_id_A0D9( var_0 )
{
    var_1 = 1.65;
    var_2 = anglestoforward( var_0._id_0041 );

    for (;;)
    {
        waittillframeend;

        if ( !isdefined( var_0 ) )
            return;

        var_3 = var_0._id_392F * var_1;
        var_4 = var_0._id_02E6 + var_2 * var_3;
        var_5 = var_4 + ( 0, 0, -10000 );
        var_6 = bullettrace( var_4, var_5, 0, var_0 );

        if ( var_6["fraction"] == 1 )
            continue;

        var_7 = var_6["position"];
        var_8 = getnodesinradius( var_7, 300, 0 );

        if ( var_8.size > 0 )
            break;
    }
}

_id_A0D7( var_0, var_1 )
{
    var_0 endon( "airstrike_complete" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    for (;;)
    {
        waittillframeend;
        var_2 = var_0._id_392F * var_1;
        var_3 = anglestoforward( var_0._id_0041 );
        var_4 = var_0._id_02E6 + var_3 * var_2;
        var_5 = var_4 + ( 0, 0, -10000 );
        var_6 = bullettrace( var_4, var_5, 0, var_0 );

        if ( var_6["fraction"] == 1 )
            break;

        var_7 = var_6["position"];
        var_8 = getnodesinradius( var_7, 300, 0 );

        if ( var_8.size == 0 )
            break;
    }
}

_id_A0D2( var_0, var_1 )
{
    var_1 endon( "airstrike_fire" );
    var_0 endon( "airstrike_complete" );

    if ( var_0._id_3306 )
        _id_A038( var_0 );

    _id_A0D7( var_0 );
}

_id_A0E3( var_0, var_1 )
{
    var_0 endon( "airstrike_complete" );
    var_0 endon( "coopJoinOver" );
    var_0 waittill( var_1 );
    return 1;
}

_id_A21B( var_0, var_1, var_2 )
{
    var_3 = _id_A0C8( var_0, var_1 );

    if ( !isdefined( var_3 ) )
        return;

    var_1 notify( "buddyJoinedStreak" );
    level notify( "buddyGO" );
    var_3 thread _id_6C91( var_1 );
    var_3 waittill( "initRideKillstreak_complete", var_4 );

    if ( !var_4 )
        return;

    var_3 _id_A75A::_id_6D3C();
    var_3 _id_A75A::_id_8347( "strafing_run" );
    var_3 _meth_82DD( "airstrike_fire", "+attack" );
    var_3 _meth_82DD( "airstrike_fire", "+attack_akimbo_accessible" );
    var_5 = spawnturret( "misc_turret", var_1 _meth_8180( "tag_origin" ), "sentry_minigun_mp" );
    var_5 _meth_815C();
    var_5 _meth_80B1( "tag_turret" );
    var_5 _meth_8446( var_1, "tag_origin", ( 0, 0, 0 ), ( 70, 180, 0 ) );
    var_3 _meth_807E( var_5, "tag_player", 0, 180, 180, 5, 15, 0 );
    var_3 _meth_80A0( 0 );
    var_3 _meth_80A1( 1 );
    var_3 _meth_80E8( var_5, 60, 45 );
    var_6 = var_3 _id_A7C6::_id_188F( [] );
    _id_5CB8( var_3, var_6, var_2 );
    _id_A0D2( var_1, var_3 );

    if ( isdefined( var_3 ) )
    {
        earthquake( 0.4, 1, var_3 _meth_845C(), 300 );
        _id_37DF( var_3, var_5, var_6 );

        if ( isdefined( var_3 ) )
        {
            var_3 _id_A7BB::_id_6D2F();
            var_3 _meth_849C( "airstrike_fire", "+attack" );
            var_3 _meth_849C( "airstrike_fire", "+attack_akimbo_accessible" );
        }
    }

    var_5 delete();
}

_id_A0C8( var_0, var_1 )
{
    var_1 endon( "airstrike_complete" );
    var_1 endon( "coopJoinOver" );
    thread _id_6224( var_1 );
    var_2 = _id_A7BB::_id_A0C9( var_0 );
    return var_2;
}

_id_37DF( var_0, var_1, var_2 )
{
    var_3 = var_1 _meth_8180( "tag_player" );
    var_4 = anglestoforward( var_1 _meth_8181( "tag_player" ) );
    var_5 = var_3 + var_4 * 10000;
    var_6 = magicbullet( "airstrike_missile_mp", var_3, var_5, var_0 );
    var_6._id_02E9 = var_0;
    waittillframeend;

    if ( !isdefined( var_0 ) )
        return;

    var_0 _meth_804F();
    var_0 _meth_80E9( var_1 );
    var_0 _meth_82FB( "fov_scale", 4.33333 );
    _id_5CB7( var_0, var_6, var_2 );

    if ( !isdefined( var_0 ) )
        return;

    var_0 _meth_82FB( "fov_scale", 1.0 );
}

_id_5CB8( var_0, var_1, var_2 )
{
    var_0 thread _id_4AE8( var_1, var_2 );
    var_0 _meth_80B8();

    if ( getdvarint( "camera_thirdPerson" ) )
        var_0 _id_A75A::_id_802B( 0 );
}

_id_5CB7( var_0, var_1, var_2 )
{
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    var_0 endon( "player_control_strike_over" );
    var_0 endon( "disconnect" );
    var_2 endon( "ms_early_exit" );
    var_1 thread _id_A7C6::_id_756A();
    var_0 thread _id_A7C6::_id_6AAC( var_1, var_2 );
    var_0 thread _id_A7C6::_id_6AAD( var_1, var_2 );
    var_0 thread _id_4AE7( var_1, var_2 );
    var_0 thread _id_6D82( var_2 );
    var_0 _meth_81E2( var_1, "tag_origin" );
    var_0 _meth_8200( var_1 );
    var_0 thread _id_A7C6::_id_6D8C( var_2 );
    var_1 _id_A4F0::_id_A097( "death", 10 );
    var_2 notify( "missile_strike_complete" );
}

_id_6D82( var_0 )
{
    var_0 _id_A4F0::_id_A07E( "missile_strike_complete", "ms_early_exit" );
    _id_6D2E();
}

_id_6D2E( var_0 )
{
    self endon( "disconnect" );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    self _meth_8201();
    _id_A75A::_id_3A30( 1 );
    self _meth_82FB( "fov_scale", 1.0 );
    _id_8EF2();
    _id_A7C6::_id_8EF2();

    if ( !level._id_3BD8 || isdefined( self._id_373C ) )
        _id_A7B5::_id_6D51();

    if ( var_0 )
    {
        wait 0.5;
        _id_A79A::_id_A0D4();
    }

    _id_A7C6::_id_735E();
    self _meth_80B9();
    self _meth_81E3();
    _id_A75A::_id_3A30( 0 );

    if ( _id_A75A::_id_51E0() )
        _id_A75A::_id_1F0D();

    _id_A75A::_id_6D35();
}

_id_8EF2()
{
    self _meth_82F5( "bombrun_support_mstrike_boost_shot" );
    self _meth_82F5( "bombrun_support_mstrike_boost_boom" );
    self _meth_82F5( "bombrun_support_mstrike_boost_jet" );
}

_id_4AE8( var_0, var_1 )
{
    self endon( "disconnect" );
    self _meth_82FB( "ui_predator_missile", 2 );
    self _meth_82FB( "ui_coop_primary_num", var_1 _meth_81B1() );
    waittillframeend;
    _id_A7C6::_id_4AD6( undefined, var_0 );
    _id_A7B5::_id_6C96();
}

_id_4AE7( var_0, var_1 )
{
    thread _id_A7C6::_id_91C7();
    thread _id_A7C6::_id_91C8( var_0, var_1 );
}
