// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_157C()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    _id_A75A::_id_3BDF( "prematch_done" );
    thread _id_689F();
}

_id_689F()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    var_0 = self _meth_83B3();

    for (;;)
    {
        var_1 = self _meth_83B3();

        if ( var_1 )
        {
            if ( var_1 != var_0 )
            {
                self _meth_80AD( "damage_heavy" );
                _id_A75A::_id_6DD9( "boost_jump_plr_mp", self._id_02E6 );
            }
        }

        var_0 = var_1;
        wait 0.05;
    }
}

_id_6C66()
{

}
