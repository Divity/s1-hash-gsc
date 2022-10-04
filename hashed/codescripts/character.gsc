// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7FAA( var_0 )
{
    self _meth_80B1( var_0[randomint( var_0.size )] );
}

_id_6EDE( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        precachemodel( var_0[var_1] );
}

_id_0DFD( var_0, var_1 )
{
    if ( !isdefined( level._id_1C8A ) )
        level._id_1C8A = [];

    if ( !isdefined( level._id_1C8A[var_0] ) )
        level._id_1C8A[var_0] = randomint( var_1.size );

    var_2 = ( level._id_1C8A[var_0] + 1 ) % var_1.size;

    if ( isdefined( self._id_796C ) )
        var_2 = self._id_796C % var_1.size;

    level._id_1C8A[var_0] = var_2;
    _id_7F82( var_1[var_2] );
}

_id_7F82( var_0 )
{
    if ( isdefined( self._id_477A ) )
        self _meth_802A( self._id_477A );

    self _meth_801D( var_0, "", 1 );
    self._id_477A = var_0;
}

_id_0DFC( var_0, var_1 )
{
    if ( !isdefined( level._id_1C89 ) )
        level._id_1C89 = [];

    if ( !isdefined( level._id_1C89[var_0] ) )
        level._id_1C89[var_0] = randomint( var_1.size );

    var_2 = ( level._id_1C89[var_0] + 1 ) % var_1.size;
    level._id_1C89[var_0] = var_2;
    self _meth_801D( var_1[var_2] );
    self._id_475A = var_1[var_2];
}

_id_6096()
{
    self _meth_802B();
    var_0 = self._id_0BD4;

    if ( !isdefined( var_0 ) )
        return;

    self._id_0BD4 = "none";
    self [[ anim._id_7064 ]]( var_0 );
}

_id_77FF()
{
    var_0["gunHand"] = self._id_0BD4;
    var_0["gunInHand"] = self._id_0BD5;
    var_0["model"] = self._id_02A0;
    var_0["hatModel"] = self._id_475A;

    if ( isdefined( self._id_02AB ) )
        var_0["name"] = self._id_02AB;
    else
    {

    }

    var_1 = self _meth_802C();

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_0["attach"][var_2]["model"] = self _meth_802D( var_2 );
        var_0["attach"][var_2]["tag"] = self _meth_802E( var_2 );
    }

    return var_0;
}

_id_57BA( var_0 )
{
    self _meth_802B();
    self._id_0BD4 = var_0["gunHand"];
    self._id_0BD5 = var_0["gunInHand"];
    self _meth_80B1( var_0["model"] );
    self._id_475A = var_0["hatModel"];

    if ( isdefined( var_0["name"] ) )
        self._id_02AB = var_0["name"];
    else
    {

    }

    var_1 = var_0["attach"];
    var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
        self _meth_801D( var_1[var_3]["model"], var_1[var_3]["tag"] );
}

_id_0331( var_0 )
{
    if ( isdefined( var_0["name"] ) )
    {

    }
    else
    {

    }

    precachemodel( var_0["model"] );
    var_1 = var_0["attach"];
    var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
        precachemodel( var_1[var_3]["model"] );
}

_id_3E41( var_0 )
{
    if ( isdefined( self._id_00AB ) )
        var_1 = strtok( self._id_00AB, "_" );
    else
        var_1 = [];

    if ( !_id_A4F0::_id_51AB() )
    {
        if ( isdefined( self._id_030D["modelIndex"] ) && self._id_030D["modelIndex"] < var_0 )
            return self._id_030D["modelIndex"];

        var_2 = randomint( var_0 );
        self._id_030D["modelIndex"] = var_2;
        return var_2;
    }
    else if ( var_1.size <= 2 )
        return randomint( var_0 );

    var_3 = "auto";
    var_2 = undefined;
    var_4 = var_1[2];

    if ( isdefined( self._id_796C ) )
        var_2 = self._id_796C;

    if ( isdefined( self._id_796B ) )
    {
        var_5 = "grouped";
        var_3 = "group_" + self._id_796B;
    }

    if ( !isdefined( level._id_1C8B ) )
        level._id_1C8B = [];

    if ( !isdefined( level._id_1C8B[var_4] ) )
        level._id_1C8B[var_4] = [];

    if ( !isdefined( level._id_1C8B[var_4][var_3] ) )
        _id_4DD5( var_4, var_3, var_0 );

    if ( !isdefined( var_2 ) )
    {
        var_2 = _id_3DB4( var_4, var_3 );

        if ( !isdefined( var_2 ) )
            var_2 = randomint( 5000 );
    }

    while ( var_2 >= var_0 )
        var_2 -= var_0;

    level._id_1C8B[var_4][var_3][var_2]++;
    return var_2;
}

_id_3DB4( var_0, var_1 )
{
    var_2 = [];
    var_3 = level._id_1C8B[var_0][var_1][0];
    var_2[0] = 0;

    for ( var_4 = 1; var_4 < level._id_1C8B[var_0][var_1].size; var_4++ )
    {
        if ( level._id_1C8B[var_0][var_1][var_4] > var_3 )
            continue;

        if ( level._id_1C8B[var_0][var_1][var_4] < var_3 )
        {
            var_2 = [];
            var_3 = level._id_1C8B[var_0][var_1][var_4];
        }

        var_2[var_2.size] = var_4;
    }

    return _id_710B( var_2 );
}

_id_4DD5( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < var_2; var_3++ )
        level._id_1C8B[var_0][var_1][var_3] = 0;
}

_id_3E49( var_0 )
{
    return randomint( var_0 );
}

_id_710B( var_0 )
{
    return var_0[randomint( var_0.size )];
}
