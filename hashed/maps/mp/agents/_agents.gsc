// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( isdefined( level._id_2409 ) && level._id_2409 )
        return;

    _id_806C();
    level._id_1262 = ::badplace_cylinder;
    level._id_1263 = ::badplace_delete;
    level thread maps\mp\agents\_agent_common::_id_0209();

    if ( !_id_A75A::_id_4FA3() && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
    {
        level thread _id_A7B6::_id_0209();
        level thread _id_A7BC::_id_0209();
    }
}

_id_806C()
{
    if ( !isdefined( level._id_0897 ) )
        level._id_0897 = [];

    if ( !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
    {
        level._id_0897["player"] = [];
        level._id_0897["player"]["spawn"] = ::_id_88BC;
        level._id_0897["player"]["think"] = maps\mp\bots\_bots_gametype_war::_id_1731;
        level._id_0897["player"]["on_killed"] = ::_id_6438;
        level._id_0897["player"]["on_damaged"] = ::_id_6437;
        level._id_0897["player"]["on_damaged_finished"] = ::_id_0896;
        _id_A7B6::_id_806C();
        _id_A7BC::_id_806C();
    }
}

_id_9FDD()
{
    while ( !isdefined( level._id_0897 ) )
        wait 0.05;
}

_id_0768( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = maps\mp\agents\_agent_common::_id_214C( var_0, var_1, var_2 );

    if ( isdefined( var_9 ) )
        var_9 thread [[ var_9 maps\mp\agents\_agent_utility::_id_08A6( "spawn" ) ]]( var_3, var_4, var_5, var_6, var_7, var_8 );

    return var_9;
}

_id_88BC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    while ( !isdefined( level._id_40D0 ) )
        waittillframeend;

    if ( self._id_4723 )
        wait(randomintrange( 6, 10 ));

    maps\mp\agents\_agent_utility::_id_4DFC( 1 );

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_6 = var_0;
        var_7 = var_1;
        self._id_55DA = spawnstruct();
        self._id_55DA._id_02E6 = var_6;
        self._id_55DA._id_0041 = var_7;
    }
    else
    {
        var_8 = self [[ level._id_40D0 ]]();
        var_6 = var_8._id_02E6;
        var_7 = var_8._id_0041;
        self._id_55DA = var_8;
    }

    maps\mp\agents\_agent_utility::_id_070B();
    self._id_55DC = gettime();
    self._id_03DD = gettime();
    var_9 = var_6 + ( 0, 0, 25 );
    var_10 = var_6;
    var_11 = playerphysicstrace( var_9, var_10 );

    if ( distancesquared( var_11, var_9 ) > 1 )
        var_6 = var_11;

    self _meth_838A( var_6, var_7 );

    if ( isdefined( var_5 ) )
        self._id_0899 = var_5;

    if ( isdefined( self._id_0899 ) )
    {
        if ( self._id_0899 == "follow_code_and_dev_dvar" )
            maps\mp\bots\_bots_util::_id_16EB( self _meth_836B(), 1 );
        else
            maps\mp\bots\_bots_util::_id_16EB( var_5 );
    }
    else
        maps\mp\bots\_bots_util::_id_16EB( self _meth_836B() );

    if ( isdefined( var_3 ) && var_3 )
        self._id_9BDD = 1;

    if ( isdefined( self._id_9BDD ) && self._id_9BDD )
    {
        if ( !self._id_4723 )
        {
            var_12 = self _meth_837B( "advancedPersonality" );

            if ( isdefined( var_12 ) && var_12 != 0 )
                maps\mp\bots\_bots_personality::_id_15B0();
        }

        maps\mp\bots\_bots_personality::_id_15AD();
    }
    else
        maps\mp\bots\_bots_util::_id_16ED( "default" );

    _id_4DF9();
    maps\mp\agents\_agent_common::_id_7DAA( 100 );

    if ( isdefined( var_4 ) && var_4 )
        self._id_746F = 1;

    if ( isdefined( var_2 ) )
        maps\mp\agents\_agent_utility::_id_7DAB( var_2._id_04A8, var_2 );

    if ( isdefined( self._id_02E9 ) )
        thread _id_28EF( self._id_02E9 );

    thread _id_A73D::_id_5E5B();
    self _meth_83D1( 0 );
    self [[ level._id_64E6 ]]();
    _id_A781::_id_41DD( self._id_04A8, self._id_1E2E, 1 );
    thread maps\mp\bots\_bots::_id_1719( 1 );
    thread maps\mp\bots\_bots::_id_1710();

    if ( self._id_08A0 == "player" )
        thread maps\mp\bots\_bots::_id_1714();
    else if ( self._id_08A0 == "odin_juggernaut" )
        thread maps\mp\bots\_bots::_id_1714( 128 );

    thread maps\mp\bots\_bots_strategy::_id_1717();
    self thread [[ maps\mp\agents\_agent_utility::_id_08A6( "think" ) ]]();

    if ( !self._id_4723 )
        _id_A7AF::_id_084E();

    if ( !self._id_4723 )
    {
        thread _id_A7B4::_id_64D3();
        thread _id_A780::_id_64D3();
    }

    self._id_4723 = 0;
    thread _id_A78F::_id_6CC1();

    if ( isdefined( self._id_9BDD ) && self._id_9BDD && isdefined( self._id_746F ) && self._id_746F )
        self _meth_852D( 1 );

    level notify( "spawned_agent_player", self );
    level notify( "spawned_agent", self );
    level notify( "player_spawned", self );
    self notify( "spawned_player" );
}

_id_28EF( var_0 )
{
    self endon( "death" );
    var_0 waittill( "killstreak_disowned" );
    self notify( "owner_disconnect" );

    if ( _id_A79A::_id_A0D4() )
        wait 0.05;

    self _meth_826B();
}

_id_0896( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_0 ) || isdefined( var_1 ) )
    {
        if ( !isdefined( var_0 ) )
            var_0 = var_1;

        if ( isdefined( self._id_0AB3 ) && !self._id_0AB3 )
        {
            if ( isdefined( var_0._id_00AB ) && var_0._id_00AB == "script_vehicle" )
                return 0;
        }

        if ( isdefined( var_0._id_00AB ) && var_0._id_00AB == "auto_turret" )
            var_1 = var_0;

        if ( isdefined( var_1 ) && var_4 != "MOD_FALLING" && var_4 != "MOD_SUICIDE" )
        {
            if ( level._id_91E4 )
            {
                if ( isdefined( var_1._id_04A8 ) && var_1._id_04A8 != self._id_04A8 )
                    self _meth_838C( var_1 );
            }
            else
                self _meth_838C( var_1 );
        }
    }

    var_10 = _id_A783::shouldplayblastimpact( var_3, var_4, var_5 );
    var_11 = self _meth_838B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0.0, var_10 );

    if ( isdefined( var_11 ) )
        thread finishagentdamage_impactfxwrapper( var_11[0], var_11[1], var_11[2], var_11[3], var_11[4], var_11[5], var_11[6] );

    if ( !isdefined( self._id_50A3 ) )
        self._id_A041 = 1;

    return 1;
}

finishagentdamage_impactfxwrapper( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    waitframe;

    if ( !isdefined( self ) || !isdefined( var_0 ) )
        return;

    self _meth_8540( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_6436( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = isdefined( var_1 ) && isdefined( self._id_02E9 ) && self._id_02E9 == var_1;
    var_11 = _id_A75A::_id_0E30( self._id_02E9, var_1 ) || var_10;

    if ( level._id_91E4 && var_11 && !level._id_01A9 )
        return 0;

    if ( !level._id_91E4 && var_10 )
        return 0;

    if ( isdefined( var_4 ) && var_4 == "MOD_CRUSH" && isdefined( var_0 ) && isdefined( var_0._id_00AB ) && var_0._id_00AB == "script_vehicle" )
        return 0;

    if ( !isdefined( self ) || !_id_A75A::_id_5186( self ) )
        return 0;

    if ( isdefined( var_1 ) && var_1._id_00AB == "script_origin" && isdefined( var_1._id_04D8 ) && var_1._id_04D8 == "soft_landing" )
        return 0;

    if ( var_5 == "killstreak_emp_mp" )
        return 0;

    if ( var_5 == "bouncingbetty_mp" && !_id_A7B4::_id_5C4F( var_0, self ) )
        return 0;

    if ( ( var_5 == "throwingknife_mp" || var_5 == "throwingknifejugg_mp" ) && var_4 == "MOD_IMPACT" )
        var_2 = self._id_01E7 + 1;

    if ( isdefined( var_0 ) && isdefined( var_0._id_8F66 ) && var_0._id_8F66 == self )
        var_2 = self._id_01E7 + 1;

    if ( var_2 <= 0 )
        return 0;

    if ( isdefined( level._id_5D4E ) )
        var_2 = [[ level._id_5D4E ]]( self, var_0, var_1, var_2, var_4, var_5, var_6, var_7, var_8 );

    if ( isdefined( var_1 ) && var_1 != self && var_2 > 0 && ( !isdefined( var_8 ) || var_8 != "shield" ) )
    {
        if ( var_3 & level._id_4B5E )
            var_12 = "stun";
        else if ( !_id_A783::_id_84B7( var_5 ) )
            var_12 = "none";
        else
        {
            var_12 = "standard";

            if ( isdefined( level.iszombiegame ) && level.iszombiegame )
            {
                if ( var_5 == "trap_zm_mp" || var_5 == "zombie_vaporize_mp" || var_5 == "zombie_trap_turret_mp" || var_5 == "zombie_water_trap_mp" )
                    var_12 = "none";
                else
                {
                    if ( var_5 == "iw5_microwavezm_mp" )
                        var_12 = "nosound";

                    if ( var_2 < self._id_01E7 )
                    {
                        switch ( var_8 )
                        {
                            case "head":
                            case "helmet":
                            case "neck":
                                var_12 = "headshot";
                                break;
                        }
                    }
                    else
                    {
                        switch ( var_8 )
                        {
                            case "head":
                            case "helmet":
                            case "neck":
                                var_12 = "killshot_headshot";
                                break;
                            default:
                                var_12 = "killshot";
                                break;
                        }
                    }
                }
            }
        }

        var_1 thread _id_A784::_id_9B04( var_12 );
    }

    return self [[ maps\mp\agents\_agent_utility::_id_08A6( "on_damaged_finished" ) ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_6437( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = isdefined( var_1 ) && isdefined( self._id_02E9 ) && self._id_02E9 == var_1;

    if ( !level._id_91E4 && var_10 )
        return 0;

    _id_A783::_id_19F1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_6438( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    _id_643F( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 1 );

    if ( isplayer( var_1 ) && ( !isdefined( self._id_02E9 ) || var_1 != self._id_02E9 ) && ( !isdefined( self._id_6150 ) || !self._id_6150 ) )
        _id_A783::_id_64B3( var_1, var_4, var_3, var_2, "destroyed_squad_mate" );

    if ( isdefined( level._id_6438 ) )
        [[ level._id_6438 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

    thread _id_A7B4::_id_2F8F( var_1 );

    if ( self._id_50A3 )
    {
        self._id_4723 = 1;

        if ( _id_A75A::_id_3FA8() != 1 && ( isdefined( self._id_746F ) && self._id_746F ) )
            self thread [[ maps\mp\agents\_agent_utility::_id_08A6( "spawn" ) ]]();
        else
            maps\mp\agents\_agent_utility::_id_2630();
    }
}

_id_643F( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( _id_A74D::_id_473E() )
    {
        _id_A783::_id_562E( var_2, var_3 );

        if ( !var_9 )
        {
            var_10 = self _meth_8250( self _meth_8311() );

            if ( isdefined( var_10 ) )
            {
                var_10 thread _id_A7B4::_id_285C();
                var_10._id_02E9 = self;
                var_10._id_6635 = var_1;
                var_10 _meth_80C0();
            }
        }
    }

    if ( var_9 )
        self thread [[ level._id_A2CF ]]( var_1, var_3 );

    if ( !isdefined( self.bypassagentcorpse ) || !self.bypassagentcorpse )
    {
        self._id_0087 = self _meth_838D( var_8 );

        if ( isdefined( level.agentshouldragdollimmediatelyfunc ) && [[ level.agentshouldragdollimmediatelyfunc ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 ) )
        {
            self._id_0087 _meth_8023();

            if ( !self._id_0087 _meth_81E0() )
                thread _id_A783::_id_27ED( self._id_0087, var_6, var_5, var_4, var_0, var_3 );
        }
        else
            thread _id_A783::_id_27ED( self._id_0087, var_6, var_5, var_4, var_0, var_3 );
    }

    _id_A74D::_id_7532();
}

_id_4DF9()
{
    if ( isdefined( self._id_1E30 ) )
        self._id_1E2E = self._id_1E30;
    else if ( maps\mp\bots\_bots_loadout::_id_16F4() )
        self._id_1E2E = "callback";
    else
        self._id_1E2E = "class1";
}
