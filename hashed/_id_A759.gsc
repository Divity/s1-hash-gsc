// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A258()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );
    _id_974A();

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "tri_drone_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            thread _id_98CB( var_0 );
        }
    }
}

_id_0209()
{
    precacheshellshock( "flashbang_mp" );
    precachemodel( "projectile_bouncing_betty_grenade_small" );
    precachemodel( "projectile_bouncing_betty_grenade_small_bombsquad" );
    level._id_974C = spawnstruct();
    level._id_974C._id_5C4C = 1;
    level._id_974C._id_1495 = 132;
    level._id_974C._id_2EF8 = 128;
    level._id_974C._id_2F13 = "projectile_bouncing_betty_grenade_small";
    level._id_974C._id_2EF7 = "projectile_bouncing_betty_grenade_small_bombsquad";
    level._id_974C._id_2F06 = loadfx( "vfx/explosion/frag_grenade_default" );
    level._id_974C._id_135E["enemy"] = loadfx( "vfx/lights/light_c4_blink" );
    level._id_974C._id_135E["friendly"] = loadfx( "vfx/lights/light_mine_blink_friendly" );
    level._id_974C._id_2CF1 = loadfx( "vfx/unique/orbital_dome_ground_friendly" );
}

_id_974A()
{
    if ( !isdefined( self._id_9749 ) )
    {
        self._id_9749 = 0;
        thread _id_84F7();
    }

    self._id_9749 = 0;
    self._id_9749 += 3;

    if ( !isdefined( self._id_974B ) )
        self._id_974B = [];
}

_id_98CB( var_0 )
{
    if ( self._id_9749 <= 0 )
        _id_974A();

    if ( self._id_9749 > 0 )
    {
        thread _id_562F( var_0 );
        self._id_9749--;

        if ( self._id_9749 >= 1 )
            self _meth_830E( "tri_drone_mp" );
    }

    return 1;
}

_id_562F( var_0 )
{
    var_1 = _id_89EF( var_0 );
    self._id_974B = _id_A4F0::_id_0CDA( self._id_974B, var_1 );
    thread _id_5E99( var_1 );
}

_id_070C( var_0 )
{
    self endon( "death" );

    foreach ( var_2 in var_0._id_974B )
    {
        if ( isdefined( var_2 ) )
        {
            if ( var_2 != self )
            {
                var_2._id_04C6 notify( "trigger" );
                wait 0.25;
            }
        }
    }
}

_id_73B1()
{
    self._id_02E9._id_974B = _id_A4F0::_id_0CF6( self._id_02E9._id_974B, self );
}

_id_5E99( var_0 )
{
    var_0 endon( "death" );
    self waittill( "death" );
    self._id_9749 = 0;

    if ( isdefined( var_0._id_6816 ) )
        var_0._id_6816 delete();

    var_0 delete();
}

_id_89EF( var_0 )
{
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
    var_9 _meth_80B1( level._id_974C._id_2F13 );
    var_9._id_02E9 = self;
    var_9 _meth_8383( self );
    var_9._id_534D = ( 0, 0, 55 );
    var_9._id_534A = spawn( "script_model", var_9._id_02E6 + var_9._id_534D );
    var_9._id_8F6E = 0;
    var_9._id_A2D6 = "tri_drone_mp";
    var_0 delete();
    level._id_5C5A[level._id_5C5A.size] = var_9;
    var_9 thread _id_23E6( level._id_974C._id_2EF7, "tag_origin", self );
    var_9 thread _id_5C48();
    var_9 thread _id_8030( self._id_04A8 );
    var_9 thread _id_5C52();
    var_9 thread _id_5C59( self );
    var_9 thread _id_5C5B();
    var_9 thread _id_2856( self );
    var_9 thread _id_4659( self, "apm_mine" );
    return var_9;
}

_id_84FF()
{
    var_0["dome"] = spawnfx( level._id_974C._id_2CF1, self _meth_8180( "tag_fx" ) );
    triggerfx( var_0["dome"] );
    self waittill( "death" );
    var_0["dome"] delete();
}

_id_84F7()
{
    self endon( "disconnect" );

    for (;;)
    {
        if ( "tri_drone_mp" == self _meth_8345() )
            self _meth_82FB( "ui_tri_drone_count", self._id_9749 );

        waittillframeend;
    }
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
    var_0["friendly"] = spawnfx( level._id_974C._id_135E["friendly"], self _meth_8180( "tag_fx" ) );
    var_0["enemy"] = spawnfx( level._id_974C._id_135E["enemy"], self _meth_8180( "tag_fx" ) );
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

_id_8030( var_0 )
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
    _id_73B1();

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
    playfx( level._id_974C._id_2F06, var_1 );
    wait 0.05;

    if ( !isdefined( self ) || !isdefined( self._id_02E9 ) )
        return;

    self _meth_8054();
    self _meth_81D5( self._id_02E6, 192, 60, 60, var_0, "MOD_EXPLOSIVE", "bouncingbetty_mp" );

    foreach ( var_3 in level._id_0328 )
    {
        var_4 = distance( self._id_02E6, var_3._id_02E6 );

        if ( var_4 < 192 )
            var_3 _meth_8182( "flashbang_mp", 2.5 );
    }

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

_id_0C9D()
{
    wait 3;
    self._id_534A delete();
    self delete();
    level._id_5C5A = _id_A4F0::_id_0D01( level._id_5C5A );
}

_id_334B()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "change_owner" );
    self._id_6816 _meth_80DA( "HINT_NOICON" );
    var_0 = self._id_6816._id_02E9;
    _id_3347( var_0 );

    for (;;)
    {
        self._id_6816 waittill( "trigger", var_0 );
        var_0 _meth_82F4( "scavenger_pack_pickup" );
        var_0._id_9749++;

        if ( var_0._id_9749 == 1 )
            var_0 _meth_830E( "tri_drone_mp" );

        if ( isdefined( self._id_6816 ) )
            self._id_6816 delete();

        self._id_534A delete();
        self delete();
        level._id_5C5A = _id_A4F0::_id_0D01( level._id_5C5A );
    }
}

_id_3347( var_0 )
{
    self notify( "equipmentWatchUse" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "equipmentWatchUse" );
    self endon( "change_owner" );
    self._id_6816 _meth_80DA( "HINT_NOICON" );
    self._id_6816 _meth_80DB( &"MP_PICKUP_TRI_DRONE" );
    self._id_6816 _id_A75A::_id_7FFF( var_0 );
}

_id_3345( var_0 )
{
    self._id_04C6 _meth_80DB( "" );
    self._id_04C6 _id_A75A::_id_7FFE();
}

_id_5C59( var_0 )
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    wait 2;
    self._id_6816 = spawn( "script_origin", self._id_02E6 );
    self._id_6816._id_02E9 = var_0;
    thread _id_334B();
    var_1 = spawn( "trigger_radius", self._id_02E6 + ( 0, 0, -96 ), 0, 192, 192 );
    var_1._id_02E9 = self;
    self._id_04C6 = var_1;
    thread _id_5C54( var_1 );
    var_2 = undefined;

    for (;;)
    {
        var_1 waittill( "trigger", var_2 );

        if ( !isdefined( var_2 ) )
            break;

        if ( getdvarint( "scr_minesKillOwner" ) != 1 )
        {
            if ( isdefined( self._id_02E9 ) )
            {
                if ( var_2 == self._id_02E9 )
                    continue;

                if ( isdefined( var_2._id_02E9 ) && var_2._id_02E9 == self._id_02E9 )
                    continue;
            }

            if ( !_id_A7B4::_id_3AA4( self._id_02E9, var_2, 0 ) )
                continue;
        }

        if ( lengthsquared( var_2 _meth_81B2() ) < 10 )
            continue;

        if ( var_2 _meth_81D7( self._id_02E6, self ) > 0 )
            break;
    }

    _id_73B1();
    self notify( "mine_triggered" );
    self _meth_809A( "claymore_activated" );
    self _meth_809A( "mine_betty_spin" );
    playfx( level._id_5C46, self._id_02E6 );
    var_3 = anglestoup( self._id_0041 );
    var_4 = self._id_02E6 + var_3 * 64;
    self _meth_82AE( var_4, 0.75, 0, 0.25 );
    self._id_534A _meth_82AE( var_4 + self._id_534D, 0.75, 0, 0.25 );
    self _meth_82BD( ( 0, 750, 32 ), 0.7, 0, 0.65 );
    thread _id_6DDE();

    if ( isplayer( var_2 ) && var_2 _id_A75A::_id_05CB( "specialty_class_engineer" ) )
    {
        var_2 notify( "triggered_mine" );
        wait 3;
    }
    else
        wait 1;

    thread _id_5C58();
}

_id_6DDE()
{
    self endon( "death" );
    var_0 = gettime() + 1000;

    while ( gettime() < var_0 )
    {
        wait 0.05;
        playfxontag( level._id_5C47, self, "tag_fx_spin1" );
        playfxontag( level._id_5C47, self, "tag_fx_spin3" );
        wait 0.05;
        playfxontag( level._id_5C47, self, "tag_fx_spin2" );
        playfxontag( level._id_5C47, self, "tag_fx_spin4" );
    }
}

_id_5C54( var_0 )
{
    _id_A4F0::_id_A060( "mine_triggered", "mine_destroyed", "death" );
    var_0 delete();
}

_id_5C5B()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "death" );
    wait 120;
    self notify( "mine_selfdestruct" );

    if ( isdefined( self._id_534A ) )
        self._id_534A delete();

    playfx( level._id_058F["equipment_explode"], self._id_02E6 );
    self delete();
}

_id_2856( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self endon( "death" );
    var_0 waittill( "joined_team" );
    self delete();
    self notify( "death" );
}

_id_4659( var_0, var_1 )
{
    self endon( "death" );

    if ( var_0 _id_A75A::_id_50F6() )
    {
        self notify( "death" );

        if ( var_1 == "apm_mine" )
        {
            playfx( level._id_058F["equipment_explode"], self._id_02E6 );
            self delete();
        }

        return;
    }

    for (;;)
    {
        level waittill( "emp_update" );

        if ( !var_0 _id_A75A::_id_50F6() )
            continue;

        if ( var_1 == "apm_mine" )
        {
            playfx( level._id_058F["equipment_explode"], self._id_02E6 );
            self delete();
        }

        self notify( "death" );
    }
}
