// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_058F["emp_third_person_sparks"] = loadfx( "vfx/explosion/electrical_sparks_small_emp_runner" );

    if ( level._id_5FE9 )
    {
        for ( var_0 = 0; var_0 < level._id_91F0.size; var_0++ )
            level._id_91E7[level._id_91F0[var_0]] = 0;
    }
    else
    {
        level._id_91E7["allies"] = 0;
        level._id_91E7["axis"] = 0;
    }

    level._id_308A = undefined;
    level._id_308B = undefined;
    level._id_308F = 0;
    level._id_3082 = 0;
    level._id_307B = 0;
    level._id_3083 = 0;
    level._id_3090 = 0;
    level thread _id_3073();
    level._id_5398["emp"] = ::_id_3076;
    level thread _id_64C5();
}

_id_4027( var_0 )
{
    var_1 = _id_A4F0::_id_0CE4( var_0, "emp_streak_kill" );
    var_2 = _id_A4F0::_id_0CE4( var_0, "emp_equipment_kill" );
    var_3 = _id_A4F0::_id_0CE4( var_0, "emp_exo_kill" );

    if ( !var_1 && !var_2 && !var_3 )
        return "_01";

    if ( var_1 && !var_2 && !var_3 )
        return "_02";

    if ( !var_1 && var_2 && !var_3 )
        return "_03";

    if ( !var_1 && !var_2 && var_3 )
        return "_04";

    if ( var_1 && var_2 && !var_3 )
        return "_05";

    if ( var_1 && !var_2 && var_3 )
        return "_06";

    if ( !var_1 && var_2 && var_3 )
        return "_07";

    return "_08";
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D3();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( _id_51C3() && !_id_A75A::_id_05CB( "specialty_empimmune" ) )
            _id_0CAB();

        self waittill( "death" );

        if ( self._id_04A8 == "spectator" || _id_51C3() )
            _id_739D();
    }
}

_id_51C3()
{
    return level._id_91E4 && level._id_91E7[self._id_04A8] || !level._id_91E4 && isdefined( level._id_308B ) && level._id_308B != self;
}

_id_0CAB( var_0 )
{
    var_1 = 2;

    if ( level._id_3083 )
    {
        var_1 = 1;

        if ( _id_A75A::_id_50C1() )
        {
            _id_A75A::_id_6C5F( 0, "emp" );
            _id_A75A::_id_6C60( 0, "emp" );
            _id_A75A::_id_6C5D( 0, "emp" );
            _id_A75A::_id_6C61( 0, "emp" );
            _id_A75A::_id_6C5E( 0, "emp" );
        }
    }

    self._id_308E = _id_A7AB::_id_6D46( level._id_3081, var_1, "emp" );
    self _meth_84BE( "digital_distort_mp" );
    self _meth_8064( 1.0, 1.0 );
    self._id_3089 = 1;
    self notify( "applyEMPkillstreak" );
    self _meth_821D( 1, level._id_3082 );

    if ( isdefined( var_0 ) && var_0 == "emp_update" )
        self _meth_8004( "emp_system_hacked", self );

    thread _id_2FE5();
    thread _id_6C83();
}

_id_6C83()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "emp_update" );

    if ( !isdefined( self._id_2236 ) )
        self waittill( "player_model_set" );

    if ( !isdefined( self._id_3085 ) )
    {
        self._id_3085 = _func_2C1( _id_A4F0::_id_3FA6( "emp_third_person_sparks" ), self, "j_shoulder_ri" );
        triggerfx( self._id_3085 );
        setwinningteam( self._id_3085, 1 );
    }
}

_id_2FE5()
{
    self notify( "dynamicDistortion" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "dynamicDistortion" );
    wait 0.1;
    var_0 = 0;
    var_1 = 0.55;
    var_2 = 0.2;
    var_3 = var_1 - var_2;
    var_4 = 0.2;
    var_5 = ( level._id_3081 - gettime() ) / 1000 - 0.2;

    while ( var_0 < var_5 )
    {
        if ( isdefined( self._id_3089 ) && !self._id_3089 )
            break;

        var_6 = ( var_5 - var_0 ) / var_5;
        self _meth_8064( var_6 * var_3 + var_2, 1.0 );
        var_0 += var_4;
        wait(var_4);
    }

    self _meth_8064( 0.0, 0.0 );
}

_id_739D( var_0 )
{
    if ( _id_A75A::_id_50C1() )
    {
        _id_A75A::_id_6C5F( 1, "emp" );
        _id_A75A::_id_6C60( 1, "emp" );
        _id_A75A::_id_6C5D( 1, "emp" );
        _id_A75A::_id_6C61( 1, "emp" );
        _id_A75A::_id_6C5E( 1, "emp" );
    }

    if ( isdefined( self._id_308E ) )
    {
        _id_A7AB::_id_6D47( self._id_308E );
        self._id_308E = undefined;
    }
    else if ( self._id_04A8 == "spectator" )
    {
        self _meth_82FB( "ui_exo_reboot_end_time", 0 );
        self _meth_82FB( "ui_exo_reboot_type", 0 );
    }

    self _meth_8064( 0.0, 0.0 );
    self._id_3089 = undefined;
    self notify( "removeEMPkillstreak" );
    self _meth_821D( 0 );

    if ( isdefined( var_0 ) && var_0 == "emp_update" )
        self _meth_8004( "emp_system_reboot", self );

    if ( isdefined( self._id_3085 ) )
        self._id_3085 delete();
}

_id_3076( var_0, var_1 )
{
    var_2 = self._id_030D["team"];

    if ( level._id_91E4 )
    {
        var_3 = level._id_65B0[var_2];
        thread _id_3070( var_3, var_1 );
    }
    else
        thread _id_306F( self, var_1 );

    _id_A744::_id_5838( "emp", self._id_02E6 );
    _id_A7A0::_id_6FF3( "ch_streak_emp", 1 );
    return 1;
}

_id_306A( var_0 )
{
    var_1 = 20.0;

    if ( _id_A4F0::_id_0CE4( var_0, "emp_time_1" ) && _id_A4F0::_id_0CE4( var_0, "emp_time_2" ) )
        var_1 = 40.0;
    else if ( _id_A4F0::_id_0CE4( var_0, "emp_time_1" ) || _id_A4F0::_id_0CE4( var_0, "emp_time_2" ) )
        var_1 = 30.0;

    if ( isdefined( level._id_511A ) && level._id_511A )
        return 60.0;

    return var_1;
}

_id_3066( var_0 )
{
    self endon( "disconnect" );
    self notify( "EMP_Artifacts" );
    self endon( "EMP_Artifacts" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        wait 0.1;

    self _meth_82FB( "ui_hud_static", 2 );
    wait(var_0);
    self _meth_82FB( "ui_hud_static", 0 );
}

_id_3070( var_0, var_1 )
{
    level endon( "game_ended" );

    if ( !isdefined( level._id_511A ) )
        thread _id_A75A::_id_91F3( "used_emp", self );

    level notify( "EMP_JamTeam" + var_0 );
    level endon( "EMP_JamTeam" + var_0 );
    level._id_308A = self;
    var_2 = _id_306A( var_1 );

    foreach ( var_4 in level._id_0328 )
    {
        var_4 _meth_82F4( "emp_big_activate" );

        if ( var_4._id_04A8 != var_0 )
            continue;

        if ( var_4 _id_A75A::_id_05CB( "specialty_empimmune" ) )
            continue;

        if ( var_4 _id_A75A::_id_05CB( "specialty_localjammer" ) )
            var_4 _meth_8212( 1 );

        var_4 thread _id_3066( var_2 );
    }

    visionsetnaked( "coup_sunblind", 0.1 );

    if ( _id_A4F0::_id_0CE4( var_1, "emp_flash" ) )
    {
        foreach ( var_4 in level._id_0328 )
        {
            if ( var_4._id_04A8 != var_0 || !_id_A75A::_id_5186( var_4 ) || isdefined( var_4._id_9C2C ) )
                continue;

            if ( var_4 _id_A75A::_id_05CB( "specialty_empimmune" ) )
                continue;

            var_4 thread _id_A73D::_id_0CAD( 2.5, 0.75 );
        }
    }

    wait 0.1;
    visionsetnaked( "coup_sunblind", 0 );

    if ( isdefined( level._id_626A ) )
        visionsetnaked( level._id_6278, 3.0 );
    else
        visionsetnaked( "", 3.0 );

    level._id_91E7[var_0] = 1;
    level._id_308F = _id_A4F0::_id_0CE4( var_1, "emp_streak_kill" );
    level._id_3082 = _id_A4F0::_id_0CE4( var_1, "emp_equipment_kill" );
    level._id_307B = _id_A4F0::_id_0CE4( var_1, "emp_assist" );
    level._id_3083 = _id_A4F0::_id_0CE4( var_1, "emp_exo_kill" );
    level notify( "emp_update" );
    level._id_3081 = gettime() + int( var_2 * 1000 );

    if ( level._id_308F )
        level _id_28DC( self, var_0 );

    if ( level._id_3082 )
        level _id_28D7( self, var_0 );

    level thread _id_52DA( var_2 );
    _id_A79A::_id_A049( var_2 );
    level._id_91E7[var_0] = 0;

    foreach ( var_4 in level._id_0328 )
    {
        if ( var_4._id_04A8 != var_0 )
            continue;

        if ( var_4 _id_A75A::_id_05CB( "specialty_localjammer" ) )
            var_4 _meth_8212( 0 );
    }

    level._id_308A = undefined;
    level._id_308F = 0;
    level._id_3082 = 0;
    level._id_307B = 0;
    level._id_3083 = 0;
    level notify( "emp_update" );
}

_id_306F( var_0, var_1 )
{
    level notify( "EMP_JamPlayers" );
    level endon( "EMP_JamPlayers" );
    level._id_308A = var_0;
    var_2 = _id_306A( var_1 );

    foreach ( var_4 in level._id_0328 )
    {
        var_4 _meth_82F4( "emp_big_activate" );

        if ( var_4 == var_0 )
            continue;

        if ( var_4 _id_A75A::_id_05CB( "specialty_localjammer" ) )
            var_4 _meth_8212( 1 );

        var_4 thread _id_3066( var_2 );
    }

    visionsetnaked( "coup_sunblind", 0.1 );

    if ( _id_A4F0::_id_0CE4( var_1, "emp_flash" ) )
    {
        foreach ( var_4 in level._id_0328 )
        {
            if ( var_4 == var_0 || !_id_A75A::_id_5186( var_4 ) || isdefined( var_4._id_9C2C ) )
                continue;

            var_4 thread _id_A73D::_id_0CAD( 2.5, 0.75 );
        }
    }

    wait 0.1;
    visionsetnaked( "coup_sunblind", 0 );

    if ( isdefined( level._id_626A ) )
        visionsetnaked( level._id_6278, 3.0 );
    else
        visionsetnaked( "", 3.0 );

    level notify( "emp_update" );
    level._id_308B = var_0;
    level._id_308B thread _id_308C();
    level._id_308F = _id_A4F0::_id_0CE4( var_1, "emp_streak_kill" );
    level._id_3082 = _id_A4F0::_id_0CE4( var_1, "emp_equipment_kill" );
    level._id_307B = _id_A4F0::_id_0CE4( var_1, "emp_assist" );
    level._id_3083 = _id_A4F0::_id_0CE4( var_1, "emp_exo_kill" );
    level._id_3081 = gettime() + int( var_2 * 1000 );

    if ( level._id_308F )
        level _id_28DC( var_0 );

    if ( level._id_3082 )
        level _id_28D7( var_0 );

    level notify( "emp_update" );
    level thread _id_52DA( var_2 );
    _id_A79A::_id_A049( var_2 );

    foreach ( var_4 in level._id_0328 )
    {
        if ( var_4 == var_0 )
            continue;

        if ( var_4 _id_A75A::_id_05CB( "specialty_localjammer" ) )
            var_4 _meth_8212( 0 );
    }

    level._id_308B = undefined;
    level._id_308A = undefined;
    level._id_308F = 0;
    level._id_3082 = 0;
    level._id_307B = 0;
    level._id_3083 = 0;
    level notify( "emp_update" );
    level notify( "emp_ended" );
}

_id_52DA( var_0 )
{
    level notify( "keepEMPTimeRemaining" );
    level endon( "keepEMPTimeRemaining" );
    level endon( "emp_ended" );

    for ( level._id_3090 = int( var_0 ); level._id_3090; level._id_3090-- )
        wait 1.0;
}

_id_308C()
{
    level endon( "EMP_JamPlayers" );
    level endon( "emp_ended" );
    self waittill( "disconnect" );
    level notify( "emp_update" );
}

_id_3073()
{
    for (;;)
    {
        var_0 = level _id_A4F0::_id_A068( "joined_team", "emp_update", "game_ended" );

        foreach ( var_2 in level._id_0328 )
        {
            if ( var_2._id_04A8 == "spectator" )
            {
                var_3 = var_2 _meth_829D();

                if ( !isdefined( var_3 ) || !var_3 _id_51C3() )
                    var_2 _id_739D( var_0 );

                continue;
            }

            if ( var_2 _id_A75A::_id_05CB( "specialty_empimmune" ) )
                continue;

            if ( _id_A75A::_id_5186( var_2 ) && var_2 _id_51C3() && !level._id_3BD8 )
            {
                var_2 _id_0CAB( var_0 );
                continue;
            }

            var_2 _id_739D( var_0 );
        }

        if ( level._id_3BD8 )
            return;
    }
}

_id_28E0( var_0, var_1 )
{
    thread _id_28DC( var_0, var_1 );
    thread _id_28D7( var_0, var_1 );
}

_id_28DC( var_0, var_1 )
{
    thread _id_28D8( var_0, var_1 );
    thread _id_28D9( var_0, var_1 );
    thread _id_28DD( var_0, var_1 );
    thread _id_28DB( var_0, var_1 );
    thread _id_28DE( var_0, var_1 );
    thread _id_28DF( var_0, var_1 );
    thread _id_28DA( var_0, var_1 );
    thread destroyactivegoliaths( var_0, var_1 );
}

_id_28D7( var_0, var_1 )
{
    thread _id_28D6( var_0, var_1 );
}

_id_28E9( var_0, var_1, var_2, var_3 )
{
    thread _id_28D8( var_0, var_1, var_2, var_3 );
    thread _id_28D9( var_0, var_1, var_2, var_3 );
    thread _id_28DD( var_0, var_1, var_2, var_3 );
    thread _id_28DB( var_0, var_1, var_2, var_3 );
    thread _id_28DE( var_0, var_1, var_2, var_3 );
    thread _id_28DF( var_0, var_1, var_2, var_3 );
    thread _id_28DA( var_0, var_1, var_2, var_3 );
    thread _id_28D6( var_0, var_1, var_2, var_3 );
}

_id_28D8( var_0, var_1, var_2, var_3 )
{
    var_4 = "MOD_EXPLOSIVE";
    var_5 = "killstreak_emp_mp";
    var_6 = 5000;
    var_7 = level._id_4813;

    if ( isdefined( level._id_656B ) )
        var_7[var_7.size] = level._id_656B;

    foreach ( var_9 in var_7 )
    {
        if ( level._id_91E4 && isdefined( var_1 ) )
        {
            if ( isdefined( var_9._id_04A8 ) && var_9._id_04A8 != var_1 )
                continue;
        }
        else if ( isdefined( var_9._id_02E9 ) && var_9._id_02E9 == var_0 )
            continue;

        if ( isdefined( var_2 ) && isdefined( var_3 ) )
        {
            var_10 = var_2;

            if ( distancesquared( var_9._id_02E6, var_2 ) > var_3 * var_3 )
                continue;
        }

        var_6 = var_9._id_0275 + 1;
        var_9 _meth_8051( var_6, var_9._id_02E6, var_0, var_0, var_4, var_5 );
        wait 0.05;
    }
}

_id_28D9( var_0, var_1, var_2, var_3 )
{
    var_4 = "MOD_EXPLOSIVE";
    var_5 = "killstreak_emp_mp";
    var_6 = 5000;
    var_7 = _id_A4F0::_id_0CDD( level._id_687B, level._id_57B5 );

    foreach ( var_9 in level._id_1B99 )
    {
        if ( isdefined( var_9._id_2361 ) )
            var_7[var_7.size] = var_9._id_2361;
    }

    foreach ( var_12 in var_7 )
    {
        if ( level._id_91E4 && isdefined( var_1 ) )
        {
            if ( isdefined( var_12._id_04A8 ) && var_12._id_04A8 != var_1 )
                continue;
        }
        else if ( isdefined( var_12._id_02E9 ) && var_12._id_02E9 == var_0 )
            continue;

        if ( isdefined( var_2 ) && isdefined( var_3 ) )
        {
            var_13 = var_2;

            if ( distancesquared( var_12._id_02E6, var_2 ) > var_3 * var_3 )
                continue;
        }

        var_6 = var_12._id_0275 + 1;

        if ( isdefined( var_12._id_2383 ) )
            var_12 = var_12._id_32B4;

        var_12 _meth_8051( var_6, var_12._id_02E6, var_0, var_0, var_4, var_5 );
        wait 0.05;
    }
}

_id_28DD( var_0, var_1, var_2, var_3 )
{
    var_4 = "MOD_EXPLOSIVE";
    var_5 = "killstreak_emp_mp";
    var_6 = 5000;

    foreach ( var_8 in level._id_99B3 )
    {
        if ( level._id_91E4 && isdefined( var_1 ) )
        {
            if ( isdefined( var_8._id_04A8 ) && var_8._id_04A8 != var_1 )
                continue;
        }
        else if ( isdefined( var_8._id_02E9 ) && var_8._id_02E9 == var_0 )
            continue;

        if ( isdefined( var_2 ) && isdefined( var_3 ) )
        {
            var_9 = var_2;

            if ( distancesquared( var_8._id_02E6, var_2 ) > var_3 * var_3 )
                continue;
        }

        var_6 = var_8._id_0275 + 1;
        var_8 _meth_8051( var_6, var_8._id_02E6, var_0, var_0, var_4, var_5 );
    }

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        foreach ( var_12 in level._id_0328 )
        {
            if ( isdefined( var_12._id_50D7 ) && var_12._id_50D7 )
                var_12 notify( "force_cancel_placement" );
        }
    }
}

_id_28DB( var_0, var_1, var_2, var_3 )
{
    var_4 = "MOD_EXPLOSIVE";
    var_5 = "killstreak_emp_mp";
    var_6 = 5000;

    foreach ( var_8 in level._id_7591 )
    {
        if ( isdefined( var_8._id_A2D6 ) && _id_85BB( var_8._id_A2D6 ) )
            continue;

        if ( level._id_91E4 && isdefined( var_1 ) )
        {
            if ( isdefined( var_8._id_04A8 ) && var_8._id_04A8 != var_1 )
                continue;
        }
        else if ( isdefined( var_8._id_02E9 ) && var_8._id_02E9 == var_0 )
            continue;

        if ( isdefined( var_2 ) && isdefined( var_3 ) )
        {
            var_9 = var_2;

            if ( distancesquared( var_8._id_02E6, var_2 ) > var_3 * var_3 )
                continue;
        }

        if ( _id_8486( var_8 ) )
        {
            var_6 = var_8._id_0275 + 1;
            var_8 _meth_8051( var_6, var_8._id_02E6, var_0, var_0, var_4, var_5 );
        }
        else
        {
            playfx( level._id_7323["explode"], var_8._id_02E6 );
            var_8 delete();
        }

        wait 0.05;
    }
}

_id_8486( var_0 )
{
    return isdefined( var_0._id_258D );
}

_id_85BB( var_0 )
{
    return var_0 == "orbital_carepackage_pod_mp";
}

_id_28DE( var_0, var_1, var_2, var_3 )
{
    var_4 = "MOD_EXPLOSIVE";
    var_5 = "killstreak_emp_mp";
    var_6 = 5000;
    var_7 = level._id_99E1;

    if ( level._id_91E4 && isdefined( var_1 ) )
        var_7 = level._id_99E1[var_1];

    foreach ( var_9 in var_7 )
    {
        if ( level._id_91E4 && isdefined( var_1 ) )
        {

        }
        else if ( isdefined( var_9._id_02E9 ) && var_9._id_02E9 == var_0 )
            continue;

        if ( isdefined( var_2 ) && isdefined( var_3 ) )
        {
            var_10 = var_2;

            if ( distancesquared( var_9._id_02E6, var_2 ) > var_3 * var_3 )
                continue;
        }

        var_6 = var_9._id_0275 + 1;
        var_9 _meth_8051( var_6, var_9._id_02E6, var_0, var_0, var_4, var_5 );
        wait 0.05;
    }
}

_id_28DF( var_0, var_1, var_2, var_3 )
{
    var_4 = "MOD_EXPLOSIVE";
    var_5 = "killstreak_emp_mp";
    var_6 = 5000;

    foreach ( var_8 in level._id_99E7 )
    {
        if ( level._id_91E4 && isdefined( var_1 ) )
        {
            if ( isdefined( var_8._id_04A8 ) && var_8._id_04A8 != var_1 )
                continue;
        }
        else if ( isdefined( var_8._id_02E9 ) && var_8._id_02E9 == var_0 )
            continue;

        if ( isdefined( var_2 ) && isdefined( var_3 ) )
        {
            var_9 = var_2;

            if ( distancesquared( var_8._id_02E6, var_2 ) > var_3 * var_3 )
                continue;
        }

        var_6 = var_8._id_0275 + 1;
        var_8 _meth_8051( var_6, var_8._id_02E6, var_0, var_0, var_4, var_5 );
        wait 0.05;
    }
}

_id_28D6( var_0, var_1, var_2, var_3 )
{
    var_4 = "MOD_EXPLOSIVE";
    var_5 = "killstreak_emp_mp";
    var_6 = 5000;
    var_7 = _id_A4F0::_id_0CDD( level._id_94EA, level._id_3574 );

    foreach ( var_9 in var_7 )
    {
        if ( level._id_91E4 && isdefined( var_1 ) )
        {
            if ( isdefined( var_9._id_04A8 ) && var_9._id_04A8 != var_1 )
                continue;
        }
        else if ( isdefined( var_9._id_02E9 ) && var_9._id_02E9 == var_0 )
            continue;

        if ( isdefined( var_2 ) && isdefined( var_3 ) )
        {
            var_10 = var_2;

            if ( distancesquared( var_9._id_02E6, var_2 ) > var_3 * var_3 )
                continue;
        }

        var_6 = var_9._id_0275 + 1;
        var_9 _meth_8051( var_6, var_9._id_02E6, var_0, var_0, var_4, var_5 );
    }

    foreach ( var_13 in level._id_4404 )
    {
        if ( !isdefined( var_13._id_A2D6 ) || !issubstr( var_13._id_A2D6, "explosive_drone_mp" ) )
            continue;

        if ( level._id_91E4 && isdefined( var_1 ) )
        {
            if ( isdefined( var_13._id_04A8 ) && var_13._id_04A8 != var_1 )
                continue;
        }
        else if ( isdefined( var_13._id_02E9 ) && var_13._id_02E9 == var_0 )
            continue;

        if ( isdefined( var_2 ) && isdefined( var_3 ) )
        {
            var_10 = var_2;

            if ( distancesquared( var_13._id_02E6, var_2 ) > var_3 * var_3 )
                continue;
        }

        var_13 thread _id_A739::_id_3579();
    }
}

_id_28DA( var_0, var_1, var_2, var_3 )
{
    var_4 = "MOD_EXPLOSIVE";
    var_5 = "killstreak_emp_mp";
    var_6 = 5000;
    var_7 = ( 0, 0, 0 );
    var_8 = ( 0, 0, 0 );
    var_9 = "";
    var_10 = "";
    var_11 = "";
    var_12 = undefined;

    foreach ( var_14 in level._id_654F )
    {
        if ( level._id_91E4 && isdefined( var_1 ) )
        {
            if ( isdefined( var_14._id_04A8 ) && var_14._id_04A8 != var_1 )
                continue;
        }
        else if ( isdefined( var_14._id_02E9 ) && var_14._id_02E9 == var_0 )
            continue;

        var_14 notify( "death", var_0, var_4, var_5 );
        wait 0.05;
    }
}

destroyactivegoliaths( var_0, var_1 )
{
    foreach ( var_3 in level._id_0328 )
    {
        if ( var_3 _id_A75A::_id_512E() )
        {
            if ( level._id_91E4 && isdefined( var_1 ) )
            {
                if ( isdefined( var_3._id_04A8 ) && var_3._id_04A8 != var_1 )
                    continue;
            }

            if ( isdefined( level._id_511A ) && level._id_511A )
            {
                var_3 _id_A750::_id_8706( "goliath_self_destruct" );
                playfx( _id_A4F0::_id_3FA6( "goliath_self_destruct" ), var_3._id_02E6, anglestoup( var_3._id_0041 ) );
                var_3 thread [[ level.hordehandlejuggdeath ]]();
                continue;
            }

            var_3 thread _id_A7C2::_id_6CD6( var_3._id_02E6, var_0, "MOD_EXPLOSIVE", "killstreak_goliathsd_mp" );
        }
    }
}
