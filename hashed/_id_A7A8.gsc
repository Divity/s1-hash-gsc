// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_2864( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in level._id_0328 )
    {
        if ( isdefined( var_2 ) )
            var_2._id_4E3D = undefined;
    }

    var_0 notify( "death" );
    var_0 delete();
}

_id_5EAF()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_6E4B = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "portabl_radar" || var_1 == "portable_radar_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                continue;
            }

            self._id_6E4B = _id_A4F0::_id_0D01( self._id_6E4B );

            if ( self._id_6E4B.size >= level._id_5A47 )
                _id_2864( self._id_6E4B[0] );

            var_0 waittill( "missile_stuck" );
            var_2 = var_0._id_02E6;

            if ( isdefined( var_0 ) )
                var_0 delete();

            var_3 = spawn( "script_model", var_2 );
            var_3._id_01E7 = 100;
            var_3._id_04A8 = self._id_04A8;
            var_3._id_02E9 = self;
            var_3 _meth_82C0( 1 );
            var_3 _meth_800F( self );
            var_3 _id_6E4F( self );
            var_3 thread _id_A7B4::_id_23E6( "weapon_radar_bombsquad", "tag_origin", self );
            var_3 thread _id_6E4E();
            thread _id_6E51( var_3 );
            self._id_6E4B[self._id_6E4B.size] = var_3;
        }
    }
}

_id_6E4F( var_0 )
{
    self _meth_80B1( "weapon_radar" );

    if ( level._id_91E4 )
        _id_A72D::_id_8022( self._id_04A8, ( 0, 0, 20 ) );
    else
        _id_A72D::_id_7FDF( var_0, ( 0, 0, 20 ) );

    thread _id_6E4D( var_0 );
    thread _id_6E50( var_0 );
    thread _id_6E4C();
    thread _id_A75A::_id_623D( var_0 );
}

_id_6E51( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    _id_A4F0::_id_A060( "disconnect", "joined_team", "joined_spectators", "spawned_player" );
    level thread _id_2864( var_0 );
}

_id_6E4C()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 2.0;
        self _meth_809A( "sentry_gun_beep" );
    }
}

_id_6E4D( var_0 )
{
    self endon( "death" );
    self._id_01E7 = 999999;
    self._id_0275 = 100;
    self._id_0102 = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !_id_A7B4::_id_3AA4( self._id_02E9, var_2 ) )
            continue;

        if ( isdefined( var_10 ) )
            var_11 = _id_A75A::_id_8F56( var_10, "_lefthand" );
        else
            var_11 = undefined;

        if ( isdefined( var_11 ) )
        {
            switch ( var_11 )
            {
                case "flash_grenade_mp":
                case "concussion_grenade_mp":
                case "stun_grenade_mp":
                case "smoke_grenade_mp":
                case "stun_grenade_var_mp":
                case "smoke_grenade_var_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( _id_A75A::_id_514D( var_5 ) )
            self._id_0102 += self._id_0275;

        if ( isdefined( var_9 ) && var_9 & level._id_4B59 )
            self._id_A1BC = 1;

        self._id_A1BA = 1;
        self._id_0102 += var_1;

        if ( isdefined( var_11 ) && ( var_11 == "emp_grenade_mp" || var_11 == "emp_grenade_var_mp" || var_11 == "emp_grenade_killstreak_mp" ) )
            self._id_0102 = self._id_0275 + 1;

        if ( isplayer( var_2 ) )
            var_2 _id_A784::_id_9B04( "portable_radar" );

        if ( self._id_0102 >= self._id_0275 )
        {
            if ( isdefined( var_0 ) && var_2 != var_0 )
                var_2 notify( "destroyed_explosive" );

            self _meth_809A( "sentry_explode" );
            self._id_2659 = playfx( _id_A4F0::_id_3FA6( "equipment_explode" ), self._id_02E6 );
            self _meth_813A();
            var_2 thread _id_2864( self );
        }
    }
}

_id_6E50( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self _meth_80DA( "HINT_NOICON" );
    self _meth_80DB( &"MP_PATCH_PICKUP_PORTABLE_RADAR" );
    _id_A75A::_id_7FFF( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_1 = var_0 _meth_82F9( "portable_radar_mp" );

        if ( var_1 < _func_1E1( "portable_radar_mp" ) )
        {
            var_0 _meth_82F4( "scavenger_pack_pickup" );
            var_0 _meth_82F7( "portable_radar_mp", var_1 + 1 );
            var_0 thread _id_2864( self );
        }
    }
}

_id_6E4E()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 512;

    for (;;)
    {
        foreach ( var_2 in level._id_0328 )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( level._id_91E4 && var_2._id_04A8 == self._id_04A8 )
                continue;

            if ( var_2 _id_A75A::_id_05CB( "specialty_class_lowprofile" ) )
                continue;

            var_3 = distancesquared( self._id_02E6, var_2._id_02E6 );

            if ( distancesquared( var_2._id_02E6, self._id_02E6 ) < var_0 * var_0 )
            {
                var_2._id_4E3D = self._id_02E9;
                continue;
            }

            var_2._id_4E3D = undefined;
        }

        wait 0.05;
    }
}
