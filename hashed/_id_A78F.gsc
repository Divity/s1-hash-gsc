// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_478A = 0.55;
    var_0 = 5;
    var_0 = _id_A7B3::_id_413F( "player", "healthregentime" );
    level._id_6CC0 = var_0 * 1000;
    level._id_478B = level._id_6CC0 <= 0;
    level thread _id_64C5();
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
        thread _id_6CC1();
    }
}

_id_6CC1()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self endon( "goliath_equipped" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    if ( self._id_01E7 <= 0 )
        return;

    var_0 = 0;
    var_1 = 0;
    thread _id_6D1F();
    self notify( "playerHealthRegen" );

    for (;;)
    {
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6 );

        if ( self._id_01E7 <= 0 )
            return;

        var_1 = gettime();
        var_7 = self._id_01E7 / self._id_0275;

        if ( !isdefined( self._id_478F ) )
            self._id_72D1 = 1;
        else if ( self._id_478F == 0.33 )
            self._id_72D1 = 0.75;
        else if ( self._id_478F == 0.66 )
            self._id_72D1 = 0.5;
        else if ( self._id_478F == 0.99 )
            self._id_72D1 = 0.3;
        else
            self._id_72D1 = 1;

        if ( var_7 <= level._id_478A )
            self._id_0D82 = 1;

        thread _id_478D( var_1, var_7 );
        thread _id_17E5( var_1, var_7, var_2, var_6 );
    }
}

_id_17E5( var_0, var_1, var_2, var_3 )
{
    self notify( "breathingManager" );
    self endon( "breathingManager" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );

    if ( _id_A75A::_id_51E0() || _id_A75A::_id_5128() )
        return;

    if ( !isplayer( self ) )
        return;

    if ( isdefined( var_3 ) && var_3 != "MOD_FALLING" || isdefined( var_2 ) && var_2 > 1 )
        _id_6A39( var_0 );

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    self._id_17E6 = var_0 + 3000 * self._id_72D1;
    wait(7 * self._id_72D1);

    if ( !level._id_3BD8 && isdefined( self._id_0D82 ) && self._id_0D82 == 1 )
    {
        if ( !_id_A7C2::get_is_in_mech() )
        {
            if ( self _meth_843A() )
                self _meth_82F4( "deaths_door_exit_female" );
            else
                self _meth_82F4( "deaths_door_exit" );
        }

        self._id_0D82 = 0;
    }
}

_id_6A39( var_0 )
{
    if ( isdefined( level.customplaydamagesound ) )
    {
        self thread [[ level.customplaydamagesound ]]( var_0 );
        return;
    }

    if ( isdefined( self._id_258A ) && self._id_258A + 5000 > var_0 )
        return;

    self._id_258A = var_0;
    var_1 = randomintrange( 1, 8 );

    if ( !_id_A7C2::get_is_in_mech() )
    {
        if ( self._id_04A8 == "axis" )
        {
            if ( self _meth_843A() )
                self _meth_809A( "generic_pain_enemy_fm_" + var_1 );
            else
                self _meth_809A( "generic_pain_enemy_" + var_1 );
        }
        else if ( self _meth_843A() )
            self _meth_809A( "generic_pain_friendly_fm_" + var_1 );
        else
            self _meth_809A( "generic_pain_friendly_" + var_1 );
    }
}

_id_478D( var_0, var_1 )
{
    self notify( "healthRegeneration" );
    self endon( "healthRegeneration" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self endon( "goliath_equipped" );
    level endon( "game_ended" );

    if ( level._id_478B )
        return;

    if ( !isdefined( self._id_4BB6 ) )
        self._id_4BB6 = 0;

    if ( self._id_4BB6 == 0 )
        wait(level._id_6CC0 / 1000 * self._id_72D1);
    else
        self._id_4BB6 = 0;

    if ( var_1 < 0.55 )
        var_2 = 1;
    else
        var_2 = 0;

    for (;;)
    {
        if ( self._id_72D1 == 0.75 )
        {
            wait 0.2;

            if ( self._id_01E7 < self._id_0275 )
                self._id_01E7 += 5;
            else
                break;
        }
        else if ( self._id_72D1 == 0.5 )
        {
            wait 0.05;

            if ( self._id_01E7 < self._id_0275 )
                self._id_01E7 += 2;
            else
                break;
        }
        else if ( self._id_72D1 == 0.3 )
        {
            wait 0.15;

            if ( self._id_01E7 < self._id_0275 )
                self._id_01E7 += 40;
            else
                break;
        }
        else if ( !isdefined( self._id_72D1 ) || self._id_72D1 == 1 )
        {
            wait 0.05;

            if ( self._id_01E7 < self._id_0275 )
            {
                self._id_01E7 += 1;
                var_1 = self._id_01E7 / self._id_0275;
            }
            else
                break;
        }

        if ( self._id_01E7 > self._id_0275 )
            self._id_01E7 = self._id_0275;
    }

    _id_A783::_id_7442();

    if ( var_2 )
        _id_A7A0::_id_478C();
}

_id_9FA9()
{
    self notify( "waiting_to_stop_remote" );
    self endon( "waiting_to_stop_remote" );
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "stopped_using_remote" );
    _id_A75A::_id_74F7( 0 );
}

_id_6D1F()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( getdvarint( "virtuallobbyactive", 0 ) )
        return;

    if ( !isplayer( self ) )
        return;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    wait 3;

    for (;;)
    {
        wait 0.2;

        if ( self._id_01E7 <= 0 )
            return;

        if ( self._id_01E7 >= self._id_0275 * 0.55 )
            continue;

        if ( level._id_478B && gettime() > self._id_17E6 )
            continue;

        if ( _id_A75A::_id_51E0() || _id_A75A::_id_5128() )
            continue;

        if ( !_id_A7C2::get_is_in_mech() )
        {
            if ( self _meth_843A() )
                self _meth_82F4( "deaths_door_mp_female" );
            else
                self _meth_82F4( "deaths_door_mp_male" );
        }

        wait 1.284;
        wait(0.1 + randomfloat( 0.8 ));
    }
}
