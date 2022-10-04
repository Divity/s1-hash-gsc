// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7888( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        var_4 = [[ var_1 ]]( var_2, var_3 );
    else
        var_4 = [[ var_1 ]]( var_2 );

    var_4 = clamp( var_4, 0, 100 );
    var_4 *= var_0;
    var_2._id_2732[var_2._id_2732.size] = var_4;
    var_2._id_93F8 += 100 * var_0;
    return var_4;
}

_id_2470( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = [[ var_0 ]]( var_1, var_2 );
    else
        var_3 = [[ var_0 ]]( var_1 );

    var_3 = clamp( var_3, 0, 100 );
    var_1._id_2720[var_1._id_2720.size] = var_3;
    return var_3;
}

_id_11F5( var_0 )
{
    foreach ( var_2 in level._id_1B9C )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( distancesquared( var_0._id_02E6, var_2._id_02E6 ) < 22500 )
            return 0;
    }

    return 100;
}

_id_11FA( var_0 )
{
    foreach ( var_2 in level._id_5CA6 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( distancesquared( var_0._id_02E6, var_2._id_02E6 ) < 90000 )
            return 0;
    }

    return 100;
}

_id_11FB( var_0 )
{
    foreach ( var_2 in level._id_4404 )
    {
        if ( !isdefined( var_2 ) || !var_2 _id_50FF( self ) )
            continue;

        if ( distancesquared( var_0._id_02E6, var_2._id_02E6 ) < 122500 )
            return 0;
    }

    return 100;
}

_id_11FF( var_0 )
{
    var_1 = level._id_5C5A;

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) || !var_3 _id_50FF( self ) )
            continue;

        if ( distancesquared( var_0._id_02E6, var_3._id_02E6 ) < 122500 )
            return 0;
    }

    return 100;
}

_id_50FF( var_0 )
{
    if ( !level._id_91E4 || level._id_01A9 || !isdefined( var_0._id_04A8 ) )
        return 1;

    if ( !isdefined( self._id_02E9 ) || !isdefined( self._id_02E9._id_04A8 ) )
        return 1;

    if ( var_0 == self._id_02E9 )
        return 1;

    var_1 = self._id_02E9._id_04A8;
    return var_1 != var_0._id_04A8;
}

_id_11F4( var_0 )
{
    if ( !isdefined( level._id_0D33 ) )
        return 100;

    if ( !var_0._id_65CE )
        return 100;

    var_1 = _id_A7B8::_id_3EE4( var_0._id_02E6 );

    if ( var_1 > 0 )
        return 0;

    return 100;
}

_id_11F6( var_0 )
{
    var_1 = "all";

    if ( level._id_91E4 )
        var_1 = _id_A78A::_id_3F7F( self._id_04A8 );

    if ( var_0._id_222B[var_1] > 0 )
        return 0;

    return 100;
}

_id_11F9( var_0 )
{
    var_1 = "all";

    if ( level._id_91E4 )
        var_1 = _id_A78A::_id_3F7F( self._id_04A8 );

    if ( var_0._id_3AE0[var_1] > 0 )
        return 0;

    return 100;
}

_id_1203( var_0 )
{
    if ( isdefined( self._id_0AB1 ) )
        return 100;

    if ( getstarttime( var_0._id_02E6 ) )
    {
        foreach ( var_2 in var_0._id_0B03 )
        {
            if ( !getstarttime( var_2 ) )
                break;
        }

        return 0;
    }

    return 100;
}

_id_1201( var_0 )
{
    if ( isdefined( self._id_55DA ) && self._id_55DA == var_0 )
        return 0;

    return 100;
}

_id_1200( var_0 )
{
    if ( isdefined( var_0._id_55DC ) )
    {
        var_1 = gettime() - var_0._id_55DC;

        if ( var_1 > 4000 )
            return 100;

        return var_1 / 4000 * 100;
    }

    return 100;
}

_id_11F8( var_0 )
{
    if ( isdefined( var_0._id_55DB ) && ( !level._id_91E4 || var_0._id_55DB != self._id_04A8 ) )
    {
        var_1 = var_0._id_55DC + 500;

        if ( gettime() < var_1 )
            return 0;
    }

    return 100;
}

avoidspawninzone( var_0, var_1 )
{
    var_2 = distancesquared( var_1._id_02E6, var_0._id_02E6 );

    if ( var_2 < 692224 )
        return 0;

    return 100;
}

_id_11FE( var_0 )
{
    if ( !isdefined( self._id_5590 ) )
        return 100;

    var_1 = distancesquared( var_0._id_02E6, self._id_5590 );

    if ( var_1 > 4000000 )
        return 100;

    var_2 = var_1 / 4000000;
    return var_2 * 100;
}

_id_11FD( var_0 )
{
    if ( !isdefined( self._id_024A ) || !isdefined( self._id_024A._id_02E6 ) )
        return 100;

    if ( !_id_A75A::_id_5186( self._id_024A ) )
        return 100;

    var_1 = distancesquared( var_0._id_02E6, self._id_024A._id_02E6 );

    if ( var_1 > 4000000 )
        return 100;

    var_2 = var_1 / 4000000;
    return var_2 * 100;
}

_id_6EE9( var_0 )
{
    if ( var_0._id_93F7[self._id_04A8] == 0 )
        return 0;

    var_1 = var_0._id_2B82[self._id_04A8] / var_0._id_93F7[self._id_04A8];
    var_1 = min( var_1, 3240000 );
    var_2 = 1 - var_1 / 3240000;
    return var_2 * 100;
}

_id_11F7( var_0 )
{
    var_1 = "all";

    if ( level._id_91E4 )
        var_1 = _id_A78A::_id_3F7F( self._id_04A8 );

    if ( var_0._id_93F7[var_1] == 0 )
        return 100;

    setdvarifuninitialized( "scr_spawnfactor_maxenemydistance", 1800 );
    var_2 = getdvarint( "scr_spawnfactor_maxenemydistance" );
    var_2 *= var_2;
    var_3 = min( var_0._id_5C42[var_1], var_2 );
    var_4 = var_3 / var_2;
    return var_4 * 100;
}

avoidbadspawns( var_0 )
{
    if ( isdefined( self._id_89DE ) && isdefined( self._id_89DE._id_126D ) && self._id_89DE._id_126D )
    {
        if ( self._id_89DE._id_89F7 == var_0 )
            return 100;

        if ( isdefined( self._id_89DE.pastbadspawncount ) )
        {
            for ( var_1 = 0; var_1 < self._id_89DE.pastbadspawncount; var_1++ )
            {
                if ( self._id_89DE.pastbadspawns[var_1] == var_0 )
                    return 100;
            }
        }
    }

    return 0;
}

avoidflagbydistance( var_0 )
{
    if ( var_0.enemyflagdist > 0 )
        var_1 = var_0.friendlyflagdist / var_0.enemyflagdist / var_0.friendlyflag.highestspawndistratio * 1.33;
    else
        var_1 = 0;

    return var_1 * 100;
}

_id_6EEB( var_0, var_1 )
{
    if ( var_1[0] && var_0.preferreddompoint == 0 )
        return 100;

    if ( var_1[1] && var_0.preferreddompoint == 1 )
        return 100;

    if ( var_1[2] && var_0.preferreddompoint == 2 )
        return 100;

    return 0;
}

_id_6EEA( var_0, var_1 )
{
    if ( isdefined( var_0._id_91E3 ) && var_0._id_91E3 == var_1 )
        return 100;

    return 0;
}

_id_7129( var_0 )
{
    return randomintrange( 0, 99 );
}

avoidzone( var_0, var_1 )
{
    var_2 = distancesquared( var_1._id_02E6, var_0._id_02E6 );
    var_3 = var_2 - 692224;
    var_4 = 6067776;
    var_5 = 1867776;

    if ( var_3 >= var_5 )
        return 100 * ( 1.0 - 0.25 * ( var_3 - var_5 ) / ( var_4 - var_5 ) );
    else if ( var_3 > 0 )
        return 100.0 * var_3 / var_5;
    else
        return 0;
}

_id_6EED( var_0 )
{
    var_1 = self._id_04A8;
    var_2 = _id_A75A::_id_4065( var_1 );

    if ( var_0._id_606B[var_1] == 0 )
        return 0;

    if ( var_0._id_606B[var_2] == 0 )
        return 100;

    var_3 = var_0._id_606B[var_1] - var_0._id_606B[var_2];

    if ( var_3 <= 0 )
        return 0;

    if ( var_3 == 1 )
        return 50.0;

    if ( var_3 >= 2 )
        return 75.0;

    return 0;
}
