// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_51C2()
{
    if ( isdefined( self._id_9078 ) )
        return 1;

    return 0;
}

_id_51CE()
{
    var_0 = _id_A7B2::_id_2242();
    var_0[self._id_566A]--;
    var_0[self._id_5289]++;
    return var_0[self._id_5289] - var_0[self._id_566A] < 2;
}

_id_510B( var_0, var_1 )
{
    if ( !level._id_91E4 )
        return 0;

    if ( !isdefined( var_1 ) )
        return 0;

    if ( !isplayer( var_1 ) && !isdefined( var_1._id_04A8 ) )
        return 0;

    if ( var_0._id_04A8 != var_1._id_04A8 )
        return 0;

    if ( var_0 == var_1 )
        return 0;

    return 1;
}

_id_5361( var_0 )
{
    if ( !isplayer( var_0 ) )
        return 0;

    if ( var_0 != self )
        return 0;

    return 1;
}

_id_467F()
{
    if ( !level._id_91E4 )
        return;

    if ( self._id_5289 == "spectator" || !_id_51CE() )
    {
        self thread [[ level._id_64FB ]]( "suicide" );
        _id_A75A::_id_4C2B( "suicides", 1 );
        self._id_8FA9 = _id_A75A::_id_407F( "suicides" );
    }
}

_id_468D( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_04A8 ) )
    {
        _id_467E( var_2, var_3 );
        return;
    }

    if ( level._id_91E4 && var_0._id_04A8 != self._id_04A8 || !level._id_91E4 )
    {
        if ( isdefined( level._id_64BC ) && ( isplayer( var_0 ) || isagent( var_0 ) ) && var_0._id_04A8 != "spectator" )
            [[ level._id_64BC ]]( self, var_0, var_1 );
    }
}

_id_41FF( var_0 )
{
    var_1 = int( max( 0, _id_A78B::_id_05B8( self ) - var_0 ) );
    _id_A78B::_id_063D( self, var_1 );
}

_id_467E( var_0, var_1 )
{
    self thread [[ level._id_64FB ]]( "suicide" );
    _id_A75A::_id_4C2B( "suicides", 1 );
    self._id_8FA9 = _id_A75A::_id_407F( "suicides" );

    if ( !_id_A75A::_id_6FCD() && self._id_8FA9 == 15 )
        thread delayedsuicidekick();

    var_2 = _id_A7B3::_id_413F( "game", "suicidepointloss" );
    _id_41FF( var_2 );

    if ( var_0 == "MOD_SUICIDE" && var_1 == "none" && isdefined( self._id_9337 ) )
        self._id_55A2 = gettime();

    if ( isdefined( level._id_64EA ) )
        [[ level._id_64EA ]]( self );

    if ( isdefined( self._id_3A95 ) )
        self _meth_826E( &"MP_FRIENDLY_FIRE_WILL_NOT" );

    self._id_030D["suicideSpawnDelay"] = _id_A7B3::_id_413F( "game", "suicidespawndelay" );
}

delayedsuicidekick()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait(randomintrange( 1, 60 ));
    kick( self _meth_81B1() );
}

_id_465E( var_0 )
{
    var_0 thread [[ level._id_64FB ]]( "teamkill" );
    var_0._id_030D["teamkills"] += 1.0;
    var_0._id_030D["totalTeamKills"] += 1.0;
    var_0._id_91EC++;

    if ( _id_A7B3::_id_413F( "team", "teamkillpointloss" ) )
    {
        var_1 = _id_A7AA::_id_40BF( "kill" );
        var_0 _id_41FF( var_1 );
    }

    var_2 = var_0 _id_A7A7::_id_91EB();

    if ( var_2 > 0 )
    {
        var_0._id_030D["teamKillPunish"] = 1;
        var_0 _id_A75A::_id_066F();
    }

    var_3 = _id_A7B3::_id_413F( "team", "teamkillkicklimit" );

    if ( var_3 > 0 )
    {
        var_4 = var_0._id_030D["totalTeamKills"];

        if ( var_4 >= var_3 )
            thread _id_3AA7( var_0 );
    }
}

_id_3AA7( var_0 )
{
    waitframe;
    kick( var_0 _meth_81B1(), "EXE_PLAYERKICKED_TEAMKILL" );
    level thread _id_A789::_id_9B17();
}

_id_4668( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 thread _id_A72E::_id_535D( var_0, self, var_3, var_4, var_2 );
    var_1 _meth_83C6();

    if ( var_4 == "MOD_HEAD_SHOT" )
    {
        var_1 _meth_82F4( "mp_headshot_killer" );
        self _meth_809A( "mp_headshot_killed" );
    }

    var_1 thread _id_A72E::_id_535E( self, var_3, var_4 );
    var_5 = var_1._id_030D["cur_kill_streak"];

    if ( isalive( var_1 ) )
    {
        if ( _id_A75A::_id_514D( var_4 ) && !var_1 _id_A75A::_id_512E() || var_1 _id_A75A::_id_5377( var_3 ) )
        {
            var_1._id_030D["cur_kill_streak"]++;
            var_1._id_023E = var_1._id_030D["cur_kill_streak"];
            var_1 notify( "kill_streak_increased" );

            if ( !_id_A75A::_id_513A( var_3 ) )
                var_1._id_030D["cur_kill_streak_for_nuke"]++;

            var_6 = 30;

            if ( var_1 _id_A75A::_id_05CB( "specialty_hardline" ) )
                var_6--;

            if ( !_id_A75A::_id_513A( var_3 ) && var_1._id_030D["cur_kill_streak_for_nuke"] == var_6 )
            {
                var_7 = var_1 _id_A7C3::getnextkillstreakslotindex( "nuke", 0 );
                var_1 thread _id_A7C3::_id_41EB( "nuke", 0, 1, var_1 );
                var_1 thread _id_A79C::_id_53A6( "nuke", var_6, undefined, undefined, var_7 );
            }
        }

        var_1 _id_A75A::_id_7FE5( "longestkillstreak", var_1._id_030D["cur_kill_streak"] );

        if ( var_1._id_030D["cur_kill_streak"] > var_1 _id_A75A::_id_407F( "longestStreak" ) )
            var_1 _id_A75A::_id_7FDB( "longestStreak", var_1._id_030D["cur_kill_streak"] );
    }

    var_1._id_030D["cur_death_streak"] = 0;

    if ( var_1._id_030D["cur_kill_streak"] > var_1 _id_A7A4::_id_8D64( "round", "killStreak" ) )
        var_1 _id_A7A4::_id_8D74( "round", "killStreak", var_1._id_030D["cur_kill_streak"] );

    if ( var_1 _id_A75A::_id_7136() )
    {
        if ( var_1._id_030D["cur_kill_streak"] > var_1._id_5339 )
        {
            var_1 _id_A7A4::_id_8D72( "killStreak", var_1._id_030D["cur_kill_streak"] );
            var_1._id_5339 = var_1._id_030D["cur_kill_streak"];
        }
    }

    var_8 = _id_A7B3::_id_413F( "game", "deathpointloss" );
    _id_41FF( var_8 );
    level notify( "player_got_killstreak_" + var_1._id_030D["cur_kill_streak"], var_1 );
    var_1 notify( "got_killstreak", var_1._id_030D["cur_kill_streak"] );
    var_1 notify( "killed_enemy" );

    if ( isdefined( level._id_64BC ) && var_1._id_030D["team"] != "spectator" )
        [[ level._id_64BC ]]( self, var_1, var_0 );

    if ( !level._id_91E4 )
    {
        self._id_0E34 = [];
        return;
    }

    level thread _id_A780::_id_7824( var_1, "kill", 0.75 );

    if ( isdefined( self._id_5573 ) && isdefined( self._id_5574 ) && self._id_5573 != var_1 )
    {
        if ( gettime() - self._id_5574 < 5000 )
            self._id_5573 thread _id_A72E::_id_6FF1( self, "assist_riot_shield" );
    }

    if ( !_id_A75A::_id_513A( var_3 ) )
    {
        if ( isdefined( self._id_4FFF ) && self._id_4FFF && isdefined( self._id_94B5 ) )
        {
            if ( self._id_94B5 != var_1 )
                self._id_94B5 thread _id_A7C5::_id_6D27( self );
        }

        var_9 = [];

        foreach ( var_11 in level._id_99E1[var_1._id_04A8] )
        {
            if ( !isdefined( var_11._id_02E9 ) || var_11._id_02E9 == var_1 )
                continue;

            if ( _id_A4F0::_id_0CE4( var_9, var_11._id_02E9 ) )
                continue;

            var_9[var_9.size] = var_11._id_02E9;

            if ( var_11._id_0D7A )
                var_11._id_02E9 thread _id_A72E::_id_6FF1( self, "assist_uav_plus" );
            else
                var_11._id_02E9 thread _id_A72E::_id_6FF1( self, "assist_uav" );

            var_11._id_02E9 thread _id_A7A0::_id_6FF3( "ch_streak_uav" );
        }
    }

    if ( isdefined( self._id_90FE ) )
        self._id_90FE = undefined;

    if ( level._id_91E4 && level._id_91E7[self._id_04A8] || !level._id_91E4 && isdefined( level._id_308B ) && level._id_308B != self )
    {
        if ( isdefined( level._id_308A ) && level._id_307B && level._id_308A != var_1 )
            level._id_308A thread _id_A72E::_id_6FF1( self, "assist_emp" );
    }

    if ( isdefined( self._id_0E34 ) )
    {
        foreach ( var_14 in self._id_0E34 )
        {
            if ( !isdefined( _id_A75A::_id_0683( var_14 ) ) )
                continue;

            if ( var_14 == var_1 )
                continue;

            if ( self == var_14 )
                continue;

            var_14 thread _id_A72E::_id_6FF1( self );
        }

        self._id_0E34 = [];
    }
}

_id_517A( var_0 )
{
    if ( weaponclass( var_0 ) == "non-player" )
        return 0;

    if ( weaponclass( var_0 ) == "turret" )
        return 0;

    if ( _func_1DF( var_0 ) == "primary" || _func_1DF( var_0 ) == "altmode" )
        return 1;

    return 0;
}

_id_19F5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    _id_6CD5( var_0, var_1, self, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 0 );
}

_id_19F4( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        var_8 = 0;

        if ( level._id_0328.size > 1 )
            var_8 = 1;
        else if ( self._id_4741 )
            var_8 = 1;

        if ( var_8 )
            var_0 _meth_82C8();

        [[ level._id_1A02 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, 0 );
    }
}

_id_19ED()
{
    self delete();
}

_id_562E( var_0, var_1 )
{
    self _meth_84C6();
    _id_A74D::_id_7532();
}

_id_6CD5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_2 endon( "spawned" );
    var_2 notify( "killed_player" );

    if ( isdefined( var_1 ) && isplayer( var_1 ) && isdefined( var_1._id_34B3 ) && var_1._id_34B3 == 1 )
        var_1 _id_A7A0::_id_6FF3( "ch_exoability_ping" );

    if ( isdefined( var_2._id_6EF7 ) )
        var_2 [[ var_2._id_6EF7 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

    var_2 _id_A7A7::_id_7460();
    var_2._id_06B7 = 0;
    var_2._id_67CD = 0;
    var_2._id_7C83 = 0;
    var_1 = _id_A75A::_id_0683( var_1 );

    if ( isdefined( var_1 ) )
        var_1._id_0D77 = undefined;

    if ( !isdefined( var_2._id_4B53 ) )
    {
        if ( var_4 == "MOD_SUICIDE" )
            var_2._id_4B53 = 0;
        else if ( var_4 == "MOD_GRENADE" )
        {
            if ( ( issubstr( var_5, "frag_grenade" ) || issubstr( var_5, "thermobaric_grenade" ) ) && var_3 == 100000 )
                var_2._id_4B53 = 0;
            else if ( var_5 == "nuke_mp" )
                var_2._id_4B53 = 0;
            else if ( level._id_01A9 >= 2 )
                var_2._id_4B53 = 0;
            else
            {

            }
        }
    }

    if ( var_2 _id_A74D::_id_473E() )
        var_2 _id_562E( var_3, var_4 );

    var_11 = _id_A75A::_id_514D( var_4 ) && ( issubstr( var_5, "knife" ) || issubstr( var_5, "tactical" ) );
    var_11 = var_11 || var_5 == maps\mp\_grappling_hook::get_grappling_hook_weapon();

    if ( var_11 )
    {
        if ( isdefined( _id_A4F0::_id_3FA6( "exo_knife_blood" ) ) )
        {
            if ( isdefined( var_7 ) && isdefined( var_6 ) && isdefined( _id_3FCA( var_7 ) ) )
                announcement( var_2 _meth_8180( _id_3FCA( var_7 ) ), var_6 );
            else
                announcement( var_2 _meth_8180( "j_neck" ), anglestoforward( var_2 _meth_8181( "j_neck" ) ) );
        }
    }

    _id_A7B4::_id_7288();

    if ( !var_10 )
    {
        if ( isdefined( var_2._id_315E ) )
            _id_A75A::_id_74F7( 2 );
        else
        {
            _id_A75A::_id_74F7( 0 );
            var_2 _meth_80B7();
        }
    }
    else
    {
        var_2._id_3691 = 1;
        self notify( "death", var_1, var_4, var_5 );
    }

    if ( game["state"] == "postgame" )
        return;

    var_12 = 0;

    if ( !isplayer( var_0 ) && isdefined( var_0._id_0343 ) )
        var_13 = var_0._id_0343;
    else if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 _meth_8312() != "none" )
        var_13 = var_1 _meth_8312();
    else if ( issubstr( var_5, "alt_" ) )
        var_13 = getsubstr( var_5, 4, var_5.size );
    else
        var_13 = undefined;

    if ( isdefined( var_2._id_9BFE ) || isdefined( var_2._id_55E9 ) && var_4 == "MOD_SUICIDE" )
    {
        var_2 _id_32D3();
        var_2._id_9BFE = undefined;
        var_0 = var_2._id_55E9._id_301F;
        var_1 = _id_A75A::_id_0683( var_2._id_55E9._id_0055 );
        var_3 = var_2._id_55E9._id_4B51;
        var_4 = var_2._id_55E9._id_8676;
        var_5 = var_2._id_55E9._id_901E;
        var_13 = var_2._id_55E9._id_8A9F;
        var_6 = var_2._id_55E9._id_9C60;
        var_7 = var_2._id_55E9._id_83C8;
        var_12 = ( gettime() - var_2._id_55E9._id_55EE ) / 1000;
        var_2._id_55E9 = undefined;
    }

    if ( ( !isdefined( var_1 ) || var_1._id_00AB == "trigger_hurt" || var_1._id_00AB == "worldspawn" || var_1._id_00AB == "script_model" && ( isdefined( var_1._id_50FB ) && var_1._id_50FB == 1 ) || var_1 == var_2 ) && isdefined( self._id_0E34 ) )
    {
        var_14 = undefined;

        foreach ( var_16 in self._id_0E34 )
        {
            if ( !isdefined( _id_A75A::_id_0683( var_16 ) ) )
                continue;

            if ( !isdefined( var_2._id_0E2C[var_16._id_444D]._id_00FB ) )
                continue;

            if ( var_16 == var_2 || level._id_91E4 && var_16._id_04A8 == var_2._id_04A8 )
                continue;

            if ( var_2._id_0E2C[var_16._id_444D]._id_5603 + 2500 < gettime() && ( var_1 != var_2 && ( isdefined( var_2._id_024D ) && var_2._id_024D ) ) )
                continue;

            if ( var_2._id_0E2C[var_16._id_444D]._id_00FB > 1 && !isdefined( var_14 ) )
            {
                var_14 = var_16;
                continue;
            }

            if ( isdefined( var_14 ) && var_2._id_0E2C[var_16._id_444D]._id_00FB > var_2._id_0E2C[var_14._id_444D]._id_00FB )
                var_14 = var_16;
        }

        if ( isdefined( var_14 ) )
        {
            var_1 = var_14;
            var_1._id_0D77 = 1;
            var_5 = var_2._id_0E2C[var_14._id_444D]._id_0512;
            var_6 = var_2._id_0E2C[var_14._id_444D]._id_9C60;
            var_7 = var_2._id_0E2C[var_14._id_444D]._id_83C8;
            var_8 = var_2._id_0E2C[var_14._id_444D]._id_034E;
            var_4 = var_2._id_0E2C[var_14._id_444D]._id_8676;
            var_3 = var_2._id_0E2C[var_14._id_444D]._id_00FB;
            var_13 = var_2._id_0E2C[var_14._id_444D]._id_8A9F;
            var_0 = var_1;
        }
    }
    else if ( isdefined( var_1 ) )
        var_1._id_0D77 = undefined;

    if ( _id_A75A::_id_5114( var_5, var_7, var_4, var_1 ) )
        var_4 = "MOD_HEAD_SHOT";
    else if ( !_id_A75A::_id_514D( var_4 ) && !isdefined( var_2._id_6268 ) )
        var_2 _id_A75A::_id_6A3C();

    var_18 = _id_510B( var_2, var_1 );

    if ( isdefined( var_1 ) )
    {
        if ( var_1._id_00AD == "script_vehicle" && isdefined( var_1._id_02E9 ) )
            var_1 = var_1._id_02E9;

        if ( var_1._id_00AD == "misc_turret" && isdefined( var_1._id_02E9 ) )
        {
            if ( isdefined( var_1._id_9C76 ) )
                var_1._id_9C76 notify( "killedPlayer", var_2 );

            var_1 = var_1._id_02E9;
        }

        if ( isagent( var_1 ) && isdefined( var_1._id_02E9 ) )
        {
            var_1 = var_1._id_02E9;
            var_5 = "agent_mp";
            var_4 = "MOD_RIFLE_BULLET";
        }

        if ( var_1._id_00AD == "script_model" && isdefined( var_1._id_02E9 ) )
        {
            var_1 = var_1._id_02E9;

            if ( !_id_510B( var_2, var_1 ) && var_1 != var_2 )
                var_1 notify( "crushed_enemy" );
        }
    }

    if ( var_4 != "MOD_SUICIDE" && ( _id_A75A::_id_50AA( var_2 ) || _id_A75A::_id_50AA( var_1 ) ) && isdefined( level._id_161B ) && isdefined( level._id_161B["get_attacker_ent"] ) )
    {
        var_19 = [[ level._id_161B["get_attacker_ent"] ]]( var_1, var_0 );

        if ( isdefined( var_19 ) )
        {
            if ( _id_A75A::_id_50AA( var_2 ) )
                var_2 _meth_8362( "death", var_5, var_19._id_02E6, var_2._id_02E6, var_19 );

            if ( _id_A75A::_id_50AA( var_1 ) )
            {
                var_20 = 1;

                if ( var_19._id_00AB == "script_vehicle" && isdefined( var_19._id_4815 ) || var_19._id_00AB == "rocket" || var_19._id_00AB == "misc_turret" )
                    var_20 = 0;

                if ( var_20 )
                    var_1 _meth_8362( "kill", var_5, var_19._id_02E6, var_2._id_02E6, var_2 );
            }
        }
    }

    var_21 = var_2 _meth_8311();
    var_2 thread _id_A7B4::_id_2F8F( var_1 );

    if ( !isdefined( var_2._id_08A2 ) )
        var_2 thread [[ level._id_A2CF ]]( var_1, var_4 );
    else
        var_2._id_08A2 thread [[ level._id_A2CF ]]( var_1, var_4 );

    if ( !var_10 )
        var_2 _id_A75A::_id_9B61( "dead" );

    var_22 = isdefined( var_2._id_3691 ) && var_2._id_3691 && isdefined( var_2._id_9078 ) && var_2._id_9078;

    if ( !var_22 )
        var_2 _id_A7A7::_id_73A1();

    if ( !isdefined( var_2._id_9078 ) && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
    {
        var_23 = var_2;

        if ( isdefined( var_2._id_20BD ) )
            var_23 = var_2._id_20BD;

        var_23 _id_A75A::_id_4C2B( "deaths", 1 );
        var_23._id_010E = var_23 _id_A75A::_id_407F( "deaths" );
        var_23 _id_A75A::_id_9B3F( "kdRatio", "kills", "deaths" );
        var_23 _id_A7A4::_id_8D74( "round", "deaths", var_23._id_010E );
        var_23 _id_A75A::_id_4C2C( "deaths", 1 );
    }

    if ( !_id_A75A::_id_6E98() )
        canspawn( var_2, var_1, var_5, var_4 );

    var_24 = 0;
    var_2 _id_5847( self._id_56F4, var_1, var_3, var_4, var_5, var_13, var_7 );
    var_2 _id_A744::_id_5843( 1 );
    var_2 _id_A744::_id_5842( self._id_56F4, var_1, var_3, var_4, var_5, var_13, var_7, var_21 );

    if ( _id_A75A::_id_514D( var_4 ) && isplayer( var_1 ) && !issubstr( var_5, "riotshield" ) )
        var_1 _id_A75A::_id_4C2C( "knifekills", 1 );

    if ( var_2 _id_51C2() )
        _id_467F();
    else if ( !isplayer( var_1 ) || isplayer( var_1 ) && var_4 == "MOD_FALLING" )
    {
        _id_468D( var_1, self._id_56F4, var_4, var_7 );

        if ( isagent( var_1 ) )
            var_24 = 1;

        if ( _id_A79E::isworldkillcam( var_0, var_1 ) )
            var_24 = 1;
    }
    else if ( var_1 == var_2 && ( isdefined( var_0 ) && ( !isdefined( var_0._id_5166 ) || var_0._id_5166 == 0 ) ) )
        _id_467E( var_4, var_7 );
    else if ( var_18 )
    {
        if ( !isdefined( var_2._id_6268 ) && ( !isdefined( level.iszombiegame ) || !level.iszombiegame ) )
            _id_465E( var_1 );
    }
    else
    {
        if ( var_4 == "MOD_GRENADE" && var_0 == var_1 || var_4 == "MOD_IMPACT" || var_4 == "MOD_GRENADE_SPLASH" || var_4 == "MOD_EXPLOSIVE" )
            _id_07CC( var_2, var_1, var_0, var_5, var_3, ( 0, 0, 0 ), var_6, var_7, var_8, var_4 );

        var_24 = 1;

        if ( isai( var_2 ) && isdefined( level._id_161B ) && isdefined( level._id_161B["should_do_killcam"] ) )
            var_24 = var_2 [[ level._id_161B["should_do_killcam"] ]]();

        if ( isdefined( var_0 ) && ( !isdefined( var_0._id_5166 ) || var_0._id_5166 == 0 ) )
        {
            _id_4668( self._id_56F4, var_1, var_0, var_5, var_4 );
            var_2 thread _id_A7A0::_id_6CD4( var_0, var_1, var_3, var_4, var_5, var_13, var_7, var_1._id_02A2 );
        }

        var_2._id_030D["cur_death_streak"]++;

        if ( isplayer( var_1 ) && var_2 _id_A75A::_id_512E() )
            var_1 thread _id_A75A::_id_91F3( "callout_killed_juggernaut", var_1 );
    }

    var_25 = 0;
    var_26 = undefined;

    if ( isdefined( self._id_6F65 ) )
    {
        var_25 = 1;
        var_26 = self._id_6F65;
        self._id_6F65 = undefined;
    }

    if ( isplayer( var_1 ) && var_1 != self && ( !level._id_91E4 || level._id_91E4 && self._id_04A8 != var_1._id_04A8 ) )
    {
        if ( var_25 && isdefined( var_26 ) )
            var_27 = var_26;
        else
            var_27 = self._id_5595;

        thread _id_A789::_id_94FA( var_27, var_4 );
        var_1 thread _id_A789::_id_94AF( var_5, var_4, var_0 );
    }

    var_2._id_A1C8 = undefined;

    if ( isdefined( var_2._id_9078 ) )
        var_2._id_A1C8 = 1;

    var_2 _id_7453();
    var_2._id_024A = var_1;
    var_2._id_55AC = var_0;

    if ( !isdefined( var_2._id_08A2 ) )
        var_2._id_5590 = var_2._id_02E6;
    else
        var_2._id_5590 = var_2._id_08A2._id_02E6;

    var_2._id_2670 = gettime();
    var_2._id_A149 = 0;
    var_2._id_74FA = 0;
    var_2._id_77E1 = 0;
    var_2 _id_A7C3::_id_7440( 0 );
    var_28 = _id_A725::_id_4134( var_2 ) - var_2._id_7895;
    var_2 _id_A75A::_id_7FE5( "mostScorePerLife", var_28 );
    var_29 = undefined;

    if ( _id_A75A::_id_5190() )
    {
        var_24 = 1;
        var_10 = 0;
        var_29 = self._id_534A;
        self waittill( "final_rocket_corpse_death" );
    }
    else
    {
        if ( var_10 )
        {
            var_24 = 0;

            if ( !isdefined( var_2._id_08A2 ) )
                var_9 = var_2 _meth_801C( var_0, var_4, var_5, var_7, var_6 );
        }

        if ( isdefined( var_2._id_4878 ) && var_2._id_4878 )
        {
            var_2 _meth_8005();
            thread _id_A785::_id_07DE( var_2, var_2, var_2._id_04A8, 5.0, var_1 );
        }
        else if ( !isdefined( var_2._id_08A2 ) )
        {
            var_2._id_0087 = var_2 _meth_8271( var_9 );

            if ( var_10 )
                var_2 _meth_8005();

            if ( var_2 _meth_801A() || var_2 _meth_82E0() || !var_2 _meth_8341() || isdefined( var_2._id_6268 ) )
                var_2._id_0087 _meth_8023();

            if ( !isdefined( var_2._id_9078 ) )
                thread _id_A785::_id_07DE( var_2._id_0087, var_2, var_2._id_04A8, 5.0, var_1 );

            thread _id_27ED( var_2._id_0087, var_7, var_6, var_5, var_0, var_4 );
        }
        else if ( !isdefined( var_2._id_9078 ) )
            thread _id_A785::_id_07DE( var_2._id_08A2, var_2, var_2._id_04A8, 5.0, var_1 );
    }

    var_2 thread [[ level._id_64D0 ]]( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, self._id_56F4 );

    if ( isai( var_2 ) && isdefined( level._id_161B ) && isdefined( level._id_161B["on_killed"] ) )
        var_2 thread [[ level._id_161B["on_killed"] ]]( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, self._id_56F4 );

    if ( _id_A75A::_id_510F( var_1 ) )
        var_30 = var_1 _meth_81B1();
    else
        var_30 = -1;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        var_30 = -1;

    if ( !isdefined( var_29 ) && isdefined( var_1 ) )
        var_29 = var_2 _id_3FDD( var_1, var_0, var_5 );

    var_31 = -1;
    var_32 = 0;
    var_33 = 0;

    if ( isdefined( var_29 ) )
    {
        var_31 = var_29 _meth_81B1();
        var_32 = var_29._id_007D;

        if ( isdefined( var_29._id_534F ) )
        {
            var_32 = var_29._id_534F;
            var_33 = 1;
        }

        if ( !isdefined( var_32 ) )
            var_32 = 0;
    }
    else if ( var_5 == "orbital_laser_fov_mp" && isdefined( var_0 ) && isdefined( var_0._id_534F ) )
    {
        var_32 = var_0._id_534F;
        var_33 = 1;
    }

    if ( isdefined( var_1 ) && isdefined( var_1._id_55DC ) )
        var_34 = ( gettime() - var_1._id_55DC ) / 1000.0;
    else
        var_34 = 0;

    if ( var_4 != "MOD_SUICIDE" && !( !isdefined( var_1 ) || var_1._id_00AB == "trigger_hurt" || var_1._id_00AB == "worldspawn" || var_1 == var_2 ) )
        _id_7286( 5.0, var_2, var_1, var_30, var_31, var_32, var_5, var_12, var_8, var_4, "normal", var_33 );

    if ( _id_A79E::_id_5351( var_2, var_24 ) )
    {
        var_35 = _id_A7A7::_id_937B( 1 );
        var_36 = _id_A789::_id_937A();
        var_37 = _id_A79E::_id_5350( var_32, var_5, 0, var_35, var_36, var_33, 0 );
        var_38 = _id_A79E::killcamarchivetime( var_37, var_34, var_12, var_8 / 1000 );
        var_2 _id_A79E::_id_6EF6( var_0, var_1, var_38, var_21 );
    }
    else if ( _id_A75A::_id_51E5( var_2._id_1E2E ) )
        var_2 _id_A7A7::_id_8F2A();

    var_39 = gettime() + 5000;

    if ( !var_10 )
    {
        wait 0.25;
        var_2 thread _id_A79E::_id_1AB5();
        wait 0.25;
        self._id_7477 = gettime() + 1000;
        var_35 = _id_A7A7::_id_937B( 1 );

        if ( var_35 < 1 )
            var_35 = 1;

        wait 1.0;

        if ( isdefined( self._id_8F2C ) && self._id_8F2C.size > 0 )
        {
            while ( _id_A79E::_id_5351( var_2, var_24 ) && isplayer( self ) && isplayer( var_1 ) && !self _meth_8425( var_1, self._id_8F2C ) && gettime() < var_39 )
                waittillframeend;
        }

        var_2 notify( "death_delay_finished" );
    }

    var_40 = ( gettime() - var_2._id_2670 ) / 1000;
    self._id_7477 = gettime();
    var_41 = gettime() >= var_39;

    if ( _id_A79E::_id_5351( var_2, var_24 ) && !var_41 )
    {
        var_42 = !( _id_A75A::_id_3FA8() && !var_2._id_030D["lives"] );
        var_35 = _id_A7A7::_id_937B( 1 );
        var_43 = var_42 && var_35 <= 0;

        if ( !var_42 )
        {
            var_35 = -1;
            level notify( "player_eliminated", var_2 );
        }

        var_2 _id_A79E::_id_5348( var_0, var_30, var_31, var_32, var_5, var_40 + var_12, var_8, var_35, _id_A789::_id_937A(), var_1, var_2, var_4, "normal", var_34, var_33 );
    }

    if ( game["state"] != "playing" )
    {
        if ( !level._id_8510 )
        {
            var_2 _id_A75A::_id_9B61( "dead" );
            var_2 _id_A75A::_id_1EF2();
        }

        return;
    }

    var_44 = _id_A75A::_id_3FA8();
    var_45 = self._id_030D["lives"];

    if ( self == var_2 && isdefined( var_2._id_132A ) && _id_A75A::_id_5186( var_2._id_132A ) && ( !_id_A75A::_id_3FA8() || self._id_030D["lives"] ) && !var_2 _id_A75A::_id_51E0() )
        _id_A77F::_id_A021();

    if ( _id_A75A::_id_51E5( var_2._id_1E2E ) )
        var_2 thread _id_A7A7::_id_8992();
}

_id_A0F3()
{
    self endon( "randomSpawnPressed" );
    self._id_52D2 _meth_80CA( &"PLATFORM_PRESS_TO_TEAMSPAWN" );
    self._id_52D2._id_0037 = 1;
    self._id_52D1 _meth_80CA( &"PLATFORM_PRESS_TO_RESPAWN" );
    self._id_52D1._id_0037 = 1;
    thread _id_A059();
    thread _id_A054();

    if ( isdefined( self._id_85B9 ) && self._id_85B9 )
        var_0 = 8;
    else
        var_0 = 9;

    if ( isdefined( self._id_9377 ) )
        var_1 = int( ceil( var_0 - ( gettime() - self._id_9377 ) / 1000 ) );
    else
        var_1 = var_0;

    self._id_66A3 = 0;
    wait 0.5;

    for ( var_2 = var_1; var_2 > 0; var_2-- )
    {
        _id_A75A::_id_7F9F( "kc_info", &"MP_TIME_TILL_SPAWN", var_1, 1, 1 );
        wait 1;
    }

    self._id_52D1._id_0037 = 0;
    self._id_52D2._id_0037 = 0;
    _id_A75A::_id_1EF5( "kc_info" );
    self notify( "abort_fireteam_spawn" );
}

_id_A054()
{
    self endon( "disconnect" );
    self endon( "abort_fireteam_spawn" );

    while ( self _meth_833C() )
        wait 0.05;

    while ( !self _meth_833C() )
    {
        wait 0.05;

        if ( !_id_A75A::_id_5186( self._id_66A2 ) )
            break;
    }

    self._id_66A3 = 0;
    self notify( "randomSpawnPressed" );
    self._id_52D1._id_0037 = 0;
    self._id_52D2._id_0037 = 0;
    _id_A75A::_id_1EF5( "kc_info" );
    self notify( "abort_fireteam_spawn" );
}

_id_A059()
{
    self endon( "disconnect" );
    self endon( "abort_fireteam_spawn" );

    while ( self _meth_833D() )
        wait 0.05;

    while ( !self _meth_833D() )
        wait 0.05;

    self._id_66A3 = 1;
    self _meth_82F4( "copycat_steal_class" );
    self notify( "teamSpawnPressed" );
    self._id_52D1._id_0037 = 0;
    self._id_52D2._id_0037 = 0;
}

_id_1CFF()
{
    if ( level._id_2A54 != 1 )
        return 0;

    if ( !_id_A75A::_id_3FA8() )
        return 0;

    if ( level._id_57B6[self._id_04A8] > 0 )
        return 0;

    foreach ( var_1 in level._id_0328 )
    {
        if ( !isalive( var_1 ) )
            continue;

        if ( var_1._id_04A8 != self._id_04A8 )
            continue;

        if ( var_1 == self )
            continue;

        if ( !var_1._id_4E39 )
            return 0;
    }

    foreach ( var_1 in level._id_0328 )
    {
        if ( !isalive( var_1 ) )
            continue;

        if ( var_1._id_04A8 != self._id_04A8 )
            continue;

        if ( var_1._id_4E39 && var_1 != self )
            var_1 _id_55E4( 0 );
    }

    return 1;
}

_id_4DBB()
{
    level._id_3740 = [];
    level._id_374A = [];
    level._id_373D = [];
    level._id_373E = [];
    level._id_3741 = [];
    level._id_3742 = [];
    level._id_3745 = [];
    level._id_373F = [];
    level._id_3743 = [];
    level._id_3747 = [];
    level._id_3746 = [];
    level._id_3744 = [];
    level._id_3748 = [];
    level._id_3749 = [];

    if ( level._id_5FE9 )
    {
        foreach ( var_1 in level._id_91F0 )
        {
            level._id_3740[var_1] = undefined;
            level._id_374A[var_1] = undefined;
            level._id_373D[var_1] = undefined;
            level._id_373E[var_1] = undefined;
            level._id_3741[var_1] = undefined;
            level._id_3742[var_1] = undefined;
            level._id_3745[var_1] = undefined;
            level._id_373F[var_1] = undefined;
            level._id_3743[var_1] = undefined;
            level._id_3747[var_1] = undefined;
            level._id_3746[var_1] = undefined;
            level._id_3744[var_1] = undefined;
            level._id_3748[var_1] = undefined;
            level._id_3749[var_1] = undefined;
        }
    }
    else
    {
        level._id_3740["axis"] = undefined;
        level._id_374A["axis"] = undefined;
        level._id_373D["axis"] = undefined;
        level._id_373E["axis"] = undefined;
        level._id_3741["axis"] = undefined;
        level._id_3742["axis"] = undefined;
        level._id_3745["axis"] = undefined;
        level._id_373F["axis"] = undefined;
        level._id_3743["axis"] = undefined;
        level._id_3747["axis"] = undefined;
        level._id_3746["axis"] = undefined;
        level._id_3744["axis"] = undefined;
        level._id_3748["axis"] = undefined;
        level._id_3749["axis"] = undefined;
        level._id_3740["allies"] = undefined;
        level._id_374A["allies"] = undefined;
        level._id_373D["allies"] = undefined;
        level._id_373E["allies"] = undefined;
        level._id_3741["allies"] = undefined;
        level._id_3742["allies"] = undefined;
        level._id_3745["allies"] = undefined;
        level._id_373F["allies"] = undefined;
        level._id_3743["allies"] = undefined;
        level._id_3747["allies"] = undefined;
        level._id_3746["allies"] = undefined;
        level._id_3744["allies"] = undefined;
        level._id_3748["allies"] = undefined;
        level._id_3749["allies"] = undefined;
    }

    level._id_3740["none"] = undefined;
    level._id_374A["none"] = undefined;
    level._id_373D["none"] = undefined;
    level._id_373E["none"] = undefined;
    level._id_3741["none"] = undefined;
    level._id_3742["none"] = undefined;
    level._id_3745["none"] = undefined;
    level._id_373F["none"] = undefined;
    level._id_3743["none"] = undefined;
    level._id_3747["none"] = undefined;
    level._id_3746["none"] = undefined;
    level._id_3744["none"] = undefined;
    level._id_3748["none"] = undefined;
    level._id_3749["none"] = undefined;
    level._id_374B = undefined;
}

_id_7286( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( level._id_91E4 && isdefined( var_2._id_04A8 ) )
    {
        level._id_3740[var_2._id_04A8] = var_0;
        level._id_374A[var_2._id_04A8] = var_1;
        level._id_373D[var_2._id_04A8] = var_2;
        level._id_373E[var_2._id_04A8] = var_3;
        level._id_3741[var_2._id_04A8] = var_4;
        level._id_3742[var_2._id_04A8] = var_5;
        level._id_3745[var_2._id_04A8] = var_6;
        level._id_373F[var_2._id_04A8] = var_7;
        level._id_3743[var_2._id_04A8] = var_8;
        level._id_3747[var_2._id_04A8] = _id_A75A::_id_40C5();
        level._id_3746[var_2._id_04A8] = _id_A75A::_id_40C5();
        level._id_3744[var_2._id_04A8] = var_9;
        level._id_3748[var_2._id_04A8] = var_10;
        level._id_3749[var_2._id_04A8] = isdefined( var_11 ) && var_11;
    }

    level._id_3740["none"] = var_0;
    level._id_374A["none"] = var_1;
    level._id_373D["none"] = var_2;
    level._id_373E["none"] = var_3;
    level._id_3741["none"] = var_4;
    level._id_3742["none"] = var_5;
    level._id_3745["none"] = var_6;
    level._id_373F["none"] = var_7;
    level._id_3743["none"] = var_8;
    level._id_3747["none"] = _id_A75A::_id_40C5();
    level._id_3746["none"] = _id_A75A::_id_40C5();
    level._id_3746["none"] = _id_A75A::_id_40C5();
    level._id_3744["none"] = var_9;
    level._id_3748["none"] = var_10;
    level._id_3749["none"] = isdefined( var_11 ) && var_11;
}

_id_334C()
{
    if ( level._id_5FE9 )
    {
        for ( var_0 = 0; var_0 < level._id_91F0.size; var_0++ )
        {
            level._id_3740[level._id_91F0[var_0]] = undefined;
            level._id_374A[level._id_91F0[var_0]] = undefined;
            level._id_373D[level._id_91F0[var_0]] = undefined;
            level._id_373E[level._id_91F0[var_0]] = undefined;
            level._id_3741[level._id_91F0[var_0]] = undefined;
            level._id_3742[level._id_91F0[var_0]] = undefined;
            level._id_3745[level._id_91F0[var_0]] = undefined;
            level._id_373F[level._id_91F0[var_0]] = undefined;
            level._id_3743[level._id_91F0[var_0]] = undefined;
            level._id_3747[level._id_91F0[var_0]] = undefined;
            level._id_3746[level._id_91F0[var_0]] = undefined;
            level._id_3744[level._id_91F0[var_0]] = undefined;
            level._id_3748[level._id_91F0[var_0]] = undefined;
            level._id_3749[level._id_91F0[var_0]] = undefined;
        }
    }
    else
    {
        level._id_3740["axis"] = undefined;
        level._id_374A["axis"] = undefined;
        level._id_373D["axis"] = undefined;
        level._id_373E["axis"] = undefined;
        level._id_3741["axis"] = undefined;
        level._id_3742["axis"] = undefined;
        level._id_3745["axis"] = undefined;
        level._id_373F["axis"] = undefined;
        level._id_3743["axis"] = undefined;
        level._id_3747["axis"] = undefined;
        level._id_3746["axis"] = undefined;
        level._id_3744["axis"] = undefined;
        level._id_3748["axis"] = undefined;
        level._id_3749["axis"] = undefined;
        level._id_3740["allies"] = undefined;
        level._id_374A["allies"] = undefined;
        level._id_373D["allies"] = undefined;
        level._id_373E["allies"] = undefined;
        level._id_3741["allies"] = undefined;
        level._id_3742["allies"] = undefined;
        level._id_3745["allies"] = undefined;
        level._id_373F["allies"] = undefined;
        level._id_3743["allies"] = undefined;
        level._id_3747["allies"] = undefined;
        level._id_3746["allies"] = undefined;
        level._id_3744["allies"] = undefined;
        level._id_3748["allies"] = undefined;
        level._id_3749["allies"] = undefined;
    }

    level._id_3740["none"] = undefined;
    level._id_374A["none"] = undefined;
    level._id_373D["none"] = undefined;
    level._id_373E["none"] = undefined;
    level._id_3741["none"] = undefined;
    level._id_3742["none"] = undefined;
    level._id_3745["none"] = undefined;
    level._id_373F["none"] = undefined;
    level._id_3743["none"] = undefined;
    level._id_3747["none"] = undefined;
    level._id_3746["none"] = undefined;
    level._id_3744["none"] = undefined;
    level._id_3748["none"] = undefined;
    level._id_3749["none"] = undefined;
    level._id_374B = undefined;
}

streamfinalkillcam()
{
    if ( isai( self ) )
        return;

    var_0 = "none";

    if ( isdefined( level._id_374B ) )
        var_0 = level._id_374B;

    var_1 = level._id_374A[var_0];
    var_2 = level._id_373D[var_0];
    var_3 = level._id_3746[var_0];
    var_4 = level._id_3747[var_0];

    if ( !finalkillcamvalid( var_1, var_2, var_3, var_4 ) )
        return;

    var_5 = level._id_3742[var_0];
    var_6 = level._id_3745[var_0];
    var_7 = level._id_3749[var_0];
    var_8 = level._id_3743[var_0];
    var_9 = level._id_373F[var_0];
    var_10 = ( gettime() - var_1._id_2670 ) / 1000;
    var_11 = var_10 + var_9;
    var_12 = _id_A79E::_id_5350( var_5, var_6, var_11, 0, getkillcambuffertime(), var_7, 1 );
    var_13 = var_12 + var_11 + var_8 / 1000;
    self _meth_8538( 1 );
    thread _id_A79E::_id_6EF6( level._id_373D[var_0], level._id_373D[var_0], var_13, "none" );
}

streamcheck( var_0 )
{
    level endon( "stream_end" );

    foreach ( var_2 in level._id_0328 )
    {
        if ( isai( var_2 ) )
            continue;

        if ( isdefined( var_2._id_8F2C ) && var_2._id_8F2C.size > 0 )
        {
            while ( isplayer( var_2 ) && isplayer( var_0 ) && !var_2 _meth_8425( var_0, var_2._id_8F2C[0] ) )
                waittillframeend;
        }
    }

    level notify( "stream_end" );
}

resetonlystreamactive()
{
    foreach ( var_1 in level._id_0328 )
    {
        if ( !isai( var_1 ) )
            var_1 _meth_8538( 0 );
    }
}

streamtimeout( var_0 )
{
    level endon( "stream_end" );
    wait(var_0);
    level notify( "stream_end" );
}

waitforstream( var_0 )
{
    thread streamtimeout( 5.0 );
    streamcheck( var_0 );
}

getkillcambuffertime()
{
    return 15;
}

finalkillcamvalid( var_0, var_1, var_2, var_3 )
{
    var_4 = isdefined( var_0 ) && isdefined( var_1 ) && !_id_A75A::_id_6E98();

    if ( var_4 )
    {
        var_5 = getkillcambuffertime();
        var_6 = var_2 - var_3;

        if ( var_6 <= var_5 )
            return 1;
    }

    return 0;
}

endfinalkillcam()
{
    resetonlystreamactive();
    level._id_8510 = 0;
    level notify( "final_killcam_done" );
}

_id_2C7B()
{
    level waittill( "round_end_finished" );
    level._id_8510 = 1;
    var_0 = "none";

    if ( isdefined( level._id_374B ) )
        var_0 = level._id_374B;

    var_1 = level._id_3740[var_0];
    var_2 = level._id_374A[var_0];
    var_3 = level._id_373D[var_0];
    var_4 = level._id_373E[var_0];
    var_5 = level._id_3741[var_0];
    var_6 = level._id_3742[var_0];
    var_7 = level._id_3749[var_0];
    var_8 = level._id_3745[var_0];
    var_9 = level._id_373F[var_0];
    var_10 = level._id_3743[var_0];
    var_11 = level._id_3747[var_0];
    var_12 = level._id_3746[var_0];
    var_13 = level._id_3744[var_0];
    var_14 = level._id_3748[var_0];

    if ( !finalkillcamvalid( var_2, var_3, var_12, var_11 ) )
    {
        endfinalkillcam();
        return;
    }

    if ( isdefined( var_3 ) )
    {
        var_3._id_373C = 1;

        if ( level._id_01B5 == "conf" && isdefined( level._id_373D[var_3._id_04A8] ) && level._id_373D[var_3._id_04A8] == var_3 )
        {
            var_3 _id_A7A0::_id_6FF3( "ch_theedge" );

            if ( isdefined( var_3._id_02A2["revenge"] ) )
                var_3 _id_A7A0::_id_6FF3( "ch_moneyshot" );

            if ( isdefined( var_3._id_4C57 ) && var_3._id_4C57 )
                var_3 _id_A7A0::_id_6FF3( "ch_lastresort" );

            if ( isdefined( var_2 ) && isdefined( var_2._id_357C ) && isdefined( var_2._id_357C["stickKill"] ) && var_2._id_357C["stickKill"] )
                var_3 _id_A7A0::_id_6FF3( "ch_stickman" );

            if ( isdefined( var_2._id_0E2C[var_3._id_444D] ) && isdefined( var_2._id_0E2C[var_3._id_444D]._id_8676 ) && isdefined( var_2._id_0E2C[var_3._id_444D]._id_0512 ) && issubstr( var_2._id_0E2C[var_3._id_444D]._id_8676, "MOD_MELEE" ) && issubstr( var_2._id_0E2C[var_3._id_444D]._id_0512, "riotshield_mp" ) )
                var_3 _id_A7A0::_id_6FF3( "ch_owned" );

            switch ( level._id_3745[var_3._id_04A8] )
            {
                case "artillery_mp":
                    var_3 _id_A7A0::_id_6FF3( "ch_finishingtouch" );
                    break;
                case "stealth_bomb_mp":
                    var_3 _id_A7A0::_id_6FF3( "ch_technokiller" );
                    break;
                case "sentry_minigun_mp":
                    var_3 _id_A7A0::_id_6FF3( "ch_absentee" );
                    break;
                case "ac130_25mm_mp":
                case "ac130_105mm_mp":
                case "ac130_40mm_mp":
                    var_3 _id_A7A0::_id_6FF3( "ch_deathfromabove" );
                    break;
                case "remotemissile_projectile_mp":
                    var_3 _id_A7A0::_id_6FF3( "ch_dronekiller" );
                    break;
                default:
                    break;
            }
        }
    }

    waitforstream( var_3 );
    var_15 = ( gettime() - var_2._id_2670 ) / 1000;

    foreach ( var_17 in level._id_0328 )
    {
        var_17 _id_A75A::_id_74F7( 0 );
        var_17 _meth_82D9( 0, 0 );
        var_17._id_023B = var_2 _meth_81B1();

        if ( isdefined( var_3 ) && isdefined( var_3._id_55DC ) )
            var_18 = ( gettime() - var_3._id_55DC ) / 1000.0;
        else
            var_18 = 0;

        var_17 thread _id_A79E::_id_5348( var_3, var_4, var_5, var_6, var_8, var_15 + var_9, var_10, 0, getkillcambuffertime(), var_3, var_2, var_13, var_14, var_18, var_7 );
    }

    wait 0.1;

    while ( _id_0C98() )
        wait 0.05;

    endfinalkillcam();
}

_id_0C98()
{
    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1._id_5348 ) )
            return 1;
    }

    return 0;
}

_id_7453()
{
    self._id_5360 = [];
    self._id_9078 = undefined;
    self._id_5289 = undefined;
    self._id_566A = undefined;
    self._id_030D["cur_kill_streak"] = 0;
    self._id_030D["cur_kill_streak_for_nuke"] = 0;
    self._id_023E = 0;
    _id_A78A::_id_2983();
}

_id_3FDD( var_0, var_1, var_2 )
{
    if ( isdefined( var_0._id_2A4F ) && var_0._id_2A4F && isdefined( var_0._id_9938 ) )
    {
        var_0._id_2A4F = undefined;
        return var_0._id_9938._id_534A;
    }

    switch ( var_2 )
    {
        case "boost_slam_mp":
            return var_1;
        case "bomb_site_mp":
        case "bouncingbetty_mp":
        case "explosive_drone_mp":
        case "orbital_carepackage_pod_mp":
        case "orbital_carepackage_droppod_mp":
        case "artillery_mp":
        case "stealth_bomb_mp":
        case "agent_mp":
        case "refraction_turret_mp":
        case "orbital_carepackage_pod_plane_mp":
        case "remotemissile_projectile_cluster_child_mp":
        case "iw5_dlcgun12loot6_mp":
            return var_1._id_534A;
        case "killstreak_laser2_mp":
            if ( isdefined( var_1._id_77E5 ) && isdefined( var_1._id_77E5._id_534A ) )
                return var_1._id_77E5._id_534A;

            break;
        case "ball_drone_gun_mp":
        case "ball_drone_projectile_mp":
            if ( isplayer( var_0 ) && isdefined( var_0._id_12D6 ) && isdefined( var_0._id_12D6._id_9938 ) && isdefined( var_0._id_12D6._id_9938._id_534A ) )
                return var_0._id_12D6._id_9938._id_534A;

            break;
        case "ugv_missile_mp":
        case "drone_assault_remote_turret_mp":
            if ( isdefined( var_1._id_534A ) )
                return var_1._id_534A;
            else
                return undefined;
        case "assaultdrone_c4_mp":
            if ( isdefined( var_1._id_4714 ) && var_1._id_4714 )
                return var_1;
            else
                return undefined;
        case "killstreak_solar_mp":
        case "dam_turret_mp":
        case "warbird_missile_mp":
            if ( isdefined( var_1 ) && isdefined( var_1._id_534A ) )
                return var_1._id_534A;

            break;
        case "warbird_remote_turret_mp":
            if ( isdefined( var_1 ) && isdefined( var_1._id_534A ) )
                return var_1._id_534A;
            else
                return undefined;
        case "orbital_laser_fov_mp":
            return undefined;
        case "sentry_minigun_mp":
        case "remote_energy_turret_mp":
        case "killstreakmahem_mp":
            if ( isdefined( var_1 ) && isdefined( var_1._id_7320 ) )
                return undefined;

            break;
        case "none":
            if ( isdefined( var_1._id_04A7 ) && var_1._id_04A7 == "care_package" )
                return var_1._id_534A;

            break;
        case "ac130_25mm_mp":
        case "ac130_105mm_mp":
        case "ac130_40mm_mp":
        case "ugv_turret_mp":
        case "remote_turret_mp":
        case "detroit_tram_turret_mp":
        case "killstreak_terrace_mp":
            return undefined;
        case "iw5_dlcgun12loot8_mp":
            if ( isdefined( var_1._id_534A ) )
                return var_1._id_534A;
            else
                return undefined;
    }

    if ( _id_A75A::_id_50F0( var_2 ) || _id_A75A::_id_50C6( var_2 ) )
    {
        if ( isdefined( var_1._id_534A ) && !var_0 _id_0E2F() )
            return var_1._id_534A;
        else
            return undefined;
    }

    if ( _id_A79E::isworldkillcam( var_1, var_0 ) )
        return var_0._id_534A;

    if ( !isdefined( var_1 ) || var_0 == var_1 && !isagent( var_0 ) )
        return undefined;

    return var_1;
}

_id_0E2F()
{
    if ( !isdefined( self ) )
        return 0;

    if ( isdefined( level._id_1D48 ) && isdefined( level._id_1D48._id_4470 ) && self == level._id_1D48._id_4470 )
        return 1;

    if ( isdefined( self._id_9C1E ) && self._id_9C1E )
        return 1;

    if ( isdefined( self._id_9C1D ) && self._id_9C1D )
        return 1;

    return 0;
}

_id_4920( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5[0] = 2;
    var_5[1] = 3;
    var_5[2] = 5;
    var_5[3] = 7;

    if ( !getdvarint( "scr_hitloc_debug" ) )
        return;

    if ( !isdefined( var_0._id_4921 ) )
    {
        for ( var_6 = 0; var_6 < 6; var_6++ )
            var_0 _meth_82FC( "ui_hitloc_" + var_6, "" );

        var_0._id_4921 = 1;
    }

    if ( level._id_8A76 || !isplayer( var_0 ) )
        return;

    var_7 = 6;

    if ( !isdefined( var_0._id_25A1 ) )
    {
        var_0._id_25A1 = [];

        for ( var_6 = 0; var_6 < var_7; var_6++ )
        {
            var_0._id_25A1[var_6] = spawnstruct();
            var_0._id_25A1[var_6]._id_00FB = 0;
            var_0._id_25A1[var_6]._id_491F = "";
            var_0._id_25A1[var_6]._id_175E = 0;
            var_0._id_25A1[var_6]._id_5297 = 0;
            var_0._id_25A1[var_6]._id_204B = 0;
        }

        var_0._id_25A2 = 0;
        var_0._id_25A3 = undefined;
    }

    for ( var_6 = var_7 - 1; var_6 > 0; var_6-- )
    {
        var_0._id_25A1[var_6]._id_00FB = var_0._id_25A1[var_6 - 1]._id_00FB;
        var_0._id_25A1[var_6]._id_491F = var_0._id_25A1[var_6 - 1]._id_491F;
        var_0._id_25A1[var_6]._id_175E = var_0._id_25A1[var_6 - 1]._id_175E;
        var_0._id_25A1[var_6]._id_5297 = var_0._id_25A1[var_6 - 1]._id_5297;
        var_0._id_25A1[var_6]._id_204B = var_0._id_25A1[var_6 - 1]._id_204B;
    }

    var_0._id_25A1[0]._id_00FB = var_2;
    var_0._id_25A1[0]._id_491F = var_3;
    var_0._id_25A1[0]._id_175E = var_4 & level._id_4B59;
    var_0._id_25A1[0]._id_5297 = var_1 _id_A75A::_id_512E();

    if ( isdefined( var_0._id_25A3 ) && var_0._id_25A3 != var_1 )
    {
        var_0._id_25A2++;

        if ( var_0._id_25A2 == var_5.size )
            var_0._id_25A2 = 0;
    }

    var_0._id_25A3 = var_1;
    var_0._id_25A1[0]._id_204B = var_0._id_25A2;

    for ( var_6 = 0; var_6 < var_7; var_6++ )
    {
        var_8 = "^" + var_5[var_0._id_25A1[var_6]._id_204B];

        if ( var_0._id_25A1[var_6]._id_491F != "" )
        {
            var_9 = var_8 + var_0._id_25A1[var_6]._id_491F;

            if ( var_0._id_25A1[var_6]._id_175E )
                var_9 += " (BP)";

            if ( var_0._id_25A1[var_6]._id_5297 )
                var_9 += " (Jugg)";

            var_0 _meth_82FC( "ui_hitloc_" + var_6, var_9 );
        }

        var_0 _meth_82FC( "ui_hitloc_damage_" + var_6, var_8 + var_0._id_25A1[var_6]._id_00FB );
    }
}

_id_5113( var_0 )
{
    if ( !_id_A75A::_id_05CB( "specialty_stun_resistance" ) )
        return 0;

    switch ( var_0 )
    {
        case "killstreak_strike_missile_gas_mp":
        case "mp_lab_gas":
            return 1;
    }

    return 0;
}

_id_19F2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( getdvarint( "virtuallobbyactive", 0 ) )
        return "virtuallobbyactive";

    var_1 = _id_A75A::_id_0683( var_1 );
    var_11 = _id_A75A::_id_8F56( var_6, "_lefthand" );

    if ( isdefined( var_5 ) && var_5 == "MOD_CRUSH" && isdefined( var_0 ) && isdefined( var_0._id_00AB ) && var_0._id_00AB == "script_vehicle" )
        return "crushed";

    if ( !_id_A75A::_id_5186( var_2 ) && !isdefined( var_2._id_4E3A ) )
        return "!isReallyAlive( victim )";

    if ( isdefined( var_1 ) && var_1._id_00AB == "script_origin" && isdefined( var_1._id_04D8 ) && var_1._id_04D8 == "soft_landing" )
        return "soft_landing";

    if ( var_6 == "killstreak_emp_mp" )
        return "sWeapon == killstreak_emp_mp";

    if ( var_2 _id_5113( var_6 ) )
        return "specialty_stun_resistance";

    if ( ( var_11 == "emp_grenade_mp" || var_11 == "emp_grenade_var_mp" || var_11 == "emp_grenade_killstreak_mp" ) && var_5 != "MOD_IMPACT" )
        var_2 notify( "emp_grenaded", var_1 );

    if ( isdefined( level._id_4A36 ) )
        return "level.hostMigrationTimer";

    if ( var_5 == "MOD_FALLING" )
        var_2 thread _id_3063( var_3 );

    if ( var_5 == "MOD_EXPLOSIVE_BULLET" && var_3 != 1 )
    {
        var_3 *= getdvarfloat( "scr_explBulletMod" );
        var_3 = int( var_3 );
    }

    if ( isdefined( var_1 ) && var_1._id_00AB == "worldspawn" )
        var_1 = undefined;

    if ( isdefined( var_1 ) && isdefined( var_1._id_4470 ) )
        var_1 = var_1._id_4470;

    if ( isdefined( var_1 ) && var_1 == var_2 && var_6 == "killstreak_strike_missile_gas_mp" )
        return "gasCloudOwner";

    if ( isdefined( var_1 ) && isplayer( var_1 ) && isexplosivedamagemod( var_5 ) && issubstr( var_6, "explosive_drone" ) && var_2 _id_A75A::_id_05CB( "_specialty_blastshield" ) && _id_A75A::_id_5186( var_2 ) )
        var_2._id_354D = var_1;

    var_12 = _id_A75A::_id_0E30( var_2, var_1 );
    var_13 = isdefined( var_1 ) && isdefined( var_0 ) && isdefined( var_2 ) && isplayer( var_1 ) && var_1 == var_0 && var_1 == var_2 && !isdefined( var_0._id_6E26 );

    if ( var_13 )
        return "attackerIsInflictorVictim";

    var_14 = 0.0;

    if ( var_4 & level._id_4B5E )
    {
        var_14 = 0.0;
        var_3 = 0.0;
    }
    else if ( var_9 == "shield" )
    {
        if ( var_12 && level._id_01A9 == 0 )
            return "attackerIsHittingTeammate";

        if ( var_5 == "MOD_PISTOL_BULLET" || var_5 == "MOD_RIFLE_BULLET" || var_5 == "MOD_EXPLOSIVE_BULLET" && !var_12 )
        {
            if ( isplayer( var_1 ) )
            {
                var_1._id_5573 = var_2;
                var_1._id_5574 = gettime();
            }

            if ( _id_A75A::_id_50FB( var_6 ) )
                var_16 = 25;
            else
                var_16 = _id_A7DC::_id_198D( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9 );

            var_2._id_83C0 += var_16;

            if ( !_id_A75A::_id_50FB( var_6 ) || _id_A4F0::_id_2006() )
            {
                var_2._id_83BF++;

                if ( isdefined( var_2._id_030D["bulletsBlockedByShield"] ) )
                    var_2._id_030D["bulletsBlockedByShield"]++;
            }

            if ( var_2._id_83BF >= level._id_7554 )
            {
                var_2._id_83C0 = 0;
                var_2._id_83BF = 0;
            }
        }

        if ( var_4 & level._id_4B5B )
        {
            var_9 = "none";

            if ( !( var_4 & level._id_4B5C ) )
                var_3 *= 0.0;
        }
        else if ( var_4 & level._id_4B5D )
        {
            if ( isdefined( var_0 ) && isdefined( var_0._id_8F66 ) && var_0._id_8F66 == var_2 )
                var_3 = 51;

            var_9 = "none";
        }
        else
            return "hit shield";
    }
    else if ( _id_A75A::_id_514D( var_5 ) && issubstr( var_6, "riotshield" ) )
    {
        if ( !( var_12 && level._id_01A9 == 0 ) )
        {
            var_14 = 0.0;
            var_2 _meth_8183( 0.0 );
        }
    }

    if ( !var_12 )
        var_3 = _id_A7DC::_id_198D( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9, var_0 );

    if ( isdefined( level._id_5D4E ) )
        var_3 = [[ level._id_5D4E ]]( var_2, var_0, var_1, var_3, var_5, var_6, var_7, var_8, var_9 );

    if ( var_2 _id_A75A::_id_512E() && !isagent( var_2 ) )
    {
        if ( isdefined( level.customjuggernautdamagefunc ) )
            var_3 = [[ level.customjuggernautdamagefunc ]]( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9, var_0 );
        else
            var_3 = _id_A7C2::_id_52A2( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9, var_0 );
    }

    var_17 = isdefined( var_1 ) && !isdefined( var_1._id_4470 ) && ( var_1._id_00AB == "script_vehicle" || var_1._id_00AB == "misc_turret" || var_1._id_00AB == "script_model" );
    var_12 = _id_A75A::_id_0E30( var_2, var_1 );

    if ( !var_3 )
        return "!iDamage";

    var_2._id_4B53 = var_4;
    var_2._id_4B5F = gettime();

    if ( game["state"] == "postgame" )
        return "game[ state ] == postgame";

    if ( var_2._id_03BD == "spectator" )
        return "victim.sessionteam == spectator";

    if ( isdefined( var_2._id_1AC6 ) && !var_2._id_1AC6 )
        return "!victim.canDoCombat";

    if ( isdefined( var_1 ) && isplayer( var_1 ) && isdefined( var_1._id_1AC6 ) && !var_1._id_1AC6 )
        return "!eAttacker.canDoCombat";

    if ( isdefined( var_1 ) && isalive( var_1 ) && !isdefined( var_1._id_67CD ) )
        var_1._id_67CD = 0;

    if ( var_17 && var_12 )
    {
        if ( var_5 == "MOD_CRUSH" )
        {
            var_2 _id_A75A::_id_066F();
            return "suicide crush";
        }

        if ( !level._id_01A9 )
            return "!level.friendlyfire";
    }

    if ( isai( self ) )
        self [[ level._id_161B["on_damaged"] ]]( var_1, var_3, var_5, var_6, var_0, var_9 );

    if ( !isdefined( var_8 ) )
        var_4 |= level._id_4B55;

    var_18 = 0;

    if ( var_2._id_01E7 == var_2._id_0275 && ( !isdefined( var_2._id_024D ) || !var_2._id_024D ) || !isdefined( var_2._id_0E34 ) && !isdefined( var_2._id_024D ) )
    {
        var_2._id_0E34 = [];
        var_2._id_0E2C = [];
    }

    if ( _id_A75A::_id_5114( var_6, var_9, var_5, var_1 ) )
        var_5 = "MOD_HEAD_SHOT";

    if ( _id_A7B3::_id_413F( "game", "onlyheadshots" ) )
    {
        if ( var_5 == "MOD_PISTOL_BULLET" || var_5 == "MOD_RIFLE_BULLET" || var_5 == "MOD_EXPLOSIVE_BULLET" )
            return "getTweakableValue( game, onlyheadshots )";
        else if ( var_5 == "MOD_HEAD_SHOT" )
        {
            if ( var_2 _id_A75A::_id_512E() )
                var_3 = 75;
            else
                var_3 = 150;
        }
    }

    if ( var_6 == "none" && isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_0118 ) && issubstr( var_0._id_0118, "vehicle_" ) )
            var_6 = "destructible_car";
    }

    if ( gettime() < var_2._id_03DD + level._id_53A5 )
    {
        var_19 = int( max( var_2._id_01E7 / 4, 1 ) );

        if ( var_3 >= var_19 && _id_A75A::_id_513A( var_6 ) && !_id_A75A::_id_514D( var_5 ) )
            var_3 = var_19;
    }

    if ( !( var_4 & level._id_4B56 ) )
    {
        if ( !level._id_91E4 && var_17 && isdefined( var_1._id_02E9 ) && var_1._id_02E9 == var_2 )
        {
            if ( var_5 == "MOD_CRUSH" )
                var_2 _id_A75A::_id_066F();

            return "ffa suicide";
        }

        if ( ( issubstr( var_5, "MOD_GRENADE" ) || issubstr( var_5, "MOD_EXPLOSIVE" ) || issubstr( var_5, "MOD_PROJECTILE" ) ) && isdefined( var_0 ) && isdefined( var_1 ) )
        {
            if ( var_2 != var_1 && var_0._id_00AB == "grenade" && var_2._id_55DC + 3500 > gettime() && isdefined( var_2._id_55DA ) && distance( var_0._id_02E6, var_2._id_55DA._id_02E6 ) < 250 )
                return "spawnkill grenade protection";

            var_2._id_357C = [];
            var_2._id_357C["damageTime"] = gettime();
            var_2._id_357C["damageId"] = var_0 _meth_81B1();
            var_2._id_357C["returnToSender"] = 0;
            var_2._id_357C["counterKill"] = 0;
            var_2._id_357C["chainKill"] = 0;
            var_2._id_357C["cookedKill"] = 0;
            var_2._id_357C["throwbackKill"] = 0;
            var_2._id_357C["suicideGrenadeKill"] = 0;
            var_2._id_357C["weapon"] = var_6;
            var_20 = issubstr( var_6, "frag_" );

            if ( var_1 != var_2 )
            {
                if ( ( issubstr( var_6, "c4_" ) || issubstr( var_6, "claymore_" ) ) && isdefined( var_1 ) && isdefined( var_0._id_02E9 ) )
                {
                    var_2._id_357C["returnToSender"] = var_0._id_02E9 == var_2;
                    var_2._id_357C["counterKill"] = isdefined( var_0._id_A1BA );
                    var_2._id_357C["chainKill"] = isdefined( var_0._id_A1B7 );
                    var_2._id_357C["bulletPenetrationKill"] = isdefined( var_0._id_A1BC );
                    var_2._id_357C["cookedKill"] = 0;
                }

                if ( isdefined( var_1._id_55A2 ) && var_1._id_55A2 >= gettime() - 50 && var_20 )
                    var_2._id_357C["suicideGrenadeKill"] = 1;
            }

            if ( var_20 )
            {
                var_2._id_357C["cookedKill"] = isdefined( var_0._id_50E5 );
                var_2._id_357C["throwbackKill"] = isdefined( var_0._id_9330 );
            }

            var_2._id_357C["stickKill"] = isdefined( var_0._id_51B8 ) && var_0._id_51B8 == "enemy";
            var_2._id_357C["stickFriendlyKill"] = isdefined( var_0._id_51B8 ) && var_0._id_51B8 == "friendly";

            if ( isplayer( var_1 ) && var_1 != self )
                _id_A789::_id_7F8D( var_0, var_1, var_6 );
        }

        if ( issubstr( var_5, "MOD_IMPACT" ) && ( var_6 == "m320_mp" || issubstr( var_6, "gl" ) || issubstr( var_6, "gp25" ) ) )
        {
            if ( isplayer( var_1 ) && var_1 != self )
                _id_A789::_id_7F8D( var_0, var_1, var_6 );
        }

        if ( var_12 )
        {
            if ( level._id_01A9 == 0 || !isplayer( var_1 ) && level._id_01A9 != 1 )
            {
                if ( var_6 == "artillery_mp" || var_6 == "stealth_bomb_mp" )
                    var_2 _id_25AD( var_0, var_6, var_5, var_3, var_4, var_1 );

                return "friendly fire";
            }
            else if ( level._id_01A9 == 1 )
            {
                if ( var_3 < 1 )
                    var_3 = 1;

                if ( var_2 _id_A75A::_id_512E() )
                    var_3 = _id_A7DC::_id_198D( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9 );

                var_2._id_558E = 0;
                var_2 _id_3798( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );
            }
            else if ( level._id_01A9 == 2 && _id_A75A::_id_5186( var_1 ) )
            {
                var_3 = int( var_3 * 0.5 );

                if ( var_3 < 1 )
                    var_3 = 1;

                var_1._id_558E = 0;
                var_1._id_3A95 = 1;
                var_1 _id_3798( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );
                var_1._id_3A95 = undefined;
            }
            else if ( level._id_01A9 == 3 && _id_A75A::_id_5186( var_1 ) )
            {
                var_3 = int( var_3 * 0.5 );

                if ( var_3 < 1 )
                    var_3 = 1;

                var_2._id_558E = 0;
                var_1._id_558E = 0;
                var_2 _id_3798( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );

                if ( _id_A75A::_id_5186( var_1 ) )
                {
                    var_1._id_3A95 = 1;
                    var_1 _id_3798( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );
                    var_1._id_3A95 = undefined;
                }
            }

            var_18 = 1;
        }
        else
        {
            if ( var_3 < 1 )
                var_3 = 1;

            if ( isdefined( var_1 ) && isplayer( var_1 ) )
                _id_07CC( var_2, var_1, var_0, var_6, var_3, var_7, var_8, var_9, var_10, var_5 );

            if ( isdefined( var_1 ) && !isplayer( var_1 ) && isdefined( var_1._id_02E9 ) && ( !isdefined( var_1._id_78CA ) || !var_1._id_78CA ) )
                _id_07CC( var_2, var_1._id_02E9, var_0, var_6, var_3, var_7, var_8, var_9, var_10, var_5 );
            else if ( isdefined( var_1 ) && !isplayer( var_1 ) && isdefined( var_1._id_7BFC ) && isdefined( var_1._id_78CA ) && var_1._id_78CA )
                _id_07CC( var_2, var_1._id_7BFC, var_0, var_6, var_3, var_7, var_8, var_9, var_10, var_5 );

            if ( var_5 == "MOD_EXPLOSIVE" || var_5 == "MOD_GRENADE_SPLASH" && var_3 < var_2._id_01E7 )
                var_2 notify( "survived_explosion", var_1 );

            if ( isdefined( var_1 ) && isplayer( var_1 ) && isdefined( var_6 ) )
                var_1 thread _id_A7B4::_id_1D0E( var_6, var_2 );

            var_2._id_0E33 = undefined;

            if ( isdefined( var_1 ) && isplayer( var_1 ) && isdefined( var_6 ) && var_1 != var_2 )
                var_2._id_0E33 = var_1._id_02E6;

            if ( issubstr( var_5, "MOD_GRENADE" ) && isdefined( var_0 ) && isdefined( var_0._id_50E5 ) )
                var_2._id_A1B9 = gettime();
            else
                var_2._id_A1B9 = undefined;

            if ( issubstr( var_5, "MOD_IMPACT" ) && isdefined( var_0 ) && isdefined( var_0._id_725B ) && var_0._id_725B )
                var_2._id_A1C7 = 1;
            else
                var_2._id_A1C7 = 0;

            var_2._id_558E = isdefined( var_1 ) && var_1 != var_2;

            if ( var_2._id_558E )
            {
                var_21 = gettime();
                var_1._id_2599[var_2._id_444D] = var_21;
                var_2._id_558C = var_21;
            }

            var_2 _id_3798( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_14 );
            var_2 thread _id_A7A0::_id_6C7F( var_0, var_1, var_3, var_5, var_6, var_9 );
        }

        if ( var_3 > 0 && var_5 != "MOD_FALLING" )
            var_2 _meth_82FB( "ui_damage_flash", 1 );

        if ( var_17 && isdefined( var_1._id_4470 ) )
            var_22 = var_1._id_4470;
        else
            var_22 = var_1;

        if ( isdefined( var_22 ) && ( var_22 != var_2 || _id_A75A::_id_513A( var_6 ) ) && var_3 > 0 && ( !isdefined( var_9 ) || var_9 != "shield" ) )
        {
            if ( !_id_A75A::_id_5186( var_2 ) )
            {
                if ( var_9 == "head" )
                    var_23 = "killshot_headshot";
                else
                    var_23 = "killshot";
            }
            else if ( var_4 & level._id_4B5E )
                var_23 = "stun";
            else if ( var_9 == "head" )
                var_23 = "headshot";
            else if ( isdefined( var_2._id_348D ) && var_2._id_348D == 1 )
                var_23 = "hitmorehealth";
            else if ( isexplosivedamagemod( var_5 ) && var_2 _id_A75A::_id_05CB( "_specialty_blastshield" ) )
                var_23 = "hitblastshield";
            else if ( isdefined( var_2._id_5711 ) && var_5 != "MOD_HEAD_SHOT" && !_id_A75A::_id_5109( var_6, var_5, var_1 ) )
                var_23 = "hitlightarmor";
            else if ( var_2 _id_A75A::_id_512E() )
                var_23 = "hitjuggernaut";
            else if ( !_id_84B7( var_6 ) )
                var_23 = "none";
            else if ( var_6 == "killstreak_solar_mp" )
                var_23 = "mp_solar";
            else if ( var_6 == "killstreak_laser2_mp" )
                var_23 = "laser";
            else if ( isdefined( var_2._id_348D ) && var_2._id_348D )
                var_23 = "hitjuggernaut";
            else
                var_23 = "standard";

            var_22 thread _id_A784::_id_9B04( var_23 );
        }

        _id_A789::_id_7F7F( var_2, 1 );
    }

    if ( isdefined( var_1 ) && var_1 != var_2 && !var_18 )
        level._id_9C0C = 0;

    if ( var_2._id_03BC != "dead" )
    {
        var_24 = var_2 _meth_81B1();
        var_25 = var_2._id_02AB;
        var_26 = var_2._id_030D["team"];
        var_27 = var_2._id_444D;
        var_28 = "";

        if ( isplayer( var_1 ) )
        {
            var_29 = var_1 _meth_81B1();
            var_30 = var_1._id_444D;
            var_31 = var_1._id_02AB;
            var_28 = var_1._id_030D["team"];
        }
        else
        {
            var_29 = -1;
            var_30 = "";
            var_31 = "";
            var_28 = "world";
        }

        if ( isplayer( var_1 ) )
        {
            var_32 = var_1._id_02AB;
            var_33 = var_1._id_02E6;
            var_34 = var_1._id_56F4;
        }
        else
        {
            var_32 = "world";
            var_33 = var_2._id_02E6;
            var_34 = -1;
        }

        var_35 = gettime();

        if ( !isagent( var_2 ) && isdefined( var_2._id_89DE ) && isdefined( var_2._id_89DE._id_03DD ) )
        {
            var_36 = ( var_35 - var_2._id_89DE._id_03DD ) / 1000.0;

            if ( var_36 <= 3.0 && var_2._id_89DE._id_25AB == 0 )
            {
                if ( !isdefined( level._id_59DD ) )
                    level._id_59DD = [];

                if ( !isdefined( level._id_59DD["badSpawnDmgReceivedCount"] ) )
                    level._id_59DD["badSpawnDmgReceivedCount"] = 1;
                else
                    level._id_59DD["badSpawnDmgReceivedCount"]++;

                var_2._id_89DE._id_25AB = 1;

                if ( var_2._id_89DE._id_126D == 0 )
                {
                    if ( !isdefined( level._id_59DD["badSpawnByAnyMeansCount"] ) )
                        level._id_59DD["badSpawnByAnyMeansCount"] = 1;
                    else
                        level._id_59DD["badSpawnByAnyMeansCount"]++;

                    var_2._id_89DE._id_126D = 1;
                }
            }
        }
        else
            var_36 = -1;

        if ( isdefined( var_1 ) && isdefined( var_1._id_89DE ) && isdefined( var_1._id_89DE._id_03DD ) && isplayer( var_1 ) )
        {
            var_37 = ( var_35 - var_1._id_89DE._id_03DD ) / 1000.0;

            if ( var_37 <= 3.0 && var_1._id_89DE._id_2595 == 0 )
            {
                if ( !isdefined( level._id_59DD ) )
                    level._id_59DD = [];

                if ( !isdefined( level._id_59DD["badSpawnDmgDealtCount"] ) )
                    level._id_59DD["badSpawnDmgDealtCount"] = 1;
                else
                    level._id_59DD["badSpawnDmgDealtCount"]++;

                var_1._id_89DE._id_2595 = 1;

                if ( var_1._id_89DE._id_126D == 0 )
                {
                    if ( !isdefined( level._id_59DD["badSpawnByAnyMeansCount"] ) )
                        level._id_59DD["badSpawnByAnyMeansCount"] = 1;
                    else
                        level._id_59DD["badSpawnByAnyMeansCount"]++;

                    var_1._id_89DE._id_126D = 1;
                }
            }
        }
        else
            var_37 = -1;

        if ( !isagent( var_2 ) )
            reconspatialevent( var_2._id_02E6, "script_mp_damage: player_name %s, player_angles %v, hit_loc %s, attacker_name %s, attacker_pos %v, damage %d, weapon %s, damage_type %s, gameTime %d, life_id %d, attacker_life_id %d, spawnToDamageReceivedTime %f, spawnToDamageDealtTime %f", var_2._id_02AB, var_2._id_0041, var_9, var_32, var_33, var_3, var_6, var_5, var_35, var_2._id_56F4, var_34, var_36, var_37 );

        obituary( "D;" + var_27 + ";" + var_24 + ";" + var_26 + ";" + var_25 + ";" + var_30 + ";" + var_29 + ";" + var_28 + ";" + var_31 + ";" + var_6 + ";" + var_3 + ";" + var_5 + ";" + var_9 + "\\n" );
    }

    _id_4920( var_1, var_2, var_3, var_9, var_4 );

    if ( isagent( self ) )
        self [[ maps\mp\agents\_agent_utility::_id_08A6( "on_damaged_finished" ) ]]( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

    return "finished";
}

_id_84B7( var_0 )
{
    switch ( var_0 )
    {
        case "artillery_mp":
        case "stealth_bomb_mp":
            return 0;
    }

    return 1;
}

_id_07CC( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_0._id_0E2C ) )
        var_0._id_0E2C = [];

    if ( !isdefined( var_0._id_0E2C[var_1._id_444D] ) )
    {
        var_0._id_0E34[var_1._id_444D] = var_1;
        var_0._id_0E2C[var_1._id_444D] = spawnstruct();
        var_0._id_0E2C[var_1._id_444D]._id_00FB = 0;
        var_0._id_0E2C[var_1._id_444D]._id_0E2D = var_1;
        var_0._id_0E2C[var_1._id_444D]._id_3820 = gettime();
    }

    if ( _id_A7B4::_id_5182( var_3 ) && !_id_A7B4::_id_51A4( var_3 ) )
        var_0._id_0E2C[var_1._id_444D]._id_5181 = 1;

    var_0._id_0E2C[var_1._id_444D]._id_00FB += var_4;
    var_0._id_0E2C[var_1._id_444D]._id_0512 = var_3;
    var_0._id_0E2C[var_1._id_444D]._id_9F3B = var_5;
    var_0._id_0E2C[var_1._id_444D]._id_9C60 = var_6;
    var_0._id_0E2C[var_1._id_444D]._id_83C8 = var_7;
    var_0._id_0E2C[var_1._id_444D]._id_034E = var_8;
    var_0._id_0E2C[var_1._id_444D]._id_8676 = var_9;
    var_0._id_0E2C[var_1._id_444D]._id_0E2D = var_1;
    var_0._id_0E2C[var_1._id_444D]._id_5603 = gettime();

    if ( isdefined( var_2 ) && !isplayer( var_2 ) && isdefined( var_2._id_0343 ) )
        var_0._id_0E2C[var_1._id_444D]._id_8A9F = var_2._id_0343;
    else if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 _meth_8312() != "none" )
        var_0._id_0E2C[var_1._id_444D]._id_8A9F = var_1 _meth_8312();
    else
        var_0._id_0E2C[var_1._id_444D]._id_8A9F = undefined;

    if ( !isdefined( var_0._id_32AD ) )
        var_0._id_32AD = [];

    if ( isplayer( var_1 ) )
    {
        if ( !isdefined( var_0._id_32AD[var_1._id_444D] ) )
            var_0._id_32AD[var_1._id_444D] = 0;

        var_0._id_32AD[var_1._id_444D]++;
        var_0._id_55D5 = var_1._id_1F0F;
    }
}

_id_7442()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    _id_1EEC();
    wait 1.75;
    self._id_0E34 = [];
    self._id_0E2C = [];
}

_id_1EEC()
{
    self._id_32AD = [];
    self._id_2515 = 0;
}

_id_1EED()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 3;

        if ( isdefined( self._id_32AD ) && self._id_32AD.size > 0 )
            continue;
        else
            self._id_2515 = 0;
    }
}

is_countered_by_hardwired( var_0 )
{
    switch ( var_0 )
    {
        case "stun_grenade_mp":
        case "paint_grenade_mp":
        case "emp_grenade_mp":
        case "stun_grenade_var_mp":
        case "emp_grenade_var_mp":
        case "paint_grenade_var_mp":
            return 1;
    }

    return 0;
}

_id_19F1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = _id_19F2( var_0, var_1, self, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_3798( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_11 = 0;

    if ( _id_A75A::_id_51E0() && var_2 >= self._id_01E7 && !( var_3 & level._id_4B5E ) && !isdefined( self._id_4E3A ) && !self _meth_852C() )
        var_11 = 1;

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_11 = 0;

    if ( var_11 || _id_A75A::_id_5190() )
    {
        if ( !isdefined( var_7 ) )
            var_7 = ( 0, 0, 0 );

        if ( !isdefined( var_1 ) && !isdefined( var_0 ) )
        {
            var_1 = self;
            var_0 = var_1;
        }

        _id_6CD5( var_0, var_1, self, var_2, var_4, var_5, var_7, var_8, var_9, 0, 1 );
    }
    else
    {
        if ( !_id_19EF( var_0, var_1, var_2 - var_2 * var_10, var_3, var_4, var_5, var_6, var_7, var_8, var_9 ) )
            return;

        if ( !isalive( self ) )
            return;

        if ( isplayer( self ) )
        {
            var_12 = shouldplayblastimpact( var_3, var_4, var_5 );
            var_13 = self _meth_826A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_12 );

            if ( isdefined( var_13 ) )
                thread finishplayerdamage_impactfxwrapper( var_13[0], var_13[1], var_13[2], var_13[3], var_13[4], var_13[5], var_13[6] );
        }
    }

    if ( var_4 == "MOD_EXPLOSIVE_BULLET" )
        self _meth_8182( "damage_mp", getdvarfloat( "scr_csmode" ) );

    _id_25AD( var_0, var_5, var_4, var_2, var_3, var_1 );
}

shouldplayblastimpact( var_0, var_1, var_2 )
{
    if ( var_0 & level._id_4B5A && isexplosivedamagemod( var_1 ) )
    {
        if ( is_countered_by_hardwired( var_2 ) )
        {
            if ( !_id_A75A::_id_05CB( "specialty_class_hardwired" ) )
                return 1;
        }
        else if ( !_id_A75A::_id_05CB( "specialty_hard_shell" ) )
            return 1;
    }

    return 0;
}

finishplayerdamage_impactfxwrapper( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    waitframe;

    if ( !isdefined( self ) || !isdefined( var_0 ) )
        return;

    self _meth_853F( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_19F6( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = spawnstruct();
    var_9._id_301F = var_0;
    var_9._id_0055 = var_1;
    var_9._id_4B51 = var_2;
    var_9._id_0E33 = var_1._id_02E6;

    if ( var_1 == self )
        var_9._id_8676 = "MOD_SUICIDE";
    else
        var_9._id_8676 = var_3;

    var_9._id_901E = var_4;

    if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 _meth_8312() != "none" )
        var_9._id_8A9F = var_1 _meth_8312();
    else
        var_9._id_8A9F = undefined;

    var_9._id_9C60 = var_5;
    var_9._id_83C8 = var_6;
    var_9._id_55EE = gettime();
    var_10 = _id_5A58( var_4, var_3, var_6 );

    if ( isdefined( self._id_315E ) )
        var_10 = 0;

    if ( level._id_91E4 && isdefined( var_1._id_04A8 ) && var_1._id_04A8 == self._id_04A8 )
        var_10 = 0;

    if ( level._id_2A54 )
    {
        if ( level._id_91E6[self._id_04A8] <= 1 )
            var_10 = 0;
        else if ( _id_A75A::_id_51C9() )
        {
            var_10 = 0;
            _id_A75A::_id_53AD( self._id_04A8 );
        }
    }

    if ( !var_10 )
    {
        self._id_55E9 = var_9;
        self._id_9BFE = 1;
        _id_A75A::_id_066F();
    }
    else
    {
        self._id_4E39 = 1;
        var_11 = spawnstruct();

        if ( _id_A75A::_id_05CB( "specialty_finalstand" ) )
        {
            var_11._id_939B = game["strings"]["final_stand"];
            var_11._id_4B45 = level._id_8A36;
        }
        else
        {
            var_11._id_939B = game["strings"]["last_stand"];
            var_11._id_4B45 = level._id_8A36;
        }

        var_11._id_01C0 = ( 1, 0, 0 );
        var_11._id_8893 = "mp_last_stand";
        var_11._id_0137 = 2.0;
        self._id_01E7 = 1;
        thread _id_A79C::_id_622B( var_11 );
        var_12 = "frag_grenade_mp";

        if ( _id_A75A::_id_05CB( "specialty_finalstand" ) )
        {
            self._id_55E9 = var_9;
            self._id_4C57 = 1;
            var_13 = self _meth_82D0();

            foreach ( var_15 in var_13 )
                self _meth_830F( var_15 );

            _id_A4F0::_id_0586();
            thread _id_3111();
            thread _id_55EF( 20, 1 );
        }
        else
        {
            if ( level._id_2A54 )
            {
                var_1 thread _id_A72E::_id_535E( self, var_4, var_3 );
                self._id_55E9 = var_9;
                _id_A4F0::_id_0587();
                thread _id_55EF( 20, 0 );
                _id_A4F0::_id_0586();
                return;
            }

            self._id_55E9 = var_9;
            var_17 = undefined;
            var_18 = self _meth_830C();

            foreach ( var_15 in var_18 )
            {
                if ( _id_A7B4::_id_51A4( var_15 ) )
                    var_17 = var_15;
            }

            if ( !isdefined( var_17 ) )
            {
                var_17 = "iw6_p226_mp";
                _id_A75A::_id_05C0( var_17 );
            }

            self _meth_8332( var_17 );
            self _meth_8321();
            _id_A4F0::_id_0586();

            if ( !_id_A75A::_id_05CB( "specialty_laststandoffhand" ) )
                self _meth_831F();

            self _meth_8315( var_17 );
            thread _id_55EF( 10, 0 );
        }
    }
}

_id_2A51( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    wait(var_0);
    self._id_9BFE = 1;
    _id_A75A::_id_066F();
}

_id_29B1()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self waittill( "detonate" );
    self._id_9BFE = 1;
    _id_1970();
}

_id_29B0()
{
    self endon( "detonate" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_1970();
}

_id_1970()
{
    self _meth_809A( "detpack_explo_default" );
    self._id_1971 = playfx( level._id_196F, self._id_02E6 );
    radiusdamage( self._id_02E6, 312, 100, 100, self );

    if ( isalive( self ) )
        _id_A75A::_id_066F();
}

_id_3111()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    _id_A75A::_id_3A30( 1 );
    wait 0.3;
    _id_A75A::_id_3A30( 0 );
}

_id_55EF( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "revive" );
    level endon( "game_ended" );
    level notify( "player_last_stand" );
    thread _id_55F3();
    self._id_024D = 1;

    if ( !var_1 && ( !isdefined( self._id_4C11 ) || !self._id_4C11 ) )
    {
        thread _id_55E2();
        _id_A75A::_id_7F9F( "last_stand", &"PLATFORM_COWARDS_WAY_OUT", undefined, undefined, undefined, undefined, undefined, undefined, 1 );
        thread _id_55E6();
    }

    if ( level._id_2A54 == 1 && level._id_2A54 != 2 )
    {
        var_2 = spawn( "script_model", self._id_02E6 );
        var_2 _meth_80B1( "tag_origin" );
        var_2 _meth_80DA( "HINT_NOICON" );
        var_2 _meth_80DB( &"PLATFORM_REVIVE" );
        var_2 _id_74FB( self );
        var_2 endon( "death" );
        var_3 = newteamhudelem( self._id_04A8 );
        var_3 _meth_80CC( "waypoint_revive", 8, 8 );
        var_3 _meth_80D8( 1, 1 );
        var_3 _meth_80CD( self );
        var_3 thread _id_28F0( var_2 );
        var_3._id_00C5 = ( 0.33, 0.75, 0.24 );
        _id_A75A::_id_6A3C();

        if ( var_1 )
        {
            wait(var_0);

            if ( self._id_4C57 )
                thread _id_55E4( var_1, var_2 );
        }

        return;
    }
    else if ( level._id_2A54 == 2 )
    {
        thread _id_55E6();
        var_2 = spawn( "script_model", self._id_02E6 );
        var_2 _meth_80B1( "tag_origin" );
        var_2 _meth_80DA( "HINT_NOICON" );
        var_2 _meth_80DB( &"PLATFORM_REVIVE" );
        var_2 _id_74FB( self );
        var_2 endon( "death" );
        var_3 = newteamhudelem( self._id_04A8 );
        var_3 _meth_80CC( "waypoint_revive", 8, 8 );
        var_3 _meth_80D8( 1, 1 );
        var_3 _meth_80CD( self );
        var_3 thread _id_28F0( var_2 );
        var_3._id_00C5 = ( 0.33, 0.75, 0.24 );
        _id_A75A::_id_6A3C();

        if ( var_1 )
        {
            wait(var_0);

            if ( self._id_4C57 )
                thread _id_55E4( var_1, var_2 );
        }

        wait(var_0 / 3);
        var_3._id_00C5 = ( 1, 0.64, 0 );

        while ( var_2._id_020E )
            wait 0.05;

        _id_A75A::_id_6A3C();
        wait(var_0 / 3);
        var_3._id_00C5 = ( 1, 0, 0 );

        while ( var_2._id_020E )
            wait 0.05;

        _id_A75A::_id_6A3C();
        wait(var_0 / 3);

        while ( var_2._id_020E )
            wait 0.05;

        wait 0.05;
        thread _id_55E4( var_1 );
        return;
    }

    thread _id_55E6();
    wait(var_0);
    thread _id_55E4( var_1 );
}

_id_5A38( var_0, var_1 )
{
    self endon( "stop_maxHealthOverlay" );
    self endon( "revive" );
    self endon( "death" );

    for (;;)
    {
        self._id_01E7 -= 1;
        self._id_0275 = var_0;
        wait 0.05;
        self._id_0275 = 50;
        self._id_01E7 += 1;
        wait 0.5;
    }
}

_id_55E4( var_0, var_1 )
{
    if ( var_0 )
    {
        self._id_024D = undefined;
        self._id_4C57 = 0;
        self notify( "revive" );
        _id_A75A::_id_1EF5( "last_stand" );
        _id_A7A7::_id_55EA();

        if ( isdefined( var_1 ) )
            var_1 delete();
    }
    else
    {
        self._id_9BFE = 1;
        self._id_13AB = 0;
        _id_A75A::_id_066F();
    }
}

_id_55E2()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "revive" );

    for (;;)
    {
        if ( self _meth_833C() )
        {
            var_0 = gettime();

            while ( self _meth_833C() )
            {
                wait 0.05;

                if ( gettime() - var_0 > 700 )
                    break;
            }

            if ( gettime() - var_0 > 700 )
                break;
        }

        wait 0.05;
    }

    thread _id_55E4( 0 );
}

_id_55E6()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "revive" );

    while ( !level._id_3BD8 )
    {
        self._id_01E7 = 2;
        wait 0.05;
        self._id_01E7 = 1;
        wait 0.5;
    }

    self._id_01E7 = self._id_0275;
}

_id_55F3()
{
    self endon( "disconnect" );
    self endon( "revive" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_A75A::_id_1EF5( "last_stand" );
    self._id_024D = undefined;
}

_id_5A58( var_0, var_1, var_2 )
{
    if ( var_1 == "MOD_TRIGGER_HURT" )
        return 0;

    if ( var_1 != "MOD_PISTOL_BULLET" && var_1 != "MOD_RIFLE_BULLET" && var_1 != "MOD_FALLING" && var_1 != "MOD_EXPLOSIVE_BULLET" )
        return 0;

    if ( var_1 == "MOD_IMPACT" && ( var_0 == "throwingknife_mp" || var_0 == "throwingknifejugg_mp" ) )
        return 0;

    if ( var_1 == "MOD_IMPACT" && ( var_0 == "m79_mp" || issubstr( var_0, "gl_" ) ) )
        return 0;

    if ( _id_A75A::_id_5114( var_0, var_2, var_1 ) )
        return 0;

    if ( _id_A75A::_id_51E0() )
        return 0;

    return 1;
}

_id_32D3()
{
    if ( !isdefined( self._id_55E9._id_0055 ) )
        self._id_55E9._id_0055 = self;
}

_id_3FC9( var_0 )
{
    switch ( var_0 )
    {
        case "head":
        case "helmet":
        case "neck":
            return 60;
        case "gun":
        case "torso_upper":
        case "right_arm_upper":
        case "left_arm_upper":
        case "right_arm_lower":
        case "left_arm_lower":
        case "right_hand":
        case "left_hand":
            return 48;
        case "torso_lower":
            return 40;
        case "right_leg_upper":
        case "left_leg_upper":
            return 32;
        case "right_leg_lower":
        case "left_leg_lower":
            return 10;
        case "right_foot":
        case "left_foot":
            return 5;
    }

    return 48;
}

_id_3FCA( var_0 )
{
    switch ( var_0 )
    {
        case "helmet":
            return "j_neck";
        case "head":
            return "j_neck";
        case "neck":
            return "j_neck";
        case "torso_upper":
            return "j_neck";
        case "right_arm_upper":
            return "J_Shoulder_RI";
        case "left_arm_upper":
            return "J_Shoulder_LE";
        case "right_arm_lower":
            return "J_Elbow_RI";
        case "left_arm_lower":
            return "J_Elbow_LE";
        case "right_hand":
            return "J_Wrist_RI";
        case "left_hand":
            return "J_Wrist_LE";
        case "gun":
            return "J_Wrist_RI";
        case "torso_lower":
            return "J_SpineLower";
        case "right_leg_upper":
            return "J_Hip_RI";
        case "left_leg_upper":
            return "J_Hip_LE";
        case "right_leg_lower":
            return "J_Knee_RI";
        case "left_leg_lower":
            return "J_Knee_LE";
        case "right_foot":
            return "J_Ankle_RI";
        case "left_foot":
            return "J_Ankle_LE";
    }

    return undefined;
}

_id_27ED( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_0 ) )
    {
        var_6 = var_0 _meth_801B();

        if ( animhasnotetrack( var_6, "ignore_ragdoll" ) )
            return;
    }

    if ( isdefined( level._id_6157 ) && level._id_6157.size )
    {
        foreach ( var_8 in level._id_6157 )
        {
            if ( distancesquared( var_0._id_02E6, var_8._id_02E6 ) < 65536 )
                return;
        }
    }

    wait 0.2;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 _meth_81E0() )
        return;

    var_6 = var_0 _meth_801B();
    var_10 = 0.35;

    if ( animhasnotetrack( var_6, "start_ragdoll" ) )
    {
        var_11 = getnotetracktimes( var_6, "start_ragdoll" );

        if ( isdefined( var_11 ) )
            var_10 = var_11[0];
    }

    var_12 = var_10 * getanimlength( var_6 );
    wait(var_12);

    if ( isdefined( var_0 ) )
        var_0 _meth_8023();
}

_id_402A()
{
    var_0 = "";
    var_1 = 0;
    var_2 = getarraykeys( self._id_535B );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( self._id_535B[var_4] <= var_1 )
            continue;

        var_1 = self._id_535B[var_4];
        var_5 = var_4;
    }

    return var_0;
}

_id_4029()
{
    var_0 = "";
    var_1 = 0;
    var_2 = getarraykeys( self._id_535F );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( self._id_535F[var_4] <= var_1 )
            continue;

        var_1 = self._id_535F[var_4];
        var_0 = var_4;
    }

    return var_0;
}

_id_25AD( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread _id_A7B4::_id_64FA( var_0, var_1, var_2, var_3, var_5 );
    self _meth_80AD( "sniper_fire" );
}

_id_74FB( var_0 )
{
    var_1 = var_0._id_04A8;
    self _meth_804D( var_0, "tag_origin" );
    self._id_02E9 = var_0;
    self._id_020E = 0;
    self _meth_80BF();
    _id_9B8E( var_1 );
    thread _id_950D( var_1 );
    thread _id_74FD( var_1 );
    thread _id_285B();
}

_id_285B()
{
    self endon( "death" );
    self._id_02E9 _id_A4F0::_id_A060( "death", "disconnect" );
    self delete();
}

_id_9B8E( var_0 )
{
    foreach ( var_2 in level._id_0328 )
    {
        if ( var_0 == var_2._id_04A8 && var_2 != self._id_02E9 )
        {
            self _meth_800A( var_2 );
            continue;
        }

        self _meth_800B( var_2 );
    }
}

_id_950D( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "joined_team" );
        _id_9B8E( var_0 );
    }
}

_id_94F9( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "player_last_stand" );
        _id_9B8E( var_0 );
    }
}

_id_74FD( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_1 );
        self._id_02E9._id_13AB = 1;

        if ( isdefined( var_1._id_13AB ) && var_1._id_13AB )
        {
            self._id_02E9._id_13AB = 0;
            continue;
        }

        self _meth_80C0();
        self._id_02E9 _id_A75A::_id_3A30( 1 );
        var_2 = reviveholdthink( var_1 );
        self._id_02E9._id_13AB = 0;

        if ( !isalive( self._id_02E9 ) )
        {
            self delete();
            return;
        }

        self._id_02E9 _id_A75A::_id_3A30( 0 );

        if ( var_2 )
        {
            level thread _id_A7AA::_id_1208( "reviver", var_1 );
            self._id_02E9._id_024D = undefined;
            self._id_02E9 _id_A75A::_id_1EF5( "last_stand" );
            self._id_02E9._id_5F78 = level._id_1317;

            if ( self._id_02E9 _id_A75A::_id_05CB( "specialty_lightweight" ) )
                self._id_02E9._id_5F78 = _id_A75A::_id_575E();

            self._id_02E9 _id_A4F0::_id_0595();
            self._id_02E9._id_0275 = 100;
            self._id_02E9 _id_A7B4::_id_9B35();
            self._id_02E9 _id_A7A7::_id_55EA();
            self._id_02E9 _id_A75A::_id_41F5( "specialty_pistoldeath", 0 );
            self._id_02E9._id_13AB = 0;
            self delete();
            return;
        }

        self _meth_80BF();
        _id_9B8E( var_0 );
    }
}

reviveholdthink( var_0, var_1, var_2 )
{
    var_3 = 3000;
    var_4 = spawn( "script_origin", self._id_02E6 );
    var_4 _meth_8054();

    if ( isplayer( var_0 ) )
        var_0 _meth_807C( var_4 );
    else
        var_0 _meth_804D( var_4 );

    var_0 _meth_8081();

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( var_2 )
        var_0 _id_A4F0::_id_0587();

    self._id_24C9 = 0;
    self._id_020E = 1;
    self._id_9C08 = 0;

    if ( isdefined( var_1 ) )
        self._id_9C11 = var_1;
    else
        self._id_9C11 = var_3;

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_0 thread personalusebaroldstyle( self );
    else
        var_0 thread _id_67E2( self );

    thread reviveholdthink_cleanup( var_0, var_2, var_4 );
    var_5 = reviveholdthinkloop( var_0 );
    self._id_020E = 0;
    var_4 delete();

    if ( isdefined( var_5 ) && var_5 )
    {
        self._id_02E9 thread _id_A79C::_id_6C6C( "revived", var_0 );
        self._id_02E9._id_4E39 = 0;
        return 1;
    }

    return 0;
}

reviveholdthink_cleanup( var_0, var_1, var_2 )
{
    _id_A4F0::_id_A061( self, "death", var_2, "death" );

    if ( !_func_294( var_2 ) )
        var_2 delete();

    if ( isdefined( var_0 ) && _id_A75A::_id_5186( var_0 ) )
    {
        var_0 _meth_804F();

        if ( var_1 )
            var_0 _id_A4F0::_id_0595();
    }
}

_id_67E2( var_0 )
{
    self _meth_82FB( "ui_use_bar_text", 3 );
    self _meth_82FB( "ui_use_bar_start_time", int( gettime() ) );
    var_1 = undefined;

    if ( isdefined( var_0 ) && isdefined( var_0._id_02E9 ) )
    {
        var_1 = var_0._id_02E9;
        var_1 _meth_82FB( "ui_use_bar_text", 4 );
        var_1 _meth_82FB( "ui_use_bar_start_time", int( gettime() ) );
    }

    var_2 = -1;

    while ( _id_A75A::_id_5186( self ) && isdefined( var_0 ) && var_0._id_020E && !level._id_3BD8 && isdefined( self ) )
    {
        if ( var_2 != var_0._id_9C08 )
        {
            if ( var_0._id_24C9 > var_0._id_9C11 )
                var_0._id_24C9 = var_0._id_9C11;

            if ( var_0._id_9C08 > 0 )
            {
                var_3 = gettime();
                var_4 = var_0._id_24C9 / var_0._id_9C11;
                var_5 = var_3 + ( 1 - var_4 ) * var_0._id_9C11 / var_0._id_9C08;
                self _meth_82FB( "ui_use_bar_end_time", int( var_5 ) );

                if ( isdefined( var_1 ) )
                    var_1 _meth_82FB( "ui_use_bar_end_time", int( var_5 ) );
            }

            var_2 = var_0._id_9C08;
        }

        wait 0.05;
    }

    if ( isdefined( self ) )
        self _meth_82FB( "ui_use_bar_end_time", 0 );

    if ( isdefined( var_1 ) )
        var_1 _meth_82FB( "ui_use_bar_end_time", 0 );
}

personalusebaroldstyle( var_0 )
{
    var_1 = _id_A79D::_id_2435();
    var_2 = _id_A79D::_id_2436();
    var_2 _meth_80CA( &"MPUI_REVIVING" );
    var_3 = var_0._id_02E9 _id_A79D::_id_2435();
    var_4 = var_0._id_02E9 _id_A79D::_id_2436();
    var_4 _meth_80CA( &"MPUI_BEING_REVIVED" );
    var_5 = -1;

    while ( _id_A75A::_id_5186( self ) && isdefined( var_0 ) && var_0._id_020E && !level._id_3BD8 && isdefined( self ) )
    {
        if ( var_5 != var_0._id_9C08 )
        {
            if ( var_0._id_24C9 > var_0._id_9C11 )
                var_0._id_24C9 = var_0._id_9C11;

            var_1 _id_A79D::_id_9AEF( var_0._id_24C9 / var_0._id_9C11, 1000 / var_0._id_9C11 * var_0._id_9C08 );
            var_3 _id_A79D::_id_9AEF( var_0._id_24C9 / var_0._id_9C11, 1000 / var_0._id_9C11 * var_0._id_9C08 );

            if ( !var_0._id_9C08 )
            {
                var_1 _id_A79D::_id_486E();
                var_2 _id_A79D::_id_486E();
                var_3 _id_A79D::_id_486E();
                var_4 _id_A79D::_id_486E();
            }
            else
            {
                var_1 _id_A79D::_id_8504();
                var_2 _id_A79D::_id_8504();
                var_3 _id_A79D::_id_8504();
                var_4 _id_A79D::_id_8504();
            }
        }

        var_5 = var_0._id_9C08;
        wait 0.05;
    }

    if ( isdefined( var_1 ) )
        var_1 _id_A79D::_id_28E8();

    if ( isdefined( var_2 ) )
        var_2 _id_A79D::_id_28E8();

    if ( isdefined( var_3 ) )
        var_3 _id_A79D::_id_28E8();

    if ( isdefined( var_4 ) )
        var_4 _id_A79D::_id_28E8();
}

reviveholdthinkloop( var_0 )
{
    level endon( "game_ended" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );

    while ( _id_A75A::_id_5186( var_0 ) && var_0 _meth_833C() && self._id_24C9 < self._id_9C11 && !( isdefined( var_0._id_4E39 ) && var_0._id_4E39 ) )
    {
        self._id_24C9 += 50 * self._id_9C08;
        self._id_9C08 = 1;

        if ( self._id_24C9 >= self._id_9C11 )
        {
            self._id_020E = 0;
            return _id_A75A::_id_5186( var_0 );
        }

        wait 0.05;
    }

    return 0;
}

_id_19EF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( self._id_558E ) && self._id_558E && var_2 >= self._id_01E7 && isdefined( self._id_20AB ) && self._id_20AB == "specialty_endgame" )
    {
        _id_A75A::_id_41F5( "specialty_endgame", 0 );
        return 0;
    }

    return 1;
}

_id_3063( var_0 )
{
    physicsexplosionsphere( self._id_02E6, 64, 64, 1 );
    var_1 = [];

    for ( var_2 = 0; var_2 < 360; var_2 += 30 )
    {
        var_3 = cos( var_2 ) * 16;
        var_4 = sin( var_2 ) * 16;
        var_5 = bullettrace( self._id_02E6 + ( var_3, var_4, 4 ), self._id_02E6 + ( var_3, var_4, -6 ), 1, self );

        if ( isdefined( var_5["entity"] ) && isdefined( var_5["entity"]._id_04A7 ) && ( var_5["entity"]._id_04A7 == "destructible_vehicle" || var_5["entity"]._id_04A7 == "destructible_toy" ) )
            var_1[var_1.size] = var_5["entity"];
    }

    if ( var_1.size )
    {
        var_6 = spawn( "script_origin", self._id_02E6 );
        var_6 _meth_8054();
        var_6._id_04D8 = "soft_landing";
        var_6._id_2939 = var_1;
        radiusdamage( self._id_02E6, 64, 100, 100, var_6 );
        wait 0.1;
        var_6 delete();
    }
}

_id_0602( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0._id_04A8;

    foreach ( var_6 in level._id_0328 )
    {
        var_7 = var_6._id_04A8;

        if ( var_7 == "spectator" )
        {
            var_6 _meth_826D( &"MP_OBITUARY_NEUTRAL", var_1._id_02AB, var_0._id_02AB );
            continue;
        }

        if ( var_7 == var_4 )
        {
            var_6 _meth_826D( &"MP_OBITUARY_ENEMY", var_1._id_02AB, var_0._id_02AB );
            continue;
        }

        var_6 _meth_826D( &"MP_OBITUARY_FRIENDLY", var_1._id_02AB, var_0._id_02AB );
    }
}

_id_5847( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = self _meth_81B1();
    var_8 = self._id_02AB;
    var_9 = self._id_04A8;
    var_10 = self._id_444D;

    if ( isplayer( var_1 ) )
    {
        var_11 = var_1._id_444D;
        var_12 = var_1._id_02AB;
        var_13 = var_1._id_04A8;
        var_14 = var_1 _meth_81B1();
        var_15 = var_1._id_0537 + "(" + var_12 + ")";
    }
    else
    {
        var_11 = "";
        var_12 = "";
        var_13 = "world";
        var_14 = -1;
        var_15 = "none";
    }

    obituary( "K;" + var_10 + ";" + var_7 + ";" + var_9 + ";" + var_8 + ";" + var_11 + ";" + var_14 + ";" + var_13 + ";" + var_12 + ";" + var_4 + ";" + var_2 + ";" + var_3 + ";" + var_6 + "\\n" );
}

_id_28F0( var_0 )
{
    var_0 waittill( "death" );
    self _meth_8088();
}

_id_3BF4( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( isdefined( var_2 ) && isplayer( var_2 ) && isalive( var_2 ) )
    {
        if ( level._id_59E3 )
            var_3 *= level._id_59E3;

        if ( level._id_59E8 )
            var_2._id_01E7 = int( min( float( var_2._id_0275 ), float( var_2._id_01E7 + 20 ) ) );
    }

    return var_3;
}

_id_7F5F( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = "normal";

    if ( !isdefined( var_3 ) )
        var_3 = ::_id_5D4C;

    self _meth_82C0( 1 );

    if ( isdefined( self._id_00AB ) && self._id_00AB != "script_vehicle" )
        self _meth_8495( 1 );

    self._id_01E7 = 999999;
    self._id_0275 = var_0;
    self._id_0102 = 0;
    self._id_1485 = var_4;
    self._id_259C = var_1;
    self._id_258D = ::_id_6FF4;
    self._id_5D4D = var_3;
    self._id_6468 = var_2;
    self._id_0E31 = [];
}

_id_6FF4( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( self ) )
        return;

    if ( !( isdefined( level._id_511A ) && level._id_511A ) && !( isdefined( level.iszombiegame ) && level.iszombiegame ) && isdefined( var_1 ) && !_id_A75A::_id_510F( var_1 ) )
        return;

    if ( isdefined( var_1 ) && !_id_A7B4::_id_3AA4( self._id_02E9, var_1 ) )
        return;

    var_1 _meth_80AD( "damage_light" );

    if ( isdefined( self._id_50E8 ) && self._id_50E8 )
        return;

    if ( isdefined( self._id_5143 ) && self._id_5143 )
        return;

    if ( isdefined( self._id_8EDB ) && self._id_8EDB )
        return;

    var_12 = var_2;

    if ( isdefined( var_5 ) )
    {
        var_13 = _id_A75A::_id_8F56( var_5, "_lefthand" );

        switch ( var_13 )
        {
            case "paint_grenade_mp":
            case "smoke_grenade_mp":
            case "paint_grenade_var_mp":
            case "smoke_grenade_var_mp":
                return;
        }

        if ( isdefined( level._id_511A ) && level._id_511A )
            self.damageloc = var_11;

        var_12 = [[ self._id_5D4D ]]( var_1, var_5, var_4, var_2 );

        if ( isdefined( level._id_511A ) && level._id_511A )
            self.damageloc = undefined;
    }

    if ( var_12 < 0 )
        return 1;

    if ( isdefined( var_3 ) && var_3 & level._id_4B59 )
        self._id_A1BC = 1;

    self._id_A1BA = 1;
    self._id_0102 += var_12;
    _id_A7C3::_id_5399( var_1, var_5, self );

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
    {
        var_1 _id_A784::_id_9B04( self._id_259C );

        if ( _id_5156( var_1 ) )
            self._id_0E31[self._id_0E31.size] = var_1;
    }

    if ( self._id_0102 >= self._id_0275 )
    {
        if ( self._id_1485 && isplayer( var_1 ) )
            var_1 notify( "destroyed_killstreak", var_5 );

        if ( self._id_00AB == "script_vehicle" || self._id_00AB == "script_model" )
        {
            var_14 = _id_A75A::_id_3F0F( var_5, 1 );

            if ( _id_A75A::_id_514A( var_14 ) )
                var_14 = _id_A781::_id_3F0E( var_14 );

            var_15 = _id_A7A0::_id_3CE6( var_5, var_14 );

            if ( isdefined( self._id_02A0 ) && var_15 == "weapon_launcher" )
            {
                if ( issubstr( self._id_02A0, "uav" ) )
                {
                    if ( isdefined( level._id_1C62["ch_uav_" + var_14] ) )
                        var_1 _id_A7A0::_id_6FF3( "ch_uav_" + var_14 );
                }

                if ( issubstr( self._id_02A0, "warbird" ) )
                {
                    if ( isdefined( level._id_1C62["ch_warbird_" + var_14] ) )
                        var_1 _id_A7A0::_id_6FF3( "ch_warbird_" + var_14 );
                }

                if ( issubstr( self._id_02A0, "orbital_platform" ) )
                {
                    if ( isdefined( level._id_1C62["ch_paladin_" + var_14] ) )
                        var_1 _id_A7A0::_id_6FF3( "ch_paladin_" + var_14 );
                }

                if ( issubstr( self._id_02A0, "drone" ) && !issubstr( self._id_02A0, "uav" ) )
                {
                    if ( isdefined( level._id_1C62["ch_drone_" + var_14] ) )
                        var_1 _id_A7A0::_id_6FF3( "ch_drone_" + var_14 );
                }
            }
        }

        self._id_8EDB = 1;
        self thread [[ self._id_6468 ]]( var_1, var_5, var_4, var_2 );
    }
}

_id_5156( var_0 )
{
    foreach ( var_2 in self._id_0E31 )
    {
        if ( var_0 == var_2 )
            return 0;
    }

    return 1;
}

_id_5D4C( var_0, var_1, var_2, var_3 )
{
    var_4 = var_3;
    var_4 = _id_4664( var_1, var_2, var_4 );
    var_4 = _id_465A( var_1, var_2, var_4, var_0 );
    var_4 = _id_4666( var_1, var_2, var_4 );
    var_4 = _id_465F( var_1, var_2, var_4 );
    var_4 = _id_4646( var_1, var_2, var_4, var_0 );
    return var_4;
}

_id_4666( var_0, var_1, var_2 )
{
    var_3 = var_2;

    switch ( var_0 )
    {
        case "bomb_site_mp":
        case "remotemissile_projectile_mp":
        case "remotemissile_projectile_cluster_parent_mp":
        case "remotemissile_projectile_gas_mp":
        case "orbital_carepackage_pod_mp":
        case "orbital_carepackage_droppod_mp":
        case "stinger_mp":
        case "stealth_bomb_mp":
        case "orbital_carepackage_pod_plane_mp":
        case "remotemissile_projectile_cluster_child_mp":
        case "dam_turret_mp":
        case "warbird_missile_mp":
        case "remotemissile_projectile_cluster_child_hellfire_mp":
        case "remotemissile_projectile_secondary_mp":
        case "airstrike_missile_mp":
        case "orbitalsupport_105mm_mp":
        case "orbitalsupport_missile_mp":
            self._id_54BD = 1;
            var_3 = self._id_0275 + 1;
            break;
        case "killstreak_laser2_mp":
            self._id_54BD = 1;
            var_4 = level._id_7CC2._id_6632;
            var_5 = 0.34;

            if ( isdefined( var_4 ) && var_4.size > 0 )
            {
                var_6 = var_4.size;

                if ( var_4.size >= 3 )
                    var_6 = 3;

                var_5 *= var_6;
            }

            var_3 = self._id_0275 * var_5;
            break;
        case "turretheadrocket_mp":
        case "ugv_missile_mp":
        case "assaultdrone_c4_mp":
        case "killstreakmahem_mp":
        case "killstreak_orbital_laser_mp":
            self._id_54BD = 0;
            var_3 = self._id_0275 + 1;
            break;
        case "orbitalsupport_40mm_mp":
        case "orbitalsupport_40mmbuddy_mp":
            self._id_54BD = 0;
            var_3 *= 2;
            break;
    }

    return var_3;
}

_id_465F( var_0, var_1, var_2 )
{
    var_3 = _id_A75A::_id_8F56( var_0, "_lefthand" );

    if ( var_3 == "stun_grenade_mp" || var_3 == "stun_grenade_var_mp" || var_3 == "stun_grenade_horde_mp" )
    {
        self notify( "concussed" );
        return 0;
    }
    else if ( isexplosivedamagemod( var_1 ) )
    {
        switch ( var_3 )
        {
            case "frag_grenade_mp":
            case "semtex_mp":
            case "explosive_drone_mp":
                var_2 *= 4;
                break;
            default:
                if ( _id_A75A::_id_51B7( var_0, "alt_" ) )
                    var_2 *= 3;

                break;
        }
    }

    return var_2;
}

_id_4664( var_0, var_1, var_2 )
{
    if ( _id_A75A::_id_514D( var_1 ) )
    {
        var_3 = int( self._id_0275 / 3 ) + 1;

        if ( var_3 > var_2 )
            return var_3;
    }

    return var_2;
}

_id_465A( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_A75A::_id_8F56( var_0, "_lefthand" );

    if ( ( var_4 == "emp_grenade_mp" || var_4 == "emp_grenade_var_mp" || var_4 == "emp_grenade_killstreak_mp" ) && ( var_1 == "MOD_GRENADE_SPLASH" || var_1 == "MOD_GRENADE" ) )
    {
        self notify( "emp_damage", var_3, 8.0 );
        return 0;
    }

    return var_2;
}

_id_4646( var_0, var_1, var_2, var_3 )
{
    if ( var_1 == "MOD_RIFLE_BULLET" || var_1 == "MOD_PISTOL_BULLET" )
    {
        if ( var_3 _id_A75A::_id_05CB( "specialty_armorpiercing" ) || _id_A75A::_id_5109( var_0, var_1, var_3 ) )
            return var_2 * level._id_0CD2;
    }

    return var_2;
}

_id_64B3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = undefined;

    if ( isdefined( var_0 ) && isdefined( self._id_02E9 ) )
    {
        if ( isdefined( var_0._id_02E9 ) && isplayer( var_0._id_02E9 ) )
            var_0 = var_0._id_02E9;

        if ( var_0 == self._id_02E9 )
            return;

        if ( !_func_285( self._id_02E9, var_0 ) )
            var_8 = var_0;
    }

    if ( isdefined( var_8 ) )
    {
        var_8 notify( "destroyed_killstreak", var_1 );
        var_8 _id_A75A::_id_4C2C( var_4, 1 );
        level thread _id_A7AA::_id_1208( var_4, var_8, var_1, undefined, var_2 );

        if ( isdefined( var_1 ) && var_1 == "killstreak_laser2_mp" && isdefined( level._id_7CC2 ) && isdefined( level._id_7CC2._id_6632 ) )
        {
            foreach ( var_10 in level._id_7CC2._id_6632 )
            {
                if ( var_10 != var_8 )
                {
                    var_10 notify( "destroyed_killstreak", var_1 );
                    var_10 _id_A75A::_id_4C2C( var_4, 1 );
                    level thread _id_A7AA::_id_1208( var_4, var_10, var_1, undefined, var_2 );
                }
            }
        }

        if ( isdefined( var_6 ) )
            level thread _id_A75A::_id_91F3( var_6, var_8 );

        if ( isdefined( var_7 ) && var_7 )
            level thread _id_A7A0::_id_9D70( self._id_02E9, self, undefined, var_8, var_3, var_2, var_1 );
    }

    thread _id_A72E::_id_1D24( var_8 );

    if ( isdefined( self._id_02E9 ) && isdefined( var_5 ) )
        self._id_02E9 thread _id_A75A::_id_5652( var_5, undefined, undefined, self._id_02E6 );
}
