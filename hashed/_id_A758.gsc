// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_950A()
{
    if ( getdvar( "mapname" ) == getdvar( "virtualLobbyMap" ) )
        return;

    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self._id_9507 = spawnstruct();
    self._id_9507._id_46F6 = 0;
    self._id_9507._id_4701 = 0;

    if ( _id_A75A::_id_05CB( "specialty_paint_pro" ) )
        self._id_9507._id_46F6 = 1;

    var_0 = self _meth_8311();
    _id_93C7( var_0 );

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( var_0 == "none" )
        {
            wait 0.4;
            var_0 = self _meth_8311();

            if ( var_0 == "none" )
                return;
        }

        _id_93C7( var_0 );
        wait 0.05;
    }
}

_id_93C7( var_0 )
{
    var_1 = undefined;

    if ( isdefined( var_0 ) )
        var_1 = getweaponattachments( var_0 );

    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 == "trackrounds" )
            {
                self._id_9507._id_4701 = 1;
                _id_A75A::_id_41F5( "specialty_paint_pro", 0, 0 );
                return;
            }
        }

        self._id_9507._id_4701 = 0;

        if ( !self._id_9507._id_46F6 )
            _id_A75A::_id_067B( "specialty_paint_pro" );

        return;
    }
}

_id_7E8C( var_0 )
{
    if ( isplayer( self ) )
    {
        if ( isdefined( self._id_665B ) && self._id_665B )
            return;

        self._id_665B = 1;
        thread _id_9509();
    }
}

_id_9508()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    self._id_665B = 0;
}

_id_9509()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    thread _id_9508();

    for (;;)
    {
        wait 0.1;

        if ( self _meth_82A7( "specialty_radararrow", 1 ) )
            continue;

        if ( self _meth_82A7( "specialty_radarblip", 1 ) )
            continue;

        self _meth_82A6( "specialty_radarblip", 1, 0 );
    }
}
