// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( !_id_A75A::_id_50C1() )
        return;

    level._id_597C = getentarray( "boost_jump_border_trig", "targetname" );
    _id_4884();
    thread _id_4886();
    thread _id_4887();
}

_id_4884()
{

}

_id_4887()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_spawned", var_0 );
        var_0 thread _id_597B();
        var_0 _id_A75A::_id_6C5F( 1 );
        var_0 _id_A75A::_id_6C60( 1 );
        var_0 _id_A75A::_id_6C5D( 1 );
        var_0 _id_A75A::_id_6C61( 1 );
        var_0 _id_A75A::_id_6C5E( 1 );
        var_0 thread _id_3477();
        var_0 _meth_82FB( "ui_border_warning_toggle", 0 );
    }
}

_id_4886()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "host_migration_end" );
        _id_4884();
    }
}

_id_597B()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self._id_9400 = undefined;

    for (;;)
    {
        if ( isdefined( level._id_597C ) )
        {
            var_0 = 0;

            foreach ( var_2 in level._id_597C )
            {
                var_3 = self _meth_80A9( var_2 );

                if ( var_3 )
                {
                    var_0 = 1;
                    break;
                }
            }

            if ( !isdefined( self._id_9400 ) || self._id_9400 != var_0 )
            {
                if ( var_0 )
                    self _meth_82FB( "ui_border_warning_toggle", 1 );
                else
                    self _meth_82FB( "ui_border_warning_toggle", 0 );

                self._id_9400 = var_0;
            }
        }

        wait 0.05;
    }
}

_id_3477()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "exo_dodge" );
        var_0 = getdvarfloat( "dodge_cooldown_time_sec", 0.2 );
        thread _id_3475();
        _id_A736::_id_34B7( var_0 );
        var_1 = gettime();

        if ( isdefined( self._id_558C ) && var_1 - self._id_558C < 1000 )
            _id_A7A0::processchallengedaily( 38, undefined, undefined );
    }
}

_id_3475()
{
    var_0 = getdvarfloat( "dodge_weapon_enable", 1 );

    if ( !var_0 )
    {
        var_1 = getdvarint( "exo_dodge_weapon_disable_time", 0.2 );
        _id_A4F0::_id_0587();
        wait(var_1);
        _id_A4F0::_id_0595();
    }
}
