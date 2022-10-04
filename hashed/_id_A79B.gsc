// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_99EC = spawnstruct();
    level._id_99EC._id_01F4 = "left";
    level._id_99EC._id_0500 = "top";
    level._id_99EC._id_002C = "left";
    level._id_99EC._id_002D = "top";
    level._id_99EC._id_0530 = 0;
    level._id_99EC._id_0538 = 0;
    level._id_99EC._id_0523 = 0;
    level._id_99EC._id_01E9 = 0;
    level._id_99EC._id_1D3D = [];
    level._id_397B = 12;
    level._id_4AB0["allies"] = spawnstruct();
    level._id_4AB0["axis"] = spawnstruct();
    level._id_6F88 = -61;
    level._id_6F87 = 0;
    level._id_6F83 = 9;
    level._id_6F86 = 120;
    level._id_6F85 = -75;
    level._id_6F84 = 0;
    level._id_6F82 = 0.6;
    level._id_91F8 = 32;
    level._id_91F5 = 14;
    level._id_91F7 = 192;
    level._id_91F6 = 8;
    level._id_91F4 = 1.65;
    level._id_58A7 = "BOTTOM";
    level._id_58A6 = -90;
    level._id_58A5 = 1.6;
}

_id_397D( var_0 )
{
    self._id_1309 = self._id_018C;

    if ( isdefined( var_0 ) )
        self._id_5A36 = min( var_0, 6.3 );
    else
        self._id_5A36 = min( self._id_018C * 2, 6.3 );

    self._id_4C64 = 2;
    self._id_65C1 = 4;
}

_id_397C( var_0 )
{
    self notify( "fontPulse" );
    self endon( "fontPulse" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    self _meth_808B( self._id_4C64 * 0.05 );
    self._id_018C = self._id_5A36;
    wait(self._id_4C64 * 0.05);
    self _meth_808B( self._id_65C1 * 0.05 );
    self._id_018C = self._id_1309;
}
