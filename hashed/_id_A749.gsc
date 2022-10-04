// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A238()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );

    if ( !isdefined( level._id_0869 ) )
        _id_601F();

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "mute_bomb_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            thread _id_98B3( var_0 );
        }
    }
}

_id_601F()
{
    self._id_0869 = spawnstruct();
}

_id_98B3( var_0 )
{
    if ( !isdefined( self._id_0869 ) )
        _id_601F();

    thread _id_8D2A( var_0 );
    thread _id_5E99( var_0 );
    var_0 thread _id_5E85();
    return 1;
}

_id_8D2A( var_0 )
{
    self endon( "ClearMuteBomb" );
    self endon( "death" );
    var_0 endon( "death" );
    var_0 _meth_809A( "mute_device_activate" );
    wait 0.75;
    var_0 _meth_84D5( 350, 600, 0.25 );
    var_0 _meth_8075( "mute_device_active_lp" );
    var_0 thread _id_5E86();
    wait 20;
    var_0 _meth_806F( 0.0, 0.25 );
    var_0 _meth_84D6( 0.25 );
    var_0 notify( "ShutdownMuteBomb" );
    wait 0.25;
    var_0 _meth_80AB();
}

_id_5E99( var_0 )
{
    var_0 endon( "ShutdownMuteBomb" );
    self waittill( "death" );

    if ( isdefined( var_0 ) )
    {
        var_0 _meth_84D6( 0.25 );
        var_0 notify( "ShutdownMuteBomb" );
    }
}

_id_5E85()
{
    self endon( "ShutdownMuteBomb" );
    self waittill( "death" );

    if ( isdefined( self ) )
    {
        self _meth_84D6( 0.25 );
        self notify( "ShutdownMuteBomb" );
    }
}

_id_5E86()
{
    self endon( "ShutdownMuteBomb" );
    var_0 = 475.0;
    self._id_9404 = [];

    for (;;)
    {
        foreach ( var_2 in level._id_0328 )
        {
            var_3 = distance( self._id_02E6, var_2._id_02E6 );
            var_4 = _id_A4F0::_id_0CE4( self._id_9404, var_2 );

            if ( var_3 <= var_0 )
            {
                if ( !var_4 )
                {
                    self._id_9404 = _id_A4F0::_id_0CDA( self._id_9404, var_2 );
                    var_2 _meth_82F4( "mute_device_active_enter" );
                }

                continue;
            }

            if ( var_4 )
            {
                self._id_9404 = _id_A4F0::_id_0CF6( self._id_9404, var_2 );
                var_2 _meth_82F4( "mute_device_active_exit" );
            }
        }

        wait 0.05;
    }
}
