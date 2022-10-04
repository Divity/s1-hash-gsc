// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    _id_4E12();
    level._id_91E2 = getdvarint( "scr_teambalance" );
    level._id_5A26 = getdvarint( "sv_maxclients" );
    _id_7FE1();
    level._id_3A28 = [];

    if ( level._id_91E4 )
    {
        level thread _id_64C5();
        level thread _id_9B77();
        wait 0.15;
        level thread _id_9B45();
    }
    else
    {
        level thread _id_64AD();
        wait 0.15;
        level thread _id_9B13();
    }
}

_id_4E12()
{
    setdvar( "g_TeamName_Allies", _id_411A( "allies" ) );
    setdvar( "g_TeamIcon_Allies", _id_4116( "allies" ) );
    setdvar( "g_TeamIcon_MyAllies", _id_4116( "allies" ) );
    setdvar( "g_TeamIcon_EnemyAllies", _id_4116( "allies" ) );
    var_0 = _id_4109( "allies" );
    setdvar( "g_ScoresColor_Allies", var_0[0] + " " + var_0[1] + " " + var_0[2] );
    setdvar( "g_TeamName_Axis", _id_411A( "axis" ) );
    setdvar( "g_TeamIcon_Axis", _id_4116( "axis" ) );
    setdvar( "g_TeamIcon_MyAxis", _id_4116( "axis" ) );
    setdvar( "g_TeamIcon_EnemyAxis", _id_4116( "axis" ) );
    var_0 = _id_4109( "axis" );
    setdvar( "g_ScoresColor_Axis", var_0[0] + " " + var_0[1] + " " + var_0[2] );
    setdvar( "g_ScoresColor_Spectator", ".25 .25 .25" );
    setdvar( "g_ScoresColor_Free", ".76 .78 .10" );
    setdvar( "g_teamTitleColor_MyTeam", ".6 .8 .6" );
    setdvar( "g_teamTitleColor_EnemyTeam", "1 .45 .5" );
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64B1();
        var_0 thread _id_64B0();
        var_0 thread _id_64D3();
        var_0 thread _id_9504();
    }
}

_id_64AD()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_94B8();
    }
}

_id_64B1()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_9B7E();
    }
}

_id_64B0()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        self._id_030D["teamTime"] = undefined;
    }
}

_id_9504()
{
    self endon( "disconnect" );
    _func_2B0( self._id_0537 );
    self._id_936B["allies"] = 0;
    self._id_936B["axis"] = 0;
    self._id_936B["other"] = 0;
    _id_A75A::_id_3BDF( "prematch_done" );

    for (;;)
    {
        if ( game["state"] == "playing" )
        {
            if ( self._id_03BD == "allies" )
            {
                self._id_936B["allies"]++;
                self._id_936B["total"]++;
            }
            else if ( self._id_03BD == "axis" )
            {
                self._id_936B["axis"]++;
                self._id_936B["total"]++;
            }
            else if ( self._id_03BD == "spectator" )
                self._id_936B["other"]++;
        }

        wait 1.0;
    }
}

_id_9B45()
{
    if ( !level._id_7134 )
        return;

    level endon( "game_ended" );

    for (;;)
    {
        _id_A79A::_id_A0D4();

        foreach ( var_1 in level._id_0328 )
            var_1 _id_9B42();

        wait 1.0;
    }
}

_id_9B42()
{
    if ( isai( self ) )
        return;

    if ( !_id_A75A::_id_7136() )
        return;

    if ( self._id_936B["allies"] )
    {
        _id_A7A4::_id_8D4B( "timePlayedAllies", self._id_936B["allies"] );
        _id_A7A4::_id_8D4B( "timePlayedTotal", self._id_936B["allies"] );
        _id_A7A4::_id_8D4E( "round", "timePlayed", self._id_936B["allies"] );
    }

    if ( self._id_936B["axis"] )
    {
        _id_A7A4::_id_8D4B( "timePlayedOpfor", self._id_936B["axis"] );
        _id_A7A4::_id_8D4B( "timePlayedTotal", self._id_936B["axis"] );
        _id_A7A4::_id_8D4E( "round", "timePlayed", self._id_936B["axis"] );
    }

    if ( self._id_936B["other"] )
    {
        _id_A7A4::_id_8D4B( "timePlayedOther", self._id_936B["other"] );
        _id_A7A4::_id_8D4B( "timePlayedTotal", self._id_936B["other"] );
        _id_A7A4::_id_8D4E( "round", "timePlayed", self._id_936B["other"] );
    }

    if ( game["state"] == "postgame" )
        return;

    self._id_936B["allies"] = 0;
    self._id_936B["axis"] = 0;
    self._id_936B["other"] = 0;
}

_id_9B7E()
{
    if ( game["state"] != "playing" )
        return;

    self._id_030D["teamTime"] = gettime();
}

_id_9B78()
{
    for (;;)
    {
        var_0 = getdvarint( "scr_teambalance" );

        if ( level._id_91E2 != var_0 )
            level._id_91E2 = getdvarint( "scr_teambalance" );

        wait 1;
    }
}

_id_9B77()
{
    level._id_91ED = level._id_5A26 / 2;
    level thread _id_9B78();
    wait 0.15;

    if ( level._id_91E2 && _id_A75A::_id_5191() )
    {
        if ( isdefined( game["BalanceTeamsNextRound"] ) )
            iprintlnbold( &"MP_AUTOBALANCE_NEXT_ROUND" );

        level waittill( "restarting" );

        if ( isdefined( game["BalanceTeamsNextRound"] ) )
        {
            level _id_1274();
            game["BalanceTeamsNextRound"] = undefined;
        }
        else if ( !_id_4108() )
            game["BalanceTeamsNextRound"] = 1;
    }
    else
    {
        level endon( "game_ended" );

        for (;;)
        {
            if ( level._id_91E2 )
            {
                if ( !_id_4108() )
                {
                    iprintlnbold( &"MP_AUTOBALANCE_SECONDS", 15 );
                    wait 15.0;

                    if ( !_id_4108() )
                        level _id_1274();
                }

                wait 59.0;
            }

            wait 1.0;
        }
    }
}

_id_4108()
{
    level._id_04A8["allies"] = 0;
    level._id_04A8["axis"] = 0;
    var_0 = level._id_0328;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_030D["team"] ) && var_0[var_1]._id_030D["team"] == "allies" )
        {
            level._id_04A8["allies"]++;
            continue;
        }

        if ( isdefined( var_0[var_1]._id_030D["team"] ) && var_0[var_1]._id_030D["team"] == "axis" )
            level._id_04A8["axis"]++;
    }

    if ( level._id_04A8["allies"] > level._id_04A8["axis"] + level._id_91E2 || level._id_04A8["axis"] > level._id_04A8["allies"] + level._id_91E2 )
        return 0;
    else
        return 1;
}

_id_1274()
{
    iprintlnbold( game["strings"]["autobalance"] );
    var_0 = [];
    var_1 = [];
    var_2 = level._id_0328;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !isdefined( var_2[var_3]._id_030D["teamTime"] ) )
            continue;

        if ( isdefined( var_2[var_3]._id_030D["team"] ) && var_2[var_3]._id_030D["team"] == "allies" )
        {
            var_0[var_0.size] = var_2[var_3];
            continue;
        }

        if ( isdefined( var_2[var_3]._id_030D["team"] ) && var_2[var_3]._id_030D["team"] == "axis" )
            var_1[var_1.size] = var_2[var_3];
    }

    var_4 = undefined;

    while ( var_0.size > var_1.size + 1 || var_1.size > var_0.size + 1 )
    {
        if ( var_0.size > var_1.size + 1 )
        {
            for ( var_5 = 0; var_5 < var_0.size; var_5++ )
            {
                if ( isdefined( var_0[var_5]._id_2D19 ) )
                    continue;

                if ( !isdefined( var_4 ) )
                {
                    var_4 = var_0[var_5];
                    continue;
                }

                if ( var_0[var_5]._id_030D["teamTime"] > var_4._id_030D["teamTime"] )
                    var_4 = var_0[var_5];
            }

            var_4 [[ level._id_64EC ]]( "axis" );
        }
        else if ( var_1.size > var_0.size + 1 )
        {
            for ( var_5 = 0; var_5 < var_1.size; var_5++ )
            {
                if ( isdefined( var_1[var_5]._id_2D19 ) )
                    continue;

                if ( !isdefined( var_4 ) )
                {
                    var_4 = var_1[var_5];
                    continue;
                }

                if ( var_1[var_5]._id_030D["teamTime"] > var_4._id_030D["teamTime"] )
                    var_4 = var_1[var_5];
            }

            var_4 [[ level._id_64EC ]]( "allies" );
        }

        var_4 = undefined;
        var_0 = [];
        var_1 = [];
        var_2 = level._id_0328;

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( isdefined( var_2[var_3]._id_030D["team"] ) && var_2[var_3]._id_030D["team"] == "allies" )
            {
                var_0[var_0.size] = var_2[var_3];
                continue;
            }

            if ( isdefined( var_2[var_3]._id_030D["team"] ) && var_2[var_3]._id_030D["team"] == "axis" )
                var_1[var_1.size] = var_2[var_3];
        }
    }
}

_id_7F75( var_0 )
{

}

_id_8025( var_0, var_1 )
{

}

_id_7FE1()
{
    if ( level._id_5FE9 )
    {
        for ( var_0 = 0; var_0 < level._id_91F0.size; var_0++ )
            _id_8025( level._id_91F0[var_0], game[level._id_91F0[var_0]] );
    }
    else
    {
        _id_8025( "allies", game["allies"] );
        _id_8025( "axis", game["axis"] );
    }

    _id_7F75( getmapcustom( "environment" ) );
}

_id_6C7E()
{
    if ( isagent( self ) && !getdvarint( "virtualLobbyActive", 0 ) )
        return 1;

    self _meth_84BA( self._id_2236 );

    if ( isdefined( self._id_030B ) && !getdvarint( "virtualLobbyActive", 0 ) )
    {
        if ( _id_A75A::_id_05CB( "specialty_exo_shoulderlauncher" ) )
        {
            if ( !_id_A75A::_id_05CB( "specialty_wildcard_dualtacticals" ) )
                self _meth_801D( "npc_exo_launcher_base_L", "", 1 );

            if ( _id_A75A::_id_05CB( "specialty_wildcard_duallethals" ) )
                self _meth_801D( "npc_exo_launcher_base_R", "", 1 );
        }
        else
        {
            if ( !_id_A75A::_id_05CB( "specialty_wildcard_dualtacticals" ) || _id_A75A::isgrapplinghookgamemode() )
                self _meth_801D( "npc_exo_arm_launcher_L", "J_Elbow_LE", 1 );

            if ( _id_A75A::_id_05CB( "specialty_wildcard_duallethals" ) )
                self _meth_801D( "npc_exo_arm_launcher_R", "J_Elbow_RI", 1 );
        }
    }

    self._id_9F29 = "american";
    self _meth_83DB( "vestlight" );
    return 1;
}

_id_9C49( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _func_29E( var_0 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] != var_1[var_2] )
            return 0;
    }

    return 1;
}

_id_3F4D()
{
    var_0 = _func_29F();
    return var_0;
}

_id_4093()
{
    if ( !isdefined( level.practice_round_costume ) )
    {
        level.practice_round_max_costumes = _func_296( level._id_6E95 ) - 1;
        level.practice_round_costume = randomint( level.practice_round_max_costumes );
    }

    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_0328.size; var_1++ )
    {
        if ( level._id_0328[var_1] == self )
        {
            var_0 = var_1;
            break;
        }
    }

    var_2 = ( level.practice_round_costume + var_0 ) % level.practice_round_max_costumes;
    var_3 = _func_2CF( level._id_6E95, var_2 + 1 );
    return var_3;
}

_id_3FBF()
{
    var_0 = 2;

    if ( self._id_030D["team"] == "axis" )
        var_0 = 1;

    var_1 = _func_2CF( level._id_46C6, var_0 );
    return var_1;
}

_id_6D12( var_0, var_1 )
{
    var_2 = self._id_04A8;
    var_3 = _id_6C7E();
    self notify( "player_model_set" );
}

_id_2242()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_91F0.size; var_1++ )
        var_0[level._id_91F0[var_1]] = 0;

    for ( var_1 = 0; var_1 < level._id_0328.size; var_1++ )
    {
        if ( level._id_0328[var_1] == self )
            continue;

        if ( level._id_0328[var_1]._id_030D["team"] == "spectator" )
            continue;

        if ( isdefined( level._id_0328[var_1]._id_030D["team"] ) )
            var_0[level._id_0328[var_1]._id_030D["team"]]++;
    }

    return var_0;
}

_id_94B8()
{
    self endon( "disconnect" );
    _func_2B0( self._id_0537 );
    self._id_936B["allies"] = 0;
    self._id_936B["axis"] = 0;
    self._id_936B["other"] = 0;

    for (;;)
    {
        if ( game["state"] == "playing" )
        {
            if ( isdefined( self._id_030D["team"] ) && self._id_030D["team"] == "allies" && self._id_03BD != "spectator" )
            {
                self._id_936B["allies"]++;
                self._id_936B["total"]++;
            }
            else if ( isdefined( self._id_030D["team"] ) && self._id_030D["team"] == "axis" && self._id_03BD != "spectator" )
            {
                self._id_936B["axis"]++;
                self._id_936B["total"]++;
            }
            else
                self._id_936B["other"]++;
        }

        wait 1.0;
    }
}

_id_9B13()
{
    if ( !level._id_7134 )
        return;

    var_0 = 0;

    for (;;)
    {
        var_0++;

        if ( var_0 >= level._id_0328.size )
            var_0 = 0;

        if ( isdefined( level._id_0328[var_0] ) )
            level._id_0328[var_0] _id_9B12();

        wait 1.0;
    }
}

_id_9B12()
{
    if ( !_id_A75A::_id_7136() )
        return;

    if ( isai( self ) )
        return;

    if ( self._id_936B["allies"] )
    {
        _id_A7A4::_id_8D4B( "timePlayedAllies", self._id_936B["allies"] );
        _id_A7A4::_id_8D4B( "timePlayedTotal", self._id_936B["allies"] );
        _id_A7A4::_id_8D4E( "round", "timePlayed", self._id_936B["allies"] );
    }

    if ( self._id_936B["axis"] )
    {
        _id_A7A4::_id_8D4B( "timePlayedOpfor", self._id_936B["axis"] );
        _id_A7A4::_id_8D4B( "timePlayedTotal", self._id_936B["axis"] );
        _id_A7A4::_id_8D4E( "round", "timePlayed", self._id_936B["axis"] );
    }

    if ( self._id_936B["other"] )
    {
        _id_A7A4::_id_8D4B( "timePlayedOther", self._id_936B["other"] );
        _id_A7A4::_id_8D4B( "timePlayedTotal", self._id_936B["other"] );
        _id_A7A4::_id_8D4E( "round", "timePlayed", self._id_936B["other"] );
    }

    if ( game["state"] == "postgame" )
        return;

    self._id_936B["allies"] = 0;
    self._id_936B["axis"] = 0;
    self._id_936B["other"] = 0;
}

_id_3FDB( var_0 )
{
    if ( _id_A75A::iscoop() )
        return 1;

    var_1 = 0;
    var_2 = 0;
    var_3 = level._id_0328;

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];

        if ( isdefined( var_5._id_030D["team"] ) && var_5._id_030D["team"] == var_0 )
        {
            var_1++;

            if ( isbot( var_5 ) )
                var_2++;
        }
    }

    if ( var_1 < level._id_91ED )
        return 1;
    else if ( var_2 > 0 )
        return 1;
    else if ( level._id_01B5 == "infect" )
        return 1;
    else
        return 0;
}

_id_64D3()
{
    level endon( "game_ended" );

    for (;;)
        self waittill( "spawned_player" );
}

_id_5FD9( var_0 )
{
    return tablelookupistring( "mp/MTTable.csv", 0, var_0, 1 );
}

_id_5FD8( var_0 )
{
    return tablelookup( "mp/MTTable.csv", 0, var_0, 2 );
}

_id_5FD7( var_0 )
{
    return tablelookup( "mp/MTTable.csv", 0, var_0, 3 );
}

_id_4119( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 1 );
}

_id_411A( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 2 );
}

_id_4113( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 4 );
}

_id_410D( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 3 );
}

_id_4116( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 5 );
}

_id_4115( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 6 );
}

_id_4114( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 17 );
}

_id_411E( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 7 );
}

_id_411C( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 8 );
}

_id_411F( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 9 );
}

_id_4112( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 10 );
}

_id_410E( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 11 );
}

_id_4111( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 12 );
}

_id_4110( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 13 );
}

_id_4109( var_0 )
{
    return ( _id_A75A::_id_8F54( tablelookup( "mp/factionTable.csv", 0, game[var_0], 14 ) ), _id_A75A::_id_8F54( tablelookup( "mp/factionTable.csv", 0, game[var_0], 15 ) ), _id_A75A::_id_8F54( tablelookup( "mp/factionTable.csv", 0, game[var_0], 16 ) ) );
}

_id_410A( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 18 );
}

_id_410B( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 19 );
}
