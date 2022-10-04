// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_8E57()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self.has_stock = 0;

    for (;;)
    {
        if ( !self.has_stock )
        {
            if ( self _meth_82A7( "specialty_stalker", 1 ) )
                self _meth_82A9( "specialty_stalker", 1 );

            wait 0.05;
            continue;
        }

        if ( !self _meth_82A7( "specialty_stalker", 1 ) )
            self _meth_82A6( "specialty_stalker", 1, 0 );

        wait 0.05;
    }
}
