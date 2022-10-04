// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( !level._id_91E4 )
        return;

    level._id_8F27 = [];
    level._id_8F28 = [];
    level._id_8F26 = [];
    setdvar( "scr_coop_util_delay", "1" );
}

_id_7017( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !level._id_91E4 )
        return;

    var_7 = ( 0, 0, 0 );

    if ( isdefined( var_5 ) )
        var_7 = var_5._id_02E6;

    var_8 = spawn( "script_model", var_7 );
    var_8 _meth_8054();
    var_8._id_04A8 = var_0;
    var_8._id_6082 = var_3;
    var_8._id_1834 = var_4;
    var_8._id_8F22 = var_5;
    var_8._id_5288 = var_6;
    var_8._id_528A = var_1;
    var_8._id_8A66 = var_2;
    var_8._id_0014 = 0;
    var_8._id_7018 = _id_4142();

    if ( isdefined( var_5 ) )
        var_8 _meth_800B( var_5 );

    _id_0832( var_8 );
    return var_8._id_7018;
}

_id_8EF9( var_0 )
{
    if ( !level._id_91E4 )
        return;

    foreach ( var_2 in level._id_8F27 )
    {
        if ( var_2._id_7018 == var_0 )
        {
            thread _id_73DD( var_2 );
            return;
        }
    }

    foreach ( var_2 in level._id_8F28 )
    {
        if ( var_2._id_7018 == var_0 )
        {
            thread _id_73DD( var_2 );
            return;
        }
    }
}

_id_A0C9( var_0 )
{
    for (;;)
    {
        level waittill( "buddyJoinedStreak", var_1, var_2 );

        if ( var_2 == var_0 )
            return var_1;
    }
}

_id_6D49( var_0 )
{
    _id_6D4A( var_0 );
}

_id_6D2F()
{
    _id_6D30();
}

_id_6D65()
{
    if ( !level._id_91E4 )
        return;

    if ( !isdefined( level._id_8F26[self._id_444D] ) )
        level._id_8F26[self._id_444D] = 0;

    level._id_8F26[self._id_444D]++;

    if ( level._id_8F26[self._id_444D] > 1 )
        return;

    if ( self._id_04A8 == "allies" )
    {
        foreach ( var_1 in level._id_8F27 )
            var_1 _meth_800B( self );
    }
    else
    {
        foreach ( var_1 in level._id_8F28 )
            var_1 _meth_800B( self );
    }
}

_id_6D5F()
{
    if ( !level._id_91E4 )
        return;

    level._id_8F26[self._id_444D]--;

    if ( level._id_8F26[self._id_444D] > 0 )
        return;

    if ( self._id_04A8 == "allies" )
    {
        foreach ( var_1 in level._id_8F27 )
        {
            if ( self != var_1._id_8F22 )
                var_1 _meth_800A( self );
        }
    }
    else
    {
        foreach ( var_1 in level._id_8F28 )
        {
            if ( self != var_1._id_8F22 )
                var_1 _meth_800A( self );
        }
    }
}

_id_0832( var_0 )
{
    if ( var_0._id_04A8 == "allies" )
    {
        level._id_8F27[level._id_8F27.size] = var_0;

        if ( level._id_8F27.size == 1 )
            level thread _id_8D39( var_0 );
    }
    else
    {
        level._id_8F28[level._id_8F28.size] = var_0;

        if ( level._id_8F28.size == 1 )
            level thread _id_8D39( var_0 );
    }
}

_id_73DD( var_0 )
{
    var_1 = var_0._id_0014;
    var_0._id_0014 = 0;
    var_0 notify( "streakPromptStopped" );

    if ( var_0._id_04A8 == "allies" )
    {
        level._id_8F27 = _id_A4F0::_id_0CF6( level._id_8F27, var_0 );

        if ( var_1 && level._id_8F27.size > 0 )
            level thread _id_8D39( level._id_8F27[0] );
    }
    else
    {
        level._id_8F28 = _id_A4F0::_id_0CF6( level._id_8F28, var_0 );

        if ( var_1 && level._id_8F28.size > 0 )
            level thread _id_8D39( level._id_8F28[0] );
    }

    thread _id_27D3( var_0 );
}

_id_27D3( var_0 )
{
    wait 1;
    var_0 delete();
}

_id_4142( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_8F27 )
    {
        if ( var_3._id_7018 >= var_1 )
            var_1 = var_3._id_7018 + 1;
    }

    foreach ( var_3 in level._id_8F28 )
    {
        if ( var_3._id_7018 >= var_1 )
            var_1 = var_3._id_7018 + 1;
    }

    return var_1;
}

_id_8D39( var_0 )
{
    var_0._id_0014 = 1;
    level thread _id_466D( var_0 );
    level thread _id_645E( var_0 );

    foreach ( var_2 in level._id_0328 )
    {
        if ( isdefined( var_0._id_8F22 ) && var_2 == var_0._id_8F22 )
            continue;

        if ( _id_A75A::_id_5186( var_2 ) && var_2._id_04A8 == var_0._id_04A8 )
            var_2 thread _id_6D4D( var_0 );

        var_2 thread _id_6D1E( var_0 );
    }
}

_id_645E( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "streakPromptStopped" );

    for (;;)
    {
        level waittill( "connected", var_1 );
        var_1 thread _id_6D1E( var_0 );
    }
}

_id_6D1E( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "streakPromptStopped" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( self._id_04A8 == var_0._id_04A8 )
            thread _id_6D4D( var_0 );
    }
}

_id_6D4D( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    var_0 endon( "streakPromptStopped" );

    while ( _id_A75A::_id_51E0() || _id_A75A::_id_5128() )
        waittillframeend;

    _id_6C88( var_0 );
    thread _id_6C8B( var_0 );
    thread _id_6D6A( var_0 );
}

_id_6C88( var_0 )
{
    if ( !isdefined( level._id_8F26[self._id_444D] ) )
        return;

    if ( level._id_8F26[self._id_444D] > 0 )
    {
        var_0 _meth_800B( self );

        while ( level._id_8F26[self._id_444D] > 0 )
            waittillframeend;
    }
}

_id_6C8B( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    var_0 endon( "streakPromptStopped" );

    if ( isdefined( var_0._id_8A66 ) )
        thread _id_A79C::_id_21C7( var_0._id_8A66, var_0._id_6082 );
}

_id_A0DA( var_0, var_1 )
{
    if ( _id_A75A::_id_5128() )
        var_0 _id_A7C3::_id_6D85();

    waittillframeend;

    if ( _id_A75A::_id_51E0() )
        var_0 waittill( "stopped_using_remote" );
}

_id_A0E2( var_0 )
{
    var_0 endon( "streakPromptStopped" );
    var_0 waittill( "trigger" );
    return 1;
}

_id_6D6A( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        _id_A0DA( self );
        var_1 = _id_A0E2( var_0 );

        if ( !isdefined( var_1 ) )
            return;

        if ( !var_0._id_0014 )
            return;

        if ( isdefined( self _meth_84C5() ) && self _meth_84C5() == var_0 && self _meth_833C() && self _meth_8341() )
        {
            var_2 = _id_6CAD();
            var_1 = _id_6CB8( var_0, var_2 );

            if ( var_1 || !var_0._id_0014 )
                return;
        }
    }
}

_id_6CAD()
{
    if ( getdvarint( "scr_coop_util_delay", 1 ) == 0 )
        return 1.25;
    else
    {
        var_0 = self._id_0390;
        var_1 = self._id_0390;

        for ( var_2 = 1; var_2 < level._id_0328.size; var_2++ )
        {
            var_3 = level._id_0328[var_2];

            if ( var_3._id_04A8 != self._id_04A8 )
                continue;

            if ( var_3._id_0390 > var_1 )
            {
                var_1 = var_3._id_0390;
                continue;
            }

            if ( var_3._id_0390 < var_0 )
                var_0 = var_3._id_0390;
        }

        var_4 = var_1 - var_0;

        if ( var_4 == 0 )
            return 1.25;

        var_5 = ( self._id_0390 - var_0 ) / var_4;
        var_6 = 1.25;
        var_7 = 1.25 + var_5 * var_6;
        return var_7;
    }
}

_id_466D( var_0 )
{
    var_0 _id_A75A::_id_5940( "coopStreakPrompt", var_0._id_528A, undefined, var_0._id_04A8 );
    var_0 waittill( "streakPromptStopped" );
    var_0 _id_A75A::_id_593F();
}

_id_6CB8( var_0, var_1 )
{
    var_2 = var_1 * 1000;

    if ( var_0 _id_9BFA( self, var_2, var_0 ) )
    {
        level notify( "buddyJoinedStreak", self, var_0._id_7018 );
        thread _id_A72E::_id_539B();

        if ( isdefined( var_0._id_8F22 ) && isalive( var_0._id_8F22 ) )
        {
            if ( isdefined( var_0._id_5288 ) )
                thread _id_A75A::_id_5652( var_0._id_5288 );

            if ( isdefined( var_0._id_1834 ) )
                var_0._id_8F22 thread _id_A75A::_id_5652( var_0._id_1834 );

            if ( isdefined( var_0._id_8F22._id_2517 ) )
                setmatchdata( "killstreaks", var_0._id_8F22._id_2517, "coopPlayerIndex", self._id_1F0F );
        }

        var_0 notify( "streakPromptStopped" );
        return 1;
    }

    return 0;
}

_id_9BFA( var_0, var_1, var_2 )
{
    var_0 _meth_807C( var_2 );
    var_0 _meth_8081();
    var_0._id_5978 = 1;
    thread _id_9BFB( var_0 );
    self._id_24C9 = 0;
    self._id_020E = 1;
    self._id_9C08 = 0;
    self._id_9C11 = var_1;

    if ( isdefined( var_0._id_4FAA ) )
    {
        var_0 _meth_8119( 0 );
        var_0 _meth_811A( 0 );
    }

    var_0 _id_A75A::_id_05C0( "killstreak_remote_turret_mp" );
    var_0 _meth_8315( "killstreak_remote_turret_mp" );
    var_0 _meth_8321();
    var_0 thread _id_67E2( self, var_2 );
    var_3 = _id_9BFC( var_0, var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( isalive( var_0 ) && !var_3 )
        var_0 _id_6D30();

    self._id_020E = 0;
    self._id_24C9 = 0;

    if ( isdefined( var_0 ) )
    {
        var_0._id_5978 = 0;
        var_0 _meth_82FB( "ui_use_bar_text", 0 );
        var_0 _meth_82FB( "ui_use_bar_end_time", 0 );
        var_0 _meth_82FB( "ui_use_bar_start_time", 0 );
    }

    self notify( "coopUtilUseHoldThinkComplete" );
    return var_3;
}

_id_9BFB( var_0 )
{
    self endon( "coopUtilUseHoldThinkComplete" );
    var_0 _id_A4F0::_id_A060( "death", "disconnect" );

    if ( isdefined( var_0 ) )
    {
        var_0 _id_6D30();
        var_0._id_5978 = 0;
        var_0 _meth_82FB( "ui_use_bar_text", 0 );
        var_0 _meth_82FB( "ui_use_bar_end_time", 0 );
        var_0 _meth_82FB( "ui_use_bar_start_time", 0 );
    }
}

_id_6D30()
{
    _id_A7C3::_id_9125( "killstreak_predator_missile_mp" );
    _id_A7C3::_id_9125( "killstreak_remote_turret_mp" );
    self _meth_8119( 1 );
    self _meth_811A( 1 );
    self _meth_8322();
    self _meth_8315( _id_A4F0::_id_3FFB() );
    thread _id_6C81();
    self _meth_804F();
}

_id_6D4A( var_0 )
{
    if ( isdefined( var_0 ) )
        wait(var_0);

    self _meth_8322();
    _id_A75A::_id_05C0( "killstreak_predator_missile_mp" );
    self _meth_8316( "killstreak_predator_missile_mp" );
    _id_A7C3::_id_9125( "killstreak_remote_turret_mp" );
    self _meth_8321();
}

_id_6C81()
{
    self endon( "disconnect" );
    _id_A75A::_id_3A30( 1 );
    wait 0.5;
    _id_A75A::_id_3A30( 0 );
}

_id_67E2( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "streakPromptStopped" );
    self _meth_82FB( "ui_use_bar_text", 2 );
    self _meth_82FB( "ui_use_bar_start_time", int( gettime() ) );
    var_2 = -1;

    while ( _id_A75A::_id_5186( self ) && isdefined( var_0 ) && var_0._id_020E && !level._id_3BD8 )
    {
        if ( var_2 != var_0._id_9C08 )
        {
            if ( var_0._id_24C9 > var_0._id_9C11 )
                var_0._id_24C9 = var_0._id_9C11;

            if ( var_0._id_9C08 > 0 )
            {
                var_3 = gettime();
                var_4 = var_0._id_24C9 / var_0._id_9C11;
                var_5 = var_3 + ( 1 - var_4 ) * var_0._id_9C11 / var_0._id_9C08;
                self _meth_82FB( "ui_use_bar_end_time", int( var_5 ) );
            }

            var_2 = var_0._id_9C08;
        }

        wait 0.05;
    }

    self _meth_82FB( "ui_use_bar_end_time", 0 );
}

_id_9BFC( var_0, var_1 )
{
    var_1 endon( "streakPromptStopped" );

    while ( !level._id_3BD8 && isdefined( self ) && _id_A75A::_id_5186( var_0 ) && var_0 _meth_833C() && self._id_24C9 < self._id_9C11 )
    {
        self._id_24C9 += 50 * self._id_9C08;

        if ( isdefined( self._id_6300 ) )
            self._id_9C08 = 1 * self._id_6300;
        else
            self._id_9C08 = 1;

        if ( self._id_24C9 >= self._id_9C11 )
            return _id_A75A::_id_5186( var_0 );

        wait 0.05;
    }

    return 0;
}
