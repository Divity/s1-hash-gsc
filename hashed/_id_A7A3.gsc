// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6EDF()
{
    precachemodel( "tag_player" );
    precachemodel( "vehicle_ac130_coop" );
    precachemodel( "vehicle_drop_pod_base" );
    precachemodel( "vehicle_drop_pod_base_enemy" );
    map_restart( "mp_orbital_pod_base_unfold" );
    game["dialog"]["orbital_pod_destroyed"] = "orbital_pod_destroyed";
    game["dialog"]["orbital_pod_destroyed_enemy"] = "orbital_pod_destroyed_enemy";
    game["dialog"]["orbital_dropin"] = "orbital_dropin";
    game["dialog"]["orbital_notgood_tryhard"] = "orbital_notgood_tryhard";
    level._id_2F51["pod_base_destroyed"] = loadfx( "vfx/explosion/orbital_pod_base_explosion" );
    level._id_2F51["dome_impact_flash"] = loadfx( "vfx/unique/orbital_dome_impact_flash" );
    level._id_2F51["dome_shutdown_friendly"] = loadfx( "vfx/unique/orbital_dome_shutdown_friendly" );
    level._id_2F51["dome_shutdown_enemy"] = loadfx( "vfx/unique/orbital_dome_shutdown_enemy" );
    level._id_2F51["player_spawn_from_pod"] = loadfx( "vfx/ui/drop_pod_spawn_point_active" );
    level._id_2F51["drop_pod_fire_flash"] = loadfx( "vfx/unique/orbital_drop_pod_fire_flash" );
    level._id_2F51["decel_explosion"] = loadfx( "vfx/explosion/orbital_pod_decel_explosion" );
    level._id_2F51["dome_impact"] = loadfx( "vfx/explosion/orbital_pod_impact_dome" );
    level._id_2F51["landing_impact"] = loadfx( "vfx/smoke/drop_pod_landing_impact" );
    level._id_2F51["drop_pod_explode"] = loadfx( "vfx/explosion/orbital_drop_pod_explode" );
    level._id_2F51["drop_pod_spike_impact"] = loadfx( "vfx/weaponimpact/drop_pod_spike_impact" );
    var_0 = getdvar( "mapname" );

    switch ( var_0 )
    {
        case "mp_refraction":
            level._id_2F4D["friendly"] = loadfx( "vfx/unique/orbital_dome_friendly_ref" );
            level._id_2F4D["enemy"] = loadfx( "vfx/unique/orbital_dome_enemy_ref" );
            level._id_2F4E["friendly"] = loadfx( "vfx/unique/orbital_dome_ground_friendly_ref" );
            level._id_2F4E["enemy"] = loadfx( "vfx/unique/orbital_dome_ground_enemy_ref" );
            break;
        default:
            level._id_2F4D["friendly"] = loadfx( "vfx/unique/orbital_dome_friendly" );
            level._id_2F4D["enemy"] = loadfx( "vfx/unique/orbital_dome_enemy" );
            level._id_2F4E["friendly"] = loadfx( "vfx/unique/orbital_dome_ground_friendly" );
            level._id_2F4E["enemy"] = loadfx( "vfx/unique/orbital_dome_ground_enemy" );
            break;
    }
}

_id_4DDE()
{
    _id_6EDF();
    level._id_2F47 = spawnstruct();
    level._id_2F47._id_02A0 = "vehicle_drop_pod_base";
    level._id_2F47._id_325A = "vehicle_drop_pod_base_enemy";
    level._id_2F47._id_287D = 2;
    level._id_2F62 = getentarray( "drop_pod_volume", "targetname" );
    level._id_2F49 = getentarray( "orbital_bad_spawn_overlay", "targetname" );
    level._id_6551 = spawnstruct();
    level._id_39C3 = 15;
    var_0 = getdvar( "mapname" );

    switch ( var_0 )
    {
        case "mp_refraction":
            setdvar( "missileRemoteSteerPitchRange", "37 88" );
            level._id_5675 = getent( "orbital_plane_left_loop_start", "targetname" );
            level._id_566D = getent( "orbital_plane_left_big_loop_start", "targetname" );
            level._id_751E = getent( "orbital_plane_right_loop_start", "targetname" );
            level._id_7516 = getent( "orbital_plane_right_big_loop_start", "targetname" );
            level._id_5677 = getent( "orbital_left_loop_pivot", "targetname" );
            level._id_566E = getent( "orbital_left_big_loop_pivot", "targetname" );
            level._id_751F = getent( "orbital_right_loop_pivot", "targetname" );
            level._id_7517 = getent( "orbital_right_big_loop_pivot", "targetname" );
            level._id_6551._id_5CC3["target"] = getent( "orbitalMissileTarget", "targetname" );
            level._id_6551._id_1A2D["allies"] = spawn( "script_model", level._id_5675._id_02E6 );
            level._id_6551._id_1A2D["allies"] _meth_80B1( "tag_player" );
            level._id_6551._id_1A2D["allies"]._id_0041 += ( 0, 220, 0 );
            level._id_6551._id_1A2D["allies"]._id_04A8 = "allies";
            level._id_6551._id_1A2D["allies"] _meth_8446( level._id_5677 );
            level._id_6551._id_1A2D["allies"]._id_9497 = "left";
            level._id_6551._id_1A2D["allies"] _meth_8054();
            level._id_6551._id_1A2D["axis"] = spawn( "script_model", level._id_566D._id_02E6 );
            level._id_6551._id_1A2D["axis"] _meth_80B1( "tag_player" );
            level._id_6551._id_1A2D["axis"]._id_0041 += ( 0, 330, 0 );
            level._id_6551._id_1A2D["axis"]._id_04A8 = "axis";
            level._id_6551._id_1A2D["axis"] _meth_8446( level._id_566E );
            level._id_6551._id_1A2D["axis"]._id_9497 = "left_big";
            level._id_6551._id_1A2D["axis"] _meth_8054();
            level._id_6551._id_83C3["allies"] = spawn( "script_model", level._id_5675._id_02E6 );
            level._id_6551._id_83C3["allies"] _meth_80B1( "vehicle_ac130_coop" );
            level._id_6551._id_83C3["allies"]._id_0041 += ( 0, 220, 0 );
            level._id_6551._id_83C3["allies"] _meth_8446( level._id_6551._id_1A2D["allies"], "", ( 0, 0, 80 ), ( 0, 0, 0 ) );
            level._id_6551._id_83C3["axis"] = spawn( "script_model", level._id_566D._id_02E6 );
            level._id_6551._id_83C3["axis"] _meth_80B1( "vehicle_ac130_coop" );
            level._id_6551._id_83C3["axis"]._id_0041 += ( 0, 330, 0 );
            level._id_6551._id_83C3["axis"] _meth_8446( level._id_6551._id_1A2D["axis"], "", ( 0, 0, 80 ), ( 0, 0, 0 ) );
            thread _id_75FE();
            level._id_6551._id_1A2D["allies"] thread _id_5ED6();
            level._id_6551._id_1A2D["axis"] thread _id_5ED6();
            break;
        default:
            setdvar( "missileRemoteSteerPitchRange", "47 88" );
            var_1 = getent( "airstrikeheight", "targetname" );
            var_2 = getentarray( "minimap_corner", "targetname" );

            if ( var_2.size == 2 )
                level._id_6551._id_1C0F = _id_A7AF::_id_3777( var_2[0]._id_02E6, var_2[1]._id_02E6 );
            else
            {

            }

            level._id_6551._id_2B6C = 3500;
            level._id_6551._id_359C = 2000;
            level._id_6551._id_1C0F *= ( 1, 1, 0 );
            level._id_6551._id_1C0F += ( 0, 0, var_1._id_02E6[2] + level._id_6551._id_359C );
            var_3 = level._id_6551._id_1C0F;
            var_4 = ( 0, 0, 0 );
            var_5 = ( 0, 180, 0 );
            var_6 = var_3 + anglestoforward( var_4 ) * level._id_6551._id_2B6C;
            var_7 = var_3 + anglestoforward( var_5 ) * level._id_6551._id_2B6C;
            level._id_6551._id_039C = spawn( "script_origin", level._id_6551._id_1C0F );
            level._id_6551._id_1A2D["allies"] = spawn( "script_model", var_6 );
            level._id_6551._id_1A2D["allies"] _meth_80B1( "tag_player" );
            level._id_6551._id_1A2D["allies"]._id_0041 += ( 0, 180, 0 );
            level._id_6551._id_1A2D["allies"] _meth_8446( level._id_6551._id_039C );
            level._id_6551._id_1A2D["allies"] _meth_8054();
            level._id_6551._id_1A2D["axis"] = spawn( "script_model", var_7 );
            level._id_6551._id_1A2D["axis"] _meth_80B1( "tag_player" );
            level._id_6551._id_1A2D["axis"]._id_0041 += ( 0, 0, 0 );
            level._id_6551._id_1A2D["axis"] _meth_8446( level._id_6551._id_039C );
            level._id_6551._id_1A2D["axis"] _meth_8054();
            level._id_6551._id_5CC3["target"] = spawn( "script_origin", level._id_6551._id_1C0F - ( 0, 0, 7000 ) );
            level._id_6551._id_5CC3["target"]._id_04A7 = "orbitalMissileTarget";
            level._id_6551._id_83C3["allies"] = spawn( "script_model", var_6 );
            level._id_6551._id_83C3["allies"] _meth_80B1( "vehicle_ac130_coop" );
            level._id_6551._id_83C3["allies"]._id_0041 += ( 0, 180, 0 );
            level._id_6551._id_83C3["allies"] _meth_8446( level._id_6551._id_1A2D["allies"], "", ( 0, 0, 100 ), ( 15, 0, 0 ) );
            level._id_6551._id_83C3["axis"] = spawn( "script_model", var_7 );
            level._id_6551._id_83C3["axis"] _meth_80B1( "vehicle_ac130_coop" );
            level._id_6551._id_83C3["axis"]._id_0041 += ( 0, 0, 0 );
            level._id_6551._id_83C3["axis"] _meth_8446( level._id_6551._id_1A2D["axis"], "", ( 0, 0, 100 ), ( 15, 0, 0 ) );
            level._id_6551._id_039C thread _id_75FF();
            break;
    }

    thread _id_8502();
    thread _id_89F6();
}

_id_5ED6()
{
    level endon( "game_ended" );
    self._id_8D09 = 0;
    level._id_83C6 = 0.5;
    var_0 = 4;
    wait 2;

    for (;;)
    {
        var_1 = "none";
        var_2 = self._id_9497;

        switch ( var_2 )
        {
            case "right":
                var_1 = distance( self._id_02E6, level._id_566D._id_02E6 );

                if ( var_1 <= 200 && self._id_8D09 == 0 )
                    level._id_83C6 = 0.05;

                if ( var_1 <= var_0 )
                {
                    self _meth_804F();
                    self._id_02E6 = level._id_566D._id_02E6;
                    self _meth_8446( level._id_566E );
                    self._id_9497 = "left_big";
                    level._id_83C6 = 0.5;
                }

                break;
            case "left_big":
                var_1 = distance( self._id_02E6, level._id_5675._id_02E6 );

                if ( var_1 <= 200 && self._id_8D09 == 0 )
                    level._id_83C6 = 0.05;

                if ( var_1 <= var_0 )
                {
                    self _meth_804F();
                    self._id_02E6 = level._id_5675._id_02E6;
                    self _meth_8446( level._id_5677 );
                    self._id_9497 = "left";
                    level._id_83C6 = 0.5;
                }

                break;
            case "left":
                var_1 = distance( self._id_02E6, level._id_7516._id_02E6 );

                if ( var_1 <= 200 && self._id_8D09 == 0 )
                    level._id_83C6 = 0.05;

                if ( var_1 <= var_0 )
                {
                    self _meth_804F();
                    self._id_02E6 = level._id_7516._id_02E6;
                    self _meth_8446( level._id_7517 );
                    self._id_9497 = "right_big";
                    level._id_83C6 = 0.5;
                }

                break;
            case "right_big":
                var_1 = distance( self._id_02E6, level._id_751E._id_02E6 );

                if ( var_1 <= 200 && self._id_8D09 == 0 )
                    level._id_83C6 = 0.05;

                if ( var_1 <= var_0 )
                {
                    self _meth_804F();
                    self._id_02E6 = level._id_751E._id_02E6;
                    self _meth_8446( level._id_751F );
                    self._id_9497 = "right";
                    level._id_83C6 = 0.5;
                }

                break;
            default:
                break;
        }

        level._id_2B71 = var_1;
        wait(level._id_83C6);
    }
}

_id_75FF()
{
    level endon( "game_ended" );

    for (;;)
    {
        self _meth_82B7( 3600, 1200 );
        wait 1199;
    }
}

_id_75FE()
{
    level endon( "game_ended" );

    for (;;)
    {
        level._id_5677 _meth_82B7( -5400, 1200 );
        level._id_566E _meth_82B7( -700, 1200 );
        level._id_751F _meth_82B7( 5400, 1200 );
        level._id_7517 _meth_82B7( 700, 1200 );
        wait 1199;
    }
}

_id_89F6()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_spawned", var_0 );
        var_0 _meth_82FB( "ui_orbital_toggle_hud", 1 );
        var_0 _meth_82FB( "ui_orbital_is_dropping", 1 );

        if ( !isbot( var_0 ) )
        {
            var_0 _meth_831D();
            var_0 _meth_8005();
            var_0 _meth_8482();
            var_0 thread _id_7F70( 1, 0 );
            var_0._id_50F5 = 1;
            var_0 thread _id_8503();
            var_0 thread _id_6CCA();
            var_0 thread _id_A02F();
        }
    }
}

_id_8503()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );

    for (;;)
    {
        _id_487C();

        foreach ( var_1 in level._id_0328 )
        {
            if ( isdefined( var_1._id_50F5 ) )
            {
                if ( var_1._id_50F5 == 1 )
                {
                    var_1 _id_8520();
                    continue;
                }

                var_1 _id_8521();
            }
        }

        wait 0.05;
    }
}

_id_487C()
{
    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1._id_2F47 ) )
        {
            if ( isdefined( var_1._id_2F47._id_9837 ) )
                var_1._id_2F47._id_9837 _meth_8054();

            if ( isdefined( var_1._id_2F47._id_9836 ) )
                var_1._id_2F47._id_9836 _meth_8054();

            if ( isdefined( var_1._id_2F47._id_9839 ) )
                var_1._id_2F47._id_9839 _meth_8054();

            if ( isdefined( var_1._id_2F47._id_9838 ) )
                var_1._id_2F47._id_9838 _meth_8054();
        }
    }
}

_id_8520()
{
    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1._id_2F47 ) )
        {
            if ( var_1._id_04A8 == self._id_04A8 )
            {
                if ( isdefined( var_1._id_2F47._id_9837 ) )
                    var_1._id_2F47._id_9837 _meth_8007( self );
            }

            if ( !( var_1._id_04A8 == self._id_04A8 ) )
            {
                if ( isdefined( var_1._id_2F47._id_9836 ) )
                    var_1._id_2F47._id_9836 _meth_8007( self );
            }
        }
    }
}

_id_8521()
{
    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1._id_2F47 ) )
        {
            if ( var_1._id_04A8 == self._id_04A8 )
            {
                if ( isdefined( var_1._id_2F47._id_9839 ) )
                    var_1._id_2F47._id_9839 _meth_8007( self );
            }

            if ( !( var_1._id_04A8 == self._id_04A8 ) )
            {
                if ( isdefined( var_1._id_2F47._id_9838 ) )
                    var_1._id_2F47._id_9838 _meth_8007( self );
            }
        }
    }
}

_id_A02F()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "player_drop_pod_spawned", "player_spawned_at_drop_pod" );
    self._id_50F5 = 0;
    thread _id_7FCD( "off", 0 );
    thread _id_4879();
    thread _id_28F2();
}

_id_6CCA()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );

    if ( !isbot( self ) )
    {
        if ( !isdefined( self._id_6F05 ) )
            self._id_6F05 = 0;

        if ( !isdefined( self._id_746E ) )
            self._id_746E = 0;

        if ( !isdefined( self._id_5D33 ) )
            self._id_5D33 = 0;

        self._id_88D4 = 0;
        self._id_5048 = 0;
        self._id_5049 = 0;

        if ( self._id_6F05 == 0 )
        {
            self _meth_831D();
            self _meth_8482();

            if ( !self _meth_8068() )
                _id_5795();
        }

        _id_A75A::_id_3BDF( "prematch_done" );
        self._id_6F05 = 1;
        self _meth_831D();
        self _meth_8482();
        self._id_39C4 = level._id_39C3;
        var_0 = level._id_39C3 * 1000.0 + gettime();
        self _meth_82FB( "ui_orbital_toggle_color", 0 );
        self _meth_82FB( "ui_orbital_timer_time", var_0 );
        thread _id_2F89();
        self._id_39C2 = 0;

        if ( isdefined( self._id_2F47 ) && self._id_2F47._id_28E3 == 0 )
            self._id_746E = 1;

        for (;;)
        {
            if ( isdefined( self._id_2F47 ) && self._id_2F47._id_28E3 == 0 && self._id_746E == 1 )
            {
                if ( self._id_5048 == 0 )
                {
                    if ( self _meth_8068() )
                        self _meth_804F();

                    _id_5796();
                }
            }

            if ( !isdefined( self._id_2F47 ) || self._id_2F47._id_28E3 == 1 || self._id_746E == 0 )
            {
                if ( self._id_5049 == 0 )
                {
                    if ( self _meth_8068() )
                        self _meth_804F();

                    _id_5795();
                }
            }

            if ( !self _meth_833E() )
                self._id_5D33 = 1;

            if ( !self _meth_833D() )
                self._id_88D4 = 1;

            if ( self _meth_833E() && self._id_5D33 == 1 )
            {
                self._id_5D33 = 0;

                if ( self._id_746E == 0 && isdefined( self._id_2F47 ) && self._id_2F47._id_28E3 == 0 )
                {
                    self._id_746E = 1;

                    if ( self._id_5048 == 0 )
                    {
                        if ( self _meth_8068() )
                            self _meth_804F();

                        _id_5796();
                    }
                }
                else if ( self._id_746E == 1 )
                {
                    self._id_746E = 0;

                    if ( self._id_5049 == 0 )
                    {
                        if ( self _meth_8068() )
                            self _meth_804F();

                        _id_5795();
                    }
                }
            }
            else if ( self _meth_833D() && self._id_88D4 == 1 || self._id_39C2 )
            {
                self._id_88D4 = 0;

                if ( isdefined( self._id_2F47 ) && self._id_2F47._id_28E3 == 0 && self._id_746E == 1 && self._id_5048 == 1 )
                {
                    if ( isdefined( self._id_2F47 ) )
                    {
                        if ( isdefined( self._id_2F47._id_88FB ) )
                            self._id_2F47._id_88FB delete();
                    }

                    var_1 = self _meth_833B();
                    self _meth_804F();
                    self notify( "player_spawned_at_drop_pod" );
                    thread _id_7FCD( "off", 0 );
                    self _meth_833A( var_1 );
                    self _meth_8338( self._id_2F47._id_02E6 );
                    self _meth_831E();
                    self _meth_8006();
                    self _meth_8481();
                    return;
                }
                else if ( self._id_746E == 0 && self._id_5049 == 1 )
                {
                    var_2 = _id_05AC( self._id_56F4, self );
                    return;
                }
            }

            wait 0.05;
        }
    }
    else
    {
        _id_5795();
        var_2 = _id_05AC( self._id_56F4, self );

        if ( isdefined( var_2 ) )
        {
            self _meth_8338( var_2._id_02E6 );
            _id_2432( var_2._id_02E6 );
            self._id_2F47 thread _id_2F57();
            wait 0.05;
        }
    }
}

_id_5796()
{
    self._id_5048 = 1;
    self._id_5049 = 0;
    self._id_50F5 = 0;
    _id_28F2();
    _id_851F( "friendly" );
    self notify( "switched_to_pod_view" );
    thread _id_7FCD( "pod", 0 );
    self _meth_8092();
    self _meth_807C( self._id_2F47._id_1A13, "tag_player", 0 );
    self._id_2F47._id_88FB = spawnfx( level._id_2F51["player_spawn_from_pod"], self._id_2F47._id_02E6, self._id_2F47._id_019B );
    triggerfx( self._id_2F47._id_88FB );
    thread _id_1C18();
}

_id_5795()
{
    self._id_5048 = 0;
    self._id_5049 = 1;
    self._id_50F5 = 1;
    _id_28F2();
    thread _id_851F( "both" );

    if ( !isdefined( self._id_5025 ) )
        self._id_5025 = 0;
    else
        thread _id_A75A::_id_5652( "orbital_dropin", undefined, undefined, self._id_02E6 );

    if ( isdefined( self._id_2F47 ) )
    {
        self _meth_82FB( "ui_orbital_toggle_switch", 0 );

        if ( isdefined( self._id_2F47._id_88FB ) )
            self._id_2F47._id_88FB delete();
    }
    else
        self _meth_82FB( "ui_orbital_toggle_switch", 1 );

    var_0 = 0.3;
    thread _id_7FCD( "ship", 0 );
    var_1 = getdvar( "mapname" );
    self _meth_8092();

    switch ( var_1 )
    {
        case "mp_refraction":
            self _meth_807C( level._id_6551._id_1A2D[self._id_030D["team"]], "tag_player", 0, 180, 180, -40, 80, 0 );
            break;
        default:
            self _meth_807C( level._id_6551._id_1A2D[self._id_030D["team"]], "tag_player", 1, 90, 90, -50, 80, 0 );
            break;
    }

    thread _id_1C17();
    self _meth_82FB( "ui_orbital_collision_warn", 0 );
    thread _id_948F();
}

_id_9A2E()
{
    self _meth_8092();
    self _meth_8201();
    self _meth_81E3();
    self _meth_804F();
    self _meth_8329( 1 );
    self _meth_831E();
    self _meth_8481();
}

_id_1C17()
{
    var_0 = level._id_6551._id_1A2D[self._id_030D["team"]]._id_02E6;
    var_1 = level._id_6551._id_5CC3["target"]._id_02E6;
    var_2 = vectortoangles( var_1 - var_0 );
    self _meth_833A( var_2 );
}

_id_1C18()
{
    var_0 = self._id_2F47._id_1A13._id_02E6;
    var_1 = level._id_6551._id_5CC3["target"]._id_02E6;
    var_2 = vectortoangles( var_1 - var_0 );
    var_2 *= ( 0, 1, 0 );
    self _meth_833A( var_2 );
}

_id_7FCD( var_0, var_1 )
{
    self _meth_82FB( "ui_orbital_toggle_ship_view", 2 );
    self _meth_82FB( "ui_orbital_toggle_pod_view", 2 );
    self _meth_82FB( "ui_orbital_toggle_drop_view", 2 );
    wait(var_1);

    switch ( var_0 )
    {
        case "ship":
            self _meth_82FB( "ui_orbital_toggle_ship_view", 1 );
            break;
        case "pod":
            self _meth_82FB( "ui_orbital_collision_warn", 0 );
            self _meth_82FB( "ui_orbital_toggle_pod_view", 1 );
            break;
        case "drop":
            self _meth_82FB( "ui_orbital_toggle_drop_view", 1 );
            break;
        case "off":
            self _meth_82FB( "ui_orbital_is_dropping", 0 );
            break;
        default:
            break;
    }
}

_id_948F()
{
    self endon( "player_drop_pod_spawned" );
    self endon( "disconnect" );
    self endon( "player_spawned_at_drop_pod" );
    self endon( "joined_team" );
    self endon( "death" );
    self endon( "switched_to_pod_view" );

    for (;;)
    {
        var_0 = self _meth_833B();
        var_1 = self _meth_80A8() + anglestoforward( var_0 ) * 20;
        var_2 = var_1 + anglestoforward( var_0 ) * 30000;
        var_3 = _func_238( var_1, var_2 );
        var_3["position"] += ( 0, 0, 10 );
        level._id_9487 = var_3;

        if ( isdefined( var_3["position"] ) )
        {
            var_4 = var_3["position"];
            var_5 = 0;
            var_6 = spawn( "script_origin", var_4 );
            var_6._id_04A7 = "orbital_trace_position";

            foreach ( var_8 in level._id_2F62 )
            {
                var_9 = var_6 _meth_80A9( var_8 );
                var_10 = precachestatusicon( var_4 );

                if ( var_9 && var_10 )
                {
                    var_5 = 1;
                    break;
                }
            }

            var_6 delete();

            if ( var_5 == 1 )
                self _meth_82FB( "ui_orbital_collision_warn", 0 );
            else
                self _meth_82FB( "ui_orbital_collision_warn", 1 );
        }

        wait 0.15;
    }
}

_id_05AC( var_0, var_1 )
{
    var_1 endon( "death" );
    var_2 = 0.3;
    var_1 thread _id_7FCD( "drop", 0 );
    thread _id_7F70( 4.333, 0.1 );
    var_1 _id_28F2();
    var_1 _id_851F( "friendly" );

    if ( !isbot( var_1 ) )
    {
        var_1._id_6550 = var_1 _meth_80A8();
        var_1._id_6558 = var_1 _meth_833B();
        var_1._id_654C = anglestoforward( var_1._id_6558 );
        var_1._id_654B = var_1._id_6550 + var_1._id_654C * 5000;
        var_3 = magicbullet( "orbital_drop_pod_mp", var_1._id_6550, self._id_654B, var_1 );
        var_3 thread _id_0EE9( var_1 );
        var_3 thread _id_0FF8( var_1 );
    }
    else
    {
        var_1._id_6550 = level._id_6551._id_1A2D[self._id_030D["team"]]._id_02E6;
        var_4 = level._id_6551._id_1A2D[self._id_030D["team"]]._id_02E6;
        var_5 = level._id_6551._id_5CC3["target"]._id_02E6;
        var_1._id_6558 = vectortoangles( var_5 - var_4 );
        var_1._id_654C = anglestoforward( var_1._id_6558 );
        var_1._id_654B = var_4 + var_1._id_654C * 5000;
        var_3 = magicbullet( "orbital_drop_pod_mp", var_4, self._id_654B, var_1 );
        var_3 thread _id_0EE9( var_1 );
        var_3 thread _id_0FF8( var_1 );
    }

    playfx( level._id_2F51["drop_pod_fire_flash"], var_1._id_6550, var_1._id_654C );
    thread _id_28F1();
    self notify( "drop_pod_spawned" );

    if ( !isdefined( var_3 ) )
        return;

    var_3._id_04C6 = spawn( "trigger_radius", var_3._id_02E6, 0, 128, 256 );

    if ( var_1 _meth_8068() )
    {
        var_1 _meth_804F();
        var_1 _meth_8092();
        var_1 _meth_807C( var_3 );
    }

    var_3._id_02E9 = var_1;
    var_3._id_56F4 = var_0;
    var_3._id_04D8 = "orbital_drop_pod_mp";
    var_3._id_04A8 = var_1._id_04A8;
    level._id_7325 = 1;
    var_3 thread _id_2424();
    var_1._id_0383 = var_3;
    wait 0.1;
    var_6 = _id_5CB6( var_1, var_3 );
    return var_6;
}

_id_7F70( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        wait(var_1);

    self _meth_82FC( "cg_fovScale", var_0 );
}

_id_5CB6( var_0, var_1 )
{
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    var_0 endon( "death" );
    var_1 thread _id_756A();
    var_0 thread _id_6AAC( var_1 );
    var_0 thread _id_6AAD( var_1 );
    var_1 thread _id_A028( var_0 );
    var_1 thread _id_A027( var_0 );
    var_2 = getdvar( "mapname" );
    var_0 _meth_82D6( var_2, 0 );
    var_0 endon( "disconnect" );
    var_0._id_897E = 0;
    var_3 = undefined;
    var_4 = ( 0, 0, 0 );

    if ( isdefined( var_1 ) )
    {
        var_0 _meth_81E2( var_1, "tag_origin" );
        var_0 _meth_8200( var_1 );
        var_1 thread _id_9506( var_0 );
        var_1 thread _id_2F8C();

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 _id_A75A::_id_802B( 0 );

        var_0 _id_A4F0::_id_A060( "rocket_impacted", "rocket_destroyed" );
        var_1 thread _id_0FF6( var_0 );
        var_0 _id_28F2();
        var_0 notify( "player_drop_pod_spawned" );
        var_0 _id_9A2E();

        if ( !level._id_3BD8 || isdefined( var_0._id_373C ) )
            thread _id_7F70( 1, 0 );

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 _id_A75A::_id_802B( 1 );
    }
    else
    {

    }

    var_5 = 0.3;

    if ( var_0._id_897E == 1 && isdefined( var_0._id_606E ) )
    {
        var_0 _id_2432( var_0._id_606E._id_02E6 );
        var_0 _meth_8338( var_0._id_2F47._id_02E6 );
        var_0 _meth_833A( ( 0, var_0._id_0041[1], 0 ) );
        var_0 thread _id_9A1E( var_5 );
        var_0 _meth_8006();
        var_0._id_606E = undefined;
        var_0 thread _id_2F88();
        var_0._id_2F47 thread _id_2F57();
        var_0._id_2F47 thread _id_0EEB( var_0 );
    }
    else
    {
        var_0 _meth_8338( var_0._id_4BF8["rocket_position"] );
        var_0 thread _id_2F87();
        var_0 _id_A783::_id_07CC( var_0, var_0, var_0._id_0383._id_534A, "orbital_drop_pod_mp", 999999, ( 0, 0, 0 ), var_0._id_02E6, "none", 0, "MOD_EXPLOSIVE" );
        var_0 thread _id_9A1E( var_5 );
        thread _id_0EEA( var_0 );
        var_0 thread _id_A783::_id_3798( var_0._id_0383._id_534A, var_0, 999999, 0, "MOD_EXPLOSIVE", "orbital_drop_pod_mp", var_0._id_02E6, var_0._id_02E6, "none", 0, 0 );
        var_0 thread _id_A75A::_id_5652( "orbital_notgood_tryhard", undefined, undefined, self._id_02E6 );
    }

    return var_3;
}

_id_A028( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    var_0 endon( "death" );

    for (;;)
    {
        var_0 waittill( "projectile_impact", var_1, var_2, var_3, var_4 );

        if ( var_1 == "orbital_drop_pod_mp" )
            break;
    }

    var_0._id_897E = 1;
    var_0 notify( "rocket_impacted" );
}

_id_A027( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    var_0 endon( "death" );
    self waittill( "death" );

    if ( isdefined( self ) )
        self delete();

    var_0 _meth_81E3();
    var_0 _meth_8201();
    var_0 _id_7F70( 1, 0 );
    var_0 notify( "rocket_destroyed" );
}

_id_9ED7()
{
    wait 0.5;
    self _meth_8183( 0.3 );
}

_id_2F88()
{
    wait(level._id_2F47._id_287D - 1);
    self._id_2F47 thread _id_2F8A();
    self._id_2F52 thread _id_2F8A();
    self._id_2F47 _meth_827B( "mp_orbital_pod_base_unfold" );
    self._id_2F52 _meth_827B( "mp_orbital_pod_base_unfold" );
}

_id_2F8A()
{
    wait 0.68;
    var_0 = 2;
    var_1 = [];
    var_2 = [];
    var_1[0] = self _meth_8180( "J_spike_FL" );
    var_2[0] = self _meth_8181( "J_spike_FL" );
    var_1[1] = self _meth_8180( "J_spike_BL" );
    var_2[1] = self _meth_8181( "J_spike_BL" );
    var_1[2] = self _meth_8180( "J_spike_BR" );
    var_2[2] = self _meth_8181( "J_spike_BR" );
    var_1[3] = self _meth_8180( "J_spike_FR" );
    var_2[3] = self _meth_8181( "J_spike_FR" );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_1[var_3] - 8 * anglestoforward( var_2[var_3] );
        var_5 = var_1[var_3] + var_0 * anglestoforward( var_2[var_3] );
        var_6 = bullettrace( var_4, var_5, 0, self );

        if ( isdefined( var_6["position"] ) )
            playfx( level._id_2F51["drop_pod_spike_impact"], var_6["position"], anglestoforward( ( 270, 0, 0 ) ) );
    }
}

_id_9506( var_0 )
{
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "joined_team" );
    self._id_02E9 endon( "joined_spectators" );

    for (;;)
    {
        var_0._id_4BF8["rocket_position"] = self._id_02E6;
        var_1 = self._id_02E6;
        var_2 = self._id_0041;
        var_3 = anglestoforward( var_2 );
        var_4 = var_1 + var_3 * 512;
        var_5 = _func_238( var_1, var_4 );
        self._id_04C6 _meth_8092();
        self._id_04C6._id_02E6 = var_5["position"] + ( 0, 0, -128 );
        var_6 = self._id_04C6 thread _id_4033();

        if ( isdefined( var_6 ) )
        {
            self._id_02E9._id_606E = var_6;
            self _meth_8054();
            playfxontag( level._id_2F51["decel_explosion"], self, "tag_origin" );
            var_1 = self._id_02E6;
            var_4 = var_6._id_02E6;
            var_2 = vectortoangles( var_4 - var_1 );
            self._id_0041 = var_2;
            self._id_04C6 delete();
            break;
        }

        wait 0.05;
    }
}

_id_9A1E( var_0 )
{
    wait(var_0);
    self _meth_8329( 0 );
}

_id_2F87()
{
    self endon( "disconnect" );
    self waittill( "death" );
    playfx( level._id_2F51["drop_pod_explode"], self._id_02E6 + ( 0, 0, 10 ) );
}

_id_4033()
{
    var_0 = _func_1FE( self );

    if ( isdefined( var_0 ) && var_0.size > 0 )
    {
        var_1 = 0;
        var_2 = distancesquared( self._id_02E6, var_0[0]._id_02E6 );

        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            switch ( var_0[var_3]._id_04D8 )
            {
                case "End":
                case "Cover Stand":
                case "Begin":
                case "Cover Left":
                case "Cover Right":
                    var_0[var_3] = undefined;
                    continue;
                default:
                    break;
            }

            if ( isdefined( var_0[var_3]._id_039B ) )
            {
                if ( var_0[var_3]._id_039B == "orbital_no_spawn" )
                {
                    var_0[var_3] = undefined;
                    continue;
                }
            }

            var_4 = distancesquared( self._id_02E6, var_0[var_3]._id_02E6 );

            if ( var_4 < var_2 )
            {
                var_2 = var_4;
                var_1 = var_3;
            }
        }

        return var_0[var_1];
    }
    else
        return undefined;
}

_id_756A()
{
    var_0 = self _meth_81B1();
    level._id_7591[var_0] = self;
    self waittill( "death" );
    level._id_7591[var_0] = undefined;
    level._id_7325 = undefined;
}

_id_6AAC( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    level waittill( "game_ended" );
    self _meth_8201();
    self _meth_81E3();

    if ( getdvarint( "camera_thirdPerson" ) )
        _id_A75A::_id_802B( 1 );
}

_id_6AAD( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "joined_team", "joined_spectators" );

    if ( self._id_04A8 != "spectator" )
    {
        self _meth_8201();
        self _meth_81E3();

        if ( getdvarint( "camera_thirdPerson" ) )
            _id_A75A::_id_802B( 1 );
    }

    _id_7F70( 1, 0 );
    level._id_7325 = undefined;
}

_id_2F77()
{
    self._id_2F47 endon( "death" );
    _id_A4F0::_id_A060( "joined_team", "joined_spectators" );
    _id_285E();
}

_id_2F76()
{
    self._id_2F47 endon( "death" );
    self waittill( "disconnect" );
    _id_285E();
}

_id_2432( var_0 )
{
    _id_285E();

    if ( !isdefined( var_0 ) )
    {

    }

    var_1 = var_0 + ( 0, 0, 32 );
    var_2 = var_0 + ( 0, 0, -1024 );
    var_3 = _func_238( var_1, var_2 );
    var_4 = var_3["position"];
    var_5 = vectortoangles( var_3["normal"] );
    var_6 = anglestoforward( var_5 );
    var_5 += ( 180, 0, 0 );
    playfx( level._id_2F51["landing_impact"], var_4, var_3["normal"] );
    self._id_2F47 = spawn( "script_model", var_4 );
    self._id_2F47._id_0041 = var_5;
    self._id_2F47._id_019B = var_6;
    self._id_2F47 _meth_80B1( level._id_2F47._id_02A0 );
    self._id_2F47 _meth_82BE();
    self._id_2F47 _meth_82C0( 1 );
    self._id_2F47 _meth_82C1( 1 );
    self._id_2F47._id_483B = 0;
    self._id_2F47._id_02E9 = self;
    self._id_2F47._id_28E3 = 0;
    self._id_2F47._id_01E7 = 999999;
    self._id_2F47._id_0275 = 100;
    self._id_2F47._id_0102 = 0;
    self._id_2F47 _meth_8054();
    self._id_2F52 = spawn( "script_model", self._id_2F47._id_02E6 );
    self._id_2F52 _meth_80B1( level._id_2F47._id_325A );
    self._id_2F52._id_0041 = self._id_2F47._id_0041;
    self._id_2F52._id_02E9 = self;
    self._id_2F52 _meth_8054();
    self._id_2F52 _meth_82BF();

    foreach ( var_8 in level._id_0328 )
    {
        if ( var_8._id_04A8 == self._id_04A8 )
        {
            self._id_2F47 _meth_8007( var_8 );
            continue;
        }

        self._id_2F52 _meth_8007( var_8 );
    }

    self._id_2F47 thread _id_1091();
    self._id_2F47._id_1A13 = spawn( "script_model", self._id_2F47._id_02E6 );
    self._id_2F47._id_1A13 _meth_80B1( "tag_player" );
    self._id_2F47._id_1A13._id_0041 = ( 0, 0, 0 );
    self._id_2F47._id_1A13 _meth_8054();
    self._id_50F5 = 0;
    self._id_2F47 thread _id_6E14( self );
    thread _id_2F76();
    thread _id_2F77();
}

_id_28F1()
{
    if ( !isdefined( self._id_2F47 ) )
        return;

    self endon( "player_drop_pod_spawned" );
    var_0 = self._id_2F47;
    var_1 = level._id_2F51["pod_base_destroyed"];
    var_2 = level._id_2F51["dome_shutdown_friendly"];
    var_3 = level._id_2F51["dome_shutdown_enemy"];
    playfx( var_1, var_0._id_02E6, var_0._id_019B );
    var_0 _meth_8054();
    self._id_2F52 _meth_8054();
    var_0._id_8547 = spawnfx( var_2, var_0._id_02E6, var_0._id_019B );
    var_0._id_8546 = spawnfx( var_3, var_0._id_02E6, var_0._id_019B );
    triggerfx( var_0._id_8547 );
    var_0._id_8547 _meth_8054();
    triggerfx( var_0._id_8546 );
    var_0._id_8546 _meth_8054();
    var_0 thread _id_0EDB();

    foreach ( var_5 in level._id_0328 )
    {
        if ( var_5._id_04A8 == self._id_04A8 )
        {
            var_0._id_8547 _meth_8007( var_5 );
            continue;
        }

        var_0._id_8546 _meth_8007( var_5 );
    }

    wait 0.7;
    _id_285E();
}

_id_285E()
{
    if ( isdefined( self._id_2F52 ) )
        self._id_2F52 delete();

    if ( isdefined( self._id_2F47 ) )
    {
        _id_285F();

        if ( isdefined( self._id_2F47._id_1A13 ) )
            self._id_2F47._id_1A13 delete();

        self._id_2F47 delete();
    }
}

_id_285F()
{
    if ( isdefined( self._id_2F47 ) )
    {
        if ( isdefined( self._id_2F47._id_9837 ) )
            self._id_2F47._id_9837 delete();

        if ( isdefined( self._id_2F47._id_9836 ) )
            self._id_2F47._id_9836 delete();

        if ( isdefined( self._id_2F47._id_9839 ) )
            self._id_2F47._id_9839 delete();

        if ( isdefined( self._id_2F47._id_9838 ) )
            self._id_2F47._id_9838 delete();

        if ( isdefined( self._id_2F47._id_8546 ) )
            self._id_2F47._id_8546 delete();

        if ( isdefined( self._id_2F47._id_8546 ) )
            self._id_2F47._id_8546 delete();

        if ( isdefined( self._id_2F47._id_88FB ) )
            self._id_2F47._id_88FB delete();
    }
}

_id_2424()
{
    var_0 = ( -512, 0, 128 );
    self._id_534A = spawn( "script_model", self._id_02E6 );
    self._id_534A _meth_834D( "explosive" );
    self._id_534A _meth_804D( self, "tag_origin", var_0, ( 0, 0, 0 ) );
    self._id_534A _meth_80BE( 0 );
    self._id_534A._id_8D3B = gettime();
    self._id_534A._id_5166 = 1;
}

_id_73B3()
{
    if ( isdefined( self._id_534A ) )
        self._id_534A delete();
}

_id_2F57()
{
    var_0 = self _meth_81B1();
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self._id_02E9 thread _id_A75A::_id_5652( "orbital_pod_destroyed_enemy", undefined, undefined, self._id_02E9._id_02E6 );
    self._id_02E9 _id_28F1();
}

_id_2F8C()
{
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "joined_team" );
    self._id_02E9 endon( "joined_spectators" );

    while ( isdefined( self ) )
    {
        foreach ( var_1 in level._id_0328 )
        {
            if ( var_1._id_04A8 != self._id_02E9._id_04A8 )
            {
                if ( isdefined( var_1._id_2F47 ) )
                {
                    if ( distancesquared( self._id_02E6, var_1._id_2F47._id_02E6 ) < 40000 && self._id_02E9._id_01E7 > 0 )
                        var_1._id_2F47 thread _id_2F8B( self, var_1 );
                }
            }
        }

        foreach ( var_4 in level._id_9820 )
        {
            if ( isdefined( var_4 ) )
            {
                if ( distancesquared( self._id_02E6, var_4._id_02E6 ) < 40000 && var_4._id_02E9._id_01E7 > 0 )
                {
                    var_4 thread _id_2F8B( self, var_4._id_02E9 );
                    var_4._id_0B6E--;

                    if ( var_4._id_0B6E <= 0 )
                        var_4 thread _id_A787::_id_9832();
                }
            }
        }

        wait 0.05;
    }
}

_id_2F8B( var_0, var_1 )
{
    var_0 notify( "destroyed" );
    playfx( level._id_7CA7, self._id_02E6 + ( 0, 0, 0 ), var_0._id_02E6 - self._id_02E6, anglestoup( self._id_0041 ) );
    self _meth_809A( "trophy_detect_projectile" );

    if ( isdefined( var_0._id_00AB ) && var_0._id_00AB == "rocket" && ( isdefined( var_0._id_04D8 ) && var_0._id_04D8 == "remote" ) )
    {
        if ( isdefined( var_0._id_04D8 ) && var_0._id_04D8 == "remote" )
        {
            level thread _id_A7A0::_id_9D70( var_0._id_02E9, var_1, undefined, var_1, undefined, "MOD_EXPLOSIVE", "trophy_mp" );
            level thread _id_A75A::_id_91F3( "callout_destroyed_predator_missile", var_1 );
            level thread _id_A7AA::_id_1208( "kill", var_1, "trophy_mp", undefined, "MOD_EXPLOSIVE" );
        }

        thread _id_0EEC();
    }

    var_1 thread _id_7010( var_0, self );
}

_id_7010( var_0, var_1 )
{
    var_2 = var_0._id_02E6;
    var_3 = var_0._id_02A0;
    var_4 = var_0._id_0041;
    var_5 = var_0._id_02E9;
    var_6 = var_1._id_02E9;
    var_7 = var_6._id_2F47;
    var_8 = level._id_2F51["dome_impact_flash"];
    var_9 = level._id_2F51["dome_impact"];
    var_10 = var_1._id_02E6;
    var_11 = var_2;
    var_12 = vectortoangles( var_11 - var_10 );
    var_13 = anglestoforward( var_12 );
    var_14 = anglestoup( var_12 );
    playfx( var_9, var_2, var_13, var_14 );
    playfxontag( var_8, var_7, "tag_origin" );
    waitframe;

    if ( var_5._id_01E7 <= 0 )
        return;

    var_5 thread _id_7F70( 1, 0 );
    var_5 _meth_804F();
    var_5 _meth_81E3();
    var_5 _meth_8338( var_2 );
    var_5 _id_A783::_id_07CC( var_5, var_5, var_5._id_0383._id_534A, "orbital_drop_pod_mp", 999999, ( 0, 0, 0 ), var_5._id_02E6, "none", 0, "MOD_EXPLOSIVE" );
    var_5 thread _id_A783::_id_3798( var_5._id_0383._id_534A, var_5, 999999, 0, "MOD_EXPLOSIVE", "orbital_drop_pod_mp", var_5._id_02E6, var_5._id_02E6, "none", 0, 0 );

    if ( isdefined( var_0 ) )
        var_0 delete();

    var_1 thread _id_0FFA();
    radiusdamage( var_2, 128, 105, 10, self, "MOD_EXPLOSIVE", "trophy_mp" );
    var_5 thread _id_A75A::_id_5652( "orbital_pod_destroyed", undefined, undefined, var_5._id_02E6 );
}

_id_6E14( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    self._id_9837 = spawnfx( level._id_2F4D["friendly"], self._id_02E6, self._id_019B );
    triggerfx( self._id_9837 );
    self._id_9837 _meth_8054();
    self._id_9836 = spawnfx( level._id_2F4D["enemy"], self._id_02E6, self._id_019B );
    triggerfx( self._id_9836 );
    self._id_9836 _meth_8054();
    wait(level._id_2F47._id_287D - 0.5);
    self._id_9839 = spawnfx( level._id_2F4E["friendly"], self._id_02E6, self._id_019B );
    triggerfx( self._id_9839 );
    self._id_9838 = spawnfx( level._id_2F4E["enemy"], self._id_02E6, self._id_019B );
    triggerfx( self._id_9838 );
    self._id_9838 _meth_8054();
    thread _id_2861( var_0 );
    thread _id_2862( var_0 );
    thread _id_2863( var_0 );
}

_id_851F( var_0 )
{
    self endon( "death" );

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 == self || isdefined( var_2._id_50F5 ) )
            continue;

        switch ( var_0 )
        {
            case "friendly":
                if ( var_2._id_04A8 == self._id_04A8 )
                    var_2 _id_A72D::_id_7F80( self, "ac130_hud_friendly_vehicle_target", ( 0, 0, 0 ), 4, 4, undefined, undefined, undefined, undefined, undefined, 0 );

                continue;
            case "enemy":
                if ( !( var_2._id_04A8 == self._id_04A8 ) )
                    var_2 _id_A72D::_id_7F80( self, "hud_fofbox_hostile", ( 0, 0, 0 ), 4, 4, undefined, undefined, undefined, undefined, undefined, 0 );

                continue;
            case "both":
                if ( var_2._id_04A8 == self._id_04A8 )
                    var_2 _id_A72D::_id_7F80( self, "ac130_hud_friendly_vehicle_target", ( 0, 0, 0 ), 4, 4, undefined, undefined, undefined, undefined, undefined, 0 );
                else
                    var_2 _id_A72D::_id_7F80( self, "hud_fofbox_hostile", ( 0, 0, 0 ), 4, 4, undefined, undefined, undefined, undefined, undefined, 0 );

                continue;
            default:
                continue;
        }
    }
}

_id_28F2()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1._id_3319 ) )
        {
            if ( isdefined( var_1._id_3319[self._id_444D] ) )
            {
                var_1._id_3319[self._id_444D] _meth_8088();
                var_1._id_3319[self._id_444D] = undefined;
            }
        }
    }
}

_id_8502()
{
    level endon( "game_ended" );

    for (;;)
    {
        _id_4879();

        foreach ( var_1 in level._id_0328 )
        {
            if ( isdefined( var_1._id_50F5 ) )
            {
                if ( var_1._id_50F5 )
                    var_1 _id_851D();
            }
        }

        wait 0.05;
    }
}

_id_851D()
{
    foreach ( var_1 in level._id_2F49 )
        var_1 _meth_8007( self );
}

_id_4879()
{
    foreach ( var_1 in level._id_2F49 )
        var_1 _meth_8054();
}

_id_2861( var_0 )
{
    var_0 endon( "disconnect" );
    self waittill( "death" );
    _id_2860();
}

_id_2862( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    _id_2860();
}

_id_2863( var_0 )
{
    self endon( "death" );
    var_0 _id_A4F0::_id_A060( "joined_team", "joined_spectators" );
    _id_2860();
}

_id_2860()
{
    if ( isdefined( self._id_9837 ) )
        self._id_9837 delete();

    if ( isdefined( self._id_9836 ) )
        self._id_9836 delete();
}

_id_2F89()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self endon( "player_drop_pod_spawned" );
    self endon( "player_spawned_at_drop_pod" );
    level endon( "game_ended" );
    self._id_39C2 = 0;

    if ( !isdefined( self._id_39C4 ) )
        self._id_39C4 = level._id_39C3;

    while ( self._id_39C4 > 0 )
    {
        if ( self._id_39C4 <= 5 )
            self _meth_82FB( "ui_orbital_toggle_color", 1 );

        self._id_39C4--;
        wait 1;
    }

    self._id_39C2 = 1;
}

_id_0FF8( var_0 )
{
    var_1 = self;
    thread _id_A724::_id_8734( "orbital_drop_pod_proj", var_1 );
}

_id_0FF6( var_0 )
{
    var_1 = self;
}

_id_0EE9( var_0 )
{
    var_1 = self;
    var_0 _meth_82F4( "orbital_drop_pod_fire_plr" );
}

_id_0EEB( var_0 )
{
    var_1 = self;
    thread _id_A724::_id_8732( "orbital_drop_pod_impact", var_1 );
    var_0 _meth_82F4( "orbital_drop_pod_impact" );
}

_id_0EEA( var_0 )
{
    var_1 = self;
    thread _id_A724::_id_8732( "orbital_drop_pod_impact", var_1 );
    var_0 _meth_82F4( "orbital_drop_pod_impact" );
}

_id_0EDB()
{
    var_0 = self;
    var_0 _meth_809A( "orbital_drop_pod_platform_exp" );
}

_id_0EEC()
{
    var_0 = self;
}

_id_0FFA()
{
    var_0 = self;
}

_id_1091()
{
    thread _id_A724::_id_8734( "orbital_drop_pod_platform_lp", self );
    self waittill( "Death" );

    if ( isdefined( self ) )
        self _meth_80AC();
}
