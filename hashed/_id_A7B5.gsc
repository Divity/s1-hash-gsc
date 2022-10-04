// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( getdvarint( "virtuallobbyactive", 0 ) )
        return;

    level._id_4813 = [];
    level._id_57B5 = [];
    level._id_47CB = _id_3F85( "heli_leave", "targetname" );
    level._id_47AB = _id_3F85( "heli_crash_start", "targetname" );
    level._id_1D55["explode"]["death"] = [];
    level._id_1D55["explode"]["air_death"] = [];
    level._id_1D55["damage"]["light_smoke"] = loadfx( "vfx/trail/smoke_trail_white_heli_emitter" );
    level._id_1D55["damage"]["heavy_smoke"] = loadfx( "vfx/trail/smoke_trail_black_heli_emitter" );
    level._id_1D55["damage"]["on_fire"] = loadfx( "vfx/fire/helicopter_damaged_fire_m" );
    level._id_1D55["explode"]["large"] = loadfx( "fx/explosions/helicopter_explosion_secondary_small" );
    level._id_1D55["rocketlaunch"]["warbird"] = loadfx( "vfx/muzzleflash/rocket_launch_air_to_ground" );
    level._id_47DE["allies"]["hit"] = "warbird_death_explo";
    level._id_47DE["axis"]["hit"] = "warbird_death_explo";
    level._id_47DE["allies"]["spinloop"] = "warbird_death_spin_loop";
    level._id_47DE["axis"]["spinloop"] = "warbird_death_spin_loop";
    level._id_47DE["allies"]["crash"] = "warbird_air_death";
    level._id_47DE["axis"]["crash"] = "warbird_air_death";
    level._id_058F["flare"] = loadfx( "vfx/lensflare/flares_warbird" );
    level._id_47A4 = 1000;
    level._id_47A3 = 4096;
    level._id_47D1 = 2000;
    level._id_47F7 = 0.5;
}

_id_5941( var_0, var_1, var_2 )
{
    level._id_1D55["explode"]["death"][var_0] = loadfx( var_1 );
    level._id_5715[var_0] = var_2;
}

_id_07C7( var_0, var_1 )
{
    level._id_1D55["explode"]["air_death"][var_0] = loadfx( var_1 );
}

_id_084B()
{
    level._id_4813[self _meth_81B1()] = self;
}

_id_73A6( var_0 )
{
    level._id_4813[var_0] = undefined;
}

_id_084C( var_0 )
{
    level._id_57B5[self _meth_81B1()] = self;
}

_id_73A7( var_0 )
{
    var_1 = self _meth_81B1();
    self waittill( "death" );
    level._id_57B5[var_1] = undefined;
}

_id_33E1( var_0 )
{
    if ( level._id_57B5.size >= 4 )
        return 1;
    else
        return 0;
}

_id_47CD( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    var_0 waittill( "disconnect" );
    thread _id_47CA();
}

_id_47CC( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    var_0 _id_A4F0::_id_A060( "joined_team", "joined_spectators" );
    thread _id_47CA();
}

_id_47D3( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_A783::_id_5D4C( var_0, var_1, var_2, var_3 );

    if ( var_4 > 0 )
        _id_47F5( var_1, var_2, var_4 );

    return var_4;
}

_id_47A2( var_0 )
{
    self endon( "death" );
    self._id_725C += var_0;
    wait 4.0;
    self._id_725C -= var_0;
}

_id_47CF( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    _id_A79A::_id_A049( var_0 );
    thread _id_47CA();
}

_id_47CE( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    level waittill( "game_ended" );
    thread _id_47CA();
}

_id_47CA( var_0 )
{
    self notify( "leaving" );
    self._id_5143 = 1;
    self _meth_8266();
    var_1 = undefined;

    if ( !isdefined( var_0 ) )
    {
        var_1 = _id_47D5( level._id_47CB );
        var_0 = var_1._id_02E6;
    }

    var_2 = spawn( "script_origin", var_0 );

    if ( isdefined( var_2 ) )
    {
        self _meth_8265( var_2 );
        var_2 thread _id_9F78( 3.0 );
    }

    _id_47D8();
    self _meth_8283( 100, 45 );

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_1._id_04A5 ) )
            _id_47BD( var_1 );
        else
        {
            _id_0645( var_1._id_02E6, 0 );
            self waittillmatch( "goal" );
        }
    }
    else
    {
        _id_0645( var_0, 0 );
        self waittillmatch( "goal" );
    }

    self notify( "death" );
    wait 0.05;

    if ( isdefined( self._id_534A ) )
        self._id_534A delete();

    _id_A75A::_id_2760();
    self delete();
}

_id_47D5( var_0 )
{
    var_1 = self._id_02E6;
    var_2 = undefined;

    for ( var_6 = 0; var_6 < var_0.size; var_6++ )
    {
        var_7 = var_0[var_6]._id_02E6;

        if ( _id_3931( var_1, var_7, self ) )
        {
            var_8 = var_7 - var_1;
            var_9 = distance( var_1, var_7 );
            var_10 = rotatevector( var_8, ( 0, 90, 0 ) );
            var_11 = var_1 + var_10 * 100;
            var_12 = var_11 + var_8 * var_9;

            if ( _id_3931( var_11, var_12, self ) )
            {
                var_13 = rotatevector( var_8, ( 0, -90, 0 ) );
                var_11 = var_1 + var_13 * 100;
                var_12 = var_11 + var_8 * var_9;

                if ( _id_3931( var_11, var_12, self ) )
                    return var_0[var_6];
            }
        }
    }

    return var_0[randomint( var_0.size )];
}

_id_3931( var_0, var_1, var_2 )
{
    var_3 = bullettrace( var_0, var_1, 0, var_2, 0, 0, 1, 0, 0 );
    var_4 = var_3["fraction"] >= 1;
}

_id_9F78( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait(var_0);
    self delete();
}

_id_2844( var_0 )
{
    wait(var_0);
    self delete();
}

_id_47D8()
{
    self _meth_825F();
    self _meth_825D();
    self _meth_8283( 60, 25 );
    self _meth_8292( 100, 45, 45 );
    self _meth_8294( 30, 30 );
    self _meth_825A( 100 );
    self _meth_8296( 1.0 );
}

_id_0645( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self _meth_825B( var_0, var_1 );
}

_id_47BC( var_0 )
{
    switch ( self._id_4815 )
    {
        default:
            self._id_629D = 1;
            break;
    }

    if ( isdefined( var_0 ) )
        self._id_629D += var_0;

    thread _id_4661();
}

_id_4661( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    for (;;)
    {
        level waittill( "stinger_fired", var_1, var_2 );

        if ( !_id_A752::_id_0C99( var_2, self ) )
            continue;

        if ( !isdefined( var_2 ) )
            continue;

        if ( isdefined( var_0 ) )
        {
            level thread [[ var_0 ]]( var_2, var_1, var_1._id_04A8 );
            continue;
        }

        level thread _id_A236( var_2, var_1, var_1._id_04A8 );
    }
}

_id_A236( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_0 )
        var_4 thread _id_5CCB( var_1, var_2, var_4._id_580C );
}

_id_5CCB( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_2 endon( "death" );
    var_3 = 5.0;
    var_4 = 4000;

    for (;;)
    {
        if ( !isdefined( var_2 ) )
            break;

        var_5 = var_2 _meth_8216( 0, 0, 0 );
        var_6 = distance( self._id_02E6, var_5 );

        if ( isdefined( var_2._id_031D ) )
            var_2._id_031D thread _id_2D73( self, var_2 );

        if ( var_6 < var_4 )
        {
            if ( var_2._id_629D > 0 || isdefined( var_2._id_389B ) )
            {
                if ( isdefined( var_2._id_02E9 ) && _id_51FF( var_2 ) )
                {
                    if ( var_2._id_629D == 2 )
                        var_2._id_02E9 _meth_82FB( "ui_warbird_flares", 1 );
                    else if ( var_2._id_629D == 1 )
                        var_2._id_02E9 _meth_82FB( "ui_warbird_flares", 2 );

                    var_2._id_02E9 _meth_82F4( "paladin_deploy_flares" );
                }

                var_7 = var_2 _id_288F( var_3 );
                playfxontag( _id_A4F0::_id_3FA6( "flare" ), var_7, "tag_origin" );

                if ( !isdefined( var_2._id_389B ) )
                {
                    var_2._id_629D--;
                    level thread _id_465C( var_2, var_7, var_3 );
                }

                self _meth_81D9( var_7 );
                return;
            }
        }

        wait 0.05;
    }
}

_id_288F( var_0 )
{
    var_1 = self _meth_8180( "tag_origin" ) + ( 0, 0, -50 );
    var_2 = spawn( "script_model", var_1 );
    var_2 _meth_80B1( "tag_origin" );
    var_2._id_0041 = self._id_0041;

    if ( !isdefined( self._id_389A ) )
        self._id_389A = randomfloatrange( -180, 180 );
    else
        self._id_389A += 90;

    var_3 = anglestoforward( ( self._id_0041[0], self._id_389A, self._id_0041[2] ) );
    var_3 = _id_9D71( var_3 );
    var_2 _meth_82B2( var_3, var_0 );
    var_2 thread _id_2844( var_0 );
    return var_2;
}

_id_9D71( var_0 )
{
    if ( self._id_04FE == "warbird" )
        return vectornormalize( var_0 + ( 0, 0, -0.2 ) ) * 300;
    else if ( self._id_04FE == "paladin" )
        return vectornormalize( var_0 + ( 0, 0, -0.5 ) ) * 2000;
    else
        return vectornormalize( var_0 + ( 0, 0, -0.4 ) ) * 1000;
}

_id_465C( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0._id_389B = var_1;
    wait(var_2);
    var_0._id_389B = undefined;

    if ( isdefined( var_0._id_02E9 ) && _id_51FF( var_0 ) )
        var_0._id_02E9 _meth_82FB( "ui_warbird_flares", 0 );
}

_id_4746( var_0, var_1 )
{
    var_2 = getnumparts( var_0 );

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        if ( tolower( getpartname( var_0, var_3 ) ) == tolower( var_1 ) )
            return 1;
    }

    return 0;
}

_id_51FF( var_0 )
{
    return isdefined( var_0._id_47FC ) && var_0._id_47FC == "warbird";
}

_id_2D73( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( _id_84AF( var_0, var_1 ) || isdefined( var_1._id_4C29 ) )
        return;

    if ( _id_51FF( var_1 ) )
        self _meth_82FB( "ui_warbird_flares", 3 );

    self _meth_82F4( "mp_aerial_enemy_locked" );
    var_1._id_4C29 = 1;

    for (;;)
    {
        if ( _id_84AF( var_0, var_1 ) )
        {
            self _meth_82F5( "mp_aerial_enemy_locked" );
            var_1._id_4C29 = undefined;
            return;
        }

        waittillframeend;
    }
}

_id_6C9D( var_0 )
{
    var_1 = vectornormalize( anglestoforward( self _meth_833B() ) );
    var_2 = vectornormalize( anglestoright( self _meth_833B() ) );
    var_3 = self _meth_80A8() + var_1 * 100;
    var_4 = var_3 + var_1 * 20000;
    var_5 = bullettrace( var_3, var_4, 0 );

    if ( var_5["fraction"] == 1 )
        return;

    earthquake( 0.1, 1, self _meth_80A8(), 500, self );
    var_3 = self _meth_80A8() + var_2 * -1 * 50;
    var_4 = var_5["position"];
    var_6 = magicbullet( "paint_missile_killstreak_mp", var_3, var_4, self );
    var_6._id_02E9 = self;
    var_6 thread _id_A23F();
    thread _id_6CA1( var_0, "paladin_threat_bomb_shot_2d", "paladin_threat_bomb_shot_3d" );
}

_id_6C9C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 5000;
    earthquake( 0.2, 1, self _meth_845C(), 300 );
    var_6 = vectornormalize( var_2 - var_1 );
    var_7 = var_6 * var_5;
    var_8 = _func_071( "paint_grenade_killstreak_mp", var_1, var_7, 2, self );
    var_8._id_02E9 = self;
    var_8 thread _id_A23F( var_3, var_4 );
    thread _id_6CA1( var_0, "recon_drn_launcher_shot_plr", "recon_drn_launcher_shot_npc" );
    self _meth_80AD( "damage_heavy" );
}

_id_6C9B( var_0, var_1, var_2 )
{
    var_3 = 5000;
    earthquake( 0.2, 1, self _meth_845C(), 300 );
    var_4 = vectornormalize( var_2 - var_1 );
    var_5 = var_4 * var_3;
    var_6 = _func_071( "emp_grenade_killstreak_mp", var_1, var_5, 2, self );
    var_6._id_02E9 = self;
    thread _id_6CA1( var_0, "recon_drn_launcher_shot_plr", "recon_drn_launcher_shot_npc" );
    self _meth_80AD( "damage_heavy" );
}

_id_6CA1( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_0 _meth_8438( var_2 );

    if ( isdefined( var_1 ) )
        self _meth_82F4( var_1 );
}

_id_A23F( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_2 = self._id_02E9;
    var_2 endon( "disconnect" );
    var_2 endon( "death" );
    self waittill( "explode", var_3 );

    if ( var_2 _id_A75A::_id_50F6() && isdefined( level._id_3082 ) && level._id_3082 )
        return;

    _id_29A1( var_3, var_2, var_0, var_1 );
}

_id_29A1( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    foreach ( var_5 in level._id_0328 )
    {
        if ( !isdefined( var_5 ) || !_id_A75A::_id_5186( var_5 ) || !_func_285( var_1, var_5 ) )
            continue;

        thread _id_A756::_id_2996( var_5, var_0, 1.0, 400 );
        thread _id_A756::_id_299A( var_5, 5 );
    }

    var_7 = _id_408C( var_1._id_04A8 );

    foreach ( var_5 in level._id_669A )
    {
        if ( !isdefined( var_5 ) || !_id_A75A::_id_5186( var_5 ) || _func_285( var_1, var_5 ) || var_5 _id_A75A::_id_05CB( "specialty_coldblooded" ) )
            continue;

        if ( distance( var_5._id_02E6, var_0 ) < 400 )
        {
            var_5 _id_A756::_id_0840( var_7, 5, "PAINT_GRENADE", 1, 0 );
            var_1 _id_A784::_id_9B04( "paint" );
            var_5 thread _id_29A2( var_1, 5 );
            var_5 notify( "paint_marked_target", var_1 );

            if ( var_2 )
                _id_A7B4::_id_38A8( var_5, var_0, var_1 );

            if ( isdefined( var_3 ) && var_3._id_9D76 == "recon_uav" )
                var_1 _id_A7A0::_id_6FF3( "ch_streak_recon" );
        }
    }
}

_id_29A2( var_0, var_1 )
{
    level endon( "game_ended" );
    self notify( "detectionGrenadeWatch" );
    self endon( "detectionGrenadeWatch" );

    if ( !isdefined( self._id_90FE ) || self._id_90FE != var_0 )
    {
        if ( !isdefined( level._id_511A ) )
            var_0 thread _id_A72E::_id_53A7();

        var_0 _meth_80AD( "damage_heavy" );
    }

    if ( !isagent( self ) )
        self _meth_849A( 1 );

    self._id_90FE = var_0;
    _id_A4F0::_id_A06A( var_1, "death", "disconnect" );

    if ( isdefined( self ) )
    {
        if ( !isagent( self ) )
            self _meth_849A( 0 );

        self._id_90FE = undefined;
    }
}

_id_408C( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_0328 )
    {
        if ( var_3._id_4742 && isalive( var_3 ) && var_0 == var_3._id_04A8 && ( !isplayer( self ) || var_3 != self ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_84AF( var_0, var_1 )
{
    return !isdefined( var_1 ) || !isdefined( var_1._id_031D ) || !isdefined( var_0 ) || isdefined( var_1._id_389B ) || !_id_A75A::_id_5186( self ) || isdefined( var_1._id_2359 ) || isdefined( var_1._id_50E8 );
}

_id_47F5( var_0, var_1, var_2 )
{
    if ( var_2 > 0 && isdefined( self._id_02E9 ) )
        self._id_02E9 thread _id_6D53();

    if ( var_2 > 0 && isdefined( self._id_A184 ) && isdefined( self._id_A184._id_02E9 ) )
        self._id_A184._id_02E9 thread _id_6D53();
}

_id_47D4()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    for (;;)
    {
        self waittill( "emp_damage" );
        thread _id_47B6();
    }
}

_id_47B6()
{
    self notify( "heli_EMPGrenaded" );
    self endon( "heli_EMPGrenaded" );
    self endon( "death" );
    self endon( "leaving" );
    self endon( "crashing" );
    self._id_02E9 endon( "disconnect" );
    level endon( "game_ended" );
    self._id_3086 = 1;

    if ( isdefined( self._id_5BD4 ) )
        self._id_5BD4 notify( "stop_shooting" );

    if ( isdefined( self._id_5BD5 ) )
        self._id_5BD5 notify( "stop_shooting" );

    wait 3.5;
    self._id_3086 = 0;

    if ( isdefined( self._id_5BD4 ) )
        self._id_5BD4 notify( "turretstatechange" );

    if ( isdefined( self._id_5BD5 ) )
        self._id_5BD5 notify( "turretstatechange" );
}

_id_47B7()
{
    var_0 = self _meth_81B1();
    _id_A4F0::_id_A060( "death", "crashing", "leaving" );
    _id_73A6( var_0 );
    self notify( "helicopter_done" );
}

_id_47A8()
{
    self notify( "crashing" );
    self _meth_8438( "orbital_pkg_self_destruct" );
    self _meth_8266();
    self._id_50E8 = 1;
    var_0 = _id_47D5( level._id_47AB );

    if ( isdefined( self._id_5BD4 ) )
        self._id_5BD4 notify( "stop_shooting" );

    if ( isdefined( self._id_5BD5 ) )
        self._id_5BD5 notify( "stop_shooting" );

    thread _id_47DF( 180 );
    thread _id_47D9();
    self _meth_8283( 100, 45 );

    if ( isdefined( var_0._id_04A5 ) )
        _id_47BD( var_0 );
    else
    {
        _id_0645( var_0._id_02E6, 0 );
        self waittillmatch( "goal" );
    }

    thread _id_47B8();
}

_id_47D9()
{
    var_0 = self._id_04A8;
    playfxontag( level._id_1D55["explode"]["large"], self, "tag_engine_left" );

    if ( isdefined( level._id_47DE[var_0]["hitsecondary"] ) )
        self _meth_809A( level._id_47DE[var_0]["hitsecondary"] );

    wait 3.0;

    if ( !isdefined( self ) )
        return;

    playfxontag( level._id_1D55["explode"]["large"], self, "tag_engine_left" );

    if ( isdefined( level._id_47DE[var_0]["hitsecondary"] ) )
        self _meth_809A( level._id_47DE[var_0]["hitsecondary"] );
}

_id_47DF( var_0 )
{
    self endon( "death" );
    var_1 = self._id_04A8;
    self _meth_809A( level._id_47DE[var_1]["hit"] );
    thread _id_8A5B();
    self _meth_8292( var_0, var_0, var_0 );

    while ( isdefined( self ) )
    {
        self _meth_825E( self._id_0041[1] + var_0 * 0.9 );
        wait 1;
    }
}

_id_8A5B()
{
    self endon( "death" );
    wait 0.25;
    var_0 = self._id_04A8;
    self _meth_80AB();
    wait 0.05;
    self _meth_8075( level._id_47DE[var_0]["spinloop"] );
    wait 0.05;

    if ( isdefined( level._id_47DE[var_0]["spinstart"] ) )
        self _meth_8075( level._id_47DE[var_0]["spinstart"] );
}

_id_47B8( var_0 )
{
    self notify( "death" );

    if ( isdefined( var_0 ) && isdefined( level._id_1D55["explode"]["air_death"][self._id_47FC] ) )
    {
        var_1 = self _meth_8181( "tag_deathfx" );
        playfx( level._id_1D55["explode"]["air_death"][self._id_47FC], self _meth_8180( "tag_deathfx" ), anglestoforward( var_1 ), anglestoup( var_1 ) );
    }
    else
    {
        var_2 = self._id_02E6;
        var_3 = self._id_02E6 + ( 0, 0, 1 ) - self._id_02E6;
        playfx( level._id_1D55["explode"]["death"][self._id_47FC], var_2, var_3 );
    }

    var_4 = self._id_04A8;
    self _meth_809A( level._id_47DE[var_4]["crash"] );
    wait 0.05;

    if ( isdefined( self._id_534A ) )
        self._id_534A delete();

    _id_A75A::_id_2760();
    self delete();
}

_id_47BD( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    self notify( "flying" );
    self endon( "flying" );
    _id_47D8();
    var_1 = var_0;

    while ( isdefined( var_1._id_04A5 ) )
    {
        var_2 = _id_3F84( var_1._id_04A5, "targetname" );

        if ( isdefined( var_1._id_792D ) && isdefined( var_1._id_7926 ) )
        {
            var_3 = var_1._id_792D;
            var_4 = var_1._id_7926;
        }
        else
        {
            var_3 = 30 + randomint( 20 );
            var_4 = 15 + randomint( 15 );
        }

        if ( isdefined( self._id_50C0 ) && self._id_50C0 )
        {
            wait 0.05;
            continue;
        }

        if ( isdefined( self._id_516F ) && self._id_516F )
        {
            wait 0.05;
            continue;
        }

        self _meth_8283( var_3, var_4 );

        if ( !isdefined( var_2._id_04A5 ) )
        {
            _id_0645( var_2._id_02E6 + self._id_A3C2, 0 );
            self waittill( "near_goal" );
        }
        else
        {
            _id_0645( var_2._id_02E6 + self._id_A3C2, 0 );
            self waittill( "near_goal" );
            self _meth_825C( var_2._id_0041[1] );
            self waittillmatch( "goal" );
        }

        var_1 = var_2;
    }
}

_id_45F0()
{
    self notify( "player_start_aerial_view" );
}

_id_45E2()
{
    self notify( "player_stop_aerial_view" );
}

_id_3FC1()
{
    if ( isdefined( level._id_47FF ) )
        return level._id_47FF;

    var_0 = _id_3F84( "warbird_anchor", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        var_0 = spawnstruct();
        var_0._id_02E6 = ( 0, 0, 2032 );
        var_0._id_04A7 = "warbird_anchor";
    }

    if ( !isdefined( var_0._id_039B ) )
        var_0._id_039B = 3500;

    level._id_47FF = var_0;
    return level._id_47FF;
}

_id_6CB4( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    var_3 = getentarray( "remote_heli_range", "targetname" );

    if ( !isdefined( var_0._id_04FE ) || var_3.size == 0 )
    {
        _id_6CB5( var_0, var_1, var_2 );
        return;
    }

    for (;;)
    {
        var_4 = 0;

        if ( isdefined( level.isoutofboundscustomfunc ) )
            var_4 = [[ level.isoutofboundscustomfunc ]]( var_0, self, var_3 );
        else
            var_4 = var_0 _id_9D75( var_3 );

        if ( var_4 )
        {
            thread _id_6D5E( var_0, var_1, var_2 );

            for (;;)
            {
                waittillframeend;

                if ( !isdefined( var_0._id_0B0E ) || !var_0._id_0B0E )
                {
                    var_4 = 0;

                    if ( isdefined( level.isoutofboundscustomfunc ) )
                        var_4 = [[ level.isoutofboundscustomfunc ]]( var_0, self, var_3 );
                    else
                        var_4 = var_0 _id_9D75( var_3 );

                    if ( !var_4 )
                    {
                        var_0 notify( "staticDone" );
                        thread _id_6D62( var_0, var_1, var_2 );
                        break;
                    }
                }
            }
        }

        waittillframeend;
    }
}

_id_9D75( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( self _meth_80A9( var_2 ) )
            return 1;
    }

    return 0;
}

_id_6D62( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    var_0 endon( "staticStarting" );

    for ( var_0._id_8D6D--; var_0._id_8D6D > 0; var_0._id_8D6D-- )
    {
        _id_6D54( var_0._id_8D6D );

        if ( isdefined( var_0._id_1833 ) )
            var_0._id_1833 _id_6D54( var_0._id_8D6D );

        wait 0.5;
    }

    _id_6D54( 0 );

    if ( isdefined( var_0._id_1833 ) )
        var_0._id_1833 _id_6D54( 0 );
}

_id_6D5E( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    var_0 notify( "staticStarting" );
    var_0 endon( "staticDone" );

    if ( !isdefined( var_0._id_8D6D ) || var_0._id_8D6D == 0 )
        var_0._id_8D6D = 1;

    while ( var_0._id_8D6D < 4 )
    {
        _id_6D54( var_0._id_8D6D );

        if ( isdefined( var_0._id_1833 ) )
            var_0._id_1833 _id_6D54( var_0._id_8D6D );

        if ( isdefined( var_0._id_6C65 ) )
            var_0._id_6C65 _meth_809A( "mp_warbird_outofbounds_warning" );

        if ( isdefined( var_0._id_8D6E ) )
            wait(var_0._id_8D6E);
        else
            wait 2;

        var_0._id_8D6D++;
    }

    var_0 notify( "outOfBounds" );
}

_id_6CB5( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    var_3 = _id_3FC1();
    var_4 = int( var_3._id_039B );

    for (;;)
    {
        var_5 = distance( var_3._id_02E6, var_0._id_02E6 );

        if ( var_5 < var_4 )
            _id_6D54( 0 );
        else if ( var_5 > var_4 && var_5 < var_4 + 500 )
        {
            _id_6D54( 1 );

            if ( isdefined( var_0._id_6C65 ) )
                var_0._id_6C65 _meth_809A( "mp_warbird_outofbounds_warning" );
        }
        else if ( var_5 > var_4 + 500 && var_5 < var_4 + 1000 )
        {
            _id_6D54( 2 );

            if ( isdefined( var_0._id_6C65 ) )
                var_0._id_6C65 _meth_809A( "mp_warbird_outofbounds_warning" );
        }
        else if ( var_5 > var_4 + 1000 && var_5 < var_4 + 1500 )
        {
            _id_6D54( 3 );

            if ( isdefined( var_0._id_6C65 ) )
                var_0._id_6C65 _meth_809A( "mp_warbird_outofbounds_warning" );
        }
        else
        {
            _id_6D54( 4 );
            var_0 notify( "outOfBounds" );
        }

        wait 0.5;
    }
}

_id_6C96()
{
    self notify( "playerUpdateStreakStatic" );
    self _meth_82FB( "ui_streak_overlay_state", 1 );
}

_id_6C89()
{
    self notify( "playerUpdateStreakStatic" );
    self _meth_82FB( "ui_streak_overlay_state", 0 );
}

_id_6D51()
{
    self notify( "playerUpdateStreakStatic" );
    self _meth_82FB( "ui_streak_overlay_state", 7 );
}

_id_6D53()
{
    self endon( "disconnect" );

    if ( self _meth_8447( "ui_streak_overlay_state" ) != 1 )
        return;

    self notify( "playerUpdateStreakStatic" );
    self endon( "playerUpdateStreakStatic" );
    self _meth_82FB( "ui_streak_overlay_state", 2 );
    wait 1;
    self _meth_82FB( "ui_streak_overlay_state", 1 );
}

_id_6D54( var_0 )
{
    var_1 = 1;

    switch ( var_0 )
    {
        case 0:
            var_1 = 1;
            break;
        case 1:
            var_1 = 3;
            break;
        case 2:
            var_1 = 4;
            break;
        case 3:
            var_1 = 5;
            break;
        case 4:
            var_1 = 6;
            break;
        default:
    }

    self notify( "playerUpdateStreakStatic" );
    self _meth_82FB( "ui_streak_overlay_state", var_1 );
}

_id_3F84( var_0, var_1 )
{
    var_2 = getent( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    return _id_A4F0::_id_40F9( var_0, var_1 );
}

_id_3F85( var_0, var_1 )
{
    var_2 = _id_A4F0::_id_40FB( var_0, var_1 );
    var_3 = getentarray( var_0, var_1 );

    if ( var_3.size > 0 )
        var_2 = _id_A4F0::_id_0CDD( var_2, var_3 );

    return var_2;
}

_id_6CB9( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( !isdefined( level._id_9CEB ) )
        return;

    for (;;)
    {
        var_3 = var_0 _id_9D75( level._id_9CEB );

        if ( var_3 )
            var_0 notify( "death" );

        waittillframeend;
    }
}

_id_8157( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2 = getentarray( var_0, var_1 );
        _id_A4F0::_id_0D13( var_2, ::_id_8158 );
    }
    else if ( _id_51FD() )
        _id_8158();
}

_id_8158()
{
    if ( _id_51FD() )
    {
        if ( !isdefined( level._id_9CEB ) )
            level._id_9CEB = [];

        level._id_9CEB[level._id_9CEB.size] = self;
    }
}

_id_51FD()
{
    if ( isdefined( self._id_00AB ) && issubstr( self._id_00AB, "trigger_multiple" ) && isdefined( self._id_03DB ) && self._id_03DB & 16 )
        return 1;

    return 0;
}

_id_9D6F()
{
    return isdefined( self._id_1FC7 ) && self._id_1FC7 < 1;
}

_id_92FD( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( var_0 );
    var_7 = 0;
    _id_2B1E( self );
    self _meth_82D7( "default", 0.25 );
    self _meth_82FB( "ui_killstreak_optic", 0 );

    if ( isbot( self ) )
        return;

    self _meth_82DD( "switch thermal", "+actionslot 1" );
    thread _id_6C71( var_0 );

    for (;;)
    {
        self waittill( "switch thermal" );

        if ( !var_7 )
        {
            _id_3114( self, var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
            self _meth_82FB( "ui_killstreak_optic", 1 );
            self _meth_82F4( "paladin_toggle_flir_plr" );
        }
        else
        {
            _id_2B1E( self );
            self _meth_82FB( "ui_killstreak_optic", 0 );
            self _meth_82F4( "paladin_toggle_flir_plr" );
        }

        var_7 = !var_7;
    }
}

_id_6C71( var_0 )
{
    self endon( "disconnect" );
    self waittill( var_0 );
    self _meth_849C( "switch thermal", "+actionslot 1" );
}

_id_2B1E( var_0 )
{
    var_0 _meth_80B7();
    var_0 notify( "thermal_vision_off" );
    var_0 _meth_84AA();
    var_0._id_6575 = 0;
}

_id_3114( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "faux_spawn" );
    var_0 endon( var_1 );

    if ( !isdefined( var_0._id_6540 ) )
        var_0._id_6540 = 0;

    if ( !isdefined( var_0._id_6575 ) )
        var_0._id_6575 = 0;

    var_0._id_6575 = 1;

    while ( var_0._id_6540 )
        wait 0.05;

    var_0 _meth_80B6();
    var_0 _meth_84A9( 3 );
    var_0 thread _id_802A( var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_802A( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( var_0 );
    self endon( "disconnect" );
    self endon( "thermal_vision_off" );

    for (;;)
    {
        var_7 = self _meth_8340();
        var_8 = _id_38E2( var_3, var_1, var_7 );
        var_9 = _id_38E2( var_4, var_2, var_7 );
        self _meth_84AB( var_8, var_9, var_5, var_6 );
        wait 0.1;
    }
}

_id_38E2( var_0, var_1, var_2 )
{
    return var_0 + var_2 * ( var_1 - var_0 );
}

patchheliloopnode( var_0, var_1 )
{
    var_2 = [];
    var_3 = _id_3F84( "heli_loop_start", "targetname" );

    for (;;)
    {
        if ( _id_A4F0::_id_0CE4( var_2, var_3 ) )
            break;

        if ( var_3._id_02E6 == var_0 )
        {
            var_3._id_02E6 = var_1;
            return;
        }

        var_2[var_2.size] = var_3;
        var_3 = _id_3F84( var_3._id_04A5, "targetname" );
    }
}
