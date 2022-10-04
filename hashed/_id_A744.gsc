// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( !isdefined( game["gamestarted"] ) )
    {
        setmatchdatadef( "mp/matchdata.def" );
        setmatchdata( "map", level._id_0391 );

        if ( level._id_46C7 )
        {
            var_0 = level._id_01B5 + " hc";
            setmatchdata( "gametype", var_0 );
        }
        else
            setmatchdata( "gametype", level._id_01B5 );

        setmatchdata( "buildVersion", getbuildversion() );
        setmatchdata( "buildNumber", getbuildnumber() );
        setmatchdataid();
    }

    level._id_5A3D = 490;
    level._id_5A34 = 150;
    level._id_5A39 = 64;
    level._id_5A3F = 30;
    level._id_5A43 = 5;
    level._id_5A42 = 10;
    level._id_5A3E = 10;
    level thread _id_3BD9();

    if ( getdvar( "virtualLobbyActive" ) != "1" )
        level thread _id_7278();
}

_id_59E9()
{
    if ( getdvar( "virtualLobbyActive" ) == "1" )
        return;

    if ( getdvar( "mapname" ) == getdvar( "virtualLobbyMap" ) )
        return;

    _func_2B6( "MatchStarted: Completed" );
    var_0 = _func_2C3();
    setmatchdata( "playlistName", var_0 );
    var_1 = _func_2C4();
    setmatchdata( "localTimeStringAtMatchStart", var_1 );

    if ( _id_4016() == 0 )
        setmatchdata( "startTimeUTC", getsystemtime() );

    setmatchdata( "iseSports", _id_A75A::_id_5150() );

    if ( _id_A75A::_id_6FCD() )
        setmatchdata( "privateMatch", 1 );

    if ( _id_A75A::_id_6E98() )
        setmatchdata( "practiceRound", 1 );

    if ( !_id_A75A::_id_50C1() )
        setmatchdata( "classicMode", 1 );

    if ( _id_A75A::isdivisionmode() )
        setmatchdata( "divisionMode", 1 );

    var_2 = 0;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame && isdefined( game["start_in_zmb_hard_mode"] ) && game["start_in_zmb_hard_mode"] )
        var_2 = 1;

    setmatchdata( "isHardMode", var_2 );
    thread _id_581C();
    thread _id_06D9();
}

_id_581C()
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = _id_A75A::getgametimepassedseconds();

        foreach ( var_2 in level._id_0328 )
        {
            if ( isbot( var_2 ) || istestclient( var_2 ) )
                continue;

            if ( _id_A75A::_id_5186( var_2 ) && isdefined( var_2._id_56F4 ) && _id_1AD1( var_2._id_56F4 ) )
            {
                var_3 = 31;

                if ( isdefined( var_2._id_55D5 ) )
                    var_3 = var_2._id_55D5;

                _func_2B3( var_2, var_2._id_56F4, var_0, var_3 );
                var_2._id_55D5 = undefined;
            }
        }

        if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        {
            wait 5;
            continue;
        }

        wait 2;
    }
}

_id_06D9()
{
    level endon( "game_ended" );

    for (;;)
    {
        foreach ( var_1 in level._id_0328 )
        {
            if ( isbot( var_1 ) || istestclient( var_1 ) )
                continue;

            if ( !isdefined( var_1._id_030D["pingAccumulation"] ) || !isdefined( var_1._id_030D["minPing"] ) || !isdefined( var_1._id_030D["maxPing"] ) || !isdefined( var_1._id_030D["pingSampleCount"] ) )
                continue;

            var_2 = var_1 _meth_8522();
            var_1._id_030D["pingAccumulation"] += var_2;
            var_1._id_030D["pingSampleCount"]++;

            if ( var_1._id_030D["pingSampleCount"] > 5 && var_2 > 0 )
            {
                if ( var_2 > var_1._id_030D["maxPing"] )
                    var_1._id_030D["maxPing"] = var_2;

                if ( var_2 < var_1._id_030D["minPing"] )
                    var_1._id_030D["minPing"] = var_2;
            }
        }

        wait 2;
    }
}

_id_4016()
{
    return getmatchdata( "startTimeUTC" );
}

_id_5838( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || !_id_1AD0() )
        return;

    var_2 = getmatchdata( "killstreakCount" );
    setmatchdata( "killstreakCount", var_2 + 1 );
    setmatchdata( "killstreaks", var_2, "eventType", var_0 );
    setmatchdata( "killstreaks", var_2, "player", self._id_1F0F );
    setmatchdata( "killstreaks", var_2, "eventStartTimeDeciSecondsFromMatchStart", _id_A75A::_id_412B() );
    setmatchdata( "killstreaks", var_2, "eventPos", 0, int( var_1[0] ) );
    setmatchdata( "killstreaks", var_2, "eventPos", 1, int( var_1[1] ) );
    setmatchdata( "killstreaks", var_2, "eventPos", 2, int( var_1[2] ) );
    setmatchdata( "killstreaks", var_2, "index", var_2 );
    setmatchdata( "killstreaks", var_2, "coopPlayerIndex", 255 );
    self._id_2517 = var_2;
    reconspatialevent( var_1, "script_mp_killstreak: eventType %s, player_name %s, player %d, gameTime %d", var_0, self._id_02AB, self._id_1F0F, gettime() );
}

_id_5824( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || !_id_1ACF() )
        return;

    var_2 = getmatchdata( "eventCount" );
    setmatchdata( "eventCount", var_2 + 1 );
    setmatchdata( "events", var_2, "eventType", var_0 );
    setmatchdata( "events", var_2, "player", self._id_1F0F );
    setmatchdata( "events", var_2, "eventTimeDeciSecondsFromMatchStart", _id_A75A::_id_412B() );
    setmatchdata( "events", var_2, "eventPos", 0, int( var_1[0] ) );
    setmatchdata( "events", var_2, "eventPos", 1, int( var_1[1] ) );
    setmatchdata( "events", var_2, "eventPos", 2, int( var_1[2] ) );
    reconspatialevent( var_1, "script_mp_event: event_type %s, player_name %s, player %d, gameTime %d", var_0, self._id_02AB, self._id_1F0F, gettime() );
}

_id_5835( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    setmatchdata( "lives", var_0, "modifiers", var_1, 1 );
}

_id_583A( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    setmatchdata( "lives", var_0, "multikill", var_1 );
}

_id_5843( var_0 )
{
    if ( !_id_1ACE( self ) || !_id_1AD1( self._id_56F4 ) )
        return;

    var_1 = gettime() - self._id_03DD;
    self._id_93F4 += var_1;
    var_2 = _id_A75A::_id_21A6( var_1 );
    setmatchdata( "lives", self._id_56F4, "player", self._id_1F0F );
    setmatchdata( "lives", self._id_56F4, "spawnPos", 0, int( self._id_03DC[0] ) );
    setmatchdata( "lives", self._id_56F4, "spawnPos", 1, int( self._id_03DC[1] ) );
    setmatchdata( "lives", self._id_56F4, "spawnPos", 2, int( self._id_03DC[2] ) );
    setmatchdata( "lives", self._id_56F4, "wasTacticalInsertion", self._id_A1C9 );
    setmatchdata( "lives", self._id_56F4, "team", self._id_04A8 );

    if ( isdefined( self._id_8A0C ) )
        setmatchdata( "lives", self._id_56F4, "spawnTimeDeciSecondsFromMatchStart", self._id_8A0C );
    else
        setmatchdata( "lives", self._id_56F4, "spawnTimeDeciSecondsFromMatchStart", -1 );

    setmatchdata( "lives", self._id_56F4, "durationDeciSeconds", var_2 );
    var_3 = _id_5839();
    setmatchdata( "lives", self._id_56F4, "loadoutIndex", var_3 );
    var_4 = _id_A75A::_id_1E29( self._id_030D["score"] - self._id_7895 );
    setmatchdata( "lives", self._id_56F4, "scoreEarnedDuringThisLife", var_4 );

    if ( isdefined( self._id_030D["summary"] ) && isdefined( self._id_030D["summary"]["xp"] ) )
    {
        if ( isdefined( self._id_A39B ) )
        {
            var_5 = _id_A75A::_id_1E29( self._id_030D["summary"]["xp"] - self._id_A39B );
            setmatchdata( "lives", self._id_56F4, "xpEarnedDuringThisLife", var_5 );
        }
    }
}

_id_5846( var_0, var_1 )
{
    if ( !_id_1ACE( self ) )
        return;

    setmatchdata( "players", self._id_1F0F, var_1, var_0 );
}

_id_581F( var_0 )
{
    if ( !isplayer( self ) || !_id_1ACE( self ) || isbot( self ) )
        return;

    var_1 = getmatchdata( "players", self._id_1F0F, "challengeCount" );

    if ( var_1 < level._id_5A43 )
    {
        setmatchdata( "players", self._id_1F0F, "challenges", var_1, var_0 );
        setmatchdata( "players", self._id_1F0F, "challengeCount", var_1 + 1 );
    }
}

_id_5839()
{
    var_0 = 255;

    if ( !_id_1ACE( self ) || !_id_1AD1( self._id_56F4 ) || self._id_24C3 == "gamemode" )
        return var_0;

    var_1 = self._id_24C3;
    var_2 = 0;

    for ( var_2 = 0; var_2 < level._id_5A3E; var_2++ )
    {
        var_3 = getmatchdata( "players", self._id_1F0F, "loadouts", var_2, "slotUsed" );

        if ( !var_3 )
            break;
        else
        {
            var_4 = getmatchdata( "players", self._id_1F0F, "loadouts", var_2, "className" );

            if ( var_1 == var_4 )
                return var_2;
        }
    }

    if ( var_2 == level._id_5A3E )
        return var_0;

    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "slotUsed", 1 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "className", var_1 );
    var_5 = "";
    var_6 = "";
    var_7 = "";
    var_8 = "";
    var_9 = [];
    var_10 = [];
    var_11 = "";
    var_12 = 0;
    var_13 = "";
    var_14 = "";
    var_15 = 0;

    if ( var_1 == "copycat" )
    {
        var_16 = self._id_030D["copyCatLoadout"];
        var_17 = var_16["loadoutPrimary"];
        var_18 = var_16["loadoutPrimaryAttachment"];
        var_19 = var_16["loadoutPrimaryAttachment2"];
        var_20 = var_16["loadoutPrimaryAttachment3"];
        var_21 = var_16["loadoutPrimaryCamo"];
        var_22 = var_16["loadoutPrimaryReticle"];
        var_23 = var_16["loadoutSecondary"];
        var_24 = var_16["loadoutSecondaryAttachment"];
        var_25 = var_16["loadoutSecondaryAttachment2"];
        var_26 = var_16["loadoutSecondaryCamo"];
        var_27 = var_16["loadoutSecondaryReticle"];
        var_11 = var_16["loadoutEquipment"];
        var_12 = var_16["loadoutEquipmentExtra"];
        var_13 = var_16["loadoutOffhand"];
        var_15 = var_16["loadoutOffhandExtra"];

        for ( var_28 = 0; var_28 < 6; var_28++ )
            var_9[var_28] = var_16["loadoutPerks"][var_28];

        for ( var_28 = 0; var_28 < 3; var_28++ )
            var_10[var_28] = var_16["loadoutWildcards"][var_28];

        var_5 = var_16["loadoutKillstreaks"][0];
        var_29 = var_16["loadoutKillstreakModules"][0][0];
        var_30 = var_16["loadoutKillstreakModules"][0][1];
        var_31 = var_16["loadoutKillstreakModules"][0][2];
        var_6 = var_16["loadoutKillstreaks"][1];
        var_32 = var_16["loadoutKillstreakModules"][1][0];
        var_33 = var_16["loadoutKillstreakModules"][1][1];
        var_34 = var_16["loadoutKillstreakModules"][1][2];
        var_7 = var_16["loadoutKillstreaks"][2];
        var_35 = var_16["loadoutKillstreakModules"][2][0];
        var_36 = var_16["loadoutKillstreakModules"][2][1];
        var_37 = var_16["loadoutKillstreakModules"][2][2];
        var_8 = var_16["loadoutKillstreaks"][3];
        var_38 = var_16["loadoutKillstreakModules"][3][0];
        var_39 = var_16["loadoutKillstreakModules"][3][1];
        var_40 = var_16["loadoutKillstreakModules"][3][2];
    }
    else if ( issubstr( var_1, "custom" ) )
    {
        var_41 = _id_A75A::_id_3F30( var_1 );
        var_17 = _id_A781::_id_1985( var_41, 0 );
        var_18 = _id_A781::_id_1986( var_41, 0 );
        var_19 = _id_A781::_id_1988( var_41, 0 );
        var_20 = _id_A781::_id_1987( var_41, 0 );
        var_21 = _id_A781::_id_1989( var_41, 0 );

        for ( var_28 = 0; var_28 < 6; var_28++ )
            var_9[var_28] = _id_A781::_id_1984( var_41, var_28 );

        for ( var_28 = 0; var_28 < 3; var_28++ )
            var_10[var_28] = _id_A781::_id_198B( var_41, var_28 );

        var_23 = _id_A781::_id_1985( var_41, 1 );
        var_24 = _id_A781::_id_1986( var_41, 1 );
        var_25 = _id_A781::_id_1988( var_41, 1 );
        var_26 = _id_A781::_id_1989( var_41, 1 );
        var_11 = _id_A781::_id_197F( var_41, 0 );
        var_12 = _id_A781::_id_1980( var_41, 0 );
        var_13 = _id_A781::_id_1983( var_41 );
        var_5 = _id_A781::_id_1981( var_41, 0 );
        var_29 = _id_A781::_id_1982( var_41, 0, 0 );
        var_30 = _id_A781::_id_1982( var_41, 0, 1 );
        var_31 = _id_A781::_id_1982( var_41, 0, 2 );
        var_6 = _id_A781::_id_1981( var_41, 1 );
        var_32 = _id_A781::_id_1982( var_41, 1, 0 );
        var_33 = _id_A781::_id_1982( var_41, 1, 1 );
        var_34 = _id_A781::_id_1982( var_41, 1, 2 );
        var_7 = _id_A781::_id_1981( var_41, 2 );
        var_35 = _id_A781::_id_1982( var_41, 2, 0 );
        var_36 = _id_A781::_id_1982( var_41, 2, 1 );
        var_37 = _id_A781::_id_1982( var_41, 2, 2 );
        var_8 = _id_A781::_id_1981( var_41, 3 );
        var_38 = _id_A781::_id_1982( var_41, 3, 0 );
        var_39 = _id_A781::_id_1982( var_41, 3, 1 );
        var_40 = _id_A781::_id_1982( var_41, 3, 2 );
    }
    else if ( issubstr( var_1, "practice" ) )
    {
        var_41 = _id_A75A::_id_3F30( var_1 );
        var_41 = self._id_030D["practiceRoundClasses"][var_41];
        var_17 = _id_A781::_id_909D( level._id_6E94, var_41, 0 );
        var_18 = _id_A781::_id_909E( level._id_6E94, var_41, 0, 0 );
        var_19 = _id_A781::_id_909E( level._id_6E94, var_41, 0, 1 );
        var_20 = _id_A781::_id_909E( level._id_6E94, var_41, 0, 2 );
        var_21 = _id_A781::_id_90A0( level._id_6E94, var_41, 0 );
        var_23 = _id_A781::_id_909D( level._id_6E94, var_41, 1 );
        var_24 = _id_A781::_id_909E( level._id_6E94, var_41, 1, 0 );
        var_25 = _id_A781::_id_909E( level._id_6E94, var_41, 1, 1 );
        var_26 = _id_A781::_id_90A0( level._id_6E94, var_41, 1 );
        var_11 = _id_A781::_id_9095( level._id_6E94, var_41 );
        var_12 = _id_A781::_id_9096( level._id_6E94, var_41 );
        var_13 = _id_A781::_id_9099( level._id_6E94, var_41 );

        for ( var_28 = 0; var_28 < 6; var_28++ )
            var_9[var_28] = _id_A781::_id_909B( level._id_6E94, var_41, var_28 );

        for ( var_28 = 0; var_28 < 3; var_28++ )
            var_10[var_28] = _id_A781::_id_90A2( level._id_6E94, var_41, var_28 );

        var_5 = _id_A781::_id_9097( level._id_6E94, var_41, 0 );
        var_29 = _id_A781::_id_9098( level._id_6E94, var_41, 0, 0 );
        var_30 = _id_A781::_id_9098( level._id_6E94, var_41, 0, 1 );
        var_31 = _id_A781::_id_9098( level._id_6E94, var_41, 0, 2 );
        var_6 = _id_A781::_id_9097( level._id_6E94, var_41, 1 );
        var_32 = _id_A781::_id_9098( level._id_6E94, var_41, 1, 0 );
        var_33 = _id_A781::_id_9098( level._id_6E94, var_41, 1, 1 );
        var_34 = _id_A781::_id_9098( level._id_6E94, var_41, 1, 2 );
        var_7 = _id_A781::_id_9097( level._id_6E94, var_41, 2 );
        var_35 = _id_A781::_id_9098( level._id_6E94, var_41, 2, 0 );
        var_36 = _id_A781::_id_9098( level._id_6E94, var_41, 2, 1 );
        var_37 = _id_A781::_id_9098( level._id_6E94, var_41, 2, 2 );
        var_8 = _id_A781::_id_9097( level._id_6E94, var_41, 3 );
        var_38 = _id_A781::_id_9098( level._id_6E94, var_41, 3, 0 );
        var_39 = _id_A781::_id_9098( level._id_6E94, var_41, 3, 1 );
        var_40 = _id_A781::_id_9098( level._id_6E94, var_41, 3, 2 );
    }
    else
    {
        var_41 = _id_A75A::_id_3F30( var_1 );
        var_17 = _id_A781::_id_909D( level._id_1E3D, var_41, 0 );
        var_18 = _id_A781::_id_909E( level._id_1E3D, var_41, 0, 0 );
        var_19 = _id_A781::_id_909E( level._id_1E3D, var_41, 0, 1 );
        var_20 = _id_A781::_id_909E( level._id_1E3D, var_41, 0, 2 );
        var_21 = _id_A781::_id_90A0( level._id_1E3D, var_41, 0 );

        for ( var_28 = 0; var_28 < 6; var_28++ )
            var_9[var_28] = _id_A781::_id_909B( level._id_1E3D, var_41, var_28 );

        for ( var_28 = 0; var_28 < 3; var_28++ )
            var_10[var_28] = _id_A781::_id_90A2( level._id_1E3D, var_41, var_28 );

        var_23 = _id_A781::_id_909D( level._id_1E3D, var_41, 1 );
        var_24 = _id_A781::_id_909E( level._id_1E3D, var_41, 1, 0 );
        var_25 = _id_A781::_id_909E( level._id_1E3D, var_41, 1, 1 );
        var_26 = _id_A781::_id_90A0( level._id_1E3D, var_41, 1 );
        var_11 = _id_A781::_id_9095( level._id_1E3D, var_41 );
        var_12 = _id_A781::_id_9096( level._id_1E3D, var_41 );
        var_13 = _id_A781::_id_9099( level._id_1E3D, var_41 );
        var_5 = _id_A781::_id_9097( level._id_1E3D, var_41, 0 );
        var_29 = _id_A781::_id_9098( level._id_1E3D, var_41, 0, 0 );
        var_30 = _id_A781::_id_9098( level._id_1E3D, var_41, 0, 1 );
        var_31 = _id_A781::_id_9098( level._id_1E3D, var_41, 0, 2 );
        var_6 = _id_A781::_id_9097( level._id_1E3D, var_41, 1 );
        var_32 = _id_A781::_id_9098( level._id_1E3D, var_41, 1, 0 );
        var_33 = _id_A781::_id_9098( level._id_1E3D, var_41, 1, 1 );
        var_34 = _id_A781::_id_9098( level._id_1E3D, var_41, 1, 2 );
        var_7 = _id_A781::_id_9097( level._id_1E3D, var_41, 2 );
        var_35 = _id_A781::_id_9098( level._id_1E3D, var_41, 2, 0 );
        var_36 = _id_A781::_id_9098( level._id_1E3D, var_41, 2, 1 );
        var_37 = _id_A781::_id_9098( level._id_1E3D, var_41, 2, 2 );
        var_8 = _id_A781::_id_9097( level._id_1E3D, var_41, 3 );
        var_38 = _id_A781::_id_9098( level._id_1E3D, var_41, 3, 0 );
        var_39 = _id_A781::_id_9098( level._id_1E3D, var_41, 3, 1 );
        var_40 = _id_A781::_id_9098( level._id_1E3D, var_41, 3, 2 );
    }

    var_18 = _id_A75A::_id_0E02( var_18 );
    var_19 = _id_A75A::_id_0E02( var_19 );
    var_20 = _id_A75A::_id_0E02( var_20 );
    var_24 = _id_A75A::_id_0E02( var_24 );
    var_25 = _id_A75A::_id_0E02( var_25 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "primaryWeapon", var_17 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "primaryAttachments", 0, var_18 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "primaryAttachments", 1, var_19 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "primaryAttachments", 2, var_20 );

    for ( var_28 = 0; var_28 < 6; var_28++ )
        setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "perkSlots", var_28, var_9[var_28] );

    for ( var_28 = 0; var_28 < 3; var_28++ )
        setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "wildcardSlots", var_28, var_10[var_28] );

    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "secondaryWeapon", var_23 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "secondaryAttachments", 0, var_24 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "secondaryAttachments", 1, var_25 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "offhandWeapon", var_13 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "equipment", var_11 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "equipmentWeaponExtra", var_12 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 0, "streak", var_5 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 0, "modules", 0, var_29 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 0, "modules", 1, var_30 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 0, "modules", 2, var_31 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 1, "streak", var_6 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 1, "modules", 0, var_32 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 1, "modules", 1, var_33 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 1, "modules", 2, var_34 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 2, "streak", var_7 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 2, "modules", 0, var_35 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 2, "modules", 1, var_36 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 2, "modules", 2, var_37 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 3, "streak", var_8 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 3, "modules", 0, var_38 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 3, "modules", 1, var_39 );
    setmatchdata( "players", self._id_1F0F, "loadouts", var_2, "assaultStreaks", 3, "modules", 2, var_40 );
    thread _id_726A( self, var_17, var_18, var_19, var_20, var_21, var_23, var_24, var_25, var_26, var_11, var_12, var_13, var_9[0], var_9[1], var_9[2], var_9[3], var_9[4], var_9[5], var_10[0], var_10[1], var_10[2], var_5, var_29, var_30, var_31, var_6, var_32, var_33, var_34, var_7, var_35, var_36, var_37, var_8, var_38, var_39, var_40 );
    return var_2;
}

_id_726A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17, var_18, var_19, var_20, var_21, var_22, var_23, var_24, var_25, var_26, var_27, var_28, var_29, var_30, var_31, var_32, var_33, var_34, var_35, var_36, var_37 )
{
    var_38 = isbot( var_0 ) || istestclient( var_0 );
    var_39 = "_matchdata.gsc";
    var_40 = var_0._id_03DD;
    var_41 = var_0._id_24C3;
    var_42 = var_0._id_02AB;
    reconevent( "script_mp_loadout_gear: script_file %s, gameTime %d, player_name %s, is_bot %b, class %s, primary_weapon %s, primary_attach_1 %s, primary_attach_2 %s, primary_attach_3 %s, primary_camo %s, secondary_weapon %s, secondary_attach_1 %s, secondary_attach_2 %s, secondary_camo %s, equipment %s, equipment_extra %b, exo_ability %s", var_39, var_40, var_42, var_38, var_41, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 );
    reconevent( "script_mp_loadout_perks: script_file %s, gameTime %d, player_name %s, perk_1 %s, perk_2 %s, perk_3 %s, perk_4 %s, perk_5 %s, perk_6 %s, wildcard_1 %s, wildcard_2 %s, wildcard_3 %s", var_39, var_40, var_42, var_13, var_14, var_15, var_16, var_17, var_18, var_19, var_20, var_21 );
    reconevent( "script_mp_loadout_killstreaks: script_file %s, gameTime %d, player_name %s, killstreak_1 %s, killstreak_1_module_a %s, killstreak_1_module_b %s, killstreak_1_module_c %s, killstreak_2 %s, killstreak_2_module_a %s, killstreak_2_module_b %s, killstreak_2_module_c %s, killstreak_3 %s, killstreak_3_module_a %s, killstreak_3_module_b %s, killstreak_3_module_c %s, killstreak_4 %s, killstreak_4_module_a %s, killstreak_4_module_b %s, killstreak_4_module_c %s", var_39, var_40, var_42, var_22, var_23, var_24, var_25, var_26, var_27, var_28, var_29, var_30, var_31, var_32, var_33, var_34, var_35, var_36, var_37 );
}

_id_583C( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || isplayer( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( var_0 >= level._id_5A3D )
        return;

    var_2 = _id_A75A::_id_412C();

    if ( isdefined( self._id_3501["exo_boost"] ) && isdefined( self._id_3506["exo_boost"] ) )
    {
        var_3 = _id_A75A::_id_1E28( self._id_3501["exo_boost"] );
        setmatchdata( "lives", var_0, "numberOfBoosts", var_3 );
        var_4 = _id_A75A::_id_1E28( var_2 - self._id_3506["exo_boost"] );
        setmatchdata( "lives", var_0, "victimDeciSecondsSinceLastBoost", var_4 );
    }

    if ( isdefined( self._id_3501["ground_slam"] ) && isdefined( self._id_3506["ground_slam"] ) )
    {
        var_3 = _id_A75A::_id_1E28( self._id_3501["ground_slam"] );
        setmatchdata( "lives", var_0, "numberOfBoostsSlams", var_3 );
        var_4 = _id_A75A::_id_1E28( var_2 - self._id_3506["ground_slam"] );
        setmatchdata( "lives", var_0, "victimDeciSecondsSinceLastBoostSlam", var_4 );
    }

    if ( isdefined( self._id_3501["exo_dodge"] ) && isdefined( self._id_3506["exo_dodge"] ) )
    {
        var_3 = _id_A75A::_id_1E28( self._id_3501["exo_dodge"] );
        setmatchdata( "lives", var_0, "numberOfDodges", var_3 );
        var_4 = _id_A75A::_id_1E28( var_2 - self._id_3506["exo_dodge"] );
        setmatchdata( "lives", var_0, "victimDeciSecondsSinceLastDodge", var_4 );
    }

    if ( isdefined( self._id_3501["exo_slide"] ) )
    {
        var_3 = _id_A75A::_id_1E28( self._id_3501["exo_slide"] );
        setmatchdata( "lives", var_0, "numberOfKneeSlides", var_3 );
    }

    if ( isplayer( var_1 ) )
    {
        if ( !isdefined( var_1._id_3506 ) )
            return;

        if ( isdefined( var_1._id_3506["exo_boost"] ) )
        {
            var_4 = _id_A75A::_id_1E28( var_2 - var_1._id_3506["exo_boost"] );
            setmatchdata( "lives", var_0, "killerDeciSecondsSinceLastBoost", var_4 );
        }

        if ( isdefined( var_1._id_3506["ground_slam"] ) )
        {
            var_4 = _id_A75A::_id_1E28( var_2 - var_1._id_3506["ground_slam"] );
            setmatchdata( "lives", var_0, "killerDeciSecondsSinceLastBoostSlam", var_4 );
        }

        if ( isdefined( var_1._id_3506["exo_dodge"] ) )
        {
            var_4 = _id_A75A::_id_1E28( var_2 - var_1._id_3506["exo_dodge"] );
            setmatchdata( "lives", var_0, "killerDeciSecondsSinceLastDodge", var_4 );
        }
    }
}

_id_583B( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || isplayer( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( var_0 >= level._id_5A3D )
        return;

    if ( isplayer( var_1 ) )
    {
        if ( var_1 _meth_8340() > 0.5 )
            setmatchdata( "lives", var_0, "killerWasADS", 1 );

        var_2 = var_1 _meth_80A8();

        if ( _id_A4F0::_id_A33E( var_2, var_1._id_0041, self._id_02E6, cos( getdvarfloat( "cg_fov" ) ) ) )
            setmatchdata( "lives", var_0, "victimWasInKillersFOV", 1 );

        var_3 = self _meth_80A8();

        if ( _id_A4F0::_id_A33E( var_3, self._id_0041, var_1._id_02E6, cos( getdvarfloat( "cg_fov" ) ) ) )
            setmatchdata( "lives", var_0, "killerWasInVictimsFOV", 1 );
    }

    if ( self _meth_8340() > 0.5 )
        setmatchdata( "lives", var_0, "victimWasADS", 1 );
}

_id_583D( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || isplayer( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( var_0 >= level._id_5A3D )
        return;

    if ( isdefined( self._id_34E9 ) && self._id_34E9 )
        setmatchdata( "lives", var_0, "victimShieldActive", 1 );

    if ( isdefined( self._id_3491 ) && self._id_3491 )
        setmatchdata( "lives", var_0, "victimHoverActive", 1 );

    if ( self _meth_84F8() )
        setmatchdata( "lives", var_0, "victimCloakingActive", 1 );

    if ( isplayer( var_1 ) )
    {
        if ( isdefined( var_1._id_34E9 ) && var_1._id_34E9 )
            setmatchdata( "lives", var_0, "killerShieldActive", 1 );

        if ( isdefined( var_1._id_3491 ) && var_1._id_3491 )
            setmatchdata( "lives", var_0, "killerHoverActive", 1 );

        if ( var_1 _meth_84F8() )
            setmatchdata( "lives", var_0, "killerCloakingActive", 1 );
    }
}

_id_29AC( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;

    if ( var_0 == "none" )
    {
        var_2 = "none";
        var_3 = "none";
    }
    else
    {
        var_2 = _func_1DF( var_0 );
        var_3 = weaponclass( var_0 );
    }

    if ( issubstr( var_0, "destructible" ) )
        var_0 = "destructible";

    var_4 = [];
    var_4[0] = "None";
    var_4[1] = "None";
    var_4[2] = "None";
    var_5 = "";

    if ( isdefined( var_2 ) && ( var_2 == "primary" || var_2 == "altmode" ) && ( var_3 == "pistol" || var_3 == "smg" || var_3 == "rifle" || var_3 == "spread" || var_3 == "mg" || var_3 == "grenade" || var_3 == "rocketlauncher" || var_3 == "sniper" || var_3 == "cone" || var_3 == "beam" || var_3 == "shield" ) )
    {
        if ( var_2 == "altmode" )
        {
            if ( isdefined( var_1 ) )
                var_0 = var_1;
        }

        var_6 = _id_A75A::_id_4169( var_0 );
        var_5 = _id_A75A::_id_3F0F( var_0 );

        if ( var_6[0] == "iw5" || var_6[0] == "iw6" )
        {
            var_7 = getweaponattachments( var_0 );
            var_8 = 0;

            foreach ( var_10 in var_7 )
            {
                if ( !_id_A75A::_id_50BA( var_10 ) )
                    continue;

                var_11 = _id_A75A::_id_0E02( var_10 );

                if ( var_8 <= 2 )
                {
                    var_4[var_8] = var_11;
                    var_8++;
                    continue;
                }

                break;
            }
        }
        else if ( var_6[0] == "alt" )
        {
            var_13 = var_6[1] + "_" + var_6[2];
            var_5 = var_13;

            if ( isdefined( var_6[4] ) && _id_A75A::_id_50BA( var_6[4] ) )
            {
                var_11 = _id_A75A::_id_0E02( var_6[4] );
                var_4[0] = var_11;
            }

            if ( isdefined( var_6[5] ) && _id_A75A::_id_50BA( var_6[5] ) )
            {
                var_11 = _id_A75A::_id_0E02( var_6[5] );
                var_4[1] = var_11;
            }
        }
        else
        {
            var_6[var_6.size - 1] = undefined;

            if ( isdefined( var_6[1] ) && var_2 != "altmode" )
            {
                var_11 = _id_A75A::_id_0E02( var_6[1] );
                var_4[0] = var_11;
            }

            if ( isdefined( var_6[2] ) && var_2 != "altmode" )
            {
                var_11 = _id_A75A::_id_0E02( var_6[2] );
                var_4[1] = var_11;
            }
        }
    }
    else if ( var_2 == "item" || var_2 == "offhand" )
    {
        var_5 = _id_A75A::_id_8F56( var_0, "_lefthand" );
        var_5 = _id_A75A::_id_8F56( var_5, "_mp" );
    }
    else
        var_5 = var_0;

    var_14 = spawnstruct();
    var_14._id_A2D6 = var_5;
    var_14._id_0053 = var_4;
    var_14._id_A2EA = var_2;
    var_14._id_A2CC = var_3;
    var_14._id_A2D7 = var_0;
    return var_14;
}

_id_5823( var_0, var_1 )
{
    if ( !_id_1ACE( self ) || isplayer( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( !isplayer( var_1 ) )
        return;

    if ( var_0 >= level._id_5A3D )
        return;

    if ( self._id_2515 > 0 )
        setmatchdata( "lives", var_0, "shots", _id_A75A::_id_1E28( self._id_2515 ) );

    if ( isdefined( var_1._id_32AD ) && isdefined( var_1._id_32AD[self._id_444D] ) && var_1._id_32AD[self._id_444D] > 0 )
        setmatchdata( "lives", var_0, "hits", _id_A75A::_id_1E28( var_1._id_32AD[self._id_444D] ) );

    if ( var_1._id_2515 > 0 )
        setmatchdata( "lives", var_0, "killerShots", _id_A75A::_id_1E28( var_1._id_2515 ) );

    if ( isdefined( self._id_32AD ) && isdefined( self._id_32AD[var_1._id_444D] ) && self._id_32AD[var_1._id_444D] > 0 )
        setmatchdata( "lives", var_0, "killerHits", _id_A75A::_id_1E28( self._id_32AD[var_1._id_444D] ) );
}

_id_583E( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    if ( isplayer( self ) && _id_1ACE( self ) )
    {
        var_2 = _func_2BE( self );
        setmatchdata( "lives", var_0, "victimStanceAndMotionState", var_2 );
    }

    if ( isplayer( var_1 ) && _id_1ACE( var_1 ) )
    {
        var_2 = _func_2BE( var_1 );
        setmatchdata( "lives", var_0, "killerStanceAndMotionState", var_2 );
    }
}

_id_581B( var_0, var_1 )
{
    if ( !_id_1AD1( var_0 ) )
        return;

    if ( isplayer( self ) && _id_1ACE( self ) )
    {
        if ( isdefined( self._id_0E2C ) )
        {
            var_2 = 0;

            foreach ( var_4 in self._id_0E2C )
            {
                if ( isplayer( var_4._id_0E2D ) )
                {
                    if ( var_4._id_0E2D != var_1 )
                    {
                        setmatchdata( "lives", var_0, "assists", var_2, "assistingPlayerIndex", var_4._id_0E2D._id_1F0F );
                        setmatchdata( "lives", var_0, "assists", var_2, "damage", _id_A75A::_id_1E28( var_4._id_00FB ) );
                        var_2++;

                        if ( var_2 == 5 )
                            break;
                    }
                }
            }

            if ( var_2 < 5 )
            {
                for ( var_6 = var_2; var_6 < 5; var_6++ )
                    setmatchdata( "lives", var_0, "assists", var_6, "assistingPlayerIndex", 255 );
            }
        }
    }
}

_id_5848( var_0, var_1 )
{
    if ( !isplayer( self ) || !_id_1ACE( self ) )
        return;

    if ( !isplayer( var_0 ) || !_id_1ACE( var_0 ) )
        return;

    var_2 = self._id_56F4;

    if ( !_id_1AD1( var_2 ) )
        return;

    if ( var_1 == "assist_emp" || var_1 == "assist_uav" || var_1 == "assist_uav_plus" || var_1 == "assist_riot_shield" )
    {
        for ( var_3 = 0; var_3 < 5; var_3++ )
        {
            var_4 = getmatchdata( "lives", var_2, "assists", var_3, "assistingPlayerIndex" );

            if ( var_4 == var_0._id_1F0F || var_4 == 255 )
            {
                if ( var_4 == 255 )
                    setmatchdata( "lives", var_2, "assists", var_3, "assistingPlayerIndex", var_0._id_1F0F );

                if ( var_1 == "assist_emp" )
                    setmatchdata( "lives", var_2, "assists", var_3, "assistEMP", 1 );
                else if ( var_1 == "assist_uav" )
                    setmatchdata( "lives", var_2, "assists", var_3, "assistUAV", 1 );
                else if ( var_1 == "assist_uav_plus" )
                    setmatchdata( "lives", var_2, "assists", var_3, "assistUAVPlus", 1 );
                else if ( var_1 == "assist_riot_shield" )
                    setmatchdata( "lives", var_2, "assists", var_3, "assistRiotShield", 1 );
                else
                {

                }

                break;
            }
        }
    }
}

_id_5842( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !_id_1ACE( self ) || isplayer( var_1 ) && !_id_1ACE( var_1 ) || !_id_1AD1( var_0 ) )
        return;

    if ( var_0 >= level._id_5A3D )
        return;

    if ( level.iszombiegame )
        return;

    if ( isdefined( level._id_511A ) && level._id_511A )
        return;

    _id_583C( var_0, var_1 );
    _id_583B( var_0, var_1 );
    _id_583D( var_0, var_1 );
    _id_5823( var_0, var_1 );
    _id_583E( var_0, var_1 );
    _id_581B( var_0, var_1 );
    var_8 = _id_29AC( var_4, var_5 );

    for ( var_9 = 0; var_9 < 3; var_9++ )
    {
        if ( isdefined( var_8._id_0053[var_9] ) && var_8._id_0053[var_9] != "None" )
            setmatchdata( "lives", var_0, "killersWeaponAttachments", var_9, var_8._id_0053[var_9] );
    }

    if ( var_8._id_A2EA != "exclusive" )
        setmatchdata( "lives", var_0, "killersWeapon", var_8._id_A2D6 );

    if ( var_8._id_A2D7 == "altmode" )
        setmatchdata( "lives", var_0, "killersWeaponAltMode", 1 );

    if ( _id_A75A::_id_513A( var_8._id_A2D7 ) )
    {
        setmatchdata( "lives", var_0, "modifiers", "killstreak", 1 );

        if ( isdefined( var_1._id_2517 ) )
        {
            var_10 = getmatchdata( "killstreaks", var_1._id_2517, "killsTotal" );
            var_10++;
            setmatchdata( "killstreaks", var_1._id_2517, "killsTotal", _id_A75A::_id_1E29( var_10 ) );
            setmatchdata( "lives", var_0, "killerKillstreakIndex", var_1._id_2517 );
        }
    }
    else
        setmatchdata( "lives", var_0, "killerKillstreakIndex", 255 );

    var_11 = _id_29AC( var_7, undefined );

    for ( var_9 = 0; var_9 < 3; var_9++ )
    {
        if ( isdefined( var_11._id_0053[var_9] ) && var_11._id_0053[var_9] != "None" )
            setmatchdata( "lives", var_0, "victimCurrentWeaponAtDeathAttachments", var_9, var_11._id_0053[var_9] );
    }

    if ( var_11._id_A2EA != "exclusive" )
    {
        if ( _id_A75A::_id_513A( var_11._id_A2D6 ) )
        {
            if ( isdefined( self._id_0343 ) )
            {
                var_12 = _id_A75A::_id_3F0F( self._id_0343 );
                setmatchdata( "lives", var_0, "victimCurrentWeaponAtDeath", var_12 );
            }
        }
        else
            setmatchdata( "lives", var_0, "victimCurrentWeaponAtDeath", var_11._id_A2D6 );
    }

    if ( isdefined( self._id_6808 ) && isdefined( self._id_6808[var_11._id_A2D7] ) )
        setmatchdata( "lives", var_0, "victimCurrentWeaponPickedUp", 1 );

    setmatchdata( "lives", var_0, "meansOfDeath", var_3 );
    var_13 = 2;

    if ( isplayer( var_1 ) )
    {
        setmatchdata( "lives", var_0, "killer", var_1._id_1F0F );
        setmatchdata( "lives", var_0, "killerLifeIndex", var_1._id_56F4 );
        setmatchdata( "lives", var_0, "killerPos", 0, int( var_1._id_02E6[0] ) );
        setmatchdata( "lives", var_0, "killerPos", 1, int( var_1._id_02E6[1] ) );
        setmatchdata( "lives", var_0, "killerPos", 2, int( var_1._id_02E6[2] ) );
        setmatchdata( "lives", var_0, "killerAngles", 0, int( var_1._id_0041[0] ) );
        setmatchdata( "lives", var_0, "killerAngles", 1, int( var_1._id_0041[1] ) );
        setmatchdata( "lives", var_0, "killerAngles", 2, int( var_1._id_0041[2] ) );
        var_14 = anglestoforward( ( 0, self._id_0041[1], 0 ) );
        var_15 = self._id_02E6 - var_1._id_02E6;
        var_15 = vectornormalize( ( var_15[0], var_15[1], 0 ) );
        var_13 = vectordot( var_14, var_15 );
        setmatchdata( "lives", var_0, "dotOfDeath", var_13 );

        if ( var_1 _id_A75A::_id_512E() )
            setmatchdata( "lives", var_0, "killerIsJuggernaut", 1 );

        if ( isdefined( var_1._id_6808 ) && isdefined( var_1._id_6808[var_8._id_A2D7] ) )
            setmatchdata( "lives", var_0, "killerCurrentWeaponPickedUp", 1 );
    }
    else
    {
        setmatchdata( "lives", var_0, "killer", 255 );
        setmatchdata( "lives", var_0, "killerLifeIndex", 65535 );
        setmatchdata( "lives", var_0, "killerPos", 0, int( self._id_02E6[0] ) );
        setmatchdata( "lives", var_0, "killerPos", 1, int( self._id_02E6[1] ) );
        setmatchdata( "lives", var_0, "killerPos", 2, int( self._id_02E6[2] ) );
        setmatchdata( "lives", var_0, "killerAngles", 0, int( self._id_0041[0] ) );
        setmatchdata( "lives", var_0, "killerAngles", 1, int( self._id_0041[1] ) );
        setmatchdata( "lives", var_0, "killerAngles", 2, int( self._id_0041[2] ) );
    }

    setmatchdata( "lives", var_0, "player", self._id_1F0F );
    setmatchdata( "lives", var_0, "victimPos", 0, int( self._id_02E6[0] ) );
    setmatchdata( "lives", var_0, "victimPos", 1, int( self._id_02E6[1] ) );
    setmatchdata( "lives", var_0, "victimPos", 2, int( self._id_02E6[2] ) );
    setmatchdata( "lives", var_0, "victimAngles", 0, int( self._id_0041[0] ) );
    setmatchdata( "lives", var_0, "victimAngles", 1, int( self._id_0041[1] ) );
    setmatchdata( "lives", var_0, "victimAngles", 2, int( self._id_0041[2] ) );
    var_16 = "world";

    if ( isplayer( var_1 ) )
        var_16 = var_1._id_02AB;

    var_17 = 1;
    var_18 = 0;
    var_19 = _id_A75A::_id_50AE( self );
    var_20 = 0;

    if ( isplayer( var_1 ) )
        var_20 = _id_A75A::_id_50AE( var_1 );

    var_21 = length( self._id_02E6 - var_1._id_02E6 );
    var_22 = 0;
    var_23 = 0.0;
    var_24 = -1;
    var_25 = -1;
    var_26 = gettime();

    if ( isplayer( var_1 ) )
        var_23 = var_1 _meth_8340();

    var_27 = var_1._id_1F0F;

    if ( !isdefined( var_27 ) )
        var_27 = -1;

    var_28 = var_1._id_56F4;

    if ( !isdefined( var_28 ) )
        var_28 = -1;

    var_29 = 0.1;

    if ( self._id_2582.size > 1 )
        var_17 = 0;

    if ( isdefined( self._id_2582[var_1 _meth_81B1()] ) )
        var_18 = self._id_2582[var_1 _meth_81B1()]._id_6288;

    var_30 = self._id_030D["primaryWeapon"] + "_mp";
    var_31 = weaponclass( var_30 );

    if ( issubstr( var_8._id_A2D6, "loot" ) )
        var_22 = 1;

    if ( isdefined( self._id_89DE ) && isdefined( self._id_89DE._id_03DD ) )
        var_24 = ( var_26 - self._id_89DE._id_03DD ) / 1000.0;

    if ( isdefined( var_1._id_89DE ) && isdefined( var_1._id_89DE._id_03DD ) && isplayer( var_1 ) )
        var_25 = ( var_26 - var_1._id_89DE._id_03DD ) / 1000.0;

    reconspatialevent( self._id_02E6, "script_mp_playerdeath: player_name %s, life_id %d, angles %v, death_dot %f, is_jugg %b, is_killstreak %b, mod %s, gameTime %d, spawnToDeathTime %f, attackerAliveTime %f, attacker_life_id %d", self._id_02AB, self._id_56F4, self._id_0041, var_13, var_1 _id_A75A::_id_512E(), _id_A75A::_id_513A( var_8._id_A2D7 ), var_3, var_26, var_24, var_25, var_28 );
    reconspatialevent( self._id_02E6, "script_mp_weaponinfo: player_name %s, life_id %d, isbot %b, attacker_name %s, attacker %d, attacker_pos %v, distance %f, ads_fraction %f, is_jugg %b, is_killstreak %b, weapon_type %s, weapon_class %s, weapon_name %s, isLoot %b, attachment0 %s, attachment1 %s, attachment2 %s, numShots %d, soleAttacker %b, gameTime %d", self._id_02AB, self._id_56F4, var_19, var_16, var_27, var_1._id_02E6, var_21, var_23, var_1 _id_A75A::_id_512E(), _id_A75A::_id_513A( var_8._id_A2D7 ), var_8._id_A2EA, var_8._id_A2CC, var_8._id_A2D6, var_22, var_8._id_0053[0], var_8._id_0053[1], var_8._id_0053[2], var_18, var_17, var_26 );
    reconspatialevent( self._id_02E6, "script_mp_weaponinfo_ext: player_name %s, life_id %d, gametime %d, version %f, victimWeapon %s, victimWeaponClass %s, killerIsBot %b", self._id_02AB, self._id_56F4, var_26, var_29, var_30, var_31, var_20 );

    if ( !isdefined( level._id_59DD ) )
        level._id_59DD = [];

    if ( !isdefined( level._id_59DD["deathCount"] ) )
        level._id_59DD["deathCount"] = 1;
    else
        level._id_59DD["deathCount"]++;

    if ( var_24 <= 3.0 )
    {
        if ( !isdefined( level._id_59DD["badSpawnDiedTooFastCount"] ) )
            level._id_59DD["badSpawnDiedTooFastCount"] = 1;
        else
            level._id_59DD["badSpawnDiedTooFastCount"]++;

        if ( self._id_89DE._id_126D == 0 )
        {
            if ( !isdefined( level._id_59DD["badSpawnByAnyMeansCount"] ) )
                level._id_59DD["badSpawnByAnyMeansCount"] = 1;
            else
                level._id_59DD["badSpawnByAnyMeansCount"]++;

            self._id_89DE._id_126D = 1;
        }
    }

    if ( isplayer( var_1 ) && var_25 <= 3.0 && !( var_8._id_A2D6 == "sentry_minigun_mp" ) )
    {
        if ( !isdefined( level._id_59DD["badSpawnKilledTooFastCount"] ) )
            level._id_59DD["badSpawnKilledTooFastCount"] = 1;
        else
            level._id_59DD["badSpawnKilledTooFastCount"]++;

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

_id_5841()
{
    if ( !_id_1ACE( self ) )
        return;

    setmatchdata( "players", self._id_1F0F, "score", _id_A75A::_id_407F( "score" ) );

    if ( _id_A75A::_id_407F( "assists" ) > 255 )
        setmatchdata( "players", self._id_1F0F, "assists", 255 );
    else
        setmatchdata( "players", self._id_1F0F, "assists", _id_A75A::_id_407F( "assists" ) );

    if ( _id_A75A::_id_407F( "longestStreak" ) > 255 )
        setmatchdata( "players", self._id_1F0F, "longestStreak", 255 );
    else
        setmatchdata( "players", self._id_1F0F, "longestStreak", _id_A75A::_id_407F( "longestStreak" ) );

    if ( isdefined( self ) && isdefined( self._id_030D ) && isdefined( self._id_030D["validationInfractions"] ) )
    {
        if ( _id_A75A::_id_407F( "validationInfractions" ) > 255 )
            setmatchdata( "players", self._id_1F0F, "validationInfractions", 255 );
        else
            setmatchdata( "players", self._id_1F0F, "validationInfractions", _id_A75A::_id_407F( "validationInfractions" ) );
    }
}

_id_31B6()
{
    foreach ( var_1 in level._id_0328 )
    {
        wait 0.05;

        if ( !isdefined( var_1 ) )
            continue;

        _id_5844( var_1 );

        if ( isdefined( var_1._id_2990 ) && var_1._id_2990 && var_1 _id_A75A::_id_7136() )
            var_1 _meth_8244( "restXPGoal", var_1._id_2990 );

        var_2 = undefined;
        var_3 = 0;

        if ( isdefined( game["challengeStruct"] ) && isdefined( game["challengeStruct"]["challengesCompleted"] ) && isdefined( game["challengeStruct"]["challengesCompleted"][var_1._id_444D] ) )
            var_3 = 1;

        if ( var_3 )
        {
            var_2 = game["challengeStruct"]["challengesCompleted"][var_1._id_444D];

            if ( var_2.size > 0 )
            {
                var_1 _meth_8247( "round", "challengeNumCompleted", var_2.size );
                var_4 = _id_A75A::_id_1E28( var_2.size );
                setmatchdata( "players", var_1._id_1F0F, "challengesCompleted", var_4 );
            }
            else
                var_1 _meth_8247( "round", "challengeNumCompleted", 0 );
        }
        else
            var_1 _meth_8247( "round", "challengeNumCompleted", 0 );

        for ( var_5 = 0; var_5 < 20; var_5++ )
        {
            if ( isdefined( var_2 ) && isdefined( var_2[var_5] ) && var_2[var_5] != 8000 )
            {
                var_1 _meth_8247( "round", "challengesCompleted", var_5, var_2[var_5] );
                continue;
            }

            var_1 _meth_8247( "round", "challengesCompleted", var_5, 0 );
        }

        var_1 _meth_8247( "round", "gameMode", level._id_01B5 );
        var_1 _meth_8247( "round", "map", tolower( getdvar( "mapname" ) ) );
    }
}

_id_5844( var_0 )
{
    if ( !isdefined( var_0._id_030D["maxPing"] ) || !isdefined( var_0._id_030D["minPing"] ) || !isdefined( var_0._id_030D["pingAccumulation"] ) || !isdefined( var_0._id_030D["pingSampleCount"] ) )
        return;

    if ( var_0._id_030D["pingSampleCount"] > 0 && var_0._id_030D["maxPing"] > 0 )
    {
        var_1 = _id_A75A::_id_1E29( var_0._id_030D["pingAccumulation"] / var_0._id_030D["pingSampleCount"] );
        setmatchdata( "players", var_0._id_1F0F, "averagePing", var_1 );
        setmatchdata( "players", var_0._id_1F0F, "maxPing", _id_A75A::_id_1E29( var_0._id_030D["maxPing"] ) );
        setmatchdata( "players", var_0._id_1F0F, "minPing", _id_A75A::_id_1E29( var_0._id_030D["minPing"] ) );
    }
}

_id_3BD9()
{
    level waittill( "game_ended" );

    foreach ( var_1 in level._id_0328 )
    {
        var_1 _id_5841();

        if ( !isalive( var_1 ) )
            continue;

        var_1 _id_5843( 0 );
    }

    foreach ( var_1 in level._id_0328 )
    {
        if ( var_1._id_93F4 > 0 )
        {
            var_4 = var_1 _id_A75A::_id_407F( "score" ) / ( var_1._id_93F4 / 60000 );
            _func_241( var_1._id_0537, var_4, var_1._id_04A8 );
        }

        var_1._id_93F4 = 0;
    }
}

_id_1ACE( var_0 )
{
    if ( isagent( var_0 ) )
        return 0;

    var_1 = var_0._id_00AD;

    if ( !isdefined( var_1 ) )
        var_1 = "undefined";

    return var_0._id_1F0F < level._id_5A3F;
}

_id_1ACF()
{
    return getmatchdata( "eventCount" ) < level._id_5A34;
}

_id_1AD0()
{
    return getmatchdata( "killstreakCount" ) < level._id_5A39;
}

_id_1AD1( var_0 )
{
    return getmatchdata( "lifeCount" ) < level._id_5A3D;
}

_id_5849( var_0, var_1, var_2 )
{
    if ( !_id_1ACE( self ) )
        return;

    if ( _id_A75A::_id_513A( var_0 ) )
        return;

    if ( !isdefined( self._id_030D["mpWeaponStats"][var_0] ) )
        self._id_030D["mpWeaponStats"][var_0] = [];

    if ( !isdefined( self._id_030D["mpWeaponStats"][var_0][var_1] ) )
        self._id_030D["mpWeaponStats"][var_0][var_1] = 0;

    var_3 = self._id_030D["mpWeaponStats"][var_0][var_1];
    var_3 += var_2;
    self._id_030D["mpWeaponStats"][var_0][var_1] = var_3;
}

_id_1877()
{
    var_0 = [];
    var_1 = 149;

    for ( var_2 = 0; var_2 <= var_1; var_2++ )
    {
        var_3 = tablelookup( "mp/statstable.csv", 0, var_2, 4 );

        if ( var_3 == "" )
            continue;

        if ( !issubstr( tablelookup( "mp/statsTable.csv", 0, var_2, 2 ), "weapon_" ) )
            continue;

        if ( tablelookup( "mp/statsTable.csv", 0, var_2, 2 ) == "weapon_other" )
            continue;

        if ( tablelookup( "mp/statsTable.csv", 0, var_2, 51 ) != "" )
            continue;

        var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_5836()
{
    if ( !_id_1ACE( self ) )
        return;

    setmatchdata( "players", self._id_1F0F, "killsConfirmed", self._id_030D["confirmed"] );
}

_id_5837()
{
    if ( !_id_1ACE( self ) )
        return;

    setmatchdata( "players", self._id_1F0F, "killsDenied", self._id_030D["denied"] );
}

_id_5834()
{
    if ( getdvarint( "mdsd" ) > 0 )
    {
        var_0 = self _meth_8223( "experience" );
        setmatchdata( "players", self._id_1F0F, "startXp", var_0 );
        setmatchdata( "players", self._id_1F0F, "startKills", self _meth_8223( "kills" ) );
        setmatchdata( "players", self._id_1F0F, "startDeaths", self _meth_8223( "deaths" ) );
        setmatchdata( "players", self._id_1F0F, "startWins", self _meth_8223( "wins" ) );
        setmatchdata( "players", self._id_1F0F, "startLosses", self _meth_8223( "losses" ) );
        setmatchdata( "players", self._id_1F0F, "startHits", self _meth_8223( "hits" ) );
        setmatchdata( "players", self._id_1F0F, "startMisses", self _meth_8223( "misses" ) );
        setmatchdata( "players", self._id_1F0F, "startGamesPlayed", self _meth_8223( "gamesPlayed" ) );
        setmatchdata( "players", self._id_1F0F, "startScore", self _meth_8223( "score" ) );
        setmatchdata( "players", self._id_1F0F, "startUnlockPoints", self _meth_8223( "unlockPoints" ) );
        setmatchdata( "players", self._id_1F0F, "startPrestige", self _meth_8223( "prestige" ) );
        setmatchdata( "players", self._id_1F0F, "startDP", self _meth_8223( "division" ) );
        var_1 = self _meth_8223( "mmr" );
        setmatchdata( "players", self._id_1F0F, "startMMR", var_1 );
    }
}

_id_5822()
{
    if ( getdvarint( "mdsd" ) > 0 )
    {
        var_0 = self _meth_8223( "experience" );
        setmatchdata( "players", self._id_1F0F, "endXp", var_0 );
        setmatchdata( "players", self._id_1F0F, "endKills", self _meth_8223( "kills" ) );
        setmatchdata( "players", self._id_1F0F, "endDeaths", self _meth_8223( "deaths" ) );
        setmatchdata( "players", self._id_1F0F, "endWins", self _meth_8223( "wins" ) );
        setmatchdata( "players", self._id_1F0F, "endLosses", self _meth_8223( "losses" ) );
        setmatchdata( "players", self._id_1F0F, "endHits", self _meth_8223( "hits" ) );
        setmatchdata( "players", self._id_1F0F, "endMisses", self _meth_8223( "misses" ) );
        setmatchdata( "players", self._id_1F0F, "endGamesPlayed", self _meth_8223( "gamesPlayed" ) );
        setmatchdata( "players", self._id_1F0F, "endScore", self _meth_8223( "score" ) );
        setmatchdata( "players", self._id_1F0F, "endUnlockPoints", self _meth_8223( "unlockPoints" ) );
        setmatchdata( "players", self._id_1F0F, "endPrestige", self _meth_8223( "prestige" ) );
        var_1 = self _meth_8223( "mmr" );
        setmatchdata( "players", self._id_1F0F, "endMMR", var_1 );

        if ( isdefined( self._id_030D["rank"] ) )
        {
            var_3 = _id_A75A::_id_1E28( _id_A7AA::_id_40A7() );
            setmatchdata( "players", self._id_1F0F, "rankAtEnd", var_3 );
        }
    }
}

_id_7278()
{
    for (;;)
    {
        if ( getdvarint( "cl_freemove" ) == 0 )
        {
            foreach ( var_1 in level._id_0328 )
            {
                var_2 = 0;

                if ( _id_A75A::_id_5186( var_1 ) )
                    var_2 = 1;

                if ( istestclient( var_1 ) )
                    continue;

                if ( !isdefined( var_1._id_02E6 ) )
                    continue;

                var_3 = "disconnected?";

                if ( isdefined( var_1._id_02AB ) )
                    var_3 = var_1._id_02AB;

                var_4 = -1;

                if ( isdefined( var_1._id_1F0F ) )
                    var_4 = var_1._id_1F0F;

                var_5 = ( -999, -999, -999 );

                if ( isdefined( var_1._id_0041 ) )
                    var_5 = var_1._id_0041;

                var_6 = "undefined";

                if ( isdefined( var_1._id_04A8 ) )
                    var_6 = var_1._id_04A8;

                var_7 = gettime();
                reconspatialevent( var_1._id_02E6, "script_mp_playerpos: player_name %s, angles %v, gameTime %d, playerTeam %s, is_alive %b", var_3, var_5, var_7, var_6, var_2 );
            }
        }

        wait 0.2;
    }
}
