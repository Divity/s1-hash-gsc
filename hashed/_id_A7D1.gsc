// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_A195 = [];
    level._id_A195["Warbird"] = spawnstruct();
    level._id_A195["Warbird"]._id_9C76 = "warbird_player_mp";
    level._id_A195["Warbird"]._id_5D3A = "vehicle_xh9_warbird_low_cloaked_in_out_mp_cloak";
    level._id_A195["Warbird"]._id_4815 = "warbird";
    level._id_A195["Warbird"]._id_0275 = level._id_47D1;
    level._id_5398["warbird"] = ::_id_98CD;
    level._id_53AC["warbird_remote_turret_mp"] = "warbird";
    level._id_53AC["warbird_player_turret_mp"] = "warbird";
    level._id_53AC["warbird_missile_mp"] = "warbird";
    level._id_53AC["paint_missile_killstreak_mp"] = "warbird";

    if ( !isdefined( level._id_89A1 ) )
        level._id_89A1 = [];

    if ( !isdefined( level._id_A189 ) )
        level._id_A189 = 0;

    level._id_1D55["light"]["warbird"] = loadfx( "vfx/lights/air_light_wingtip_red" );
    level._id_1D55["engine"]["warbird"] = loadfx( "vfx/distortion/distortion_warbird_mp" );
    _id_A7B5::_id_5941( "warbird", "vfx/explosion/vehicle_warbird_explosion_midair", ::_id_A18B );
    _id_A7B5::_id_07C7( "warbird", "vfx/explosion/vehicle_warbird_explosion_midair" );
    game["dialog"]["assist_mp_warbird"] = "ks_warbird_joinreq";
    game["dialog"]["pilot_sup_mp_warbird"] = "pilot_sup_mp_warbird";
    game["dialog"]["pilot_aslt_mp_warbird"] = "pilot_aslt_mp_warbird";
    game["dialog"]["ks_warbird_destroyed"] = "ks_warbird_destroyed";
}

_id_98CD( var_0, var_1 )
{
    if ( !_id_1AFD() )
    {
        self _meth_826E( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( _id_A75A::_id_2508() >= _id_A75A::_id_5A56() || level._id_3692 + 1 >= _id_A75A::_id_5A56() )
    {
        self _meth_826E( &"MP_TOO_MANY_VEHICLES" );
        return 0;
    }

    _id_A75A::_id_4C3C();
    level._id_A189 = 1;
    var_2 = _id_A4F0::_id_0CE4( var_1, "warbird_ai_attack" ) || _id_A4F0::_id_0CE4( var_1, "warbird_ai_follow" );

    if ( !var_2 )
    {
        thread _id_6C74();
        var_3 = _id_A7C3::_id_4E00( "warbird" );

        if ( var_3 != "success" )
        {
            _id_A75A::_id_2760();
            level._id_A189 = 0;
            return 0;
        }

        _id_A75A::_id_8347( "warbird" );
    }

    var_3 = _id_8340( var_0, var_1 );

    if ( var_3 )
        _id_A744::_id_5838( "warbird", self._id_02E6 );

    return var_3;
}

_id_6C74()
{
    self endon( "rideKillstreakBlack" );
    self endon( "rideKillstreakFailed" );
    self waittill( "joined_team" );
    level._id_A189 = 0;
    _id_A75A::_id_2760();
}

_id_1AFD()
{
    return !level._id_A189;
}

_id_50E4()
{
    return isdefined( self._id_219A ) && self._id_219A;
}

_id_A18E()
{
    self endon( "death" );
    waittillframeend;
    self _meth_8202( 300, -9, 160 );
}

_id_8324( var_0 )
{
    if ( isbot( self ) )
        return;

    self _meth_82DD( "SwitchVisionMode", "+actionslot 1" );
    self _meth_82DD( "SwitchWeapon", "weapnext" );
    self _meth_82DD( "ToggleControlState", "+activate" );
    self _meth_82DD( "ToggleControlCancel", "-activate" );
    self _meth_82DD( "ToggleControlState", "+usereload" );
    self _meth_82DD( "ToggleControlCancel", "-usereload" );
    self _meth_82DD( "StartFire", "+attack" );
    self _meth_82DD( "StartFire", "+attack_akimbo_accessible" );

    if ( isdefined( var_0 ) && _id_A4F0::_id_0CE4( var_0, "warbird_cloak" ) )
        self _meth_82DD( "Cloak", "+smoke" );
}

_id_2B20( var_0 )
{
    if ( isbot( self ) )
        return;

    self _meth_849C( "SwitchVisionMode", "+actionslot 1" );
    self _meth_849C( "SwitchWeapon", "weapnext" );
    self _meth_849C( "ToggleControlState", "+activate" );
    self _meth_849C( "ToggleControlCancel", "-activate" );
    self _meth_849C( "ToggleControlState", "+usereload" );
    self _meth_849C( "ToggleControlCancel", "-usereload" );
    self _meth_849C( "StartFire", "+attack" );
    self _meth_849C( "StartFire", "+attack_akimbo_accessible" );

    if ( isdefined( var_0 ) && var_0._id_1AC1 )
        self _meth_849C( "Cloak", "+smoke" );
}

_id_8340( var_0, var_1 )
{
    self endon( "warbirdStreakComplete" );
    _id_8324( var_1 );
    self._id_6E61 = 0;
    self._id_219A = 0;
    self._id_A188 = 1;
    var_2 = _id_188A();
    var_3 = _id_3776( var_2 );
    var_3 = _id_75FC( var_3 );
    var_4 = spawnhelicopter( self, var_3._id_02E6, var_3._id_0041, level._id_A195["Warbird"]._id_9C76, level._id_A195["Warbird"]._id_5D3A );
    var_4._id_251D = var_3;

    if ( !isdefined( var_4 ) )
        return 0;

    var_4 thread _id_A151();
    var_4 _meth_8054();
    var_4 thread _id_A18E();
    var_4._id_91C2 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_4._id_04FE = "Warbird";
    var_4._id_47FC = level._id_A195["Warbird"]._id_4815;
    var_4._id_4815 = level._id_A195["Warbird"]._id_4815;
    var_4._id_0E54 = missile_createattractorent( var_4, level._id_47A4, level._id_47A3 );
    var_4._id_56F4 = var_0;
    var_4._id_04A8 = self._id_030D["team"];
    var_4._id_030D["team"] = self._id_030D["team"];
    var_4._id_02E9 = self;
    var_4._id_0275 = level._id_A195["Warbird"]._id_0275;
    var_4._id_A3C2 = ( 0, 0, 0 );
    var_4._id_91C5 = level._id_47F7;
    var_4._id_6F89 = undefined;
    var_4._id_7BF6 = undefined;
    var_4._id_0055 = undefined;
    var_4._id_2525 = "ok";
    var_4._id_680A = 1;
    var_4._id_576F = 0;
    var_4._id_65F2 = 6;
    var_4._id_37EB = 0;
    var_4._id_A2D0 = 0;
    var_4._id_5154 = 1;
    var_4._id_1FBB = 0;
    var_4._id_50E8 = 0;
    var_4._id_517E = 0;
    var_4._id_5D57 = var_1;
    var_4._id_0947 = _id_A4F0::_id_0CE4( var_4._id_5D57, "warbird_ai_attack" );
    var_4._id_0953 = _id_A4F0::_id_0CE4( var_4._id_5D57, "warbird_ai_follow" );
    var_4._id_4712 = var_4._id_0947 || var_4._id_0953;
    var_4._id_1AC1 = _id_A4F0::_id_0CE4( var_4._id_5D57, "warbird_cloak" );
    var_4._id_473F = _id_A4F0::_id_0CE4( var_4._id_5D57, "warbird_rockets" );
    var_4._id_21C9 = _id_A4F0::_id_0CE4( var_4._id_5D57, "warbird_coop_offensive" );
    var_4._id_35AA = _id_A4F0::_id_0CE4( var_4._id_5D57, "warbird_flares" );

    if ( var_4._id_35AA )
        var_4._id_629C = 1;
    else
        var_4._id_629C = 0;

    if ( var_4._id_473F )
        var_4._id_758B = 3;
    else
        var_4._id_758B = 0;

    var_4._id_731C = var_4._id_758B;

    if ( var_4._id_4712 )
    {
        var_4._id_9BC7 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_4._id_9BC7 _meth_804D( var_4 );
        var_4._id_9BC7 _id_A75A::_id_5940( "killstreakRemote", &"MP_WARBIRD_PLAYER_PROMPT", self );
    }

    var_4 thread [[ level._id_5715["warbird"] ]]();
    var_4 _id_A4F0::_id_5920( var_4._id_04A8 );

    if ( !isdefined( level._id_89A1 ) )
        level._id_89A1 = [];

    level._id_89A1 = _id_A4F0::_id_0CDA( level._id_89A1, var_4 );
    var_4 _id_A7B5::_id_084B();
    var_4 thread _id_A7B5::_id_47BC( var_4._id_629C );
    var_4 thread _id_A7B5::_id_47CD( self );
    var_4 thread _id_A7B5::_id_47CC( self );
    var_4 thread _id_A7B5::_id_47CE( self );
    var_5 = 30;

    if ( _id_A4F0::_id_0CE4( var_4._id_5D57, "warbird_time" ) )
        var_5 = 45;

    if ( _id_A75A::_id_05CB( "specialty_blackbox" ) && isdefined( self._id_8A32 ) )
        var_5 *= self._id_8A32;

    var_4._id_31C7 = gettime() + var_5 * 1000;
    var_4 thread _id_A7B5::_id_47CF( var_5 );
    var_4 thread _id_A7B5::_id_47D4();
    var_4 thread _id_A783::_id_7F5F( var_4._id_0275, undefined, ::_id_A190, _id_A7B5::_id_47D3, 1 );
    var_4 thread _id_A16D();
    var_4 thread _id_A7B5::_id_47B7();
    thread _id_5E22( var_4 );
    thread _id_5E9A( var_4 );
    var_4._id_A196 = var_4 _id_897D( "warbird_remote_turret_mp", "vehicle_xh9_warbird_turret_cloaked_inout_killstreak_mp_cloak", "tag_player_mp", 0 );
    var_4._id_A196 _meth_8054();

    if ( !var_4._id_0947 && !var_4._id_0953 )
        var_4._id_A196 _meth_8007( self );

    var_6 = "orbitalsupport_big_turret_mp";

    if ( var_4._id_21C9 )
        var_6 = "warbird_remote_turret_mp";

    var_4._id_A184 = var_4 _id_897D( var_6, "vehicle_xh9_warbird_turret_cloaked_inout_killstreak_mp_cloak", "tag_playerbuddy_mp", 1 );
    var_4._id_A184 _meth_8054();
    thread _id_82FD( var_4 );
    thread _id_A191( var_4, var_4._id_A196 );

    if ( var_4._id_0947 || var_4._id_0953 )
        thread _id_6D18( var_4 );
    else
        thread _id_6C7D( var_4 );

    if ( isdefined( var_4 ) )
    {
        if ( level._id_91E4 )
            level thread _id_464F( var_4, self );

        return 1;
    }
    else
        return 0;
}

_id_6D18( var_0 )
{
    self endon( "warbirdStreakComplete" );
    var_0 waittill( "cloaked" );
    waittillframeend;

    for (;;)
    {
        _id_5E23( var_0 );
        var_0._id_9BC7 waittill( "trigger" );
        thread _id_5979();
        _id_6C7D( var_0 );
    }
}

_id_5979()
{
    self._id_5978 = 1;
    _id_A4F0::_id_A060( "death", "initRideKillstreak_complete", "warbirdStreakComplete" );
    self._id_5978 = 0;
}

_id_A190( var_0, var_1, var_2, var_3 )
{
    _id_A783::_id_64B3( var_0, var_1, var_2, var_3, "warbird_destroyed", "ks_warbird_destroyed", "callout_destroyed_warbird", 1 );
}

_id_82FD( var_0 )
{
    var_0._id_1FC7 = 0;
    _id_1FC5( var_0, 1, 1 );
}

_id_A193( var_0 )
{
    if ( !var_0._id_473F )
        return;

    switch ( var_0._id_731C )
    {
        case 0:
            self _meth_82FB( "ui_warbird_missile", 0 );
            break;
        case 1:
            self _meth_82FB( "ui_warbird_missile", 1 );
            break;
        case 2:
            self _meth_82FB( "ui_warbird_missile", 2 );
            break;
        case 3:
            self _meth_82FB( "ui_warbird_missile", 3 );
            break;
    }
}

_id_833F( var_0, var_1, var_2 )
{
    self endon( "warbirdStreakComplete" );
    var_0 endon( "death" );
    self endon( "ResumeWarbirdAI" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self _meth_8532();
    _id_A7B5::_id_6C89();
    wait 0.05;

    if ( var_1 )
        self _meth_82FB( "ui_warbird_toggle", 2 );
    else
        self _meth_82FB( "ui_warbird_toggle", 1 );

    _id_A7B5::_id_6C96();
    self _meth_82FB( "ui_warbird_cloak", 0 );
    self _meth_82FB( "ui_warbird_countdown", var_0._id_31C7 );

    if ( !var_1 )
        _id_A193( var_0 );

    if ( var_1 && !var_0._id_21C9 )
        self _meth_82FB( "ui_warbird_weapon", 3 );
    else if ( var_1 && var_0._id_21C9 )
        self _meth_82FB( "ui_warbird_weapon", 0 );
    else if ( var_0._id_473F )
        self _meth_82FB( "ui_warbird_weapon", 1 );
    else
        self _meth_82FB( "ui_warbird_weapon", 0 );

    if ( var_1 )
    {
        var_3 = var_2 _meth_81B1();
        self _meth_82FB( "ui_coop_primary_num", var_3 );
    }

    if ( var_0._id_1AC1 && !var_1 )
        self _meth_82FB( "ui_warbird_cloaktext", 1 );
    else
        self _meth_82FB( "ui_warbird_cloaktext", 0 );

    self _meth_82FB( "ui_killstreak_optic", 0 );
}

_id_A191( var_0, var_1 )
{
    self endon( "warbirdStreakComplete" );
    var_0 endon( "death" );

    for (;;)
    {
        var_1._id_4793 = var_1 _meth_844E();
        self _meth_82FB( "ui_warbird_heat", var_1._id_4793 );
        var_2 = 0;

        if ( isdefined( var_1 ) )
            var_2 = var_1 _meth_844F();

        if ( var_2 )
            self _meth_82FB( "ui_warbird_fire", 1 );
        else if ( var_1._id_4793 > 0.7 )
            self _meth_82FB( "ui_warbird_fire", 2 );
        else
            self _meth_82FB( "ui_warbird_fire", 0 );

        while ( var_2 )
        {
            wait 0.05;
            var_2 = var_1 _meth_844F();
            var_1._id_4793 = var_1 _meth_844E();
            self _meth_82FB( "ui_warbird_heat", var_1._id_4793 );
        }

        self notify( "overheatFinished" );
        waittillframeend;
    }
}

_id_897D( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnturret( "misc_turret", self _meth_8180( var_2 ), var_0, 0 );
    var_4._id_0041 = self _meth_8181( var_2 );
    var_4 _meth_80B1( var_1 );
    var_4 _meth_815A( 45.0 );
    var_4 _meth_804D( self, var_2, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_4._id_02E9 = self._id_02E9;
    var_4._id_01E7 = 99999;
    var_4._id_0275 = 1000;
    var_4._id_0102 = 0;
    var_4._id_8F6E = 0;
    var_4._id_8F70 = 0.0;
    var_4 _meth_82C0( 0 );
    var_4 _meth_82C1( 0 );
    var_4._id_04A8 = self._id_04A8;
    var_4._id_030D["team"] = self._id_04A8;

    if ( level._id_91E4 )
        var_4 _meth_8135( self._id_04A8 );

    var_4 _meth_8065( "sentry_manual" );
    var_4 _meth_8103( self._id_02E9 );
    var_4 _meth_8105( 0 );
    var_4._id_1D48 = self;

    if ( var_3 )
    {
        var_4._id_37E6 = spawn( "script_model", self _meth_8180( var_2 ) );
        var_4._id_37E6 _meth_80B1( "tag_origin" );
        var_4._id_37E6 _meth_8446( self, var_2, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }

    return var_4;
}

_id_9129( var_0 )
{
    if ( getdvarint( "camera_thirdPerson" ) )
        _id_A75A::_id_802B( 0 );

    var_0._id_A184._id_02E9 = self;
    var_0._id_A184 _meth_8065( "sentry_manual" );
    var_0._id_A184 _meth_8103( self );
    self _meth_807E( var_0._id_A184, "tag_player", 0, 180, 180, -20, 180, 0 );
    self _meth_80A0( 0 );
    self _meth_80A1( 1 );
    self _meth_80E8( var_0._id_A184, 45, var_0._id_0041[1] );
}

_id_3776( var_0 )
{
    var_1 = _id_A4F0::_id_3CC9( self._id_02E6, var_0 );
    return var_1[0];
}

_id_75FC( var_0 )
{
    var_1 = _id_A7B5::_id_3FC1();
    var_2 = anglestoforward( var_0._id_0041 );
    var_3 = var_1._id_02E6 - var_0._id_02E6;
    var_4 = vectortoangles( var_3 );
    var_0._id_0041 = var_4;
    return var_0;
}

_id_188A()
{
    self endon( "warbirdStreakComplete" );

    if ( !isdefined( level._id_A187 ) )
        level._id_A187 = [];
    else
        return level._id_A187;

    var_0 = _id_A7B5::_id_3F84( "heli_loop_start", "targetname" );
    var_1 = var_0;
    var_2 = _id_A7B5::_id_3FC1();
    var_3 = var_2._id_02E6[2];

    for (;;)
    {
        var_4 = _id_A7B5::_id_3F84( var_1._id_04A5, "targetname" );
        var_1._id_60B4 = var_4;
        var_4._id_6F30 = var_1;
        var_4._id_02E6 = ( var_4._id_02E6[0], var_4._id_02E6[1], var_3 );

        if ( _id_511D( level._id_A187, var_4 ) )
            break;

        level._id_A187 = _id_A4F0::_id_0CDA( level._id_A187, var_4 );
        var_1 = var_4;
    }

    foreach ( var_6 in level._id_A187 )
    {

    }

    return level._id_A187;
}

_id_511D( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        foreach ( var_3 in var_0 )
        {
            if ( var_3 == var_1 )
                return 1;
        }
    }

    return 0;
}

_id_5EDC( var_0 )
{
    self endon( "warbirdStreakComplete" );
    self endon( "ResumeWarbirdAI" );
    thread _id_A7B5::_id_6CB4( var_0, "warbirdStreakComplete", "ResumeWarbirdAI" );
    var_0 waittill( "outOfBounds" );
    wait 2;
    var_0 thread _id_A7B5::_id_47CA();
}

_id_A182( var_0 )
{
    thread _id_A186( var_0 );
    thread _id_A18D( var_0 );
    thread _id_A18F( var_0 );
}

_id_A18F( var_0 )
{
    self endon( "warbirdPlayerControlled" );
    self endon( "warbirdStreakComplete" );

    if ( !isdefined( level.warbirdaiattackbasespeed ) )
        level.warbirdaiattackbasespeed = 40;

    if ( !isdefined( level.warbirdaiattackneargoal ) )
        level.warbirdaiattackneargoal = 100;

    var_1 = level.warbirdaiattackbasespeed;
    var_0 _meth_8283( var_1, var_1 / 4, var_1 / 4 );
    var_0 _meth_825A( level.warbirdaiattackneargoal );
    var_2 = var_0._id_251D;

    if ( !isdefined( var_2 ) )
    {
        var_3 = _id_A4F0::_id_3CC9( var_0._id_02E6, _id_188A() );
        var_4 = var_0._id_02E6;

        for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        {
            var_6 = var_3[var_5]._id_02E6;

            if ( _id_A7B5::_id_3931( var_4, var_6, var_0 ) )
            {
                var_7 = var_6 - var_4;
                var_8 = distance( var_4, var_6 );
                var_9 = rotatevector( var_7, ( 0, 90, 0 ) );
                var_10 = var_4 + var_9 * 100;
                var_11 = var_10 + var_7 * var_8;

                if ( _id_A7B5::_id_3931( var_10, var_11, var_0 ) )
                {
                    var_12 = rotatevector( var_7, ( 0, -90, 0 ) );
                    var_10 = var_4 + var_12 * 100;
                    var_11 = var_10 + var_7 * var_8;

                    if ( _id_A7B5::_id_3931( var_10, var_11, var_0 ) )
                    {
                        var_2 = var_3[var_5];
                        break;
                    }
                }
            }

            waittillframeend;
        }
    }
    else
        var_2 = var_2._id_60B4;

    if ( !isdefined( var_2 ) )
        return;

    for (;;)
    {
        var_13 = 0;

        if ( var_0._id_0953 )
            var_13 = 1;

        var_0 _meth_825B( var_2._id_02E6, var_13 );
        var_0._id_5154 = 1;
        var_0 waittill( "near_goal" );
        var_0._id_251D = var_2;
        var_0._id_5154 = 0;
        var_2 = _id_A0F6( var_0 );
        var_0._id_251D = undefined;
    }
}

_id_A0F6( var_0 )
{
    if ( var_0._id_0953 && isdefined( var_0._id_02E9 ) )
    {
        var_1 = var_0._id_251D;
        var_2 = var_1._id_60B4;
        var_3 = var_1._id_6F30;

        while ( isdefined( var_0._id_02E9 ) )
        {
            var_4 = _func_220( var_0._id_02E9._id_02E6, var_1._id_02E6 );
            var_5 = _func_220( var_0._id_02E9._id_02E6, var_2._id_02E6 );
            var_6 = _func_220( var_0._id_02E9._id_02E6, var_3._id_02E6 );

            if ( var_5 < var_4 && var_5 < var_6 )
                return var_2;
            else if ( var_6 < var_4 && var_6 < var_5 )
                return var_3;

            waittillframeend;
        }
    }
    else
        return var_0._id_251D._id_60B4;
}

_id_A18D( var_0 )
{
    self endon( "warbirdPlayerControlled" );
    self endon( "warbirdStreakComplete" );

    for (;;)
    {
        if ( isdefined( var_0._id_3286 ) )
        {
            _id_5E7A( var_0 );
            var_0._id_A196 _meth_8108();
        }

        waittillframeend;
    }
}

_id_5E7A( var_0 )
{
    self endon( "warbirdPlayerControlled" );
    self endon( "warbirdStreakComplete" );
    var_0 endon( "pickNewTarget" );
    var_0 _meth_8265( var_0._id_3286 );
    var_0._id_A196 _meth_8106( var_0._id_3286 );
    var_0._id_3286 _id_A4F0::_id_A07E( "death", "disconnect" );
    var_0._id_680A = 1;
    var_0._id_576F = 0;
}

_id_A186( var_0 )
{
    self endon( "warbirdPlayerControlled" );
    self endon( "warbirdStreakComplete" );
    thread _id_37C8( var_0 );

    for (;;)
    {
        if ( var_0._id_680A )
        {
            var_1 = level._id_669A;
            var_2 = [];

            foreach ( var_4 in var_1 )
            {
                if ( var_4._id_04A8 != self._id_04A8 )
                    var_2 = _id_A4F0::_id_0CDA( var_2, var_4 );
            }

            if ( var_0._id_0947 )
                var_2 = sortbydistance( var_2, var_0._id_02E6 );
            else
                var_2 = sortbydistance( var_2, self._id_02E6 );

            var_6 = undefined;

            foreach ( var_4 in var_2 )
            {
                if ( !isdefined( var_4 ) )
                    continue;

                if ( !isalive( var_4 ) )
                    continue;

                if ( var_4 _id_A75A::_id_05CB( "specialty_blindeye" ) )
                    continue;

                if ( isdefined( var_4._id_03DD ) && ( gettime() - var_4._id_03DD ) / 1000 < 5 )
                    continue;

                var_6 = var_4;
                var_0._id_3286 = var_6;
                _id_1D26( var_0 );
                break;
            }
        }

        var_0 notify( "LostLOS" );
        wait 0.05;
    }
}

_id_37C8( var_0 )
{
    self endon( "warbirdPlayerControlled" );
    self endon( "warbirdStreakComplete" );
    var_0._id_731C = var_0._id_758B;

    for (;;)
    {
        waittillframeend;

        if ( !isdefined( var_0._id_3286 ) || !isalive( var_0._id_3286 ) || !var_0._id_576F )
            continue;

        if ( var_0._id_473F && var_0._id_731C )
            _id_37C9( var_0 );

        var_0._id_A196 _meth_80EA();
    }
}

_id_37C9( var_0 )
{
    var_1 = var_0 _meth_8180( "tag_missile_right" );
    var_2 = vectornormalize( anglestoforward( var_0._id_0041 ) );
    var_3 = var_0 _meth_8287();
    var_4 = magicbullet( "warbird_missile_mp", var_1 + var_3 / 10, self _meth_80A8() + var_3 + var_2 * 1000, self );
    var_4._id_534A = var_0;
    playfxontag( level._id_1D55["rocketlaunch"]["warbird"], var_0, "tag_missile_right" );
    var_4 _meth_81D9( var_0._id_3286 );
    var_4 _meth_81DC();
    var_0._id_731C--;

    if ( var_0._id_731C <= 0 )
        thread _id_A183( var_0 );

    _id_A0E9( var_0, var_4 );
}

_id_A183( var_0 )
{
    var_0 endon( "warbirdStreakComplete" );
    wait 6;
    var_0._id_731C = var_0._id_758B;
}

_id_A0E9( var_0, var_1 )
{
    var_0._id_3286 endon( "death" );
    var_0._id_3286 endon( "disconnect" );
    var_1 waittill( "death" );
}

_id_1D26( var_0 )
{
    self endon( "warbirdPlayerControlled" );
    self endon( "warbirdStreakComplete" );
    var_0._id_3286 endon( "death" );
    var_0._id_3286 endon( "disconnect" );

    for (;;)
    {
        var_1 = var_0 _meth_8180( "TAG_FLASH1" );
        var_2 = var_0._id_3286 _meth_80A8();
        var_3 = vectornormalize( var_2 - var_1 );
        var_4 = var_1 + var_3 * 20;
        var_5 = bullettrace( var_4, var_2, 0, var_0, 0, 0, 0, 0, 0 );

        if ( !_id_1D1E( var_0 ) && var_5["fraction"] < 1 )
        {
            var_0._id_576F = 0;
            var_0._id_680A = 1;
            var_0._id_3286 = undefined;
            var_0 notify( "pickNewTarget" );
            return;
        }

        var_0._id_576F = 1;
        wait 0.25;
    }
}

_id_1D1E( var_0 )
{
    var_1 = anglestoforward( var_0._id_0041 );
    var_2 = var_0._id_3286._id_02E6 - var_0._id_02E6;
    var_3 = vectordot( var_1, var_2 );
    return var_3 < 0;
}

_id_6C7D( var_0 )
{
    self endon( "warbirdStreakComplete" );
    self._id_6E61 = 1;
    self._id_219A = 1;
    var_0._id_031D = self;
    var_0._id_251D = undefined;
    _id_A75A::_id_6D3C();
    waittillframeend;
    self notify( "warbirdPlayerControlled" );
    var_0._id_517E = 1;
    var_0._id_534F = undefined;
    var_0._id_A196._id_534A = undefined;

    if ( self._id_A188 != 1 )
    {
        _id_A75A::_id_05C0( "killstreak_predator_missile_mp" );
        self _meth_8315( "killstreak_predator_missile_mp" );

        while ( self _meth_8311() != "killstreak_predator_missile_mp" )
            waittillframeend;

        thread _id_6C91( var_0, 0 );
        self waittill( "initRideKillstreak_complete", var_1 );

        if ( !var_1 )
            return;

        _id_A75A::_id_8347( "Warbird" );
    }

    thread _id_833F( var_0 );
    thread _id_5EDC( var_0 );
    thread _id_A051( 0.5 );
    thread _id_834F( 0.5 );
    self _meth_80FE( 0.3, 0.3 );
    _id_6725( var_0 );
    var_0._id_6C65 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0._id_6C65 _meth_80B1( "tag_player" );
    var_0._id_6C65 _meth_8054();
    var_2 = var_0 _meth_8180( "tag_origin" );
    var_3 = var_0 _meth_8181( "tag_origin" );
    var_4 = anglestoforward( var_3 );
    var_2 += var_4 * 165;
    var_2 += ( 0, 0, -10 );
    var_0._id_6C65._id_02E6 = var_2;
    var_0._id_6C65._id_0041 = var_3;
    var_0._id_6C65 _meth_804D( var_0, "tag_player_mp" );
    self _meth_804F();
    var_0 _meth_8444( var_0 );
    thread _id_A192( var_0 );
    self _meth_8206( var_0 );
    thread _id_A2DF( var_0 );
    thread _id_6C77( var_0 );
    var_0._id_A196 _meth_8065( "sentry_manual" );
    self _meth_80E8( var_0._id_A196, 45 );

    while ( self._id_6E61 )
        _id_344D( var_0 );

    _id_A75A::_id_6D35();

    if ( !var_0._id_0947 && !var_0._id_0953 )
        var_0 thread _id_A7B5::_id_47CA();
}

_id_834F( var_0 )
{
    self endon( "disconnect" );
    self endon( "warbirdStreakComplete" );
    wait(var_0);

    if ( isdefined( level._id_A197 ) )
        self _meth_847A( level._id_A197, 0 );
}

_id_73E8( var_0 )
{
    self _meth_847A( "", var_0 );
}

_id_6C91( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = "warbird";

    if ( var_1 )
        var_2 = "coop";

    var_3 = _id_A7C3::_id_4E00( var_2 );

    if ( var_3 != "success" || var_1 && !level._id_A189 || !isdefined( var_0 ) || isdefined( var_0._id_5143 ) && var_0._id_5143 )
    {
        if ( var_1 )
            _id_73E6( var_0, var_3 == "disconnect" );
        else if ( var_3 != "disconnect" )
            _id_6D2E( var_0 );

        self notify( "initRideKillstreak_complete", 0 );
        return;
    }

    self notify( "initRideKillstreak_complete", 1 );
}

_id_344D( var_0 )
{
    self endon( "warbirdStreakComplete" );
    self waittill( "ToggleControlState" );
    thread _id_1AB2();
    self._id_6E61 = 0;
    wait 0.5;
    self notify( "ExitHoldTimeComplete" );
}

_id_1AB2()
{
    self endon( "warbirdStreakComplete" );
    self endon( "ExitHoldTimeComplete" );
    self waittill( "ToggleControlCancel" );
    self._id_6E61 = 1;
}

_id_A051( var_0 )
{
    self endon( "warbirdStreakComplete" );
    self endon( "ResumeWarbirdAI" );
    wait(var_0);
    self _meth_80B8();
    self _meth_82D9( 1.1, 0 );
    var_1 = 135;
    var_2 = 0;
    var_3 = 60;
    var_4 = 0;
    var_5 = 12;
    var_6 = 5;
    _id_A7B5::_id_92FD( "warbirdThermalOff", var_1, var_2, var_3, var_4, var_5, var_6 );
}

waitsetthermalbuddy( var_0 )
{
    self endon( "warbirdStreakComplete" );
    self endon( "ResumeWarbirdAI" );
    wait(var_0);
    self _meth_80B8();
    self _meth_82D9( 1.1, 0 );
    var_1 = 100;
    var_2 = 60;
    var_3 = 512;
    var_4 = 0;
    var_5 = 12;
    var_6 = 5;
    _id_A7B5::_id_92FD( "warbirdThermalOff", var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_6C77( var_0, var_1 )
{
    self endon( "warbirdStreakComplete" );
    self endon( "ResumeWarbirdAI" );

    if ( isdefined( self._id_A188 ) && self._id_A188 == 1 )
    {
        var_0 waittill( "cloaked" );
        _id_A4F0::_id_A068( "ForceUncloak", "Cloak", "ResumeWarbirdAI" );
        _id_907C( var_0 );
        var_0._id_6C65 _id_69C1( "warbird_cloak_deactivate" );
    }

    for (;;)
    {
        thread _id_6C75( var_0 );
        thread _id_6C76( var_0 );

        if ( var_0._id_1FBB != 0 )
        {
            self _meth_82FB( "ui_warbird_cloaktext", 3 );
            wait(var_0._id_1FBB);
        }

        thread _id_1FC6();

        if ( var_0._id_1AC1 )
            self _meth_82FB( "ui_warbird_cloaktext", 1 );

        self waittill( "Cloak" );
        self notify( "ActivateCloak" );
        var_0 _id_69C1( "warbird_cloak_activate" );
        self waittill( "CloakCharged" );
    }
}

_id_6C75( var_0 )
{
    self endon( "warbirdStreakComplete" );
    self endon( "ResumeWarbirdAI" );
    self waittill( "ActivateCloak" );
    var_1 = 10000;
    self _meth_82FB( "ui_warbird_cloaktime", var_1 + gettime() );
    _id_9079( var_0 );
    thread _id_1FBA( var_0 );
    self _meth_82FB( "ui_warbird_cloaktext", 2 );
    var_0._id_1FBB = 5;
    thread _id_1FBB( var_0 );
    thread _id_6C78( var_0 );
}

_id_6C76( var_0 )
{
    self endon( "warbirdStreakComplete" );
    self waittill( "UnCloak" );
    thread _id_6A34( var_0 );
    _id_907C( var_0 );
    self _meth_82FB( "ui_warbird_cloaktext", 3 );
    thread _id_1FBC( var_0 );
}

_id_1FBB( var_0 )
{
    self endon( "warbirdStreakComplete" );
    self waittill( "UnCloak" );

    while ( var_0._id_1FBB > 0 )
    {
        var_0._id_1FBB -= 0.5;
        wait 0.5;
    }

    var_0._id_1FBB = 0;
    self notify( "CloakCharged" );
}

_id_6C78( var_0 )
{
    self endon( "warbirdStreakComplete" );
    var_1 = gettime();
    _id_A4F0::_id_A06B( 10, "ForceUncloak", "Cloak", "ResumeWarbirdAI" );
    var_2 = gettime();
    var_3 = max( var_2 - var_1, 5000 );
    var_0._id_1FBB = var_3 / 1000;
    var_4 = gettime() + var_3;
    self _meth_82FB( "ui_warbird_cloakdur", var_4 );
    self notify( "UnCloak" );
}

_id_9079( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        thread _id_1FC5( var_0, 1 );
        missile_deleteattractor( var_0._id_0E54 );
        self _meth_82FB( "ui_warbird_cloak", 1 );
        thread _id_5E3D( var_0 );
    }
}

_id_907C( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        thread _id_1FC5( var_0, 0 );
        var_0._id_0E54 = missile_createattractorent( var_0, level._id_47A4, level._id_47A3 );
        self _meth_82FB( "ui_warbird_cloak", 0 );
    }
}

_id_1FC5( var_0, var_1, var_2 )
{
    var_0 notify( "cloaking_transition" );
    var_0 endon( "cloaking_transition" );
    var_0 endon( "warbirdStreakComplete" );

    if ( var_1 )
    {
        if ( var_0._id_1FC7 == -2 )
            return;

        var_0._id_1FC7 = -1;
        var_0 _meth_844B();
        var_0._id_A196 _meth_844B();

        if ( var_0._id_21C9 )
            var_0._id_A184 _meth_844B();

        var_0 _meth_848F( 0 );

        if ( !isdefined( var_2 ) || !var_2 )
            wait 0.2;
        else
            wait 1.5;

        var_0 _meth_8053();
        var_0._id_A196 _meth_8053();

        if ( var_0._id_21C9 )
            var_0._id_A184 _meth_8053();

        var_0._id_1FC7 = -2;
        var_0 notify( "cloaked" );
        var_0 _id_8F04();
    }
    else
    {
        if ( var_0._id_1FC7 == 2 )
            return;

        var_0._id_1FC7 = 1;
        var_0 _meth_844C();
        var_0 _meth_848F( 1 );
        var_0._id_A196 _meth_844C();

        if ( var_0._id_21C9 )
            var_0._id_A184 _meth_844C();

        wait 2.2;
        var_0._id_1FC7 = 2;
        var_0 _id_6DE8();
    }
}

_id_1FBC( var_0 )
{
    self endon( "CloakCharged" );
    self endon( "warbirdStreakComplete" );
    self endon( "ResumeWarbirdAI" );

    for (;;)
    {
        self waittill( "Cloak" );
        var_0._id_6C65 _id_69C1( "warbird_cloak_notready" );
        wait 1;
    }
}

_id_1FC6()
{

}

_id_1FBA( var_0 )
{

}

_id_6A34( var_0 )
{
    var_0._id_6C65 _id_69C1( "warbird_cloak_deactivate" );
}

_id_1FC8( var_0, var_1 )
{
    if ( isdefined( var_0 ) && var_0._id_50E8 == 0 )
    {
        if ( isdefined( var_1 ) )
            var_1 notify( "ActivateCloak" );

        thread _id_1FC5( var_0, 1 );
        missile_deleteattractor( var_0._id_0E54 );
    }
}

_id_5E3D( var_0 )
{
    self endon( "UnCloak" );
    self endon( "warbirdStreakComplete" );
    self endon( "ResumeWarbirdAI" );
    wait 1;
    var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5 );
    self notify( "ForceUncloak" );
}

_id_A192( var_0 )
{
    self endon( "ResumeWarbirdAI" );
    self endon( "warbirdStreakComplete" );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5 );

        if ( var_5 == "MOD_PROJECTILE" )
        {
            earthquake( 0.75, 1, var_0._id_02E6, 1000 );
            self _meth_8182( "frag_grenade_mp", 0.5 );
        }
    }
}

_id_9B62( var_0 )
{
    self endon( "warbirdStreakComplete" );
    level endon( "ResumeWarbirdAI" );

    for (;;)
    {
        var_1 = self _meth_833B();
        var_2 = var_0._id_6C65._id_02E6;
        var_3 = anglestoforward( var_1 );
        var_4 = var_2 + var_3 * 4000;
        var_0._id_91C2._id_02E6 = var_4;
        wait 0.05;
    }
}

_id_5EDD( var_0 )
{
    self endon( "warbirdStreakComplete" );
    self endon( "ResumeWarbirdAI" );
    self._id_2503 = "turret";
    var_0._id_A196 _meth_8179();

    if ( !var_0._id_473F )
        return;

    for (;;)
    {
        self waittill( "SwitchWeapon" );

        if ( self._id_2503 == "turret" )
        {
            self._id_2503 = "missiles";
            var_0._id_A196 _meth_815C();
            self _meth_82FB( "ui_warbird_weapon", 2 );
        }
        else if ( self._id_2503 == "missiles" )
        {
            self._id_2503 = "turret";
            var_0._id_A196 _meth_8179();
            self _meth_82FB( "ui_warbird_weapon", 1 );
        }

        self _meth_82F4( "warbird_weapon_cycle_plr" );
    }
}

_id_A2DF( var_0 )
{
    if ( var_0._id_473F )
        thread _id_37EF( var_0 );

    thread _id_5EDD( var_0 );
    thread _id_9B62( var_0 );
    thread _id_39A7( var_0 );
}

_id_A0EE( var_0 )
{
    var_0 endon( "warbirdStreakComplete" );
    var_0._id_A196 endon( "turret_fire" );

    if ( var_0._id_21C9 )
        var_0._id_A184 endon( "turret_fire" );

    level waittill( "forever" );
}

_id_39A7( var_0 )
{
    level endon( "game_ended" );
    self endon( "warbirdStreakComplete" );

    for (;;)
    {
        _id_A0EE( var_0 );
        self notify( "ForceUncloak" );
        wait 0.05;
    }
}

_id_37F0( var_0 )
{
    var_0 endon( "warbirdStreakComplete" );
    self endon( "warbirdStreakComplete" );
    self endon( "warbird_player_removed" );

    for (;;)
    {
        self waittill( "StartFire" );
        _id_A7B5::_id_6C9D( var_0._id_A184._id_37E6 );
        playfxontag( level._id_1D55["rocketlaunch"]["warbird"], var_0, "tag_origin" );
        wait 2;
    }
}

_id_37EF( var_0 )
{
    self endon( "ResumeWarbirdAI" );
    self endon( "warbirdStreakComplete" );
    var_0._id_731C = var_0._id_758B;

    for (;;)
    {
        if ( self._id_444D == "bot0" || self._id_444D == "bot1" || self._id_444D == "bot2" || self._id_444D == "bot3" )
            wait 3;
        else
            self waittill( "StartFire" );

        if ( self._id_2503 == "missiles" || self._id_444D == "bot0" || self._id_444D == "bot1" || self._id_444D == "bot2" || self._id_444D == "bot3" )
        {
            earthquake( 0.4, 1, var_0._id_02E6, 1000 );
            self _meth_80AD( "ac130_105mm_fire" );
            var_1 = var_0 _meth_8180( "tag_missile_right" );
            var_2 = vectornormalize( anglestoforward( self _meth_833B() ) );
            var_3 = var_0 _meth_81B2();
            var_4 = magicbullet( "warbird_missile_mp", var_1 + var_3 / 10, self _meth_80A8() + var_3 + var_2 * 1000, self );
            playfxontag( level._id_1D55["rocketlaunch"]["warbird"], var_0, "tag_missile_right" );
            var_4 _meth_81D9( var_0._id_91C2 );
            var_4 _meth_81DC();
            var_0._id_731C--;
            self notify( "ForceUncloak" );
            _id_A193( var_0 );

            if ( var_0._id_731C == 0 )
            {
                thread _id_A194( var_0, 6 );
                wait 6;
                var_0._id_731C = var_0._id_758B;
                self notify( "rocketReloadComplete" );
                _id_A193( var_0 );
            }
            else
                wait 0.05;
        }
    }
}

_id_A194( var_0, var_1 )
{
    self endon( "rocketReloadComplete" );
    self endon( "ResumeWarbirdAI" );
    self endon( "warbirdStreakComplete" );
    var_2 = 3;
    self _meth_82F4( "warbird_missile_reload_bed" );
    wait 0.5;

    for (;;)
    {
        self _meth_82F4( "warbird_missile_reload" );
        wait(var_1 / var_2);
    }
}

_id_464F( var_0, var_1 )
{
    var_2 = "warbird_coop_defensive";
    var_3 = &"MP_JOIN_WARBIRD_DEF";
    var_4 = "pilot_sup_mp_warbird";
    var_5 = "copilot_sup_mp_paladin";

    if ( var_0._id_21C9 )
    {
        var_2 = "warbird_coop_offensive";
        var_3 = &"MP_JOIN_WARBIRD_OFF";
        var_4 = "pilot_aslt_mp_warbird";
        var_5 = "copilot_aslt_mp_paladin";
    }

    for (;;)
    {
        var_6 = _id_A7BB::_id_7017( var_1._id_04A8, var_3, var_2, "assist_mp_warbird", var_4, var_1, var_5 );
        level thread _id_A21B( var_6, var_0, var_1 );
        var_7 = _id_A0E3( var_0, "buddyJoinedStreak" );
        _id_A7BB::_id_8EF9( var_6 );

        if ( !isdefined( var_7 ) )
            return;

        var_7 = _id_A0E3( var_0, "buddyLeftWarbird" );

        if ( !isdefined( var_7 ) )
            return;
    }
}

_id_A0E3( var_0, var_1 )
{
    var_0 endon( "warbirdStreakComplete" );
    var_0 waittill( var_1 );
    return 1;
}

_id_A21B( var_0, var_1, var_2 )
{
    var_1 endon( "warbirdStreakComplete" );
    var_3 = _id_A7BB::_id_A0C9( var_0 );
    var_1 notify( "buddyJoinedStreak" );
    var_3 thread _id_1835( var_1, var_2 );
}

_id_1835( var_0, var_1 )
{
    var_0 endon( "warbirdStreakComplete" );
    self endon( "warbirdStreakComplete" );
    self endon( "warbird_player_removed" );
    thread _id_A191( var_0, var_0._id_A184 );
    var_0._id_1833 = self;
    self._id_219A = 1;
    thread _id_6C91( var_0, 1 );
    self waittill( "initRideKillstreak_complete", var_2 );

    if ( !var_2 )
        return;

    _id_A75A::_id_8347( "Warbird" );
    _id_A75A::_id_6D3C();
    thread _id_833F( var_0, 1, var_1 );
    thread _id_5E32( var_0 );
    thread _id_5E31( var_0 );
    thread waitsetthermalbuddy( 0.5 );
    thread _id_834F( 0.5 );
    _id_6725( var_0 );
    thread _id_A192( var_0 );
    _id_9129( var_0 );
    _id_8324();

    if ( !var_0._id_21C9 )
        thread _id_37F0( var_0 );

    if ( !isbot( self ) )
        thread _id_73E7( var_0 );
}

_id_73E6( var_0, var_1 )
{
    self notify( "warbird_player_removed" );

    if ( !var_1 )
    {
        _id_6D34();
        self _meth_82D9( 0, 0 );
        self notify( "warbirdThermalOff" );
        _id_A7B5::_id_2B1E( self );
        thread _id_73E8( 1.5 );
        self _meth_80B9();

        if ( isdefined( var_0._id_A184 ) && _id_50E4() )
            self _meth_80E9( var_0._id_A184 );

        self._id_219A = undefined;
        self _meth_831E();
        self _meth_804F();
        _id_A7BB::_id_6D2F();
        self _meth_80FF();
        _id_2B20( var_0 );
        _id_748E( var_0 );

        if ( _id_A75A::_id_51E0() )
            _id_A75A::_id_1F0D();

        _id_A75A::_id_6D2C();
        _id_A75A::_id_6D35();
    }

    var_0 notify( "buddyLeftWarbird" );
    var_0._id_1833 = undefined;
}

_id_5E32( var_0 )
{
    self endon( "disconnect" );
    var_0 _id_A4F0::_id_A060( "leaving", "death", "crashing" );
    self notify( "warbirdStreakComplete" );
    self notify( "StopWaitForDisconnect" );
    waitframe;
    _id_A79A::_id_A0D4();
    thread _id_73E6( var_0, 0 );
}

_id_5E31( var_0 )
{
    self endon( "StopWaitForDisconnect" );
    self waittill( "disconnect" );
    thread _id_73E6( var_0, 1 );
}

_id_73E7( var_0 )
{
    self endon( "warbird_player_removed" );

    for (;;)
    {
        self waittill( "ToggleControlState" );
        thread _id_8D42( var_0 );
        thread _id_1ABF();
    }
}

_id_8D42( var_0 )
{
    self endon( "warbird_player_removed" );
    self endon( "ToggleControlCancel" );
    self._id_A153 = 1;
    wait 0.5;

    if ( self._id_A153 == 1 )
        thread _id_73E6( var_0, 0 );
}

_id_1ABF()
{
    self endon( "warbird_player_removed" );
    self waittill( "ToggleControlCancel" );
    self._id_A153 = 0;
}

_id_5E23( var_0, var_1 )
{
    self endon( "warbirdStreakComplete" );
    self._id_A188 = 0;
    self notify( "ResumeWarbirdAI" );
    self notify( "warbirdThermalOff" );
    var_0._id_517E = 0;
    thread _id_1FC5( var_0, 0 );
    var_0._id_A196 _meth_8065( "auto_nonai" );
    _id_6D34();
    waitframe;
    thread _id_A182( var_0 );
    var_0._id_534F = gettime();
    var_0._id_A196._id_534A = var_0;
    var_0._id_031D = undefined;

    if ( _id_A75A::_id_51E0() )
        _id_6D2E( var_0 );

    waittillframeend;
}

_id_5E22( var_0 )
{
    self endon( "disconnect" );
    thread _id_1D01( var_0 );
    var_1 = var_0 _id_A4F0::_id_A067( "leaving", "death", "crashing" );
    _id_6D31( var_0 );
    level thread _id_A185( var_0, self, var_1 != "death" );
}

_id_A185( var_0, var_1, var_2 )
{
    level._id_89A1 = _id_A4F0::_id_0CF6( level._id_89A1, var_0 );
    level._id_A189 = 0;

    if ( isdefined( var_0._id_9BC7 ) )
        var_0._id_9BC7 _id_A75A::_id_593F();

    thread _id_1FC8( var_0, var_1 );

    if ( isdefined( var_0._id_0E54 ) )
        missile_deleteattractor( var_0._id_0E54 );

    if ( isdefined( var_0._id_6C65 ) )
        var_0._id_6C65 delete();

    var_0._id_3286 = undefined;

    if ( var_2 )
        var_0 waittill( "death" );
    else
        waitframe;

    var_3 = _id_A79A::_id_A0D4();

    if ( var_3 != 0 )
        waittillframeend;

    var_0._id_A196 delete();

    if ( isdefined( var_0._id_A184 ) )
    {
        if ( isdefined( var_0._id_A184._id_37E6 ) )
            var_0._id_A184._id_37E6 delete();

        var_0._id_A184 delete();
    }

    if ( isdefined( var_0._id_9BC7 ) )
        var_0._id_9BC7 delete();
}

_id_6D31( var_0 )
{
    self notify( "warbirdStreakComplete" );
    var_0 notify( "warbirdStreakComplete" );
    waitframe;
    _id_6D34();

    if ( var_0._id_517E && !_id_A75A::_id_5128() )
    {
        _id_6D2E( var_0 );
        var_0._id_517E = 0;
    }

    _id_2B20( var_0 );
    self notify( "StopWaitForDisconnect" );
}

_id_6D2E( var_0 )
{
    self _meth_82D9( 0, 0 );
    _id_A7B5::_id_2B1E( self );
    self _meth_80B9();
    thread _id_73E8( 1.5 );
    self _meth_8207();

    if ( isdefined( var_0._id_A196 ) && _id_50E4() )
        self _meth_80E9( var_0._id_A196 );

    self._id_219A = undefined;
    self._id_6E61 = undefined;
    self _meth_831E();
    self _meth_804F();

    if ( _id_A75A::_id_51E0() )
        _id_A75A::_id_1F0D();
    else
    {
        var_1 = self _meth_8311();

        if ( var_1 == "none" || _id_A75A::_id_513A( var_1 ) )
            self _meth_8315( _id_A4F0::_id_3FFB() );

        _id_A75A::_id_6D2C();
    }

    thread _id_6C81();

    if ( var_0._id_4712 )
        _id_A7C3::_id_9125( "killstreak_predator_missile_mp" );

    self _meth_8322();
    self _meth_80FF();

    if ( !isdefined( var_0._id_5143 ) || !var_0._id_5143 )
        _id_748E( var_0 );

    _id_A75A::_id_6D35();
}

_id_6C81()
{
    self endon( "disconnect" );
    _id_A75A::_id_3A30( 1 );
    wait 0.5;
    _id_A75A::_id_3A30( 0 );
}

_id_1D01( var_0 )
{
    var_0 _id_A4F0::_id_A060( "crashing", "death" );
    var_0._id_50E8 = 1;
}

_id_5E9A( var_0 )
{
    self endon( "StopWaitForDisconnect" );
    self waittill( "disconnect" );
    var_0 notify( "warbirdStreakComplete" );
    self notify( "warbirdStreakComplete" );
    self notify( "warbirdThermalOff" );
    var_0 thread _id_A7B5::_id_47CA();
    level thread _id_A185( var_0, self, 1 );
}

_id_69C1( var_0 )
{
    self _meth_809A( var_0 );
}

_id_A16D()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "crashing" );
    self._id_2525 = "ok";
    self._id_55F6 = "ok";
    self _meth_8002( 3 );
    var_0 = 3;
    self _meth_8002( var_0 );

    for (;;)
    {
        if ( self._id_0102 >= self._id_0275 * 0.33 && var_0 == 3 )
        {
            var_0 = 2;
            self _meth_8002( var_0 );
            self._id_2525 = "light smoke";
            playfxontag( level._id_1D55["damage"]["light_smoke"], self, "tag_static_main_rotor_l" );
        }
        else if ( self._id_0102 >= self._id_0275 * 0.66 && var_0 == 2 )
        {
            var_0 = 1;
            self _meth_8002( var_0 );
            self._id_2525 = "heavy smoke";
            stopfxontag( level._id_1D55["damage"]["light_smoke"], self, "tag_static_main_rotor_l" );
            playfxontag( level._id_1D55["damage"]["heavy_smoke"], self, "tag_static_main_rotor_l" );
        }
        else if ( self._id_0102 >= self._id_0275 )
        {
            var_0 = 0;
            self _meth_8002( var_0 );

            if ( isdefined( self._id_54BD ) && self._id_54BD )
                thread _id_A7B5::_id_47B8( 1 );
            else
            {
                playfxontag( level._id_1D55["damage"]["on_fire"], self, "TAG_TAIL_FX" );
                thread _id_A7B5::_id_47A8();
            }
        }

        wait 0.05;
    }
}

_id_6D34()
{
    self _meth_82FB( "ui_warbird_heat", 0 );
    self _meth_82FB( "ui_warbird_flares", 0 );
    self _meth_82FB( "ui_warbird_fire", 0 );
    self _meth_82FB( "ui_warbird_cloak", 0 );
    self _meth_82FB( "ui_warbird_cloaktime", 0 );
    self _meth_82FB( "ui_warbird_cloakdur", 0 );
    self _meth_82FB( "ui_warbird_countdown", 0 );
    self _meth_82FB( "ui_warbird_missile", -1 );
    self _meth_82FB( "ui_warbird_weapon", 0 );
    self _meth_82FB( "ui_warbird_cloaktext", 0 );
    self _meth_82FB( "ui_warbird_toggle", 0 );
    self _meth_82FB( "ui_coop_primary_num", 0 );
    _id_A7B5::_id_6C89();
    self _meth_8533();
}

_id_6DE8()
{
    playfxontag( level._id_1D55["engine"]["warbird"], self, "tag_static_main_rotor_r" );
    playfxontag( level._id_1D55["engine"]["warbird"], self, "tag_static_main_rotor_l" );

    if ( isdefined( self._id_031D ) )
        self._id_031D _id_6725( self );

    if ( isdefined( self._id_1833 ) )
        self._id_1833 _id_6725( self );
}

_id_8F04()
{
    stopfxontag( level._id_1D55["engine"]["warbird"], self, "tag_static_main_rotor_r" );
    stopfxontag( level._id_1D55["engine"]["warbird"], self, "tag_static_main_rotor_l" );
}

_id_6725( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    _func_2AC( level._id_1D55["engine"]["warbird"], var_0, "tag_static_main_rotor_r", self );
    _func_2AC( level._id_1D55["engine"]["warbird"], var_0, "tag_static_main_rotor_l", self );
}

_id_748E( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( _id_A7B5::_id_9D6F() )
        return;

    playfxontagforclients( level._id_1D55["engine"]["warbird"], var_0, "tag_static_main_rotor_r", self );
    playfxontagforclients( level._id_1D55["engine"]["warbird"], var_0, "tag_static_main_rotor_l", self );
}

_id_A151()
{
    if ( isdefined( self ) )
        return;
}

_id_A18B()
{
    self endon( "death" );

    for (;;)
    {
        self._id_02E9 waittill( "UnCloak" );
        playfxontag( level._id_1D55["light"]["warbird"], self, "tag_light_body_L" );
        wait 0.05;
        playfxontag( level._id_1D55["light"]["warbird"], self, "tag_light_body_R" );
        wait 0.05;
        playfxontag( level._id_1D55["light"]["warbird"], self, "tag_light_tail" );
        self._id_02E9 waittill( "ActivateCloak" );
        stopfxontag( level._id_1D55["light"]["warbird"], self, "tag_light_body_L" );
        wait 0.05;
        stopfxontag( level._id_1D55["light"]["warbird"], self, "tag_light_body_R" );
        wait 0.05;
        stopfxontag( level._id_1D55["light"]["warbird"], self, "tag_light_tail" );
    }
}
