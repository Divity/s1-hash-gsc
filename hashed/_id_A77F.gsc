// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( !isdefined( level._id_132C ) )
        level._id_132C = [];

    level thread _id_64D3();
    level thread _id_64C5();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connecting", var_0 );
        var_0 thread _id_4E2A();
        var_0 thread _id_644F();
        var_0 thread _id_646A();
    }
}

_id_64D3()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_spawned", var_0 );

        if ( !isai( var_0 ) )
        {
            var_0._id_51AE = undefined;

            if ( var_0 _id_A14A() )
            {
                if ( !var_0 _id_471C() )
                {
                    var_0._id_381F = 0;
                    var_0 _id_3775();
                }

                continue;
            }

            if ( var_0 _id_471C() )
                var_0 _id_1EE4();
        }
    }
}

_id_4E2A()
{
    if ( !isdefined( self._id_52D2 ) )
    {
        self._id_52D2 = newclienthudelem( self );
        self._id_52D2._id_0048 = 0;
        self._id_52D2._id_0538 = 34;
        self._id_52D2._id_002C = "left";
        self._id_52D2._id_002D = "top";
        self._id_52D2._id_01F4 = "center";
        self._id_52D2._id_0500 = "middle";
        self._id_52D2._id_03D5 = 10;
        self._id_52D2._id_018B = "small";
        self._id_52D2._id_019A = 1;
        self._id_52D2._id_01EE = 1;

        if ( level._id_8A76 )
        {
            self._id_52D2._id_0530 = 16;
            self._id_52D2._id_018C = 1.2;
        }
        else
        {
            self._id_52D2._id_0530 = 62;
            self._id_52D2._id_018C = 1.6;
        }
    }

    if ( !isdefined( self._id_52D1 ) )
    {
        self._id_52D1 = newclienthudelem( self );
        self._id_52D1._id_0048 = 0;
        self._id_52D1._id_0538 = 58;
        self._id_52D1._id_002C = "left";
        self._id_52D1._id_002D = "top";
        self._id_52D1._id_01F4 = "center";
        self._id_52D1._id_0500 = "middle";
        self._id_52D1._id_03D5 = 10;
        self._id_52D1._id_018B = "small";
        self._id_52D1._id_019A = 1;
        self._id_52D1._id_01EE = 1;

        if ( level._id_8A76 )
        {
            self._id_52D1._id_0530 = 16;
            self._id_52D1._id_018C = 1.2;
        }
        else
        {
            self._id_52D1._id_0530 = 62;
            self._id_52D1._id_018C = 1.6;
        }
    }
}

_id_644F()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "battlebuddy_update" )
        {
            var_2 = !_id_A14A();
            self _meth_8243( "enableBattleBuddy", var_2 );

            if ( var_2 )
                _id_3775();
            else if ( _id_471C() )
            {
                if ( !isalive( self._id_132A ) )
                    self._id_132A _id_8312();
                else if ( !isalive( self ) )
                    _id_8312();

                _id_1EE4();
            }
            else
            {
                _id_73A2( self );
                self _meth_82FC( "ui_battle_buddy_entity_num", -1 );
            }

            continue;
        }

        if ( var_0 == "team_select" )
            _id_73A2( self );
    }
}

_id_646A()
{

}

_id_A021()
{
    _id_A75A::_id_9B61( "spectator" );
    self._id_0198 = self._id_132A _meth_81B1();
    self _meth_834F();
    _id_A00C();
}

_id_A220()
{
    self endon( "disconnect" );
    self endon( "abort_battlebuddy_spawn" );
    self endon( "teamSpawnPressed" );
    level endon( "game_ended" );
    self._id_52D1 _meth_80CA( &"PLATFORM_PRESS_TO_RESPAWN" );
    self._id_52D1._id_0037 = 1;
    self _meth_82DD( "respawn_random", "+usereload" );
    wait 0.5;
    self waittill( "respawn_random" );
    _id_8312();
}

_id_8312()
{
    _id_1EE5();
    self._id_51AE = undefined;
    self notify( "randomSpawnPressed" );
    _id_1E89();
}

_id_A00C()
{
    self endon( "randomSpawnPressed" );
    level endon( "game_ended" );

    if ( !isdefined( self._id_52D2 ) )
        _id_4E2A();

    self._id_51AE = undefined;
    thread _id_A220();

    if ( isdefined( self._id_132B ) )
    {
        var_0 = 4000 - ( gettime() - self._id_132B );

        if ( var_0 < 2000 )
            var_0 = 2000;
    }
    else
        var_0 = 4000;

    var_1 = _id_1CF5();

    if ( var_1._id_8D76 == -1 || var_1._id_8D76 == -3 )
        self._id_132A _id_2B5C( &"MP_BUDDY_ERR_COMBAT" );
    else
        self._id_132A _id_2B5C( &"MP_BUDDY_INCOMING" );

    _id_9B82( &"MP_BUDDY_TIME_UNTIL_SPAWN", var_0 );

    for ( var_1 = _id_1CF5(); var_1._id_8D76 != 0; var_1 = _id_1CF5() )
    {
        if ( var_1._id_8D76 == -1 || var_1._id_8D76 == -3 )
        {
            _id_2B5C( &"MP_BUDDY_WAITING_COMBAT" );
            self._id_132A _id_2B5C( &"MP_BUDDY_ERR_COMBAT" );
        }
        else if ( var_1._id_8D76 == -2 )
        {
            _id_2B5C( &"MP_BUDDY_WAITING_POINT" );
            self._id_132A _id_2B5C( &"MP_BUDDY_ERR_POINT" );
        }

        wait 0.5;
    }

    self._id_51AE = 1;
    thread _id_2B5B();
    self _meth_82F4( "copycat_steal_class" );
    self notify( "teamSpawnPressed" );
}

_id_1EE5()
{
    self._id_52D1._id_0037 = 0;
    self._id_52D2._id_0037 = 0;
    _id_A75A::_id_1EF5( "kc_info" );
    _id_A75A::_id_1EF5( "waiting_info" );

    if ( isdefined( self._id_132A ) )
        self._id_132A _id_A75A::_id_1EF5( "waiting_info" );
}

_id_2B5C( var_0 )
{
    _id_A75A::_id_7F9F( "waiting_info", var_0, undefined, undefined, undefined, undefined, undefined, undefined, 1 );
}

_id_2B5B()
{
    _id_1EE5();

    if ( isdefined( self._id_132A ) )
    {
        self._id_132A _id_2B5C( &"MP_BUDDY_SPAWNED_ON_YOU" );
        wait 1.5;
        self._id_132A _id_A75A::_id_1EF5( "waiting_info" );
    }
}

_id_1CF5()
{
    var_0 = spawnstruct();

    if ( _id_A7B0::_id_5174( self._id_132A ) )
        var_0._id_8D76 = -1;
    else
    {
        var_1 = _id_A7B0::_id_3789( self._id_132A );

        if ( isdefined( var_1 ) )
        {
            var_2 = spawnstruct();
            var_2._id_5A52 = 18;
            var_2._id_2529 = 0;

            if ( !_id_A7B0::_id_5196( self._id_132A, var_1, var_2 ) )
                var_0._id_8D76 = -3;
            else
            {
                var_0._id_8D76 = 0;
                var_0._id_02E6 = var_1;
                var_0._id_0041 = self._id_132A._id_0041;
            }
        }
        else
            var_0._id_8D76 = -2;
    }

    return var_0;
}

_id_1E89()
{
    thread _id_A7B1::_id_8013();
    self._id_0198 = -1;
    _id_A75A::_id_9B61( "dead" );
    self _meth_8350();
    self._id_51AE = undefined;
    self notify( "abort_battlebuddy_spawn" );
}

_id_9B82( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "abort_battlebuddy_spawn" );
    self endon( "teamSpawnPressed" );
    var_2 = var_1 * 0.001;
    _id_A75A::_id_7F9F( "kc_info", var_0, var_2, 1, 1 );
    wait(var_2);
    _id_A75A::_id_1EF5( "kc_info" );
}

_id_9B46( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "abort_battlebuddy_spawn" );
    self endon( "teamSpawnPressed" );
    var_2 = _id_A79D::_id_2435( 0, 25 );
    var_3 = _id_A79D::_id_2436( 0, 25 );
    var_3 _meth_80CA( var_0 );
    var_4 = 1.0 / var_1;
    var_5 = gettime();
    var_6 = 1.0;
    var_2 _id_A79D::_id_9AEF( var_6 );
    var_2 _id_A79D::_id_8504();
    var_3 _id_A79D::_id_8504();

    while ( !level._id_3BD8 && var_6 > 0.0 )
    {
        var_7 = var_1 - ( gettime() - var_5 );
        var_6 = var_7 * var_4;
        var_6 = clamp( var_6, 0.0, 1.0 );
        var_2 _id_A79D::_id_9AEF( var_6 );
        wait 0.1;
    }

    var_2 _id_A79D::_id_28E8();
    var_3 _id_A79D::_id_28E8();
}

_id_A14A()
{
    return self _meth_8222( "enableBattleBuddy" );
}

_id_471C()
{
    return isdefined( self._id_132A );
}

_id_607D()
{
    return _id_A14A() && !_id_471C();
}

_id_51E3( var_0 )
{
    return var_0 _id_607D() && self._id_04A8 == var_0._id_04A8;
}

_id_6661( var_0 )
{
    if ( self._id_04A8 == var_0._id_04A8 )
    {
        _id_73A2( var_0 );
        self._id_132A = var_0;
        var_0._id_132A = self;
        self _meth_82FC( "ui_battle_buddy_entity_num", var_0 _meth_81B1() );
        var_0 _meth_82FC( "ui_battle_buddy_entity_num", self _meth_81B1() );
    }
    else
    {

    }
}

_id_4157()
{
    return level._id_132C[self._id_04A8];
}

_id_0846( var_0 )
{
    level._id_132C[var_0._id_04A8] = var_0;
}

_id_73A2( var_0 )
{
    if ( isdefined( level._id_132C[var_0._id_04A8] ) && var_0 == level._id_132C[var_0._id_04A8] )
        level._id_132C[var_0._id_04A8] = undefined;
}

_id_3775()
{
    if ( level._id_64B5 )
    {
        self._id_37E9 = self _meth_82AB();

        if ( self._id_37E9.size >= 1 )
        {
            foreach ( var_1 in self._id_37E9 )
            {
                if ( _id_51E3( var_1 ) )
                    _id_6661( var_1 );
            }
        }
    }

    if ( !isdefined( self._id_132A ) )
    {
        var_1 = _id_4157();

        if ( isdefined( var_1 ) )
            _id_6661( var_1 );
        else
        {
            _id_0846( self );
            self _meth_82FC( "ui_battle_buddy_entity_num", -1 );
        }
    }
}

_id_1EE4()
{
    var_0 = self._id_132A;
    self _meth_82FC( "ui_battle_buddy_entity_num", -1 );
    self._id_132A = undefined;
    var_0 _meth_82FC( "ui_battle_buddy_entity_num", -1 );
    var_0._id_132A = undefined;
    self _meth_8243( "enableBattleBuddy", 0 );
    var_0 _id_3775();
}
