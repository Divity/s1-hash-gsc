// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6FFA()
{
    foreach ( var_1 in level._id_685E["all"] )
        var_1 _id_7FE2();

    if ( level._id_5FE9 )
    {
        _id_1886( "multiteam" );

        foreach ( var_1 in level._id_0328 )
            var_1 _meth_8247( "round", "scoreboardType", "multiteam" );

        setclientmatchdata( "alliesScore", -1 );
        setclientmatchdata( "axisScore", -1 );
    }
    else if ( level._id_91E4 )
    {
        var_5 = setclientnamemode( "allies" );
        var_6 = setclientnamemode( "axis" );

        if ( var_5 == var_6 )
            var_7 = "tied";
        else if ( var_5 > var_6 )
            var_7 = "allies";
        else
            var_7 = "axis";

        setclientmatchdata( "alliesScore", var_5 );
        setclientmatchdata( "axisScore", var_6 );

        if ( var_7 == "tied" )
        {
            _id_1886( "allies" );
            _id_1886( "axis" );

            foreach ( var_1 in level._id_0328 )
            {
                var_9 = var_1._id_030D["team"];

                if ( !isdefined( var_9 ) )
                    continue;

                if ( var_9 == "spectator" )
                {
                    var_1 _meth_8247( "round", "scoreboardType", "allies" );
                    continue;
                }

                var_1 _meth_8247( "round", "scoreboardType", var_9 );
            }
        }
        else
        {
            _id_1886( var_7 );

            foreach ( var_1 in level._id_0328 )
                var_1 _meth_8247( "round", "scoreboardType", var_7 );
        }
    }
    else
    {
        _id_1886( "neutral" );

        foreach ( var_1 in level._id_0328 )
            var_1 _meth_8247( "round", "scoreboardType", "neutral" );

        setclientmatchdata( "alliesScore", -1 );
        setclientmatchdata( "axisScore", -1 );
    }

    foreach ( var_1 in level._id_0328 )
    {
        var_16 = 0;

        if ( !var_1 _id_A75A::_id_7136() || _id_A75A::_id_6E98() )
            var_16 = var_1._id_030D["summary"]["xp"];
        else
            var_16 = var_1 _meth_8507() - var_1._id_030D["summary"]["matchStartXp"];

        var_1 _meth_8247( "round", "totalXp", var_16 );
        var_1 _meth_8247( "round", "scoreXp", var_1._id_030D["summary"]["score"] );
        var_1 _meth_8247( "round", "challengeXp", var_1._id_030D["summary"]["challenge"] );
        var_1 _meth_8247( "round", "matchXp", var_1._id_030D["summary"]["match"] );
        var_1 _meth_8247( "round", "miscXp", var_1._id_030D["summary"]["misc"] );
        var_1 _meth_8247( "round", "entitlementXp", var_1._id_030D["summary"]["entitlementXP"] );
        var_1 _meth_8247( "round", "clanWarsXp", var_1._id_030D["summary"]["clanWarsXP"] );
    }
}

_id_7FE2()
{
    var_0 = getclientmatchdata( "scoreboardPlayerCount" );

    if ( var_0 <= 24 )
    {
        setclientmatchdata( "players", self._id_1F10, "score", self._id_030D["score"] );
        var_1 = self._id_030D["kills"];
        setclientmatchdata( "players", self._id_1F10, "kills", var_1 );

        if ( level._id_01B5 == "ctf" || level._id_01B5 == "sr" || level._id_01B5 == "gun" )
            var_2 = self._id_004F;
        else
            var_2 = self._id_030D["assists"];

        setclientmatchdata( "players", self._id_1F10, "assists", var_2 );
        var_3 = self._id_030D["deaths"];
        setclientmatchdata( "players", self._id_1F10, "deaths", var_3 );
        var_4 = self._id_030D["headshots"];
        setclientmatchdata( "players", self._id_1F10, "headshots", var_4 );
        var_5 = self._id_030D["team"];
        setclientmatchdata( "players", self._id_1F10, "team", var_5 );
        var_6 = game[self._id_030D["team"]];
        setclientmatchdata( "players", self._id_1F10, "faction", var_6 );
        var_7 = self._id_030D["extrascore0"];
        setclientmatchdata( "players", self._id_1F10, "extrascore0", var_7 );
        var_8 = self._id_030D["extrascore1"];
        setclientmatchdata( "players", self._id_1F10, "extrascore1", var_8 );
        var_9 = 0;

        if ( isdefined( self._id_030D["division"] ) && isdefined( self._id_030D["division"]["index"] ) )
            var_9 = self._id_030D["division"]["index"];

        setclientmatchdata( "players", self._id_1F10, "division", var_9 );
        var_0++;
        setclientmatchdata( "scoreboardPlayerCount", var_0 );
    }
    else
    {

    }
}

_id_1886( var_0 )
{
    if ( var_0 == "multiteam" )
    {
        var_1 = 0;

        foreach ( var_3 in level._id_91F0 )
        {
            foreach ( var_5 in level._id_685E[var_3] )
            {
                setclientmatchdata( "scoreboards", "multiteam", var_1, var_5._id_1F10 );
                var_1++;
            }
        }
    }
    else if ( var_0 == "neutral" )
    {
        var_1 = 0;

        foreach ( var_5 in level._id_685E["all"] )
        {
            setclientmatchdata( "scoreboards", var_0, var_1, var_5._id_1F10 );
            var_1++;
        }
    }
    else
    {
        var_10 = _id_A75A::_id_4065( var_0 );
        var_1 = 0;

        foreach ( var_5 in level._id_685E[var_0] )
        {
            setclientmatchdata( "scoreboards", var_0, var_1, var_5._id_1F10 );
            var_1++;
        }

        foreach ( var_5 in level._id_685E[var_10] )
        {
            setclientmatchdata( "scoreboards", var_0, var_1, var_5._id_1F10 );
            var_1++;
        }
    }
}
