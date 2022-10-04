// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_9AB1( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "kill_battery" );

    if ( !isplayer( self ) )
        return;

    while ( _id_3D58( var_0, "ui_exo_battery_toggle" ) == 1 )
    {
        var_1 = self _meth_84A2( var_0 );
        _id_7E17( var_0, "ui_exo_battery_level", var_1 );
        wait 0.05;
    }
}

_id_7E17( var_0, var_1, var_2 )
{
    if ( self _meth_831A() == var_0 )
    {
        self _meth_82FB( var_1 + "0", var_2 );

        if ( var_1 == "ui_exo_battery_toggle" )
        {
            if ( var_2 == 1 )
                self _meth_82FB( "ui_exo_battery_iconA", var_0 );
        }
    }
    else if ( self _meth_8345() == var_0 )
    {
        self _meth_82FB( var_1 + "1", var_2 );

        if ( var_1 == "ui_exo_battery_toggle" )
        {
            if ( var_2 == 1 )
                self _meth_82FB( "ui_exo_battery_iconB", var_0 );
        }
    }
    else
    {
        self _meth_82FB( "ui_exo_battery_iconA", "reset" );
        self _meth_82FB( "ui_exo_battery_iconB", "reset" );
        self _meth_82FB( "ui_exo_battery_toggle0", 0 );
        self _meth_82FB( "ui_exo_battery_toggle1", 0 );
    }
}

_id_3D58( var_0, var_1 )
{
    if ( self _meth_831A() == var_0 )
        return self _meth_8447( var_1 + "0" );
    else if ( self _meth_8345() == var_0 )
        return self _meth_8447( var_1 + "1" );

    return -1;
}

_id_6965()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self endon( "kill_battery" );
    self _meth_849C( "tried_left_exo_ability", "+smoke" );
    wait 0.05;
    self _meth_82DD( "tried_left_exo_ability", "+smoke" );

    for (;;)
    {
        self waittill( "tried_left_exo_ability" );
        var_0 = self _meth_831A();

        if ( _id_A75A::_id_501E( var_0 ) )
        {
            if ( self _meth_84A2( var_0 ) < _func_298( var_0 ) )
                self _meth_82F4( "mp_exo_bat_empty" );
        }
    }
}

_id_6964()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self endon( "kill_battery" );
    self _meth_849C( "tried_right_exo_ability", "+frag" );
    wait 0.05;
    self _meth_82DD( "tried_right_exo_ability", "+frag" );

    for (;;)
    {
        self waittill( "tried_right_exo_ability" );
        var_0 = self _meth_8345();

        if ( _id_A75A::_id_501E( var_0 ) )
        {
            if ( self _meth_84A2( var_0 ) < _func_298( var_0 ) )
                self _meth_82F4( "mp_exo_bat_empty" );
        }
    }
}
