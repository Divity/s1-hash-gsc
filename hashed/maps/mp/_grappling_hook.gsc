// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( _id_A75A::isgrapplinghookgamemode() )
        level thread grappling_hook_on_player_connect();
}

grappling_hook_on_player_connect()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread grappling_hook_on_loadout_given();
    }
}

grappling_hook_on_loadout_given()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "applyLoadout" );

        if ( !_id_A75A::_id_512E() )
        {
            give_grappling_hook();
            thread grappling_hook_wait_for_death();
            thread grappling_hook_wait_for_game_end();
        }
    }
}

grappling_hook_wait_for_death()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "death", "joined_team", "faux_spawn", "grappling_hook_reset", "entering_juggernaut" );
    _id_A72F::_id_7E17( level.grapplinghookweapon, "ui_exo_battery_toggle", 0 );
}

grappling_hook_wait_for_game_end()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "grappling_hook_reset" );
    self endon( "grappling_hook_battery_hud_reset" );
    level waittill( "game_ended" );
    _id_A72F::_id_7E17( level.grapplinghookweapon, "ui_exo_battery_toggle", 0 );
}

give_grappling_hook()
{
    var_0 = get_grappling_hook_weapon();

    if ( self _meth_8314( var_0 ) )
        return;

    self _meth_8319( var_0 );
    self _meth_830E( var_0 );
    self notify( "grappling_hook_reset" );
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1 _meth_8385( self );
    var_1 _meth_8383( self );
    self _meth_8550( var_1 );
    thread _id_A4F0::_id_2824( var_1 );
    thread delete_on_reset( var_1 );
    var_2 = self _meth_84A5( level.grapplinghookweapon );
    self _meth_82FB( "ui_exo_battery_level0", var_2 );
    self _meth_82FB( "exo_ability_nrg_req0", _func_298( level.grapplinghookweapon ) );
    self _meth_82FB( "exo_ability_nrg_total0", var_2 );
    self _meth_82FB( "ui_invalid_grapple", 0 );
    thread wait_for_grappling_hook_pressed();
}

wait_for_full_battery()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self endon( "grappling_hook_reset" );
    self endon( "grappling_hook_battery_hud_reset" );
    var_0 = self _meth_84A5( level.grapplinghookweapon );

    for (;;)
    {
        var_1 = self _meth_84A2( level.grapplinghookweapon );

        if ( var_1 >= var_0 )
        {
            _id_A72F::_id_7E17( level.grapplinghookweapon, "ui_exo_battery_toggle", 0 );
            return;
        }

        wait 0.1;
    }
}

wait_for_grappling_hook_pressed()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );
    self endon( "grappling_hook_reset" );

    for (;;)
    {
        self waittill( "exo_ability_activate", var_0, var_1 );

        if ( var_0 == level.grapplinghookweapon && isdefined( var_1 ) )
        {
            if ( var_1 == 1 )
            {
                self notify( "grappling_hook_battery_hud_reset" );

                if ( isdefined( self.last_grapple_time ) )
                    self.last_grapple_time_prev = self.last_grapple_time;

                self.last_grapple_time = gettime();
                _id_A72F::_id_7E17( level.grapplinghookweapon, "ui_exo_battery_toggle", 1 );
                thread _id_A72F::_id_9AB1( level.grapplinghookweapon );
                thread wait_for_full_battery();
                _id_A7A0::_id_6FF3( "ch_tier2_2_iw5_dlcgun12" );

                if ( isdefined( self._id_558C ) && isdefined( self.last_grapple_time ) )
                {
                    if ( self.last_grapple_time - self._id_558C < 1500 )
                        _id_A7A0::_id_6FF3( "ch_tier2_5_iw5_dlcgun12" );
                }

                continue;
            }

            if ( var_1 == 0 )
            {
                thread pulse_grapple_hud_message( 2 );
                continue;
            }

            if ( var_1 == -1 )
                thread pulse_grapple_hud_message( 1 );
        }
    }
}

pulse_grapple_hud_message( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self _meth_82FB( "ui_invalid_grapple", var_0 );

    if ( var_0 == 1 )
    {
        self _meth_82FB( "ui_border_warning_toggle", 0 );
        wait 0.6;
    }
    else if ( var_0 == 2 )
        wait 1.0;

    self _meth_82FB( "ui_invalid_grapple", 0 );
}

take_grappling_hook()
{
    var_0 = get_grappling_hook_weapon();
    self _meth_8319( "none" );
    self _meth_830F( var_0 );
    self notify( "grappling_hook_reset" );
}

get_grappling_hook_weapon()
{
    if ( isdefined( level.grapplinghookweapon ) )
        return level.grapplinghookweapon;

    level.grapplinghookweapon = "iw5_dlcgun12loot7_mp";
    return level.grapplinghookweapon;
}

delete_on_reset( var_0 )
{
    var_0 endon( "death" );
    self waittill( "grappling_hook_reset" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}
