// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_058F["water_wake"] = loadfx( "vfx/treadfx/body_wake_water" );
    level._id_058F["water_wake_stationary"] = loadfx( "vfx/treadfx/body_wake_water_stationary" );
    level._id_058F["water_splash_emerge"] = loadfx( "vfx/water/body_splash_exit" );
    level._id_058F["water_splash_enter"] = loadfx( "vfx/water/body_splash" );
    precacheshellshock( "underwater" );

    if ( !isdefined( level._id_A291 ) )
        level._id_A291 = [];

    if ( !isdefined( level._id_A292 ) )
        level._id_A292 = 0;

    if ( !isdefined( level._id_83AC ) )
        _id_8000( "iw5_combatknife_mp" );

    if ( !isdefined( level._id_2763 ) )
        _id_7F3F( "iw5_underwater_mp" );

    if ( !isdefined( level._id_0A9D ) )
        level._id_0A9D = 1;

    if ( level._id_2763 == level._id_83AC )
        level._id_0A9D = 0;

    if ( !isdefined( level._id_906E ) )
        level._id_906E = 48;

    var_0 = getentarray( "trigger_underwater", "targetname" );
    level._id_A284 = var_0;

    foreach ( var_2 in var_0 )
    {
        var_2 _id_23A5();
        var_2 thread _id_A245();
        level thread _id_1F0E( var_2 );
    }

    level thread _id_64CA();
    setdvar( "scr_ball_water_drop_delay", 10 );
}

_id_6C02( var_0 )
{
    if ( var_0 )
    {
        self._id_4FAA = 1;

        if ( !_func_2D9( self ) && _id_A75A::_id_50AA( self ) && !isdefined( level.bots_ignore_water ) )
            self _meth_8351( "in_water", 1 );
    }
    else
    {
        self._id_4FAA = undefined;

        if ( !_func_2D9( self ) && _id_A75A::_id_50AA( self ) && !isdefined( level.bots_ignore_water ) )
            self _meth_8351( "in_water", 0 );
    }
}

watchforhostmigration()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "player_migrated" );

        foreach ( var_1 in level._id_A291 )
            self _meth_84EA( var_1._id_039B, var_1 );
    }
}

_id_64CA()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread watchforhostmigration();

        foreach ( var_2 in level._id_A291 )
            var_0 _meth_84EA( var_2._id_039B, var_2 );
    }
}

_id_23A5()
{
    var_0 = _id_A4F0::_id_40F9( self._id_04A5, "targetname" );
    var_0._id_02E6 += ( 0, 0, level._id_A292 );
    var_1 = var_0 _id_A4F0::_id_8953();
    var_1 _meth_8053();

    if ( isdefined( self._id_039B ) )
    {
        var_1._id_039B = self._id_039B;
        level._id_A291 = _id_A4F0::_id_0CDA( level._id_A291, var_1 );
    }
}

_id_1F0E( var_0 )
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_spawned", var_1 );

        if ( !var_1 _meth_80A9( var_0 ) )
        {
            var_1 _id_6C02( 0 );
            var_1._id_99FC = undefined;
            var_1._id_4EBF = undefined;
            var_1._id_51C1 = undefined;
            var_1._id_51FE = undefined;
            var_1._id_A272 = undefined;
            var_1._id_519C = undefined;
            var_1 notify( "out_of_water" );
        }
    }
}

_id_A245()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( level._id_511A ) && level._id_511A && isagent( var_0 ) && isdefined( var_0._id_4949 ) && var_0._id_4949 == "Quad" && !isdefined( var_0._id_4FAA ) )
            var_0 thread _id_4979( self );

        if ( !isplayer( var_0 ) && !isai( var_0 ) )
            continue;

        if ( !isalive( var_0 ) )
            continue;

        if ( !isdefined( var_0._id_4FAA ) )
        {
            var_0 _id_6C02( 1 );
            var_0 thread _id_6CCE( self );
        }
    }
}

_id_4979( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    _id_6C02( 1 );

    for (;;)
    {
        if ( !_id_4E82( var_0, 40 ) )
        {
            wait 2.5;

            if ( !_id_4E82( var_0, 20 ) )
                self _meth_8051( self._id_01E7, self._id_02E6 );
        }

        waittillframeend;
    }
}

_id_6CCE( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    thread _id_4FAB( var_0 );
    thread _id_6D8F();
    self._id_35B1 = 0;
    self._id_35B0 = 0;

    for (;;)
    {
        if ( _id_A75A::_id_51E0() )
        {
            if ( isdefined( self._id_99FC ) && isdefined( self._id_519C ) )
            {
                self _meth_8184();
                self._id_519C = undefined;
            }
        }
        else if ( isdefined( self._id_99FC ) && !isdefined( self._id_519C ) )
        {
            self _meth_8182( "underwater", 19, 0, 0 );
            self._id_519C = 1;
        }

        if ( !self _meth_80A9( var_0 ) )
        {
            _id_6C02( 0 );
            self._id_99FC = undefined;
            self._id_4EBF = undefined;
            self._id_51C1 = undefined;
            self._id_5F78 = level._id_1317;
            _id_A7B4::_id_9B35();
            self notify( "out_of_water" );
            break;
        }

        if ( isdefined( self._id_4EBF ) && _id_4E82( var_0, 32 ) )
        {
            self._id_4EBF = undefined;
            self._id_5F78 = level._id_1317;
            _id_A7B4::_id_9B35();
        }

        if ( _id_4E82( var_0, 32 ) )
        {
            self._id_4EBF = undefined;

            if ( isdefined( level.watermovescale ) )
                self._id_5F78 = level._id_1317 * level.watermovescale;
            else
                self._id_5F78 = level._id_1317;

            _id_A7B4::_id_9B35();
        }

        if ( !isdefined( self._id_4EBF ) && !_id_4E82( var_0, 32 ) )
        {
            self._id_4EBF = 1;
            self._id_5F78 = 0.7 * level._id_1317;
            _id_A7B4::_id_9B35();
        }

        if ( !isdefined( self._id_99FC ) && !_id_50A2( var_0, 0 ) )
        {
            if ( isdefined( self.balldropdelay ) && self.balldropdelay > 0 )
            {
                self.balldropdelay--;
                waittillframeend;
                continue;
            }

            self._id_99FC = 1;

            if ( isdefined( level.waterplayerhandledamagefunc ) )
                self thread [[ level.waterplayerhandledamagefunc ]]();
            else
                thread _id_6CB6();

            if ( _id_A75A::_id_50C1() )
                _id_2B0E();

            if ( !_id_A75A::_id_51E0() )
            {
                self _meth_8182( "underwater", 19, 0, 0 );
                self._id_519C = 1;
            }

            var_1 = self _meth_8311();

            if ( var_1 != "none" )
            {
                var_2 = _func_1DF( var_1 );

                if ( var_2 == "primary" || var_2 == "altmode" )
                    self._id_A272 = var_1;
                else if ( isdefined( self._id_55C3 ) && self _meth_8314( self._id_55C3 ) )
                    self._id_A272 = self._id_55C3;
            }

            if ( isdefined( level._id_3BF5 ) )
                self [[ level._id_3BF5 ]]( var_0 );

            if ( isdefined( level.hordeonunderwater ) )
                self [[ level.hordeonunderwater ]]( var_0 );

            if ( !level.iszombiegame )
                _id_A7BB::_id_6D65();
        }

        if ( isdefined( self._id_99FC ) && ( isdefined( self._id_51C1 ) || !isdefined( self._id_51FE ) ) && ( _id_4E82( var_0, level._id_906E ) || self _meth_817C() == "prone" || !level._id_0A9D ) )
        {
            self._id_51FE = 1;
            self._id_51C1 = undefined;
            _id_6C8A();

            if ( isdefined( self._id_512E ) && self._id_512E == 1 )
            {
                _id_6C97( "none" );
                self _meth_8131( 0 );
                self _meth_84BF();
            }
            else if ( !isdefined( level.iszombiegame ) || !_func_2D9( self ) )
                _id_6C97( "shallow" );
        }

        if ( isdefined( self._id_99FC ) && ( isdefined( self._id_51FE ) || !isdefined( self._id_51C1 ) ) && ( !_id_4E82( var_0, level._id_906E ) && self _meth_817C() != "prone" && level._id_0A9D ) )
        {
            self._id_51C1 = 1;
            self._id_51FE = undefined;
            _id_6C8A();

            if ( isdefined( self._id_512E ) && self._id_512E == 1 )
            {
                _id_6C97( "none" );
                self _meth_8131( 0 );
                self _meth_84BF();
            }
            else if ( !isdefined( level.iszombiegame ) || !_func_2D9( self ) )
                _id_6C97( "deep" );
        }

        if ( isdefined( self.balldropdelay ) )
            self.balldropdelay = getdvarint( "scr_ball_water_drop_delay", 10 );

        if ( isdefined( self._id_99FC ) && _id_50A2( var_0, 0 ) )
        {
            self._id_99FC = undefined;
            self._id_51C1 = undefined;
            self._id_51FE = undefined;
            self notify( "above_water" );
            var_3 = distance( self _meth_8339(), ( 0, 0, 0 ) );
            var_4 = ( self._id_02E6[0], self._id_02E6[1], _id_415C( var_0 ) );
            playfx( level._id_058F["water_splash_emerge"], var_4, anglestoforward( ( 0, self._id_0041[1], 0 ) + ( 270, 180, 0 ) ) );

            if ( !_id_A75A::_id_51E0() )
            {
                self _meth_8184();
                self._id_519C = undefined;
            }

            _id_6C8A();

            if ( _id_A75A::_id_50C1() )
                _id_310D();

            if ( !level.iszombiegame )
                _id_A7BB::_id_6D5F();
        }

        wait 0.05;
    }
}

_id_50A4( var_0 )
{
    if ( isdefined( var_0._id_539A ) )
    {
        var_1 = self._id_030D["killstreaks"][self._id_539A]._id_8F20;

        if ( isdefined( var_1 ) )
        {
            if ( _id_A4F0::_id_8F4F( var_1, "turret" ) > 0 || _id_A4F0::_id_8F4F( var_1, "sentry" ) > 0 )
                return 1;
        }
    }

    return 0;
}

_id_6D8F()
{
    var_0 = _id_A4F0::_id_A067( "death", "out_of_water" );
    self._id_9A19 = undefined;
    self._id_2D20 = undefined;
    _id_6C02( 0 );
    self._id_99FC = undefined;
    self._id_4EBF = undefined;
    self._id_A272 = undefined;
    self._id_5F78 = level._id_1317;
    _id_A7B4::_id_9B35();
}

_id_4FAB( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "out_of_water" );
    var_1 = distance( self _meth_8339(), ( 0, 0, 0 ) );

    if ( var_1 > 90 )
    {
        var_2 = ( self._id_02E6[0], self._id_02E6[1], _id_415C( var_0 ) );
        playfx( level._id_058F["water_splash_enter"], var_2, anglestoforward( ( 0, self._id_0041[1], 0 ) + ( 270, 180, 0 ) ) );
    }

    for (;;)
    {
        var_3 = self _meth_8339();
        var_1 = distance( var_3, ( 0, 0, 0 ) );

        if ( var_1 > 0 )
            wait(max( 1 - var_1 / 120, 0.1 ));
        else
            wait 0.3;

        if ( var_1 > 5 )
        {
            var_4 = vectornormalize( ( var_3[0], var_3[1], 0 ) );
            var_5 = anglestoforward( vectortoangles( var_4 ) + ( 270, 180, 0 ) );
            var_2 = ( self._id_02E6[0], self._id_02E6[1], _id_415C( var_0 ) ) + var_1 / 4 * var_4;
            playfx( level._id_058F["water_wake"], var_2, var_5 );
            continue;
        }

        var_2 = ( self._id_02E6[0], self._id_02E6[1], _id_415C( var_0 ) );
        playfx( level._id_058F["water_wake_stationary"], var_2, anglestoforward( ( 0, self._id_0041[1], 0 ) + ( 270, 180, 0 ) ) );
    }
}

_id_6CB6()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stopped_using_remote" );
    self endon( "disconnect" );
    self endon( "above_water" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    thread _id_64CF();
    wait 13;

    for (;;)
    {
        if ( !isdefined( self._id_512E ) || self._id_512E == 0 )
            radiusdamage( self._id_02E6 + anglestoforward( self._id_0041 ) * 5, 1, 20, 20, undefined, "MOD_TRIGGER_HURT" );

        wait 1;
    }
}

_id_64CF()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "above_water" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        _id_A4F0::_id_A060( "death", "becameSpectator" );
    else
        self waittill( "death" );

    _id_6C02( 0 );
    self._id_99FC = undefined;
    self._id_4EBF = undefined;
    self._id_51C1 = undefined;
    self._id_51FE = undefined;
    self._id_A272 = undefined;
    self._id_9A19 = undefined;
    self._id_35B0 = 0;
    self._id_35B1 = 0;

    if ( !level.iszombiegame )
        _id_A7BB::_id_6D5F();
}

_id_4E82( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 32;

    if ( level _id_415C( var_0 ) - self._id_02E6[2] <= var_1 )
        return 1;

    return 0;
}

_id_50A2( var_0, var_1 )
{
    if ( _id_4088() + var_1 >= level _id_415C( var_0 ) )
        return 1;
    else
        return 0;
}

_id_4088()
{
    var_0 = self _meth_80A8();
    self._id_35B0 = var_0[2] - self._id_35B1;
    self._id_35B1 = var_0[2];
    return var_0[2];
}

_id_415C( var_0 )
{
    var_1 = _id_A4F0::_id_40F9( var_0._id_04A5, "targetname" );
    var_2 = var_1._id_02E6[2];
    return var_2;
}

_id_6C97( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "end_swimming" );

    if ( !isdefined( var_0 ) )
        var_0 = "shallow";

    if ( var_0 == "shallow" && self _meth_8314( level._id_83AC ) || var_0 == "deep" && self _meth_8314( level._id_2763 ) || isdefined( level.disable_water_weapon_swap ) )
        self._id_2D20 = 1;

    switch ( var_0 )
    {
        case "deep":
            _id_41D7( level._id_2763 );
            self _meth_8316( level._id_2763 );
            self._id_9A19 = "deep";
            break;
        case "shallow":
            _id_41D7( level._id_83AC );
            self _meth_8316( level._id_83AC );
            self._id_9A19 = "shallow";
            break;
        case "none":
            self._id_9A19 = "none";
            break;
        default:
            _id_41D7( level._id_83AC );
            self _meth_8316( level._id_83AC );
            self._id_9A19 = "shallow";
            break;
    }

    self _meth_82CB();
    _id_A4F0::_id_0588();
    _id_A4F0::_id_0585();
}

_id_6C8A()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( self._id_9A19 ) )
    {
        var_0 = self._id_9A19;
        self notify( "end_swimming" );
        self _meth_82CC();
        _id_A4F0::_id_0596();
        _id_A4F0::_id_0593();

        if ( isdefined( self._id_512E ) && self._id_512E == 1 && isdefined( self._id_4798 ) )
        {
            self _meth_8131( 1 );

            if ( !isdefined( self._id_4798._id_4733 ) || self._id_4798._id_4733 == 0 )
                self _meth_831F();

            if ( !isdefined( self._id_4798._id_473F ) || self._id_4798._id_473F == 0 )
                self _meth_84BF();
            else
                self _meth_84C0();
        }

        if ( isdefined( level._id_511A ) && isplayer( self ) )
            _id_A7B4::_id_74B0( "underwater" );
        else if ( isdefined( self._id_A272 ) )
            _id_A75A::_id_9074( self._id_A272 );

        switch ( var_0 )
        {
            case "deep":
                _id_9116( level._id_2763 );
                break;
            case "shallow":
                _id_9116( level._id_83AC );
                break;
            case "none":
                break;
            default:
                _id_9116( level._id_83AC );
                break;
        }

        self._id_9A19 = undefined;
        self._id_2D20 = undefined;
    }
}

_id_41D7( var_0 )
{
    if ( !isdefined( self._id_2D20 ) || !self._id_2D20 )
        self _meth_830E( var_0 );
}

_id_9116( var_0 )
{
    if ( !isdefined( self._id_2D20 ) || !self._id_2D20 )
        self _meth_830F( var_0 );
}

_id_310D()
{
    _id_A75A::_id_6C5F( 1 );
    _id_A75A::_id_6C60( 1 );
    _id_A75A::_id_6C5D( 1 );
    _id_A75A::_id_6C61( 1 );
    _id_A75A::_id_6C5E( 1 );
}

_id_2B0E()
{
    _id_A75A::_id_6C5F( 0 );
    _id_A75A::_id_6C60( 0 );
    _id_A75A::_id_6C5D( 0 );
    _id_A75A::_id_6C61( 0 );
    _id_A75A::_id_6C5E( 0 );
}

_id_8000( var_0 )
{
    level._id_83AC = var_0;
}

_id_7F3F( var_0 )
{
    level._id_2763 = var_0;
}

_id_51F8( var_0 )
{
    switch ( var_0 )
    {
        case "none":
        case "iw5_combatknife_mp":
        case "iw5_underwater_mp":
            return 1;
        default:
            return 0;
    }
}
