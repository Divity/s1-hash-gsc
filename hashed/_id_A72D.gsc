// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( isdefined( level._id_4DB3 ) )
        return;

    level._id_4DB3 = 1;

    if ( level._id_5FE9 )
    {
        foreach ( var_1 in level._id_91F0 )
        {
            var_2 = "entity_headicon_" + var_1;
            game[var_2] = _id_A7B2::_id_5FD7( var_1 );
            precacheshader( game[var_2] );
        }
    }
    else
    {
        game["entity_headicon_allies"] = _id_A7B2::_id_4114( "allies" );
        game["entity_headicon_axis"] = _id_A7B2::_id_4114( "axis" );
        precacheshader( game["entity_headicon_allies"] );
        precacheshader( game["entity_headicon_axis"] );
    }
}

_id_7F80( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( _id_A75A::_id_510F( var_0 ) && !isplayer( var_0 ) )
        return;

    if ( !isdefined( self._id_3319 ) )
        self._id_3319 = [];

    if ( !isdefined( var_5 ) )
        var_5 = 1;

    if ( !isdefined( var_6 ) )
        var_6 = 0.05;

    if ( !isdefined( var_7 ) )
        var_7 = 1;

    if ( !isdefined( var_8 ) )
        var_8 = 1;

    if ( !isdefined( var_9 ) )
        var_9 = 0;

    if ( !isdefined( var_10 ) )
        var_10 = 1;

    if ( !isdefined( var_11 ) )
        var_11 = "";

    if ( !isplayer( var_0 ) && var_0 == "none" )
    {
        foreach ( var_14, var_13 in self._id_3319 )
        {
            if ( isdefined( var_13 ) )
                var_13 _meth_8088();

            self._id_3319[var_14] = undefined;
        }
    }
    else
    {
        if ( isplayer( var_0 ) )
        {
            if ( isdefined( self._id_3319[var_0._id_444D] ) )
            {
                self._id_3319[var_0._id_444D] _meth_8088();
                self._id_3319[var_0._id_444D] = undefined;
            }

            if ( var_1 == "" )
                return;

            if ( isdefined( self._id_3319[var_0._id_04A8] ) )
            {
                self._id_3319[var_0._id_04A8] _meth_8088();
                self._id_3319[var_0._id_04A8] = undefined;
            }

            var_13 = newclienthudelem( var_0 );
            self._id_3319[var_0._id_444D] = var_13;
        }
        else
        {
            if ( isdefined( self._id_3319[var_0] ) )
            {
                self._id_3319[var_0] _meth_8088();
                self._id_3319[var_0] = undefined;
            }

            if ( var_1 == "" )
                return;

            foreach ( var_14, var_16 in self._id_3319 )
            {
                if ( var_14 == "axis" || var_14 == "allies" )
                    continue;

                var_17 = _id_A75A::_id_4089( var_14 );

                if ( var_17._id_04A8 == var_0 )
                {
                    self._id_3319[var_14] _meth_8088();
                    self._id_3319[var_14] = undefined;
                }
            }

            var_13 = newteamhudelem( var_0 );
            self._id_3319[var_0] = var_13;
        }

        if ( !isdefined( var_3 ) || !isdefined( var_4 ) )
        {
            var_3 = 10;
            var_4 = 10;
        }

        var_13._id_0048 = var_5;
        var_13._id_0037 = 0.85;
        var_13 _meth_80CC( var_1, var_3, var_4 );
        var_13 _meth_80D8( var_7, var_8, var_9, var_10 );

        if ( var_11 == "" )
        {
            var_13._id_0530 = self._id_02E6[0] + var_2[0];
            var_13._id_0538 = self._id_02E6[1] + var_2[1];
            var_13._id_053B = self._id_02E6[2] + var_2[2];
            var_13 thread _id_52DD( self, var_2, var_6 );
        }
        else
        {
            var_13._id_0530 = var_2[0];
            var_13._id_0538 = var_2[1];
            var_13._id_053B = var_2[2];
            var_13 _meth_80CD( self, var_11 );
        }

        thread _id_28ED();

        if ( isplayer( var_0 ) )
            var_13 thread _id_28EF( var_0 );

        if ( isplayer( self ) )
            var_13 thread _id_28EF( self );
    }
}

_id_28EF( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self _meth_8088();
}

_id_28ED()
{
    self notify( "destroyIconsOnDeath" );
    self endon( "destroyIconsOnDeath" );
    self waittill( "death" );

    foreach ( var_2, var_1 in self._id_3319 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 _meth_8088();
    }
}

_id_52DD( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_3 = var_0._id_02E6;

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            return;

        if ( var_3 != var_0._id_02E6 )
        {
            var_3 = var_0._id_02E6;
            self._id_0530 = var_3[0] + var_1[0];
            self._id_0538 = var_3[1] + var_1[1];
            self._id_053B = var_3[2] + var_1[2];
        }

        if ( var_2 > 0.05 )
        {
            self._id_0037 = 0.85;
            self _meth_8084( var_2 );
            self._id_0037 = 0;
        }

        wait(var_2);
    }
}

_id_8022( var_0, var_1, var_2, var_3 )
{
    if ( !level._id_91E4 )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    if ( !isdefined( self._id_331A ) )
    {
        self._id_331A = "none";
        self._id_3316 = undefined;
    }

    if ( isdefined( var_3 ) && var_3 == 0 )
        var_4 = undefined;

    var_5 = game["entity_headicon_" + var_0];
    self._id_331A = var_0;

    if ( isdefined( var_1 ) )
        self._id_3317 = var_1;
    else
        self._id_3317 = ( 0, 0, 0 );

    self notify( "kill_entity_headicon_thread" );

    if ( var_0 == "none" )
    {
        if ( isdefined( self._id_3316 ) )
            self._id_3316 _meth_8088();

        return;
    }

    var_6 = newteamhudelem( var_0 );
    var_6._id_0048 = 1;
    var_6._id_0037 = 0.8;
    var_6 _meth_80CC( var_5, 10, 10 );
    var_6 _meth_80D8( 0, 0, 0, 1 );
    self._id_3316 = var_6;

    if ( !isdefined( var_3 ) )
    {
        if ( var_2 == "" )
        {
            var_6._id_0530 = self._id_02E6[0] + self._id_3317[0];
            var_6._id_0538 = self._id_02E6[1] + self._id_3317[1];
            var_6._id_053B = self._id_02E6[2] + self._id_3317[2];
            thread _id_52DB();
        }
        else
        {
            var_6._id_0530 = self._id_3317[0];
            var_6._id_0538 = self._id_3317[1];
            var_6._id_053B = self._id_3317[2];
            var_6 _meth_80CD( self, var_2 );
        }
    }
    else
    {
        var_7 = anglestoup( self._id_0041 );
        var_8 = self._id_02E6 + var_7 * 28;

        if ( var_2 == "" )
        {
            var_6._id_0530 = var_8[0];
            var_6._id_0538 = var_8[1];
            var_6._id_053B = var_8[2];
            thread _id_52DB( var_3 );
        }
        else
        {
            var_6._id_0530 = var_8[0];
            var_6._id_0538 = var_8[1];
            var_6._id_053B = var_8[2];
            var_6 _meth_80CD( self, var_2 );
        }
    }

    thread _id_28EB();
}

_id_7FDF( var_0, var_1, var_2 )
{
    if ( level._id_91E4 )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    if ( !isdefined( self._id_331A ) )
    {
        self._id_331A = "none";
        self._id_3316 = undefined;
    }

    self notify( "kill_entity_headicon_thread" );

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_3316 ) )
            self._id_3316 _meth_8088();

        return;
    }

    var_3 = var_0._id_04A8;
    self._id_331A = var_3;

    if ( isdefined( var_1 ) )
        self._id_3317 = var_1;
    else
        self._id_3317 = ( 0, 0, 0 );

    var_4 = game["entity_headicon_" + var_3];
    var_5 = newclienthudelem( var_0 );
    var_5._id_0048 = 1;
    var_5._id_0037 = 0.8;
    var_5 _meth_80CC( var_4, 10, 10 );
    var_5 _meth_80D8( 0, 0, 0, 1 );
    self._id_3316 = var_5;

    if ( var_2 == "" )
    {
        var_5._id_0530 = self._id_02E6[0] + self._id_3317[0];
        var_5._id_0538 = self._id_02E6[1] + self._id_3317[1];
        var_5._id_053B = self._id_02E6[2] + self._id_3317[2];
        thread _id_52DB();
    }
    else
    {
        var_5._id_0530 = self._id_3317[0];
        var_5._id_0538 = self._id_3317[1];
        var_5._id_053B = self._id_3317[2];
        var_5 _meth_80CD( self, var_2 );
    }

    thread _id_28EB();
}

_id_52DB( var_0 )
{
    self endon( "kill_entity_headicon_thread" );
    self endon( "death" );
    var_1 = self._id_02E6;

    for (;;)
    {
        if ( var_1 != self._id_02E6 )
        {
            _id_9B1C( var_0 );
            var_1 = self._id_02E6;
        }

        wait 0.05;
    }
}

_id_28EB()
{
    self endon( "kill_entity_headicon_thread" );
    self waittill( "death" );

    if ( !isdefined( self._id_3316 ) )
        return;

    self._id_3316 _meth_8088();
}

_id_9B1C( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        self._id_3316._id_0530 = self._id_02E6[0] + self._id_3317[0];
        self._id_3316._id_0538 = self._id_02E6[1] + self._id_3317[1];
        self._id_3316._id_053B = self._id_02E6[2] + self._id_3317[2];
    }
    else
    {
        var_1 = anglestoup( self._id_0041 );
        var_2 = self._id_02E6 + var_1 * 28;
        self._id_3316._id_0530 = var_2[0];
        self._id_3316._id_0538 = var_2[1];
        self._id_3316._id_053B = var_2[2];
    }
}
