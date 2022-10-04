// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3535()
{
    if ( isdefined( self._id_0395 ) )
        wait(self._id_0395);

    self _meth_809A( level._id_78B7[self._id_7AC4] );
}

_id_0560( var_0, var_1, var_2, var_3 )
{
    self _meth_831B( var_1, var_2, var_3 );
    self _meth_82FB( "ui_map_location_selector", 1 );
    self._id_7C69 = 1;
    self _meth_82D9( 10.3, 0.3 );
    thread _id_31C3( "cancel_location" );
    thread _id_31C3( "death" );
    thread _id_31C3( "disconnect" );
    thread _id_31C3( "used" );
    thread _id_31C3( "weapon_change" );
    self endon( "stop_location_selection" );
    thread _id_31C5();
    thread _id_31C4();
    thread _id_31C2();
}

_id_8EF0( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "generic";

    if ( !var_0 )
    {
        self _meth_82FB( "ui_map_location_selector", 0 );
        self _meth_82D9( 0, 0.3 );
        self _meth_831C();
        self._id_7C69 = undefined;
    }

    self notify( "stop_location_selection", var_1 );
}

_id_31C4()
{
    self endon( "stop_location_selection" );

    for (;;)
    {
        level waittill( "emp_update" );

        if ( !_id_50F6() )
            continue;

        thread _id_8EF0( 0, "emp" );
        return;
    }
}

_id_31C3( var_0, var_1 )
{
    self endon( "stop_location_selection" );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    while ( var_1 > 0 )
    {
        self waittill( var_0 );
        var_1--;
    }

    thread _id_8EF0( var_0 == "disconnect", var_0 );
}

_id_31C5()
{
    self endon( "stop_location_selection" );
    level waittill( "game_ended" );
    thread _id_8EF0( 0, "end_game" );
}

_id_31C2()
{
    self endon( "stop_location_selection" );
    level waittill( "host_migration_begin" );
    thread _id_8EF0( 0, "hostmigrate" );
}

_id_50BA( var_0 )
{
    var_1 = tablelookup( "mp/attachmentTable.csv", 3, var_0, 0 );

    if ( isdefined( var_1 ) && var_1 != "" )
        return 1;
    else
        return 0;
}

_id_3F09( var_0 )
{
    var_1 = tablelookup( "mp/attachmentTable.csv", 3, var_0, 1 );
    return var_1;
}

_id_27EE( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    thread _id_27F0( var_1, var_0, var_2, var_3, var_4, var_5, var_6 );
}

_id_27F0( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    wait(var_1);

    if ( !isdefined( var_2 ) )
        thread [[ var_0 ]]();
    else if ( !isdefined( var_3 ) )
        thread [[ var_0 ]]( var_2 );
    else if ( !isdefined( var_4 ) )
        thread [[ var_0 ]]( var_2, var_3 );
    else if ( !isdefined( var_5 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( !isdefined( var_6 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
}

_id_4085()
{
    var_0 = self._id_02E6 + ( 0, 0, 10 );
    var_1 = 11;
    var_2 = anglestoforward( self._id_0041 );
    var_2 *= var_1;
    var_3[0] = var_0 + var_2;
    var_3[1] = var_0;
    var_4 = bullettrace( var_3[0], var_3[0] + ( 0, 0, -18 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5._id_02E6 = var_4["position"];
        var_5._id_0041 = _id_6587( var_4["normal"] );
        return var_5;
    }

    var_4 = bullettrace( var_3[1], var_3[1] + ( 0, 0, -18 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5._id_02E6 = var_4["position"];
        var_5._id_0041 = _id_6587( var_4["normal"] );
        return var_5;
    }

    var_3[2] = var_0 + ( 16, 16, 0 );
    var_3[3] = var_0 + ( 16, -16, 0 );
    var_3[4] = var_0 + ( -16, -16, 0 );
    var_3[5] = var_0 + ( -16, 16, 0 );
    var_6 = undefined;
    var_7 = undefined;

    for ( var_8 = 0; var_8 < var_3.size; var_8++ )
    {
        var_4 = bullettrace( var_3[var_8], var_3[var_8] + ( 0, 0, -1000 ), 0, undefined );

        if ( !isdefined( var_6 ) || var_4["fraction"] < var_6 )
        {
            var_6 = var_4["fraction"];
            var_7 = var_4["position"];
        }
    }

    if ( var_6 == 1 )
        var_7 = self._id_02E6;

    var_5 = spawnstruct();
    var_5._id_02E6 = var_7;
    var_5._id_0041 = _id_6587( var_4["normal"] );
    return var_5;
}

_id_6587( var_0 )
{
    var_1 = ( var_0[0], var_0[1], 0 );
    var_2 = length( var_1 );

    if ( !var_2 )
        return ( 0, 0, 0 );

    var_3 = vectornormalize( var_1 );
    var_4 = var_0[2] * -1;
    var_5 = ( var_3[0] * var_4, var_3[1] * var_4, var_2 );
    var_6 = vectortoangles( var_5 );
    return var_6;
}

_id_285D( var_0 )
{
    var_1 = getentarray( var_0, "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] delete();
}

_id_6DDA( var_0, var_1, var_2 )
{
    if ( level._id_8A76 )
    {
        if ( isdefined( level._id_0328[0] ) )
            level._id_0328[0] _meth_82F4( var_0 );
    }
    else if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_2 ) )
        {
            for ( var_3 = 0; var_3 < level._id_0328.size; var_3++ )
            {
                var_4 = level._id_0328[var_3];

                if ( var_4 _meth_82CD() && !var_4 _meth_82E8() )
                    continue;

                if ( isdefined( var_4._id_030D["team"] ) && var_4._id_030D["team"] == var_1 && !_id_50FD( var_4, var_2 ) )
                    var_4 _meth_82F4( var_0 );
            }
        }
        else
        {
            for ( var_3 = 0; var_3 < level._id_0328.size; var_3++ )
            {
                var_4 = level._id_0328[var_3];

                if ( var_4 _meth_82CD() && !var_4 _meth_82E8() )
                    continue;

                if ( isdefined( var_4._id_030D["team"] ) && var_4._id_030D["team"] == var_1 )
                    var_4 _meth_82F4( var_0 );
            }
        }
    }
    else if ( isdefined( var_2 ) )
    {
        for ( var_3 = 0; var_3 < level._id_0328.size; var_3++ )
        {
            var_4 = level._id_0328[var_3];

            if ( var_4 _meth_82CD() && !var_4 _meth_82E8() )
                continue;

            if ( !_id_50FD( var_4, var_2 ) )
                var_4 _meth_82F4( var_0 );
        }
    }
    else
    {
        for ( var_3 = 0; var_3 < level._id_0328.size; var_3++ )
        {
            var_4 = level._id_0328[var_3];

            if ( var_4 _meth_82CD() && !var_4 _meth_82E8() )
                continue;

            var_4 _meth_82F4( var_0 );
        }
    }
}

_id_6DC2( var_0, var_1, var_2 )
{
    if ( !soundexists( var_0 ) )
        return;

    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_3 endon( "death" );
    thread _id_A4F0::_id_2824( var_3 );

    if ( isdefined( var_2 ) )
    {
        var_3 _meth_8054();

        foreach ( var_5 in var_2 )
            var_3 _meth_8007( var_5 );
    }

    if ( isdefined( var_1 ) )
    {
        var_3._id_02E6 = self._id_02E6 + var_1;
        var_3._id_0041 = self._id_0041;
        var_3 _meth_8446( self );
    }
    else
    {
        var_3._id_02E6 = self._id_02E6;
        var_3._id_0041 = self._id_0041;
        var_3 _meth_8446( self );
    }

    var_3 _meth_8075( var_0 );
    self waittill( "stop sound" + var_0 );
    var_3 _meth_80AB( var_0 );
    var_3 delete();
}

_id_8890()
{
    for ( var_0 = 1; var_0 < self._id_58A3.size; var_0++ )
    {
        var_1 = self._id_58A3[var_0];
        var_2 = var_1._id_6FBB;

        for ( var_3 = var_0 - 1; var_3 >= 0 && var_2 > self._id_58A3[var_3]._id_6FBB; var_3-- )
            self._id_58A3[var_3 + 1] = self._id_58A3[var_3];

        self._id_58A3[var_3 + 1] = var_1;
    }
}

_id_07FF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = undefined;

    foreach ( var_11 in self._id_58A3 )
    {
        if ( var_11._id_02AB == var_0 )
        {
            if ( var_11._id_92AB == var_1 && var_11._id_6FBB == var_3 )
                return;

            var_9 = var_11;
            break;
        }
    }

    if ( !isdefined( var_9 ) )
    {
        var_9 = spawnstruct();
        self._id_58A3[self._id_58A3.size] = var_9;
    }

    var_9._id_02AB = var_0;
    var_9._id_92AB = var_1;
    var_9._id_04B8 = var_2;
    var_9._id_0843 = gettime();
    var_9._id_6FBB = var_3;
    var_9._id_852E = var_4;
    var_9._id_8491 = var_5;
    var_9._id_35F7 = var_6;
    var_9._id_35F8 = var_7;
    var_9._id_01ED = var_8;
    _id_8890();
}

_id_73B8( var_0 )
{
    if ( isdefined( self._id_58A3 ) )
    {
        for ( var_1 = self._id_58A3.size; var_1 > 0; var_1-- )
        {
            if ( self._id_58A3[var_1 - 1]._id_02AB != var_0 )
                continue;

            var_2 = self._id_58A3[var_1 - 1];

            for ( var_3 = var_1; var_3 < self._id_58A3.size; var_3++ )
            {
                if ( isdefined( self._id_58A3[var_3] ) )
                    self._id_58A3[var_3 - 1] = self._id_58A3[var_3];
            }

            self._id_58A3[self._id_58A3.size - 1] = undefined;
        }

        _id_8890();
    }
}

_id_400F()
{
    return self._id_58A3[0];
}

_id_7F9F( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_6 ) )
        var_6 = 0.85;

    if ( !isdefined( var_7 ) )
        var_7 = 3.0;

    if ( !isdefined( var_8 ) )
        var_8 = 0;

    _id_07FF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    _id_9B29();
}

_id_9B29()
{
    if ( !isdefined( self._id_58A1 ) )
        return;

    var_0 = _id_400F();

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_58A1 ) && isdefined( self._id_58A8 ) )
        {
            self._id_58A1._id_0037 = 0;
            self._id_58A8._id_0037 = 0;
        }
    }
    else
    {
        self._id_58A1 _meth_80CA( var_0._id_92AB );
        self._id_58A1._id_0037 = 0.85;
        self._id_58A8._id_0037 = 1;
        self._id_58A1._id_01ED = var_0._id_01ED;

        if ( var_0._id_8491 )
        {
            self._id_58A1 _meth_8084( min( var_0._id_35F8, 60 ) );
            self._id_58A1._id_0037 = var_0._id_35F7;
        }

        if ( var_0._id_04B8 > 0 && var_0._id_852E )
            self._id_58A8 _meth_80CF( max( var_0._id_04B8 - ( gettime() - var_0._id_0843 ) / 1000, 0.1 ) );
        else
        {
            if ( var_0._id_04B8 > 0 && !var_0._id_852E )
            {
                self._id_58A8 _meth_80CA( "" );
                self._id_58A1 _meth_8084( min( var_0._id_04B8, 60 ) );
                self._id_58A1._id_0037 = 0;
                thread _id_1EF8( var_0 );
                thread _id_1EDF( var_0 );
                return;
            }

            self._id_58A8 _meth_80CA( "" );
        }
    }
}

_id_1EF8( var_0 )
{
    self notify( "message_cleared" );
    self endon( "message_cleared" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_1EF5( var_0._id_02AB );
}

_id_1EDF( var_0 )
{
    wait(var_0._id_04B8);
    _id_1EF5( var_0._id_02AB );
    self notify( "message_cleared" );
}

_id_1EF5( var_0 )
{
    _id_73B8( var_0 );
    _id_9B29();
}

_id_1EF6()
{
    for ( var_0 = 0; var_0 < self._id_58A3.size; var_0++ )
        self._id_58A3[var_0] = undefined;

    if ( !isdefined( self._id_58A1 ) )
        return;

    _id_9B29();
}

_id_6FB2( var_0, var_1 )
{
    foreach ( var_3 in level._id_0328 )
    {
        if ( var_3._id_04A8 != var_1 )
            continue;

        var_3 _meth_826D( var_0 );
    }
}

_id_6FAA( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level._id_0328.size; var_2++ )
    {
        var_3 = level._id_0328[var_2];

        if ( isdefined( var_3._id_030D["team"] ) && var_3._id_030D["team"] == var_1 )
            var_3 _meth_826E( var_0 );
    }
}

_id_6FAB( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level._id_0328.size; var_3++ )
    {
        var_4 = level._id_0328[var_3];

        if ( isdefined( var_4._id_030D["team"] ) && var_4._id_030D["team"] == var_1 )
            var_4 _meth_826E( var_0, var_2 );
    }
}

_id_6FB3( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level._id_0328.size; var_3++ )
    {
        var_4 = level._id_0328[var_3];

        if ( isdefined( var_4._id_030D["team"] ) && var_4._id_030D["team"] == var_1 )
            var_4 _meth_826D( var_0, var_2 );
    }
}

_id_6FB1( var_0, var_1 )
{
    var_2 = level._id_0328;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_1 ) )
        {
            if ( isdefined( var_2[var_3]._id_030D["team"] ) && var_2[var_3]._id_030D["team"] == var_1 )
                var_2[var_3] _meth_826D( var_0 );

            continue;
        }

        var_2[var_3] _meth_826D( var_0 );
    }
}

_id_6FA7( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = isdefined( var_4 );
    var_8 = 0;

    if ( isdefined( var_5 ) )
        var_8 = 1;

    if ( level._id_8A76 || !var_7 )
    {
        for ( var_9 = 0; var_9 < level._id_0328.size; var_9++ )
        {
            var_10 = level._id_0328[var_9];
            var_11 = var_10._id_04A8;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 && isdefined( var_2 ) )
                {
                    var_10 _meth_826D( var_2, var_6 );
                    continue;
                }

                if ( var_11 == var_1 && isdefined( var_3 ) )
                    var_10 _meth_826D( var_3, var_6 );
            }
        }

        if ( var_7 )
            level._id_0328[0] _meth_82F4( var_4 );
    }
    else if ( var_8 )
    {
        for ( var_9 = 0; var_9 < level._id_0328.size; var_9++ )
        {
            var_10 = level._id_0328[var_9];
            var_11 = var_10._id_04A8;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 _meth_826D( var_2, var_6 );

                    var_10 _meth_82F4( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 _meth_826D( var_3, var_6 );

                    var_10 _meth_82F4( var_5 );
                }
            }
        }
    }
    else
    {
        for ( var_9 = 0; var_9 < level._id_0328.size; var_9++ )
        {
            var_10 = level._id_0328[var_9];
            var_11 = var_10._id_04A8;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 _meth_826D( var_2, var_6 );

                    var_10 _meth_82F4( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 _meth_826D( var_3, var_6 );
                }
            }
        }
    }
}

_id_6FA9( var_0, var_1, var_2 )
{
    foreach ( var_4 in level._id_0328 )
    {
        if ( var_4._id_04A8 != var_0 )
            continue;

        var_4 _id_6FA8( var_1, var_2 );
    }
}

_id_6FA8( var_0, var_1 )
{
    self _meth_826D( var_0 );
    self _meth_82F4( var_1 );
}

_id_0618( var_0 )
{
    if ( level._id_8A76 && self _meth_81B1() != 0 )
        return;

    self _meth_82F4( var_0 );
}

_id_2FCF( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level._id_01B5 + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarint( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

_id_2FCE( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level._id_01B5 + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarfloat( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

_id_69C2( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        playsoundatpos( self _meth_8180( var_1 ), var_0 );
    else
        playsoundatpos( self._id_02E6, var_0 );
}

_id_4065( var_0 )
{
    if ( level._id_5FE9 )
    {

    }

    if ( var_0 == "allies" )
        return "axis";
    else if ( var_0 == "axis" )
        return "allies";
    else
        return "none";
}

_id_9F7C( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    wait(var_0);
}

_id_4DF6( var_0 )
{
    if ( !isdefined( self._id_030D[var_0] ) )
        self._id_030D[var_0] = 0;
}

_id_407F( var_0 )
{
    return self._id_030D[var_0];
}

_id_4C2B( var_0, var_1 )
{
    if ( isdefined( self ) && isdefined( self._id_030D ) && isdefined( self._id_030D[var_0] ) )
    {
        self._id_030D[var_0] += var_1;
        _id_A7A4::_id_8D4A( var_0, var_1 );
    }
}

_id_7FDB( var_0, var_1 )
{
    self._id_030D[var_0] = var_1;
}

_id_4DFD( var_0, var_1 )
{
    if ( !isdefined( self._id_8D71["stats_" + var_0] ) )
    {
        if ( !isdefined( var_1 ) )
            var_1 = 0;

        self._id_8D71["stats_" + var_0] = spawnstruct();
        self._id_8D71["stats_" + var_0]._id_9C4B = var_1;

        if ( _id_7136() )
            self _meth_8247( "round", "awards", var_0, 0 );
    }
}

_id_4C2C( var_0, var_1 )
{
    if ( isagent( self ) )
        return;

    var_2 = self._id_8D71["stats_" + var_0];
    var_2._id_9C4B += var_1;

    if ( isdefined( level._id_005F[var_0] ) && isdefined( level._id_005F[var_0]._id_6FDA ) && level._id_005F[var_0].saveonupdate )
    {
        var_3 = level._id_005F[var_0]._id_6FDA;
        self [[ var_3 ]]( var_0, var_1 );
    }
}

_id_7FE4( var_0, var_1 )
{
    var_2 = self._id_8D71["stats_" + var_0];
    var_2._id_9C4B = var_1;
    var_2._id_04B8 = gettime();
}

_id_408D( var_0 )
{
    return self._id_8D71["stats_" + var_0]._id_9C4B;
}

_id_408E( var_0 )
{
    return self._id_8D71["stats_" + var_0]._id_04B8;
}

_id_7FE5( var_0, var_1 )
{
    var_2 = _id_408D( var_0 );

    if ( var_1 > var_2 )
        _id_7FE4( var_0, var_1 );
}

_id_7FE6( var_0, var_1 )
{
    var_2 = _id_408D( var_0 );

    if ( var_1 < var_2 )
        _id_7FE4( var_0, var_1 );
}

_id_9B3F( var_0, var_1, var_2 )
{
    if ( !_id_7136() )
        return;

    var_3 = _id_A7A4::_id_8D62( var_1 );
    var_4 = _id_A7A4::_id_8D62( var_2 );

    if ( var_4 == 0 )
        var_4 = 1;

    _id_A7A4::_id_8D72( var_0, int( var_3 * 1000 / var_4 ) );
}

_id_9B40( var_0, var_1, var_2 )
{
    if ( !_id_7136() )
        return;

    var_3 = _id_A7A4::_id_8D63( var_1 );
    var_4 = _id_A7A4::_id_8D63( var_2 );

    if ( var_4 == 0 )
        var_4 = 1;

    _id_A7A4::_id_8D73( var_0, int( var_3 * 1000 / var_4 ) );
}

_id_A0EB( var_0 )
{
    if ( level._id_55D9 == gettime() )
    {
        if ( isdefined( var_0 ) && var_0 )
        {
            while ( level._id_55D9 == gettime() )
                wait 0.05;
        }
        else
        {
            wait 0.05;

            if ( level._id_55D9 == gettime() )
            {
                wait 0.05;

                if ( level._id_55D9 == gettime() )
                {
                    wait 0.05;

                    if ( level._id_55D9 == gettime() )
                        wait 0.05;
                }
            }
        }
    }

    level._id_55D9 = gettime();
}

_id_A035( var_0, var_1 )
{
    self endon( var_1 );
    wait(var_0);
}

_id_A034( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
            self endon( var_3 );
    }

    if ( isdefined( var_0 ) && var_0 > 0 )
        wait(var_0);
}

_id_50FD( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == var_1[var_2] )
            return 1;
    }

    return 0;
}

_id_5648( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( var_0 == "null" )
        return;

    if ( !isdefined( var_1 ) )
        _id_564D( var_0, "allies", var_0, "axis", var_2, var_3, var_4 );
    else
    {
        if ( isdefined( var_3 ) )
        {
            for ( var_5 = 0; var_5 < level._id_0328.size; var_5++ )
            {
                var_6 = level._id_0328[var_5];

                if ( isdefined( var_6._id_030D["team"] ) && var_6._id_030D["team"] == var_1 && !_id_50FD( var_6, var_3 ) )
                {
                    if ( var_6 _meth_82CD() && !var_6 _meth_82E8() )
                        continue;

                    var_6 _id_5652( var_0, var_2, undefined, var_4 );
                }
            }

            return;
        }

        for ( var_5 = 0; var_5 < level._id_0328.size; var_5++ )
        {
            var_6 = level._id_0328[var_5];

            if ( isdefined( var_6._id_030D["team"] ) && var_6._id_030D["team"] == var_1 )
            {
                if ( var_6 _meth_82CD() && !var_6 _meth_82E8() )
                    continue;

                var_6 _id_5652( var_0, var_2, undefined, var_4 );
            }
        }
    }
}

_id_564D( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( level._id_8A76 )
        return;

    if ( level._id_8A76 )
    {
        if ( level._id_0328.size )
            level._id_0328[0] _id_5652( var_0, var_4, undefined, var_6 );
    }
    else
    {
        if ( isdefined( var_5 ) )
        {
            for ( var_7 = 0; var_7 < level._id_0328.size; var_7++ )
            {
                var_8 = level._id_0328[var_7];
                var_9 = var_8._id_030D["team"];

                if ( !isdefined( var_9 ) )
                    continue;

                if ( _id_50FD( var_8, var_5 ) )
                    continue;

                if ( var_8 _meth_82CD() && !var_8 _meth_82E8() )
                    continue;

                if ( var_9 == var_1 )
                {
                    var_8 _id_5652( var_0, var_4, undefined, var_6 );
                    continue;
                }

                if ( var_9 == var_3 )
                    var_8 _id_5652( var_2, var_4, undefined, var_6 );
            }

            return;
        }

        for ( var_7 = 0; var_7 < level._id_0328.size; var_7++ )
        {
            var_8 = level._id_0328[var_7];
            var_9 = var_8._id_030D["team"];

            if ( !isdefined( var_9 ) )
                continue;

            if ( var_8 _meth_82CD() && !var_8 _meth_82E8() )
                continue;

            if ( var_9 == var_1 )
            {
                var_8 _id_5652( var_0, var_4, undefined, var_6 );
                continue;
            }

            if ( var_9 == var_3 )
                var_8 _id_5652( var_2, var_4, undefined, var_6 );
        }
    }
}

_id_5655( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    foreach ( var_5 in var_1 )
        var_5 _id_5652( var_0, var_2, undefined, var_3 );
}

_id_5652( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_4 = self._id_030D["team"];

    if ( isdefined( level._id_511A ) && !self _meth_82E8() )
        return;

    if ( isdefined( level._id_0C91 ) && level._id_0C91 )
        return;

    if ( !isdefined( var_4 ) )
        return;

    if ( var_4 != "allies" && var_4 != "axis" )
        return;

    if ( self _meth_82CD() && !self _meth_82E8() )
        return;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    if ( isdefined( var_1 ) )
    {
        if ( self._id_564E == var_1 )
        {
            if ( var_2 )
            {
                if ( self._id_564C != "" )
                    self _meth_82F5( self._id_564C );

                thread _id_5654( var_0, var_4, var_3 );
            }

            return;
        }

        var_5 = isdefined( self._id_564F[var_1] );
        self._id_564F[var_1] = var_0;
        var_0 = var_1;

        if ( var_5 )
            return;
    }

    if ( self._id_564C == "" )
        thread _id_5654( var_0, var_4, var_3 );
    else
    {
        self._id_5656[self._id_5656.size] = var_0;
        self._id_5651[self._id_5651.size] = var_3;
    }
}

_id_564B( var_0, var_1 )
{
    var_2 = 2;

    if ( isdefined( game["dialog"]["lockouts"][var_0] ) )
    {
        var_2 = game["dialog"]["lockouts"][var_0];

        if ( var_2 == 0 )
            return;
    }

    if ( !isdefined( var_1._id_071B ) )
        var_1._id_071B = [];

    var_1._id_071B[var_0] = 1;
    thread _id_564A( var_0, var_1, var_2 );
}

_id_564A( var_0, var_1, var_2 )
{
    var_1 endon( "disconnect" );
    wait(var_2);
    var_1._id_071B[var_0] = undefined;
}

_id_5649( var_0, var_1 )
{
    if ( isdefined( var_1._id_071B ) )
    {
        if ( isdefined( var_1._id_071B[var_0] ) )
        {
            if ( isdefined( var_1._id_071B[var_0] == 1 ) )
                return 1;
        }
    }

    return 0;
}

_id_5654( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self notify( "playLeaderDialogOnPlayer" );
    self endon( "playLeaderDialogOnPlayer" );

    if ( isdefined( self._id_564F[var_0] ) )
    {
        var_3 = var_0;
        var_0 = self._id_564F[var_3];
        self._id_564F[var_3] = undefined;
        self._id_564E = var_3;
    }

    if ( !isdefined( game["dialog"][var_0] ) )
        return;

    if ( isai( self ) && isdefined( level._id_161B ) && isdefined( level._id_161B["leader_dialog"] ) )
        self [[ level._id_161B["leader_dialog"] ]]( var_0, var_2 );

    if ( issubstr( game["dialog"][var_0], "null" ) )
        return;

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( issubstr( var_0, "coop_gdn" ) )
            var_4 = var_0;
        else
            var_4 = "AT_anr0_" + game["dialog"][var_0];
    }
    else
        var_4 = game["voice"][var_1] + game["dialog"][var_0];

    if ( soundexists( var_4 ) )
    {
        if ( _id_5649( game["dialog"][var_0], self ) )
            return;

        self._id_564C = var_4;
        self _meth_851B( var_4 );
        _id_564B( game["dialog"][var_0], self );
    }
    else
    {

    }

    wait 2.0;
    self._id_5650 = "";
    self._id_564C = "";
    self._id_564E = "";

    if ( self._id_5656.size > 0 )
    {
        var_5 = self._id_5656[0];
        var_6 = self._id_5651[0];

        for ( var_7 = 1; var_7 < self._id_5656.size; var_7++ )
            self._id_5656[var_7 - 1] = self._id_5656[var_7];

        for ( var_7 = 1; var_7 < self._id_5651.size; var_7++ )
            self._id_5651[var_7 - 1] = self._id_5651[var_7];

        self._id_5656[var_7 - 1] = undefined;
        self._id_5651[var_7 - 1] = undefined;
        thread _id_5654( var_5, var_1, var_6 );
    }
}

_id_4041()
{
    for ( var_0 = 0; var_0 < self._id_5656.size; var_0++ )
    {
        if ( issubstr( self._id_5656[var_0], "losing" ) )
        {
            if ( self._id_04A8 == "allies" )
            {
                if ( issubstr( level._id_1216, self._id_5656[var_0] ) )
                    return self._id_5656[var_0];
                else
                    _id_A4F0::_id_0CF6( self._id_5656, self._id_5656[var_0] );
            }
            else if ( issubstr( level._id_0A7D, self._id_5656[var_0] ) )
                return self._id_5656[var_0];
            else
                _id_A4F0::_id_0CF6( self._id_5656, self._id_5656[var_0] );

            continue;
        }

        return level._id_0A7D[self._id_5656];
    }
}

_id_657C()
{
    self endon( "disconnect" );
    var_0 = [];
    var_0 = self._id_5656;

    for ( var_1 = 0; var_1 < self._id_5656.size; var_1++ )
    {
        if ( issubstr( self._id_5656[var_1], "losing" ) )
        {
            for ( var_2 = var_1; var_2 >= 0; var_2-- )
            {
                if ( !issubstr( self._id_5656[var_2], "losing" ) && var_2 != 0 )
                    continue;

                if ( var_2 != var_1 )
                {
                    _id_0D1D( var_0, self._id_5656[var_1], var_2 );
                    _id_A4F0::_id_0CF6( var_0, self._id_5656[var_1] );
                    break;
                }
            }
        }
    }

    self._id_5656 = var_0;
}

_id_38F4()
{
    self._id_564F = [];
    self._id_5656 = [];
    self._id_564C = "";
    self._id_2519 = "";
    self notify( "flush_dialog" );
}

_id_38F5( var_0 )
{
    foreach ( var_2 in level._id_0328 )
        var_2 _id_38F6( var_0 );
}

_id_0D1E( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;

    while ( var_2 < var_0.size )
    {
        if ( var_0[var_2] == var_1 )
        {
            var_2++;
            continue;
        }

        if ( var_2 != var_3 )
            var_0[var_3] = var_0[var_2];

        var_2++;
        var_3++;
    }

    while ( var_3 < var_0.size )
    {
        var_0[var_3] = undefined;
        var_3++;
    }
}

_id_38F6( var_0 )
{
    self._id_564F[var_0] = undefined;
    _id_0D1E( self._id_5656, var_0 );

    if ( self._id_5656.size == 0 )
        _id_38F4();
}

_id_9B2B()
{
    if ( self._id_030D["team"] == "spectator" )
        self _meth_82FC( "g_scriptMainMenu", game["menu_team"] );
    else
        self _meth_82FC( "g_scriptMainMenu", game["menu_class_" + self._id_030D["team"]] );
}

_id_9B3A()
{
    if ( self._id_030D["team"] == "spectator" )
        self _meth_82FC( "cg_objectiveText", "" );
    else
    {
        if ( _id_415B( "scorelimit" ) > 0 && !_id_515D() )
        {
            if ( level._id_8A76 )
            {
                self _meth_82FC( "cg_objectiveText", _id_4059( self._id_030D["team"] ) );
                return;
            }

            self _meth_82FC( "cg_objectiveText", _id_4059( self._id_030D["team"] ), _id_415B( "scorelimit" ) );
            return;
            return;
        }

        self _meth_82FC( "cg_objectiveText", _id_405A( self._id_030D["team"] ) );
    }
}

_id_7FBF( var_0, var_1 )
{
    game["strings"]["objective_" + var_0] = var_1;
}

_id_7FBE( var_0, var_1 )
{
    game["strings"]["objective_score_" + var_0] = var_1;
}

_id_7FBD( var_0, var_1 )
{
    game["strings"]["objective_hint_" + var_0] = var_1;
}

_id_405A( var_0 )
{
    return game["strings"]["objective_" + var_0];
}

_id_4059( var_0 )
{
    return game["strings"]["objective_score_" + var_0];
}

_id_4058( var_0 )
{
    return game["strings"]["objective_hint_" + var_0];
}

_id_412A()
{
    if ( !isdefined( level._id_8D3B ) || !isdefined( level._id_2B2F ) )
        return 0;

    if ( level._id_9374 )
        return level._id_9373 - level._id_8D3B - level._id_2B2F;
    else
        return gettime() - level._id_8D3B - level._id_2B2F;
}

getunpausedtimepassedraw()
{
    if ( !isdefined( level.matchdurationstarttime ) )
        return 0;

    return gettime() - level.matchdurationstarttime;
}

getgametimepassedms()
{
    var_0 = getmatchdata( "gameLengthSeconds" ) * 1000;
    var_0 += getunpausedtimepassedraw();
    return var_0;
}

getgametimepassedseconds()
{
    var_0 = getgametimepassedms();
    var_1 = int( var_0 / 1000 );
    return var_1;
}

_id_412E()
{
    return _id_412A() / _id_4129() * 60 * 1000 * 100;
}

_id_40C5()
{
    return _id_412A() / 1000;
}

_id_4022()
{
    return _id_40C5() / 60;
}

_id_4127()
{
    return _id_21A6( gettime() );
}

_id_412B()
{
    return _id_21A6( _id_412A() );
}

_id_412C()
{
    var_0 = getgametimepassedms();
    return _id_21A6( var_0 );
}

_id_21A6( var_0 )
{
    return _id_1E29( var_0 / 100 );
}

_id_1E29( var_0 )
{
    var_0 = int( var_0 );

    if ( var_0 > 32767 )
        var_0 = 32767;

    if ( var_0 < -32768 )
        var_0 = -32768;

    return var_0;
}

_id_1E28( var_0 )
{
    var_0 = int( var_0 );

    if ( var_0 > 255 )
        var_0 = 255;

    if ( var_0 < 0 )
        var_0 = 0;

    return var_0;
}

_id_1EF2()
{
    self._id_0198 = -1;
    self._id_023A = -1;
    self._id_0049 = 0;
    self._id_034E = 0;
    self._id_03DF = 0;
}

_id_5126()
{
    return self._id_03DF;
}

_id_51E5( var_0 )
{
    return isdefined( var_0 ) && var_0 != "";
}

_id_414D( var_0, var_1, var_2 )
{
    if ( var_0 > var_2 )
        return var_2;
    else if ( var_0 < var_1 )
        return var_1;
    else
        return var_0;
}

_id_584A()
{
    if ( !isdefined( self._id_030D["summary"] ) )
        return;

    if ( isai( self ) )
        return;

    var_0 = 0;

    if ( isdefined( self._id_936B["total"] ) )
        var_0 = self._id_936B["total"];

    reconevent( "script_EarnedXP: totalXP %d, timeplayed %d, score %d, challenge %d, match %d, misc %d, gamemode %s", self._id_030D["summary"]["xp"], var_0, self._id_030D["summary"]["score"], self._id_030D["summary"]["challenge"], self._id_030D["summary"]["match"], self._id_030D["summary"]["misc"], level._id_01B5 );
}

_id_72F4( var_0, var_1, var_2, var_3 )
{
    _id_72FA( "roundswitch", var_1 );
    var_0 = "scr_" + var_0 + "_roundswitch";
    level._id_7658 = var_0;
    level._id_765A = var_2;
    level._id_7659 = var_3;
    level._id_7657 = getdvarint( var_0, var_1 );

    if ( level._id_7657 < var_2 )
        level._id_7657 = var_2;
    else if ( level._id_7657 > var_3 )
        level._id_7657 = var_3;
}

_id_72F3( var_0, var_1 )
{
    _id_72FA( "roundlimit", var_1 );
}

_id_72F2( var_0, var_1 )
{
    _id_72FA( "numTeams", var_1 );
}

_id_72FB( var_0, var_1 )
{
    _id_72FA( "winlimit", var_1 );
}

_id_72F5( var_0, var_1 )
{
    _id_72FA( "scorelimit", var_1 );
}

_id_72F6( var_0, var_1 )
{
    _id_72F9( "timelimit", var_1 );
    setdvar( "ui_timelimit", _id_4129() );
}

_id_72EC( var_0, var_1 )
{
    _id_72FA( "halftime", var_1 );
    setdvar( "ui_halftime", _id_3FBE() );
}

_id_72F1( var_0, var_1 )
{
    _id_72FA( "numlives", var_1 );
}

_id_7FD3( var_0 )
{
    setdvar( "overtimeTimeLimit", var_0 );
}

_id_3D25( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5172 = 1;
    var_2._id_50A5 = 0;
    var_2._id_0152 = var_0;
    var_2._id_258E = var_1;
    return var_2;
}

_id_3D27( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5172 = 0;
    var_2._id_50A5 = 0;
    var_2._id_5199 = 1;
    var_2._id_0152 = var_0;
    var_2._id_258E = var_1;
    return var_2;
}

_id_3D22( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5172 = 0;
    var_2._id_50A5 = 0;
    var_2._id_0152 = var_0;
    var_2._id_258E = var_1;
    return var_2;
}

_id_3D24( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_5172 = 0;
    var_2._id_50A5 = 0;
    var_2._id_0152 = var_0;
    var_2._id_258E = var_1;
    return var_2;
}

_id_3D26( var_0 )
{
    return var_0._id_02E6 + ( 0, 0, 32 );
}

_id_40E5()
{
    if ( self _meth_817C() == "crouch" )
        var_0 = self._id_02E6 + ( 0, 0, 24 );
    else if ( self _meth_817C() == "prone" )
        var_0 = self._id_02E6 + ( 0, 0, 10 );
    else
        var_0 = self._id_02E6 + ( 0, 0, 32 );

    return var_0;
}

_id_3D23( var_0 )
{
    return var_0._id_02E6;
}

_id_3F73( var_0 )
{
    var_1 = getdvar( var_0 );

    if ( var_1 == "" )
        return ( 0, 0, 0 );

    var_2 = strtok( var_1, " " );

    if ( var_2.size < 3 )
        return ( 0, 0, 0 );

    setdvar( "tempR", var_2[0] );
    setdvar( "tempG", var_2[1] );
    setdvar( "tempB", var_2[2] );
    return ( getdvarfloat( "tempR" ), getdvarfloat( "tempG" ), getdvarfloat( "tempB" ) );
}

_id_8F56( var_0, var_1 )
{
    if ( var_0.size <= var_1.size )
        return var_0;

    if ( getsubstr( var_0, var_0.size - var_1.size, var_0.size ) == var_1 )
        return getsubstr( var_0, 0, var_0.size - var_1.size );

    return var_0;
}

_id_0671( var_0 )
{
    var_1 = self _meth_830B();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            continue;
        else
            self _meth_830F( var_3 );
    }
}

_id_7813()
{
    var_0 = spawnstruct();
    var_0._id_6340 = self _meth_831A();
    var_0._id_06F3 = self._id_780E;
    var_0._id_252D = self _meth_8311();
    var_1 = self _meth_830B();
    var_0._id_A2DD = [];

    foreach ( var_3 in var_1 )
    {
        if ( _func_1DF( var_3 ) == "exclusive" )
            continue;

        if ( _func_1DF( var_3 ) == "altmode" )
            continue;

        var_4 = spawnstruct();
        var_4._id_02AB = var_3;
        var_4._id_1F99 = self _meth_82F8( var_3, "right" );
        var_4._id_1F98 = self _meth_82F8( var_3, "left" );
        var_4._id_8E58 = self _meth_82F9( var_3 );

        if ( isdefined( self._id_9337 ) && self._id_9337 == var_3 )
            var_4._id_8E58--;

        var_0._id_A2DD[var_0._id_A2DD.size] = var_4;
    }

    self._id_7AB6 = var_0;
}

_id_74A4()
{
    var_0 = self._id_7AB6;
    self _meth_8319( var_0._id_6340 );

    foreach ( var_2 in var_0._id_A2DD )
    {
        _id_05C0( var_2._id_02AB, int( tablelookup( "mp/camoTable.csv", 1, self._id_57DD, 0 ) ) );
        self _meth_82F6( var_2._id_02AB, var_2._id_1F99, "right" );

        if ( issubstr( var_2._id_02AB, "akimbo" ) )
            self _meth_82F6( var_2._id_02AB, var_2._id_1F98, "left" );

        self _meth_82F7( var_2._id_02AB, var_2._id_8E58 );
    }

    foreach ( var_6, var_5 in var_0._id_06F3 )
        _id_0634( var_6, var_5._id_04D8, var_5._id_0214 );

    if ( self _meth_8311() == "none" )
    {
        var_2 = var_0._id_252D;

        if ( var_2 == "none" )
            var_2 = _id_A4F0::_id_3FFB();

        self _meth_824F( var_2 );
        self _meth_8315( var_2 );
    }
}

_id_7F65( var_0 )
{
    self._id_0169 = var_0;
    _id_7FDB( "extrascore0", var_0 );
}

_id_7F66( var_0 )
{
    self._id_016A = var_0;
    _id_7FDB( "extrascore1", var_0 );
}

_id_0634( var_0, var_1, var_2 )
{
    self._id_780E[var_0]._id_04D8 = var_1;
    self._id_780E[var_0]._id_0214 = var_2;
    self _meth_8308( var_0, var_1, var_2 );
}

_id_5107( var_0 )
{
    if ( int( var_0 ) != var_0 )
        return 1;

    return 0;
}

_id_72FA( var_0, var_1 )
{
    var_2 = "scr_" + level._id_01B5 + "_" + var_0;
    level._id_A20B[var_2] = spawnstruct();
    level._id_A20B[var_2]._id_9C4B = getdvarint( var_2, var_1 );
    level._id_A20B[var_2]._id_04D8 = "int";
    level._id_A20B[var_2]._id_6234 = "update_" + var_0;
}

_id_72F9( var_0, var_1 )
{
    var_2 = "scr_" + level._id_01B5 + "_" + var_0;
    level._id_A20B[var_2] = spawnstruct();
    level._id_A20B[var_2]._id_9C4B = getdvarfloat( var_2, var_1 );
    level._id_A20B[var_2]._id_04D8 = "float";
    level._id_A20B[var_2]._id_6234 = "update_" + var_0;
}

_id_72F8( var_0, var_1 )
{
    var_2 = "scr_" + level._id_01B5 + "_" + var_0;
    level._id_A20B[var_2] = spawnstruct();
    level._id_A20B[var_2]._id_9C4B = getdvar( var_2, var_1 );
    level._id_A20B[var_2]._id_04D8 = "string";
    level._id_A20B[var_2]._id_6234 = "update_" + var_0;
}

_id_7FD2( var_0, var_1 )
{
    var_0 = "scr_" + level._id_01B5 + "_" + var_0;
    level._id_6629[var_0] = var_1;
}

_id_415B( var_0 )
{
    var_0 = "scr_" + level._id_01B5 + "_" + var_0;

    if ( isdefined( level._id_6629 ) && isdefined( level._id_6629[var_0] ) )
        return level._id_6629[var_0];

    return level._id_A20B[var_0]._id_9C4B;
}

_id_9B9B()
{
    while ( game["state"] == "playing" )
    {
        var_0 = getarraykeys( level._id_A20B );

        foreach ( var_2 in var_0 )
        {
            if ( level._id_A20B[var_2]._id_04D8 == "string" )
                var_3 = _id_409C( var_2, level._id_A20B[var_2]._id_9C4B );
            else if ( level._id_A20B[var_2]._id_04D8 == "float" )
                var_3 = _id_3F9B( var_2, level._id_A20B[var_2]._id_9C4B );
            else
                var_3 = _id_3FD9( var_2, level._id_A20B[var_2]._id_9C4B );

            if ( var_3 != level._id_A20B[var_2]._id_9C4B )
            {
                level._id_A20B[var_2]._id_9C4B = var_3;
                level notify( level._id_A20B[var_2]._id_6234, var_3 );
            }
        }

        wait 1.0;
    }
}

_id_5191()
{
    if ( !level._id_91E4 )
        return 0;

    if ( _id_415B( "winlimit" ) != 1 && _id_415B( "roundlimit" ) != 1 )
        return 1;

    return 0;
}

_id_5103()
{
    if ( !level._id_91E4 )
        return 1;

    if ( _id_415B( "roundlimit" ) > 1 && game["roundsPlayed"] == 0 )
        return 1;

    if ( _id_415B( "winlimit" ) > 1 && game["roundsWon"]["allies"] == 0 && game["roundsWon"]["axis"] == 0 )
        return 1;

    return 0;
}

_id_513E()
{
    if ( !level._id_91E4 )
        return 1;

    if ( _id_415B( "roundlimit" ) > 1 && game["roundsPlayed"] >= _id_415B( "roundlimit" ) - 1 )
        return 1;

    if ( _id_415B( "winlimit" ) > 1 && game["roundsWon"]["allies"] >= _id_415B( "winlimit" ) - 1 && game["roundsWon"]["axis"] >= _id_415B( "winlimit" ) - 1 )
        return 1;

    return 0;
}

_id_A1C3()
{
    if ( !level._id_91E4 )
        return 1;

    if ( isdefined( level._id_64B8 ) )
        return 0;

    if ( _id_415B( "winlimit" ) == 1 && _id_4928() )
        return 1;

    if ( _id_415B( "roundlimit" ) == 1 )
        return 1;

    return 0;
}

_id_A1C1()
{
    if ( level._id_39B6 )
        return 1;

    if ( !level._id_91E4 )
        return 1;

    if ( _id_4922() || _id_4928() )
        return 1;

    return 0;
}

_id_4922()
{
    if ( _id_415B( "roundlimit" ) <= 0 )
        return 0;

    return game["roundsPlayed"] >= _id_415B( "roundlimit" );
}

_id_4925()
{
    if ( _id_515D() )
        return 0;

    if ( _id_415B( "scorelimit" ) <= 0 )
        return 0;

    if ( level._id_91E4 )
    {
        if ( game["teamScores"]["allies"] >= _id_415B( "scorelimit" ) || game["teamScores"]["axis"] >= _id_415B( "scorelimit" ) )
            return 1;
    }
    else
    {
        for ( var_0 = 0; var_0 < level._id_0328.size; var_0++ )
        {
            var_1 = level._id_0328[var_0];

            if ( isdefined( var_1._id_0390 ) && var_1._id_0390 >= _id_415B( "scorelimit" ) )
                return 1;
        }
    }

    return 0;
}

_id_4928()
{
    if ( _id_415B( "winlimit" ) <= 0 )
        return 0;

    if ( !level._id_91E4 )
        return 1;

    if ( _id_40B9( "allies" ) >= _id_415B( "winlimit" ) || _id_40B9( "axis" ) >= _id_415B( "winlimit" ) )
        return 1;

    return 0;
}

_id_40C0()
{
    if ( _id_5191() )
    {
        if ( _id_415B( "roundlimit" ) )
            return _id_415B( "roundlimit" );
        else
            return _id_415B( "winlimit" );
    }
    else
        return _id_415B( "scorelimit" );
}

_id_40B9( var_0 )
{
    return game["roundsWon"][var_0];
}

_id_515D()
{
    return level._id_62F5;
}

_id_4129()
{
    if ( _id_4E3C() )
    {
        var_0 = float( getdvar( "overtimeTimeLimit" ) );

        if ( !isdefined( var_0 ) )
            var_0 = 1;

        return var_0;
    }

    return _id_415B( "timelimit" );
}

_id_3FBE()
{
    if ( _id_4E3C() )
        return 0;

    return _id_415B( "halftime" );
}

_id_4E3C()
{
    return isdefined( game["status"] ) && _id_5169( game["status"] );
}

_id_5169( var_0 )
{
    return var_0 == "overtime" || var_0 == "overtime_halftime";
}

_id_3BE0()
{
    if ( isdefined( level._id_3BE0 ) )
        return level._id_3BE0;

    if ( level._id_91E4 )
        return level._id_4742["axis"] && level._id_4742["allies"];

    return level._id_5A4A > 1;
}

_id_3F0B( var_0 )
{
    var_1 = ( 0, 0, 0 );

    if ( !var_0.size )
        return undefined;

    foreach ( var_3 in var_0 )
        var_1 += var_3._id_02E6;

    var_5 = int( var_1[0] / var_0.size );
    var_6 = int( var_1[1] / var_0.size );
    var_7 = int( var_1[2] / var_0.size );
    var_1 = ( var_5, var_6, var_7 );
    return var_1;
}

_id_4006( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_0328 )
    {
        if ( !isalive( var_3 ) )
            continue;

        if ( level._id_91E4 && isdefined( var_0 ) )
        {
            if ( var_0 == var_3._id_030D["team"] )
                var_1[var_1.size] = var_3;

            continue;
        }

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_8347( var_0 )
{
    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5._id_0037 = 0;

    self._id_9C2C = var_0;
    _id_A4F0::_id_0585();
    self notify( "using_remote" );
}

_id_40B5()
{
    return self._id_9C2C;
}

_id_3A30( var_0 )
{
    if ( isdefined( level._id_4A36 ) )
    {
        self _meth_8329( 1 );
        return;
    }

    self _meth_8329( var_0 );
    self._id_219B = var_0;
}

_id_3A31( var_0, var_1 )
{
    wait(var_1);

    if ( isdefined( self ) )
        _id_3A30( var_0 );
}

_id_1F0D()
{
    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5._id_0037 = 1;

    self._id_9C2C = undefined;
    _id_A4F0::_id_0593();
    var_0 = self _meth_8311();

    if ( var_0 == "none" || _id_513A( var_0 ) )
        self _meth_8315( _id_A4F0::_id_3FFB() );

    _id_3A30( 0 );
    _id_6D2C();
    self notify( "stopped_using_remote" );
}

_id_6D2B()
{
    self _meth_82FB( "ui_killstreak_remote", 1 );
}

_id_6D2C()
{
    self _meth_82FB( "ui_killstreak_remote", 0 );
}

_id_3EC2()
{
    if ( isdefined( self._id_9A19 ) )
    {
        if ( self._id_9A19 == "shallow" && isdefined( level._id_83AC ) )
            return level._id_83AC;

        if ( self._id_9A19 == "deep" && isdefined( level._id_2763 ) )
            return level._id_2763;

        if ( self._id_9A19 != "none" && isdefined( level._id_83AC ) )
            return level._id_83AC;
    }

    return "none";
}

_id_51E0()
{
    return isdefined( self._id_9C2C );
}

_id_5128()
{
    return isdefined( self._id_7326 );
}

_id_5190()
{
    return isdefined( self._id_5190 ) && self._id_5190;
}

_id_7095( var_0 )
{
    if ( !isdefined( level._id_7098 ) )
        level._id_7098 = [];

    level._id_7098[var_0] = [];
}

_id_7093( var_0, var_1 )
{
    level._id_7098[var_0][level._id_7098[var_0].size] = var_1;
}

_id_7097( var_0 )
{
    var_1 = undefined;
    var_2 = [];

    foreach ( var_4 in level._id_7098[var_0] )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( var_1 ) )
        {
            var_1 = var_4;
            continue;
        }

        var_2[var_2.size] = var_4;
    }

    level._id_7098[var_0] = var_2;
    return var_1;
}

_id_05C0( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = -1;

    var_3 = 0;

    if ( isdefined( self._id_030D["toggleScopeStates"] ) && isdefined( self._id_030D["toggleScopeStates"][var_0] ) )
        var_3 = self._id_030D["toggleScopeStates"][var_0];

    if ( issubstr( var_0, "_akimbo" ) || isdefined( var_2 ) && var_2 == 1 )
    {
        if ( isagent( self ) )
            self _meth_830E( var_0, var_1, 1, -1, 0 );
        else
            self _meth_830E( var_0, var_1, 1, -1, 0, self, var_3 );
    }
    else if ( isagent( self ) )
        self _meth_830E( var_0, var_1, 0, -1, 0 );
    else
        self _meth_830E( var_0, var_1, 0, -1, 0, self, var_3 );
}

_id_05CB( var_0 )
{
    if ( isdefined( self._id_030B ) && isdefined( self._id_030B[var_0] ) )
        return 1;

    return 0;
}

_id_41F5( var_0, var_1, var_2 )
{
    if ( issubstr( var_0, "_mp" ) )
    {
        _id_05C0( var_0, 0 );
        self _meth_8331( var_0 );
        _id_063C( var_0, var_1 );
        return;
    }

    if ( issubstr( var_0, "specialty_weapon_" ) )
    {
        _id_063C( var_0, var_1 );
        return;
    }

    _id_063C( var_0, var_1, var_2 );
}

_id_063C( var_0, var_1, var_2 )
{
    self._id_030B[var_0] = 1;
    self._id_67CF[var_0] = var_0;
    self._id_67D1[var_0] = var_1;

    if ( isdefined( level._id_67CE[var_0] ) )
        self thread [[ level._id_67CE[var_0] ]]();

    var_3 = _id_8F56( var_0, "_lefthand" );

    if ( isdefined( var_2 ) )
        self _meth_82A6( var_0, !isdefined( level._id_7B3F[var_3] ), var_1, var_2 );
    else
        self _meth_82A6( var_0, !isdefined( level._id_7B3F[var_3] ), var_1 );
}

_id_067B( var_0 )
{
    self._id_030B[var_0] = undefined;
    self._id_67CF[var_0] = undefined;
    self._id_67D1[var_0] = undefined;
    self._id_67D0[var_0] = undefined;

    if ( isdefined( level._id_67D2[var_0] ) )
        self thread [[ level._id_67D2[var_0] ]]();

    var_1 = _id_8F56( var_0, "_lefthand" );
    self _meth_82A9( var_0, !isdefined( level._id_7B3F[var_1] ) );
}

_id_056B()
{
    foreach ( var_2, var_1 in self._id_030B )
    {
        if ( isdefined( level._id_67D2[var_2] ) )
            self [[ level._id_67D2[var_2] ]]();
    }

    self._id_030B = [];
    self._id_67CF = [];
    self._id_67D1 = [];
    self._id_67D0 = [];
    self _meth_82A8();
}

_id_1AC8( var_0 )
{
    return _id_0562( var_0 );
}

_id_0562( var_0 )
{
    if ( !isdefined( level._id_06B6 ) || !isdefined( level._id_06B6[var_0] ) )
        return 1;

    return self [[ level._id_06B6[var_0] ]]();
}

_id_41D9( var_0, var_1 )
{
    _id_0633( var_0, var_1 );
}

_id_0633( var_0, var_1 )
{
    self._id_06B5[var_0] = 1;

    if ( isplayer( self ) )
    {
        if ( isdefined( level._id_06B8[var_0] ) )
            self thread [[ level._id_06B8[var_0] ]]();
    }

    self _meth_82A6( var_0, !isdefined( level._id_7B22[var_0] ), var_1 );
}

_id_067A( var_0 )
{
    self._id_06B5[var_0] = undefined;

    if ( isplayer( self ) )
    {
        if ( isdefined( level._id_06B9[var_0] ) )
            self thread [[ level._id_06B9[var_0] ]]();
    }

    self _meth_82A9( var_0, !isdefined( level._id_7B22[var_0] ) );
}

_id_0566()
{
    if ( isplayer( self ) )
    {
        if ( isdefined( level._id_06B9[self._id_030D["ability"]] ) )
            self [[ level._id_06B9[self._id_030D["ability"]] ]]();
    }

    self._id_06B5 = [];
    self _meth_82A8();
}

_id_05CA( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
    {
        if ( isdefined( self._id_06B5[var_0] ) && self._id_06B5[var_0] )
            return 1;
    }
    else if ( isdefined( self._id_030D["ability"] ) && self._id_030D["ability"] == var_0 && isdefined( self._id_030D["abilityOn"] ) && self._id_030D["abilityOn"] )
        return 1;

    return 0;
}

_id_70A1( var_0, var_1 )
{
    return _id_70A4( var_0, 0, var_0.size - 1, var_1 );
}

_id_70A4( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1;
    var_5 = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = ::_id_70A2;

    if ( var_2 - var_1 >= 1 )
    {
        var_6 = var_0[var_1];

        while ( var_5 > var_4 )
        {
            while ( [[ var_3 ]]( var_0[var_4], var_6 ) && var_4 <= var_2 && var_5 > var_4 )
                var_4++;

            while ( ![[ var_3 ]]( var_0[var_5], var_6 ) && var_5 >= var_1 && var_5 >= var_4 )
                var_5--;

            if ( var_5 > var_4 )
                var_0 = _id_8FFB( var_0, var_4, var_5 );
        }

        var_0 = _id_8FFB( var_0, var_1, var_5 );
        var_0 = _id_70A4( var_0, var_1, var_5 - 1, var_3 );
        var_0 = _id_70A4( var_0, var_5 + 1, var_2, var_3 );
    }
    else
        return var_0;

    return var_0;
}

_id_70A2( var_0, var_1 )
{
    return var_0 <= var_1;
}

_id_8FFB( var_0, var_1, var_2 )
{
    var_3 = var_0[var_1];
    var_0[var_1] = var_0[var_2];
    var_0[var_2] = var_3;
    return var_0;
}

_id_066F()
{
    if ( _id_51E0() && !isdefined( self._id_3691 ) )
        thread _id_A783::_id_6CD5( self, self, self, 10000, "MOD_SUICIDE", "frag_grenade_mp", ( 0, 0, 0 ), "none", 0, 1116, 1 );
    else if ( !_id_51E0() && !isdefined( self._id_3691 ) )
        self _meth_826B();
}

_id_5186( var_0 )
{
    if ( isalive( var_0 ) && !isdefined( var_0._id_3691 ) )
        return 1;

    return 0;
}

_id_A06C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_1 ) )
        thread _id_A4F0::_id_A0B1( var_1, var_6 );

    if ( isdefined( var_2 ) )
        thread _id_A4F0::_id_A0B1( var_2, var_6 );

    if ( isdefined( var_3 ) )
        thread _id_A4F0::_id_A0B1( var_3, var_6 );

    if ( isdefined( var_4 ) )
        thread _id_A4F0::_id_A0B1( var_4, var_6 );

    if ( isdefined( var_5 ) )
        thread _id_A4F0::_id_A0B1( var_5, var_6 );

    var_6 thread _id_0677( var_0, self );
    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_0677( var_0, var_1 )
{
    self endon( "die" );

    for ( var_2 = 0.05; var_0 > 0; var_0 -= var_2 )
    {
        if ( isplayer( var_1 ) && !_id_5186( var_1 ) )
            var_1 waittill( "spawned_player" );

        if ( getdvarint( "ui_inprematch" ) )
            level waittill( "prematch_over" );

        wait(var_2);
    }

    self notify( "returned", "timeout" );
}

_id_6A3C()
{
    if ( isdefined( level.customplaydeathsound ) )
        self thread [[ level.customplaydeathsound ]]();
    else
    {
        var_0 = randomintrange( 1, 8 );

        if ( _id_A7C2::get_is_in_mech() )
            return;

        if ( self._id_04A8 == "axis" )
        {
            if ( self _meth_843A() )
                self _meth_809A( "generic_death_enemy_fm_" + var_0 );
            else
                self _meth_809A( "generic_death_enemy_" + var_0 );
        }
        else
        {
            if ( self _meth_843A() )
            {
                self _meth_809A( "generic_death_friendly_fm_" + var_0 );
                return;
            }

            self _meth_809A( "generic_death_friendly_" + var_0 );
        }
    }
}

_id_7136()
{
    if ( !isplayer( self ) )
        return 0;

    return level._id_7134 && !self._id_9C28;
}

_id_6FCD()
{
    return !level._id_64B5 || getdvarint( "xblive_privatematch" );
}

_id_59E0()
{
    return level._id_64B5 && !getdvarint( "xblive_privatematch" );
}

_id_6E98()
{
    return level._id_6E92;
}

_id_7F19( var_0, var_1, var_2, var_3 )
{

}

_id_31C1( var_0 )
{
    self endon( "altscene" );
    var_0 waittill( "death" );
    self notify( "end_altScene" );
}

_id_4013()
{
    return getdvar( "mapname" );
}

_id_3FA8()
{
    return _id_415B( "numlives" );
}

_id_0D1D( var_0, var_1, var_2 )
{
    if ( var_0.size != 0 )
    {
        for ( var_3 = var_0.size; var_3 >= var_2; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];
    }

    var_0[var_2] = var_1;
}

_id_409C( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvar( var_0, var_1 );
    return var_2;
}

_id_3FD9( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarint( var_0, var_1 );
    return var_2;
}

_id_3F9B( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarfloat( var_0, var_1 );
    return var_2;
}

_id_50DB()
{
    return isdefined( self._id_1C87 );
}

_id_5377( var_0 )
{
    return 1;
}

_id_512E()
{
    if ( isdefined( self._id_512E ) && self._id_512E == 1 )
        return 1;

    if ( isdefined( self._id_512F ) && self._id_512F == 1 )
        return 1;

    if ( isdefined( self._id_5130 ) && self._id_5130 == 1 )
        return 1;

    if ( isdefined( self._id_5132 ) && self._id_5132 == 1 )
        return 1;

    if ( isdefined( self._id_5131 ) && self._id_5131 == 1 )
        return 1;

    return 0;
}

_id_513A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "none" )
        return 0;

    if ( _id_50F0( var_0 ) )
        return 0;

    if ( _id_50C6( var_0 ) )
        return 0;

    if ( issubstr( var_0, "killstreak" ) )
        return 1;

    if ( var_0 == "airdrop_sentry_marker_mp" )
        return 1;

    var_1 = _id_4169( var_0 );
    var_2 = 0;

    foreach ( var_4 in var_1 )
    {
        if ( var_4 == "mp" )
        {
            var_2 = 1;
            break;
        }
    }

    if ( !var_2 )
        var_0 += "_mp";

    if ( _id_A7B7::_id_50AC( var_0 ) )
        return 1;

    if ( isdefined( level._id_53AC ) && isdefined( level._id_53AC[var_0] ) )
        return 1;

    var_6 = _func_1DF( var_0 );

    if ( isdefined( var_6 ) && var_6 == "exclusive" )
        return 1;

    return 0;
}

_id_50F0( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "destructible_toy":
        case "destructible_car":
        case "destructible":
        case "barrel_mp":
            return 1;
    }

    return 0;
}

_id_50C1()
{
    return getdvarint( "scr_game_high_jump", 0 );
}

isgrapplinghookgamemode()
{
    if ( _id_4FA3() )
        return 0;

    return getdvarint( "scr_game_grappling_hook", 0 );
}

isdivisionmode()
{
    return getdvarint( "scr_game_division", 0 );
}

_id_50C6( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "search_dstry_bomb_mp":
        case "search_dstry_bomb_defuse_mp":
        case "bomb_site_mp":
            return 1;
    }

    return 0;
}

_id_50FB( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "turret_minigun_mp" )
        return 1;

    if ( issubstr( var_0, "_bipod_" ) )
        return 1;

    return 0;
}

is_legacy_weapon( var_0 )
{
    switch ( var_0 )
    {
        case "iw5_dlcgun6":
        case "iw5_dlcgun6loot5":
        case "iw5_dlcgun7loot0":
        case "iw5_dlcgun7loot6":
        case "iw5_dlcgun8loot1":
            return 1;
        default:
            return 0;
    }
}

_id_514A( var_0 )
{
    if ( is_legacy_weapon( var_0 ) )
        return 0;

    if ( issubstr( var_0, "loot" ) )
        return 1;

    if ( issubstr( var_0, "atlas" ) )
        return 1;

    if ( issubstr( var_0, "gold" ) )
        return 1;

    if ( issubstr( var_0, "blops2" ) )
        return 1;

    if ( issubstr( var_0, "ghosts" ) )
        return 1;

    return 0;
}

_id_4169( var_0 )
{
    return strtok( var_0, "_" );
}

_id_4164( var_0 )
{
    var_1 = _id_3F0F( var_0 );
    var_2 = tablelookup( "mp/statstable.csv", 4, var_1, 2 );

    if ( var_2 == "" )
    {
        var_3 = _id_8F56( var_0, "_lefthand" );
        var_3 = _id_8F56( var_3, "_mp" );
        var_2 = tablelookup( "mp/statstable.csv", 4, var_3, 2 );
    }

    if ( _id_50FB( var_0 ) )
        var_2 = "weapon_mg";
    else if ( _id_513A( var_0 ) )
        var_2 = "killstreak";
    else if ( var_0 == "none" )
        var_2 = "other";
    else if ( var_2 == "" )
        var_2 = "other";

    return var_2;
}

_id_415D( var_0 )
{
    var_0 = _id_3F0F( var_0 );

    if ( !isdefined( level._id_A2CA[var_0] ) )
    {
        var_1 = [];

        for ( var_2 = 0; var_2 <= 29; var_2++ )
        {
            var_3 = tablelookup( "mp/statsTable.csv", 4, var_0, 11 + var_2 );

            if ( var_3 == "" )
                break;

            var_1[var_1.size] = var_3;
        }

        level._id_A2CA[var_0] = var_1;
    }

    return level._id_A2CA[var_0];
}

_id_415F( var_0, var_1 )
{
    var_0 = _id_3F0F( var_0 );
    return tablelookup( "mp/statsTable.csv", 4, var_0, 11 + var_1 );
}

_id_3F0F( var_0, var_1 )
{
    var_2 = _id_4169( var_0 );
    var_3 = "";

    if ( var_2[0] == "iw5" || var_2[0] == "iw6" || var_2[0] == "s1" )
        var_3 = var_2[0] + "_" + var_2[1];
    else if ( var_2[0] == "alt" )
        var_3 = var_2[1] + "_" + var_2[2];
    else if ( var_2.size > 1 && ( var_2[1] == "grenade" || var_2[1] == "marker" ) )
        var_3 = var_2[0] + "_" + var_2[1];
    else
        var_3 = var_2[0];

    var_4 = "";

    if ( isdefined( var_1 ) && var_1 == 1 )
        var_4 = tablelookup( "mp/statsTable.csv", 4, var_3, 59 );

    if ( var_4 != "" )
        return "iw5_" + var_4;
    else
        return var_3;
}

_id_3826( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3] == "a" && var_0[var_3 + 1] == "k" && var_0[var_3 + 2] == "i" && var_0[var_3 + 3] == "m" && var_0[var_3 + 4] == "b" && var_0[var_3 + 5] == "o" )
        {
            var_2 = var_3;
            break;
        }
    }

    var_0 = getsubstr( var_0, 0, var_2 ) + getsubstr( var_0, var_2 + 6, var_0.size );

    if ( var_1 )
        var_0 += "_akimbo";

    return var_0;
}

_id_6DD9( var_0, var_1 )
{
    playsoundatpos( var_1, var_0 );
}

_id_5761( var_0, var_1 )
{
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
        var_2 *= 10;

    var_4 = var_0 * var_2;
    var_4 = int( var_4 );
    var_4 /= var_2;
    return var_4;
}

_id_764E( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "nearest";

    var_3 = 1;

    for ( var_4 = 0; var_4 < var_1; var_4++ )
        var_3 *= 10;

    var_5 = var_0 * var_3;

    if ( var_2 == "up" )
        var_6 = ceil( var_5 );
    else if ( var_2 == "down" )
        var_6 = floor( var_5 );
    else
        var_6 = var_5 + 0.5;

    var_5 = int( var_6 );
    var_5 /= var_3;
    return var_5;
}

_id_6CA2( var_0 )
{
    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2._id_1F0F == var_0 )
            return var_2;
    }

    return undefined;
}

_id_8F54( var_0 )
{
    var_1 = strtok( var_0, "." );
    var_2 = int( var_1[0] );

    if ( isdefined( var_1[1] ) )
    {
        var_3 = 1;

        for ( var_4 = 0; var_4 < var_1[1].size; var_4++ )
            var_3 *= 0.1;

        var_2 += int( var_1[1] ) * var_3;
    }

    return var_2;
}

_id_7FFF( var_0 )
{
    self _meth_80BF();

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 != var_0 )
        {
            self _meth_800B( var_2 );
            continue;
        }

        self _meth_800A( var_2 );
    }
}

_id_7FFE()
{
    self _meth_80C0();

    foreach ( var_1 in level._id_0328 )
        self _meth_800B( var_1 );
}

_id_5948( var_0 )
{
    self _meth_80BF();
    thread _id_0681( var_0 );
}

_id_0681( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        foreach ( var_2 in level._id_0328 )
        {
            if ( var_2._id_04A8 == var_0 )
            {
                self _meth_800A( var_2 );
                continue;
            }

            self _meth_800B( var_2 );
        }

        level waittill( "joined_team" );
    }
}

_id_593C( var_0 )
{
    self _meth_80BF();
    thread _id_067E( var_0 );
}

_id_067E( var_0 )
{
    self endon( "death" );
    var_1 = var_0._id_04A8;

    for (;;)
    {
        if ( level._id_91E4 )
        {
            foreach ( var_3 in level._id_0328 )
            {
                if ( var_3._id_04A8 != var_1 )
                {
                    self _meth_800A( var_3 );
                    continue;
                }

                self _meth_800B( var_3 );
            }
        }
        else
        {
            foreach ( var_3 in level._id_0328 )
            {
                if ( var_3 != var_0 )
                {
                    self _meth_800A( var_3 );
                    continue;
                }

                self _meth_800B( var_3 );
            }
        }

        level waittill( "joined_team" );
    }
}

_id_403D()
{
    var_0 = getmatchdata( "lifeCount" );

    if ( var_0 < level._id_5A3D )
    {
        setmatchdata( "lifeCount", var_0 + 1 );
        return var_0;
    }
    else
        return level._id_5A3D - 1;
}

_id_4DBD()
{
    if ( !isdefined( game["flags"] ) )
        game["flags"] = [];
}

_id_3BDD( var_0, var_1 )
{
    game["flags"][var_0] = var_1;
}

_id_3BDB( var_0 )
{
    return game["flags"][var_0];
}

_id_3BDE( var_0 )
{
    game["flags"][var_0] = 1;
    level notify( var_0 );
}

_id_3BDC( var_0 )
{
    game["flags"][var_0] = 0;
}

_id_3BDF( var_0 )
{
    while ( !_id_3BDB( var_0 ) )
        level waittill( var_0 );
}

_id_50CA( var_0 )
{
    var_1 = "MOD_RIFLE_BULLET MOD_PISTOL_BULLET MOD_HEAD_SHOT";

    if ( issubstr( var_1, var_0 ) )
        return 1;

    return 0;
}

_id_5109( var_0, var_1, var_2 )
{
    return isdefined( var_2 ) && isplayer( var_2 ) && var_2 _id_05CB( "specialty_bulletpenetration" ) && isdefined( var_1 ) && _id_50CA( var_1 );
}

_id_4DED()
{
    if ( !isdefined( level._id_56D9 ) )
        level._id_56D9 = [];
}

_id_56D8( var_0, var_1 )
{
    level._id_56D9[var_0] = var_1;
}

_id_56D6( var_0 )
{
    return level._id_56D9[var_0];
}

_id_56DA( var_0 )
{
    level._id_56D9[var_0] = 1;
    level notify( var_0 );
}

_id_56D7( var_0 )
{
    level._id_56D9[var_0] = 0;
    level notify( var_0 );
}

_id_56DB( var_0 )
{
    while ( !_id_56D6( var_0 ) )
        level waittill( var_0 );
}

_id_56DC( var_0 )
{
    while ( _id_56D6( var_0 ) )
        level waittill( var_0 );
}

_id_4FA3()
{
    if ( !isdefined( level._id_9E4D ) || level._id_9E4D == 0 )
        return 0;

    return 1;
}

_id_4DBE()
{
    if ( !isdefined( level._id_422E ) )
    {
        level._id_422E["killstreakTable"] = spawnstruct();
        level._id_422E["killstreakTable"]._id_66BA = "mp/killstreakTable.csv";
        level._id_422E["killstreakTable"]._id_4C3E = 0;
        level._id_422E["killstreakTable"]._id_72A8 = 1;
        level._id_422E["killstreakTable"]._id_603A = 2;
        level._id_422E["killstreakTable"]._id_28AE = 3;
        level._id_422E["killstreakTable"]._id_0866 = 4;
        level._id_422E["killstreakTable"]._id_3009 = 5;
        level._id_422E["killstreakTable"]._id_8894 = 6;
        level._id_422E["killstreakTable"]._id_3008 = 7;
        level._id_422E["killstreakTable"]._id_0A6A = 8;
        level._id_422E["killstreakTable"]._id_6532 = 9;
        level._id_422E["killstreakTable"]._id_3292 = 10;
        level._id_422E["killstreakTable"]._id_A2B4 = 11;
        level._id_422E["killstreakTable"]._id_7887 = 12;
        level._id_422E["killstreakTable"]._id_4B27 = 13;
        level._id_422E["killstreakTable"]._id_65ED = 14;
        level._id_422E["killstreakTable"]._id_65EE = 15;
        level._id_422E["killstreakTable"]._id_65EF = 16;
        level._id_422E["killstreakTable"]._id_65F0 = 17;
        level._id_422E["killstreakTable"]._id_2D93 = 18;
        level._id_422E["killstreakTable"]._id_9A1C = 19;
    }
}

_id_5138()
{
    if ( _id_4FA3() )
        return 0;

    return _id_50F6() || _id_50AB();
}

_id_50F6()
{
    if ( self._id_04A8 == "spectator" )
        return 0;

    if ( _id_4FA3() )
        return 0;

    if ( level._id_91E4 )
        return level._id_91E7[self._id_04A8] || isdefined( self._id_3086 ) && self._id_3086;
    else
        return isdefined( level._id_308B ) && level._id_308B != self || isdefined( self._id_3086 ) && self._id_3086;
}

_id_50F7()
{
    if ( self._id_04A8 == "spectator" )
        return 0;

    if ( _id_4FA3() )
        return 0;

    if ( level._id_91E4 )
        return level._id_91E7[self._id_04A8];
    else
        return isdefined( level._id_308B ) && level._id_308B != self;
}

_id_50AB()
{
    return 0;
}

_id_515C()
{
    if ( self._id_04A8 == "spectator" )
        return 0;

    return isdefined( self._id_6268 );
}

_id_4089( var_0 )
{
    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2._id_444D == var_0 )
            return var_2;
    }

    return undefined;
}

_id_91F3( var_0, var_1, var_2, var_3 )
{
    if ( level._id_46C7 )
        return;

    foreach ( var_5 in level._id_0328 )
    {
        if ( isdefined( var_2 ) && var_5._id_04A8 != var_2 )
            continue;

        if ( !isplayer( var_5 ) )
            continue;

        var_5 thread _id_A79C::_id_6C6C( var_0, var_1, var_3 );
    }
}

_id_50CE( var_0 )
{
    switch ( _id_4164( var_0 ) )
    {
        case "weapon_smg":
        case "weapon_assault":
        case "weapon_riot":
        case "weapon_sniper":
        case "weapon_lmg":
        case "weapon_shotgun":
        case "weapon_heavy":
        case "weapon_special":
            return 1;
        default:
            return 0;
    }
}

_id_50CF( var_0 )
{
    switch ( _id_4164( var_0 ) )
    {
        case "weapon_projectile":
        case "weapon_pistol":
        case "weapon_machine_pistol":
        case "weapon_sec_special":
            return 1;
        default:
            return 0;
    }
}

_id_3FFA( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in level._id_0328 )
    {
        if ( isdefined( var_0 ) && var_3._id_04A8 != var_0 )
            continue;

        if ( !_id_5186( var_3 ) && !var_3 _id_A7A7::_id_5A5F() )
            continue;

        var_1 = var_3;
    }

    return var_1;
}

_id_4091()
{
    var_0 = [];

    foreach ( var_2 in level._id_0328 )
    {
        if ( !_id_5186( var_2 ) && !var_2 _id_A7A7::_id_5A5F() )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_A0E4( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_2 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0.05;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    for (;;)
    {
        if ( self._id_01E7 != self._id_0275 )
            var_2 = 0;
        else
            var_2 += var_1;

        wait(var_1);

        if ( self._id_01E7 == self._id_0275 && var_2 >= var_0 )
            break;
    }

    return;
}

_id_0E03( var_0, var_1 )
{
    var_2 = var_0;
    var_1 = _id_3F0F( var_1, 1 );

    if ( var_1 != "iw5_dlcgun6loot5" && _id_514A( var_1 ) )
        var_1 = _id_A781::_id_3F0E( var_1 );

    if ( isdefined( level._id_0E01[var_1] ) && isdefined( level._id_0E01[var_1][var_0] ) )
        var_2 = level._id_0E01[var_1][var_0];
    else
    {
        var_3 = tablelookup( "mp/statstable.csv", 4, var_1, 2 );

        if ( isdefined( level._id_0E01[var_3] ) && isdefined( level._id_0E01[var_3][var_0] ) )
            var_2 = level._id_0E01[var_3][var_0];
    }

    return var_2;
}

_id_0E05( var_0 )
{
    var_1 = undefined;

    if ( isdefined( level._id_0E00[var_0] ) )
        var_1 = level._id_0E00[var_0];

    return var_1;
}

_id_50BB( var_0, var_1 )
{
    var_2 = strtok( var_0, "_" );
    return _id_50BC( var_2, var_1 );
}

_id_50BC( var_0, var_1 )
{
    var_2 = 0;

    if ( var_0.size && isdefined( var_1 ) )
    {
        var_3 = 0;

        if ( var_0[0] == "alt" )
            var_3 = 1;

        if ( var_0.size >= 3 + var_3 && ( var_0[var_3] == "iw5" || var_0[var_3] == "iw6" ) )
        {
            if ( weaponclass( var_0[var_3] + "_" + var_0[var_3 + 1] + "_" + var_0[var_3 + 2] ) == "sniper" )
                var_2 = var_0[var_3 + 1] + "scope" == var_1;
        }
    }

    return var_2;
}

_id_4160( var_0 )
{
    var_1 = getweaponattachments( var_0 );

    foreach ( var_4, var_3 in var_1 )
        var_1[var_4] = _id_0E02( var_3 );

    return var_1;
}

_id_3F07()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 4 ); var_2 != ""; var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 4 ) )
    {
        if ( !_id_A4F0::_id_0CE4( var_0, var_2 ) )
            var_0[var_0.size] = var_2;

        var_1++;
    }

    return var_0;
}

_id_3F08()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 3 ); var_2 != ""; var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 3 ) )
    {
        var_0[var_0.size] = var_2;
        var_1++;
    }

    return var_0;
}

_id_1876()
{
    var_0 = _id_3F08();
    level._id_0E04 = [];

    foreach ( var_2 in var_0 )
    {
        var_3 = tablelookup( "mp/attachmentTable.csv", 3, var_2, 4 );

        if ( var_2 == var_3 )
            continue;

        level._id_0E04[var_2] = var_3;
    }

    var_5 = [];
    var_6 = 1;

    for ( var_7 = tablelookupbyrow( "mp/attachmentmap.csv", var_6, 0 ); var_7 != ""; var_7 = tablelookupbyrow( "mp/attachmentmap.csv", var_6, 0 ) )
    {
        var_5[var_5.size] = var_7;
        var_6++;
    }

    var_8 = [];
    var_9 = 1;

    for ( var_10 = tablelookupbyrow( "mp/attachmentmap.csv", 0, var_9 ); var_10 != ""; var_10 = tablelookupbyrow( "mp/attachmentmap.csv", 0, var_9 ) )
    {
        var_8[var_10] = var_9;
        var_9++;
    }

    level._id_0E01 = [];

    foreach ( var_7 in var_5 )
    {
        foreach ( var_15, var_13 in var_8 )
        {
            var_14 = tablelookup( "mp/attachmentmap.csv", 0, var_7, var_13 );

            if ( var_14 == "" )
                continue;

            if ( !isdefined( level._id_0E01[var_7] ) )
                level._id_0E01[var_7] = [];

            level._id_0E01[var_7][var_15] = var_14;
        }
    }

    level._id_0E00 = [];

    foreach ( var_18 in var_0 )
    {
        var_19 = tablelookup( "mp/attachmentTable.csv", 3, var_18, 8 );

        if ( var_19 == "" )
            continue;

        level._id_0E00[var_18] = var_19;
    }
}

_id_0E02( var_0 )
{
    if ( isdefined( level._id_0E04[var_0] ) )
        var_0 = level._id_0E04[var_0];

    return var_0;
}

_id_0603( var_0 )
{
    objective_delete( var_0 );

    if ( !isdefined( level._id_7263 ) )
    {
        level._id_7263 = [];
        level._id_7263[0] = var_0;
    }
    else
        level._id_7263[level._id_7263.size] = var_0;
}

_id_9402()
{
    var_0 = getentarray( "trigger_hurt", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( self _meth_80A9( var_2 ) )
            return 1;
    }

    var_4 = getentarray( "radiation", "targetname" );

    foreach ( var_2 in var_4 )
    {
        if ( self _meth_80A9( var_2 ) )
            return 1;
    }

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( _id_4013() == "mp_torqued" )
        {
            if ( isdefined( level.hordeavalanche ) && level.hordeavalanche && isdefined( level.dyneventavalanche._id_8D76 ) && level.dyneventavalanche._id_8D76 != "post_avalanche" )
            {
                var_7 = getentarray( "quake_kill_volume01", "targetname" );

                foreach ( var_9 in var_7 )
                {
                    if ( self _meth_80A9( var_9 ) )
                        return 1;
                }
            }
        }
        else if ( _id_4013() == "mp_lost" )
        {
            foreach ( var_12 in level.hordekilltriggers )
            {
                if ( self _meth_80A9( var_12 ) )
                    return 1;
            }
        }
    }

    if ( getdvar( "g_gametype" ) == "hp" && isdefined( level._id_A3D4 ) && isdefined( level._id_A3D4._id_974D ) && self _meth_80A9( level._id_A3D4._id_974D ) )
        return 1;

    return 0;
}

_id_802B( var_0 )
{
    if ( var_0 )
        self _meth_8186( 0, 110, 512, 4096, 6, 1.8 );
    else
        self _meth_8186( 0, 0, 512, 512, 4, 0 );
}

_id_53AF( var_0, var_1, var_2 )
{
    var_3 = spawn( "trigger_radius", var_0, 0, var_1, var_2 );

    for (;;)
    {
        var_3 waittill( "trigger", var_4 );

        if ( !isplayer( var_4 ) )
            continue;

        var_4 _meth_826B();
    }
}

_id_3780( var_0, var_1, var_2 )
{
    var_3 = cos( var_2 );
    var_4 = anglestoforward( var_0._id_0041 );
    var_5 = var_1._id_02E6 - var_0._id_02E6;
    var_4 *= ( 1, 1, 0 );
    var_5 *= ( 1, 1, 0 );
    var_5 = vectornormalize( var_5 );
    var_4 = vectornormalize( var_4 );
    var_6 = vectordot( var_5, var_4 );

    if ( var_6 >= var_3 )
        return 1;
    else
        return 0;
}

_id_2DD8( var_0, var_1, var_2, var_3 )
{
    var_4 = int( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_2DE2( var_0, var_1, var_2, var_3 )
{
    var_4 = int( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_7FF5( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( self._id_7265 ) )
        self._id_7265 = var_0;
    else
        self._id_7265 += var_0;

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( self._id_7265 ) && var_1 < self._id_7265 )
            var_1 = self._id_7265;

        var_2 = 100 - var_1;
    }
    else
        var_2 = 100 - self._id_7265;

    if ( var_2 < 0 )
        var_2 = 0;

    if ( var_2 > 100 )
        var_2 = 100;

    if ( var_2 == 100 )
    {
        self _meth_82E3();
        return;
    }

    self _meth_82E2( var_2 );
}

_id_1E5D( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_0[var_4];
    }

    return var_1;
}

_id_623D( var_0 )
{
    self notify( "notusablejoiningplayers" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self endon( "notusablejoiningplayers" );

    for (;;)
    {
        level waittill( "player_spawned", var_1 );

        if ( isdefined( var_1 ) && var_1 != var_0 )
            self _meth_800B( var_1 );
    }
}

_id_51B7( var_0, var_1 )
{
    return getsubstr( var_0, 0, var_1.size ) == var_1;
}

_id_2AF0()
{
    level._id_53A3 = 1;
}

_id_3106()
{
    level._id_53A3 = undefined;
}

_id_9C47( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        var_2 = var_0;
    else
    {
        var_3 = self._id_030D["killstreaks"];
        var_2 = var_3[self._id_539A]._id_8F20;
    }

    if ( isdefined( level._id_53A3 ) && level._id_53A3 )
        return 0;

    if ( isdefined( self._id_53A3 ) && self._id_53A3 )
        return 0;

    if ( !self _meth_8341() && _id_518E( var_2 ) )
        return 0;

    if ( _id_51E0() || _id_5128() )
        return 0;

    if ( isdefined( self._id_7C69 ) )
        return 0;

    if ( _id_849F( var_2 ) && level._id_539F )
    {
        var_4 = 0;

        if ( isdefined( level._id_6F04 ) )
            var_4 = ( gettime() - level._id_6F04 ) / 1000;

        if ( var_4 < level._id_539F )
        {
            var_5 = int( level._id_539F - var_4 + 0.5 );

            if ( !var_5 )
                var_5 = 1;

            if ( !( isdefined( var_1 ) && var_1 ) )
                self _meth_826E( &"MP_UNAVAILABLE_FOR_N", var_5 );

            return 0;
        }
    }

    if ( _id_50F6() && ( !isdefined( level.iszombiegame ) || !level.iszombiegame ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
        {
            if ( isdefined( level._id_3090 ) && level._id_3090 > 0 )
                self _meth_826E( &"MP_UNAVAILABLE_FOR_N_WHEN_EMP", level._id_3090 );
            else if ( isdefined( self._id_3081 ) && int( ( self._id_3081 - gettime() ) / 1000 ) > 0 )
                self _meth_826E( &"MP_UNAVAILABLE_FOR_N", int( ( self._id_3081 - gettime() ) / 1000 ) );
        }

        return 0;
    }

    if ( self _meth_8342() && ( _id_518E( var_2 ) || _id_50D9( var_2 ) ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
            self _meth_826E( &"MP_UNAVAILABLE_USING_TURRET" );

        return 0;
    }

    if ( _id_512E() )
        return 0;

    if ( isdefined( self._id_024D ) && !_id_05CB( "specialty_finalstand" ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
            self _meth_826E( &"MP_UNAVILABLE_IN_LASTSTAND" );

        return 0;
    }

    if ( !_id_A4F0::_id_5204() )
        return 0;

    return 1;
}

_id_518E( var_0 )
{
    switch ( var_0 )
    {
        case "mp_dam":
        case "mp_detroit":
        case "mp_levity":
        case "mp_solar":
        case "mp_terrace":
        case "missile_strike":
        case "orbital_strike":
        case "orbital_strike_laser":
        case "orbital_strike_chem":
        case "orbital_strike_laser_chem":
        case "orbital_strike_cluster":
        case "orbital_strike_drone":
        case "orbitalsupport":
        case "mp_recreation":
        case "recon_ugv":
        case "warbird":
        case "assault_ugv":
        case "mp_bigben2":
        case "mp_seoul2":
            return 1;
        default:
            return 0;
    }
}

_id_50D9( var_0 )
{
    switch ( var_0 )
    {
        case "sentry":
        case "deployable_ammo":
        case "deployable_grenades":
        case "deployable_exp_ammo":
        case "remote_mg_sentry_turret":
            return 1;
        default:
            return 0;
    }
}

_id_849F( var_0 )
{
    switch ( var_0 )
    {
        case "missile_strike":
        case "orbital_strike_laser":
        case "orbitalsupport":
        case "warbird":
        case "strafing_run_airstrike":
            return 1;
    }

    return 0;
}

_id_5135( var_0 )
{
    switch ( var_0 )
    {
        case "deployable_ammo":
        case "deployable_grenades":
        case "deployable_juicebox":
        case "placeable_barrier":
        case "agent":
        case "recon_agent":
        case "high_value_target":
        case "eyes_on":
        case "speed_boost":
        case "refill_grenades":
            return 0;
        default:
            return 1;
    }
}

_id_5136( var_0 )
{
    return _id_5135( var_0 ) && !_id_5108( var_0 );
}

_id_5108( var_0 )
{
    switch ( var_0 )
    {
        case "missile_strike":
        case "orbital_strike":
        case "orbital_strike_laser":
        case "orbital_strike_chem":
        case "orbital_strike_laser_chem":
        case "orbital_strike_cluster":
        case "orbital_strike_drone":
        case "orbitalsupport":
        case "airdrop_sentry_minigun":
        case "airdrop_assault":
        case "airdrop_support":
        case "orbital_carepackag":
            return 0;
        default:
            return 1;
    }
}

_id_50B2( var_0 )
{
    var_1 = _id_3FDF( var_0 );

    if ( !isdefined( var_1 ) )
        return 0;

    if ( int( var_1 ) == 1 )
        return 1;

    return 0;
}

_id_3FF3( var_0 )
{
    return tablelookuprownum( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0 );
}

_id_3FEC( var_0 )
{
    var_1 = tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_4C3E );

    if ( var_1 == "" )
        var_2 = -1;
    else
        var_2 = int( var_1 );

    return var_2;
}

_id_3FF2( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_72A8 );
}

_id_3FF0( var_0 )
{
    return tablelookupistring( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_603A );
}

_id_3FE2( var_0 )
{
    return tablelookupistring( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_28AE );
}

_id_3FEE( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_0866 );
}

_id_3FE6( var_0 )
{
    return tablelookupistring( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_3009 );
}

_id_3FF5( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_8894 );
}

_id_3FE5( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_3008 );
}

_id_3FDE( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_0A6A );
}

_id_3FE7( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_3221 );
}

_id_3FE8( var_0 )
{
    return int( tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_3292 ) );
}

_id_3FF7( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1.size > 0 )
    {
        var_2 = _id_05B6( var_0, var_1 );

        if ( isdefined( var_2 ) )
            return var_2;
    }

    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_A2B4 );
}

_id_05B6( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
    {
        switch ( var_3 )
        {
            case "warbird_ai_attack":
            case "warbird_ai_follow":
                if ( issubstr( var_0, "warbird" ) )
                    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, "uav", level._id_422E["killstreakTable"]._id_A2B4 );

                continue;
            case "assault_ugv_ai":
                if ( issubstr( var_0, "ugv" ) )
                    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, "uav", level._id_422E["killstreakTable"]._id_A2B4 );

                continue;
            case "turretheadenergy_mp":
            case "turretheadrocket_mp":
            case "turretheadmg_mp":
                if ( issubstr( var_0, "ripped_turret" ) )
                    return var_3;

                continue;
            default:
                continue;
        }
    }
}

_id_3FF4( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_7887 );
}

_id_3FEB( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_4B27 );
}

_id_3FF1( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_65ED );
}

_id_3FE4( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_2D93 );
}

_id_3FF6( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_9A1C );
}

_id_3FDF( var_0 )
{
    return tablelookup( level._id_422E["killstreakTable"]._id_66BA, level._id_422E["killstreakTable"]._id_72A8, var_0, level._id_422E["killstreakTable"]._id_09E4 );
}

_id_2508( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = var_0;

    if ( isdefined( level._id_4813 ) )
        var_1 += level._id_4813.size;

    if ( isdefined( level._id_57B5 ) )
        var_1 += level._id_57B5.size;

    if ( isdefined( level._id_99E7 ) )
        var_1 += level._id_99E7.size;

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( isdefined( level._id_392B ) )
            var_1 += level._id_392B.size;

        if ( isdefined( level._id_94EA ) )
            var_1 += level._id_94EA.size;
    }

    return var_1;
}

_id_5A56()
{
    return 8;
}

_id_4C3C()
{
    level._id_3692++;
}

_id_2760()
{
    level._id_3692--;

    if ( level._id_3692 < 0 )
        level._id_3692 = 0;
}

_id_575E( var_0 )
{
    return 1.07;
}

_id_0AB0()
{
    if ( !_func_2D7() && getdvarint( "scr_skipclasschoice", 0 ) > 0 )
        return 0;

    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level._id_01B5, 4 ) );
    return var_0;
}

_id_0AA2()
{
    if ( !_func_2D7() && getdvarint( "scr_skipclasschoice", 0 ) > 0 )
        return 0;

    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level._id_01B5, 5 ) );
    return var_0;
}

_id_850A()
{
    if ( _id_0AB0() || _id_0AA2() )
        return 0;

    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level._id_01B5, 7 ) );
    return var_0;
}

_id_50C9( var_0, var_1 )
{
    return 0;
}

_id_7F39( var_0 )
{
    var_1 = getmatchrulesdata( "commonOption", "timeLimit" );
    setdynamicdvar( "scr_" + level._id_01B5 + "_timeLimit", var_1 );
    _id_72F6( level._id_01B5, var_1 );
    var_2 = getmatchrulesdata( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_" + level._id_01B5 + "_scoreLimit", var_2 );
    _id_72F5( level._id_01B5, var_2 );
    setdynamicdvar( "scr_game_matchstarttime", getmatchrulesdata( "commonOption", "preMatchTimer" ) );
    setdynamicdvar( "scr_game_roundstarttime", getmatchrulesdata( "commonOption", "preRoundTimer" ) );
    setdynamicdvar( "scr_game_suicidespawndelay", getmatchrulesdata( "commonOption", "suicidePenalty" ) );
    setdynamicdvar( "scr_team_teamkillspawndelay", getmatchrulesdata( "commonOption", "teamKillPenalty" ) );
    setdynamicdvar( "scr_team_teamkillkicklimit", getmatchrulesdata( "commonOption", "teamKillKickLimit" ) );
    var_3 = getmatchrulesdata( "commonOption", "numLives" );
    setdynamicdvar( "scr_" + level._id_01B5 + "_numLives", var_3 );
    _id_72F1( level._id_01B5, var_3 );
    setdynamicdvar( "scr_player_maxhealth", getmatchrulesdata( "commonOption", "maxHealth" ) );
    setdynamicdvar( "scr_player_healthregentime", getmatchrulesdata( "commonOption", "healthRegen" ) );
    level._id_59E3 = 0;
    level._id_59E8 = 0;
    setdynamicdvar( "scr_game_spectatetype", getmatchrulesdata( "commonOption", "spectateModeAllowed" ) );
    setdynamicdvar( "scr_game_lockspectatorpov", getmatchrulesdata( "commonOption", "spectateModePOV" ) );
    setdynamicdvar( "scr_game_allowkillcam", getmatchrulesdata( "commonOption", "showKillcam" ) );
    setdynamicdvar( "scr_game_forceuav", getmatchrulesdata( "commonOption", "radarAlwaysOn" ) );
    setdynamicdvar( "scr_" + level._id_01B5 + "_playerrespawndelay", getmatchrulesdata( "commonOption", "respawnDelay" ) );
    setdynamicdvar( "scr_" + level._id_01B5 + "_waverespawndelay", getmatchrulesdata( "commonOption", "waveRespawnDelay" ) );
    setdynamicdvar( "scr_player_forcerespawn", getmatchrulesdata( "commonOption", "forceRespawn" ) );
    level._id_59E2 = getmatchrulesdata( "commonOption", "allowCustomClasses" );
    level._id_2558 = getmatchrulesdata( "commonOption", "classPickCount" );
    setdynamicdvar( "scr_game_high_jump", getmatchrulesdata( "commonOption", "highJump" ) );
    setdynamicdvar( "jump_slowdownEnable", getdvar( "scr_game_high_jump" ) == "0" );
    setdynamicdvar( "scr_game_hardpoints", 1 );
    setdynamicdvar( "scr_game_perks", 1 );
    setdynamicdvar( "g_hardcore", getmatchrulesdata( "commonOption", "hardcoreModeOn" ) );
    setdynamicdvar( "scr_thirdPerson", getmatchrulesdata( "commonOption", "forceThirdPersonView" ) );
    setdynamicdvar( "camera_thirdPerson", getmatchrulesdata( "commonOption", "forceThirdPersonView" ) );
    setdynamicdvar( "scr_game_onlyheadshots", getmatchrulesdata( "commonOption", "headshotsOnly" ) );

    if ( !isdefined( var_0 ) )
        setdynamicdvar( "scr_team_fftype", getmatchrulesdata( "commonOption", "ffType" ) );

    setdynamicdvar( "scr_game_killstreakdelay", getmatchrulesdata( "commonOption", "streakGracePeriod" ) );
    level._id_2FED = getmatchrulesdata( "commonOption", "dynamicEventsType" );
    level._id_598E = getmatchrulesdata( "commonOption", "mapStreaksDisabled" );
    level._id_1CA7 = getmatchrulesdata( "commonOption", "chatterDisabled" );
    level._id_0C91 = getmatchrulesdata( "commonOption", "announcerDisabled" );
    level._id_59E7 = getmatchrulesdata( "commonOption", "switchTeamDisabled" );
    level._id_43FD = getmatchrulesdata( "commonOption", "grenadeGracePeriod" );

    if ( getmatchrulesdata( "commonOption", "hardcoreModeOn" ) )
    {
        setdynamicdvar( "scr_team_fftype", 1 );
        setdynamicdvar( "scr_player_maxhealth", 30 );
        setdynamicdvar( "scr_player_healthregentime", 0 );
        setdynamicdvar( "scr_player_respawndelay", 10 );
        setdynamicdvar( "scr_game_allowkillcam", 0 );
        setdynamicdvar( "scr_game_forceuav", 0 );
    }

    setdvar( "bg_compassShowEnemies", getdvar( "scr_game_forceuav" ) );
}

_id_7304()
{
    for (;;)
    {
        level waittill( "host_migration_begin" );
        [[ level._id_4DDD ]]();
    }
}

_id_7306( var_0 )
{
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        var_0 endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_begin" );

        if ( isdefined( self._id_560A ) )
            self _meth_82D7( self._id_560A, 0 );
    }
}

_id_4015( var_0, var_1 )
{
    var_2 = [];
    var_2["loadoutPrimary"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "weapon" );
    var_2["loadoutPrimaryAttachment"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "attachment", 0 );
    var_2["loadoutPrimaryAttachment2"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "attachment", 1 );
    var_2["loadoutPrimaryAttachment3"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "attachment", 2 );
    var_2["loadoutPrimaryCamo"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "camo" );
    var_2["loadoutPrimaryReticle"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "reticle" );
    var_2["loadoutSecondary"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "weapon" );
    var_2["loadoutSecondaryAttachment"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "attachment", 0 );
    var_2["loadoutSecondaryAttachment2"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "attachment", 1 );
    var_2["loadoutSecondaryAttachment3"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "attachment", 2 );
    var_2["loadoutSecondaryCamo"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "camo" );
    var_2["loadoutSecondaryReticle"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "reticle" );
    var_2["loadoutEquipment"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "equipmentSetups", 0, "equipment" );
    var_2["loadoutEquipmentExtra"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "equipmentSetups", 0, "extra" );
    var_2["loadoutOffhand"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "equipmentSetups", 1, "equipment" );
    var_2["loadoutOffhandExtra"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "equipmentSetups", 1, "extra" );

    for ( var_3 = 0; var_3 < 6; var_3++ )
        var_2["loadoutPerks"][var_3] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "perkSlots", var_3 );

    for ( var_3 = 0; var_3 < 3; var_3++ )
        var_2["loadoutWildcards"][var_3] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "wildcardSlots", var_3 );

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        var_2["loadoutKillstreaks"][var_3] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "assaultStreaks", var_3, "streak" );

        for ( var_4 = 0; var_4 < 3; var_4++ )
            var_2["loadoutKillstreakModules"][var_3][var_4] = getmatchrulesdata( "defaultClasses", var_0, var_1, "class", "assaultStreaks", var_3, "modules", var_4 );
    }

    var_2["loadoutJuggernaut"] = getmatchrulesdata( "defaultClasses", var_0, var_1, "juggernaut" );
    return var_2;
}

_id_7262( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( !isdefined( level._id_511A ) && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
    {
        if ( level._id_4C6A && !self._id_4726 )
            self waittill( "applyLoadout" );
        else
            self waittill( "spawned_player" );
    }
    else
        self waittill( "applyLoadout" );

    if ( var_0 )
    {
        self notify( "lost_juggernaut" );
        wait 0.5;
    }

    if ( !isdefined( self._id_5134 ) )
    {
        self._id_5F78 = 0.7;
        _id_A7B4::_id_9B35();
    }

    self._id_52A7 = 0.7;
    self _meth_82CB();

    if ( !getdvarint( "camera_thirdPerson" ) && !isdefined( level._id_511A ) && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
    {
        self._id_52A3 = newclienthudelem( self );
        self._id_52A3._id_0530 = 0;
        self._id_52A3._id_0538 = 0;
        self._id_52A3._id_002C = "left";
        self._id_52A3._id_002D = "top";
        self._id_52A3._id_01F4 = "fullscreen";
        self._id_52A3._id_0500 = "fullscreen";
        self._id_52A3 _meth_80CC( level._id_52AA["juggernaut"]._id_65F3, 640, 480 );
        self._id_52A3._id_03D5 = -10;
        self._id_52A3._id_0048 = 1;
        self._id_52A3._id_01EB = 1;
    }

    thread _id_A7C2::_id_52A4();

    if ( level._id_01B5 != "jugg" || isdefined( level._id_59E6 ) && level._id_59E6 )
        self _meth_82A6( "specialty_radarjuggernaut", 1, 0 );

    if ( isdefined( self._id_5133 ) && self._id_5133 )
    {
        var_1 = spawn( "script_model", self._id_02E6 );
        var_1._id_04A8 = self._id_04A8;
        var_1 _meth_800F( self );
        self._id_67E0 = var_1;
        thread _id_A7C2::_id_70AC( var_1 );
    }

    level notify( "juggernaut_equipped", self );
    thread _id_A7C2::_id_52A9();
}

_id_9B61( var_0 )
{
    self._id_03BC = var_0;
    self _meth_82FB( "ui_session_state", var_0 );
}

_id_197E()
{
    if ( isdefined( level._id_39AF ) )
        return level._id_39AF;

    if ( getdvarint( "xblive_privatematch" ) || _func_2BC() )
        return "privateMatchCustomClasses";
    else
        return "customClasses";
}

_id_3F30( var_0 )
{
    return level._id_1E36[var_0];
}

_id_51C9()
{
    var_0 = _id_4006( self._id_04A8 );

    foreach ( var_2 in var_0 )
    {
        if ( var_2 != self && ( !isdefined( var_2._id_024D ) || !var_2._id_024D ) )
            return 0;
    }

    return 1;
}

_id_53AD( var_0 )
{
    var_1 = _id_4006( var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_024D ) && var_3._id_024D )
            var_3 thread _id_A783::_id_2A51( randomintrange( 1, 3 ) );
    }
}

_id_9074( var_0 )
{
    if ( !isai( self ) )
        self _meth_8315( var_0 );
    else
        self _meth_8315( "none" );
}

_id_50AE( var_0 )
{
    if ( isagent( var_0 ) && var_0._id_089F == 1 )
        return 1;

    if ( isbot( var_0 ) )
        return 1;

    return 0;
}

_id_51CB( var_0 )
{
    if ( _id_50AE( var_0 ) )
        return 1;

    if ( isplayer( var_0 ) )
        return 1;

    return 0;
}

_id_50AA( var_0 )
{
    if ( isagent( var_0 ) && var_0._id_0898 == 1 )
        return 1;

    if ( isbot( var_0 ) )
        return 1;

    return 0;
}

_id_510F( var_0 )
{
    if ( _id_50AA( var_0 ) )
        return 1;

    if ( isplayer( var_0 ) )
        return 1;

    return 0;
}

_id_4117( var_0 )
{
    var_1 = 0;

    if ( level._id_91E4 )
    {
        switch ( var_0 )
        {
            case "axis":
                var_1 = 1;
                break;
            case "allies":
                var_1 = 2;
                break;
        }
    }

    return var_1;
}

_id_514D( var_0 )
{
    return var_0 == "MOD_MELEE" || var_0 == "MOD_MELEE_ALT";
}

_id_5114( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_3._id_02E9 ) )
        {
            if ( var_3._id_00AD == "script_vehicle" )
                return 0;

            if ( var_3._id_00AD == "misc_turret" )
                return 0;

            if ( var_3._id_00AD == "script_model" )
                return 0;
        }

        if ( isdefined( var_3._id_08A0 ) )
        {
            if ( var_3._id_08A0 == "dog" || var_3._id_08A0 == "alien" )
                return 0;
        }
    }

    return ( var_1 == "head" || var_1 == "helmet" ) && !_id_514D( var_2 ) && var_2 != "MOD_IMPACT" && !_id_50FB( var_0 );
}

_id_0E30( var_0, var_1 )
{
    if ( !level._id_91E4 )
        return 0;
    else if ( !isdefined( var_1 ) || !isdefined( var_0 ) )
        return 0;
    else if ( !isdefined( var_0._id_04A8 ) || !isdefined( var_1._id_04A8 ) )
        return 0;
    else if ( var_0 == var_1 )
        return 0;
    else if ( var_0._id_030D["team"] == var_1._id_04A8 && isdefined( var_1._id_91E5 ) )
        return 0;
    else if ( isdefined( var_1._id_78CA ) && var_1._id_78CA )
        return 0;
    else if ( var_0._id_04A8 == var_1._id_04A8 )
        return 1;
    else
        return 0;
}

_id_7E54( var_0 )
{
    if ( !( isdefined( self._id_4888 ) && _id_A4F0::_id_0CE4( self._id_4888, var_0 ) ) )
    {
        self._id_4888 = _id_A4F0::_id_0CDA( self._id_4888, var_0 );
        var_0 notify( "calculate_new_level_targets" );
    }
}

_id_07A7( var_0, var_1 )
{
    if ( isdefined( level._id_161B["bots_add_to_level_targets"] ) )
    {
        var_0._id_9BE1 = var_1;
        var_0._id_1657 = "use";
        [[ level._id_161B["bots_add_to_level_targets"] ]]( var_0 );
    }
}

_id_734F( var_0 )
{
    if ( isdefined( level._id_161B["bots_remove_from_level_targets"] ) )
        [[ level._id_161B["bots_remove_from_level_targets"] ]]( var_0 );
}

_id_07A6( var_0 )
{
    if ( isdefined( level._id_161B["bots_add_to_level_targets"] ) )
    {
        var_0._id_1657 = "damage";
        [[ level._id_161B["bots_add_to_level_targets"] ]]( var_0 );
    }
}

_id_734E( var_0 )
{
    if ( isdefined( level._id_161B["bots_remove_from_level_targets"] ) )
        [[ level._id_161B["bots_remove_from_level_targets"] ]]( var_0 );
}

_id_6202( var_0 )
{
    if ( isdefined( level._id_161B["notify_enemy_bots_bomb_used"] ) )
        self [[ level._id_161B["notify_enemy_bots_bomb_used"] ]]( var_0 );
}

_id_3E4A()
{
    if ( isdefined( level._id_161B["bot_get_rank_xp_and_prestige"] ) )
        return self [[ level._id_161B["bot_get_rank_xp_and_prestige"] ]]();
}

_id_7E9F()
{
    var_0 = _id_3E4A();

    if ( isdefined( var_0 ) )
    {
        self._id_030D["rankxp"] = var_0._id_7139;
        self._id_030D["prestige"] = var_0._id_0333;
        self._id_030D["prestige_fake"] = var_0._id_0333;
    }
}

_id_7DED()
{
    if ( !isdefined( level._id_2153 ) )
        level._id_2153 = getdvar( "consoleGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_0532 ) )
        level._id_0532 = getdvar( "xenonGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_034C ) )
        level._id_034C = getdvar( "ps3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_0531 ) )
        level._id_0531 = getdvar( "xb3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_034D ) )
        level._id_034D = getdvar( "ps4Game" ) == "true";
    else
    {

    }
}

_id_502C()
{
    if ( level._id_0531 || level._id_034D || !level._id_2153 )
        return 1;
    else
        return 0;
}

_id_7F58( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_2153 ) || !isdefined( level._id_0531 ) || !isdefined( level._id_034D ) )
        _id_7DED();

    if ( _id_502C() )
        setdvar( var_0, var_2 );
    else
        setdvar( var_0, var_1 );
}

_id_51F6( var_0, var_1 )
{
    return isdefined( var_1._id_04A8 ) && var_1._id_04A8 != var_0._id_04A8;
}

_id_51E9( var_0, var_1 )
{
    return isdefined( var_1._id_02E9 ) && var_1._id_02E9 != var_0;
}

_id_3FC2()
{
    return ( 0, 0, 5000 );
}

_id_3FC3()
{
    return ( 0, 0, 2500 );
}

_id_74F7( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( isdefined( level._id_626A ) && isdefined( level._id_6278 ) )
    {
        self _meth_847A( level._id_6278, var_0 );
        self _meth_82D4( level._id_6278, var_0 );
        _id_7EFC( level._id_6278, var_0 );
    }
    else if ( isdefined( self._id_9C2C ) && isdefined( self._id_750A ) )
    {
        self _meth_847A( self._id_750A, var_0 );
        self _meth_82D4( self._id_750A, var_0 );
        _id_7EFC( self._id_750A, var_0 );
    }
    else
    {
        self _meth_847A( "", var_0 );
        self _meth_82D4( "", var_0 );
        _id_7EFC( "", var_0 );
    }
}

_id_7E65( var_0 )
{
    if ( !isplayer( self ) )
        return;

    if ( isdefined( level._id_5757 ) )
        level._id_5758 = level._id_5757;

    level._id_5757 = var_0;
    self _meth_83C0( var_0 );
}

_id_1EC2()
{
    if ( !isplayer( self ) )
        return;

    var_0 = getmapcustom( "map" );

    if ( isdefined( level._id_5758 ) )
    {
        var_0 = level._id_5758;
        level._id_5758 = undefined;
    }

    level._id_5757 = var_0;
    self _meth_83C0( var_0 );
}

_id_5709( var_0, var_1, var_2, var_3 )
{
    if ( !isplayer( self ) )
        return;

    self _meth_83C1( var_0, var_1 );
    _id_A034( var_2, [ "death", "disconnect" ] );

    if ( isdefined( self ) )
        self _meth_83C2( var_3 );
}

_id_4141()
{
    if ( isdefined( self._id_030D["guid"] ) )
        return self._id_030D["guid"];

    var_0 = self _meth_8275();

    if ( var_0 == "0000000000000000" )
    {
        if ( isdefined( level._id_4450 ) )
            level._id_4450++;
        else
            level._id_4450 = 1;

        var_0 = "script" + level._id_4450;
    }

    self._id_030D["guid"] = var_0;
    return self._id_030D["guid"];
}

_id_3E32( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = self _meth_81B1();
    var_3 = [];

    foreach ( var_5 in level._id_0328 )
    {
        if ( !isdefined( var_5 ) || var_5 == self )
            continue;

        var_6 = 0;

        if ( !var_1 )
        {
            if ( isdefined( var_5._id_04A8 ) && var_5._id_04A8 == "spectator" || var_5._id_03BC == "spectator" )
            {
                var_7 = var_5 _meth_829D();

                if ( isdefined( var_7 ) && var_7 == self )
                    var_6 = 1;
            }

            if ( var_5._id_0198 == var_2 )
                var_6 = 1;
        }

        if ( !var_0 )
        {
            if ( var_5._id_023A == var_2 )
                var_6 = 1;
        }

        if ( var_6 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_7EFC( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = _id_3E32( var_4, var_5 );

    foreach ( var_9 in var_7 )
    {
        var_9 notify( "changing_watching_visionset" );

        if ( isdefined( var_3 ) && var_3 )
            var_9 _meth_82D6( var_0, var_1 );
        else if ( isdefined( var_6 ) && var_6 )
            var_9 _meth_8469( var_0, var_1 );
        else
            var_9 _meth_82D4( var_0, var_1 );

        if ( var_0 != "" && isdefined( var_2 ) )
        {
            var_9 thread _id_743C( self, var_1 + var_2, var_6 );
            var_9 thread _id_743A( self, var_6 );

            if ( var_9 _id_5126() )
                var_9 thread _id_743B();
        }
    }
}

_id_743B()
{
    self endon( "disconnect" );
    self waittill( "spawned" );
    self _meth_82D4( "", 0.0 );
    self _meth_8469( "", 0.0 );
}

_id_743C( var_0, var_1, var_2 )
{
    self endon( "changing_watching_visionset" );
    var_0 endon( "disconnect" );
    var_3 = gettime();
    var_4 = self._id_04A8;

    while ( gettime() - var_3 < var_1 * 1000 )
    {
        if ( self._id_04A8 != var_4 || !_id_A4F0::_id_0CE4( var_0 _id_3E32(), self ) )
        {
            if ( isdefined( var_2 ) && var_2 )
                self _meth_8469( "", 0.0 );
            else
                self _meth_82D4( "", 0.0 );

            self notify( "changing_visionset" );
            break;
        }

        wait 0.05;
    }
}

_id_743A( var_0, var_1 )
{
    self endon( "changing_watching_visionset" );
    var_0 waittill( "disconnect" );

    if ( isdefined( var_1 ) && var_1 )
        self _meth_8469( "", 0.0 );
    else
        self _meth_82D4( "", 0.0 );
}

_id_0683( var_0 )
{
    if ( isagent( var_0 ) && ( !isdefined( var_0._id_50A3 ) || !var_0._id_50A3 ) )
        return undefined;

    return var_0;
}

_id_063B( var_0, var_1 )
{
    if ( !isdefined( self._id_6044 ) )
    {
        self._id_6044 = [];
        self._id_6F6E = [];
    }
    else
    {
        self._id_6F6E[0] = self._id_6044[0];
        self._id_6F6E[1] = self._id_6044[1];
    }

    self._id_6044[0] = var_0;
    self._id_6044[1] = var_1;
    self _meth_83EE( var_0, var_1 );
}

_id_0628()
{
    if ( isdefined( self._id_6F6E ) )
        self _meth_83EE( self._id_6F6E[0], self._id_6F6E[1] );
    else
        self _meth_83EE( "", "" );

    self._id_6044 = undefined;
    self._id_6F6E = undefined;
}

_id_3772( var_0, var_1 )
{
    var_2 = getentarray( var_0, "targetname" );

    if ( var_2.size > 0 )
    {
        foreach ( var_4 in var_2 )
        {
            var_5 = 0;

            if ( isdefined( var_4._id_7939 ) )
            {
                if ( isdefined( var_4._id_7A93 ) && var_4._id_7A93 == "delta_anim" )
                    var_5 = 1;

                var_4 thread _id_6A22( var_1, var_5 );
            }
        }
    }
}

_id_6A22( var_0, var_1 )
{
    if ( var_0 == 1 )
        wait(randomfloatrange( 0.0, 1 ));

    if ( var_1 == 0 )
        self _meth_8279( self._id_7939 );
    else
        self _meth_827B( self._id_7939 );
}

_id_6C5F( var_0, var_1 )
{
    _id_0612( "highjump", var_0, var_1, ::_meth_83B2 );
}

_id_6C60( var_0, var_1 )
{
    _id_0612( "highjumpdrop", var_0, var_1, ::_meth_8486 );
}

_id_6C5D( var_0, var_1 )
{
    _id_0612( "boostjump", var_0, var_1, ::_meth_849E );
}

_id_6C61( var_0, var_1 )
{
    _id_0612( "powerslide", var_0, var_1, ::_meth_8485 );
}

_id_6C5E( var_0, var_1 )
{
    _id_0612( "dodge", var_0, var_1, ::_meth_848D );
}

_id_0612( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( self._id_6C87 ) )
        self._id_6C87 = [];

    if ( !isdefined( self._id_6C87[var_0] ) )
        self._id_6C87[var_0] = [];

    if ( !isdefined( var_2 ) )
        var_2 = "default";

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    if ( var_1 )
    {
        self._id_6C87[var_0] = _id_A4F0::_id_0CF6( self._id_6C87[var_0], var_2 );

        if ( !self._id_6C87[var_0].size )
        {
            if ( var_4 )
                self call [[ var_3 ]]( 1 );
            else
                self [[ var_3 ]]( 1 );
        }
    }
    else
    {
        if ( !isdefined( _id_A4F0::_id_0CE8( self._id_6C87[var_0], var_2 ) ) )
            self._id_6C87[var_0] = _id_A4F0::_id_0CDA( self._id_6C87[var_0], var_2 );

        if ( var_4 )
            self call [[ var_3 ]]( 0 );
        else
            self [[ var_3 ]]( 0 );
    }
}

_id_5940( var_0, var_1, var_2, var_3 )
{
    var_4 = 500;

    switch ( var_0 )
    {
        case "killstreakRemote":
            var_4 = 300;
            break;
        case "coopStreakPrompt":
            var_4 = 301;
            break;
        default:
            break;
    }

    _id_05D2( var_4, var_0, var_2, var_3 );
    self _meth_80C1( var_4, var_2, var_3 );
    self _meth_80DB( var_1 );
    self _meth_80DA( "HINT_NOICON" );
}

_id_05D2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_4231 ) )
        level._id_4231 = [];

    var_4 = -1;

    for ( var_5 = 0; var_5 < level._id_4231.size; var_5++ )
    {
        var_6 = level._id_4231[var_5];

        if ( var_6._id_6FBB > var_0 )
        {
            if ( var_4 == -1 )
                var_4 = var_5;

            break;
        }

        if ( var_6._id_6FBB == var_0 )
        {
            var_6._id_6FBB += 0.01;

            if ( var_6._id_310C )
                var_6._id_32D4 _meth_80C1( var_6._id_6FBB, var_6._id_031D, var_6._id_04A8 );

            if ( var_4 == -1 )
                var_4 = var_5;
        }
    }

    if ( var_4 == -1 )
        var_4 = 0;

    var_7 = spawnstruct();
    var_7._id_32D4 = self;
    var_7._id_6FBB = var_0;
    var_7._id_04D8 = var_1;
    var_7._id_031D = var_2;
    var_7._id_04A8 = var_3;
    var_7._id_310C = 1;
    level._id_4231 = _id_A4F0::_id_0CED( level._id_4231, var_7, var_4 );
}

_id_593F()
{
    var_0 = undefined;

    foreach ( var_2 in level._id_4231 )
    {
        if ( var_2._id_32D4 == self )
        {
            var_0 = var_2;
            break;
        }
    }

    if ( isdefined( var_0 ) )
    {
        var_4 = var_0._id_6FBB;
        level._id_4231 = _id_A4F0::_id_0CF6( level._id_4231, var_0 );
        self _meth_80C2();

        foreach ( var_2 in level._id_4231 )
        {
            if ( var_4 > var_2._id_6FBB && int( var_4 ) == int( var_2._id_6FBB ) )
            {
                var_2._id_6FBB -= 0.01;

                if ( var_2._id_310C )
                    var_2._id_32D4 _meth_80C1( var_2._id_6FBB, var_2._id_031D, var_2._id_04A8 );
            }
        }
    }
}

_id_2B13()
{
    foreach ( var_1 in level._id_4231 )
    {
        if ( var_1._id_32D4 == self )
        {
            if ( var_1._id_310C )
            {
                var_1._id_32D4 _meth_80C2();
                var_1._id_310C = 0;
            }

            break;
        }
    }
}

_id_310F()
{
    foreach ( var_1 in level._id_4231 )
    {
        if ( var_1._id_32D4 == self )
        {
            if ( !var_1._id_310C )
            {
                var_1._id_32D4 _meth_80C1( var_1._id_6FBB, var_1._id_031D, var_1._id_04A8 );
                var_1._id_310C = 1;
            }

            break;
        }
    }
}

_id_7F4E( var_0 )
{
    self _meth_8186( var_0["nearStart"], var_0["nearEnd"], var_0["farStart"], var_0["farEnd"], var_0["nearBlur"], var_0["farBlur"] );
}

_id_501E( var_0 )
{
    switch ( var_0 )
    {
        case "adrenaline_mp":
        case "extra_health_mp":
        case "exocloak_equipment_mp":
        case "exohover_equipment_mp":
        case "exoping_equipment_mp":
        case "exorepulsor_equipment_mp":
        case "exoshield_equipment_mp":
        case "exoshieldhorde_equipment_mp":
        case "exohoverhorde_equipment_mp":
        case "exocloakhorde_equipment_mp":
        case "exomute_equipment_mp":
        case "iw5_dlcgun12loot7_mp":
            return 1;
        default:
            return 0;
    }
}

_id_50F9( var_0 )
{
    if ( level._id_91E4 )
        return _id_5177( var_0 );
    else
        return _id_5173( var_0 );
}

_id_5177( var_0 )
{
    return var_0._id_04A8 != self._id_04A8;
}

_id_5173( var_0 )
{
    if ( isdefined( var_0._id_02E9 ) )
        return var_0._id_02E9 != self;
    else
        return var_0 != self;
}

_id_5153()
{
    if ( _func_2BC() && getdvarint( "xblive_competitionmatch" ) )
        return 1;

    return 0;
}

_id_5152()
{
    if ( issplitscreen() && getdvarint( "xblive_competitionmatch" ) )
        return 1;

    return 0;
}

_id_5151()
{
    if ( _id_6FCD() && getdvarint( "xblive_competitionmatch" ) )
        return 1;

    return 0;
}

_id_5150()
{
    if ( _id_5153() || _id_5152() || _id_5151() )
        return 1;

    return 0;
}

_id_89D7( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnfx( var_0, var_2, var_3 );
    var_4 _id_3BB6( var_1 );
    return var_4;
}

_id_3BB6( var_0 )
{
    thread _id_8508( var_0 );
    setwinningteam( self, 1 );
    triggerfx( self );
}

_id_8508( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self _meth_8054();

        foreach ( var_2 in level._id_0328 )
        {
            var_3 = var_2._id_04A8;

            if ( var_3 != "axis" || var_2 _meth_8432() )
                var_3 = "allies";

            if ( var_0 == var_3 || var_0 == "neutral" )
                self _meth_8007( var_2 );
        }

        level waittill( "joined_team" );
    }
}

_id_3E65( var_0 )
{
    var_1 = "iw5_combatknife_mp";

    if ( isdefined( var_0._id_6F81 ) && var_0._id_6F81 != "none" && var_0._id_6F81 != "iw5_combatknife_mp" )
        var_1 = var_0._id_6F81;
    else if ( isdefined( var_0._id_7BF4 ) && var_0._id_7BF4 != "none" )
        var_1 = var_0._id_7BF4;

    return var_1;
}

_id_6D3C()
{
    self._id_74A3 = self _meth_833B();
}

_id_6D35()
{
    if ( isdefined( self._id_74A3 ) )
    {
        if ( self._id_04A8 != "spectator" )
            self _meth_833A( self._id_74A3 );

        self._id_74A3 = undefined;
    }
}

_id_7FA8( var_0, var_1 )
{
    var_0 _id_A78A::_id_7F0C( "mlg", var_1 );
    var_0 _id_A78A::_id_7F0D( "mlg", var_1 );
}

spawnpatchclip( var_0, var_1, var_2 )
{
    var_3 = getent( var_0, "targetname" );

    if ( !isdefined( var_3 ) )
        return undefined;

    var_4 = spawn( "script_model", var_1 );
    var_4 _meth_8278( var_3 );
    var_4._id_0041 = var_2;
    return var_4;
}

iscoop()
{
    if ( isdefined( level._id_511A ) && level._id_511A )
        return 1;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return 1;

    return 0;
}

setlightingstate_patched( var_0 )
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
                    var_3 _id_A4F0::_id_84E9();
                    var_3 _meth_855F();
                    continue;
                }

                var_3 notify( "hidingLightingState" );
                var_3 _id_A4F0::_id_485B();
            }
        }
    }
}

gettimeutc_for_stat_recording()
{
    return gettimeutc();
}
