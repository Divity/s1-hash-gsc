// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7FD6( var_0 )
{
    if ( isdefined( self._id_6682 ) && self._id_6682 == var_0 )
        return;

    if ( isdefined( self._id_6682 ) )
        self._id_6682 _id_7396( self );

    self._id_6682 = var_0;
    self._id_6682 _id_07D8( self );

    if ( isdefined( self._id_6E16 ) )
        _id_7FE8( self._id_6E16, self._id_7307, self._id_A396, self._id_A3B1 );
    else
        _id_7FE8( "TOPLEFT" );
}

_id_4078()
{
    return self._id_6682;
}

_id_07D8( var_0 )
{
    var_0._id_0205 = self._id_1D3D.size;
    self._id_1D3D[self._id_1D3D.size] = var_0;
}

_id_7396( var_0 )
{
    var_0._id_6682 = undefined;

    if ( self._id_1D3D[self._id_1D3D.size - 1] != var_0 )
    {
        self._id_1D3D[var_0._id_0205] = self._id_1D3D[self._id_1D3D.size - 1];
        self._id_1D3D[var_0._id_0205]._id_0205 = var_0._id_0205;
    }

    self._id_1D3D[self._id_1D3D.size - 1] = undefined;
    var_0._id_0205 = undefined;
}

_id_7FE8( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_5 = _id_4078();

    if ( var_4 )
        self _meth_8086( var_4 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self._id_A396 = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self._id_A3B1 = var_3;
    self._id_6E16 = var_0;
    self._id_002C = "center";
    self._id_002D = "middle";

    if ( issubstr( var_0, "TOP" ) )
        self._id_002D = "top";

    if ( issubstr( var_0, "BOTTOM" ) )
        self._id_002D = "bottom";

    if ( issubstr( var_0, "LEFT" ) )
        self._id_002C = "left";

    if ( issubstr( var_0, "RIGHT" ) )
        self._id_002C = "right";

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    self._id_7307 = var_1;
    var_6 = "center_adjustable";
    var_7 = "middle";

    if ( issubstr( var_1, "TOP" ) )
        var_7 = "top_adjustable";

    if ( issubstr( var_1, "BOTTOM" ) )
        var_7 = "bottom_adjustable";

    if ( issubstr( var_1, "LEFT" ) )
        var_6 = "left_adjustable";

    if ( issubstr( var_1, "RIGHT" ) )
        var_6 = "right_adjustable";

    if ( var_5 == level._id_99EC )
    {
        self._id_01F4 = var_6;
        self._id_0500 = var_7;
    }
    else
    {
        self._id_01F4 = var_5._id_01F4;
        self._id_0500 = var_5._id_0500;
    }

    if ( _id_A75A::_id_8F56( var_6, "_adjustable" ) == var_5._id_002C )
    {
        var_8 = 0;
        var_9 = 0;
    }
    else if ( var_6 == "center" || var_5._id_002C == "center" )
    {
        var_8 = int( var_5._id_0523 / 2 );

        if ( var_6 == "left_adjustable" || var_5._id_002C == "right" )
            var_9 = -1;
        else
            var_9 = 1;
    }
    else
    {
        var_8 = var_5._id_0523;

        if ( var_6 == "left_adjustable" )
            var_9 = -1;
        else
            var_9 = 1;
    }

    self._id_0530 = var_5._id_0530 + var_8 * var_9;

    if ( _id_A75A::_id_8F56( var_7, "_adjustable" ) == var_5._id_002D )
    {
        var_10 = 0;
        var_11 = 0;
    }
    else if ( var_7 == "middle" || var_5._id_002D == "middle" )
    {
        var_10 = int( var_5._id_01E9 / 2 );

        if ( var_7 == "top_adjustable" || var_5._id_002D == "bottom" )
            var_11 = -1;
        else
            var_11 = 1;
    }
    else
    {
        var_10 = var_5._id_01E9;

        if ( var_7 == "top_adjustable" )
            var_11 = -1;
        else
            var_11 = 1;
    }

    self._id_0538 = var_5._id_0538 + var_10 * var_11;
    self._id_0530 += self._id_A396;
    self._id_0538 += self._id_A3B1;

    switch ( self._id_3025 )
    {
        case "bar":
            _id_7FE9( var_0, var_1, var_2, var_3 );
            break;
    }

    _id_9AF9();
}

_id_7FE9( var_0, var_1, var_2, var_3 )
{
    self._id_12DB._id_01F4 = self._id_01F4;
    self._id_12DB._id_0500 = self._id_0500;
    self._id_12DB._id_002C = "left";
    self._id_12DB._id_002D = self._id_002D;
    self._id_12DB._id_0538 = self._id_0538;

    if ( self._id_002C == "left" )
        self._id_12DB._id_0530 = self._id_0530;
    else if ( self._id_002C == "right" )
        self._id_12DB._id_0530 = self._id_0530 - self._id_0523;
    else
        self._id_12DB._id_0530 = self._id_0530 - int( self._id_0523 / 2 );

    if ( self._id_002D == "top" )
        self._id_12DB._id_0538 = self._id_0538;
    else if ( self._id_002D == "bottom" )
        self._id_12DB._id_0538 = self._id_0538;

    _id_9AEF( self._id_12DB._id_3A06 );
}

_id_9AEF( var_0, var_1 )
{
    if ( self._id_3025 == "bar" )
        _id_9AF0( var_0, var_1 );
}

_id_9AF0( var_0, var_1 )
{
    var_2 = int( self._id_0523 * var_0 + 0.5 );

    if ( !var_2 )
        var_2 = 1;

    self._id_12DB._id_3A06 = var_0;
    self._id_12DB _meth_80CC( self._id_12DB._id_838C, var_2, self._id_01E9 );

    if ( isdefined( var_1 ) && var_2 < self._id_0523 )
    {
        if ( var_1 > 0 )
            self._id_12DB _meth_8085( ( 1 - var_0 ) / var_1, self._id_0523, self._id_01E9 );
        else if ( var_1 < 0 )
            self._id_12DB _meth_8085( var_0 / -1 * var_1, 1, self._id_01E9 );
    }

    self._id_12DB._id_7140 = var_1;
    self._id_12DB._id_5606 = gettime();
}

_id_2401( var_0, var_1 )
{
    var_2 = newclienthudelem( self );
    var_2._id_3025 = "font";
    var_2._id_018B = var_0;
    var_2._id_018C = var_1;
    var_2._id_1309 = var_1;
    var_2._id_0530 = 0;
    var_2._id_0538 = 0;
    var_2._id_0523 = 0;
    var_2._id_01E9 = int( level._id_397B * var_1 );
    var_2._id_A396 = 0;
    var_2._id_A3B1 = 0;
    var_2._id_1D3D = [];
    var_2 _id_7FD6( level._id_99EC );
    var_2._id_483B = 0;
    return var_2;
}

_id_243D( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = newteamhudelem( var_2 );
    else
        var_3 = newhudelem();

    var_3._id_3025 = "font";
    var_3._id_018B = var_0;
    var_3._id_018C = var_1;
    var_3._id_1309 = var_1;
    var_3._id_0530 = 0;
    var_3._id_0538 = 0;
    var_3._id_0523 = 0;
    var_3._id_01E9 = int( level._id_397B * var_1 );
    var_3._id_A396 = 0;
    var_3._id_A3B1 = 0;
    var_3._id_1D3D = [];
    var_3 _id_7FD6( level._id_99EC );
    var_3._id_483B = 0;
    return var_3;
}

_id_243F( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = newteamhudelem( var_2 );
    else
        var_3 = newhudelem();

    var_3._id_3025 = "timer";
    var_3._id_018B = var_0;
    var_3._id_018C = var_1;
    var_3._id_1309 = var_1;
    var_3._id_0530 = 0;
    var_3._id_0538 = 0;
    var_3._id_0523 = 0;
    var_3._id_01E9 = int( level._id_397B * var_1 );
    var_3._id_A396 = 0;
    var_3._id_A3B1 = 0;
    var_3._id_1D3D = [];
    var_3 _id_7FD6( level._id_99EC );
    var_3._id_483B = 0;
    return var_3;
}

_id_2447( var_0, var_1 )
{
    var_2 = newclienthudelem( self );
    var_2._id_3025 = "timer";
    var_2._id_018B = var_0;
    var_2._id_018C = var_1;
    var_2._id_1309 = var_1;
    var_2._id_0530 = 0;
    var_2._id_0538 = 0;
    var_2._id_0523 = 0;
    var_2._id_01E9 = int( level._id_397B * var_1 );
    var_2._id_A396 = 0;
    var_2._id_A3B1 = 0;
    var_2._id_1D3D = [];
    var_2 _id_7FD6( level._id_99EC );
    var_2._id_483B = 0;
    return var_2;
}

_id_2420( var_0, var_1, var_2 )
{
    var_3 = newclienthudelem( self );
    var_3._id_3025 = "icon";
    var_3._id_0530 = 0;
    var_3._id_0538 = 0;
    var_3._id_0523 = var_1;
    var_3._id_01E9 = var_2;
    var_3._id_1319 = var_3._id_0523;
    var_3._id_130A = var_3._id_01E9;
    var_3._id_A396 = 0;
    var_3._id_A3B1 = 0;
    var_3._id_1D3D = [];
    var_3 _id_7FD6( level._id_99EC );
    var_3._id_483B = 0;

    if ( isdefined( var_0 ) )
    {
        var_3 _meth_80CC( var_0, var_1, var_2 );
        var_3._id_838C = var_0;
    }

    return var_3;
}

_id_243E( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        var_4 = newteamhudelem( var_3 );
    else
        var_4 = newhudelem();

    var_4._id_3025 = "icon";
    var_4._id_0530 = 0;
    var_4._id_0538 = 0;
    var_4._id_0523 = var_1;
    var_4._id_01E9 = var_2;
    var_4._id_1319 = var_4._id_0523;
    var_4._id_130A = var_4._id_01E9;
    var_4._id_A396 = 0;
    var_4._id_A3B1 = 0;
    var_4._id_1D3D = [];
    var_4 _id_7FD6( level._id_99EC );
    var_4._id_483B = 0;

    if ( isdefined( var_0 ) )
    {
        var_4 _meth_80CC( var_0, var_1, var_2 );
        var_4._id_838C = var_0;
    }

    return var_4;
}

_id_243C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_4 ) )
        var_6 = newteamhudelem( var_4 );
    else
        var_6 = newhudelem();

    var_6._id_0530 = 0;
    var_6._id_0538 = 0;
    var_6._id_3A06 = 0;
    var_6._id_00C5 = var_0;
    var_6._id_03D5 = -2;
    var_6._id_838C = "progress_bar_fill";
    var_6 _meth_80CC( "progress_bar_fill", var_1, var_2 );
    var_6._id_483B = 0;

    if ( isdefined( var_3 ) )
        var_6._id_38B0 = var_3;

    if ( isdefined( var_4 ) )
        var_7 = newteamhudelem( var_4 );
    else
        var_7 = newhudelem();

    var_7._id_3025 = "bar";
    var_7._id_0530 = 0;
    var_7._id_0538 = 0;
    var_7._id_0523 = var_1;
    var_7._id_01E9 = var_2;
    var_7._id_A396 = 0;
    var_7._id_A3B1 = 0;
    var_7._id_12DB = var_6;
    var_7._id_1D3D = [];
    var_7._id_03D5 = -3;
    var_7._id_00C5 = ( 0, 0, 0 );
    var_7._id_0037 = 0.5;
    var_7 _id_7FD6( level._id_99EC );
    var_7 _meth_80CC( "progress_bar_bg", var_1, var_2 );
    var_7._id_483B = 0;
    return var_7;
}

_id_23E5( var_0, var_1, var_2, var_3 )
{
    var_4 = newclienthudelem( self );
    var_4._id_0530 = 0;
    var_4._id_0538 = 0;
    var_4._id_3A06 = 0;
    var_4._id_00C5 = var_0;
    var_4._id_03D5 = -2;
    var_4._id_838C = "progress_bar_fill";
    var_4 _meth_80CC( "progress_bar_fill", var_1, var_2 );
    var_4._id_483B = 0;

    if ( isdefined( var_3 ) )
        var_4._id_38B0 = var_3;

    var_5 = newclienthudelem( self );
    var_5._id_3025 = "bar";
    var_5._id_0523 = var_1;
    var_5._id_01E9 = var_2;
    var_5._id_A396 = 0;
    var_5._id_A3B1 = 0;
    var_5._id_12DB = var_4;
    var_5._id_1D3D = [];
    var_5._id_03D5 = -3;
    var_5._id_00C5 = ( 0, 0, 0 );
    var_5._id_0037 = 0.5;
    var_5 _id_7FD6( level._id_99EC );
    var_5 _meth_80CC( "progress_bar_bg", var_1 + 4, var_2 + 4 );
    var_5._id_483B = 0;
    return var_5;
}

_id_3F44()
{
    var_0 = self._id_12DB._id_3A06;

    if ( isdefined( self._id_12DB._id_7140 ) )
    {
        var_0 += ( gettime() - self._id_12DB._id_5606 ) * self._id_12DB._id_7140 / 1000;

        if ( var_0 > 1 )
            var_0 = 1;

        if ( var_0 < 0 )
            var_0 = 0;
    }

    return var_0;
}

_id_2435( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( self _meth_82CD() )
        var_1 += 20;

    var_2 = _id_23E5( ( 1, 1, 1 ), level._id_6F86, level._id_6F83 );
    var_2 _id_7FE8( "CENTER", undefined, level._id_6F87 + var_0, level._id_6F88 + var_1 );
    return var_2;
}

_id_2436( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( self _meth_82CD() )
        var_1 += 20;

    var_2 = _id_2401( "hudbig", level._id_6F82 );
    var_2 _id_7FE8( "CENTER", undefined, level._id_6F84 + var_0, level._id_6F85 + var_1 );
    var_2._id_03D5 = -1;
    return var_2;
}

_id_2444( var_0 )
{
    var_1 = _id_243C( ( 1, 0, 0 ), level._id_91F7, level._id_91F5, undefined, var_0 );
    var_1 _id_7FE8( "TOP", undefined, 0, level._id_91F8 );
    return var_1;
}

_id_2445( var_0 )
{
    var_1 = _id_243D( "default", level._id_91F4, var_0 );
    var_1 _id_7FE8( "TOP", undefined, 0, level._id_91F6 );
    return var_1;
}

_id_7F6C( var_0 )
{
    self._id_12DB._id_38B0 = var_0;
}

_id_486E()
{
    if ( self._id_483B )
        return;

    self._id_483B = 1;

    if ( self._id_0037 != 0 )
        self._id_0037 = 0;

    if ( self._id_3025 == "bar" || self._id_3025 == "bar_shader" )
    {
        self._id_12DB._id_483B = 1;

        if ( self._id_12DB._id_0037 != 0 )
            self._id_12DB._id_0037 = 0;
    }
}

_id_8504()
{
    if ( !self._id_483B )
        return;

    self._id_483B = 0;

    if ( self._id_3025 == "bar" || self._id_3025 == "bar_shader" )
    {
        if ( self._id_0037 != 0.5 )
            self._id_0037 = 0.5;

        self._id_12DB._id_483B = 0;

        if ( self._id_12DB._id_0037 != 1 )
            self._id_12DB._id_0037 = 1;
    }
    else if ( self._id_0037 != 1 )
        self._id_0037 = 1;
}

_id_38C4()
{
    self endon( "death" );

    if ( !self._id_483B )
        self._id_0037 = 1;

    for (;;)
    {
        if ( self._id_3A06 >= self._id_38B0 )
        {
            if ( !self._id_483B )
            {
                self _meth_8084( 0.3 );
                self._id_0037 = 0.2;
                wait 0.35;
                self _meth_8084( 0.3 );
                self._id_0037 = 1;
            }

            wait 0.7;
            continue;
        }

        if ( !self._id_483B && self._id_0037 != 1 )
            self._id_0037 = 1;

        wait 0.05;
    }
}

_id_28E8()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < self._id_1D3D.size; var_1++ )
    {
        if ( isdefined( self._id_1D3D[var_1] ) )
            var_0[var_0.size] = self._id_1D3D[var_1];
    }

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _id_7FD6( _id_4078() );

    if ( self._id_3025 == "bar" || self._id_3025 == "bar_shader" )
        self._id_12DB _meth_8088();

    self _meth_8088();
}

_id_7F87( var_0 )
{
    self _meth_80CC( var_0, self._id_0523, self._id_01E9 );
    self._id_838C = var_0;
}

_id_3FCE( var_0 )
{
    return self._id_838C;
}

_id_7F88( var_0, var_1 )
{
    self _meth_80CC( self._id_838C, var_0, var_1 );
}

_id_8352( var_0 )
{
    self._id_0523 = var_0;
}

_id_7F83( var_0 )
{
    self._id_01E9 = var_0;
}

_id_8009( var_0, var_1 )
{
    self._id_0523 = var_0;
    self._id_01E9 = var_1;
}

_id_9AF9()
{
    for ( var_0 = 0; var_0 < self._id_1D3D.size; var_0++ )
    {
        var_1 = self._id_1D3D[var_0];
        var_1 _id_7FE8( var_1._id_6E16, var_1._id_7307, var_1._id_A396, var_1._id_A3B1 );
    }
}

_id_9711()
{
    self._id_0530 = self._id_A396;
    self._id_0538 = self._id_A3B1;

    if ( self._id_3025 == "font" )
    {
        self._id_018C = self._id_1309;
        self._id_0245 = &"";
    }
    else if ( self._id_3025 == "icon" )
        self _meth_80CC( self._id_838C, self._id_0523, self._id_01E9 );

    self._id_0037 = 0;
}

_id_971A( var_0 )
{
    switch ( self._id_3025 )
    {
        case "font":
        case "timer":
            self._id_018C = 6.3;
            self _meth_808B( var_0 );
            self._id_018C = self._id_1309;
            break;
        case "icon":
            self _meth_80CC( self._id_838C, self._id_0523 * 6, self._id_01E9 * 6 );
            self _meth_8085( var_0, self._id_0523, self._id_01E9 );
            break;
    }
}

_id_9710( var_0, var_1 )
{
    var_2 = int( var_0 ) * 1000;
    var_3 = int( var_1 ) * 1000;

    switch ( self._id_3025 )
    {
        case "font":
        case "timer":
            self _meth_8089( var_2 + 250, var_3 + var_2, var_2 + 250 );
            break;
        default:
            break;
    }
}

_id_9713( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "left";

    switch ( var_1 )
    {
        case "left":
            self._id_0530 += 1000;
            break;
        case "right":
            self._id_0530 -= 1000;
            break;
        case "up":
            self._id_0538 -= 1000;
            break;
        case "down":
            self._id_0538 += 1000;
            break;
    }

    self _meth_8086( var_0 );
    self._id_0530 = self._id_A396;
    self._id_0538 = self._id_A3B1;
}

_id_9714( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "left";

    var_2 = self._id_A396;
    var_3 = self._id_A3B1;

    switch ( var_1 )
    {
        case "left":
            var_2 += 1000;
            break;
        case "right":
            var_2 -= 1000;
            break;
        case "up":
            var_3 -= 1000;
            break;
        case "down":
            var_3 += 1000;
            break;
    }

    self._id_0037 = 1;
    self _meth_8086( var_0 );
    self._id_0530 = var_2;
    self._id_0538 = var_3;
}

_id_971B( var_0 )
{
    switch ( self._id_3025 )
    {
        case "font":
        case "timer":
            self _meth_808B( var_0 );
            self._id_018C = 6.3;
        case "icon":
            self _meth_8085( var_0, self._id_0523 * 6, self._id_01E9 * 6 );
            break;
    }
}

_id_970B( var_0 )
{
    self _meth_8084( var_0 );

    if ( isdefined( self._id_5A20 ) )
        self._id_0037 = self._id_5A20;
    else
        self._id_0037 = 1;
}

_id_970C( var_0 )
{
    self _meth_8084( 0.15 );
    self._id_0037 = 0;
}

_id_51D3( var_0 )
{
    if ( issubstr( var_0, "ch_limited" ) )
        return 1;

    return 0;
}

_id_5203( var_0 )
{
    if ( _id_A4F0::_id_8F51( var_0, "ch_attach_unlock_kills" ) )
        return 1;

    if ( _id_A4F0::_id_8F51( var_0, "ch_attach_unlock_hipfirekills" ) )
        return 1;

    if ( _id_A4F0::_id_8F51( var_0, "ch_attach_unlock_headShots" ) )
        return 1;

    return 0;
}

_id_1C4C( var_0 )
{
    if ( _id_5203( var_0 ) )
        return _id_6FFB( var_0 );
    else if ( _id_A75A::_id_51B7( var_0, "ch_daily_" ) )
        return self _meth_8222( "challengeProgress", "ch_marksman_iw5_dlcgun12" );
    else
        return self _meth_8222( "challengeProgress", var_0 );
}

_id_1C4D( var_0 )
{
    if ( _id_5203( var_0 ) )
        return _id_6FFC( var_0 );
    else if ( _id_A75A::_id_51B7( var_0, "ch_daily_" ) )
        return self _meth_8222( "challengeState", "ch_marksman_iw5_dlcgun12" );
    else
        return self _meth_8222( "challengeState", var_0 );
}

_id_1C53( var_0, var_1 )
{
    if ( _id_5203( var_0 ) )
        return;

    var_2 = _id_A75A::_id_1E29( var_1 );

    if ( _id_A75A::_id_51B7( var_0, "ch_daily_" ) )
        self _meth_8243( "challengeProgress", "ch_marksman_iw5_dlcgun12", var_2 );
    else
        self _meth_8243( "challengeProgress", var_0, var_2 );
}

_id_1C54( var_0, var_1 )
{
    if ( _id_5203( var_0 ) )
        return;

    if ( _id_A75A::_id_51B7( var_0, "ch_daily_" ) )
        self _meth_8243( "challengeState", "ch_marksman_iw5_dlcgun12", var_1 );
    else
        self _meth_8243( "challengeState", var_0, var_1 );
}

_id_1C4E( var_0, var_1 )
{
    var_2 = tablelookup( "mp/allChallengesTable.csv", 0, var_0, 9 + ( var_1 - 1 ) * 2 );

    if ( isdefined( var_2 ) && var_2 != "" )
        return int( var_2 );

    return 0;
}

_id_2B5D( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_2401( "hudbig", var_2 );
    var_4 _id_7FE8( "CENTER", "CENTER", 0, var_1 );
    var_4._id_03D5 = 1001;
    var_4._id_00C5 = ( 1, 1, 1 );
    var_4._id_019A = 0;
    var_4._id_01EE = 1;
    var_4 _meth_80CA( var_0 );
    _id_A4F0::_id_A060( var_3, "joined_team", "death" );

    if ( isdefined( var_4 ) )
        var_4 _id_28E8();
}

_id_6FFB( var_0 )
{
    if ( _id_A4F0::_id_8F51( var_0, "ch_attach_unlock_hipfirekills" ) )
        return _id_93EF( var_0, "hipfirekills" );
    else if ( _id_A4F0::_id_8F51( var_0, "ch_attach_unlock_kills" ) )
        return _id_93EF( var_0, "kills" );
    else if ( _id_A4F0::_id_8F51( var_0, "ch_attach_unlock_headShots" ) )
        return _id_93EF( var_0, "headShots" );
}

_id_6FFC( var_0 )
{
    var_1 = _id_6FFB( var_0 );
    var_2 = 1;

    for ( var_3 = _id_1C4E( var_0, var_2 ); var_3 > 0 && var_1 >= var_3; var_3 = _id_1C4E( var_0, var_2 ) )
        var_2++;

    return var_2;
}

_id_93EF( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = 0;
    var_4 = strtok( var_0, "_" );

    for ( var_5 = 0; var_5 < var_4.size - 1; var_5++ )
    {
        if ( var_4[var_5] == var_1 )
        {
            var_2 = var_4[var_5 + 1];
            break;
        }
    }

    if ( isdefined( var_2 ) )
    {
        for ( var_6 = tablelookuprownum( "mp/statstable.csv", 59, var_2 ); var_6 >= 0; var_6 = tablelookuprownum( "mp/statstable.csv", 59, var_2, var_6 - 1 ) )
        {
            var_7 = tablelookupbyrow( "mp/statstable.csv", var_6, 4 );
            var_3 += self _meth_8223( "weaponStats", var_7, var_1 );
        }

        if ( var_1 == "kills" && isdefined( self._id_94F3 ) )
            var_3 += self._id_94F3;

        if ( var_1 == "hipfirekills" && isdefined( self._id_94F1 ) )
            var_3 += self._id_94F1;

        if ( var_1 == "headShots" && isdefined( self._id_94F0 ) )
            var_3 += self._id_94F0;

        var_8 = self _meth_8223( "attachUnlock_" + var_1, var_2 );

        if ( var_8 > var_3 )
            var_8 = 0;

        return var_3 - var_8;
    }
}
