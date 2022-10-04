// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    setdvar( "missileRemoteSteerPitchRange", "60 87" );
    level._id_05F1 = [];
    level._id_05F1["Particle_FX"] = spawnstruct();
    level._id_05F1["Particle_FX"]._id_3C11 = loadfx( "vfx/unique/vfx_killstreak_missilestrike_dna" );
    level._id_05F1["Particle_FX"]._id_3C1E = loadfx( "vfx/unique/vfx_killstreak_missilestrike_dna_friendly" );
    level._id_05F1["Audio"] = spawnstruct();
    level._id_05F1["Launch_Value"] = spawnstruct();
    var_0 = getdvar( "mapname" );

    if ( var_0 == "mp_suburbia" )
    {
        level._id_05F1["Launch_Value"]._id_9D83 = 7000;
        level._id_05F1["Launch_Value"]._id_49F1 = 10000;
        level._id_05F1["Launch_Value"]._id_91BE = 2000;
    }
    else if ( var_0 == "mp_mainstreet" )
    {
        level._id_05F1["Launch_Value"]._id_9D83 = 7000;
        level._id_05F1["Launch_Value"]._id_49F1 = 10000;
        level._id_05F1["Launch_Value"]._id_91BE = 2000;
    }
    else
    {
        level._id_05F1["Launch_Value"]._id_9D83 = 24000;
        level._id_05F1["Launch_Value"]._id_49F1 = 7000;
        level._id_05F1["Launch_Value"]._id_91BE = 1500;
    }

    level._id_7591 = [];
    level._id_5CA6 = [];
    level._id_5398["missile_strike"] = ::_id_98AD;
    level._id_53AC["remotemissile_projectile_mp"] = "missile_strike";
    level._id_53AC["remotemissile_projectile_gas_mp"] = "missile_strike";
    level._id_53AC["remotemissile_projectile_cluster_parent_mp"] = "missile_strike";
    level._id_53AC["remotemissile_projectile_cluster_child_mp"] = "missile_strike";
    level._id_53AC["remotemissile_projectile_cluster_child_hellfire_mp"] = "missile_strike";
    level._id_53AC["remotemissile_projectile_secondary_mp"] = "missile_strike";
    level._id_53AC["killstreak_strike_missile_gas_mp"] = "missile_strike";
    level._id_7323["explode"] = loadfx( "vfx/explosion/rocket_explosion_airburst" );
    thread _id_64C5();
}

_id_98AD( var_0, var_1 )
{
    var_2 = _id_A7C3::_id_4E00( "missile_strike" );

    if ( var_2 != "success" )
        return 0;

    _id_A75A::_id_6D3C();
    _id_A75A::_id_8347( "missile_strike" );
    var_3 = _id_188F( var_1 );

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        self.missileweapon = var_3;

        if ( self._id_539A == 1 )
            self notify( "used_horde_missile_strike" );
    }

    level thread _id_05AC( var_0, self, var_3 );
    return 1;
}

_id_188F( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_5D57 = var_0;
    var_1._id_02AB = "remotemissile_projectile_mp";
    var_1._id_3C28 = 0;
    var_1._id_1FF4 = 0;
    var_1._id_1FF3 = 0;
    var_1._id_1FF5 = 0;

    if ( _id_A4F0::_id_0CE4( var_1._id_5D57, "missile_strike_hellfire" ) )
    {
        var_1._id_02AB = "remotemissile_projectile_cluster_parent_mp";
        var_1._id_1FF4 = 1;
        var_1._id_1FF3 = 1;
    }

    if ( _id_A4F0::_id_0CE4( var_1._id_5D57, "missile_strike_cluster" ) )
    {
        var_1._id_02AB = "remotemissile_projectile_cluster_parent_mp";
        var_1._id_1FF4 = 1;
        var_1._id_1FF5 = 1;
        thread prespawnclusterrotationentities( var_1 );
    }
    else if ( _id_A4F0::_id_0CE4( var_1._id_5D57, "missile_strike_chem" ) )
    {
        var_1._id_02AB = "remotemissile_projectile_gas_mp";
        var_1._id_3C28 = 1;
    }

    var_1._id_7589 = 1;

    if ( _id_A4F0::_id_0CE4( var_1._id_5D57, "missile_strike_extra_1" ) )
        var_1._id_7589++;

    if ( _id_A4F0::_id_0CE4( var_1._id_5D57, "missile_strike_extra_2" ) )
        var_1._id_7589++;

    return var_1;
}

prespawnclusterrotationentities( var_0 )
{
    var_1 = ( 0, 0, -1000 );
    var_0.prespawnedkillcament = spawn( "script_model", var_1 );
    var_0.prespawnedkillcament _meth_80BE( 0 );
    var_0.prespawnedkillcament _meth_834D( "large explosive" );
    waittillframeend;
    var_0.prespawnedrotationents = [];
    var_0.prespawnedindex = 0;

    for ( var_2 = 0; var_2 < 12; var_2++ )
    {
        var_3 = spawn( "script_origin", var_1 );
        var_0.prespawnedrotationents[var_0.prespawnedrotationents.size] = var_3;
        waittillframeend;
    }
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_A040();
    }
}

_id_A040()
{
    self waittill( "spawned_player" );
    self._id_5CC4 = 0;
    thread _id_241D();
    thread _id_A016();
}

_id_3F15( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_3._id_9C4A = [];
        var_3._id_8A05 = 0;
    }

    foreach ( var_6 in level._id_0328 )
    {
        if ( !_id_A75A::_id_5186( var_6 ) )
            continue;

        if ( var_6._id_04A8 == self._id_04A8 )
            continue;

        if ( var_6._id_04A8 == "spectator" )
            continue;

        var_7 = 999999999;
        var_8 = undefined;

        foreach ( var_3 in var_0 )
        {
            var_3._id_9C4A[var_3._id_9C4A.size] = var_6;
            var_10 = distance2d( var_3._id_91C2._id_02E6, var_6._id_02E6 );

            if ( var_10 <= var_7 )
            {
                var_7 = var_10;
                var_8 = var_3;
            }
        }

        var_8._id_8A05 += 2;
    }

    var_13 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        foreach ( var_6 in var_3._id_9C4A )
        {
            var_3._id_8A05 += 1;

            if ( bullettracepassed( var_6._id_02E6 + ( 0, 0, 32 ), var_3._id_02E6, 0, var_6 ) )
                var_3._id_8A05 += 3;

            if ( var_3._id_8A05 > var_13._id_8A05 )
            {
                var_13 = var_3;
                continue;
            }

            if ( var_3._id_8A05 == var_13._id_8A05 )
            {
                if ( _id_A4F0::_id_2006() )
                    var_13 = var_3;
            }
        }
    }

    return var_13;
}

_id_05AC( var_0, var_1, var_2 )
{
    var_3 = var_2._id_02AB;
    var_1 _id_6C5A();
    var_4 = _id_37E0( var_1, var_3 );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_1._id_0383 = var_4;

    var_2._id_7589--;

    if ( var_2._id_7589 > 0 || var_2._id_1FF4 )
        var_4 _meth_8418();

    var_4._id_02E9 = var_1;
    var_4._id_04A8 = var_1._id_04A8;
    var_4._id_56F4 = var_0;
    var_4._id_04D8 = "remote";
    level._id_7325 = 1;
    var_4 thread _id_A783::_id_7F5F( 10, undefined, ::_id_5CC5, undefined, 1 );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_4 thread rocketimpact_dronekillcheck( var_1 );

    var_4 _meth_8464( 1 );
    var_4 _meth_8003( "mstrike_entry_npc", _id_A75A::_id_4065( var_4._id_04A8 ) );
    var_4 _meth_8003( "mstrike_entry_npc", var_4._id_04A8, var_1 );
    _id_5CB6( var_1, var_4, var_2 );
}

rocketimpact_dronekillcheck( var_0 )
{
    self waittill( "death" );

    if ( isdefined( level._id_392B ) )
    {
        foreach ( var_2 in level._id_392B )
        {
            if ( var_2._id_02E6[2] > self._id_02E6[2] && var_2._id_02E6[2] < self._id_02E6[2] + 1200 && _func_220( var_2._id_02E6, self._id_02E6 ) < 40000 )
                var_2 _meth_8051( 350, self._id_02E6, var_0, var_0, "MOD_PROJECTILE_SPLASH", "remotemissile_projectile_mp" );
        }
    }
}

_id_5CC5( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( isdefined( self._id_02E9 ) )
        {
            self._id_02E9.missileweapon = undefined;
            self._id_02E9._id_0383 = undefined;
        }
    }

    playfx( level._id_7323["explode"], self._id_02E6 );
    _id_A783::_id_64B3( var_0, var_1, var_2, var_3, "missile_strike_destroyed", undefined, undefined, 0 );
    self delete();
}

_id_37E0( var_0, var_1 )
{
    var_2 = _id_A7B5::_id_3F85( "remoteMissileSpawn", "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4._id_04A5 ) )
            var_4._id_91C2 = getent( var_4._id_04A5, "targetname" );
    }

    if ( var_2.size > 0 )
        var_6 = var_0 _id_3F15( var_2 );
    else
        var_6 = undefined;

    var_7 = undefined;
    var_8 = undefined;

    if ( isdefined( var_6 ) )
    {
        var_7 = var_6._id_02E6;
        var_8 = var_6._id_91C2._id_02E6;
        var_9 = 24000;

        if ( isdefined( level._id_731E ) )
            var_9 = level._id_731E;

        var_10 = vectornormalize( var_7 - var_8 );
        var_7 = var_10 * var_9 + var_8;
    }
    else
    {
        var_11 = ( 0, 0, level._id_05F1["Launch_Value"]._id_9D83 );
        var_9 = level._id_05F1["Launch_Value"]._id_49F1;
        var_12 = level._id_05F1["Launch_Value"]._id_91BE;
        var_13 = anglestoforward( var_0._id_0041 );
        var_7 = var_0._id_02E6 + var_11 + var_13 * var_9 * -1;
        var_8 = var_0._id_02E6 + var_13 * var_12;
    }

    return magicbullet( var_1, var_7, var_8, var_0 );
}

_id_5CB6( var_0, var_1, var_2 )
{
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    var_2 endon( "missile_strike_complete" );
    var_0 endon( "disconnect" );
    var_1 thread _id_756A();
    var_0 thread _id_6AAC( var_1, var_2 );
    var_0 thread _id_6AAD( var_1, var_2 );
    var_0._id_1FF2 = 0;
    var_0._id_5CB2 = 0;
    var_0 _meth_81E2( var_1, "tag_origin" );
    var_0 _meth_8200( var_1 );

    if ( getdvarint( "camera_thirdPerson" ) )
        var_0 _id_A75A::_id_802B( 0 );

    var_0 thread _id_4CFA( var_1, var_2 );
    var_0 thread _id_6D82( var_2 );

    if ( var_2._id_1FF4 )
        var_0 thread _id_A216( var_1, var_2 );

    if ( var_2._id_7589 <= 0 && !var_2._id_1FF4 )
    {
        var_1 _meth_8419();
        var_0 thread _id_4AD9( var_1, var_2 );
    }
    else
        var_0 thread _id_A218( var_1, var_2 );

    var_0 thread _id_6D8C( var_2 );
    var_1 waittill( "death" );

    if ( var_2._id_3C28 )
    {
        if ( isdefined( var_1 ) )
            var_0 thread _id_730B( var_1._id_02E6 );
    }

    if ( isdefined( var_1 ) )
        var_0 _id_A744::_id_5838( "missile_strike", var_1._id_02E6 );

    var_2 notify( "missile_strike_complete" );
}

_id_6D8C( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "missile_strike_complete" );
    self endon( "disconnect" );

    for (;;)
    {
        var_1 = 0;

        while ( self _meth_833C() )
        {
            var_1 += 0.05;

            if ( var_1 > 0.5 )
            {
                var_0 notify( "ms_early_exit" );
                return;
            }

            waittillframeend;
        }

        waittillframeend;
    }
}

_id_6D82( var_0 )
{
    var_0 _id_A4F0::_id_A07E( "missile_strike_complete", "ms_early_exit" );
    _id_6D2E();
}

_id_6D2E()
{
    self endon( "disconnect" );
    self _meth_8201();
    _id_A75A::_id_3A30( 1 );
    _id_6D2D();
    _id_8EF2();

    if ( !level._id_3BD8 || isdefined( self._id_373C ) )
        _id_A7B5::_id_6D51();

    wait 0.5;
    _id_A79A::_id_A0D4();
    _id_735E();
    self _meth_81E3();
    _id_A75A::_id_3A30( 0 );

    if ( _id_A75A::_id_51E0() )
        _id_A75A::_id_1F0D();

    if ( getdvarint( "camera_thirdPerson" ) )
        _id_A75A::_id_802B( 1 );

    _id_A75A::_id_6D35();

    if ( isdefined( level._id_0391 ) )
        self _meth_82D4( level._id_0391, 0.0 );

    _id_A75A::_id_74F7( 0.02 );
}

_id_8EF2()
{
    self _meth_82F5( "mstrike_boost_shot" );
    self _meth_82F5( "mstrike_boost_boom" );
    self _meth_82F5( "mstrike_boost_swoop" );
    self _meth_82F5( "mstrike_boost_jet" );
    self _meth_82F5( "mstrike_boost_roar" );
}

_id_A218( var_0, var_1 )
{
    var_0 endon( "death" );
    wait 0.5;

    for (;;)
    {
        self waittill( "FireButtonPressed" );

        if ( var_1._id_7589 > 0 )
            thread _id_37CB( var_0, var_1 );
        else
            break;

        wait 0.1;
    }
}

_id_3109( var_0 )
{
    wait 0.5;
    var_0 _meth_8419();
}

_id_37CB( var_0, var_1 )
{
    var_2 = var_1._id_02AB;
    var_3 = ( 0, 32, 0 );
    var_4 = var_1._id_7589 % 2;

    if ( var_4 == 0 )
        var_3 = ( 0, -64, 0 );

    var_5 = var_0._id_02E6 + anglestoforward( var_0._id_0041 ) * 32000;
    var_6 = bullettrace( var_0._id_02E6, var_5, 0, var_0, 0, 0, 0, 1, 0 );
    var_7 = var_0._id_02E6 + var_3 + anglestoforward( var_0._id_0041 ) * 750;
    var_8 = var_6["position"];
    var_9 = magicbullet( "remotemissile_projectile_secondary_mp", var_7, var_8, self );

    if ( !isdefined( var_9 ) )
        return;

    var_1._id_7589--;

    if ( var_1._id_7589 <= 0 && !var_1._id_1FF4 )
    {
        _id_4AD6( var_9, var_1 );
        thread _id_4AD9( var_0, var_1 );
        thread _id_3109( var_0 );
    }

    if ( isdefined( var_2 ) )
    {
        if ( isdefined( var_0._id_91D2 ) && var_0._id_91D2.size )
            var_9 _meth_81D9( var_0._id_91D2[0] );
    }

    var_9._id_04A8 = self._id_04A8;
    var_9 _meth_8464( 1 );
    self _meth_80AD( "sniper_fire" );
    earthquake( 0.2, 0.2, var_0._id_02E6, 200 );
    var_9 thread _id_A783::_id_7F5F( 10, undefined, ::_id_5CC5, undefined, 1 );
}

_id_A216( var_0, var_1 )
{
    var_1 endon( "missile_strike_complete" );
    self endon( "spawned_player" );
    var_0 endon( "death" );

    while ( var_1._id_7589 > 0 )
        self waittill( "FireButtonPressed" );

    wait 0.25;
    self waittill( "FireButtonPressed" );
    self._id_1FF2 = 1;
    _id_4AD6( var_0, var_1 );
    thread _id_8A6F( var_0, var_1 );
}

_id_8A6F( var_0, var_1 )
{
    if ( var_1._id_1FF3 )
        thread _id_8A70( var_0, var_1 );
    else
        thread _id_8A71( var_0, var_1 );
}

_id_8A70( var_0, var_1 )
{
    var_2 = 2;
    var_3 = [];

    if ( isdefined( var_0._id_91D2 ) && var_0._id_91D2.size )
        var_3 = var_0._id_91D2;

    thread _id_37C6( var_0, 0, var_1 );

    foreach ( var_5 in var_3 )
    {
        thread _id_37C7( var_0, var_5, var_2, var_1 );
        var_2++;
    }

    for ( var_7 = var_3.size; var_7 <= 8; var_7++ )
    {
        thread _id_37C0( var_0, var_7 % 6, var_2, var_1 );
        var_2++;
    }

    self _meth_80AD( "sniper_fire" );
    earthquake( 0.2, 0.2, var_0._id_02E6, 200 );
    var_0 _meth_8505( 1 );
    thread _id_35E9();
    thread _id_1541( var_0, var_1 );
}

_id_8A71( var_0, var_1 )
{
    var_1 endon( "missile_strike_complete" );
    self endon( "spawned_player" );
    var_0 endon( "death" );
    thread _id_35E9();
    self waittill( "full_white" );
    thread _id_A75A::_id_3A30( 1 );

    if ( !isdefined( var_0 ) )
        return;

    self._id_8F4A = var_0._id_02E6;
    self._id_8F49 = var_0._id_0041;
    var_2 = distance( var_0._id_02E6, self._id_02E6 ) + 10000;
    var_3 = var_0._id_02E6 + anglestoforward( var_0._id_0041 ) * var_2;
    var_4 = self._id_8F4A;
    var_5 = var_0._id_02E6 + anglestoforward( var_0._id_0041 ) * 3250;
    var_0 _meth_8505( 1 );
    thread _id_1541( var_0, var_1 );
    thread _id_8993( var_3, self._id_8F4A, var_5, var_1 );
    self waittill( "fade_white_over" );
    wait 9;
    _id_A75A::_id_3A30( 0 );
}

_id_37C6( var_0, var_1, var_2 )
{
    var_2 endon( "missile_strike_complete" );
    var_3 = var_0._id_02E6;
    var_4 = var_0._id_0041;
    var_5 = var_0._id_02E9;

    if ( var_1 > 0 )
        wait(var_1 * 0.05);

    var_6 = magicbullet( "remotemissile_projectile_cluster_child_hellfire_mp", var_3, var_3 + anglestoforward( var_4 ) * 1000, self );
    var_6._id_04A8 = self._id_04A8;
    var_6._id_534A = self;
    var_6 _meth_8464( 1 );
    var_6 thread _id_1543( self, var_2 );
}

_id_37C7( var_0, var_1, var_2, var_3 )
{
    var_3 endon( "missile_strike_complete" );
    var_4 = var_0._id_02E6;
    var_5 = var_0._id_0041;
    var_6 = var_0._id_02E9;
    var_7 = var_1._id_02E6;
    wait(var_2 * 0.05);

    if ( isdefined( var_1 ) && _func_220( var_1._id_02E6, var_7 ) < 57600.0 )
        var_7 = var_1._id_02E6;

    var_8 = magicbullet( "remotemissile_projectile_cluster_child_hellfire_mp", var_4, var_7, self );
    var_8._id_04A8 = self._id_04A8;
    var_8._id_534A = self;

    if ( isdefined( var_1 ) )
        var_8 _meth_81D9( var_1 );

    var_8 _meth_8464( 1 );
    var_8 thread _id_1543( self, var_3 );
}

_id_37C0( var_0, var_1, var_2, var_3 )
{
    var_3 endon( "missile_strike_complete" );
    var_4 = 600;
    var_5 = var_0._id_02E6;
    var_6 = var_0._id_0041;
    var_7 = var_0._id_02E9;
    var_8 = var_0._id_097D;
    wait(var_2 * 0.05);
    var_9 = randomintrange( 10 + 60 * var_1, 50 + 60 * var_1 );
    var_10 = randomintrange( 200, var_4 + 100 );
    var_11 = min( var_10, var_4 - 50 ) * cos( var_9 );
    var_12 = min( var_10, var_4 - 50 ) * sin( var_9 );
    var_13 = magicbullet( "remotemissile_projectile_cluster_child_hellfire_mp", var_5, var_8 + ( var_11, var_12, 0 ), self );
    var_13._id_04A8 = self._id_04A8;
    var_13._id_534A = self;
    var_13 _meth_8464( 1 );
    var_13 thread _id_1543( self, var_3 );
}

_id_1543( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_1 endon( "ms_early_exit" );
    var_1 endon( "missile_strike_complete" );
    level endon( "game_ended" );
    self waittill( "death" );
    var_1 notify( "bomblet_exploded" );
}

_id_1541( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "ms_early_exit" );
    var_1 endon( "missile_strike_complete" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_1 waittill( "bomblet_exploded" );
    wait 1.0;
    thread _id_1542( var_0, var_1 );
}

_id_1542( var_0, var_1 )
{
    var_0 notify( "death" );
    var_1 notify( "missile_strike_complete" );
}

getprespawnedclusterrotationent( var_0, var_1 )
{
    while ( var_0.prespawnedrotationents.size < var_0.prespawnedindex + 1 )
        waittillframeend;

    var_2 = var_0.prespawnedrotationents[var_0.prespawnedindex];
    var_0.prespawnedindex++;

    if ( isdefined( var_1 ) )
        var_2._id_02E6 = var_1;

    return var_2;
}

_id_8993( var_0, var_1, var_2, var_3 )
{
    var_4 = randomintrange( 16, 64 );

    if ( randomint( 100 ) > 50 )
        var_4 *= -1;

    var_5 = randomintrange( 16, 64 );

    if ( randomint( 100 ) > 50 )
        var_5 *= -1;

    var_6 = var_1 + ( var_4, var_5, 0 );
    var_7 = var_2 + ( var_4, var_5, 0 );
    var_8 = getprespawnedclusterrotationent( var_3, var_2 );
    var_8._id_7609 = [];
    var_8._id_7609[0] = getprespawnedclusterrotationent( var_3, var_7 );
    var_8._id_7609[0] _meth_8446( var_8 );
    var_9 = magicbullet( "remotemissile_projectile_cluster_child_mp", var_6, var_7, self );
    var_9 _meth_81D9( var_8._id_7609[0] );
    var_9 _meth_81DC();
    var_9._id_02E9 = self;
    var_9._id_04A8 = self._id_04A8;
    var_9 _meth_8464( 1 );
    var_9 thread _id_1543( self, var_3 );
    var_10 = var_7 - var_6;
    var_10 = vectornormalize( ( var_10[0], var_10[1], 0 ) );
    var_10 *= -30;
    var_10 += ( 0, 0, 200 );
    var_11 = var_3.prespawnedkillcament;
    var_11._id_02E6 = var_6 + var_10;
    var_11._id_534F = gettime();
    var_11 _meth_804D( var_9 );
    var_11 thread killcamrocketdeath( var_9 );
    var_9._id_534A = var_11;
    var_12 = 10;
    var_3.rotatinglinkarrayindex = var_8._id_7609.size;

    for ( var_13 = 0; var_13 < var_12; var_13++ )
    {
        var_14 = var_8._id_7609.size;
        var_8._id_7609[var_14] = getprespawnedclusterrotationent( var_3 );
    }

    var_9 endon( "death" );
    thread _id_2865( var_8, var_9 );
    thread _id_7602( var_8, var_9 );
    thread _id_5F8C( var_8, var_9 );
    waittillframeend;

    for ( var_13 = 1; var_13 <= var_12; var_13++ )
    {
        var_15 = getmissileposition( var_1, var_2, var_8, var_3 );
        var_7 = var_15._id_02E6;
        var_6 = var_15.randomposition;
        var_16 = magicbullet( "remotemissile_projectile_cluster_child_mp", var_6, var_7, self );
        var_16 _meth_81D9( var_8._id_7609[var_13] );
        var_16 _meth_81DC();
        var_16._id_02E9 = self;
        var_16._id_04A8 = self._id_04A8;
        var_16._id_534A = var_11;
        var_16 _meth_8464( 1 );
        var_16 thread _id_1543( self, var_3 );
        waittillframeend;
    }
}

getmissileposition( var_0, var_1, var_2, var_3 )
{
    var_4 = var_2._id_7609[var_3.rotatinglinkarrayindex];
    var_3.rotatinglinkarrayindex++;
    var_5 = var_2._id_02E6 - var_1;
    var_0 += var_5;
    var_6 = randomintrange( 64, 500 );
    var_7 = var_6 + 0;

    if ( randomint( 100 ) > 50 )
    {
        var_6 *= -1;
        var_7 = var_6 - 0;
    }

    var_8 = randomintrange( 64, 500 );
    var_9 = var_8 + 0;

    if ( randomint( 100 ) > 50 )
    {
        var_8 *= -1;
        var_9 = var_8 - 0;
    }

    var_10 = var_0 + ( var_6, var_8, 0 );
    var_11 = var_2._id_02E6 + ( var_7, var_9, 0 );
    var_4._id_02E6 = var_11;
    var_4.randomposition = var_10;
    var_4 _meth_8446( var_2 );
    return var_4;
}

killcamrocketdeath( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    self _meth_804F();
    self._id_02E6 += ( 0, 0, 50 );
    wait 3;
    self delete();
}

_id_7602( var_0, var_1 )
{
    var_1 endon( "death" );
    var_2 = 10;

    for (;;)
    {
        var_0 _meth_82BD( ( 0, 120, 0 ), var_2 );
        wait(var_2);
    }
}

_id_5F8C( var_0, var_1 )
{
    var_1 endon( "death" );
    var_2 = var_1._id_02E6;
    var_3 = distance( var_1._id_02E6, var_0._id_02E6 );
    var_4 = self._id_8F49;
    var_5 = self._id_8F4A;

    for (;;)
    {
        var_6 = distance( var_1._id_02E6, var_2 );
        var_7 = var_5 + anglestoforward( var_4 ) * ( var_3 + var_6 );
        var_0._id_02E6 = var_7;
        waittillframeend;
    }
}

_id_2865( var_0, var_1 )
{
    var_1 waittill( "death" );

    if ( isdefined( var_0 ) )
    {
        foreach ( var_3 in var_0._id_7609 )
            var_3 delete();

        var_0 delete();
    }
}

_id_730B( var_0 )
{
    var_1 = var_0 + ( 0, 0, 40 );
    var_2 = spawn( "script_model", var_1 );
    var_2 _meth_80B1( "tag_origin" );
    var_3 = spawn( "script_model", var_2._id_02E6 );
    var_2._id_534A = var_3;
    var_2._id_534A _meth_834D( "explosive" );
    var_2._id_534A _meth_8446( var_2 );
    var_4 = spawnstruct();
    var_4._id_02E6 = var_1;
    var_4._id_04A8 = self._id_04A8;
    level._id_5CA6[level._id_5CA6.size] = var_4;
    var_2 thread _id_8509( self );
    var_2._id_6304 = _id_A78A::_id_403F();
    objective_add( var_2._id_6304, "active", var_2._id_02E6, "hud_gas_enemy" );
    objective_playerenemyteam( var_2._id_6304, self _meth_81B1() );
    var_2._id_6305 = _id_A78A::_id_403F();
    objective_add( var_2._id_6305, "active", var_2._id_02E6, "hud_gas_friendly" );
    objective_playerteam( var_2._id_6305, self _meth_81B1() );
    thread _id_1D29( var_2, var_1, self );
    _id_A4F0::_id_A06B( 20, "joined_team", "joined_spectators", "disconnect" );
    _id_A75A::_id_0603( var_2._id_6304 );
    _id_A75A::_id_0603( var_2._id_6305 );
    wait 2;
    var_2 _id_3A98();
    var_2._id_534A delete();
    var_2 delete();
    var_5 = 0;
    var_6 = [];

    for ( var_7 = 0; var_7 < level._id_5CA6.size; var_7++ )
    {
        if ( !var_5 && level._id_5CA6[var_7]._id_02E6 == var_1 )
        {
            var_5 = 1;
            continue;
        }

        var_6[var_6.size] = level._id_5CA6[var_7];
    }

    level._id_5CA6 = var_6;
}

_id_8509( var_0 )
{
    var_1 = level._id_05F1["Particle_FX"]._id_3C1E;
    var_2 = level._id_05F1["Particle_FX"]._id_3C11;
    var_3 = self _meth_8180( "tag_origin" );
    var_4 = ( 1, 0, 0 );
    self._id_3AA9 = _id_A75A::_id_89D7( var_1, var_0._id_04A8, var_3, var_4 );
    self._id_32AB = _id_A75A::_id_89D7( var_2, _id_A75A::_id_4065( var_0._id_04A8 ), var_3, var_4 );
}

_id_3A98()
{
    if ( isdefined( self._id_3AA9 ) )
        self._id_3AA9 delete();

    if ( isdefined( self._id_32AB ) )
        self._id_32AB delete();
}

_id_241D()
{
    if ( !isdefined( self._id_8F48 ) )
    {
        self._id_8F48 = newclienthudelem( self );
        self._id_8F48._id_0530 = 0;
        self._id_8F48._id_0538 = 0;
        self._id_8F48 _meth_80CC( "lab_gas_overlay", 640, 480 );
        self._id_8F48._id_002C = "left";
        self._id_8F48._id_002D = "top";
        self._id_8F48._id_01F4 = "fullscreen";
        self._id_8F48._id_0500 = "fullscreen";
        self._id_8F48._id_0037 = 0;
    }
}

_id_1D29( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_2 endon( "joined_team" );
    var_2 endon( "joined_spectators" );
    var_2 endon( "disconnect" );
    var_3 = 200;
    var_4 = 20;

    for (;;)
    {
        if ( !isdefined( var_2 ) )
            return;

        var_0._id_534A _meth_81D5( var_1, var_3, var_4, var_4, var_2, "MOD_TRIGGER_HURT", "killstreak_strike_missile_gas_mp", 0 );
        wait 1;
    }
}

_id_A016()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( var_1 ) && self == var_1 )
            continue;

        if ( _id_A75A::_id_05CB( "specialty_stun_resistance" ) )
            continue;

        if ( isdefined( var_9 ) && var_9 == "killstreak_strike_missile_gas_mp" )
            thread _id_83CC();
    }
}

_id_83CC()
{
    if ( self._id_5CC4 <= 0 )
    {
        thread _id_35F0();
        thread _id_73CA();
    }

    self._id_5CC4 = 2;
    self _meth_8182( "mp_lab_gas", 1 );

    while ( self._id_5CC4 > 0 )
    {
        self._id_5CC4--;
        wait 1;
    }

    self notify( "missile_strike_gas_end" );
    _id_3165();
}

_id_35F0()
{
    level endon( "game_ended" );
    self endon( "missile_strike_gas_end" );
    self endon( "death" );

    if ( isdefined( self._id_8F48 ) )
    {
        for (;;)
        {
            self._id_8F48 _meth_8084( 0.4 );
            self._id_8F48._id_0037 = 1;
            wait 0.5;
            self._id_8F48 _meth_8084( 0.4 );
            self._id_8F48._id_0037 = 0.5;
            wait 0.5;
        }
    }
}

_id_3165()
{
    if ( isdefined( self._id_8F48 ) )
    {
        self._id_8F48 _meth_8084( 0.2 );
        self._id_8F48._id_0037 = 0.0;
    }
}

_id_3166()
{
    if ( isdefined( self._id_8F48 ) )
        self._id_8F48._id_0037 = 0.0;
}

_id_73CA()
{
    self endon( "missile_strike_gas_end" );
    self waittill( "death" );
    thread _id_3166();
}

_id_6AAD( var_0, var_1 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "joined_team", "joined_spectators" );
    var_1 notify( "missile_strike_complete" );
    level._id_7325 = undefined;
}

_id_756A()
{
    var_0 = self _meth_81B1();
    level._id_7591[var_0] = self;
    self waittill( "death" );
    level._id_7591[var_0] = undefined;
    level._id_7325 = undefined;
}

_id_6AAC( var_0, var_1 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    level waittill( "game_ended" );
    var_1 notify( "missile_strike_complete" );
}

_id_6B71( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( _func_285( var_0, self ) )
        return 0;

    if ( !isalive( var_0 ) )
        return 0;

    if ( var_0 _id_A75A::_id_05CB( "specialty_blindeye" ) )
        return 0;

    if ( isdefined( var_0._id_03DD ) && ( gettime() - var_0._id_03DD ) / 1000 < 5 )
        return 0;

    return 1;
}

_id_3F7E()
{
    var_0 = [];

    foreach ( var_2 in level._id_0328 )
    {
        if ( !_id_6B71( var_2 ) )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_414C( var_0, var_1, var_2 )
{
    var_3 = var_2._id_02AB;
    var_4 = 600;
    var_5 = var_4 * var_4;
    var_6 = [];
    var_7 = anglestoforward( var_0._id_0041 );
    var_8 = var_0._id_02E6[2];
    var_9 = level._id_5983[2];
    var_10 = var_9 - var_8;
    var_11 = var_10 / var_7[2];
    var_12 = var_0._id_02E6 + var_7 * var_11;
    var_0._id_097D = var_12;
    var_13 = 0;

    if ( var_2._id_7589 > 0 )
        var_13 = 1;
    else if ( var_2._id_1FF4 && var_2._id_1FF3 && !self._id_1FF2 )
        var_13 = 10;
    else
        return var_6;

    var_14 = _id_3F7E();

    foreach ( var_16 in var_14 )
    {
        if ( _func_220( var_16._id_02E6, var_12 ) < var_5 )
        {
            if ( var_1 )
            {
                if ( bullettracepassed( var_16._id_02E6 + ( 0, 0, 60 ), var_16._id_02E6 + ( 0, 0, 180 ), 0, var_16 ) )
                    var_6[var_6.size] = var_16;

                continue;
            }

            var_6[var_6.size] = var_16;
        }
    }

    var_18 = _id_A4F0::_id_3CC9( var_0._id_097D, var_6, undefined, var_13 );
    return var_18;
}

_id_91C7()
{
    _id_91C6();
    var_0 = 10;
    self._id_5CA9 = [];

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = newclienthudelem( self );
        var_2._id_0530 = 0;
        var_2._id_0538 = 0;
        var_2._id_053B = 0;
        var_2._id_0037 = 0;
        var_2._id_0048 = 0;
        var_2._id_838C = "hud_fofbox_hostile";
        var_2 _meth_80CC( "hud_fofbox_hostile", 450, 450 );
        var_2 _meth_80D8( 0, 0, 0, 0 );
        var_2 _meth_8514( 0 );
        var_2 _meth_8534( 1 );
        self._id_5CA9[var_1] = var_2;
    }
}

_id_91C6()
{
    if ( !isdefined( self._id_5CA9 ) )
        return;

    var_0 = 10;

    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        if ( isdefined( self._id_5CA9[var_1] ) )
            self._id_5CA9[var_1] _meth_8088();
    }

    self._id_5CA9 = undefined;
}

_id_91C8( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "ms_early_exit" );
    var_1 endon( "missile_strike_complete" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    wait 1;
    var_2 = var_1._id_02AB;
    var_0._id_91D2 = _id_414C( var_0, 1, var_1 );
    var_3 = 10;
    var_4 = 5;
    var_5 = 0;
    var_6 = 47;

    for (;;)
    {
        foreach ( var_8 in self._id_5CA9 )
            var_8._id_0037 = 0;

        var_5++;

        if ( var_5 > var_4 )
        {
            var_0._id_91D2 = _id_414C( var_0, 1, var_1 );
            var_5 = 0;
        }

        var_10 = self._id_5CA9[0];
        var_10._id_0530 = self._id_02E6[0];
        var_10._id_0538 = self._id_02E6[1];
        var_10._id_053B = self._id_02E6[2];
        var_10._id_0037 = 1;

        if ( var_10._id_838C != "hud_fofbox_self" )
        {
            var_10._id_838C = "hud_fofbox_self";
            var_10 _meth_80CC( "hud_fofbox_self", 450, 450 );
            var_10 _meth_80D8( 0, 0, 0, 0 );
            var_10 _meth_8514( 0 );
            var_10 _meth_8534( 1 );
        }

        var_11 = 1;
        var_12 = 0;
        var_13 = level._id_08A1;

        if ( !isdefined( var_13 ) )
            var_13 = [];

        var_14 = _id_A4F0::_id_0CDD( level._id_0328, var_13 );
        var_0._id_91D2 = _id_A4F0::_id_0D01( var_0._id_91D2 );
        var_15 = _id_A4F0::_id_0CF7( var_14, var_0._id_91D2 );
        var_16 = [];

        foreach ( var_18 in var_15 )
        {
            if ( _id_6B71( var_18 ) )
                var_16[var_16.size] = var_18;
        }

        var_20 = _id_A4F0::_id_3CC9( var_0._id_097D, var_16, undefined, undefined );
        var_14 = _id_A4F0::_id_0CDD( var_0._id_91D2, var_20 );

        foreach ( var_22 in var_14 )
        {
            if ( !isdefined( var_22 ) )
                continue;

            var_10 = self._id_5CA9[var_11];

            if ( !isdefined( var_10 ) )
                break;

            if ( ( isplayer( var_22 ) || isagent( var_22 ) ) && _id_6B71( var_22 ) )
            {
                var_10._id_0530 = var_22._id_02E6[0];
                var_10._id_0538 = var_22._id_02E6[1];
                var_10._id_053B = var_22._id_02E6[2];
                var_10._id_0037 = 1;
                var_11++;

                if ( _id_A4F0::_id_0CE4( var_0._id_91D2, var_22 ) && var_10._id_838C == "hud_fofbox_hostile" )
                {
                    var_10._id_838C = "hud_fofbox_hostile_ms_target";
                    var_10 _meth_80CC( "hud_fofbox_hostile_ms_target", 450, 450 );
                    var_10 _meth_80D8( 0, 0, 0, 0, 0 );
                    var_10 _meth_8084( 0.05 );
                    var_10 _meth_8514( 0 );
                    var_10 _meth_8534( 1 );
                    var_12++;
                    continue;
                }

                if ( !_id_A4F0::_id_0CE4( var_0._id_91D2, var_22 ) && var_10._id_838C == "hud_fofbox_hostile_ms_target" )
                {
                    var_10._id_838C = "hud_fofbox_hostile";
                    var_10 _meth_80CC( "hud_fofbox_hostile", 450, 450 );
                    var_10 _meth_80D8( 0, 0, 0, 0 );
                    var_10 _meth_8084( 0.05 );
                    var_10 _meth_8514( 0 );
                    var_10 _meth_8534( 1 );
                }
            }
        }

        if ( var_12 == 1 )
            var_0 _meth_8004( "mstrike_locked_on_single", var_0._id_02E9 );

        if ( var_12 > 1 )
            var_0 _meth_8004( "mstrike_locked_on_multiple", var_0._id_02E9 );

        waittillframeend;
    }
}

_id_4CFA( var_0, var_1 )
{
    self endon( "disconnect" );
    thread _id_91C7();
    thread _id_91C8( var_0, var_1 );
    self _meth_82FB( "ui_predator_missile", 1 );
    self _meth_82FB( "ui_predator_missile_count", var_1._id_7589 );
    var_2 = var_1._id_02AB;

    if ( var_2 == "remotemissile_projectile_mp" )
        self _meth_82FB( "ui_predator_missile_type", 1 );
    else if ( var_2 == "remotemissile_projectile_gas_mp" )
        self _meth_82FB( "ui_predator_missile_type", 2 );
    else if ( var_2 == "remotemissile_projectile_cluster_parent_mp" )
    {
        if ( var_1._id_1FF3 )
            self _meth_82FB( "ui_predator_missile_type", 4 );
        else
            self _meth_82FB( "ui_predator_missile_type", 3 );
    }

    waittillframeend;
    _id_4AD6( var_0, var_1 );
    _id_A7B5::_id_6C96();
}

_id_735E()
{
    self _meth_82FB( "ui_predator_missile", 0 );
    self _meth_82FB( "ui_predator_missile_text", 0 );
    self _meth_82FB( "ui_predator_missile_type", 0 );
    self _meth_82FB( "ui_predator_missile_count", 0 );
    _id_91C6();
    _id_A7B5::_id_6C89();
}

_id_4AD6( var_0, var_1 )
{
    self _meth_82FB( "ui_predator_missile_count", var_1._id_7589 );

    if ( var_1._id_7589 > 0 )
        self _meth_82FB( "ui_predator_missile_text", var_1._id_7589 );
    else if ( var_1._id_1FF4 )
    {
        if ( !self._id_1FF2 )
            self _meth_82FB( "ui_predator_missile_text", 5 );
        else
            self _meth_82FB( "ui_predator_missile_text", 6 );
    }
    else if ( !self._id_5CB2 )
        self _meth_82FB( "ui_predator_missile_text", 3 );
    else
        self _meth_82FB( "ui_predator_missile_text", 4 );
}

_id_4AD9( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "missile_strike_complete" );
    var_1 endon( "ms_early_exit" );
    self waittill( "FireButtonPressed" );
    self _meth_80AD( "sniper_fire" );
    self._id_5CB2 = 1;
    _id_4AD6( var_0, var_1 );
}

_id_35E9()
{
    self endon( "disconnect" );

    if ( !isdefined( self._id_8F4C ) )
    {
        self._id_8F4C = newclienthudelem( self );
        self._id_8F4C._id_0530 = 0;
        self._id_8F4C._id_0538 = 0;
        self._id_8F4C _meth_80CC( "white", 640, 480 );
        self._id_8F4C._id_002C = "left";
        self._id_8F4C._id_002D = "top";
        self._id_8F4C._id_01F4 = "fullscreen";
        self._id_8F4C._id_0500 = "fullscreen";
        self._id_8F4C._id_0037 = 0;
    }

    self._id_8F4C _meth_8084( 0.15 );
    self._id_8F4C._id_0037 = 1;
    wait 0.15;
    self notify( "full_white" );
    self._id_8F4C _meth_8084( 0.2 );
    self._id_8F4C._id_0037 = 0;
    wait 0.2;
    self notify( "fade_white_over" );
    self._id_8F4C _meth_8088();
}

_id_6C5A()
{
    self _meth_82DD( "FireButtonPressed", "+attack" );
    self _meth_82DD( "FireButtonPressed", "+attack_akimbo_accessible" );
}

_id_6D2D()
{
    self _meth_849C( "FireButtonPressed", "+attack" );
    self _meth_849C( "FireButtonPressed", "+attack_akimbo_accessible" );
}
