// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A211()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "explosive_gel_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            thread _id_98A8( var_0 );
        }
    }
}

_id_0209()
{
    precachemodel( "weapon_c4" );
    precachemodel( "weapon_c4_bombsquad" );
    level._id_3578 = spawnstruct();
    level._id_3578._id_8F67 = "weapon_c4";
    level._id_3578._id_3C80 = "weapon_c4_bombsquad";
    level._id_3578._id_3C81 = loadfx( "vfx/explosion/frag_grenade_default" );
    level._id_3578._id_135E["enemy"] = loadfx( "vfx/lights/light_c4_blink" );
    level._id_3578._id_135E["friendly"] = loadfx( "vfx/lights/light_mine_blink_friendly" );
}

_id_98A8( var_0 )
{
    thread _id_562D( var_0 );
    return 1;
}

_id_562D( var_0 )
{
    thread _id_A210( var_0 );
    var_1 = _id_8E28( var_0 );
}

_id_A210( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "change_owner" );
    var_0 endon( "missile_stuck" );
    var_0 endon( "death" );
    var_1 = 0;

    for (;;)
    {
        if ( self _meth_833C() )
        {
            var_1 = 0;

            while ( self _meth_833C() )
            {
                var_1 += 0.05;
                wait 0.05;
            }

            if ( var_1 >= 0.5 )
                continue;

            var_1 = 0;

            while ( !self _meth_833C() && var_1 < 0.5 )
            {
                var_1 += 0.05;
                wait 0.05;
            }

            if ( var_1 >= 0.5 )
                continue;

            thread _id_3006( var_0 );
        }

        wait 0.05;
    }
}

_id_8E28( var_0 )
{
    self endon( "earlyNotify" );
    var_0 waittill( "missile_stuck" );
    var_1 = bullettrace( var_0._id_02E6, var_0._id_02E6 - ( 0, 0, 4 ), 0, var_0 );
    var_2 = bullettrace( var_0._id_02E6, var_0._id_02E6 + ( 0, 0, 4 ), 0, var_0 );
    var_3 = anglestoforward( var_0._id_0041 );
    var_4 = bullettrace( var_0._id_02E6 + ( 0, 0, 4 ), var_0._id_02E6 + var_3 * 4, 0, var_0 );
    var_5 = undefined;
    var_6 = 0;
    var_7 = 0;

    if ( var_4["surfacetype"] != "none" )
    {
        var_5 = var_4;
        var_7 = 1;
    }
    else if ( var_2["surfacetype"] != "none" )
    {
        var_5 = var_2;
        var_6 = 1;
    }
    else if ( var_1["surfacetype"] != "none" )
        var_5 = var_1;
    else
        var_5 = var_1;

    var_8 = var_5["position"];

    if ( var_8 == var_2["position"] )
        var_8 += ( 0, 0, -5 );

    var_9 = spawn( "script_model", var_8 );
    var_9._id_51DC = var_6;
    var_9._id_510A = var_7;
    var_10 = vectornormalize( var_5["normal"] );
    var_11 = vectortoangles( var_10 );
    var_11 += ( 90, 0, 0 );
    var_9._id_0041 = var_11;
    var_9 _meth_80B1( level._id_3578._id_8F67 );
    var_9._id_02E9 = self;
    var_9 _meth_8383( self );
    var_9._id_534D = ( 0, 0, 55 );
    var_9._id_534A = spawn( "script_model", var_9._id_02E6 + var_9._id_534D );
    var_9._id_8F6E = 0;
    var_9._id_A2D6 = "explosive_gel_mp";
    var_0 delete();
    level._id_5C5A[level._id_5C5A.size] = var_9;
    var_9 thread _id_23E6( level._id_3578._id_3C80, "tag_origin", self );
    var_9 thread _id_5C48();
    var_9 thread _id_7F64( self._id_04A8 );
    var_9 thread _id_5C52();
    var_9 thread _id_3577( self );
    return var_9;
}

_id_23E6( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 _meth_8054();
    wait 0.05;
    var_3 thread _id_A7B4::_id_154F( var_2 );
    var_3 _meth_80B1( var_0 );
    var_3 _meth_804D( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 _meth_80BE( 0 );
    self waittill( "death" );

    if ( isdefined( self._id_04C6 ) )
        self._id_04C6 delete();

    var_3 delete();
}

_id_5C48()
{
    var_0["friendly"] = spawnfx( level._id_3578._id_135E["friendly"], self _meth_8180( "tag_fx" ) );
    var_0["enemy"] = spawnfx( level._id_3578._id_135E["enemy"], self _meth_8180( "tag_fx" ) );
    thread _id_5C49( var_0 );
    self waittill( "death" );
    var_0["friendly"] delete();
    var_0["enemy"] delete();
}

_id_5C49( var_0, var_1 )
{
    self endon( "death" );
    var_2 = self._id_02E9._id_04A8;
    wait 0.05;
    triggerfx( var_0["friendly"] );
    triggerfx( var_0["enemy"] );

    for (;;)
    {
        var_0["friendly"] _meth_8054();
        var_0["enemy"] _meth_8054();

        foreach ( var_4 in level._id_0328 )
        {
            if ( level._id_91E4 )
            {
                if ( var_4._id_04A8 == var_2 )
                    var_0["friendly"] _meth_8007( var_4 );
                else
                    var_0["enemy"] _meth_8007( var_4 );

                continue;
            }

            if ( var_4 == self._id_02E9 )
            {
                var_0["friendly"] _meth_8007( var_4 );
                continue;
            }

            var_0["enemy"] _meth_8007( var_4 );
        }

        level _id_A4F0::_id_A07E( "joined_team", "player_spawned" );
    }
}

_id_7F64( var_0 )
{
    self endon( "death" );
    wait 0.05;

    if ( level._id_91E4 )
    {
        if ( self._id_51DC == 1 || self._id_510A == 1 )
            _id_A72D::_id_8022( var_0, ( 0, 0, 28 ), undefined, 1 );
        else
            _id_A72D::_id_8022( var_0, ( 0, 0, 28 ) );
    }
    else if ( isdefined( self._id_02E9 ) )
    {
        if ( self._id_51DC == 1 )
            _id_A72D::_id_7FDF( self._id_02E9, ( 28, 0, 28 ) );
        else
            _id_A72D::_id_7FDF( self._id_02E9, ( 0, 0, 28 ) );
    }
}

_id_5C52()
{
    self endon( "mine_triggered" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self _meth_82C0( 1 );
    self._id_0275 = 100000;
    self._id_01E7 = self._id_0275;
    var_0 = undefined;

    for (;;)
    {
        self waittill( "damage", var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isplayer( var_0 ) )
            continue;

        if ( !_id_A7B4::_id_3AA4( self._id_02E9, var_0 ) )
            continue;

        if ( isdefined( var_9 ) )
        {
            var_10 = _id_A75A::_id_8F56( var_9, "_lefthand" );

            switch ( var_10 )
            {
                case "smoke_grenade_mp":
                case "smoke_grenade_var_mp":
                    continue;
            }
        }

        break;
    }

    self notify( "mine_destroyed" );

    if ( isdefined( var_4 ) && ( issubstr( var_4, "MOD_GRENADE" ) || issubstr( var_4, "MOD_EXPLOSIVE" ) ) )
        self._id_A1B7 = 1;

    if ( isdefined( var_8 ) && var_8 & level._id_4B59 )
        self._id_A1BC = 1;

    self._id_A1BA = 1;

    if ( isplayer( var_0 ) )
        var_0 _id_A784::_id_9B04( "bouncing_betty" );

    if ( level._id_91E4 )
    {
        if ( isdefined( var_0 ) && isdefined( var_0._id_030D["team"] ) && isdefined( self._id_02E9 ) && isdefined( self._id_02E9._id_030D["team"] ) )
        {
            if ( var_0._id_030D["team"] != self._id_02E9._id_030D["team"] )
                var_0 notify( "destroyed_explosive" );
        }
    }
    else if ( isdefined( self._id_02E9 ) && isdefined( var_0 ) && var_0 != self._id_02E9 )
        var_0 notify( "destroyed_explosive" );

    thread _id_5C58( var_0 );
}

_id_5C58( var_0 )
{
    if ( !isdefined( self ) || !isdefined( self._id_02E9 ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self._id_02E9;

    self _meth_809A( "null" );
    var_1 = self _meth_8180( "tag_fx" );
    playfx( level._id_3578._id_3C81, var_1 );
    wait 0.05;

    if ( !isdefined( self ) || !isdefined( self._id_02E9 ) )
        return;

    self _meth_8054();
    self _meth_81D5( self._id_02E6, 192, 100, 100, var_0, "MOD_EXPLOSIVE" );

    if ( isdefined( self._id_02E9 ) && isdefined( level._id_5653 ) )
        self._id_02E9 thread [[ level._id_5653 ]]( "mine_destroyed", undefined, undefined, self._id_02E6 );

    wait 0.2;

    if ( !isdefined( self ) || !isdefined( self._id_02E9 ) )
        return;

    thread _id_0C9D();
    self notify( "death" );

    if ( isdefined( self._id_6816 ) )
        self._id_6816 delete();

    self _meth_8054();
}

_id_3006( var_0 )
{
    self notify( "earlyNotify" );
    var_1 = var_0 _meth_8180( "tag_fx" );
    playfx( level._id_3578._id_3C81, var_1 );
    var_0 _meth_81D6();
}

_id_0C9D()
{
    wait 3;
    self._id_534A delete();
    self delete();
    level._id_5C5A = _id_A4F0::_id_0D01( level._id_5C5A );
}

_id_3577( var_0 )
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    wait 3;
    self notify( "mine_triggered" );
    thread _id_5C58();
}
