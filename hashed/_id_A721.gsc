// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( !isdefined( level._id_0BEC ) )
        level._id_0BEC = [];

    var_0 = getarraykeys( level._id_0BEC );

    foreach ( var_2 in var_0 )
    {
        var_3 = getarraykeys( level._id_0BEC[var_2] );

        foreach ( var_5 in var_3 )
            map_restart( level._id_0BEC[var_2][var_5] );
    }

    waitframe;
    level._id_4C74 = [];
    var_8 = getentarray( "animated_model", "targetname" );
    _id_A4F0::_id_0D13( var_8, ::_id_0C64 );
    level._id_4C74 = undefined;
}

_id_0C64()
{
    if ( isdefined( self._id_0046 ) )
        var_0 = self._id_0046;
    else
    {
        var_1 = getarraykeys( level._id_0BEC[self._id_02A0] );
        var_2 = var_1[randomint( var_1.size )];
        var_0 = level._id_0BEC[self._id_02A0][var_2];
    }

    self _meth_8279( var_0 );
    self _meth_80E1();
}
