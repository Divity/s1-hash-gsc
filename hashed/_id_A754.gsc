// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_9198()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = 10;
    var_1 = cos( var_0 );
    var_2 = 0.5;
    self.has_target_enhancer = 0;

    for (;;)
    {
        while ( self.has_target_enhancer && self _meth_8340() < var_2 )
            wait 0.05;

        if ( !self.has_target_enhancer )
        {
            wait 0.05;
            continue;
        }

        if ( self _meth_8342() )
        {
            wait 0.05;
            continue;
        }

        if ( isdefined( self._id_3089 ) && self._id_3089 )
        {
            waittillframeend;
            continue;
        }

        if ( isplayer( self ) )
            childthread _id_A756::_id_299A( self, 0.05, 1 );

        wait 0.05;
    }
}
