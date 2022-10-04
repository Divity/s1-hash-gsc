// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_67D7 = [];
    _id_A781::_id_0209();
    _id_A7A0::_id_0209();
    _id_A7A6::_id_0209();
    _id_A7AA::_id_0209();

    if ( getdvarint( "virtualLobbyActive", 0 ) > 0 )
        return;

    level thread _id_9AF2();
    level thread _id_9BC2();
}

_id_4D92()
{
    self._id_1838 = [];

    if ( _id_A75A::_id_7136() )
    {
        self._id_1838["totalShots"] = self _meth_8223( "totalShots" );
        self._id_1838["accuracy"] = self _meth_8223( "accuracy" );
        self._id_1838["misses"] = self _meth_8223( "misses" );
        self._id_1838["hits"] = self _meth_8223( "hits" );
        self._id_1838["timePlayedAllies"] = self _meth_8223( "timePlayedAllies" );
        self._id_1838["timePlayedOpfor"] = self _meth_8223( "timePlayedOpfor" );
        self._id_1838["timePlayedOther"] = self _meth_8223( "timePlayedOther" );
        self._id_1838["timePlayedTotal"] = self _meth_8223( "timePlayedTotal" );
    }

    self._id_1837 = [];
    self._id_1837["round"] = [];
    self._id_1837["round"]["timePlayed"] = self _meth_8226( "round", "timePlayed" );
}

_id_8D62( var_0 )
{
    return self _meth_8223( var_0 );
}

_id_8D72( var_0, var_1 )
{
    if ( !_id_A75A::_id_7136() || _id_A75A::_id_6E98() )
        return;

    self _meth_8244( var_0, var_1 );
}

_id_8D4A( var_0, var_1, var_2 )
{
    if ( !_id_A75A::_id_7136() || _id_A75A::_id_6E98() )
        return;

    if ( isdefined( var_2 ) )
    {
        var_3 = self _meth_8223( var_0, var_2 );
        self _meth_8244( var_0, var_2, var_1 + var_3 );
    }
    else
    {
        var_3 = self _meth_8223( var_0 );
        self _meth_8244( var_0, var_1 + var_3 );
    }
}

_id_8D64( var_0, var_1 )
{
    if ( var_0 == "round" )
        return self _meth_8226( var_0, var_1 );
    else
        return self _meth_8223( var_0, var_1 );
}

_id_8D74( var_0, var_1, var_2 )
{
    if ( isagent( self ) )
        return;

    if ( _id_A75A::_id_4FA3() )
        return;

    if ( var_0 == "round" )
        self _meth_8247( var_0, var_1, var_2 );
    else
    {
        if ( !_id_A75A::_id_7136() || _id_A75A::_id_6E98() )
            return;

        self _meth_8244( var_0, var_1, var_2 );
    }
}

_id_8D4D( var_0, var_1, var_2 )
{
    if ( !_id_A75A::_id_7136() || _id_A75A::_id_6E98() )
        return;

    var_3 = self _meth_8223( var_0, var_1 );
    self _meth_8244( var_0, var_1, var_3 + var_2 );
}

_id_8D65( var_0, var_1 )
{
    if ( !_id_A75A::_id_7136() )
        return 0;

    return self._id_1837[var_0][var_1];
}

_id_8D75( var_0, var_1, var_2 )
{
    if ( !_id_A75A::_id_7136() )
        return;

    self._id_1837[var_0][var_1] = var_2;
}

_id_8D4E( var_0, var_1, var_2 )
{
    if ( !_id_A75A::_id_7136() )
        return;

    var_3 = _id_8D65( var_0, var_1 );
    _id_8D75( var_0, var_1, var_3 + var_2 );
}

_id_8D4C( var_0, var_1, var_2 )
{
    if ( !_id_A75A::_id_7136() )
        return;

    var_3 = _id_8D63( var_0 ) + var_1;

    if ( var_3 > var_2 )
        var_3 = var_2;

    if ( var_3 < _id_8D63( var_0 ) )
        var_3 = var_2;

    _id_8D73( var_0, var_3 );
}

_id_8D4F( var_0, var_1, var_2, var_3 )
{
    if ( !_id_A75A::_id_7136() )
        return;

    var_4 = _id_8D65( var_0, var_1 ) + var_2;

    if ( var_4 > var_3 )
        var_4 = var_3;

    if ( var_4 < _id_8D65( var_0, var_1 ) )
        var_4 = var_3;

    _id_8D75( var_0, var_1, var_4 );
}

_id_8D63( var_0 )
{
    if ( !_id_A75A::_id_7136() )
        return 0;

    return self._id_1838[var_0];
}

_id_8D73( var_0, var_1 )
{
    if ( !_id_A75A::_id_7136() )
        return;

    self._id_1838[var_0] = var_1;
}

_id_8D4B( var_0, var_1 )
{
    if ( !_id_A75A::_id_7136() )
        return;

    var_2 = _id_8D63( var_0 );
    _id_8D73( var_0, var_2 + var_1 );
}

_id_9AF2()
{
    wait 0.15;
    var_0 = 0;

    while ( !level._id_3BD8 )
    {
        _id_A79A::_id_A0D4();
        var_0++;

        if ( var_0 >= level._id_0328.size )
            var_0 = 0;

        if ( isdefined( level._id_0328[var_0] ) )
        {
            level._id_0328[var_0] _id_A357();
            level._id_0328[var_0] _id_9B9C();
        }

        wait 2.0;
    }

    foreach ( var_2 in level._id_0328 )
    {
        var_2 _id_A357();
        var_2 _id_9B9C();
    }
}

_id_A357()
{
    var_0 = _id_A75A::_id_7136() && !_id_A75A::_id_6E98();

    if ( var_0 )
    {
        foreach ( var_3, var_2 in self._id_1838 )
            self _meth_8244( var_3, var_2 );
    }

    foreach ( var_3, var_2 in self._id_1837 )
    {
        foreach ( var_7, var_6 in var_2 )
        {
            if ( var_3 == "round" )
            {
                self _meth_8247( var_3, var_7, var_6 );
                continue;
            }

            if ( var_0 )
                self _meth_8244( var_3, var_7, var_6 );
        }
    }
}

_id_4C3D( var_0, var_1, var_2 )
{
    if ( _id_A75A::_id_513A( var_0 ) )
        return;

    if ( isdefined( level._id_2B2D ) && level._id_2B2D )
        return;

    if ( _id_A75A::_id_7136() && !_id_A75A::_id_6E98() )
    {
        var_3 = self _meth_8223( "weaponStats", var_0, var_1 );
        self _meth_8244( "weaponStats", var_0, var_1, var_3 + var_2 );
    }
}

_id_4C3A( var_0, var_1, var_2 )
{
    if ( _id_A75A::_id_7136() && !_id_A75A::_id_6E98() )
    {
        var_3 = self _meth_8223( "attachmentsStats", var_0, var_1 );
        self _meth_8244( "attachmentsStats", var_0, var_1, var_3 + var_2 );
    }
}

_id_9B9C()
{
    if ( !isdefined( self._id_94F4 ) )
        return;

    if ( self._id_94F4 == "" || self._id_94F4 == "none" )
        return;

    var_0 = self._id_94F4;

    if ( _id_A75A::_id_513A( var_0 ) || _id_A75A::_id_50FB( var_0 ) )
        return;

    var_1 = _id_A75A::_id_4169( var_0 );

    if ( var_1[0] == "iw5" )
        var_1[0] = var_1[0] + "_" + var_1[1];

    if ( var_1[0] == "alt" )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 == "gl" || var_3 == "gp25" || var_3 == "m320" )
            {
                var_1[0] = "gl";
                break;
            }

            if ( var_3 == "shotgun" )
            {
                var_1[0] = "shotgun";
                break;
            }
        }

        if ( var_1[0] == "alt" )
            var_1[0] = var_1[1] + "_" + var_1[2];
    }

    if ( var_1[0] == "gl" || var_1[0] == "shotgun" )
    {
        if ( self._id_94F5 > 0 )
            _id_4C3A( var_1[0], "shots", self._id_94F5 );

        if ( self._id_94F3 > 0 )
            _id_4C3A( var_1[0], "kills", self._id_94F3 );

        if ( self._id_94F2 > 0 )
            _id_4C3A( var_1[0], "hits", self._id_94F2 );

        if ( self._id_94F0 > 0 )
            _id_4C3A( var_1[0], "headShots", self._id_94F0 );

        if ( self._id_94EF > 0 )
            _id_4C3A( var_1[0], "deaths", self._id_94EF );

        if ( self._id_94F1 > 0 )
            _id_4C3A( var_1[0], "hipfirekills", self._id_94F1 );

        if ( self._id_94F6 > 0 )
            _id_4C3A( var_1[0], "timeInUse", self._id_94F6 );

        self._id_94F4 = "none";
        self._id_94F5 = 0;
        self._id_94F3 = 0;
        self._id_94F2 = 0;
        self._id_94F0 = 0;
        self._id_94EF = 0;
        self._id_94F1 = 0;
        self._id_94F6 = 0;
        return;
    }

    if ( !_id_A75A::_id_50CE( var_1[0] ) && !_id_A75A::_id_50CF( var_1[0] ) )
        return;

    if ( self._id_94F5 > 0 )
    {
        _id_4C3D( var_1[0], "shots", self._id_94F5 );
        _id_A744::_id_5849( var_1[0], "shots", self._id_94F5 );
    }

    if ( self._id_94F3 > 0 )
    {
        _id_4C3D( var_1[0], "kills", self._id_94F3 );
        _id_A744::_id_5849( var_1[0], "kills", self._id_94F3 );
    }

    if ( self._id_94F2 > 0 )
    {
        _id_4C3D( var_1[0], "hits", self._id_94F2 );
        _id_A744::_id_5849( var_1[0], "hits", self._id_94F2 );
    }

    if ( self._id_94F0 > 0 )
    {
        _id_4C3D( var_1[0], "headShots", self._id_94F0 );
        _id_A744::_id_5849( var_1[0], "headShots", self._id_94F0 );
    }

    if ( self._id_94EF > 0 )
    {
        _id_4C3D( var_1[0], "deaths", self._id_94EF );
        _id_A744::_id_5849( var_1[0], "deaths", self._id_94EF );
    }

    if ( self._id_94F1 > 0 )
    {
        _id_4C3D( var_1[0], "hipfirekills", self._id_94F1 );
        _id_A744::_id_5849( var_1[0], "hipfirekills", self._id_94F1 );
    }

    if ( self._id_94F6 > 0 )
    {
        _id_4C3D( var_1[0], "timeInUse", self._id_94F6 );
        _id_A744::_id_5849( var_1[0], "timeInUse", self._id_94F6 );
    }

    var_5 = getweaponattachments( var_0 );

    foreach ( var_7 in var_5 )
    {
        var_8 = _id_A75A::_id_0E02( var_7 );

        if ( var_8 == "gl" || var_8 == "shotgun" )
            continue;

        if ( self._id_94F5 > 0 )
        {
            if ( var_8 != "tactical" )
                _id_4C3A( var_8, "shots", self._id_94F5 );
        }

        if ( self._id_94F3 > 0 )
        {
            if ( var_8 != "tactical" )
                _id_4C3A( var_8, "kills", self._id_94F3 );
        }

        if ( self._id_94F2 > 0 )
        {
            if ( var_8 != "tactical" )
                _id_4C3A( var_8, "hits", self._id_94F2 );
        }

        if ( self._id_94F0 > 0 )
        {
            if ( var_8 != "tactical" )
                _id_4C3A( var_8, "headShots", self._id_94F0 );
        }

        if ( self._id_94F1 > 0 )
        {
            if ( var_8 != "tactical" )
                _id_4C3A( var_8, "hipfirekills", self._id_94F1 );
        }

        if ( self._id_94F6 > 0 )
        {
            if ( var_8 != "tactical" )
                _id_4C3A( var_8, "timeInUse", self._id_94F6 );
        }

        if ( self._id_94EF > 0 )
            _id_4C3A( var_8, "deaths", self._id_94EF );
    }

    self._id_94F4 = "none";
    self._id_94F5 = 0;
    self._id_94F3 = 0;
    self._id_94F2 = 0;
    self._id_94F0 = 0;
    self._id_94EF = 0;
    self._id_94F1 = 0;
    self._id_94F6 = 0;
}

_id_9BC2()
{
    level waittill( "game_ended" );

    if ( !_id_A75A::_id_59E0() )
        return;

    var_0 = 0;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;

    foreach ( var_7 in level._id_0328 )
        var_5 += var_7._id_936B["total"];

    incrementcounter( "global_minutes", int( var_5 / 60 ) );

    if ( !_id_A75A::_id_A1C1() )
        return;

    wait 0.05;

    foreach ( var_7 in level._id_0328 )
    {
        var_0 += var_7._id_023C;
        var_1 += var_7._id_010E;
        var_2 += var_7._id_004F;
        var_3 += var_7._id_01E6;
        var_4 += var_7._id_8FA9;
    }

    incrementcounter( "global_kills", var_0 );
    incrementcounter( "global_deaths", var_1 );
    incrementcounter( "global_assists", var_2 );
    incrementcounter( "global_headshots", var_3 );
    incrementcounter( "global_suicides", var_4 );
    incrementcounter( "global_games", 1 );
}
