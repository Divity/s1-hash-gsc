// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6166( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_3AE2 ) )
        return;

    if ( !isdefined( level._id_3AE2[var_0] ) )
        return;

    if ( !isdefined( var_1 ) )
    {
        call [[ level._id_3AE2[var_0] ]]();
        return;
    }

    if ( !isdefined( var_2 ) )
    {
        call [[ level._id_3AE2[var_0] ]]( var_1 );
        return;
    }

    if ( !isdefined( var_3 ) )
    {
        call [[ level._id_3AE2[var_0] ]]( var_1, var_2 );
        return;
    }

    if ( !isdefined( var_4 ) )
    {
        call [[ level._id_3AE2[var_0] ]]( var_1, var_2, var_3 );
        return;
    }

    call [[ level._id_3AE2[var_0] ]]( var_1, var_2, var_3, var_4 );
}

_id_7C6D( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_3AE2[var_0] ) )
        return;

    if ( !isdefined( var_1 ) )
    {
        self call [[ level._id_3AE2[var_0] ]]();
        return;
    }

    if ( !isdefined( var_2 ) )
    {
        self call [[ level._id_3AE2[var_0] ]]( var_1 );
        return;
    }

    if ( !isdefined( var_3 ) )
    {
        self call [[ level._id_3AE2[var_0] ]]( var_1, var_2 );
        return;
    }

    if ( !isdefined( var_4 ) )
    {
        self call [[ level._id_3AE2[var_0] ]]( var_1, var_2, var_3 );
        return;
    }

    self call [[ level._id_3AE2[var_0] ]]( var_1, var_2, var_3, var_4 );
}

_id_712A( var_0 )
{
    return ( randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5 );
}

_id_712C( var_0, var_1 )
{
    var_2 = randomfloatrange( var_0, var_1 );

    if ( randomint( 2 ) == 0 )
        var_2 *= -1;

    var_3 = randomfloatrange( var_0, var_1 );

    if ( randomint( 2 ) == 0 )
        var_3 *= -1;

    var_4 = randomfloatrange( var_0, var_1 );

    if ( randomint( 2 ) == 0 )
        var_4 *= -1;

    return ( var_2, var_3, var_4 );
}

_id_712B( var_0, var_1 )
{
    var_2 = randomfloat( var_1 );
    var_3 = randomfloat( 360 );
    var_4 = sin( var_2 );
    var_5 = cos( var_2 );
    var_6 = sin( var_3 );
    var_7 = cos( var_3 );
    var_8 = ( var_5, var_7 * var_4, var_6 * var_4 );
    return rotatevector( var_8, vectortoangles( var_0 ) );
}

_id_8567( var_0 )
{
    if ( var_0 >= 0 )
        return 1;

    return -1;
}

_id_028B( var_0, var_1 )
{
    var_2 = int( var_0 / var_1 );

    if ( var_0 * var_1 < 0 )
        var_2 -= 1;

    return var_0 - var_2 * var_1;
}

_id_93EB( var_0 )
{
    return "" + var_0;
}

_id_9497( var_0 )
{
    if ( isdefined( self._id_24FD ) )
    {
        if ( var_0 == self._id_24FD )
            return;
    }

    self._id_24FD = var_0;
}

_id_3D4D( var_0 )
{
    var_1 = [];
    var_1["axis"] = "allies";
    var_1["allies"] = "axis";
    return var_1[var_0];
}

_id_1EB7( var_0 )
{
    self._id_33E3[var_0] = anim._id_2795;
}

_id_7E16( var_0, var_1 )
{
    self._id_33E3[var_0] = var_1;
}

_id_7DB1( var_0 )
{
    var_1 = getarraykeys( self._id_33E3 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        self._id_33E3[var_1[var_2]] = var_0;
}

_id_2006()
{
    return randomint( 100 ) >= 50;
}

_id_1D3F( var_0, var_1 )
{
    var_2 = randomint( var_1[var_1.size - 1] + 1 );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_2 <= var_1[var_3] )
            return var_0[var_3];
    }
}

_id_3D1C( var_0 )
{
    var_1 = [];
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_2 += var_0[var_3];
        var_1[var_3] = var_2;
    }

    return var_1;
}

_id_A0B0( var_0, var_1 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    var_1 endon( "die" );
    self waittill( var_0 );
    var_1 notify( "returned", var_0 );
}

_id_A0B2( var_0, var_1 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    var_1 endon( "die" );
    self waittill( var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    var_12 = [];
    var_12[0] = var_0;

    if ( isdefined( var_2 ) )
        var_12[1] = var_2;

    if ( isdefined( var_3 ) )
        var_12[2] = var_3;

    if ( isdefined( var_4 ) )
        var_12[3] = var_4;

    if ( isdefined( var_5 ) )
        var_12[4] = var_5;

    if ( isdefined( var_6 ) )
        var_12[5] = var_6;

    if ( isdefined( var_7 ) )
        var_12[6] = var_7;

    if ( isdefined( var_8 ) )
        var_12[7] = var_8;

    if ( isdefined( var_9 ) )
        var_12[8] = var_9;

    if ( isdefined( var_10 ) )
        var_12[9] = var_10;

    if ( isdefined( var_11 ) )
        var_12[10] = var_11;

    var_1 notify( "returned", var_12 );
}

_id_A0B1( var_0, var_1 )
{
    var_1 endon( "die" );
    self waittill( var_0 );
    var_1 notify( "returned", var_0 );
}

_id_A091( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    var_5 = spawnstruct();
    var_5._id_930F = 0;

    if ( isdefined( var_0 ) )
    {
        childthread _id_A0B0( var_0, var_5 );
        var_5._id_930F++;
    }

    if ( isdefined( var_1 ) )
    {
        childthread _id_A0B0( var_1, var_5 );
        var_5._id_930F++;
    }

    if ( isdefined( var_2 ) )
    {
        childthread _id_A0B0( var_2, var_5 );
        var_5._id_930F++;
    }

    if ( isdefined( var_3 ) )
    {
        childthread _id_A0B0( var_3, var_5 );
        var_5._id_930F++;
    }

    if ( isdefined( var_4 ) )
    {
        childthread _id_A0B0( var_4, var_5 );
        var_5._id_930F++;
    }

    while ( var_5._id_930F )
    {
        var_5 waittill( "returned" );
        var_5._id_930F--;
    }

    var_5 notify( "die" );
}

_id_A092( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );
    var_8 = spawnstruct();
    var_8._id_930F = 0;

    if ( isdefined( var_0 ) )
    {
        var_0 childthread _id_A0B0( var_1, var_8 );
        var_8._id_930F++;
    }

    if ( isdefined( var_2 ) )
    {
        var_2 childthread _id_A0B0( var_3, var_8 );
        var_8._id_930F++;
    }

    if ( isdefined( var_4 ) )
    {
        var_4 childthread _id_A0B0( var_5, var_8 );
        var_8._id_930F++;
    }

    if ( isdefined( var_6 ) )
    {
        var_6 childthread _id_A0B0( var_7, var_8 );
        var_8._id_930F++;
    }

    while ( var_8._id_930F )
    {
        var_8 waittill( "returned" );
        var_8._id_930F--;
    }

    var_8 notify( "die" );
}

_id_A067( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( ( !isdefined( var_0 ) || var_0 != "death" ) && ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) )
        self endon( "death" );

    var_7 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_A0B0( var_0, var_7 );

    if ( isdefined( var_1 ) )
        childthread _id_A0B0( var_1, var_7 );

    if ( isdefined( var_2 ) )
        childthread _id_A0B0( var_2, var_7 );

    if ( isdefined( var_3 ) )
        childthread _id_A0B0( var_3, var_7 );

    if ( isdefined( var_4 ) )
        childthread _id_A0B0( var_4, var_7 );

    if ( isdefined( var_5 ) )
        childthread _id_A0B0( var_5, var_7 );

    if ( isdefined( var_6 ) )
        childthread _id_A0B0( var_6, var_7 );

    var_7 waittill( "returned", var_8 );
    var_7 notify( "die" );
    return var_8;
}

_id_A069( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( ( !isdefined( var_0 ) || var_0 != "death" ) && ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) && ( !isdefined( var_7 ) || var_7 != "death" ) )
        self endon( "death" );

    var_8 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_A0B2( var_0, var_8 );

    if ( isdefined( var_1 ) )
        childthread _id_A0B2( var_1, var_8 );

    if ( isdefined( var_2 ) )
        childthread _id_A0B2( var_2, var_8 );

    if ( isdefined( var_3 ) )
        childthread _id_A0B2( var_3, var_8 );

    if ( isdefined( var_4 ) )
        childthread _id_A0B2( var_4, var_8 );

    if ( isdefined( var_5 ) )
        childthread _id_A0B2( var_5, var_8 );

    if ( isdefined( var_6 ) )
        childthread _id_A0B2( var_6, var_8 );

    if ( isdefined( var_7 ) )
        childthread _id_A0B2( var_7, var_8 );

    var_8 waittill( "returned", var_9 );
    var_8 notify( "die" );
    return var_9;
}

_id_A068( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_A0B1( var_0, var_6 );

    if ( isdefined( var_1 ) )
        childthread _id_A0B1( var_1, var_6 );

    if ( isdefined( var_2 ) )
        childthread _id_A0B1( var_2, var_6 );

    if ( isdefined( var_3 ) )
        childthread _id_A0B1( var_3, var_6 );

    if ( isdefined( var_4 ) )
        childthread _id_A0B1( var_4, var_6 );

    if ( isdefined( var_5 ) )
        childthread _id_A0B1( var_5, var_6 );

    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_A064( var_0 )
{
    var_1 = spawnstruct();
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        childthread _id_A0B0( var_4, var_1 );

        if ( var_4 == "death" )
            var_2 = 1;
    }

    if ( !var_2 )
        self endon( "death" );

    var_1 waittill( "returned", var_6 );
    var_1 notify( "die" );
    return var_6;
}

_id_A065( var_0 )
{
    var_1 = spawnstruct();

    foreach ( var_3 in var_0 )
        childthread _id_A0B1( var_3, var_1 );

    var_1 waittill( "returned", var_5 );
    var_1 notify( "die" );
    return var_5;
}

_id_A062( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_3 = 0;

    foreach ( var_5 in var_0 )
    {
        childthread _id_A0B0( var_5, var_2 );

        if ( var_5 == "death" )
            var_3 = 1;
    }

    if ( !var_3 )
        self endon( "death" );

    var_2 childthread _id_0676( var_1 );
    var_2 waittill( "returned", var_7 );
    var_2 notify( "die" );
    return var_7;
}

_id_A063( var_0, var_1 )
{
    var_2 = spawnstruct();

    foreach ( var_4 in var_0 )
        childthread _id_A0B1( var_4, var_2 );

    var_2 thread _id_0676( var_1 );
    var_2 waittill( "returned", var_6 );
    var_2 notify( "die" );
    return var_6;
}

_id_A06A( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) )
        self endon( "death" );

    var_7 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread _id_A0B0( var_1, var_7 );

    if ( isdefined( var_2 ) )
        childthread _id_A0B0( var_2, var_7 );

    if ( isdefined( var_3 ) )
        childthread _id_A0B0( var_3, var_7 );

    if ( isdefined( var_4 ) )
        childthread _id_A0B0( var_4, var_7 );

    if ( isdefined( var_5 ) )
        childthread _id_A0B0( var_5, var_7 );

    if ( isdefined( var_6 ) )
        childthread _id_A0B0( var_6, var_7 );

    var_7 childthread _id_0676( var_0 );
    var_7 waittill( "returned", var_8 );
    var_7 notify( "die" );
    return var_8;
}

_id_0676( var_0 )
{
    self endon( "die" );
    wait(var_0);
    self notify( "returned", "timeout" );
}

_id_A06B( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread _id_A0B1( var_1, var_6 );

    if ( isdefined( var_2 ) )
        childthread _id_A0B1( var_2, var_6 );

    if ( isdefined( var_3 ) )
        childthread _id_A0B1( var_3, var_6 );

    if ( isdefined( var_4 ) )
        childthread _id_A0B1( var_4, var_6 );

    if ( isdefined( var_5 ) )
        childthread _id_A0B1( var_5, var_6 );

    var_6 childthread _id_0676( var_0 );
    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_A060( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( var_1 ) )
        self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    if ( isdefined( var_4 ) )
        self endon( var_4 );

    if ( isdefined( var_5 ) )
        self endon( var_5 );

    if ( isdefined( var_6 ) )
        self endon( var_6 );

    if ( isdefined( var_7 ) )
        self endon( var_7 );

    self waittill( var_0 );
}

_id_A061( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    if ( isdefined( var_2 ) && isdefined( var_3 ) )
        var_2 endon( var_3 );

    if ( isdefined( var_4 ) && isdefined( var_5 ) )
        var_4 endon( var_5 );

    if ( isdefined( var_6 ) && isdefined( var_7 ) )
        var_6 endon( var_7 );

    if ( isdefined( var_8 ) && isdefined( var_9 ) )
        var_8 endon( var_9 );

    if ( isdefined( var_10 ) && isdefined( var_11 ) )
        var_10 endon( var_11 );

    if ( isdefined( var_12 ) && isdefined( var_13 ) )
        var_12 endon( var_13 );

    var_0 waittill( var_1 );
}

_id_5105()
{
    var_0 = gettime();

    if ( isdefined( self._id_38AF ) && var_0 < self._id_38AF )
        return 1;

    if ( isdefined( self._id_20DF ) && var_0 < self._id_20DF )
        return 1;

    return 0;
}

_id_3837( var_0 )
{
    return isdefined( level._id_382C[var_0] );
}

_id_382C( var_0 )
{
    return level._id_382C[var_0];
}

_id_4CED()
{
    level._id_382C = [];
    level._id_386A = [];
    level._id_3C9B = 0;

    if ( !isdefined( level._id_88AC ) )
        level._id_88AC = ::_id_3092;

    level._id_3844 = spawnstruct();
    level._id_3844 _id_0D6F();
}

_id_383B( var_0 )
{
    if ( !isdefined( level._id_382C ) )
        _id_4CED();

    level._id_382C[var_0] = 0;

    if ( !isdefined( level._id_978D ) )
    {
        _id_4D6A();
        level._id_978D[var_0] = [];
    }
    else if ( !isdefined( level._id_978D[var_0] ) )
        level._id_978D[var_0] = [];

    if ( _id_51BE( var_0, "aa_" ) )
        thread [[ level._id_88AC ]]( var_0 );
}

_id_3092( var_0 )
{

}

_id_51BE( var_0, var_1 )
{
    if ( var_1.size > var_0.size )
        return 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0[var_2] != var_1[var_2] )
            return 0;
    }

    return 1;
}

_id_383D( var_0, var_1 )
{
    level._id_382C[var_0] = 1;
    _id_7ED7( var_0 );

    if ( isdefined( var_1 ) )
        level notify( var_0, var_1 );
    else
        level notify( var_0 );
}

_id_0D6F()
{
    self._id_9A21 = "generic" + level._id_3C9B;
    level._id_3C9B++;
}

_id_3848( var_0 )
{
    var_1 = undefined;

    while ( !_id_382C( var_0 ) )
    {
        var_1 = undefined;
        level waittill( var_0, var_1 );
    }

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_382F( var_0 )
{
    if ( !_id_382C( var_0 ) )
        return;

    level._id_382C[var_0] = 0;
    _id_7ED7( var_0 );
    level notify( var_0 );
}

_id_3855( var_0 )
{
    while ( _id_382C( var_0 ) )
        level waittill( var_0 );
}

_id_A07E( var_0, var_1 )
{
    self endon( var_0 );
    self waittill( var_1 );
}

_id_0D13( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_2 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]();
    }
    else
    {
        if ( !isdefined( var_3 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2 );

            return;
        }

        if ( !isdefined( var_4 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3 );

            return;
        }

        if ( !isdefined( var_5 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4 );

            return;
        }

        if ( !isdefined( var_6 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5 );

            return;
        }

        if ( !isdefined( var_7 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6 );

            return;
        }

        if ( !isdefined( var_8 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );

            return;
        }

        if ( !isdefined( var_9 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

            return;
        }

        if ( !isdefined( var_10 ) )
        {
            foreach ( var_12 in var_0 )
                var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

            return;
        }

        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    }
}

_id_0CDB( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            var_6 call [[ var_1 ]]( var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            var_6 call [[ var_1 ]]( var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            var_6 call [[ var_1 ]]( var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        var_6 call [[ var_1 ]]();
}

_id_6163( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        call [[ var_1 ]]( var_6 );
}

_id_0D16( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_0D13( var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_0D17( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    _id_0D13( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_97C6( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2 = getentarray( var_0, var_1 );
        _id_0D13( var_2, ::_id_97C7 );
    }
    else
        _id_97C7();
}

_id_97C7()
{
    if ( isdefined( self._id_71E6 ) )
        self._id_02E6 = self._id_71E6;

    self._id_97C4 = undefined;
}

_id_97C4( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2 = getentarray( var_0, var_1 );
        _id_0D13( var_2, ::_id_97C5 );
    }
    else
        _id_97C5();
}

_id_97C5()
{
    if ( !isdefined( self._id_71E6 ) )
        self._id_71E6 = self._id_02E6;

    if ( self._id_02E6 == self._id_71E6 )
        self._id_02E6 += ( 0, 0, -10000 );

    self._id_97C4 = 1;
}

_id_7ED7( var_0 )
{
    if ( !isdefined( level._id_978D ) )
        return;

    level._id_978D[var_0] = _id_0D01( level._id_978D[var_0] );
    _id_0D13( level._id_978D[var_0], ::_id_9AE0 );
}

_id_9AE0()
{
    var_0 = 1;

    if ( isdefined( self._id_79D4 ) )
    {
        var_0 = 0;
        var_1 = _id_23B2( self._id_79D4 );

        foreach ( var_3 in var_1 )
        {
            if ( _id_382C( var_3 ) )
            {
                var_0 = 1;
                break;
            }
        }
    }

    var_5 = 1;

    if ( isdefined( self._id_79D1 ) )
    {
        var_1 = _id_23B2( self._id_79D1 );

        foreach ( var_3 in var_1 )
        {
            if ( _id_382C( var_3 ) )
            {
                var_5 = 0;
                break;
            }
        }
    }

    [[ level._id_9797[var_0 && var_5] ]]();
}

_id_23B2( var_0 )
{
    var_1 = strtok( var_0, " " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( level._id_382C[var_1[var_2]] ) )
            _id_383B( var_1[var_2] );
    }

    return var_1;
}

_id_4D6A()
{
    level._id_978D = [];
    level._id_9797[1] = ::_id_97C6;
    level._id_9797[0] = ::_id_97C4;
}

_id_40F9( var_0, var_1 )
{
    var_2 = level._id_8F5E[var_1][var_0];

    if ( !isdefined( var_2 ) )
        return undefined;

    if ( var_2.size > 1 )
        return undefined;

    return var_2[0];
}

_id_40FB( var_0, var_1 )
{
    var_2 = level._id_8F5E[var_1][var_0];

    if ( !isdefined( var_2 ) )
        return [];

    return var_2;
}

_id_8F5D()
{
    level._id_8F5E = [];
    level._id_8F5E["target"] = [];
    level._id_8F5E["targetname"] = [];
    level._id_8F5E["script_noteworthy"] = [];
    level._id_8F5E["script_linkname"] = [];

    foreach ( var_1 in level.struct )
        _id_079F( var_1 );
}

_id_079F( var_0 )
{
    if ( isdefined( var_0._id_04A7 ) )
    {
        if ( !isdefined( level._id_8F5E["targetname"][var_0._id_04A7] ) )
            level._id_8F5E["targetname"][var_0._id_04A7] = [];

        var_1 = level._id_8F5E["targetname"][var_0._id_04A7].size;
        level._id_8F5E["targetname"][var_0._id_04A7][var_1] = var_0;
    }

    if ( isdefined( var_0._id_04A5 ) )
    {
        if ( !isdefined( level._id_8F5E["target"][var_0._id_04A5] ) )
            level._id_8F5E["target"][var_0._id_04A5] = [];

        var_1 = level._id_8F5E["target"][var_0._id_04A5].size;
        level._id_8F5E["target"][var_0._id_04A5][var_1] = var_0;
    }

    if ( isdefined( var_0._id_039B ) )
    {
        if ( !isdefined( level._id_8F5E["script_noteworthy"][var_0._id_039B] ) )
            level._id_8F5E["script_noteworthy"][var_0._id_039B] = [];

        var_1 = level._id_8F5E["script_noteworthy"][var_0._id_039B].size;
        level._id_8F5E["script_noteworthy"][var_0._id_039B][var_1] = var_0;
    }

    if ( isdefined( var_0._id_0399 ) )
    {
        if ( !isdefined( level._id_8F5E["script_linkname"][var_0._id_0399] ) )
            level._id_8F5E["script_linkname"][var_0._id_0399] = [];

        var_1 = level._id_8F5E["script_linkname"][var_0._id_0399].size;
        level._id_8F5E["script_linkname"][var_0._id_0399][0] = var_0;
    }
}

_id_36BE( var_0 )
{

}

_id_36BC()
{

}

_id_36BA( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;
}

_id_36BB( var_0, var_1 )
{

}

_id_36B9()
{

}

_id_36B8()
{

}

_id_36BD( var_0 )
{

}

_id_0CF6( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( var_4 != var_1 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_0CF7( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
        var_0 = _id_0CF6( var_0, var_3 );

    return var_0;
}

_id_0D01( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_0CF9( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = 1;

        foreach ( var_6 in var_1 )
        {
            if ( var_3 == var_6 )
            {
                var_4 = 0;
                break;
            }
        }

        if ( var_4 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_0CF0( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        thread [[ var_1 ]]( var_6 );
}

_id_0CEF( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        call [[ var_1 ]]( var_6 );
}

_id_07A5( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( !isdefined( var_0 ) )
        var_0[0] = var_1;
    else
        var_0[var_0.size] = var_1;

    return var_0;
}

_id_382D( var_0 )
{

}

_id_3850( var_0, var_1 )
{
    for (;;)
    {
        if ( _id_382C( var_0 ) )
            return;

        if ( _id_382C( var_1 ) )
            return;

        level _id_A07E( var_0, var_1 );
    }
}

_id_3851( var_0, var_1 )
{
    for (;;)
    {
        if ( _id_382C( var_0 ) )
            return var_0;

        if ( _id_382C( var_1 ) )
            return var_1;

        var_2 = level _id_A067( var_0, var_1 );
        return var_2;
    }
}

_id_3857( var_0, var_1 )
{
    for (;;)
    {
        if ( !_id_382C( var_0 ) )
            return var_0;

        if ( !_id_382C( var_1 ) )
            return var_1;

        level _id_A07E( var_0, var_1 );
    }
}

_id_3858( var_0, var_1 )
{
    return _id_3857( var_0, var_1 );
}

_id_384A( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = [];

    if ( isdefined( var_5 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
        var_6[var_6.size] = var_4;
        var_6[var_6.size] = var_5;
    }
    else if ( isdefined( var_4 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
        var_6[var_6.size] = var_4;
    }
    else if ( isdefined( var_3 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
    }
    else if ( isdefined( var_2 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
    }
    else if ( isdefined( var_1 ) )
    {
        _id_3850( var_0, var_1 );
        return;
    }
    else
        return;

    for (;;)
    {
        for ( var_7 = 0; var_7 < var_6.size; var_7++ )
        {
            if ( _id_382C( var_6[var_7] ) )
                return;
        }

        level _id_A060( var_0, var_1, var_2, var_3, var_4, var_5 );
    }
}

_id_384C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];

    if ( isdefined( var_4 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
        var_5[var_5.size] = var_3;
        var_5[var_5.size] = var_4;
    }
    else if ( isdefined( var_3 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
        var_5[var_5.size] = var_3;
    }
    else if ( isdefined( var_2 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
    }
    else if ( isdefined( var_1 ) )
    {
        var_6 = _id_3851( var_0, var_1 );
        return var_6;
    }
    else
        return;

    for (;;)
    {
        for ( var_7 = 0; var_7 < var_5.size; var_7++ )
        {
            if ( _id_382C( var_5[var_7] ) )
                return var_5[var_7];
        }

        var_6 = level _id_A067( var_0, var_1, var_2, var_3, var_4 );
        return var_6;
    }
}

_id_3849( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) )
        _id_3848( var_0 );

    if ( isdefined( var_1 ) )
        _id_3848( var_1 );

    if ( isdefined( var_2 ) )
        _id_3848( var_2 );

    if ( isdefined( var_3 ) )
        _id_3848( var_3 );
}

_id_3854( var_0, var_1 )
{
    var_2 = var_1 * 1000;
    var_3 = gettime();

    for (;;)
    {
        if ( _id_382C( var_0 ) )
            break;

        if ( gettime() >= var_3 + var_2 )
            break;

        var_4 = var_2 - ( gettime() - var_3 );
        var_5 = var_4 / 1000;
        _id_9F97( var_0, var_5 );
    }
}

_id_3859( var_0, var_1 )
{
    var_2 = gettime();

    for (;;)
    {
        if ( !_id_382C( var_0 ) )
            break;

        if ( gettime() >= var_2 + var_1 * 1000 )
            break;

        _id_9F97( var_0, var_1 );
    }
}

_id_9F97( var_0, var_1 )
{
    level endon( var_0 );
    wait(var_1);
}

_id_27CC( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    thread _id_27CD( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_27CD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( _id_51AB() )
    {
        self endon( "death" );
        self endon( "stop_delay_call" );
    }

    wait(var_1);

    if ( isdefined( var_10 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    else if ( isdefined( var_9 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    else if ( isdefined( var_8 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_7 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        self call [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        self call [[ var_0 ]]( var_2 );
    else
        self call [[ var_0 ]]();
}

_id_27C7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    thread _id_27C8( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
}

_id_27C8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    wait(var_1);

    if ( isdefined( var_10 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    else if ( isdefined( var_9 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    else if ( isdefined( var_8 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_7 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        self [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        self [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        self [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        self [[ var_0 ]]( var_2 );
    else
        self [[ var_0 ]]();
}

_id_6164( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread _id_6165( var_1, var_0, var_2, var_3, var_4, var_5 );
}

_id_6165( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    wait(var_1);

    if ( isdefined( var_5 ) )
        call [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        call [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        call [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        call [[ var_0 ]]( var_2 );
    else
        call [[ var_0 ]]();
}

_id_51AB()
{
    if ( !isdefined( level._id_51AB ) )
        level._id_51AB = !_id_8F51( getdvar( "mapname" ), "mp_" );

    return level._id_51AB;
}

_id_51AC()
{
    if ( !isdefined( level._id_51AC ) )
        level._id_51AC = _id_8F51( getdvar( "mapname" ), "so_td_" );

    return level._id_51AC;
}

_id_8F51( var_0, var_1 )
{
    if ( var_0.size < var_1.size )
        return 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( tolower( var_0[var_2] ) != tolower( var_1[var_2] ) )
            return 0;
    }

    return 1;
}

_id_8F4F( var_0, var_1 )
{
    if ( var_0.size < var_1.size )
        return -1;

    if ( var_1.size == 0 )
        return 0;

    var_2 = 0;

    for ( var_3 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( tolower( var_0[var_2] ) == tolower( var_1[var_3] ) )
            var_3++;
        else
        {
            var_3 = 0;

            if ( tolower( var_0[var_2] ) == tolower( var_1[var_3] ) )
                var_3++;
            else if ( var_2 > var_0.size - var_1.size )
                return -1;
        }

        if ( var_3 >= var_1.size )
            return var_2 - var_3 + 1;
    }

    return -1;
}

_id_6DEE( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_0[0];

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = 0.05;

    for ( var_6 = 1; var_6 < var_0.size; var_6++ )
    {
        thread _id_2DB7( var_5, var_0[var_6], var_1, var_2, var_3, var_4 );
        var_5 = var_0[var_6];
    }
}

_id_2DB7( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_5 = gettime() + var_5 * 1000;

    while ( gettime() < var_5 )
        wait 0.05;
}

_id_9094( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
        var_2[var_5] = var_4;

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = var_4;

    return var_2;
}

_id_0CDD( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4 ) )
            var_2[var_2.size] = var_4;
    }

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4 ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_0CE1( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
        var_2[var_5] = var_4;

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = var_4;

    return var_2;
}

_id_0CF5( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = randomint( var_0.size );
        var_3 = var_0[var_1];
        var_0[var_1] = var_0[var_2];
        var_0[var_2] = var_3;
    }

    return var_0;
}

_id_0CDA( var_0, var_1 )
{
    var_0[var_0.size] = var_1;
    return var_0;
}

_id_0CE9( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        var_1 = var_3;
        break;
    }

    return var_1;
}

_id_0CED( var_0, var_1, var_2 )
{
    if ( var_2 == var_0.size )
    {
        var_3 = var_0;
        var_3[var_3.size] = var_1;
        return var_3;
    }

    var_3 = [];
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        if ( var_5 == var_2 )
        {
            var_3[var_5] = var_1;
            var_4 = 1;
        }

        var_3[var_5 + var_4] = var_0[var_5];
    }

    return var_3;
}

_id_0CE4( var_0, var_1 )
{
    if ( var_0.size <= 0 )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

_id_0CE8( var_0, var_1 )
{
    foreach ( var_4, var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return var_4;
    }

    return undefined;
}

_id_38C6( var_0 )
{
    var_1 = ( 0, var_0[1], 0 );
    return var_1;
}

_id_38C7( var_0 )
{
    var_1 = ( var_0[0], var_0[1], 0 );
    return var_1;
}

_id_2D9F( var_0, var_1, var_2, var_3 )
{
    level endon( "newpath" );
    var_4 = [];
    var_5 = vectortoangles( var_0 - var_1 );
    var_6 = anglestoright( var_5 );
    var_7 = anglestoforward( var_5 );
    var_8 = anglestoup( var_5 );
    var_9 = distance( var_0, var_1 );
    var_10 = [];
    var_11 = 0.1;
    var_10[0] = var_0;
    var_10[1] = var_0 + var_6 * ( var_9 * var_11 ) + var_7 * ( var_9 * -0.1 );
    var_10[2] = var_1;
    var_10[3] = var_0 + var_6 * ( var_9 * ( -1 * var_11 ) ) + var_7 * ( var_9 * -0.1 );
    var_10[4] = var_0;
    var_10[5] = var_0 + var_8 * ( var_9 * var_11 ) + var_7 * ( var_9 * -0.1 );
    var_10[6] = var_1;
    var_10[7] = var_0 + var_8 * ( var_9 * ( -1 * var_11 ) ) + var_7 * ( var_9 * -0.1 );
    var_10[8] = var_0;
    var_12 = var_2[0];
    var_13 = var_2[1];
    var_14 = var_2[2];
    _id_6DEE( var_10, var_12, var_13, var_14, var_3 );
}

_id_3DBB()
{
    var_0 = [];

    if ( isdefined( self._id_7A21 ) )
    {
        var_1 = _id_3DC1();

        foreach ( var_3 in var_1 )
        {
            var_4 = getentarray( var_3, "script_linkname" );

            if ( var_4.size > 0 )
                var_0 = _id_0CDD( var_0, var_4 );
        }
    }

    return var_0;
}

_id_3DC0()
{
    var_0 = [];

    if ( isdefined( self._id_7A21 ) )
    {
        var_1 = _id_3DC1();

        foreach ( var_3 in var_1 )
        {
            var_4 = getvehiclenodearray( var_3, "script_linkname" );

            if ( var_4.size > 0 )
                var_0 = _id_0CDD( var_0, var_4 );
        }
    }

    return var_0;
}

_id_3DBA()
{
    var_0 = _id_3DBB();
    return var_0[0];
}

_id_3DBF()
{
    var_0 = _id_3DC0();
    return var_0[0];
}

_id_3DC1()
{
    return strtok( self._id_7A21, " " );
}

_id_76B8( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = getentarray( var_0, "targetname" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = _id_40FB( var_0, "targetname" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = call [[ level._id_4045 ]]( var_0, "targetname" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = getvehiclenodearray( var_0, "targetname" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
}

_id_76B6( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = getentarray( var_0, "script_noteworthy" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = _id_40FB( var_0, "script_noteworthy" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = call [[ level._id_4045 ]]( var_0, "script_noteworthy" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
    var_5 = getvehiclenodearray( var_0, "script_noteworthy" );
    _id_0D13( var_5, var_1, var_2, var_3, var_4 );
}

_id_2D9E( var_0, var_1, var_2 )
{
    level endon( "newpath" );
    var_3 = [];
    var_4 = vectortoangles( var_0 - var_1 );
    var_5 = anglestoright( var_4 );
    var_6 = anglestoforward( var_4 );
    var_7 = distance( var_0, var_1 );
    var_8 = [];
    var_9 = 0.05;
    var_8[0] = var_0;
    var_8[1] = var_0 + var_5 * ( var_7 * var_9 ) + var_6 * ( var_7 * -0.2 );
    var_8[2] = var_1;
    var_8[3] = var_0 + var_5 * ( var_7 * ( -1 * var_9 ) ) + var_6 * ( var_7 * -0.2 );

    for ( var_10 = 0; var_10 < 4; var_10++ )
    {
        var_11 = var_10 + 1;

        if ( var_11 >= 4 )
            var_11 = 0;
    }
}

_id_2DB3( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 1, 0 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0.05;

    if ( var_3 )
        var_5 = int( var_4 / 0.05 );
    else
        var_5 = int( var_1 / 0.05 );

    var_6 = [];
    var_7 = [];
    var_8 = gettime();

    for ( var_9 = var_8 + var_1 * 1000; var_8 < var_9 && isdefined( var_0 ); var_8 = gettime() )
    {
        var_6[0] = var_0 _meth_8216( 1, 1, 1 );
        var_6[1] = var_0 _meth_8216( 1, 1, -1 );
        var_6[2] = var_0 _meth_8216( -1, 1, -1 );
        var_6[3] = var_0 _meth_8216( -1, 1, 1 );
        var_7[0] = var_0 _meth_8216( 1, -1, 1 );
        var_7[1] = var_0 _meth_8216( 1, -1, -1 );
        var_7[2] = var_0 _meth_8216( -1, -1, -1 );
        var_7[3] = var_0 _meth_8216( -1, -1, 1 );

        for ( var_10 = 0; var_10 < 4; var_10++ )
        {
            var_11 = var_10 + 1;

            if ( var_11 == 4 )
                var_11 = 0;
        }

        if ( !var_3 )
            return;

        wait(var_4);
    }
}

_id_2DCD( var_0, var_1, var_2, var_3, var_4 )
{
    _id_2DB3( var_0, var_1, var_2, var_3, var_4 );
}

_id_2DCB( var_0, var_1, var_2, var_3, var_4 )
{
    _id_2DB3( var_0, var_1, var_2, var_3, var_4 );
}

_id_3FA6( var_0 )
{
    return level._id_058F[var_0];
}

_id_3BA3( var_0 )
{
    return isdefined( level._id_058F[var_0] );
}

_id_6F91( var_0, var_1 )
{
    var_2 = var_1 + "," + var_0;

    if ( isdefined( level._id_24A7[var_2] ) )
        return;

    level._id_24A7[var_2] = 1;
}

_id_36B4( var_0 )
{

}

_id_3FFB()
{
    return self._id_7811;
}

_id_6D73()
{

}

_id_51DE()
{
    return !self._id_2B09;
}

_id_0586()
{
    if ( !isdefined( self._id_2B09 ) )
        self._id_2B09 = 0;

    self._id_2B09++;
    self _meth_832A();
}

_id_0594()
{
    if ( !isdefined( self._id_2B09 ) )
        self._id_2B09 = 0;
    else if ( self._id_2B09 > 0 )
    {
        self._id_2B09--;

        if ( self._id_2B09 == 0 )
            self _meth_832B();
    }
}

_id_7463()
{
    self._id_2B09 = 0;
    self _meth_832B();
}

_id_0587()
{
    if ( !isdefined( self._id_2B0A ) )
        self._id_2B0A = 0;

    self._id_2B0A++;
    self _meth_831D();
}

_id_0595()
{
    if ( !isdefined( self._id_2B0A ) )
        self._id_2B0A = 0;

    self._id_2B0A--;

    if ( !self._id_2B0A )
        self _meth_831E();
}

_id_5204()
{
    return !self._id_2B0A;
}

_id_0588()
{
    if ( !isdefined( self._id_2B0B ) )
        self._id_2B0B = 0;

    self._id_2B0B++;
    self _meth_8321();
}

_id_0596()
{
    if ( !isdefined( self._id_2B0B ) )
        self._id_2B0B = 0;

    self._id_2B0B--;

    if ( !self._id_2B0B )
    {
        if ( isdefined( level._id_49E1 ) && level._id_49E1 == 1 )
            return;
        else
            self _meth_8322();
    }
}

_id_5206()
{
    return !self._id_2B0B;
}

_id_0585()
{
    if ( !isdefined( self._id_2B04 ) )
        self._id_2B04 = 0;

    self._id_2B04++;
    self _meth_831F();
}

_id_0593()
{
    if ( !isdefined( self._id_2B04 ) )
        self._id_2B04 = 0;

    self._id_2B04--;

    if ( !self._id_2B04 )
        self _meth_8320();
}

_id_5160()
{
    return !self._id_2B04;
}

_id_0591( var_0, var_1 )
{
    if ( !self _meth_8314( var_0 ) )
        return;

    if ( self _meth_84C4( var_0 ) == var_1 )
        return;

    self _meth_84C3( var_0, var_1 );

    if ( var_1 )
        self notify( "WeaponDetonateEnabled", var_0 );
    else
        self notify( "WeaponDetonateDisabled", var_0 );
}

_id_710B( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_1.size] = var_3;

    if ( !var_1.size )
        return undefined;

    return var_1[randomint( var_1.size )];
}

_id_7119( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_1.size] = var_3;

    if ( !var_1.size )
        return undefined;

    var_5 = randomint( var_1.size * var_1.size );
    return var_1[var_1.size - 1 - int( sqrt( var_5 ) )];
}

_id_8953()
{
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 _meth_80B1( "tag_origin" );
    var_0 _meth_8054();

    if ( isdefined( self._id_02E6 ) )
        var_0._id_02E6 = self._id_02E6;

    if ( isdefined( self._id_0041 ) )
        var_0._id_0041 = self._id_0041;

    return var_0;
}

_id_A097( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
}

_id_A099( var_0, var_1 )
{
    self endon( var_0 );
    wait(var_1);
    return "timeout";
}

_id_36B7()
{
    level._id_36BF = 0;
    level._id_36B5 = 1;
    _id_36B5( "GAMEPRINTSTARTFILE:" );
}

_id_36B5( var_0 )
{
    level._id_36BF++;

    if ( level._id_36BF > 200 )
    {
        wait 0.05;
        level._id_36BF = 0;
    }
}

_id_36B6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
        _id_36B5( "GAMEPRINTENDFILE:GAMEPRINTP4ENABLED:" + var_0 );
    else
        _id_36B5( "GAMEPRINTENDFILE:" + var_0 );

    var_2 = gettime() + 4000;

    while ( getdvarint( "LAUNCHER_PRINT_SUCCESS" ) == 0 && getdvar( "LAUNCHER_PRINT_FAIL" ) == "0" && gettime() < var_2 )
        wait 0.05;

    if ( !( gettime() < var_2 ) )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( TIMEOUT ): launcherconflict? restart launcher and try again? " );
        level._id_36B5 = undefined;
        return 0;
    }

    var_3 = getdvar( "LAUNCHER_PRINT_FAIL" );

    if ( var_3 != "0" )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( " + var_3 + " ): launcherconflict? restart launcher and try again? " );
        level._id_36B5 = undefined;
        return 0;
    }

    level._id_36B5 = undefined;
    return 1;
}

_id_5628( var_0 )
{
    level._id_36BF = 0;
    _id_36B5( "LAUNCHER_CLIP:" + var_0 );
}

_id_50EF()
{
    if ( !isdefined( self ) )
        return 0;

    return isdefined( self._id_0118 );
}

_id_671C()
{
    common_scripts\_createfx::_id_8E88();
}

_id_06FD()
{
    _id_A4ED::_id_06FE();
}

_id_3E87( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self._id_04A5;

    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;

    if ( _id_51AB() )
    {
        var_1 = call [[ level._id_404A ]]( var_0, "targetname" );

        if ( isdefined( var_1 ) )
            return var_1;
    }

    var_1 = _id_40F9( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;

    var_1 = getvehiclenode( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_3DF1( var_0 )
{
    var_1 = getent( var_0, "script_noteworthy" );

    if ( isdefined( var_1 ) )
        return var_1;

    if ( _id_51AB() )
    {
        var_1 = call [[ level._id_404A ]]( var_0, "script_noteworthy" );

        if ( isdefined( var_1 ) )
            return var_1;
    }

    var_1 = _id_40F9( var_0, "script_noteworthy" );

    if ( isdefined( var_1 ) )
        return var_1;

    var_1 = getvehiclenode( var_0, "script_noteworthy" );

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_2BBC( var_0, var_1 )
{
    var_2 = level._id_300F[var_0];
    earthquake( var_2["magnitude"], var_2["duration"], var_1, var_2["radius"] );
}

_id_6977( var_0, var_1 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_2 = spawn( "script_origin", ( 0, 0, 0 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self._id_02E6;

    var_2._id_02E6 = var_1;
    var_2 _meth_8075( var_0 );
    return var_2;
}

_id_69C0( var_0, var_1, var_2, var_3 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_4 = spawn( "script_origin", ( 0, 0, 1 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self._id_02E6;

    var_4._id_02E6 = var_1;
    var_4._id_0041 = var_2;

    if ( _id_51AB() )
    {
        if ( isdefined( var_3 ) && var_3 )
            var_4 _meth_8074( var_0, "sounddone" );
        else
            var_4 _meth_809A( var_0, "sounddone" );

        var_4 waittill( "sounddone" );
    }
    else if ( isdefined( var_3 ) && var_3 )
        var_4 _meth_8074( var_0 );
    else
        var_4 _meth_809A( var_0 );

    var_4 delete();
}

_id_69BF( var_0, var_1, var_2 )
{
    _id_69C0( var_0, var_1, ( 0, 0, 0 ), var_2 );
}

_id_586E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !soundexists( var_0 ) )
        return;

    if ( isdefined( var_3 ) )
        var_2 = undefined;

    if ( isdefined( var_2 ) && var_2 && ( !isdefined( level._id_380C ) || level._id_380C == 1 ) )
        spawnloopingsound( var_0, var_1, ( 0, 0, 0 ) );
    else
    {
        var_5 = spawn( "script_origin", ( 0, 0, 0 ) );

        if ( isdefined( var_3 ) )
        {
            thread _id_5874( var_3, var_5 );
            self endon( var_3 );
        }

        var_5._id_02E6 = var_1;
        var_5 _meth_8075( var_0 );
        var_5 _meth_80E1();
    }
}

_id_5871( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !soundexists( var_0 ) )
        return;

    if ( isdefined( var_3 ) && var_3 )
    {
        if ( !isdefined( level._id_380C ) || level._id_380C == 1 )
            spawnloopingsound( var_0, var_1, var_2 );
    }
    else
    {
        if ( isdefined( level._id_2409 ) && level._id_2409 && isdefined( var_5._id_588E ) )
            var_7 = var_5._id_588E;
        else
            var_7 = spawn( "script_origin", ( 0, 0, 0 ) );

        if ( isdefined( var_4 ) )
        {
            thread _id_5874( var_4, var_7 );
            self endon( var_4 );
        }

        var_7._id_02E6 = var_1;
        var_7._id_0041 = var_2;
        var_7 _meth_8075( var_0 );

        if ( isdefined( level._id_2409 ) && level._id_2409 )
            var_5._id_588E = var_7;
        else
            var_7 _meth_80E1();
    }
}

_id_586F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _id_5870( var_0, var_1, ( 0, 0, 0 ), var_2, var_3, var_4, var_5 );
}

_id_5870( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = spawn( "script_origin", ( 0, 0, 0 ) );

    if ( isdefined( var_3 ) )
    {
        thread _id_5874( var_3, var_7 );
        self endon( var_3 );
    }

    var_7._id_02E6 = var_1;
    var_7._id_0041 = var_2;

    if ( var_5 >= var_6 )
    {
        for (;;)
            wait 0.05;
    }

    if ( !soundexists( var_0 ) )
    {
        for (;;)
            wait 0.05;
    }

    for (;;)
    {
        wait(randomfloatrange( var_5, var_6 ));
        _id_57FB( "createfx_looper" );
        thread _id_69C0( var_0, var_7._id_02E6, var_7._id_0041, undefined );
        _id_9A3D( "createfx_looper" );
    }
}

_id_5874( var_0, var_1 )
{
    var_1 endon( "death" );
    self waittill( var_0 );
    var_1 delete();
}

_id_2428( var_0 )
{
    var_1 = common_scripts\_createfx::_id_23FB( "loopfx", var_0 );
    var_1._id_9C3A["delay"] = common_scripts\_createfx::_id_400D();
    return var_1;
}

_id_242E( var_0 )
{
    var_1 = common_scripts\_createfx::_id_23FB( "oneshotfx", var_0 );
    var_1._id_9C3A["delay"] = common_scripts\_createfx::_id_405F();
    return var_1;
}

_id_23FE( var_0 )
{
    var_1 = common_scripts\_createfx::_id_23FB( "exploder", var_0 );
    var_1._id_9C3A["delay"] = common_scripts\_createfx::_id_3F8B();
    var_1._id_9C3A["exploder_type"] = "normal";
    return var_1;
}

_id_0AF9( var_0 )
{
    if ( var_0.size <= 1 )
        return var_0;

    var_1 = 0;

    for ( var_2 = var_0.size - 1; var_2 >= 1; var_2-- )
    {
        var_3 = var_0[var_2];
        var_4 = var_2;

        for ( var_5 = 0; var_5 < var_2; var_5++ )
        {
            var_6 = var_0[var_5];

            if ( stricmp( var_6, var_3 ) > 0 )
            {
                var_3 = var_6;
                var_4 = var_5;
            }
        }

        if ( var_4 != var_2 )
        {
            var_0[var_4] = var_0[var_2];
            var_0[var_2] = var_3;
        }
    }

    return var_0;
}

_id_5044( var_0, var_1 )
{
    return stricmp( var_0, var_1 ) > 0;
}

_id_6972( var_0, var_1 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_2 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_2 endon( "death" );
    thread _id_2824( var_2 );

    if ( isdefined( var_1 ) )
    {
        var_2._id_02E6 = self._id_02E6 + var_1;
        var_2._id_0041 = self._id_0041;
        var_2 _meth_8446( self );
    }
    else
    {
        var_2._id_02E6 = self._id_02E6;
        var_2._id_0041 = self._id_0041;
        var_2 _meth_8446( self );
    }

    var_2 _meth_8075( var_0 );
    self waittill( "stop sound" + var_0 );
    var_2 _meth_80AB( var_0 );
    var_2 delete();
}

_id_8E9B( var_0 )
{
    self notify( "stop sound" + var_0 );
}

_id_2824( var_0 )
{
    var_0 endon( "death" );
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_334D( var_0 )
{
    waittillframeend;
}

_id_23AE( var_0, var_1 )
{
    setdvarifuninitialized( var_0, var_1 );
}

_id_9F2D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{

}

_id_90C1( var_0, var_1 )
{
    var_2 = self _meth_8180( var_0 );
    var_3 = self _meth_8181( var_0 );
    var_4 = anglestoforward( var_3 );
    var_4 = vectornormalize( var_4 ) * var_1;
    return var_2 + var_4;
}

_id_928D( var_0, var_1, var_2 )
{
    if ( var_0 )
        return var_1;

    return var_2;
}

_id_23C8( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( level._id_57FB ) )
        level._id_57FB = [];

    var_2 = spawnstruct();
    var_2._id_59F8 = var_1;
    var_2._id_00D9 = 0;
    level._id_57FB[var_0] = var_2;
}

_id_57FC( var_0 )
{
    if ( !isdefined( level._id_57FB ) )
        return 0;

    return isdefined( level._id_57FB[var_0] );
}

_id_57FB( var_0 )
{
    var_1 = level._id_57FB[var_0];

    while ( var_1._id_00D9 >= var_1._id_59F8 )
        var_1 waittill( "unlocked" );

    var_1._id_00D9++;
}

_id_504A( var_0 )
{
    var_1 = level._id_57FB[var_0];
    return var_1._id_00D9 > var_1._id_59F8;
}

_id_9A42( var_0 )
{
    thread _id_9A40( var_0 );
    wait 0.05;
}

_id_9A3D( var_0 )
{
    thread _id_9A40( var_0 );
}

_id_9A40( var_0 )
{
    wait 0.05;
    var_1 = level._id_57FB[var_0];
    var_1._id_00D9--;
    var_1 notify( "unlocked" );
}

_id_3E92()
{
    var_0 = level._id_0391;

    if ( isdefined( level._id_9275 ) )
        var_0 = level._id_9275;

    return var_0;
}

_id_0D02( var_0 )
{
    var_1 = [];

    for ( var_2 = var_0.size - 1; var_2 >= 0; var_2-- )
        var_1[var_1.size] = var_0[var_2];

    return var_1;
}

_id_2B72( var_0, var_1 )
{
    return length2dsquared( var_0 - var_1 );
}

_id_3CCA( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3CC9( var_0, var_1, var_2, var_3, var_4, var_5 );
    var_6 = _id_0D02( var_6 );
    return var_6;
}

_id_3CC9( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_3 ) )
        var_3 = var_1.size;

    if ( !isdefined( var_2 ) )
        var_2 = [];

    var_6 = undefined;

    if ( isdefined( var_4 ) )
        var_6 = var_4 * var_4;

    var_7 = 0;

    if ( isdefined( var_5 ) )
        var_7 = var_5 * var_5;

    if ( var_2.size == 0 && var_3 >= var_1.size && var_7 == 0 && !isdefined( var_6 ) )
        return sortbydistance( var_1, var_0 );

    var_8 = [];

    foreach ( var_10 in var_1 )
    {
        var_11 = 0;

        foreach ( var_13 in var_2 )
        {
            if ( var_10 == var_13 )
            {
                var_11 = 1;
                break;
            }
        }

        if ( var_11 )
            continue;

        var_15 = distancesquared( var_0, var_10._id_02E6 );

        if ( isdefined( var_6 ) && var_15 > var_6 )
            continue;

        if ( var_15 < var_7 )
            continue;

        var_8[var_8.size] = var_10;
    }

    var_8 = sortbydistance( var_8, var_0 );

    if ( var_3 >= var_8.size )
        return var_8;

    var_17 = [];

    for ( var_18 = 0; var_18 < var_3; var_18++ )
        var_17[var_18] = var_8[var_18];

    return var_17;
}

_id_5061()
{
    if ( !level._id_2153 )
    {
        var_0 = self _meth_834E();

        if ( isdefined( var_0 ) )
            return var_0;
        else
            return 0;
    }

    return 1;
}

_id_2F68( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1500;

    if ( !isdefined( var_2 ) )
        var_2 = -12000;

    return physicstrace( var_0 + ( 0, 0, var_1 ), var_0 + ( 0, 0, var_2 ) );
}

_id_0755( var_0, var_1 )
{
    if ( !isdefined( level._id_2910 ) )
        level._id_2910 = [];

    level._id_2910[var_0] = var_1;
}

_id_0756( var_0, var_1 )
{
    if ( !isdefined( level._id_2934 ) )
        level._id_2934 = [];

    level._id_2934[var_0] = var_1;
}

_id_A33E( var_0, var_1, var_2, var_3 )
{
    var_4 = vectornormalize( var_2 - var_0 );
    var_5 = anglestoforward( var_1 );
    var_6 = vectordot( var_5, var_4 );
    return var_6 >= var_3;
}

_id_3314( var_0 )
{
    self notify( "entity_path_disconnect_thread" );
    self endon( "entity_path_disconnect_thread" );
    self endon( "death" );
    level endon( "game_ended" );
    var_1 = 0;
    self._id_39B9 = 0;

    for (;;)
    {
        var_2 = self._id_02E6;
        var_3 = _id_A06A( var_0, "path_disconnect" );
        var_4 = 0;
        var_5 = distancesquared( self._id_02E6, var_2 ) > 0;

        if ( var_5 )
            var_4 = 1;

        if ( isdefined( var_3 ) && var_3 == "path_disconnect" )
            var_4 = 1;

        if ( gettime() < self._id_39B9 )
            var_4 = 1;

        foreach ( var_7 in level._id_1C8E )
        {
            if ( isai( var_7 ) && distancesquared( self._id_02E6, var_7._id_02E6 ) < 250000 )
            {
                var_4 = 1;
                self._id_39B9 = max( gettime() + 30000, self._id_39B9 );
            }
        }

        if ( var_4 != var_1 || var_5 )
        {
            if ( var_4 )
                self _meth_8057();
            else
                self _meth_8058();

            var_1 = var_4;
        }
    }
}

_id_5920( var_0, var_1 )
{
    if ( level._id_01B5 == "aliens" && isdefined( level._id_09D9 ) )
        return self [[ level._id_09D9 ]]( var_0, var_1 );

    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["bots_make_entity_sentient"] ) )
        return self [[ level._id_161B["bots_make_entity_sentient"] ]]( var_0, var_1 );
}

_id_08B5( var_0 )
{
    if ( isdefined( level._id_161B ) && isdefined( level._id_161B["ai_3d_sighting_model"] ) )
        return self [[ level._id_161B["ai_3d_sighting_model"] ]]( var_0 );
}

_id_7DD8( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_0BEC ) )
        level._id_0BEC = [];

    var_3 = tolower( getdvar( "mapname" ) );
    var_4 = 1;

    if ( _id_8F51( var_3, "mp_" ) )
        var_4 = 0;

    if ( var_4 )
        level._id_0BEC[var_0]["basic"] = var_1;
    else
        level._id_0BEC[var_0]["basic"] = var_2;
}

_id_3F31( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        if ( !isdefined( var_5 ) )
            continue;

        var_6 = distance( var_5._id_02E6, var_0 );

        if ( var_6 >= var_2 )
            continue;

        var_2 = var_6;
        var_3 = var_5;
    }

    return var_3;
}

_id_3F8F( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = 0;
    var_4 = undefined;

    foreach ( var_6 in var_1 )
    {
        var_7 = distance( var_6._id_02E6, var_0 );

        if ( var_7 <= var_3 || var_7 >= var_2 )
            continue;

        var_3 = var_7;
        var_4 = var_6;
    }

    return var_4;
}

_id_5CA1( var_0, var_1, var_2 )
{
    var_2 = _id_928D( isdefined( var_2 ), var_2, ( 0, 0, 0 ) );
    self _meth_81D9( var_0, var_2 );

    switch ( var_1 )
    {
        case "direct":
            self _meth_81DC();
            break;
        case "top":
            self _meth_81DD();
            break;
    }
}

_id_33DF( var_0 )
{
    return log( var_0 + 6.1e-05 ) / log( 2.0 ) + 2.84;
}

_id_576C( var_0 )
{
    if ( var_0 <= 0.0031308 )
        return var_0 * 12.92;
    else
        return pow( var_0, 0.416667 ) * 1.055 - 0.055;
}

_id_21A5( var_0 )
{
    if ( !isdefined( var_0._id_4771 ) )
    {
        if ( _func_235() )
        {
            var_1 = max( var_0._id_7296, max( var_0._id_43D5, var_0._id_14C5 ) );
            var_2 = _id_33DF( var_1 * getradiometricunit() );

            if ( var_1 > 0 )
            {
                var_0._id_7296 /= var_1;
                var_0._id_43D5 /= var_1;
                var_0._id_14C5 /= var_1;
                var_0._id_7296 = _id_576C( var_0._id_7296 );
                var_0._id_43D5 = _id_576C( var_0._id_43D5 );
                var_0._id_14C5 = _id_576C( var_0._id_14C5 );
                var_0._id_4771 = var_2;
            }
            else
                var_0._id_4771 = 0.0;
        }
        else
            var_0._id_4771 = 1.0;
    }

    if ( isdefined( var_0._id_8FCB ) && var_0._id_8FCB )
    {
        if ( !isdefined( var_0._id_4773 ) )
        {
            if ( _func_235() )
            {
                var_1 = max( var_0._id_7296, var_0._id_43D5, var_0._id_14C5 );
                var_2 = _id_33DF( var_1 * getradiometricunit() );

                if ( var_1 > 0 )
                {
                    var_0._id_8FD3 /= var_1;
                    var_0._id_8FCC /= var_1;
                    var_0._id_8FB9 /= var_1;
                    var_0._id_8FD3 = _id_576C( var_0._id_7296 );
                    var_0._id_8FCC = _id_576C( var_0._id_43D5 );
                    var_0._id_8FB9 = _id_576C( var_0._id_14C5 );
                    var_0._id_4773 = var_2;
                    return;
                }

                var_0._id_4773 = 0.0;
                return;
            }
            else
                var_0._id_4773 = 1.0;
        }
    }
}

_id_21A4( var_0 )
{
    if ( isdefined( level._id_33E7 ) )
    {
        switch ( level._id_33E7 )
        {
            case "dfog":
                if ( level._id_33E7 == "dfog" && var_0._id_8FCB == 0 )
                {
                    var_0._id_8FCB = 1;
                    var_0._id_8FD3 = 0;
                    var_0._id_8FCC = 0;
                    var_0._id_8FB9 = 0;
                    var_0._id_4773 = 0;
                    var_0._id_8FC0 = ( 0, 0, 0 );
                    var_0._id_8FB7 = 0;
                    var_0._id_8FC5 = 0;
                    var_0._id_615B = 1;
                }

                break;
            case "normal_fog":
                if ( var_0._id_8FCB == 1 )
                    var_0._id_8FCB = 0;

                break;
            default:
        }
    }
}

_id_7E31( var_0, var_1 )
{
    if ( isdefined( var_0._id_8FCB ) && var_0._id_8FCB )
    {
        if ( !isplayer( self ) )
            setexpfogext( var_0._id_8D02, var_0._id_44FD, var_0._id_7296, var_0._id_43D5, var_0._id_14C5, var_0._id_4771, var_0._id_5A44, var_1, var_0._id_8FD3, var_0._id_8FCC, var_0._id_8FB9, var_0._id_4773, var_0._id_8FC0, var_0._id_8FB7, var_0._id_8FC3, var_0._id_615B, var_0._id_85C7, var_0._id_85C9, var_0._id_85C8, var_0._id_479C, var_0._id_479B, var_0._id_479D );
        else
            self _meth_821E( var_0._id_8D02, var_0._id_44FD, var_0._id_7296, var_0._id_43D5, var_0._id_14C5, var_0._id_4771, var_0._id_5A44, var_1, var_0._id_8FD3, var_0._id_8FCC, var_0._id_8FB9, var_0._id_4773, var_0._id_8FC0, var_0._id_8FB7, var_0._id_8FC3, var_0._id_615B, var_0._id_85C7, var_0._id_85C9, var_0._id_85C8, var_0._id_479C, var_0._id_479B, var_0._id_479D );
    }
    else if ( !isplayer( self ) )
        setexpfogext( var_0._id_8D02, var_0._id_44FD, var_0._id_7296, var_0._id_43D5, var_0._id_14C5, var_0._id_4771, var_0._id_5A44, var_1, var_0._id_85C7, var_0._id_85C9, var_0._id_85C8, var_0._id_479C, var_0._id_479B, var_0._id_479D );
    else
        self _meth_821E( var_0._id_8D02, var_0._id_44FD, var_0._id_7296, var_0._id_43D5, var_0._id_14C5, var_0._id_4771, var_0._id_5A44, var_1, var_0._id_85C7, var_0._id_85C9, var_0._id_85C8, var_0._id_479C, var_0._id_479B, var_0._id_479D );
}

_id_7E30( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_0._id_85C7 ) )
    {
        var_0._id_85C7 = 0;
        var_0._id_85C9 = 0;
        var_0._id_85C8 = 0;
    }

    if ( !isdefined( var_0._id_479C ) )
    {
        var_0._id_479C = 0;
        var_0._id_479B = 0;
        var_0._id_479D = 1000;
    }

    _id_21A5( var_0 );
    _id_21A4( var_0 );

    if ( isdefined( var_0._id_0DB4 ) )
    {
        if ( level._id_02B3 && var_0._id_0DB4 )
        {
            if ( isplayer( self ) )
                self _meth_8220( var_1, var_0._id_0DC4, var_0._id_0DB7, var_0._id_0DB9, var_0._id_0DB8, var_0._id_0DB5, var_0._id_0DBD, var_0._id_0DB6, var_0._id_0DC2, var_0._id_0DB3, int( var_0._id_0DBF ), var_0._id_0DBE, var_0._id_0DC1, var_0._id_0DC0, var_0._id_0DC3, var_0._id_0DBB, var_0._id_0DBA, var_0._id_0DBC );
            else
                setatmosfog( var_1, var_0._id_0DC4, var_0._id_0DB7, var_0._id_0DB9, var_0._id_0DB8, var_0._id_0DB5, var_0._id_0DBD, var_0._id_0DB6, var_0._id_0DC2, var_0._id_0DB3, int( var_0._id_0DBF ), var_0._id_0DBE, var_0._id_0DC1, var_0._id_0DC0, var_0._id_0DC3, var_0._id_0DBB, var_0._id_0DBA, var_0._id_0DBC );
        }
        else
            _id_7E31( var_0, var_1 );
    }
    else
        _id_7E31( var_0, var_1 );
}

_id_0760( var_0, var_1 )
{
    if ( !isdefined( level._id_058F ) )
        level._id_058F = [];

    level._id_058F[var_0] = loadfx( var_1 );
}

_id_0D05( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size - 1; var_2++ )
    {
        for ( var_3 = var_2 + 1; var_3 < var_0.size; var_3++ )
        {
            if ( var_0[var_3] [[ var_1 ]]() < var_0[var_2] [[ var_1 ]]() )
            {
                var_4 = var_0[var_3];
                var_0[var_3] = var_0[var_2];
                var_0[var_2] = var_4;
            }
        }
    }

    return var_0;
}

_id_0D06( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = -1;

    for ( var_3 = 1; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];

        for ( var_5 = var_3 - 1; var_5 >= 0 && ![[ var_1 ]]( var_0[var_5], var_4 ); var_5-- )
            var_0[var_5 + 1] = var_0[var_5];

        var_0[var_5 + 1] = var_4;

        if ( var_2 > 0 && var_3 % var_2 == 0 )
            wait 0.05;
    }

    return var_0;
}

_id_485B()
{
    if ( !isdefined( self._id_63C4 ) )
        self._id_63C4 = self _meth_80BE( 0 );

    self _meth_8054();
}

_id_84E9()
{
    if ( !isai( self ) )
        self _meth_82BE();

    if ( isdefined( self._id_63C4 ) )
        self _meth_80BE( self._id_63C4 );

    self _meth_8053();
}

_id_7F9C( var_0 )
{
    var_1 = getentarray();
    setomnvar( "lighting_state", var_0 );

    if ( !getdvarint( "r_reflectionProbeGenerate" ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3._id_572B ) && ( var_3._id_00AB == "script_brushmodel" || var_3._id_00AB == "script_model" ) )
            {
                if ( var_3._id_572B == 0 )
                    continue;

                if ( var_3._id_572B == var_0 )
                {
                    var_3 _id_84E9();
                    continue;
                }

                var_3 _id_485B();
            }
        }
    }
}
