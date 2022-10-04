// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_5398["team_ammo_refill"] = ::_id_98C9;
}

_id_98C9( var_0, var_1 )
{
    var_2 = _id_4208();

    if ( var_2 )
        _id_A744::_id_5838( "team_ammo_refill", self._id_02E6 );

    return var_2;
}

_id_4208()
{
    if ( level._id_91E4 )
    {
        foreach ( var_1 in level._id_0328 )
        {
            if ( var_1._id_04A8 == self._id_04A8 )
                var_1 _id_72AB( 1 );
        }
    }
    else
        _id_72AB( 1 );

    level thread _id_A75A::_id_91F3( "used_team_ammo_refill", self );
    return 1;
}

_id_72AB( var_0 )
{
    var_1 = self _meth_830B();

    foreach ( var_3 in var_1 )
    {
        if ( issubstr( var_3, "grenade" ) || getsubstr( var_3, 0, 2 ) == "gl" )
        {
            if ( !var_0 || self _meth_817F( var_3 ) >= 1 )
                continue;
        }

        self _meth_8332( var_3 );
    }

    self _meth_82F4( "ammo_crate_use" );
}
