// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_53A5 = 5000;
    level._id_39AC = 0;
    level._id_8FDB = 0;
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    level._id_1F11 = undefined;
    level._id_2AF7 = 0;
    level._id_62A9 = 0;
    level._id_62A8 = 0;
    level._id_0328 = [];
    level._id_669A = [];
    level._id_1C8E = [];
    level._id_89F8 = [];
    level._id_4404 = [];
    level._id_5CBF = [];
    level._id_1B9C = [];
    level._id_99B3 = [];
    level._id_78FB = [];
    level._id_99E7 = [];
    level._id_94EA = [];
    level._id_3574 = [];
    level thread _id_64C5();
    level thread _id_89FD();
    level thread _id_94B9();
    level thread _id_9501();
    level thread _id_94B0();
    level thread _id_94BA();

    for ( var_0 = 0; var_0 < level._id_91F0.size; var_0++ )
        level._id_91FA[level._id_91F0[var_0]] = [];
}

_id_94BA()
{
    for (;;)
    {
        self waittill( "host_migration_end" );

        foreach ( var_1 in level._id_669A )
            var_1._id_1AD6 = _id_1AD6( var_1 );
    }
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        level thread _id_8CFB( var_0 );
    }
}

_id_8CFB( var_0 )
{
    var_0 endon( "disconnect" );
    var_0._id_1AD6 = _id_1AD6( var_0 );

    if ( !var_0._id_1AD6 )
        return;

    wait 0.05;
    var_0 _meth_82FE( level._id_1F11 );
}

_id_1AD6( var_0 )
{
    if ( level._id_2AF7 || isdefined( level.skipspawnsighttraces ) && level.skipspawnsighttraces )
        return 0;

    if ( !isdefined( level._id_1F11 ) )
        return 0;

    if ( isai( var_0 ) || istestclient( var_0 ) )
        return 0;

    if ( var_0 _meth_829C() )
    {
        if ( getdvarint( "enableS1TUSpawnSightTraces" ) > 0 )
            return 1;
        else
            return 0;
    }

    return 1;
}

_id_0831( var_0 )
{
    var_1 = _id_40DB( var_0 );

    if ( !var_1.size )
        return;

    if ( !isdefined( level._id_8D37 ) )
        level._id_8D37 = [];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2] _id_89FA();
        var_1[var_2]._id_7C5D = 0;
        level._id_8D37[level._id_8D37.size] = var_1[var_2];
    }

    foreach ( var_4 in var_1 )
    {
        var_4._id_4C65 = 1;
        var_5 = anglestoforward( var_4._id_0041 );

        foreach ( var_7 in var_1 )
        {
            if ( var_4 == var_7 )
                continue;

            var_8 = vectornormalize( var_7._id_02E6 - var_4._id_02E6 );
            var_9 = vectordot( var_5, var_8 );

            if ( var_9 > 0.86 )
            {
                var_4._id_4C65 = 0;
                break;
            }
        }
    }
}

_id_082F( var_0, var_1 )
{
    if ( !isdefined( level._id_89FB ) )
        level._id_89FB = [];

    if ( !isdefined( level._id_91FA[var_0] ) )
        level._id_91FA[var_0] = [];

    var_2 = [];
    var_2 = _id_40DB( var_1 );

    if ( !isdefined( level._id_1F11 ) )
        level._id_1F11 = var_1;

    if ( !var_2.size )
        return;

    foreach ( var_4 in var_2 )
    {
        if ( !isdefined( var_4._id_4DB2 ) )
        {
            var_4 _id_89FA();
            level._id_89FB[level._id_89FB.size] = var_4;
        }

        level._id_91FA[var_0][level._id_91FA[var_0].size] = var_4;
    }
}

_id_89FA()
{
    var_0 = self;
    level._id_89F0 = _id_3517( level._id_89F0, var_0._id_02E6 );
    level._id_89ED = _id_3516( level._id_89ED, var_0._id_02E6 );
    var_0._id_019B = anglestoforward( var_0._id_0041 );
    var_0._id_8565 = var_0._id_02E6 + ( 0, 0, 50 );
    var_0._id_55DC = gettime();
    var_0._id_65CE = 1;
    var_0._id_4DB2 = 1;
    var_0._id_0B03 = [];
    var_1 = 1024;

    if ( !bullettracepassed( var_0._id_8565, var_0._id_8565 + ( 0, 0, var_1 ), 0, undefined ) )
    {
        var_2 = var_0._id_8565 + var_0._id_019B * 100;

        if ( !bullettracepassed( var_2, var_2 + ( 0, 0, var_1 ), 0, undefined ) )
            var_0._id_65CE = 0;
    }

    var_3 = anglestoright( var_0._id_0041 );
    _id_07C9( var_0, var_0._id_02E6 + var_3 * 45 );
    _id_07C9( var_0, var_0._id_02E6 - var_3 * 45 );
    _id_4E22( var_0 );
}

_id_07C9( var_0, var_1 )
{
    var_2 = playerphysicstrace( var_0._id_02E6, var_0._id_02E6 + ( 0, 0, 18 ) );
    var_3 = var_2[2] - var_0._id_02E6[2];
    var_4 = ( var_1[0], var_1[1], var_1[2] + var_3 );
    var_5 = playerphysicstrace( var_2, var_4 );

    if ( var_5 != var_4 )
        return;

    var_6 = _func_24F( var_4 );

    if ( abs( var_6[2] - var_1[2] ) > 128 )
        return;

    var_0._id_0B03[var_0._id_0B03.size] = var_6;
}

_id_40DB( var_0 )
{
    if ( !isdefined( level._id_89F8 ) )
        level._id_89F8 = [];

    if ( !isdefined( level._id_89F8[var_0] ) )
    {
        level._id_89F8[var_0] = [];
        level._id_89F8[var_0] = getspawnarray( var_0 );

        foreach ( var_2 in level._id_89F8[var_0] )
            var_2._id_00AB = var_0;
    }

    return level._id_89F8[var_0];
}

_id_40D6( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = undefined;
    var_0 = _id_A7B0::_id_1CFA( var_0 );
    var_0 = _id_A4F0::_id_0CF5( var_0 );

    foreach ( var_3 in var_0 )
    {
        var_1 = var_3;

        if ( precachestatusicon( var_1._id_02E6 ) && !getstarttime( var_1._id_02E6 ) )
            break;
    }

    return var_1;
}

_id_40D9( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = undefined;
    var_0 = _id_A7B0::_id_1CFA( var_0 );

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_7C5D )
            continue;

        if ( var_3._id_4C65 )
        {
            var_1 = var_3;
            break;
        }

        var_1 = var_3;
    }

    if ( !isdefined( var_1 ) )
        var_1 = _id_40D6( var_0 );

    var_1._id_7C5D = 1;
    return var_1;
}

_id_40D5( var_0, var_1 )
{
    for (;;)
        wait 5;
}

_id_94B9()
{
    for (;;)
    {
        level._id_4404 = getentarray( "grenade", "classname" );
        wait 0.05;
    }
}

_id_9501()
{
    for (;;)
    {
        level._id_5CBF = getentarray( "rocket", "classname" );
        wait 0.05;
    }
}

_id_94B0()
{
    for (;;)
    {
        level._id_1B9C = getentarray( "care_package", "targetname" );
        wait 0.05;
    }
}

_id_411D( var_0 )
{
    return level._id_91FA[var_0];
}

_id_516D()
{
    if ( !isdefined( level._id_66D7 ) )
    {
        var_0 = getallnodes();
        level._id_66D7 = isdefined( var_0 ) && var_0.size > 150;
    }

    return level._id_66D7;
}

_id_084E()
{
    if ( isdefined( level._id_511A ) && level._id_511A )
        level notify( "participant_added", self );

    level._id_669A[level._id_669A.size] = self;
}

_id_73A9()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_669A.size; var_1++ )
    {
        if ( level._id_669A[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level._id_669A.size - 1; var_1++ )
                level._id_669A[var_1] = level._id_669A[var_1 + 1];

            level._id_669A[var_1] = undefined;
            break;
        }
    }
}

_id_0848()
{
    level._id_1C8E[level._id_1C8E.size] = self;
}

_id_73A4()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_1C8E.size; var_1++ )
    {
        if ( level._id_1C8E[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level._id_1C8E.size - 1; var_1++ )
                level._id_1C8E[var_1] = level._id_1C8E[var_1 + 1];

            level._id_1C8E[var_1] = undefined;
            break;
        }
    }
}

_id_89FD()
{
    while ( !isdefined( level._id_89FB ) || level._id_89FB.size == 0 )
        wait 0.05;

    level thread _id_89FC();
    level thread _id_89F9();

    for (;;)
    {
        level._id_2AF7 = getdvarint( "scr_disableClientSpawnTraces" ) > 0;
        wait 0.05;
    }
}

_id_3ED8()
{
    var_0 = [];
    level._id_0719 = 0;
    var_1 = level._id_01B5;
    var_2 = 0;

    if ( var_1 == "dm" || var_1 == "gun" )
        var_2 = 1;

    foreach ( var_4 in level._id_1C8E )
    {
        if ( isplayer( var_4 ) && var_2 && ( var_4._id_03BC == "playing" || var_4._id_03BC == "dead" ) )
            level._id_0719++;

        if ( !_id_A75A::_id_5186( var_4 ) )
            continue;

        if ( isplayer( var_4 ) && var_4._id_03BC != "playing" )
            continue;

        var_4._id_89E7 = _id_40DC( var_4 );

        if ( var_4._id_89E7 == "spectator" )
            continue;

        if ( isagent( var_4 ) && var_4._id_08A0 == "dog" )
        {
            var_4._id_89E8 = _id_408F( var_4, 1 );
            var_4._id_8A0D = var_4._id_02E6 + ( 0, 0, var_4._id_89E8 );
        }
        else if ( !var_4._id_1AD6 )
        {
            var_5 = "";

            if ( var_4 _id_A75A::_id_51E0() )
                var_5 = var_4 _id_A75A::_id_40B5();

            if ( !( var_5 == "orbitalsupport" || var_5 == "Warbird" ) )
            {
                var_6 = _id_408F( var_4 );
                var_7 = var_4 _meth_80A8();
                var_7 = ( var_7[0], var_7[1], var_4._id_02E6[2] + var_6 );
                var_4._id_89E8 = var_6;
                var_4._id_8A0D = var_7;
            }
        }

        var_0[var_0.size] = var_4;
    }

    return var_0;
}

_id_89FC()
{
    if ( isdefined( level.skipspawnsighttraces ) && level.skipspawnsighttraces )
        return;

    var_0 = 18;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 3;
    var_5 = getdvarint( "enableS1TUSpawnSightTraces" );
    var_6 = _func_2DD();
    var_7 = _id_3ED8();

    for (;;)
    {
        if ( var_2 )
        {
            wait 0.05;
            var_1 = 0;
            var_2 = 0;
            var_7 = _id_3ED8();
        }

        var_8 = getdvarint( "enableS1TUSpawnSightTraces" );

        if ( var_8 )
            level.spawnsighttracesused_posts1tu = 1;
        else
            level.spawnsighttracesused_pres1tu = 1;

        if ( var_8 != var_5 )
        {
            foreach ( var_10 in level._id_669A )
            {
                var_10._id_1AD6 = _id_1AD6( var_10 );

                if ( var_10._id_1AD6 )
                {
                    var_10 _meth_82FE( level._id_1F11 );
                    continue;
                }

                var_10 _meth_82FE();
            }

            var_5 = var_8;
        }

        var_13 = level._id_89FB;
        var_13 = _id_A7B0::_id_1CFA( var_13 );
        var_2 = 1;

        foreach ( var_15 in var_13 )
        {
            var_15._id_5606 = gettime();
            _id_1F03( var_15 );

            foreach ( var_10 in var_7 )
            {
                if ( !isdefined( var_10._id_89E8 ) || !isdefined( var_10._id_8A0D ) )
                {
                    var_10._id_89E8 = _id_408F( var_10 );
                    var_17 = var_10._id_02E6;
                    var_10._id_8A0D = ( var_17[0], var_17[1], var_17[2] + var_10._id_89E8 );
                }

                if ( var_15._id_3AE0[var_10._id_89E7] )
                    continue;

                if ( var_10._id_1AD6 )
                    var_18 = var_10 _meth_82FF( var_15._id_0205 );
                else
                {
                    if ( var_8 )
                    {
                        if ( var_3 % 3 == 1 )
                            var_19 = ( 0, 0, 0 );
                        else
                            var_19 = ( randomfloatrange( -16, 16 ), randomfloatrange( -16, 16 ), 0 );

                        var_20 = var_15._id_02E6 + var_19;
                        var_20 += ( 0, 0, var_3 % 3 * 36 );
                        var_21 = var_10._id_8A0D + var_19;
                    }
                    else
                    {
                        var_20 = var_15._id_02E6 + ( 0, 0, var_10._id_89E8 );
                        var_21 = var_10._id_8A0D;
                    }

                    var_18 = spawnsighttrace( var_15, var_20, var_21, var_15._id_0205 );
                    var_1++;
                }

                if ( var_8 )
                {
                    var_22 = var_10 _meth_81B1();

                    if ( !isdefined( var_15.fullsightdelay ) || !isdefined( var_15.fullsightdelay[var_22] ) )
                        var_15.fullsightdelay[var_22] = 0;

                    if ( !isdefined( var_15.cornersightdelay ) || !isdefined( var_15.cornersightdelay[var_22] ) )
                        var_15.cornersightdelay[var_22] = 0;
                }
                else
                    var_22 = 0;

                if ( !var_18 )
                {
                    if ( var_8 )
                    {
                        if ( var_15.fullsightdelay[var_22] )
                            var_15.fullsightdelay[var_22]--;

                        if ( var_15.cornersightdelay[var_22] )
                            var_15.cornersightdelay[var_22]--;

                        if ( var_15.fullsightdelay[var_22] )
                            var_15._id_3AE0[var_10._id_89E7]++;
                        else if ( var_15.cornersightdelay[var_22] )
                            var_15._id_222B[var_10._id_89E7]++;
                    }

                    continue;
                }

                if ( var_18 > 0.95 )
                {
                    if ( var_8 )
                    {
                        var_15.fullsightdelay[var_22] = var_4;

                        if ( var_15.cornersightdelay[var_22] )
                            var_15.cornersightdelay[var_22]--;
                    }

                    var_15._id_3AE0[var_10._id_89E7]++;
                    continue;
                }

                if ( level._id_0719 > 8 )
                    continue;

                if ( var_8 )
                {
                    if ( var_15.fullsightdelay[var_22] )
                        var_15.fullsightdelay[var_22]--;

                    var_15.cornersightdelay[var_22] = var_4;

                    if ( var_15.fullsightdelay[var_22] )
                        var_15._id_3AE0[var_10._id_89E7]++;
                    else
                        var_15._id_222B[var_10._id_89E7]++;

                    continue;
                }

                var_15._id_222B[var_10._id_89E7]++;
            }

            _id_07EE( var_15, level._id_99B3 );
            _id_07EE( var_15, level._id_99E7 );

            if ( _id_84A5( var_0, var_1 ) )
            {
                wait 0.05;
                var_1 = 0;
                var_2 = 0;
                var_7 = _id_3ED8();
            }
        }

        var_3++;
    }
}

_id_84A5( var_0, var_1 )
{
    var_2 = 0;

    foreach ( var_4 in level._id_669A )
    {
        if ( !var_4._id_1AD6 )
            var_2++;
    }

    if ( var_1 + var_2 > var_0 )
        return 1;

    return 0;
}

_id_89F9()
{
    var_0 = _id_3ED8();
    var_1 = gettime();
    var_2 = 4;
    var_3 = 0;

    for (;;)
    {
        var_4 = level._id_89FB;
        var_4 = _id_A7B0::_id_1CFA( var_4 );
        var_5 = 0;

        foreach ( var_7 in var_4 )
        {
            _id_1F02( var_7 );
            var_3++;

            foreach ( var_9 in var_0 )
            {
                if ( var_9._id_89E7 == "spectator" )
                    continue;

                if ( isdefined( level.spawndistanceteamskip ) && var_9._id_89E7 == level.spawndistanceteamskip )
                    continue;

                var_10 = distancesquared( var_9._id_02E6, var_7._id_02E6 );

                if ( var_10 < var_7._id_5C42[var_9._id_89E7] )
                    var_7._id_5C42[var_9._id_89E7] = var_10;

                var_7._id_2B82[var_9._id_89E7] += var_10;
                var_7._id_93F7[var_9._id_89E7]++;

                if ( var_10 < 1638400 )
                {
                    if ( _id_A75A::_id_5186( var_9 ) )
                        var_7._id_606B[var_9._id_89E7]++;
                }
            }

            if ( var_3 == var_2 )
            {
                var_5 = 1;
                wait 0.05;
                var_0 = _id_3ED8();
                var_1 = gettime();
                var_3 = 0;
            }
        }

        if ( !var_5 )
        {
            wait 0.05;
            var_0 = _id_3ED8();
            var_1 = gettime();
            var_3 = 0;
        }
    }
}

_id_40DC( var_0 )
{
    var_1 = "all";

    if ( level._id_91E4 )
        var_1 = var_0._id_04A8;

    return var_1;
}

_id_4E22( var_0 )
{
    _id_1F03( var_0 );
    _id_1F02( var_0 );
}

_id_1F03( var_0 )
{
    if ( level._id_91E4 )
    {
        foreach ( var_2 in level._id_91F0 )
            _id_1F09( var_0, var_2 );
    }
    else
        _id_1F09( var_0, "all" );
}

_id_1F02( var_0 )
{
    if ( level._id_91E4 )
    {
        foreach ( var_2 in level._id_91F0 )
            _id_1F08( var_0, var_2 );
    }
    else
        _id_1F08( var_0, "all" );
}

_id_1F09( var_0, var_1 )
{
    var_0._id_3AE0[var_1] = 0;
    var_0._id_222B[var_1] = 0;
}

_id_1F08( var_0, var_1 )
{
    var_0._id_2B82[var_1] = 0;
    var_0._id_5C42[var_1] = 9999999;
    var_0._id_93F7[var_1] = 0;
    var_0._id_606B[var_1] = 0;
}

_id_408F( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 )
        return 64;

    var_2 = var_0 _meth_817C();

    if ( var_2 == "stand" )
        return 64;

    if ( var_2 == "crouch" )
        return 44;

    return 32;
}

_id_07EE( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = _id_40DC( var_3 );

        if ( var_0._id_3AE0[var_4] )
            continue;

        var_5 = spawnsighttrace( var_0, var_0._id_8565, var_3._id_02E6 + ( 0, 0, 50 ), var_0._id_0205 );

        if ( !var_5 )
            continue;

        if ( var_5 > 0.95 )
        {
            var_0._id_3AE0[var_4]++;
            continue;
        }

        var_0._id_222B[var_4]++;
    }
}

_id_373B( var_0 )
{
    var_1 = gettime();
    self._id_55DA = var_0;
    self._id_55DC = var_1;
    var_0._id_55DC = var_1;
    var_0._id_55DB = self._id_04A8;
}

_id_3518( var_0 )
{
    var_1 = _id_40DB( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        level._id_89F0 = _id_3517( level._id_89F0, var_1[var_2]._id_02E6 );
        level._id_89ED = _id_3516( level._id_89ED, var_1[var_2]._id_02E6 );
    }
}

_id_3517( var_0, var_1 )
{
    if ( var_0[0] > var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] > var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] > var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

_id_3516( var_0, var_1 )
{
    if ( var_0[0] < var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] < var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] < var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

_id_3777( var_0, var_1 )
{
    var_2 = ( 0, 0, 0 );
    var_2 = var_1 - var_0;
    var_2 = ( var_2[0] / 2, var_2[1] / 2, var_2[2] / 2 ) + var_0;
    return var_2;
}

_id_7FA0()
{
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    _id_3518( "mp_tdm_spawn_allies_start" );
    _id_3518( "mp_tdm_spawn_axis_start" );
    level._id_5983 = _id_3777( level._id_89F0, level._id_89ED );
    setmapcenter( level._id_5983 );
}

_id_84B5()
{
    return level._id_4C6A && ( !isdefined( level._id_62A2 ) || level._id_62A2 == 0 );
}

_id_7270( var_0 )
{
    if ( !isdefined( self._id_89DE ) )
        self._id_89DE = spawnstruct();

    if ( isdefined( self._id_89DE._id_126D ) && self._id_89DE._id_126D )
    {
        if ( !isdefined( self._id_89DE.pastbadspawns ) )
        {
            self._id_89DE.pastbadspawns = [];
            self._id_89DE.pastbadspawncount = 0;
        }

        self._id_89DE.pastbadspawns[self._id_89DE.pastbadspawncount] = self._id_89DE._id_89F7;
        self._id_89DE.pastbadspawncount++;
    }
    else
    {
        self._id_89DE.pastbadspawns = [];
        self._id_89DE.pastbadspawncount = 0;
    }

    self._id_89DE._id_89F7 = var_0;
}
