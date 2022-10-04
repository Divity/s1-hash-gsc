// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    precacheshader( "objpoint_default" );
    level._id_6312 = [];
    level._id_6313 = [];

    if ( level._id_8A76 )
        level._id_6315 = 15;
    else
        level._id_6315 = 8;

    level._id_6311 = 0.7;
    level._id_6314 = 1.0;
}

_id_2443( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_405C( var_0 );

    if ( isdefined( var_6 ) )
        _id_2858( var_6 );

    if ( !isdefined( var_3 ) )
        var_3 = "objpoint_default";

    if ( !isdefined( var_5 ) )
        var_5 = 1.0;

    if ( var_2 == "all" )
        var_6 = newhudelem();
    else if ( var_2 == "mlg" )
        var_6 = newteamhudelem( "spectator" );
    else
        var_6 = newteamhudelem( var_2 );

    var_6._id_02AB = var_0;
    var_6._id_0530 = var_1[0];
    var_6._id_0538 = var_1[1];
    var_6._id_053B = var_1[2];
    var_6._id_04A8 = var_2;
    var_6._id_5106 = 0;
    var_6._id_51A2 = 1;
    var_6 _meth_80CC( var_3, level._id_6315, level._id_6315 );
    var_6 _meth_80D8( 1, 0 );

    if ( isdefined( var_4 ) )
        var_6._id_0037 = var_4;
    else
        var_6._id_0037 = level._id_6311;

    var_6._id_1301 = var_6._id_0037;
    var_6._id_0205 = level._id_6312.size;
    level._id_6313[var_0] = var_6;
    level._id_6312[level._id_6312.size] = var_0;
    return var_6;
}

_id_2858( var_0 )
{
    if ( level._id_6313.size == 1 )
    {
        level._id_6313 = [];
        level._id_6312 = [];
        var_0 _meth_8088();
        return;
    }

    var_1 = var_0._id_0205;
    var_2 = level._id_6312.size - 1;
    var_3 = _id_405B( var_2 );
    level._id_6312[var_1] = var_3._id_02AB;
    var_3._id_0205 = var_1;
    level._id_6312[var_2] = undefined;
    level._id_6313[var_0._id_02AB] = undefined;
    var_0 _meth_8088();
}

_id_9B3C( var_0 )
{
    if ( self._id_0530 != var_0[0] )
        self._id_0530 = var_0[0];

    if ( self._id_0538 != var_0[1] )
        self._id_0538 = var_0[1];

    if ( self._id_053B != var_0[2] )
        self._id_053B = var_0[2];
}

_id_7FCE( var_0, var_1 )
{
    var_2 = _id_405C( var_0 );
    var_2 _id_9B3C( var_1 );
}

_id_405C( var_0 )
{
    if ( isdefined( level._id_6313[var_0] ) )
        return level._id_6313[var_0];
    else
        return undefined;
}

_id_405B( var_0 )
{
    if ( isdefined( level._id_6312[var_0] ) )
        return level._id_6313[level._id_6312[var_0]];
    else
        return undefined;
}

_id_8D12()
{
    self endon( "stop_flashing_thread" );

    if ( self._id_5106 )
        return;

    self._id_5106 = 1;

    while ( self._id_5106 )
    {
        self _meth_8084( 0.75 );
        self._id_0037 = 0.35 * self._id_1301;
        wait 0.75;
        self _meth_8084( 0.75 );
        self._id_0037 = self._id_1301;
        wait 0.75;
    }

    self._id_0037 = self._id_1301;
}

_id_8EE0()
{
    if ( !self._id_5106 )
        return;

    self._id_5106 = 0;
}
