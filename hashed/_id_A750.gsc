// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    _id_8707();
    _id_72D7();
    thread _id_870C();
}

_id_870C()
{
    level._id_065D._id_2FDE = 0;

    if ( isdefined( level._id_0328 ) && level._id_0328.size > 0 )
    {
        foreach ( var_1 in level._id_0328 )
        {
            var_1 _meth_84D7( "mp_init_mix" );
            wait 0.05;
            var_1 _meth_84D7( "mp_pre_event_mix" );
            wait 0.05;
        }
    }
}

_id_870D()
{
    level._id_065D._id_2FDE = 1;

    if ( isdefined( level._id_0328 ) && level._id_0328.size > 0 )
    {
        foreach ( var_1 in level._id_0328 )
        {
            var_1 _meth_84D8( "mp_pre_event_mix" );
            wait 0.05;
            var_1 _meth_84D7( "mp_post_event_mix" );
            wait 0.05;
        }
    }
}

_id_870E()
{
    self _meth_84D7( "mp_init_mix" );

    if ( !isdefined( level._id_065D._id_2FDE ) || !level._id_065D._id_2FDE )
        self _meth_84D7( "mp_pre_event_mix" );
    else
    {
        self _meth_84D8( "mp_pre_event_mix" );
        self _meth_84D7( "mp_post_event_mix" );
    }
}

_id_8707()
{
    if ( !isdefined( level._id_065D ) )
        level._id_065D = spawnstruct();

    if ( !isdefined( level._id_065D._id_5BB6 ) )
        level._id_065D._id_5BB6 = [];
}

_id_8747( var_0, var_1 )
{
    level._id_065D._id_5BB6[var_0] = var_1;
}

_id_8710( var_0, var_1, var_2 )
{
    level notify( "stop_other_music" );
    level endon( "stop_other_music" );

    if ( isdefined( var_2 ) )
        childthread _id_8706( "snd_music_handler", var_0, var_1, var_2 );
    else if ( isdefined( var_1 ) )
        childthread _id_8706( "snd_music_handler", var_0, var_1 );
    else
        childthread _id_8706( "snd_music_handler", var_0 );
}

_id_8706( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._id_065D._id_5BB6[var_0] ) )
    {
        if ( isdefined( var_3 ) )
            thread [[ level._id_065D._id_5BB6[var_0] ]]( var_1, var_2, var_3 );
        else if ( isdefined( var_2 ) )
            thread [[ level._id_065D._id_5BB6[var_0] ]]( var_1, var_2 );
        else if ( isdefined( var_1 ) )
            thread [[ level._id_065D._id_5BB6[var_0] ]]( var_1 );
        else
            thread [[ level._id_065D._id_5BB6[var_0] ]]();
    }
}

_id_72D7()
{
    _id_8747( "mp_exo_cloak_activate", ::_id_5FAC );
    _id_8747( "mp_exo_cloak_deactivate", ::_id_5FAD );
    _id_8747( "mp_exo_health_activate", ::_id_5FAE );
    _id_8747( "mp_exo_health_deactivate", ::_id_5FAF );
    _id_8747( "mp_regular_exo_hover", ::_id_5FCC );
    _id_8747( "mp_suppressed_exo_hover", ::_id_5FCE );
    _id_8747( "mp_exo_mute_activate", ::_id_5FB0 );
    _id_8747( "mp_exo_mute_deactivate", ::_id_5FB1 );
    _id_8747( "mp_exo_overclock_activate", ::_id_5FB2 );
    _id_8747( "mp_exo_overclock_deactivate", ::_id_5FB3 );
    _id_8747( "mp_exo_ping_activate", ::_id_5FB4 );
    _id_8747( "mp_exo_ping_deactivate", ::_id_5FB5 );
    _id_8747( "mp_exo_repulsor_activate", ::_id_5FB6 );
    _id_8747( "mp_exo_repulsor_deactivate", ::_id_5FB7 );
    _id_8747( "mp_exo_repulsor_repel", ::_id_5FB8 );
    _id_8747( "mp_exo_shield_activate", ::_id_5FB9 );
    _id_8747( "mp_exo_shield_deactivate", ::_id_5FBA );
    _id_8747( "goliath_pod_burst", ::_id_5FBF );
    _id_8747( "goliath_death_explosion", ::_id_5FBE );
    _id_8747( "goliath_self_destruct", ::_id_5FC0 );
    _id_8747( "exo_knife_player_impact", ::_id_5FD2 );
}

_id_5FAC()
{
    self _meth_809A( "mp_exo_cloak_activate" );
}

_id_5FAD()
{
    self _meth_809A( "mp_exo_cloak_deactivate" );
}

_id_5FAE()
{
    self _meth_809A( "mp_exo_stim_activate" );
}

_id_5FAF()
{
    self _meth_809A( "mp_exo_stim_deactivate" );
}

_id_5FCC()
{
    self _meth_82F4( "mp_exo_hover_activate" );
    self _meth_82F4( "mp_exo_hover_fuel" );
    self waittill( "stop_exo_hover_effects" );
    self _meth_82F4( "mp_exo_hover_deactivate" );
    self _meth_82F5( "mp_exo_hover_sup_fuel" );
}

_id_5FCE()
{
    self _meth_82F4( "mp_exo_hover_sup_activate" );
    self _meth_82F4( "mp_exo_hover_sup_fuel" );
    self waittill( "stop_exo_hover_effects" );
    self _meth_82F4( "mp_exo_hover_sup_deactivate" );
    self _meth_82F5( "mp_exo_hover_sup_fuel" );
}

_id_5FB0()
{
    self _meth_82F4( "mp_exo_mute_activate" );
}

_id_5FB1()
{
    self _meth_82F4( "mp_exo_mute_deactivate" );
}

_id_5FB2()
{
    self _meth_809A( "mp_exo_overclock_activate" );
}

_id_5FB3()
{
    self _meth_809A( "mp_exo_overclock_deactivate" );
}

_id_5FB4()
{
    self _meth_82F4( "mp_exo_ping_activate" );
}

_id_5FB5()
{
    self _meth_809A( "mp_exo_ping_deactivate" );
}

_id_5FB6()
{
    self _meth_809A( "mp_exo_trophy_activate" );
}

_id_5FB7()
{
    self _meth_809A( "mp_exo_trophy_deactivate" );
}

_id_5FB8()
{
    playsoundatpos( self._id_02E6, "mp_exo_trophy_intercept" );
}

_id_5FB9()
{
    self _meth_809A( "mp_exo_shield_activate" );
}

_id_5FBA()
{
    self _meth_809A( "mp_exo_shield_deactivate" );
}

_id_5FD2()
{
    playsoundatpos( self._id_02E6, "wpn_combatknife_stab_npc" );
}

_id_5FBF()
{
    self _meth_82F4( "goliath_suit_up_pod_burst" );
}

_id_5FBE()
{
    self _meth_809A( "goliath_death_destruct" );
}

_id_5FC0()
{
    self _meth_809A( "goliath_death_destruct" );
}
