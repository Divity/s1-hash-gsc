// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0 )
{
    var_0[var_0.size] = "airdrop_pallet";

    if ( _id_A75A::_id_50C1() )
        var_0[var_0.size] = "boost_add";
    else
        var_0[var_0.size] = "boost_remove";

    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_79EF ) )
        {
            var_3 = 1;
            var_4 = strtok( var_1[var_2]._id_79EF, " " );

            for ( var_5 = 0; var_5 < var_0.size; var_5++ )
            {
                for ( var_6 = 0; var_6 < var_4.size; var_6++ )
                {
                    if ( var_4[var_6] == var_0[var_5] )
                    {
                        var_3 = 0;
                        break;
                    }
                }

                if ( !var_3 )
                    break;
            }

            if ( var_3 )
            {
                if ( isdefined( var_1[var_2]._id_79BA ) )
                    common_scripts\_createfx::_id_73B0( var_1[var_2] );

                var_1[var_2] delete();
            }
        }
    }

    var_7 = getentarray( "boost_jump_border", "targetname" );

    if ( isdefined( var_7 ) )
    {
        foreach ( var_9 in var_7 )
            var_9 delete();
    }
}

_id_0209()
{
    level._id_629F = 0;
    level._id_630A = 0;
    level thread _id_64C5();
}

_id_64C5()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D3();
        var_0 thread _id_646A();
    }
}

_id_64D3()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( isdefined( self._id_3BF7 ) )
        {
            self._id_3BF7 = undefined;
            continue;
        }

        _id_4D31();
    }
}

_id_4D31()
{
    thread _id_6464();
    self._id_9408 = [];
    self._id_1BB6 = undefined;
    self._id_1E23 = undefined;
    self._id_1AD7 = 1;
    self._id_535C = undefined;
    self._id_4DDC = 1;
}

_id_6464()
{
    level endon( "game_ended" );
    self waittill( "death" );

    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_7F57();
}

_id_646A()
{
    level endon( "game_ended" );
    self waittill( "disconnect" );

    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_7F57();
}

_id_23E9( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_04D8 = "carryObject";
    var_4._id_24C8 = var_1._id_02E6;
    var_4._id_6637 = var_0;
    var_4._id_331B = var_1 _meth_81B1();

    if ( issubstr( var_1._id_00AB, "use" ) )
        var_4._id_9815 = "use";
    else
        var_4._id_9815 = "proximity";

    var_1._id_1315 = var_1._id_02E6;
    var_4._id_04C6 = var_1;
    var_4._id_9C14 = undefined;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_4._id_637C = var_3;

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_2[var_5]._id_1315 = var_2[var_5]._id_02E6;
        var_2[var_5]._id_1302 = var_2[var_5]._id_0041;
    }

    var_4._id_9E93 = var_2;
    var_4._id_20D0 = [];
    var_4._id_6302 = _id_403F();
    var_4._id_6303 = _id_403F();
    var_4._id_6306 = _id_403F();
    var_4._id_6308 = 0;
    var_4._id_6307 = 0;
    var_4._id_6310 = 5.0;
    level._id_630A += 2;
    objective_add( var_4._id_6302, "invisible", var_4._id_24C8 );
    objective_add( var_4._id_6303, "invisible", var_4._id_24C8 );
    objective_add( var_4._id_6306, "invisible", var_4._id_24C8 );
    objective_team( var_4._id_6302, "allies" );
    objective_team( var_4._id_6303, "axis" );
    _func_2B7( var_4._id_6306 );
    var_4._id_6313["allies"] = _id_A7A2::_id_2443( "objpoint_allies_" + var_4._id_331B, var_4._id_24C8 + var_3, "allies", undefined );
    var_4._id_6313["axis"] = _id_A7A2::_id_2443( "objpoint_axis_" + var_4._id_331B, var_4._id_24C8 + var_3, "axis", undefined );
    var_4._id_6313["mlg"] = _id_A7A2::_id_2443( "objpoint_mlg_" + var_4._id_331B, var_4._id_24C8 + var_3, "mlg", undefined );
    var_4._id_6313["mlg"]._id_0048 = 0;
    var_4._id_6313["allies"]._id_0037 = 0;
    var_4._id_6313["axis"]._id_0037 = 0;
    var_4._id_1BAF = undefined;
    var_4._id_518B = 0;
    var_4._id_4EA6 = "none";
    var_4._id_0AB5 = 0;
    var_4._id_A28D = 0;
    var_4._id_52DE = 0;
    var_4._id_A347 = [];
    var_4._id_1BB1 = 0;
    var_4._id_9E52 = "none";
    var_4._id_1BB5 = undefined;
    var_4._id_646C = undefined;
    var_4._id_64BF = undefined;
    var_4._id_64DD = undefined;

    if ( var_4._id_9815 == "use" )
        var_4 thread _id_1BBA();
    else
    {
        var_4._id_24C9 = 0;
        var_4._id_9C11 = 0;
        var_4._id_9C08 = 0;
        var_4._id_6007 = 0;
        var_4._id_1AC3 = 0;
        var_4._id_9200 = [];
        var_4._id_91FF = [];
        var_4._id_62AC["neutral"] = 0;
        var_4._id_62AC["axis"] = 0;
        var_4._id_62AC["allies"] = 0;
        var_4._id_62AC["none"] = 0;
        var_4._id_9406["neutral"] = [];
        var_4._id_9406["axis"] = [];
        var_4._id_9406["allies"] = [];
        var_4._id_9406["none"] = [];
        var_4._id_1E22 = "none";
        var_4._id_1E21 = undefined;
        var_4._id_5584 = "none";
        var_4._id_5585 = 0;

        if ( level._id_5FE9 )
        {
            foreach ( var_7 in level._id_91F0 )
            {
                var_4._id_62AC[var_7] = 0;
                var_4._id_9406[var_7] = [];
            }
        }

        var_4 thread _id_1BB8();
    }

    var_4 thread _id_9AF5();
    return var_4;
}

deletecarryobject()
{
    if ( self._id_04D8 != "carryObject" )
        return;

    var_0 = self;
    var_0._id_04D8 = undefined;
    var_0._id_24C8 = undefined;
    var_0._id_6637 = undefined;
    var_0._id_331B = undefined;
    var_0._id_9815 = undefined;
    var_0._id_04C6 _meth_804F();
    var_0._id_04C6 = undefined;
    var_0._id_9C14 = undefined;
    var_0._id_637C = undefined;

    foreach ( var_2 in var_0._id_9E93 )
        var_2 delete();

    var_0._id_9E93 = undefined;
    _id_A75A::_id_0603( var_0._id_6302 );
    _id_A75A::_id_0603( var_0._id_6303 );
    _id_A75A::_id_0603( var_0._id_6306 );
    var_0._id_20D0 = undefined;
    var_0._id_6302 = undefined;
    var_0._id_6303 = undefined;
    var_0._id_6306 = undefined;
    var_0._id_6308 = undefined;
    var_0._id_6307 = undefined;
    var_0._id_6310 = undefined;
    _id_A7A2::_id_2858( var_0._id_6313["allies"] );
    _id_A7A2::_id_2858( var_0._id_6313["axis"] );
    _id_A7A2::_id_2858( var_0._id_6313["mlg"] );
    var_0._id_6313 = undefined;
    var_0._id_1BAF = undefined;
    var_0._id_518B = undefined;
    var_0._id_4EA6 = undefined;
    var_0._id_0AB5 = undefined;
    var_0._id_A28D = undefined;
    var_0._id_52DE = undefined;
    var_0._id_A347 = undefined;
    var_0._id_1BB1 = undefined;
    var_0._id_9E52 = undefined;
    var_0._id_1BB5 = undefined;
    var_0._id_646C = undefined;
    var_0._id_64BF = undefined;
    var_0._id_64DD = undefined;
    var_0._id_24C9 = undefined;
    var_0._id_9C11 = undefined;
    var_0._id_9C08 = undefined;
    var_0._id_6007 = undefined;
    var_0._id_1AC3 = undefined;
    var_0._id_9200 = undefined;
    var_0._id_91FF = undefined;
    var_0._id_62AC = undefined;
    var_0._id_9406 = undefined;
    var_0._id_1E22 = undefined;
    var_0._id_1E21 = undefined;
    var_0._id_5584 = undefined;
    var_0._id_5585 = undefined;
    var_0 notify( "death" );
    var_0 notify( "deleted" );
}

_id_1BBA()
{
    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "death" );

    level endon( "game_ended" );

    for (;;)
    {
        self._id_04C6 waittill( "trigger", var_0 );

        if ( self._id_518B )
            continue;

        if ( !_id_A75A::_id_5186( var_0 ) )
            continue;

        if ( !_id_1ACA( var_0._id_030D["team"] ) )
            continue;

        if ( !var_0._id_1AD7 )
            continue;

        if ( !isdefined( var_0._id_4DDC ) )
            continue;

        if ( isdefined( var_0._id_9337 ) )
            continue;

        if ( isdefined( self._id_1BAF ) )
            continue;

        if ( var_0 _id_A75A::_id_51E0() || var_0 _id_A75A::_id_5128() )
            continue;

        _id_7FDC( var_0 );
    }
}

_id_1BB8()
{
    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "death" );

    thread _id_1BB9();
}

_id_1BB9()
{
    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "death" );

    level endon( "game_ended" );
    thread _id_7041();

    for (;;)
    {
        waitframe;

        if ( self._id_9C11 && self._id_24C9 >= self._id_9C11 )
        {
            self._id_24C9 = 0;
            var_0 = _id_3F77();

            if ( isdefined( self._id_648B ) )
                self [[ self._id_648B ]]( _id_3F2E(), var_0, isdefined( var_0 ) );

            if ( isdefined( var_0 ) )
                _id_7FDC( var_0 );

            _id_7F34( "none" );
            self._id_1E21 = undefined;
        }

        if ( self._id_1E22 != "none" )
        {
            if ( self._id_9C11 )
            {
                if ( !self._id_62AC[self._id_1E22] )
                {
                    if ( isdefined( self._id_648B ) )
                        self [[ self._id_648B ]]( _id_3F2E(), self._id_1E21, 0 );

                    _id_7F34( "none" );
                    self._id_1E21 = undefined;
                }
                else
                {
                    self._id_24C9 += 50 * self._id_9C08;

                    if ( isdefined( self._id_64F9 ) )
                        self [[ self._id_64F9 ]]( _id_3F2E(), self._id_24C9 / self._id_9C11, 50 * self._id_9C08 / self._id_9C11 );
                }
            }
            else
            {
                if ( _id_A75A::_id_5186( self._id_1E21 ) )
                    _id_7FDC( self._id_1E21 );

                _id_7F34( "none" );
                self._id_1E21 = undefined;
            }
        }

        wait 0.05;
        _id_A79A::_id_A0D4();
    }
}

_id_6812( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self._id_1AD7 = 0;

    for (;;)
    {
        if ( distancesquared( self._id_02E6, var_0 ) > 4096 )
            break;

        wait 0.2;
    }

    self._id_1AD7 = 1;
}

_id_7FDC( var_0 )
{
    if ( isai( var_0 ) && isdefined( var_0._id_02E9 ) )
        return;

    if ( isdefined( var_0._id_1BB6 ) )
    {
        if ( isdefined( self._id_64C0 ) )
            self [[ self._id_64C0 ]]( var_0 );

        return;
    }

    var_0 _id_41F1( self );
    _id_7F2E( var_0 );

    for ( var_1 = 0; var_1 < self._id_9E93.size; var_1++ )
        self._id_9E93[var_1] _meth_8054();

    self._id_04C6._id_02E6 += ( 0, 0, 10000 );
    self notify( "pickup_object" );

    if ( isdefined( self._id_64BF ) )
        self [[ self._id_64BF ]]( var_0 );

    _id_9B01();
    _id_9BA1();
}

_id_9AF5()
{
    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "death" );

    level endon( "game_ended" );

    for (;;)
    {
        if ( isdefined( self._id_1BAF ) )
        {
            self._id_24C8 = self._id_1BAF._id_02E6 + ( 0, 0, 75 );
            self._id_6313["allies"] _id_A7A2::_id_9B3C( self._id_24C8 );
            self._id_6313["axis"] _id_A7A2::_id_9B3C( self._id_24C8 );

            if ( ( self._id_9E52 == "friendly" || self._id_9E52 == "any" ) && _id_510C( "allies" ) && self._id_6308 )
            {
                if ( self._id_6313["allies"]._id_51A2 )
                {
                    self._id_6313["allies"]._id_0037 = self._id_6313["allies"]._id_1301;
                    self._id_6313["allies"] _meth_8084( self._id_6310 + 1.0 );
                    self._id_6313["allies"]._id_0037 = 0;
                }

                objective_position( self._id_6302, self._id_24C8 );
            }
            else if ( ( self._id_9E52 == "friendly" || self._id_9E52 == "any" ) && _id_510C( "axis" ) && self._id_6308 )
            {
                if ( self._id_6313["axis"]._id_51A2 )
                {
                    self._id_6313["axis"]._id_0037 = self._id_6313["axis"]._id_1301;
                    self._id_6313["axis"] _meth_8084( self._id_6310 + 1.0 );
                    self._id_6313["axis"]._id_0037 = 0;
                }

                objective_position( self._id_6303, self._id_24C8 );
            }

            if ( ( self._id_9E52 == "enemy" || self._id_9E52 == "any" ) && !_id_510C( "allies" ) && self._id_6307 )
            {
                if ( self._id_6313["allies"]._id_51A2 )
                {
                    self._id_6313["allies"]._id_0037 = self._id_6313["allies"]._id_1301;
                    self._id_6313["allies"] _meth_8084( self._id_6310 + 1.0 );
                    self._id_6313["allies"]._id_0037 = 0;
                }

                objective_position( self._id_6302, self._id_24C8 );
            }
            else if ( ( self._id_9E52 == "enemy" || self._id_9E52 == "any" ) && !_id_510C( "axis" ) && self._id_6307 )
            {
                if ( self._id_6313["axis"]._id_51A2 )
                {
                    self._id_6313["axis"]._id_0037 = self._id_6313["axis"]._id_1301;
                    self._id_6313["axis"] _meth_8084( self._id_6310 + 1.0 );
                    self._id_6313["axis"]._id_0037 = 0;
                }

                objective_position( self._id_6303, self._id_24C8 );
            }

            _id_A75A::_id_9F7C( self._id_6310, "dropped", "reset" );
            continue;
        }

        self._id_6313["allies"] _id_A7A2::_id_9B3C( self._id_24C8 + self._id_637C );
        self._id_6313["axis"] _id_A7A2::_id_9B3C( self._id_24C8 + self._id_637C );
        wait 0.05;
    }
}

_id_486D()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );
    level waittill( "game_ended" );

    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5._id_0037 = 0;
}

_id_41F1( var_0 )
{
    self._id_1BB6 = var_0;
    thread _id_94B1();

    if ( isdefined( var_0._id_1BBB ) )
    {
        var_0._id_1BB2 = self _meth_8312();
        var_0._id_1BB0 = self _meth_8314( var_0._id_1BBB );

        if ( isdefined( var_0._id_1BBC ) )
            self thread [[ var_0._id_1BBC ]]();

        self _meth_830E( var_0._id_1BBB );
        self _meth_8316( var_0._id_1BBB );
        self _meth_82CB();
        _id_A4F0::_id_0588();
    }
    else if ( !var_0._id_0AB5 )
    {
        _id_A4F0::_id_0587();

        if ( isdefined( var_0._id_5973 ) )
            self thread [[ var_0._id_5973 ]]();
        else
            thread _id_5973();
    }

    if ( isdefined( var_0._id_1BB5 ) && isplayer( self ) )
    {
        if ( level._id_8A76 )
        {
            self._id_1BB5 = _id_A79D::_id_2420( var_0._id_1BB5, 33, 33 );
            self._id_1BB5 _id_A79D::_id_7FE8( "BOTTOM RIGHT", "BOTTOM RIGHT", -50, -78 );
        }
        else
        {
            self._id_1BB5 = _id_A79D::_id_2420( var_0._id_1BB5, 50, 50 );
            self._id_1BB5 _id_A79D::_id_7FE8( "BOTTOM RIGHT", "BOTTOM RIGHT", -90, -110 );
        }

        self._id_1BB5._id_01EE = 1;
        thread _id_486D();
    }

    if ( isdefined( var_0._id_4270 ) )
        self thread [[ var_0._id_4270 ]]();
}

_id_74DC()
{
    self._id_518B = 1;
    self notify( "reset" );

    for ( var_0 = 0; var_0 < self._id_9E93.size; var_0++ )
    {
        self._id_9E93[var_0]._id_02E6 = self._id_9E93[var_0]._id_1315;
        self._id_9E93[var_0]._id_0041 = self._id_9E93[var_0]._id_1302;
        self._id_9E93[var_0] _meth_8053();
    }

    self._id_04C6._id_02E6 = self._id_04C6._id_1315;
    self._id_24C8 = self._id_04C6._id_02E6;

    if ( isdefined( self._id_64DD ) )
        self [[ self._id_64DD ]]();

    _id_1EE6();
    _id_9BA1();
    _id_9B01();
    self._id_518B = 0;
}

_id_5119()
{
    if ( isdefined( self._id_1BAF ) )
        return 0;

    if ( self._id_24C8 != self._id_04C6._id_1315 )
        return 0;

    return 1;
}

_id_7FED( var_0, var_1 )
{
    self._id_518B = 1;

    for ( var_2 = 0; var_2 < self._id_9E93.size; var_2++ )
    {
        self._id_9E93[var_2]._id_02E6 = var_0;
        self._id_9E93[var_2]._id_0041 = var_1;
        self._id_9E93[var_2] _meth_8053();
    }

    self._id_04C6._id_02E6 = var_0;
    self._id_24C8 = self._id_04C6._id_02E6;
    _id_1EE6();
    _id_9BA1();
    _id_9B01();
    self._id_518B = 0;
}

_id_64D1()
{
    if ( isdefined( self._id_1BB6 ) )
        self._id_1BB6 thread _id_7F57();
}

_id_1BB7( var_0 )
{
    for ( var_1 = 0; var_1 < var_0._id_1BB6._id_9E93.size; var_1++ )
        var_0._id_1BB6._id_9E93[var_1] _meth_804F();

    var_0._id_1BB6._id_04C6 _meth_804F();
    var_0._id_1BB6 notify( "stop_pickup_timeout" );
    var_0._id_1BB6 _id_74DC();
}

_id_7F57()
{
    if ( isdefined( self._id_7F57 ) )
    {
        if ( [[ self._id_7F57 ]]() )
            return;
    }

    self._id_518B = 1;
    self notify( "dropped" );

    if ( isdefined( self._id_1BAF ) && self._id_1BAF._id_04A8 != "spectator" )
    {
        if ( isdefined( self._id_1BAF._id_0087 ) )
        {
            var_0 = playerphysicstrace( self._id_1BAF._id_02E6 + ( 0, 0, 20 ), self._id_1BAF._id_02E6 - ( 0, 0, 2000 ), self._id_1BAF._id_0087 );
            var_1 = bullettrace( self._id_1BAF._id_02E6 + ( 0, 0, 20 ), self._id_1BAF._id_02E6 - ( 0, 0, 2000 ), 0, self._id_1BAF._id_0087 );
        }
        else
        {
            var_0 = playerphysicstrace( self._id_1BAF._id_02E6 + ( 0, 0, 20 ), self._id_1BAF._id_02E6 - ( 0, 0, 2000 ) );
            var_1 = bullettrace( self._id_1BAF._id_02E6 + ( 0, 0, 20 ), self._id_1BAF._id_02E6 - ( 0, 0, 2000 ), 0 );
        }
    }
    else
    {
        var_0 = playerphysicstrace( self._id_77C9 + ( 0, 0, 20 ), self._id_77C9 - ( 0, 0, 20 ) );
        var_1 = bullettrace( self._id_77C9 + ( 0, 0, 20 ), self._id_77C9 - ( 0, 0, 20 ), 0, undefined );
    }

    var_2 = self._id_1BAF;

    if ( isdefined( var_0 ) )
    {
        var_3 = randomfloat( 360 );
        var_4 = var_0;

        if ( isdefined( self._id_9E92 ) )
            var_4 += self._id_9E92;

        if ( var_1["fraction"] < 1 && distance( var_1["position"], var_0 ) < 10.0 )
        {
            var_5 = ( cos( var_3 ), sin( var_3 ), 0 );
            var_5 = vectornormalize( var_5 - var_1["normal"] * vectordot( var_5, var_1["normal"] ) );
            var_6 = vectortoangles( var_5 );
        }
        else
            var_6 = ( 0, var_3, 0 );

        for ( var_7 = 0; var_7 < self._id_9E93.size; var_7++ )
        {
            self._id_9E93[var_7]._id_02E6 = var_4;
            self._id_9E93[var_7]._id_0041 = var_6;
            self._id_9E93[var_7] _meth_8053();
        }

        self._id_04C6._id_02E6 = var_4;
        self._id_24C8 = self._id_04C6._id_02E6;
        var_8 = spawnstruct();
        var_8._id_1BB6 = self;
        var_8._id_2662 = ::_id_1BB7;
        self._id_04C6 thread _id_A747::_id_45BC( var_8 );
        thread _id_6814();
    }

    if ( !isdefined( var_0 ) )
    {
        for ( var_7 = 0; var_7 < self._id_9E93.size; var_7++ )
        {
            self._id_9E93[var_7]._id_02E6 = self._id_9E93[var_7]._id_1315;
            self._id_9E93[var_7]._id_0041 = self._id_9E93[var_7]._id_1302;
            self._id_9E93[var_7] _meth_8053();
        }

        self._id_04C6._id_02E6 = self._id_04C6._id_1315;
        self._id_24C8 = self._id_04C6._id_1315;
    }

    if ( isdefined( self._id_646C ) )
        self [[ self._id_646C ]]( var_2 );

    _id_1EE6();
    _id_9B01();
    _id_9BA1();
    self._id_518B = 0;
}

_id_7F2E( var_0 )
{
    self._id_1BAF = var_0;
    thread _id_9B97();
}

_id_1EE6()
{
    if ( !isdefined( self._id_1BAF ) )
        return;

    self._id_1BAF _id_9127( self );
    self._id_1BAF = undefined;
    self notify( "carrier_cleared" );
}

_id_6814()
{
    self endon( "pickup_object" );
    self endon( "stop_pickup_timeout" );
    wait 0.05;

    if ( _id_51D4() )
    {
        _id_74DC();
        return;
    }

    if ( isdefined( self._id_1142 ) )
    {
        wait(self._id_1142);

        if ( !isdefined( self._id_1BAF ) )
            _id_74DC();
    }
}

_id_51D4()
{
    var_0 = getentarray( "out_of_bounds", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !self._id_9E93[0] _meth_80A9( var_0[var_1] ) )
            continue;

        return 1;
    }

    if ( !self._id_9E93[0] _meth_852A() )
    {
        var_0 = getentarray( "out_of_bounds_at_rest", "targetname" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( !self._id_9E93[0] _meth_80A9( var_0[var_1] ) )
                continue;

            return 1;
        }
    }

    var_2 = getentarray( "trigger_hurt", "classname" );

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
    {
        if ( !self._id_9E93[0] _meth_80A9( var_2[var_1] ) )
            continue;

        return 1;
    }

    if ( self._id_A28D )
    {
        var_3 = getentarray( "trigger_underwater", "targetname" );

        for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        {
            if ( !self._id_9E93[0] _meth_80A9( var_3[var_1] ) )
                continue;

            return 1;
        }
    }

    return 0;
}

_id_3F25( var_0 )
{
    if ( isdefined( var_0._id_1BB2 ) && self _meth_8314( var_0._id_1BB2 ) )
        return var_0._id_1BB2;

    var_1 = self _meth_830C();
    return var_1[0];
}

_id_9127( var_0 )
{
    if ( isdefined( self._id_1BB5 ) )
        self._id_1BB5 _id_A79D::_id_28E8();

    if ( isdefined( self ) )
        self._id_1BB6 = undefined;

    self notify( "drop_object" );

    if ( var_0._id_9815 == "proximity" )
        thread _id_6812( var_0._id_04C6._id_02E6 );

    if ( _id_A75A::_id_5186( self ) )
    {
        if ( isdefined( var_0._id_1BBB ) )
        {
            var_1 = isdefined( var_0._id_52D9 ) && var_0._id_52D9;

            if ( !var_0._id_1BB0 && !var_1 )
                self _meth_830F( var_0._id_1BBB );

            var_2 = _id_3F25( var_0 );
            self _meth_8315( var_2 );
            self _meth_82CC();
            _id_A4F0::_id_0596();
        }
        else if ( !var_0._id_0AB5 )
            _id_A4F0::_id_0595();
    }
}

_id_94B1()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    while ( isdefined( self._id_1BB6 ) && _id_A75A::_id_5186( self ) )
    {
        if ( self _meth_8341() )
        {
            var_0 = bullettrace( self._id_02E6 + ( 0, 0, 20 ), self._id_02E6 - ( 0, 0, 20 ), 0, undefined );

            if ( var_0["fraction"] < 1 )
                self._id_1BB6._id_77C9 = var_0["position"];
        }

        wait 0.05;
    }
}

_id_5973()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    for (;;)
    {
        while ( self _meth_833D() || self _meth_82EE() || self _meth_82EF() || self _meth_833F() )
            wait 0.05;

        while ( !self _meth_833D() && !self _meth_82EE() && !self _meth_82EF() && !self _meth_833F() )
            wait 0.05;

        if ( isdefined( self._id_1BB6 ) && !self _meth_833C() )
            self._id_1BB6 thread _id_7F57();
    }
}

_id_2873()
{
    if ( isdefined( self._id_6302 ) && isdefined( self._id_6303 ) )
    {
        _id_A75A::_id_0603( self._id_6302 );
        _id_A75A::_id_0603( self._id_6303 );
        _id_A75A::_id_0603( self._id_6306 );
    }

    if ( isdefined( self._id_6313 ) )
    {
        _id_A7A2::_id_2858( self._id_6313["allies"] );
        _id_A7A2::_id_2858( self._id_6313["axis"] );
        _id_A7A2::_id_2858( self._id_6313["mlg"] );
    }

    self._id_04C6 = undefined;
    self notify( "deleted" );
}

_id_244C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5._id_04D8 = "useObject";
    var_5._id_24C8 = var_1._id_02E6;
    var_5._id_6637 = var_0;
    var_5._id_331B = var_1 _meth_81B1();
    var_5._id_52E4 = undefined;

    if ( issubstr( var_1._id_00AB, "use" ) )
        var_5._id_9815 = "use";
    else
        var_5._id_9815 = "proximity";

    var_5._id_04C6 = var_1;

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        var_2[var_6]._id_1315 = var_2[var_6]._id_02E6;
        var_2[var_6]._id_1302 = var_2[var_6]._id_0041;
    }

    var_5._id_9E93 = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_5._id_637C = var_3;

    if ( !isdefined( var_4 ) || !var_4 )
    {
        var_5._id_20D0 = [];
        var_5._id_6302 = _id_403F();
        var_5._id_6303 = _id_403F();
        var_5._id_6306 = _id_403F();
        objective_add( var_5._id_6302, "invisible", var_5._id_24C8 );
        objective_add( var_5._id_6303, "invisible", var_5._id_24C8 );
        objective_add( var_5._id_6306, "invisible", var_5._id_24C8 );
        objective_team( var_5._id_6302, "allies" );
        objective_team( var_5._id_6303, "axis" );
        _func_2B7( var_5._id_6306 );
        var_5._id_6313["allies"] = _id_A7A2::_id_2443( "objpoint_allies_" + var_5._id_331B, var_5._id_24C8 + var_3, "allies", undefined );
        var_5._id_6313["axis"] = _id_A7A2::_id_2443( "objpoint_axis_" + var_5._id_331B, var_5._id_24C8 + var_3, "axis", undefined );
        var_5._id_6313["mlg"] = _id_A7A2::_id_2443( "objpoint_mlg_" + var_5._id_331B, var_5._id_24C8 + var_3, "mlg", undefined );
        var_5._id_6313["mlg"]._id_0048 = 0;
        var_5._id_6313["allies"]._id_0037 = 0;
        var_5._id_6313["axis"]._id_0037 = 0;
        var_5._id_6313["mlg"]._id_0037 = 0;
    }

    var_5._id_4EA6 = "none";
    var_5._id_52DE = 0;
    var_5._id_A347 = [];
    var_5._id_9E52 = "none";
    var_5._id_64F5 = undefined;
    var_5._id_6456 = undefined;
    var_5._id_9C10 = "default";
    var_5._id_9C11 = 10000;
    var_5._id_24C9 = 0;

    if ( var_5._id_9815 == "proximity" )
    {
        var_5._id_9200 = [];
        var_5._id_91FF = [];
        var_5._id_62AC["neutral"] = 0;
        var_5._id_62AC["axis"] = 0;
        var_5._id_62AC["allies"] = 0;
        var_5._id_62AC["none"] = 0;
        var_5._id_9406["neutral"] = [];
        var_5._id_9406["axis"] = [];
        var_5._id_9406["allies"] = [];
        var_5._id_9406["none"] = [];
        var_5._id_9C08 = 0;
        var_5._id_1E22 = "none";
        var_5._id_1E21 = undefined;
        var_5._id_5584 = "none";
        var_5._id_5585 = 0;
        var_5._id_6007 = 0;
        var_5._id_1AC3 = 0;

        if ( level._id_5FE9 )
        {
            foreach ( var_8 in level._id_91F0 )
            {
                var_5._id_62AC[var_8] = 0;
                var_5._id_9406[var_8] = [];
            }
        }

        var_5 thread _id_9C03();
    }
    else
    {
        var_5._id_9C08 = 1;
        var_5 thread _id_9C04();
    }

    return var_5;
}

_id_5F3A( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    if ( isdefined( self._id_04C6 ) )
    {
        self._id_04C6 _meth_8092();
        self._id_04C6._id_02E6 = var_0;
    }

    if ( isdefined( self._id_04C6._id_1315 ) )
        self._id_04C6._id_1315 = var_0;

    if ( isdefined( self._id_56D6 ) )
    {
        self._id_56D6 _meth_8092();
        self._id_56D6._id_02E6 = var_0;
    }

    if ( isdefined( self._id_9E93 ) )
    {
        foreach ( var_3 in self._id_9E93 )
        {
            var_3 _meth_8092();
            var_3._id_02E6 = var_0;
            var_3._id_1315 = var_0;
        }
    }

    if ( isdefined( self._id_02E6 ) )
        self._id_02E6 = var_0;

    if ( isdefined( self._id_24C8 ) )
        self._id_24C8 = var_0;

    if ( isdefined( self._id_01C1 ) )
    {
        if ( isdefined( self._id_01C1._id_7889 ) )
        {
            foreach ( var_6 in self._id_01C1._id_7889 )
                var_6._id_02E6 = var_0;
        }

        if ( isdefined( self._id_01C1._id_02E6 ) )
            self._id_01C1._id_02E6 = var_0;
    }

    if ( isdefined( self._id_6313 ) )
    {
        foreach ( var_9 in self._id_6313 )
            var_9 _id_A7A2::_id_9B3C( var_0 + var_1 );
    }

    if ( isdefined( self._id_6302 ) )
        objective_position( self._id_6302, var_0 );

    if ( isdefined( self._id_6303 ) )
        objective_position( self._id_6303, var_0 );

    if ( isdefined( self._id_6306 ) )
        objective_position( self._id_6306, var_0 );

    if ( isdefined( self._id_1305 ) )
    {
        self._id_1305 delete();
        var_11 = self._id_9E93[0]._id_02E6 + ( 0, 0, 32 );
        var_12 = self._id_9E93[0]._id_02E6 + ( 0, 0, -32 );
        var_13 = bullettrace( var_11, var_12, 0, undefined );
        var_14 = vectortoangles( var_13["normal"] );
        self._id_1306 = anglestoforward( var_14 );
        self._id_1308 = anglestoright( var_14 );
        self._id_1307 = var_13["position"];

        if ( level._id_01B5 == "dom" )
            maps\mp\gametypes\dom::_id_9B99();
    }
}

_id_7F93( var_0 )
{
    self._id_52E4 = var_0;
}

_id_9C04()
{
    level endon( "game_ended" );
    self endon( "deleted" );

    for (;;)
    {
        self._id_04C6 waittill( "trigger", var_0 );

        if ( !_id_A75A::_id_5186( var_0 ) )
            continue;

        if ( !_id_1ACA( var_0._id_030D["team"] ) )
            continue;

        if ( !var_0 _meth_8341() )
            continue;

        if ( var_0 _meth_851F() )
            continue;

        var_1 = var_0 _meth_8312();

        if ( !var_0 _id_A75A::_id_512E() && _id_A75A::_id_513A( var_1 ) && !issubstr( var_1, "turrethead" ) )
            continue;

        if ( !_id_1D11( var_0 ) )
        {
            if ( isdefined( self._id_6456 ) )
                self [[ self._id_6456 ]]( var_0 );

            continue;
        }

        if ( !var_0 _id_A4F0::_id_5204() )
            continue;

        var_2 = 1;

        if ( self._id_9C11 > 0 )
        {
            if ( isdefined( self._id_6451 ) )
                self [[ self._id_6451 ]]( var_0 );

            if ( !isdefined( self._id_52E4 ) )
                thread _id_1AF7();

            var_3 = var_0._id_030D["team"];
            var_2 = _id_9BFA( var_0 );
            self notify( "finished_use" );

            if ( isdefined( self._id_648B ) )
                self [[ self._id_648B ]]( var_3, var_0, var_2 );
        }

        if ( !var_2 )
            continue;

        if ( isdefined( self._id_64F5 ) )
            self [[ self._id_64F5 ]]( var_0 );
    }
}

_id_1D11( var_0 )
{
    if ( !isdefined( self._id_52E4 ) )
        return 1;

    if ( !isdefined( var_0._id_1BB6 ) )
        return 0;

    var_1 = self._id_52E4;

    if ( !isarray( var_1 ) )
        var_1 = [ var_1 ];

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0._id_1BB6 )
            return 1;
    }

    return 0;
}

_id_1AF7()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    self endon( "finished_use" );

    for (;;)
    {
        self._id_04C6 waittill( "trigger", var_0 );

        if ( !_id_A75A::_id_5186( var_0 ) )
            continue;

        if ( !_id_1ACA( var_0._id_030D["team"] ) )
            continue;

        if ( isdefined( self._id_6456 ) )
            self [[ self._id_6456 ]]( var_0 );
    }
}

_id_3F77()
{
    var_0 = self._id_1E22;

    if ( _id_A75A::_id_5186( self._id_1E21 ) )
        var_1 = self._id_1E21;
    else
        var_1 = undefined;

    if ( self._id_9406[var_0].size > 0 )
    {
        var_2 = undefined;
        var_3 = getarraykeys( self._id_9406[var_0] );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = self._id_9406[var_0][var_3[var_4]];

            if ( _id_A75A::_id_5186( var_5._id_031D ) && ( !isdefined( var_2 ) || var_5._id_8D3B < var_2 ) )
            {
                var_1 = var_5._id_031D;
                var_2 = var_5._id_8D3B;
            }
        }
    }

    return var_1;
}

_id_9C03()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    thread _id_7041();

    for (;;)
    {
        if ( self._id_9C11 && self._id_24C9 >= self._id_9C11 )
        {
            self._id_24C9 = 0;
            var_0 = _id_3F77();

            if ( isdefined( self._id_648B ) )
                self [[ self._id_648B ]]( _id_3F2E(), var_0, isdefined( var_0 ) );

            if ( isdefined( var_0 ) && isdefined( self._id_64F5 ) )
                self [[ self._id_64F5 ]]( var_0 );

            if ( !self._id_6007 )
            {
                _id_7F34( "none" );
                self._id_1E21 = undefined;
            }
        }

        if ( self._id_1E22 != "none" )
        {
            if ( self._id_9C11 && ( !self._id_6007 || _id_4076() != _id_3F2E() ) )
            {
                if ( !self._id_62AC[self._id_1E22] )
                {
                    if ( isdefined( self._id_648B ) )
                        self [[ self._id_648B ]]( _id_3F2E(), self._id_1E21, 0 );

                    _id_7F34( "none" );
                    self._id_1E21 = undefined;
                }
                else
                {
                    self._id_24C9 += 50 * self._id_9C08;

                    if ( self._id_24C9 <= 0 )
                    {
                        self._id_24C9 *= -1;
                        self._id_5584 = self._id_1E22;
                        _id_9B8F();
                    }

                    if ( isdefined( self._id_64F9 ) )
                        self [[ self._id_64F9 ]]( _id_3F2E(), self._id_24C9 / self._id_9C11, 50 * self._id_9C08 / self._id_9C11 );
                }
            }
            else if ( !self._id_6007 )
            {
                if ( isdefined( self._id_64F5 ) )
                    self [[ self._id_64F5 ]]( self._id_1E21 );

                if ( !self._id_6007 )
                {
                    _id_7F34( "none" );
                    self._id_1E21 = undefined;
                }
            }
            else if ( !self._id_62AC[self._id_1E22] )
            {
                if ( isdefined( self._id_64F3 ) )
                    self [[ self._id_64F3 ]]();

                _id_7F34( "none" );
                self._id_1E21 = undefined;
            }
            else if ( self._id_1AC3 )
            {
                var_1 = _id_4057( self._id_1E22 );

                if ( var_1 > 0 )
                {
                    if ( isdefined( self._id_645F ) )
                        self [[ self._id_645F ]]();

                    _id_7F34( "none" );
                    self._id_1E21 = undefined;
                }
            }
        }
        else if ( self._id_6007 && _id_4076() != "none" )
        {
            if ( !self._id_62AC[_id_4076()] )
            {
                if ( isdefined( self._id_64F3 ) )
                    self [[ self._id_64F3 ]]();
            }
            else if ( self._id_1AC3 && self._id_5584 != "none" && self._id_62AC[self._id_5584] )
            {
                var_1 = _id_4057( self._id_5584 );

                if ( var_1 == 0 )
                {
                    if ( isdefined( self._id_64F1 ) )
                        self [[ self._id_64F1 ]]( self._id_5584 );
                }
            }
        }

        wait 0.05;
        _id_A79A::_id_A0D4();
    }
}

_id_1AC0( var_0 )
{
    if ( isdefined( self._id_1BAF ) )
        return 0;

    if ( self._id_1AC3 )
    {
        var_1 = _id_4057( var_0._id_030D["team"] );

        if ( var_1 != 0 )
            return 0;
    }

    if ( _id_1D11( var_0 ) )
        return 1;

    return 0;
}

_id_7041()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    var_0 = self._id_331B;

    for (;;)
    {
        self._id_04C6 waittill( "trigger", var_1 );

        if ( !_id_A75A::_id_5186( var_1 ) )
            continue;

        if ( !_id_A75A::_id_510F( var_1 ) )
            continue;

        if ( isdefined( self._id_1BAF ) )
            continue;

        if ( var_1 _id_A75A::_id_51E0() || isdefined( var_1._id_89DF ) || var_1 _id_A75A::_id_5128() )
            continue;

        if ( isdefined( var_1._id_00AB ) && var_1._id_00AB == "script_vehicle" )
            continue;

        if ( !isdefined( var_1._id_4DDC ) )
            continue;

        if ( isdefined( self._id_60DD ) && self._id_60DD > gettime() )
            continue;

        if ( isdefined( self._id_1AFB ) && ![[ self._id_1AFB ]]( var_1 ) )
            continue;

        if ( _id_1ACA( var_1._id_030D["team"], var_1 ) && self._id_1E22 == "none" )
        {
            if ( _id_1AC0( var_1 ) )
            {
                if ( !_id_7040( var_1, self._id_9E93 ) )
                    continue;

                _id_7F34( var_1._id_030D["team"] );
                self._id_1E21 = var_1;
                var_2 = _id_40B3( var_1._id_030D["team"] );

                if ( isdefined( self._id_9200[var_2] ) )
                    self._id_9C11 = self._id_9200[var_2];

                if ( self._id_9C11 && isdefined( self._id_6451 ) )
                    self [[ self._id_6451 ]]( self._id_1E21 );
            }
            else if ( isdefined( self._id_6456 ) )
                self [[ self._id_6456 ]]( var_1 );
        }

        if ( _id_A75A::_id_5186( var_1 ) && !isdefined( var_1._id_9408[var_0] ) )
            var_1 thread _id_9814( self );
    }
}

_id_7040( var_0, var_1 )
{
    if ( !isdefined( self._id_740C ) || !self._id_740C )
        return 1;

    var_2 = [ 32, 16, 0 ];
    var_3 = undefined;

    if ( isdefined( var_1 ) && var_1.size )
    {
        if ( var_1.size > 1 )
        {

        }

        var_3 = var_1[0];
    }

    var_4 = var_0._id_02E6 - self._id_04C6._id_02E6;
    var_4 = ( var_4[0], var_4[1], 0 );
    var_4 = vectornormalize( var_4 );
    var_4 *= 5;

    foreach ( var_6 in var_2 )
    {
        var_7 = var_0 _meth_80A8();
        var_8 = self._id_04C6._id_02E6 + var_4 + ( 0, 0, var_6 );
        var_9 = bullettrace( var_7, var_8, 0, var_3, 0, 0, 0, 0, 1, 0, 0 );

        if ( var_9["fraction"] == 1 )
            return 1;
    }

    return 0;
}

_id_7F34( var_0 )
{
    if ( self._id_52DE )
    {
        if ( self._id_5584 == "none" )
            self._id_5584 = var_0;

        self._id_1E22 = var_0;
    }
    else
    {
        if ( self._id_1E22 == "none" && gettime() - self._id_5585 > 1000 )
            self._id_24C9 = 0;
        else if ( var_0 != "none" && var_0 != self._id_5584 )
            self._id_24C9 = 0;

        self._id_5584 = self._id_1E22;
    }

    self._id_5585 = gettime();
    self._id_1E22 = var_0;
    _id_9B8F();
}

_id_3F2E()
{
    return self._id_1E22;
}

_id_9814( var_0 )
{
    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        level endon( "game_ended" );
        var_0 endon( "deleted" );
    }

    var_1 = self._id_030D["team"];
    var_0._id_62AC[var_1]++;
    var_2 = self._id_444D;
    var_3 = spawnstruct();
    var_3._id_031D = self;
    var_3._id_8D3B = gettime();
    var_0._id_9406[var_1][var_2] = var_3;

    if ( !isdefined( var_0._id_623F ) )
        var_0._id_623F = 0;

    self._id_9408[var_0._id_331B] = var_0._id_04C6;
    var_0 _id_9B8F();

    while ( _id_A75A::_id_5186( self ) && isdefined( var_0._id_04C6 ) && ( self _meth_80A9( var_0._id_04C6 ) || _id_50C7( var_0._id_04C6 ) ) && !level._id_3BD8 )
    {
        if ( isplayer( self ) && var_0._id_9C11 )
        {
            _id_9B8C( var_0, 1 );
            _id_9B49( var_0, 0 );
        }

        wait 0.05;
    }

    if ( isdefined( self ) && isdefined( self._id_9408 ) )
    {
        if ( isplayer( self ) && var_0._id_9C11 )
        {
            _id_9B8C( var_0, 0 );
            _id_9B49( var_0, 1 );
        }

        self._id_9408[var_0._id_331B] = undefined;
    }

    if ( level._id_3BD8 )
        return;

    var_0._id_9406[var_1][var_2] = undefined;
    var_0._id_62AC[var_1]--;
    var_0 _id_9B8F();
}

_id_50C7( var_0 )
{
    if ( !isdefined( level._id_0AA0 ) || !level._id_0AA0 )
        return 0;

    if ( !_id_A75A::_id_50C1() )
        return 0;

    if ( !self _meth_83B4() )
        return 0;

    var_1 = _func_220( self._id_02E6, var_0._id_02E6 );

    if ( var_1 < var_0._id_0354 * var_0._id_0354 )
        return 1;

    return 0;
}

_id_9B49( var_0, var_1 )
{
    var_2 = self._id_030D["team"];

    if ( var_1 || !var_0 _id_1ACA( var_2 ) || var_2 != var_0._id_1E22 || var_0._id_623F )
    {
        if ( isdefined( self._id_703E ) )
            self._id_703E _id_A79D::_id_486E();

        if ( isdefined( self._id_703F ) )
            self._id_703F _id_A79D::_id_486E();

        return;
    }

    if ( !isdefined( self._id_703E ) )
    {
        self._id_703E = _id_A79D::_id_2435();
        self._id_703E._id_5608 = undefined;
        self._id_703E._id_55A9 = 0;
    }

    if ( self._id_703E._id_483B )
    {
        self._id_703E _id_A79D::_id_8504();
        self._id_703E._id_5608 = undefined;
        self._id_703E._id_55A9 = 0;
    }

    if ( !isdefined( self._id_703F ) )
    {
        self._id_703F = _id_A79D::_id_2436();
        var_3 = var_0 _id_40B3( var_2 );

        if ( isdefined( var_0._id_91FF[var_3] ) )
            self._id_703F _meth_80CA( var_0._id_91FF[var_3] );
        else
            self._id_703F _meth_80CA( var_0._id_9C10 );
    }

    if ( self._id_703F._id_483B )
    {
        self._id_703F _id_A79D::_id_8504();
        var_3 = var_0 _id_40B3( var_2 );

        if ( isdefined( var_0._id_91FF[var_3] ) )
            self._id_703F _meth_80CA( var_0._id_91FF[var_3] );
        else
            self._id_703F _meth_80CA( var_0._id_9C10 );
    }

    if ( !isdefined( self._id_703E._id_5608 ) || self._id_703E._id_5608 != var_0._id_9C08 || self._id_703E._id_55A9 != isdefined( level._id_4A36 ) )
    {
        if ( var_0._id_24C9 > var_0._id_9C11 )
            var_0._id_24C9 = var_0._id_9C11;

        var_4 = var_0._id_24C9 / var_0._id_9C11;
        var_5 = 1000 / var_0._id_9C11 * var_0._id_9C08;

        if ( isdefined( level._id_4A36 ) )
            var_5 = 0;

        if ( var_0._id_52DE && !var_4 && var_5 < 0 )
            var_5 = 0;

        self._id_703E _id_A79D::_id_9AEF( var_4, var_5 );
        self._id_703E._id_5608 = var_0._id_9C08;
        self._id_703E._id_55A9 = isdefined( level._id_4A36 );
    }
}

_id_4057( var_0 )
{
    return self._id_62AC[_id_A75A::_id_4065( var_0 )];
}

_id_9B8C( var_0, var_1 )
{
    var_2 = level._id_01B5;
    var_3 = var_0._id_4B50;
    var_4 = 0;

    if ( !isdefined( level._id_4A36 ) )
    {
        if ( var_0._id_24C9 > var_0._id_9C11 )
            var_0._id_24C9 = var_0._id_9C11;

        var_5 = var_0._id_24C9 / var_0._id_9C11;

        if ( var_2 == "dom" && isdefined( var_3 ) && var_3 == "domFlag" )
        {
            if ( var_1 && isdefined( var_0._id_8AEB ) && var_0._id_8AEB )
            {
                var_6 = var_0 _id_3F77();
                var_4 = 1;

                if ( isdefined( var_6 ) && var_6._id_04A8 != self._id_04A8 )
                    var_5 = 0.01;
            }

            if ( !var_1 )
                var_5 = 0.01;

            if ( var_5 != 0 )
                self _meth_82FB( "ui_capture_progress", var_5 );
        }

        if ( ( var_2 == "sd" || var_2 == "sr" ) && isdefined( var_3 ) && ( var_3 == "bombZone" || var_3 == "defuseObject" ) )
        {
            if ( !var_1 )
                var_5 = 0;

            var_5 = max( 0.01, var_5 );

            if ( var_5 != 0 )
                self _meth_82FB( "ui_capture_progress", var_5 );
        }

        if ( var_2 == "twar" && isdefined( var_3 ) && var_3 == "twarZone" )
        {
            if ( !var_1 )
                var_5 = 0;

            var_5 = max( 0.01, var_5 );

            if ( var_5 != 0 )
                self _meth_82FB( "ui_capture_progress", var_5 );
        }

        if ( var_2 == "zombies" && isdefined( var_3 ) && var_3 == "defuseObject" )
        {
            if ( !var_1 )
                var_5 = 0;

            var_5 = max( 0.01, var_5 );

            if ( var_5 != 0 )
                self _meth_82FB( "ui_capture_progress", var_5 );
        }
    }

    if ( var_2 == "dom" && isdefined( var_3 ) && var_3 == "domFlag" )
    {
        if ( var_1 && var_0._id_6637 == self._id_04A8 )
            var_1 = 0;

        if ( !var_1 )
            self _meth_82FB( "ui_capture_icon", 0 );
        else if ( !var_4 )
        {
            if ( var_0._id_0245 == "_a" )
                self _meth_82FB( "ui_capture_icon", 1 );
            else if ( var_0._id_0245 == "_b" )
                self _meth_82FB( "ui_capture_icon", 2 );
            else if ( var_0._id_0245 == "_c" )
                self _meth_82FB( "ui_capture_icon", 3 );
        }
        else
            self _meth_82FB( "ui_capture_icon", 4 );
    }

    if ( ( var_2 == "sd" || var_2 == "sr" ) && isdefined( var_3 ) && ( var_3 == "bombZone" || var_3 == "defuseObject" ) )
    {
        if ( !var_1 )
            self _meth_82FB( "ui_capture_icon", 0 );
        else if ( var_0 _id_510C( self._id_030D["team"] ) )
            self _meth_82FB( "ui_capture_icon", 2 );
        else
            self _meth_82FB( "ui_capture_icon", 1 );
    }

    if ( var_2 == "twar" && isdefined( var_3 ) && var_3 == "twarZone" )
    {
        if ( !var_1 || isdefined( var_0._id_8AEB ) && var_0._id_8AEB )
            self _meth_82FB( "ui_capture_icon", 0 );
        else
            self _meth_82FB( "ui_capture_icon", 1 );
    }

    if ( var_2 == "zombies" && isdefined( var_3 ) && var_3 == "defuseObject" )
    {
        if ( !var_1 )
            self _meth_82FB( "ui_capture_icon", 0 );
        else
            self _meth_82FB( "ui_capture_icon", 1 );
    }
}

_id_9B8F()
{
    if ( isdefined( self._id_64F4 ) )
        self [[ self._id_64F4 ]]();
    else
        _id_9B90();
}

_id_9B90()
{
    var_0 = self._id_62AC[self._id_1E22];
    var_1 = 0;
    var_2 = 0;

    if ( level._id_5FE9 )
    {
        foreach ( var_4 in level._id_91F0 )
        {
            if ( self._id_1E22 != var_4 )
                var_1 += self._id_62AC[var_4];
        }
    }
    else
    {
        if ( self._id_1E22 != "axis" )
            var_1 += self._id_62AC["axis"];

        if ( self._id_1E22 != "allies" )
            var_1 += self._id_62AC["allies"];
    }

    foreach ( var_7 in self._id_9406[self._id_1E22] )
    {
        if ( !isdefined( var_7._id_031D ) )
            continue;

        if ( var_7._id_031D._id_030D["team"] != self._id_1E22 )
            continue;

        if ( var_7._id_031D._id_6300 == 1 )
            continue;

        var_0 *= var_7._id_031D._id_6300;
        var_2 = var_7._id_031D._id_6300;
    }

    self._id_9C08 = 0;
    self._id_8AEB = var_0 && var_1;

    if ( var_0 && !var_1 )
        self._id_9C08 = min( var_0, 4 );

    if ( isdefined( self._id_50B8 ) && self._id_50B8 && var_2 != 0 )
        self._id_9C08 = 1 * var_2;
    else if ( isdefined( self._id_50B8 ) && self._id_50B8 )
        self._id_9C08 = 1;

    if ( self._id_52DE && self._id_5584 != self._id_1E22 )
        self._id_9C08 *= -1;
}

_id_0E0B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "done_using" );
    wait 0.7;
    self _meth_801D( "npc_search_dstry_bomb", "tag_inhand", 1 );
    self._id_0DF9 = "npc_search_dstry_bomb";
}

_id_9BFA( var_0 )
{
    var_0 notify( "use_hold" );

    if ( isplayer( var_0 ) )
        var_0 _meth_807C( self._id_04C6 );
    else
        var_0 _meth_804D( self._id_04C6 );

    var_0 _meth_8081();
    var_0 _meth_8014( self._id_04C6 );
    var_0._id_1E23 = self._id_04C6;
    var_1 = self._id_9C14;
    var_2 = var_0 _meth_8311();

    if ( isdefined( var_1 ) )
    {
        if ( var_2 == var_1 )
            var_2 = var_0._id_55C3;

        var_0._id_55C3 = var_2;
        var_0 _id_A75A::_id_05C0( var_1 );
        var_0 _meth_82F7( var_1, 0 );
        var_0 _meth_82F6( var_1, 0 );
        var_0 _meth_8316( var_1 );

        if ( !isdefined( self.attachdefault3pmodel ) || self.attachdefault3pmodel == 1 )
            var_0 thread _id_0E0B();
    }
    else
        var_0 _id_A4F0::_id_0587();

    self._id_24C9 = 0;
    self._id_020E = 1;
    self._id_9C08 = 0;

    if ( isplayer( var_0 ) )
        var_0 thread _id_67E2( self );

    var_3 = _id_9BFC( var_0, var_2 );

    if ( isdefined( var_0 ) )
    {
        var_0 _id_2983();
        var_0 notify( "done_using" );
    }

    if ( isdefined( var_1 ) && isdefined( var_0 ) )
        var_0 thread _id_912A( var_1 );

    if ( isdefined( var_3 ) && var_3 )
        return 1;

    if ( isdefined( var_0 ) )
    {
        var_0._id_1E23 = undefined;

        if ( isdefined( var_1 ) )
        {
            if ( var_2 != "none" )
                var_0 _id_A75A::_id_9074( var_2 );
            else
                var_0 _meth_830F( var_1 );
        }
        else
            var_0 _id_A4F0::_id_0595();

        var_0 _meth_804F();

        if ( !_id_A75A::_id_5186( var_0 ) )
            var_0._id_535C = 1;
    }

    self._id_020E = 0;
    self._id_04C6 _meth_8016();
    return 0;
}

_id_2983()
{
    if ( isdefined( self._id_0DF9 ) )
    {
        self _meth_802A( self._id_0DF9, "tag_inhand" );
        self._id_0DF9 = undefined;
    }
}

_id_912A( var_0 )
{
    self endon( "use_hold" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( self _meth_8311() == var_0 && !isdefined( self._id_9337 ) )
        wait 0.05;

    self _meth_830F( var_0 );
}

_id_9C0F( var_0, var_1, var_2, var_3 )
{
    if ( !_id_A75A::_id_5186( var_0 ) )
        return 0;

    if ( !var_0 _meth_80A9( self._id_04C6 ) )
        return 0;

    if ( !var_0 _meth_833C() )
        return 0;

    if ( isdefined( var_0._id_9337 ) )
        return 0;

    if ( var_0 _meth_833F() )
        return 0;

    if ( self._id_24C9 >= self._id_9C11 )
        return 0;

    if ( !self._id_9C08 && !var_1 )
        return 0;

    if ( var_1 && var_2 > var_3 )
        return 0;

    return 1;
}

_id_9BFC( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disabled" );
    var_0 endon( "stop_useHoldThinkLoop" );
    var_2 = self._id_9C14;
    var_3 = 1;
    var_4 = 0;
    var_5 = 1.5;

    while ( _id_9C0F( var_0, var_3, var_4, var_5 ) )
    {
        var_4 += 0.05;

        if ( !isdefined( var_2 ) || var_0 _meth_8311() == var_2 )
        {
            self._id_24C9 += 50 * self._id_9C08;
            self._id_9C08 = 1 * var_0._id_6300;
            var_3 = 0;
        }
        else
            self._id_9C08 = 0;

        if ( self._id_24C9 >= self._id_9C11 )
        {
            self._id_020E = 0;
            var_0 _meth_8015( self._id_04C6 );
            var_0._id_1E23 = undefined;

            if ( isdefined( var_2 ) )
            {
                var_0 _meth_82F7( var_2, 1 );
                var_0 _meth_82F6( var_2, 1 );

                if ( var_1 != "none" )
                    var_0 _id_A75A::_id_9074( var_1 );
                else
                    var_0 _meth_830F( var_2 );
            }
            else
                var_0 _id_A4F0::_id_0595();

            var_0 _meth_804F();
            return _id_A75A::_id_5186( var_0 );
        }

        wait 0.05;
        _id_A79A::_id_A0D4();
    }

    return 0;
}

_id_67E2( var_0 )
{
    self endon( "disconnect" );
    var_1 = undefined;

    if ( !isdefined( var_0._id_623F ) || !var_0._id_623F )
        var_1 = _id_A79D::_id_2435();

    var_2 = undefined;

    if ( isdefined( var_1 ) && isdefined( var_0._id_9C10 ) )
    {
        var_2 = _id_A79D::_id_2436();
        var_2 _meth_80CA( var_0._id_9C10 );
    }

    var_3 = -1;
    var_4 = isdefined( level._id_4A36 );

    while ( _id_A75A::_id_5186( self ) && var_0._id_020E && !level._id_3BD8 )
    {
        if ( var_3 != var_0._id_9C08 || var_4 != isdefined( level._id_4A36 ) )
        {
            if ( var_0._id_24C9 > var_0._id_9C11 )
                var_0._id_24C9 = var_0._id_9C11;

            var_5 = var_0._id_24C9 / var_0._id_9C11;
            var_6 = 1000 / var_0._id_9C11 * var_0._id_9C08;

            if ( isdefined( level._id_4A36 ) )
                var_6 = 0;

            if ( isdefined( var_1 ) )
            {
                var_1 _id_A79D::_id_9AEF( var_5, var_6 );

                if ( !var_0._id_9C08 )
                {
                    var_1 _id_A79D::_id_486E();

                    if ( isdefined( var_2 ) )
                        var_2 _id_A79D::_id_486E();
                }
                else
                {
                    var_1 _id_A79D::_id_8504();

                    if ( isdefined( var_2 ) )
                        var_2 _id_A79D::_id_8504();
                }
            }
        }

        var_3 = var_0._id_9C08;
        var_4 = isdefined( level._id_4A36 );
        _id_9B8C( var_0, 1 );
        wait 0.05;
    }

    _id_9B8C( var_0, 0 );

    if ( isdefined( var_1 ) )
        var_1 _id_A79D::_id_28E8();

    if ( isdefined( var_2 ) )
        var_2 _id_A79D::_id_28E8();
}

_id_9B87()
{
    if ( self._id_9815 != "use" )
        return;

    if ( self._id_4EA6 == "none" )
        self._id_04C6._id_02E6 -= ( 0, 0, 50000 );
    else if ( self._id_4EA6 == "any" )
    {
        self._id_04C6._id_02E6 = self._id_24C8;
        self._id_04C6 _meth_8013( "none" );
    }
    else if ( self._id_4EA6 == "friendly" )
    {
        self._id_04C6._id_02E6 = self._id_24C8;

        if ( self._id_6637 == "allies" )
            self._id_04C6 _meth_8013( "allies" );
        else if ( self._id_6637 == "axis" )
            self._id_04C6 _meth_8013( "axis" );
        else
            self._id_04C6._id_02E6 -= ( 0, 0, 50000 );
    }
    else if ( self._id_4EA6 == "enemy" )
    {
        self._id_04C6._id_02E6 = self._id_24C8;

        if ( self._id_6637 == "allies" )
            self._id_04C6 _meth_8013( "axis" );
        else if ( self._id_6637 == "axis" )
            self._id_04C6 _meth_8013( "allies" );
        else
            self._id_04C6 _meth_8013( "none" );
    }
}

_id_9BA1()
{
    if ( self._id_9E52 == "any" )
    {
        _id_9BA0( "friendly", 1 );
        _id_9BA0( "enemy", 1 );
    }
    else if ( self._id_9E52 == "friendly" )
    {
        _id_9BA0( "friendly", 1 );
        _id_9BA0( "enemy", 0 );
    }
    else if ( self._id_9E52 == "enemy" )
    {
        _id_9BA0( "friendly", 0 );
        _id_9BA0( "enemy", 1 );
    }
    else
    {
        _id_9BA0( "friendly", 0 );
        _id_9BA0( "enemy", 0 );
    }

    _id_9BA0( "mlg", 1 );
}

_id_9BA0( var_0, var_1 )
{
    if ( !isdefined( self._id_A347[var_0] ) )
        var_1 = 0;

    var_2 = _id_4146( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = "objpoint_" + var_2[var_3] + "_" + self._id_331B;
        var_5 = _id_A7A2::_id_405C( var_4 );
        var_5 notify( "stop_flashing_thread" );
        var_5 thread _id_A7A2::_id_8EE0();

        if ( var_1 )
        {
            var_5 _meth_80CC( self._id_A347[var_0], level._id_6315, level._id_6315 );
            var_5 _meth_8084( 0.05 );
            var_5._id_0037 = var_5._id_1301;
            var_5._id_51A2 = 1;

            if ( isdefined( self._id_20D0[var_0] ) )
                var_5 _meth_80D8( 1, 1 );
            else
                var_5 _meth_80D8( 1, 0 );

            if ( self._id_04D8 == "carryObject" )
            {
                if ( isdefined( self._id_1BAF ) && !_id_849B( var_0 ) )
                    var_5 _meth_80CD( self._id_1BAF );
                else if ( !isdefined( self._id_1BAF ) && isdefined( self._id_62FD ) && self._id_62FD )
                    var_5 _meth_80CD( self._id_9E93[0] );
                else
                    var_5 _meth_80CE();
            }
        }
        else
        {
            var_5 _meth_8084( 0.05 );
            var_5._id_0037 = 0;
            var_5._id_51A2 = 0;
            var_5 _meth_80CE();
        }

        var_5 thread _id_4880();
    }
}

_id_4880()
{
    self notify( "hideWorldIconOnGameEnd" );
    self endon( "hideWorldIconOnGameEnd" );
    self endon( "death" );
    level waittill( "game_ended" );

    if ( isdefined( self ) )
        self._id_0037 = 0;
}

_id_9B82( var_0, var_1 )
{

}

_id_9B01()
{
    if ( self._id_9E52 == "any" )
    {
        _id_9B00( "friendly", 1 );
        _id_9B00( "enemy", 1 );
    }
    else if ( self._id_9E52 == "friendly" )
    {
        _id_9B00( "friendly", 1 );
        _id_9B00( "enemy", 0 );
    }
    else if ( self._id_9E52 == "enemy" )
    {
        _id_9B00( "friendly", 0 );
        _id_9B00( "enemy", 1 );
    }
    else
    {
        _id_9B00( "friendly", 0 );
        _id_9B00( "enemy", 0 );
    }

    _id_9B00( "mlg", 1 );
}

_id_9B00( var_0, var_1 )
{
    if ( !isdefined( self._id_20D0 ) )
        return;

    var_2 = _id_4146( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_1;

        if ( !var_4 && _id_84A4( var_2[var_3] ) )
            var_4 = 1;

        var_5 = self._id_6302;

        if ( var_2[var_3] == "axis" )
            var_5 = self._id_6303;

        if ( var_2[var_3] == "mlg" )
            var_5 = self._id_6306;

        if ( !isdefined( self._id_20D0[var_0] ) || !var_4 )
        {
            objective_state( var_5, "invisible" );
            continue;
        }

        objective_icon( var_5, self._id_20D0[var_0] );
        objective_state( var_5, "active" );

        if ( self._id_04D8 == "carryObject" )
        {
            if ( _id_A75A::_id_5186( self._id_1BAF ) && !_id_849B( var_0 ) )
            {
                objective_onentity( var_5, self._id_1BAF );
                continue;
            }

            if ( isdefined( self._id_62FD ) && self._id_62FD )
            {
                objective_onentity( var_5, self._id_9E93[0] );
                continue;
            }

            objective_position( var_5, self._id_24C8 );
        }
    }
}

_id_849B( var_0 )
{
    if ( var_0 == "friendly" && self._id_6308 )
        return 1;
    else if ( var_0 == "enemy" && self._id_6307 )
        return 1;

    return 0;
}

_id_4146( var_0 )
{
    var_1 = [];

    if ( var_0 == "friendly" )
    {
        if ( _id_510C( "allies" ) )
            var_1[var_1.size] = "allies";

        if ( _id_510C( "axis" ) )
            var_1[var_1.size] = "axis";
    }
    else if ( var_0 == "enemy" )
    {
        if ( !_id_510C( "allies" ) )
            var_1[var_1.size] = "allies";

        if ( !_id_510C( "axis" ) )
            var_1[var_1.size] = "axis";
    }
    else if ( var_0 == "mlg" )
        var_1[var_1.size] = "mlg";

    return var_1;
}

_id_84A4( var_0 )
{
    if ( var_0 == "mlg" )
        return 0;

    if ( !isdefined( self._id_1BAF ) )
        return 0;

    if ( self._id_1BAF _id_A75A::_id_05CB( "specialty_radarimmune" ) )
        return 0;

    return _func_176( var_0 );
}

_id_9B97()
{
    self endon( "death" );
    self endon( "carrier_cleared" );

    for (;;)
    {
        level waittill( "radar_status_change" );
        _id_9B01();
    }
}

_id_7FD4( var_0 )
{
    self._id_6637 = var_0;
    _id_9B87();
    _id_9B01();
    _id_9BA1();
}

_id_4076()
{
    return self._id_6637;
}

_id_8346( var_0 )
{
    self._id_9C11 = int( var_0 * 1000 );
}

_id_8345( var_0 )
{
    self._id_9C10 = var_0;
}

_id_8028( var_0, var_1 )
{
    self._id_9200[var_0] = int( var_1 * 1000 );
}

_id_8027( var_0, var_1 )
{
    self._id_91FF[var_0] = var_1;
}

_id_8344( var_0 )
{
    self._id_04C6 _meth_80DB( var_0 );
}

_id_0AA1( var_0 )
{
    self._id_4EA6 = var_0;
}

_id_0AB2( var_0 )
{
    self._id_4EA6 = var_0;
    _id_9B87();
}

_id_834C( var_0 )
{
    self._id_9E52 = var_0;
    _id_9B01();
    _id_9BA1();
}

_id_7FAF( var_0 )
{
    if ( var_0 )
    {
        for ( var_1 = 0; var_1 < self._id_9E93.size; var_1++ )
        {
            self._id_9E93[var_1] _meth_8053();

            if ( self._id_9E93[var_1]._id_00AB == "script_brushmodel" || self._id_9E93[var_1]._id_00AB == "script_model" )
            {
                foreach ( var_3 in level._id_0328 )
                {
                    if ( var_3 _meth_80A9( self._id_9E93[var_1] ) )
                        var_3 _id_A75A::_id_066F();
                }

                self._id_9E93[var_1] thread _id_5945();
            }
        }
    }
    else
    {
        for ( var_1 = 0; var_1 < self._id_9E93.size; var_1++ )
        {
            self._id_9E93[var_1] _meth_8054();

            if ( self._id_9E93[var_1]._id_00AB == "script_brushmodel" || self._id_9E93[var_1]._id_00AB == "script_model" )
            {
                self._id_9E93[var_1] notify( "changing_solidness" );
                self._id_9E93[var_1] _meth_82BF();
            }
        }
    }
}

_id_5945()
{
    self endon( "death" );
    self notify( "changing_solidness" );
    self endon( "changing_solidness" );

    for (;;)
    {
        for ( var_0 = 0; var_0 < level._id_0328.size; var_0++ )
        {
            if ( level._id_0328[var_0] _meth_80A9( self ) )
                break;
        }

        if ( var_0 == level._id_0328.size )
        {
            self _meth_82BE();
            break;
        }

        wait 0.05;
    }
}

_id_7F2F( var_0 )
{
    self._id_1BB1 = var_0;
}

_id_7F2C( var_0 )
{
    self._id_9C0E = var_0;
}

_id_7F0C( var_0, var_1 )
{
    self._id_20D0[var_0] = var_1;
    _id_9B01();
}

_id_7F0D( var_0, var_1 )
{
    self._id_A347[var_0] = var_1;
    _id_9BA1();
}

_id_7F0E( var_0, var_1 )
{
    self._id_A349[var_0] = var_1;
}

_id_7F30( var_0 )
{
    self._id_1BB5 = var_0;
}

_id_2B1D()
{
    self notify( "disabled" );

    if ( self._id_04D8 == "carryObject" )
    {
        if ( isdefined( self._id_1BAF ) )
            self._id_1BAF _id_9127( self );

        for ( var_0 = 0; var_0 < self._id_9E93.size; var_0++ )
            self._id_9E93[var_0] _meth_8054();
    }

    self._id_04C6 _id_A4F0::_id_97C4();
    _id_834C( "none" );
}

_id_3113()
{
    if ( self._id_04D8 == "carryObject" )
    {
        for ( var_0 = 0; var_0 < self._id_9E93.size; var_0++ )
            self._id_9E93[var_0] _meth_8053();
    }

    self._id_04C6 _id_A4F0::_id_97C6();
    _id_834C( "any" );
}

_id_40B3( var_0 )
{
    if ( var_0 == self._id_6637 )
        return "friendly";
    else
        return "enemy";
}

_id_510C( var_0 )
{
    var_1 = _id_3F2E();

    if ( self._id_6637 == "neutral" && var_1 != "none" && var_1 != var_0 )
        return 1;

    if ( self._id_6637 == "any" )
        return 1;

    if ( self._id_6637 == var_0 )
        return 1;

    return 0;
}

_id_1ACA( var_0, var_1 )
{
    switch ( self._id_4EA6 )
    {
        case "none":
            return 0;
        case "any":
            return 1;
        case "friendly":
            if ( var_0 == self._id_6637 )
                return 1;
            else
                return 0;
        case "enemy":
            if ( var_0 != self._id_6637 )
                return 1;
            else
                return 0;
        default:
            return 0;
    }
}

_id_51C8( var_0 )
{
    if ( var_0 == "neutral" )
        return 1;

    if ( var_0 == "allies" )
        return 1;

    if ( var_0 == "axis" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    foreach ( var_2 in level._id_91F0 )
    {
        if ( var_0 == var_2 )
            return 1;
    }

    return 0;
}

_id_5188( var_0 )
{
    if ( var_0 == "friendly" )
        return 1;

    if ( var_0 == "enemy" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    return 0;
}

_id_3F7F( var_0 )
{
    if ( level._id_5FE9 )
    {

    }

    if ( var_0 == "neutral" )
        return "none";
    else if ( var_0 == "allies" )
        return "axis";
    else
        return "allies";
}

_id_403F()
{
    if ( !isdefined( level._id_7263 ) || level._id_7263.size < 1 )
    {
        var_0 = level._id_629F;
        level._id_629F++;
    }
    else
    {
        var_0 = level._id_7263[level._id_7263.size - 1];
        level._id_7263[level._id_7263.size - 1] = undefined;
    }

    if ( var_0 > 31 )
    {
        if ( isdefined( level._id_511A ) && level._id_511A )
        {

        }

        var_0 = 31;
    }

    return var_0;
}

_id_3FF8()
{
    var_0 = self._id_04C6._id_0397;

    if ( !isdefined( var_0 ) )
    {
        var_0 = "";
        return var_0;
    }

    if ( var_0[0] != "_" )
        return "_" + var_0;

    return var_0;
}

_id_4DE0()
{
    self._id_606E = undefined;
    self._id_19DB = 0;
    self._id_6442 = undefined;
}

_id_6007( var_0 )
{
    self._id_6007 = var_0;
}

_id_1AC3( var_0 )
{
    self._id_1AC3 = var_0;
}

_id_3643()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = 120;
    var_1 = randomintrange( 30, 90 );
    var_0 += var_1;
    _id_A79A::_id_A049( var_0 );
    self waittill( "show_loot_notification" );
}
