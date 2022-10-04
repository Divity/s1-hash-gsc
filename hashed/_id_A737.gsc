// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5D9A()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    level._id_058F["exocrossbow_sticky_explosion"] = loadfx( "vfx/explosion/frag_grenade_default" );
    level._id_058F["exocrossbow_sticky_blinking"] = loadfx( "vfx/lights/light_beacon_crossbow" );

    for (;;)
    {
        self waittill( "missile_fire", var_0, var_1 );
        var_2 = 0;

        if ( issubstr( var_1, "iw5_exocrossbow" ) )
            var_2 = 1;
        else if ( issubstr( var_1, "dlcgun11loot0" ) )
            var_2 = 1;

        if ( !var_2 )
            continue;

        var_0 _meth_8383( self );
        var_0.ch_crossbow_player_jumping = self _meth_83B4();
        thread wait_for_stuck( var_0 );
    }
}

wait_for_stuck( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    var_0 endon( "death" );
    var_0 waittill( "missile_stuck", var_1 );
    var_0 thread _id_29A4( self, var_1 );
}

_id_29A4( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "faux_spawn" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_1 ) && !_id_A75A::_id_4FA3() && isplayer( var_1 ) )
    {
        self.ch_crossbow_victim_jumping = var_1 _meth_83B4();

        if ( var_0 _id_A7B4::_id_51B9( var_1 ) )
            self._id_51B8 = "friendly";
        else
        {
            self._id_51B8 = "enemy";
            self._id_8F66 = var_1;
            var_0 _id_A72E::_id_2479( var_1 );
            var_0 notify( "process", "ch_bullseye" );
        }
    }

    thread _id_8E2D( var_0 );
    thread _id_8E2B( var_0 );
    thread _id_737F( var_0 );
    thread _id_1E86();
    thread _id_A7B4::_id_8E2E( "detonate" );
}

_id_8E2D( var_0 )
{
    self endon( "death" );
    wait 1.5;
    self notify( "exocrossbow_exploded" );
}

_id_8E2B( var_0 )
{
    self endon( "exocrossbow_exploded" );
    self endon( "death" );
    self._id_3B75 = _id_A4F0::_id_8953();
    self._id_3B75._id_02E6 = self._id_02E6;
    self._id_3B75._id_0041 = self._id_0041;
    self._id_3B75 _meth_8053();
    self._id_3B75 _meth_804D( self );
    wait 0.1;
    playfxontag( _id_A4F0::_id_3FA6( "exocrossbow_sticky_blinking" ), self._id_3B75, "tag_origin" );
    self _meth_809A( "exocrossbow_warning" );
}

_id_737F( var_0 )
{
    self endon( "death" );
    self waittill( "exocrossbow_exploded" );
    _id_1E85();
}

_id_1E86()
{
    self endon( "exocrossbow_exploded" );
    self waittill( "death" );
    _id_1E85();
}

_id_1E85()
{
    stopfxontag( _id_A4F0::_id_3FA6( "exocrossbow_sticky_blinking" ), self._id_3B75, "tag_origin" );
    self._id_3B75 delete();
}
