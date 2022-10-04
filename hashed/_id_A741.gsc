// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_54FC()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self._id_54D7 = undefined;
    self._id_A1BE = 0;
    self.has_laser = 0;

    for (;;)
    {
        while ( _id_A75A::_id_50F6() && self.has_laser )
        {
            wait 0.05;
            self _meth_80B3();
            self._id_A1BE = 1;
            continue;
        }

        if ( self._id_A1BE && self.has_laser )
        {
            self._id_A1BE = 0;
            self _meth_80B2( get_laser_name() );
        }

        if ( issubstr( self _meth_8311(), "maaws" ) || issubstr( self _meth_8311(), "dlcgun11loot3" ) )
            self.has_laser = 1;

        if ( self.has_laser && self _meth_812C() )
        {
            if ( isdefined( self._id_54D7 ) && self._id_54D7 )
            {
                self _meth_80B3();
                self._id_54D7 = 0;

                while ( !self _meth_84E0() && self _meth_812C() )
                    wait 0.05;

                while ( self _meth_84E0() && self _meth_812C() )
                    wait 0.05;

                while ( self _meth_812C() )
                    wait 0.05;

                self _meth_80B2( get_laser_name() );
                self._id_54D7 = 1;
            }
        }

        if ( !self.has_laser )
        {
            if ( isdefined( self._id_54D7 ) && self._id_54D7 )
            {
                self _meth_80B3();
                self._id_54D7 = 0;
            }
        }
        else if ( !isdefined( self._id_54D7 ) || !self._id_54D7 )
        {
            self _meth_80B2( get_laser_name() );
            self._id_54D7 = 1;
        }

        wait 0.05;
    }
}

get_laser_name()
{
    var_0 = self _meth_8311();

    if ( issubstr( var_0, "_dlcgun10loot5" ) || _id_A781::_id_50FE( var_0 ) || _id_A781::_id_5195( var_0 ) )
        return "mp_attachment_lasersight_short";

    return "mp_attachment_lasersight";
}
