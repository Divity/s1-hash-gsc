// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    precacheshellshock( "flashbang_mp" );
}

_id_8D25()
{
    thread _id_5E5B();
}

_id_8EF4( var_0 )
{
    self notify( "stop_monitoring_flash" );
}

_id_38C3( var_0 )
{
    self endon( "stop_monitoring_flash" );
    self endon( "flash_rumble_loop" );
    self notify( "flash_rumble_loop" );
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        self _meth_80AD( "damage_heavy" );
        wait 0.05;
    }
}

_id_5E5B()
{
    self endon( "disconnect" );
    self notify( "monitorFlash" );
    self endon( "monitorFlash" );
    self._id_38AF = 0;
    var_0 = 2.5;

    for (;;)
    {
        self waittill( "flashbang", var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isalive( self ) )
            break;

        if ( isdefined( self._id_9C2C ) )
            continue;

        if ( !isdefined( var_6 ) )
            var_6 = 0;

        var_7 = 0;
        var_8 = 1;

        if ( var_3 < 0.25 )
            var_3 = 0.25;
        else if ( var_3 > 0.8 )
            var_3 = 1;

        var_9 = var_2 * var_3 * var_0;
        var_9 += var_6;

        if ( isdefined( self._id_8F71 ) )
            var_9 *= self._id_8F71;

        if ( var_9 < 0.25 )
            continue;

        var_10 = undefined;

        if ( var_9 > 2 )
            var_10 = 0.75;
        else
            var_10 = 0.25;

        if ( level._id_91E4 && isdefined( var_4 ) && isdefined( var_4._id_04A8 ) && var_4._id_04A8 == self._id_04A8 && var_4 != self )
        {
            if ( level._id_01A9 == 0 )
                continue;
            else if ( level._id_01A9 == 1 )
            {

            }
            else if ( level._id_01A9 == 2 )
            {
                var_9 *= 0.5;
                var_10 *= 0.5;
                var_8 = 0;
                var_7 = 1;
            }
            else if ( level._id_01A9 == 3 )
            {
                var_9 *= 0.5;
                var_10 *= 0.5;
                var_7 = 1;
            }
        }
        else if ( isdefined( var_4 ) )
        {
            if ( var_4 != self )
                var_4 _id_A7A0::_id_6FF3( "ch_indecentexposure" );
        }

        if ( var_8 && isdefined( self ) )
        {
            thread _id_0CAD( var_9, var_10 );

            if ( isdefined( var_4 ) && var_4 != self )
            {
                var_4 thread _id_A784::_id_9B04( "flash" );
                var_11 = self;

                if ( isplayer( var_4 ) && var_4 _meth_8221( "specialty_paint" ) && var_4 _id_A75A::_id_05CB( "specialty_paint" ) )
                {
                    if ( !var_11 _id_A7DB::_id_516A() )
                        var_4 _id_A7A0::_id_6FF3( "ch_paint_pro" );

                    var_11 thread _id_A7DB::_id_7FD5( var_4 );
                }
            }
        }

        if ( var_7 && isdefined( var_4 ) )
            var_4 thread _id_0CAD( var_9, var_10 );
    }
}

_id_0CAD( var_0, var_1 )
{
    if ( !isdefined( self._id_38AC ) || var_0 > self._id_38AC )
        self._id_38AC = var_0;

    if ( !isdefined( self._id_38C2 ) || var_1 > self._id_38C2 )
        self._id_38C2 = var_1;

    wait 0.05;

    if ( isdefined( self._id_38AC ) )
    {
        self _meth_8182( "flashbang_mp", self._id_38AC );
        self._id_38AF = gettime() + self._id_38AC * 1000;
        thread _id_A75A::_id_5709( "flashed", 0.1, 0.1, self._id_38AC - 0.1 );
    }

    if ( isdefined( self._id_38C2 ) )
        thread _id_38C3( self._id_38C2 );

    self._id_38AC = undefined;
    self._id_38C2 = undefined;
}

_id_5104()
{
    return isdefined( self._id_38AF ) && gettime() < self._id_38AF;
}
