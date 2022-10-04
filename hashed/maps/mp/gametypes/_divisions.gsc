// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

checkforseason1start()
{
    if ( !isvalidplayer() )
        return;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( isdefined( level._id_511A ) && level._id_511A )
        return;

    if ( !_id_A75A::_id_7136() )
        return;

    if ( isdefined( self._id_030D["division"] ) && isdefined( self._id_030D["division"]["seasonStart"] ) )
        return;

    var_0 = self _meth_8223( "currentSeason" );
    var_1 = getdvarint( "scr_game_season" );

    if ( var_1 > 0 && var_0 == 0 )
    {
        self _meth_8244( "division", 0 );
        self _meth_8244( "mmr", -31768 );
        self _meth_8244( "divisionRelegationCounter", 0 );
        self _meth_8244( "divisionChallengePlayed", 0 );
        self _meth_8244( "divisionChallengeWon", 0 );
        self _meth_8247( "round", "matchPrediction", 0 );
        self _meth_8247( "round", "matchDp", 0 );
        self _meth_8244( "currentSeason", var_1 );
        self._id_030D["division"]["seasonStart"] = 1;
    }
}

_id_0209()
{
    if ( _id_A75A::_id_4FA3() )
        return;

    if ( getdvarint( "scr_game_division" ) == 1 )
    {
        level.teammmr["allies"] = 0;
        level.teammmr["axis"] = 0;
        thread onrankedmatchstart();
        thread onmatchend();
    }
    else
        thread onnonrankedmatchstart();
}

isvalidplayer()
{
    return !isbot( self ) && !isagent( self ) && !istestclient( self );
}

onnonrankedmatchstart()
{
    level endon( "game_win" );
    level endon( "exitLevel_called" );

    foreach ( var_1 in level._id_0328 )
    {
        var_1 checkforseason1start();
        var_1 clearmatchprediction();
        var_1._id_030D["division"]["index"] = 0;
    }

    for (;;)
    {
        level waittill( "connected", var_1 );
        var_1 checkforseason1start();
        var_1 clearmatchprediction();
        var_1._id_030D["division"]["index"] = 0;
    }
}

onrankedmatchstart()
{
    level endon( "game_win" );
    level endon( "exitLevel_called" );

    foreach ( var_1 in level._id_0328 )
        var_1 thread _id_64C5();

    for (;;)
    {
        level waittill( "connected", var_1 );
        var_1 thread _id_64C5();
    }
}

_id_64C5()
{
    level endon( "game_win" );
    level endon( "exitLevel_called" );

    if ( isvalidplayer() )
    {
        checkforseason1start();
        initloss();
        self _meth_854F( self._id_030D["division"]["init"]["dp"] );
    }
}

onmatchend()
{
    level endon( "exitLevel_called" );

    for (;;)
    {
        level waittill( "game_win", var_0 );

        if ( !isdefined( var_0 ) || var_0 != "axis" && var_0 != "allies" && var_0 != "tie" )
            continue;

        calculateteammmrs();
        checkforfeit();

        foreach ( var_2 in level._id_0328 )
        {
            if ( !var_2 isvalidplayer() )
                continue;

            var_2 calculatematchprediction();
            var_3 = var_2._id_030D["division"]["init"]["dp"];

            if ( var_2._id_030D["division"]["wonByForfeit"] || var_2._id_04A8 == var_0 )
                var_2 ondivisionwin( var_3 );
            else if ( var_0 == "tie" )
                var_2 ondivisiontie( var_3 );
            else
                var_2 ondivisionloss( var_3 );

            var_4 = var_2 _meth_8223( "division" );
            var_2 _meth_8247( "round", "matchDp", var_4 - var_3 + 128 );
            var_2 _meth_84D1( "rankedPlaylistLockTime", 0 );
        }

        break;
    }
}

ondivisionwin( var_0 )
{
    getdivisionpointrange( var_0 );

    if ( !isdefined( self._id_030D["division"]["minDP"] ) )
        return;

    var_1 = getdivisionpointsdelta( self._id_030D["division"]["matchPrediction"], "win" );
    var_2 = self._id_030D["division"]["init"]["deltaDP"];
    setplayermmr( var_1 );
    savematchprediction( "win" );
    self._id_030D["division"]["dp"] = var_0;

    if ( self._id_030D["division"]["minDP"] == var_0 )
        self _meth_8244( "divisionRelegationCounter", self._id_030D["division"]["init"]["relegation"] );

    if ( isdefined( self._id_030D["division"]["maxDP"] ) )
    {
        if ( self._id_030D["division"]["maxDP"] == var_0 )
        {
            if ( self._id_030D["division"]["init"]["winBits"] > 0 )
            {
                self _meth_8244( "division", var_0 + 1 );
                self _meth_8244( "divisionRelegationCounter", 0 );
            }
            else
                self _meth_8244( "division", var_0 );

            updatedivisionchallengestatus( 1 );
        }
        else
            self _meth_8244( "division", int( min( float( self._id_030D["division"]["maxDP"] ), float( var_0 + var_1 ) ) ) );
    }
    else
        self _meth_8244( "division", var_0 + var_1 );
}

ondivisionloss( var_0 )
{
    getdivisionpointrange( var_0 );

    if ( !isdefined( self._id_030D["division"]["minDP"] ) )
        return;

    var_1 = getdivisionpointsdelta( self._id_030D["division"]["matchPrediction"], "loss" );
    var_2 = self._id_030D["division"]["init"]["deltaDP"];
    var_3 = var_1 - var_2;
    savematchprediction( "loss" );

    if ( var_3 == 0 )
        return;

    setplayermmr( var_1 );

    if ( isdefined( self._id_030D["division"]["maxDP"] ) && self._id_030D["division"]["maxDP"] == var_0 )
        return;
    else if ( self._id_030D["division"]["minDP"] == var_0 )
        return;
    else
        self _meth_8244( "division", int( max( float( self._id_030D["division"]["minDP"] ), float( var_0 + var_1 ) ) ) );
}

ondivisiontie( var_0 )
{
    getdivisionpointrange( var_0 );

    if ( !isdefined( self._id_030D["division"]["minDP"] ) )
        return;

    var_1 = getdivisionpointsdelta( self._id_030D["division"]["matchPrediction"], "tie" );
    var_2 = self._id_030D["division"]["init"]["deltaDP"];
    var_3 = var_1 - var_2;
    savematchprediction( "tie" );

    if ( var_3 == 0 )
        return;

    setplayermmr( var_1 );

    if ( self._id_030D["division"]["minDP"] == var_0 )
        self _meth_8244( "divisionRelegationCounter", self._id_030D["division"]["init"]["relegation"] );

    if ( isdefined( self._id_030D["division"]["maxDP"] ) )
    {
        if ( self._id_030D["division"]["maxDP"] == var_0 )
        {
            self _meth_8244( "division", var_0 );
            self _meth_8244( "divisionChallengePlayed", self._id_030D["division"]["init"]["playBits"] );
            self _meth_8244( "divisionChallengeWon", self._id_030D["division"]["init"]["winBits"] );
            return;
        }
        else if ( var_1 > 0 )
        {
            self _meth_8244( "division", int( min( float( self._id_030D["division"]["maxDP"] ), float( var_0 + var_1 ) ) ) );
            return;
        }
    }

    self _meth_8244( "division", int( max( float( self._id_030D["division"]["minDP"] ), float( var_0 + var_1 ) ) ) );
}

initloss()
{
    if ( isdefined( self._id_030D["division"] ) && isdefined( self._id_030D["division"]["init"] ) )
        return;

    clearmatchprediction();
    var_0 = self _meth_8223( "division" );
    var_1 = int( tablelookup( "mp/divisiontable.csv", 0, "forfeit", 1 ) );
    getdivisionchallengestatus();
    getmmr();

    if ( self._id_030D["division"]["wins"] >= 2 || self._id_030D["division"]["losses"] >= 2 )
        cleardivisionchallengestatus();

    if ( self _meth_8223( "divisionRelegationCounter" ) >= 3 )
        self _meth_8244( "divisionRelegationCounter", 0 );

    self._id_030D["division"]["init"]["dp"] = var_0;
    self._id_030D["division"]["init"]["deltaDP"] = var_1;
    self._id_030D["division"]["init"]["relegation"] = self _meth_8223( "divisionRelegationCounter" );
    self._id_030D["division"]["init"]["playBits"] = self _meth_8223( "divisionChallengePlayed" );
    self._id_030D["division"]["init"]["winBits"] = self _meth_8223( "divisionChallengeWon" );
    self._id_030D["division"]["init"]["MMR"] = self._id_030D["division"]["MMR"];
    thread updatelockouttime();
    self._id_030D["division"]["dp"] = var_0;
    getdivisionpointrange( var_0 );

    if ( !isdefined( self._id_030D["division"]["minDP"] ) )
        return;

    setplayermmr( var_1 );

    if ( isdefined( self._id_030D["division"]["maxDP"] ) && self._id_030D["division"]["maxDP"] == var_0 )
    {
        self._id_030D["division"]["losses"]++;

        if ( self._id_030D["division"]["losses"] >= 2 )
            self _meth_8244( "division", self._id_030D["division"]["minDP"] + getdivisionresetoffset() );
        else
        {

        }

        updatedivisionchallengestatus( 0 );
    }
    else if ( self._id_030D["division"]["minDP"] == var_0 )
    {
        if ( self._id_030D["division"]["minDP"] > 0 )
        {
            var_2 = self._id_030D["division"]["init"]["relegation"] + 1;

            if ( var_2 >= 3 )
            {
                getdivisionpointrange( var_0 - 1 );
                self _meth_8244( "division", self._id_030D["division"]["minDP"] + getdivisionresetoffset() );
            }
            else
            {

            }

            self _meth_8244( "divisionRelegationCounter", var_2 );
        }
    }
    else
        self _meth_8244( "division", int( max( float( self._id_030D["division"]["minDP"] ), float( var_0 + var_1 ) ) ) );
}

updatelockouttime()
{
    level endon( "exitLevel_called" );
    level endon( "game_win" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( _func_294( self ) )
            break;

        self _meth_84D1( "rankedPlaylistLockTime", gettimeutc() );
        wait 10;
    }
}

getdivisionpointrange( var_0 )
{
    var_1 = _func_295( "mp/divisiontable.csv" );
    var_2 = tablelookuprownum( "mp/divisiontable.csv", 0, "bronze" );

    for ( var_3 = var_2; var_3 < var_1; var_3++ )
    {
        var_4 = tablelookupbyrow( "mp/divisiontable.csv", var_3, 2 );

        if ( !isdefined( var_4 ) || var_4 == "" )
        {
            self._id_030D["division"]["minDP"] = int( tablelookupbyrow( "mp/divisiontable.csv", var_3, 1 ) );
            self._id_030D["division"]["maxDP"] = undefined;
            self._id_030D["division"]["index"] = var_3 - var_2;
            return;
        }

        var_5 = int( var_4 );

        if ( var_0 <= var_5 )
        {
            self._id_030D["division"]["minDP"] = int( tablelookupbyrow( "mp/divisiontable.csv", var_3, 1 ) );
            self._id_030D["division"]["maxDP"] = var_5;
            self._id_030D["division"]["index"] = var_3 - var_2;
            return;
        }
    }

    self._id_030D["division"]["minDP"] = undefined;
    self._id_030D["division"]["maxDP"] = undefined;
}

getdivisionchallengestatus()
{
    var_0 = self _meth_8223( "divisionChallengePlayed" );
    var_1 = self _meth_8223( "divisionChallengeWon" );
    var_2 = 0;
    var_3 = 0;

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        if ( var_0 >> var_4 & 1 )
        {
            if ( var_1 >> var_4 & 1 )
                var_2++;
            else
                var_3++;

            continue;
        }

        break;
    }

    self._id_030D["division"]["wins"] = var_2;
    self._id_030D["division"]["losses"] = var_3;
}

cleardivisionchallengestatus()
{
    self _meth_8244( "divisionChallengePlayed", 0 );
    self _meth_8244( "divisionChallengeWon", 0 );
    self._id_030D["division"]["wins"] = 0;
    self._id_030D["division"]["losses"] = 0;
}

updatedivisionchallengestatus( var_0 )
{
    var_1 = self._id_030D["division"]["init"]["playBits"];
    var_2 = self._id_030D["division"]["init"]["winBits"];
    var_1 = var_1 << 1 | 1;
    var_2 <<= 1;

    if ( var_0 )
        var_2 |= 1;

    self _meth_8244( "divisionChallengePlayed", var_1 );
    self _meth_8244( "divisionChallengeWon", var_2 );
}

getmmr()
{
    var_0 = self _meth_8223( "mmr" );
    var_0 -= -32768;
    self._id_030D["division"]["MMR"] = var_0;
}

savemmr()
{
    var_0 = self._id_030D["division"]["MMR"] + -32768;
    self _meth_8244( "mmr", var_0 );
}

savematchprediction( var_0 )
{
    var_1 = 8;
    var_2 = self._id_030D["division"]["matchPrediction"];

    if ( var_2 == "win" )
        var_1 |= 1;
    else if ( var_2 == "loss" )
        var_1 |= 2;

    if ( var_0 == "win" )
        var_1 |= 16;
    else if ( var_0 == "loss" )
        var_1 |= 32;

    self _meth_8247( "round", "matchPrediction", var_1 );
}

clearmatchprediction()
{
    if ( !isvalidplayer() )
        return;

    self _meth_8247( "round", "matchPrediction", 0 );
}

calculateteammmrs()
{
    var_0["axis"] = 0;
    var_0["allies"] = 0;
    level.teammmr["axis"] = 0;
    level.teammmr["allies"] = 0;

    foreach ( var_2 in level._id_0328 )
    {
        if ( !var_2 isvalidplayer() )
            continue;

        if ( !isdefined( var_2._id_04A8 ) || var_2._id_04A8 != "allies" && var_2._id_04A8 != "axis" )
            continue;

        if ( !isdefined( var_2._id_030D["division"]["init"]["MMR"] ) )
            continue;

        var_0[var_2._id_04A8]++;
        level.teammmr[var_2._id_04A8] += var_2._id_030D["division"]["init"]["MMR"];
    }

    if ( var_0["axis"] > 0 )
        level.teammmr["axis"] /= var_0["axis"];

    if ( var_0["allies"] > 0 )
        level.teammmr["allies"] /= var_0["allies"];
}

calculatematchprediction()
{
    if ( !isdefined( self._id_030D["division"]["init"]["MMR"] ) )
        return;

    var_0 = self._id_030D["division"]["init"]["MMR"];
    var_1 = var_0;
    self._id_030D["division"]["matchPrediction"] = "tie";

    if ( !isdefined( self._id_04A8 ) )
        return;
    else if ( self._id_04A8 == "axis" )
        var_1 = level.teammmr["allies"];
    else if ( self._id_04A8 == "allies" )
        var_1 = level.teammmr["axis"];
    else
        return;

    if ( var_0 < var_1 - 25 )
        self._id_030D["division"]["matchPrediction"] = "loss";

    if ( var_0 > var_1 + 25 )
        self._id_030D["division"]["matchPrediction"] = "win";
}

getdivisionpointsdelta( var_0, var_1 )
{
    var_2 = tablelookuprownum( "mp/divisiontable.csv", 0, var_0 );

    if ( var_1 == "win" )
        return int( tablelookupbyrow( "mp/divisiontable.csv", var_2, 1 ) );

    if ( var_1 == "loss" )
        return int( tablelookupbyrow( "mp/divisiontable.csv", var_2, 3 ) );

    return int( tablelookupbyrow( "mp/divisiontable.csv", var_2, 2 ) );
}

getdivisionresetoffset()
{
    return int( tablelookup( "mp/divisiontable.csv", 0, "resetOffset", 1 ) );
}

setplayermmr( var_0 )
{
    if ( !isdefined( self._id_030D["division"]["init"]["MMR"] ) )
        return;

    var_1 = self._id_030D["division"]["init"]["MMR"];

    if ( var_0 < 0 && var_1 < 0 - var_0 )
        var_0 = 0 - var_1;

    if ( 65535 - var_1 < var_0 )
        var_0 = 65535 - var_1;

    var_1 += var_0;
    self._id_030D["division"]["MMR"] = var_1;
    savemmr();
}

checkforfeit()
{
    var_0["allies"] = 0;
    var_0["axis"] = 0;

    foreach ( var_2 in level._id_0328 )
    {
        if ( isdefined( var_2._id_04A8 ) && isdefined( var_0[var_2._id_04A8] ) )
            var_0[var_2._id_04A8]++;
    }

    foreach ( var_2 in level._id_0328 )
    {
        if ( isdefined( var_2._id_04A8 ) )
        {
            if ( var_2._id_04A8 == "allies" && var_0["axis"] == 0 )
            {
                var_2._id_030D["division"]["wonByForfeit"] = 1;
                continue;
            }

            if ( var_2._id_04A8 == "axis" && var_0["allies"] == 0 )
            {
                var_2._id_030D["division"]["wonByForfeit"] = 1;
                continue;
            }

            var_2._id_030D["division"]["wonByForfeit"] = 0;
        }
    }
}
