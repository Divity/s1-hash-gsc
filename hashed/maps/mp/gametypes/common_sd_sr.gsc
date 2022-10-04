// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_64D7()
{
    game["bomb_dropped_sound"] = "mp_obj_notify_neg_sml";
    game["bomb_dropped_enemy_sound"] = "mp_obj_notify_pos_sml";
    game["bomb_recovered_sound"] = "mp_obj_notify_pos_sml";
    game["bomb_grabbed_sound"] = "mp_snd_bomb_pickup";
    game["bomb_planted_sound"] = "mp_obj_notify_pos_med";
    game["bomb_planted_enemy_sound"] = "mp_obj_notify_neg_med";
    game["bomb_disarm_sound"] = "mp_obj_notify_pos_lrg";
    game["bomb_disarm_enemy_sound"] = "mp_obj_notify_neg_lrg";
}

_id_9B1A()
{
    level._id_688A = _id_A75A::_id_2FCE( "planttime", 5, 0, 20 );
    level._id_27BE = _id_A75A::_id_2FCE( "defusetime", 5, 0, 20 );
    level._id_1551 = _id_A75A::_id_2FCE( "bombtimer", 45, 1, 300 );
    level._id_5FDF = _id_A75A::_id_2FCF( "multibomb", 0, 0, 1 );
    level._id_856C = _id_A75A::_id_2FCF( "silentplant", 0, 0, 1 );
}

_id_8011()
{
    if ( isusingmatchrulesdata() && getmatchrulesdata( "defaultClasses", game["attackers"], 5, "class", "inUse" ) )
        level._id_7B59[game["attackers"]] = _id_A75A::_id_4015( game["attackers"], 5 );
}

_id_5178( var_0 )
{
    if ( isdefined( level._id_1555 ) )
    {
        foreach ( var_2 in level._id_1555 )
        {
            if ( distancesquared( self._id_02E6, var_2._id_04C6._id_02E6 ) < 4096 )
                return 0;
        }
    }

    return 1;
}

_id_64BC( var_0, var_1, var_2 )
{
    if ( game["state"] == "postgame" && ( var_0._id_04A8 == game["defenders"] || !level._id_1545 ) )
        var_1._id_373C = 1;

    if ( var_0._id_5171 || var_0._id_50EC )
    {
        var_1 thread _id_A72E::_id_27AD( var_0, var_2 );

        if ( var_0._id_5171 )
            var_1 _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_interrupt" );

        if ( var_0._id_50EC )
            var_1 _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_protector" );
    }

    if ( _id_A1BD( var_0, var_1 ) )
    {
        var_3 = _id_513D( var_1 );
        var_1 thread _id_A72E::_id_305B( var_3, var_0 );
    }
}

_id_A1BD( var_0, var_1 )
{
    if ( _id_A783::_id_510B( var_0, var_1 ) )
        return 0;

    if ( var_0 _id_A7A7::_id_5A5F() )
        return 0;

    return 1;
}

_id_64BF( var_0 )
{
    var_0._id_50C5 = 1;

    if ( var_0._id_04A8 == "allies" )
        var_0._id_02D6 = 1;
    else
        var_0._id_02D6 = 2;

    if ( isplayer( var_0 ) )
    {
        var_0 thread _id_A744::_id_5824( "pickup", var_0._id_02E6 );
        var_0 _meth_82FB( "ui_carrying_bomb", 1 );
    }

    _id_A78A::_id_7F0C( "friendly", "waypoint_escort" );
    _id_A78A::_id_7F0D( "friendly", "waypoint_escort" );

    if ( isdefined( level._id_7B59 ) && isdefined( level._id_7B59[var_0._id_04A8] ) )
    {
        var_0.isrespawningwithbombcarrierclass = 1;
        var_0 thread _id_0CAA();
    }

    if ( !level._id_1536 )
    {
        _id_A75A::_id_91F3( "callout_bombtaken", var_0, var_0._id_04A8 );
        _id_A75A::_id_5648( "bomb_taken", var_0._id_030D["team"] );
    }

    _id_A75A::_id_6DDA( game["bomb_recovered_sound"], game["attackers"] );
    var_0 _meth_82F4( game["bomb_grabbed_sound"] );
}

_id_1549()
{
    level._id_1545 = 0;
    level._id_1536 = 0;
    level._id_1540 = 0;
    var_0 = getent( "sd_bomb_pickup_trig", "targetname" );

    if ( !isdefined( var_0 ) )
    {
        _id_A4F0::_id_334D( "No sd_bomb_pickup_trig trigger found in map." );
        return;
    }

    var_1[0] = getent( "sd_bomb", "targetname" );

    if ( !isdefined( var_1[0] ) )
    {
        _id_A4F0::_id_334D( "No sd_bomb script_model found in map." );
        return;
    }

    var_1[0] _meth_80B1( "npc_search_dstry_bomb" );

    if ( !level._id_5FDF )
    {
        level._id_7B6E = _id_A78A::_id_23E9( game["attackers"], var_0, var_1, ( 0, 0, 32 ) );
        level._id_7B6E _id_A78A::_id_0AA1( "friendly" );
        level._id_7B6E _id_A78A::_id_7F0C( "friendly", "waypoint_bomb" );
        level._id_7B6E _id_A78A::_id_7F0D( "friendly", "waypoint_bomb" );
        level._id_7B6E _id_A78A::_id_834C( "friendly" );

        if ( game["attackers"] == "allies" )
            _id_A75A::_id_7FA8( level._id_7B6E, "waypoint_bomb_green" );
        else
            _id_A75A::_id_7FA8( level._id_7B6E, "waypoint_bomb_red" );

        level._id_7B6E._id_0AB5 = 1;
        level._id_7B6E._id_64BF = ::_id_64BF;
        level._id_7B6E._id_646C = ::_id_646C;
        level._id_7B6E._id_1AFB = ::_id_1AF8;
        level._id_7B6E._id_4270 = ::_id_426E;
    }
    else
    {
        var_0 delete();
        var_1[0] delete();
    }

    level._id_1555 = [];
    var_2 = getentarray( "bombzone", "targetname" );
    var_3 = getentarray( "bombzone_augmented", "targetname" );

    if ( _id_A75A::_id_50C1() )
    {
        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = var_3[var_4]._id_0397;

            for ( var_6 = 0; var_6 < var_2.size; var_6++ )
            {
                if ( var_2[var_6]._id_0397 == var_5 )
                {
                    _id_7394( var_2[var_6] );
                    break;
                }
            }
        }
    }
    else
    {
        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
            _id_7394( var_3[var_7] );
    }

    var_2 = _id_A4F0::_id_0CDD( var_2, var_3 );

    for ( var_7 = 0; var_7 < var_2.size; var_7++ )
    {
        var_0 = var_2[var_7];
        var_1 = getentarray( var_2[var_7]._id_04A5, "targetname" );
        playfxontag( _id_A4F0::_id_3FA6( "bomb_light_blinking" ), var_1[0], "tag_fx_1" );
        playfxontag( _id_A4F0::_id_3FA6( "bomb_light_blinking" ), var_1[0], "tag_fx_2" );
        var_8 = _id_A78A::_id_244C( game["defenders"], var_0, var_1, ( 0, 0, 64 ) );
        var_8 _id_A78A::_id_0AB2( "enemy" );
        var_8 _id_A78A::_id_8346( level._id_688A );
        var_8 _id_A78A::_id_8344( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );

        if ( !level._id_5FDF )
            var_8 _id_A78A::_id_7F93( level._id_7B6E );

        var_9 = var_8 _id_A78A::_id_3FF8();
        var_8._id_0245 = var_9;
        var_8 _id_A78A::_id_7F0C( "friendly", "waypoint_defend" + var_9 );
        var_8 _id_A78A::_id_7F0D( "friendly", "waypoint_defend" + var_9 );
        var_8 _id_A78A::_id_7F0C( "enemy", "waypoint_target" + var_9 );
        var_8 _id_A78A::_id_7F0D( "enemy", "waypoint_target" + var_9 );
        var_8 _id_A78A::_id_834C( "any" );
        _id_A75A::_id_7FA8( var_8, "waypoint_esports_snd_target" + var_9 + "_white" );
        var_8._id_6451 = ::_id_6451;
        var_8._id_648B = ::_id_648B;
        var_8._id_623F = 1;
        var_8._id_4B50 = "bombZone";
        var_8._id_64F5 = ::_id_64F8;
        var_8._id_6456 = ::_id_6456;
        var_8._id_9C14 = "search_dstry_bomb_mp";

        for ( var_10 = 0; var_10 < var_1.size; var_10++ )
        {
            if ( isdefined( var_1[var_10]._id_79BA ) )
            {
                var_8._id_3539 = var_1[var_10]._id_79BA;
                var_1[var_10] thread _id_8318( var_8 );
                break;
            }
        }

        level._id_1555[level._id_1555.size] = var_8;
        var_8._id_1538 = getent( var_1[0]._id_04A5, "targetname" );
        var_8._id_1538._id_02E6 += ( 0, 0, -10000 );
        var_8._id_1538._id_0245 = var_9;
        var_8._id_1538 _meth_8537( 1 );
    }

    for ( var_7 = 0; var_7 < level._id_1555.size; var_7++ )
    {
        var_11 = [];

        for ( var_12 = 0; var_12 < level._id_1555.size; var_12++ )
        {
            if ( var_12 != var_7 )
                var_11[var_11.size] = level._id_1555[var_12];
        }

        level._id_1555[var_7]._id_65AE = var_11;
    }

    setomnvar( "ui_mlg_game_mode_status_1", 0 );
}

_id_7394( var_0 )
{
    var_1 = getentarray( "script_brushmodel", "classname" );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3._id_79EF ) || var_3._id_79EF != "bombzone" )
            continue;

        if ( !isdefined( var_3._id_0397 ) )
            continue;

        var_4 = issubstr( var_3._id_0397, "augmented" );

        if ( _id_A75A::_id_50C1() && var_4 )
            continue;

        if ( !_id_A75A::_id_50C1() && !var_4 )
            continue;

        if ( issubstr( var_3._id_0397, var_0._id_0397 ) && issubstr( var_3._id_0397, var_0._id_04A7 ) )
            var_3 delete();
    }

    var_6 = getentarray( var_0._id_04A5, "targetname" );

    foreach ( var_8 in var_6 )
    {
        if ( isdefined( var_8._id_04A5 ) )
        {
            var_9 = getentarray( var_8._id_04A5, "targetname" );

            foreach ( var_11 in var_9 )
                var_11 delete();
        }

        var_8 delete();
    }

    var_0 delete();
}

_id_64F8( var_0 )
{
    if ( !_id_A78A::_id_510C( var_0._id_030D["team"] ) )
    {
        level thread _id_1545( self, var_0 );

        for ( var_1 = 0; var_1 < level._id_1555.size; var_1++ )
        {
            if ( level._id_1555[var_1] == self )
            {
                var_2 = level._id_1555[var_1] _id_A78A::_id_3FF8();
                _id_A75A::_id_7FA8( level._id_1555[var_1], "waypoint_esports_snd_planted" + var_2 );
                continue;
            }

            level._id_1555[var_1] _id_A78A::_id_2B1D();
            _id_A75A::_id_7FA8( level._id_1555[var_1], undefined );
        }

        var_0 _meth_809A( "mp_bomb_plant" );
        var_0 notify( "bomb_planted" );
        var_0 thread _id_A72E::_id_1548();
        _id_A75A::_id_5648( "bomb_planted" );
        _id_A75A::_id_6DDA( game["bomb_planted_sound"], game["attackers"] );
        _id_A75A::_id_6DDA( game["bomb_planted_enemy_sound"], game["defenders"] );

        if ( isdefined( level._id_7B59 ) && isdefined( level._id_7B59[var_0._id_04A8] ) )
            var_0 thread _id_7393();

        level._id_1544 = var_0;
        var_0._id_1547 = gettime();
    }
}

_id_6976( var_0 )
{
    var_1 = _id_A4F0::_id_0CF6( level._id_0328, var_0 );

    if ( var_1.size )
        var_0 _id_A75A::_id_6DC2( "snd_bomb_button_press_lp", undefined, var_1 );
}

_id_8E9C( var_0 )
{
    var_0 _id_A4F0::_id_8E9B( "snd_bomb_button_press_lp" );
}

_id_8318( var_0 )
{
    var_1 = spawn( "script_origin", self._id_02E6 );
    var_1._id_0041 = self._id_0041;
    var_1 _meth_82B7( -45, 0.05 );
    wait 0.05;
    var_2 = self._id_02E6 + ( 0, 0, 5 );
    var_3 = self._id_02E6 + anglestoforward( var_1._id_0041 ) * 100 + ( 0, 0, 128 );
    var_4 = bullettrace( var_2, var_3, 0, self );
    self._id_534A = spawn( "script_model", var_4["position"] );
    self._id_534A _meth_834D( "explosive" );
    var_0._id_534B = self._id_534A _meth_81B1();
    var_1 delete();
}

_id_6451( var_0 )
{
    var_0 _meth_8130( 0 );

    if ( _id_A78A::_id_510C( var_0._id_030D["team"] ) )
    {
        if ( !level._id_856C )
        {
            var_0 _id_A75A::_id_6202( "defuse" );
            var_0 _meth_809A( "mp_snd_bomb_disarming" );
            level thread _id_6976( var_0 );
        }

        var_0._id_50EC = 1;

        if ( isdefined( level._id_7B6F ) )
        {
            level._id_7B6F _meth_8054();
            stopfxontag( _id_A4F0::_id_3FA6( "bomb_light_planted" ), level._id_7B6F, "tag_flash" );
        }
    }
    else
    {
        if ( !level._id_856C )
        {
            var_0 _id_A75A::_id_6202( "plant" );
            var_0 _meth_809A( "mp_snd_bomb_arming" );
            level thread _id_6976( var_0 );
        }

        var_0._id_5171 = 1;

        if ( level._id_5FDF )
        {
            for ( var_1 = 0; var_1 < self._id_65AE.size; var_1++ )
            {
                self._id_65AE[var_1] _id_A78A::_id_0AB2( "none" );
                self._id_65AE[var_1] _id_A78A::_id_834C( "friendly" );
            }
        }
    }
}

light_after_delay()
{
    wait 0.05;
    playfxontag( _id_A4F0::_id_3FA6( "bomb_light_planted" ), level._id_7B6F, "tag_flash" );
}

_id_648B( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_1 _meth_8130( 1 );

    if ( isalive( var_1 ) )
    {
        var_1._id_50EC = 0;
        var_1._id_5171 = 0;
    }

    level thread _id_8E9C( var_1 );

    if ( _id_A78A::_id_510C( var_1._id_030D["team"] ) )
    {
        if ( isdefined( level._id_7B6F ) && !var_2 )
        {
            level._id_7B6F _meth_8053();
            thread light_after_delay();
        }
    }
    else if ( level._id_5FDF && !var_2 )
    {
        for ( var_3 = 0; var_3 < self._id_65AE.size; var_3++ )
        {
            self._id_65AE[var_3] _id_A78A::_id_0AB2( "enemy" );
            self._id_65AE[var_3] _id_A78A::_id_834C( "any" );
        }
    }
}

_id_1546( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 _meth_807C( level._id_7B6F );
    var_0 _meth_8081();

    while ( var_0 _meth_8311() == self._id_9C14 )
        waittillframeend;

    var_0 _meth_804F();
}

_id_1545( var_0, var_1 )
{
    level notify( "bomb_planted", var_0 );
    _id_A789::_id_6724();
    level._id_1545 = 1;
    var_1._id_02D6 = 0;

    if ( isplayer( var_1 ) )
        var_1 _meth_82FB( "ui_carrying_bomb", 0 );

    var_0._id_9E93[0] thread _id_A789::_id_6DE2();
    level._id_933E = var_0._id_9E93[0];
    level._id_935F = 1;
    level._id_27BA = int( gettime() + level._id_1551 * 1000 );
    setgameendtime( level._id_27BA );
    setomnvar( "ui_bomb_timer", 1 );

    if ( !level._id_5FDF )
    {
        level._id_7B6E _id_A78A::_id_0AA1( "none" );
        level._id_7B6E _id_A78A::_id_834C( "none" );
        _id_A75A::_id_7FA8( level._id_7B6E, undefined );
        level._id_7B6E _id_A78A::_id_7F57();
        level._id_7B6F = level._id_7B6E._id_9E93[0];
    }
    else
    {
        level._id_7B6F = spawn( "script_model", var_1._id_02E6 );
        level._id_7B6F._id_0041 = var_1._id_0041;
        level._id_7B6F _meth_80B1( "npc_search_dstry_bomb" );
    }

    level._id_7B6F thread invalidatecarepackageandgoliathdrop();
    playfxontag( _id_A4F0::_id_3FA6( "bomb_light_planted" ), level._id_7B6F, "tag_flash" );
    var_0 _id_A78A::_id_0AB2( "none" );
    var_0 _id_A78A::_id_834C( "none" );
    var_2 = var_0 _id_A78A::_id_3FF8();
    var_0 thread _id_1546( var_1 );
    var_3 = var_0._id_1538;
    var_3._id_02E6 = level._id_7B6F._id_02E6;
    var_4 = [];
    var_5 = _id_A78A::_id_244C( game["defenders"], var_3, var_4, ( 0, 0, 32 ) );
    var_5 _id_A78A::_id_0AB2( "friendly" );
    var_5 _id_A78A::_id_8346( level._id_27BE );
    var_5 _id_A78A::_id_8344( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    var_5 _id_A78A::_id_834C( "any" );
    var_5 _id_A78A::_id_7F0C( "friendly", "waypoint_defuse" + var_2 );
    var_5 _id_A78A::_id_7F0C( "enemy", "waypoint_defend" + var_2 );
    var_5 _id_A78A::_id_7F0D( "friendly", "waypoint_defuse" + var_2 );
    var_5 _id_A78A::_id_7F0D( "enemy", "waypoint_defend" + var_2 );
    var_5._id_0245 = var_2;
    var_5._id_6451 = ::_id_6451;
    var_5._id_648B = ::_id_648B;
    var_5._id_64F5 = ::_id_64F7;
    var_5._id_623F = 1;
    var_5._id_4B50 = "defuseObject";
    var_5._id_9C14 = "search_dstry_bomb_defuse_mp";

    if ( var_2 == "_a" || var_2 == "_A" )
        setomnvar( "ui_mlg_game_mode_status_1", 1 );
    else if ( var_2 == "_b" || var_2 == "_B" )
        setomnvar( "ui_mlg_game_mode_status_1", 2 );

    _id_A75A::_id_6DD9( "mp_snd_bomb_planted", level._id_7B6F._id_02E6 + ( 0, 0, 1 ) );
    _id_1552();
    setomnvar( "ui_bomb_timer", 0 );
    var_0._id_9E93[0] _id_A789::_id_8F00();

    if ( level._id_3BD8 || level._id_1536 )
        return;

    level._id_1540 = 1;
    setomnvar( "ui_mlg_game_mode_status_1", 0 );

    if ( isdefined( level._id_7B5A ) )
        level thread [[ level._id_7B5A ]]();
    else
    {
        var_6 = level._id_7B6F._id_02E6;
        var_6 += ( 0, 0, 10 );
        level._id_7B6F _meth_8054();
        stopfxontag( _id_A4F0::_id_3FA6( "bomb_light_planted" ), level._id_7B6F, "tag_flash" );

        if ( isdefined( var_1 ) )
        {
            var_0._id_9E93[0] _meth_81D5( var_6, 512, 300, 20, var_1, "MOD_EXPLOSIVE", "bomb_site_mp" );
            var_1 thread _id_A72E::_id_1539();
        }
        else
            var_0._id_9E93[0] _meth_81D5( var_6, 512, 300, 20, undefined, "MOD_EXPLOSIVE", "bomb_site_mp" );

        var_7 = "bomb_explosion";

        if ( isdefined( var_0._id_04C6._id_3017 ) )
            var_7 = var_0._id_04C6._id_3017;

        var_8 = randomfloat( 360 );
        var_9 = var_6 + ( 0, 0, 50 );
        var_10 = spawnfx( level._id_058F[var_7], var_9 + ( 0, 0, 50 ), ( 0, 0, 1 ), ( cos( var_8 ), sin( var_8 ), 0 ) );
        triggerfx( var_10 );
        physicsexplosionsphere( var_9, 200, 100, 3 );
        playrumbleonposition( "grenade_rumble", var_6 );
        earthquake( 0.75, 2.0, var_6, 2000 );
        thread _id_A75A::_id_6DD9( "mp_snd_bomb_detonated", var_6 );

        if ( isdefined( var_0._id_3539 ) )
            _id_A4ED::_id_3526( var_0._id_3539 );
    }

    for ( var_11 = 0; var_11 < level._id_1555.size; var_11++ )
        level._id_1555[var_11] _id_A78A::_id_2B1D();

    var_5 _id_A78A::_id_2B1D();
    setgameendtime( 0 );
    wait 3;
    _id_7B50( game["attackers"], game["end_reason"]["target_destroyed"] );
}

invalidatecarepackageandgoliathdrop()
{
    var_0 = self;
    var_1 = 64;
    var_2 = 64;
    var_3 = var_0._id_02E6 + ( 0, 0, -4 );
    var_4 = spawn( "trigger_radius", var_3, 0, var_1, var_2 );
    var_4._id_04A7 = "orbital_node_covered";
    var_4._id_039B = "dont_move_me";

    if ( !isdefined( level._id_6554 ) )
        level._id_6554 = [];

    var_5 = 0;

    if ( level._id_6554.size > 0 )
    {
        foreach ( var_7 in level._id_6554 )
        {
            if ( var_7 == var_4 )
            {
                var_5 = 1;
                break;
            }
        }
    }

    if ( var_5 == 0 )
        level._id_6554[level._id_6554.size] = var_4;

    if ( !isdefined( level._id_425C ) )
        level._id_425C = [];

    var_9 = 0;

    if ( level._id_425C.size > 0 )
    {
        foreach ( var_7 in level._id_425C )
        {
            if ( var_7 == var_4 )
            {
                var_9 = 1;
                break;
            }
        }
    }

    if ( var_9 == 0 )
        level._id_425C[level._id_425C.size] = var_4;

    var_12 = getnodesinradiussorted( var_3, var_1, 0, var_2 );

    if ( var_12.size > 0 )
    {
        foreach ( var_14 in var_12 )
            _func_2D6( var_14, "none" );
    }

    _id_A4F0::_id_A060( "bomb_defused", "game_ended" );
    level._id_425C = _id_A4F0::_id_0CF6( level._id_425C, var_4 );
    level._id_425C = _id_A4F0::_id_0CF9( level._id_425C );
    level._id_6554 = _id_A4F0::_id_0CF6( level._id_6554, var_4 );
    level._id_6554 = _id_A4F0::_id_0CF9( level._id_6554 );
    var_4 delete();

    if ( var_12.size > 0 )
    {
        foreach ( var_14 in var_12 )
            _func_2D6( var_14, "up" );
    }

    return;
}

_id_1552()
{
    level endon( "game_ended" );
    level endon( "bomb_defused" );
    var_0 = int( level._id_1551 * 1000 + gettime() );
    setomnvar( "ui_bomb_timer_endtime", var_0 );
    level thread _id_4660( var_0 );
    _id_A79A::_id_A048( level._id_1551 );
}

_id_4660( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" );
    level endon( "game_ended" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    setomnvar( "ui_bomb_timer_endtime", 0 );
    var_1 = _id_A79A::_id_A0D4();

    if ( var_1 > 0 )
        setomnvar( "ui_bomb_timer_endtime", var_0 + var_1 );
}

_id_646C( var_0 )
{
    _id_A78A::_id_7F0C( "friendly", "waypoint_bomb" );
    _id_A78A::_id_7F0D( "friendly", "waypoint_bomb" );
    _id_A75A::_id_6DDA( game["bomb_dropped_sound"], game["attackers"] );
    _id_A75A::_id_6DDA( game["bomb_dropped_enemy_sound"], game["defenders"] );
}

_id_1AF8( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 _id_A75A::_id_512E() )
        return 0;

    if ( isdefined( var_0.enteringgoliath ) && var_0.enteringgoliath == 1 )
        return 0;

    return 1;
}

_id_426E()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self waittill( "goliath_equipped" );

    if ( isdefined( self._id_1BB6 ) )
    {
        self._id_50C5 = 0;
        self _meth_82FB( "ui_carrying_bomb", 0 );
        self._id_1BB6 thread _id_A78A::_id_7F57();
    }
}

_id_64F7( var_0 )
{
    var_0 notify( "bomb_defused" );
    level thread _id_1536();
    _id_A78A::_id_2B1D();
    _id_A75A::_id_5648( "bomb_defused_attackers", game["attackers"] );
    _id_A75A::_id_5648( "bomb_defused_defenders", game["defenders"] );
    _id_A75A::_id_6DDA( game["bomb_disarm_enemy_sound"], game["attackers"] );
    _id_A75A::_id_6DDA( game["bomb_disarm_sound"], game["defenders"] );
    var_1 = "defuse";

    if ( isdefined( level._id_1544 ) && _id_A75A::_id_5186( level._id_1544 ) && level._id_1544._id_1547 + 6000 + level._id_27BE * 1000 > gettime() )
        var_1 = "ninja_defuse";

    if ( _id_513D( var_0 ) )
        var_1 = "last_man_defuse";

    var_0 thread _id_A72E::_id_1537( var_1 );
}

_id_513D( var_0 )
{
    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 == var_0 )
            continue;

        if ( var_2 _id_A7A7::_id_5A5F() )
            return 0;

        if ( _id_A75A::_id_5186( var_2 ) )
            return 0;
    }

    return 1;
}

_id_1536()
{
    level._id_933E _id_A789::_id_8F00();
    level._id_1536 = 1;
    setomnvar( "ui_bomb_timer", 0 );
    setomnvar( "ui_mlg_game_mode_status_1", 0 );
    level notify( "bomb_defused" );
    wait 1.5;
    setgameendtime( 0 );
    _id_7B50( game["defenders"], game["end_reason"]["bomb_defused"] );
}

_id_6456( var_0 )
{
    var_0 _meth_826E( &"MP_CANT_PLANT_WITHOUT_BOMB" );
}

_id_64ED()
{
    _id_7B50( game["defenders"], game["end_reason"]["time_limit_reached"] );
}

_id_7B50( var_0, var_1 )
{
    level._id_374B = var_0;

    if ( var_1 == game["end_reason"]["target_destroyed"] || var_1 == game["end_reason"]["bomb_defused"] )
    {
        var_2 = 1;

        foreach ( var_4 in level._id_1555 )
        {
            if ( isdefined( level._id_3741[var_0] ) && level._id_3741[var_0] == var_4._id_534B )
            {
                var_2 = 0;
                break;
            }
        }

        if ( var_2 )
            _id_A783::_id_334C();
    }

    _id_A78B::_id_4209( var_0, 1 );
    thread _id_A789::_id_315E( var_0, var_1 );
}

_id_1CF1()
{
    wait 0.05;
    var_0 = 0;

    if ( !level._id_09DD[game["attackers"]] )
    {
        level._id_8A44[game["attackers"]]._id_0AA7 = 1;
        var_0 = 1;
    }

    if ( !level._id_09DD[game["defenders"]] )
    {
        level._id_8A44[game["defenders"]]._id_0AA7 = 1;
        var_0 = 1;
    }

    if ( var_0 )
        _id_A7B1::_id_9B6A();
}

_id_6463( var_0 )
{
    if ( level._id_1540 || level._id_1536 )
        return;

    if ( var_0 == "all" )
    {
        if ( level._id_1545 )
            _id_7B50( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
        else
            _id_7B50( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( level._id_1545 )
            return;

        level thread _id_7B50( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
        level thread _id_7B50( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
}

_id_64BD( var_0 )
{
    if ( level._id_1540 || level._id_1536 )
        return;

    var_1 = _id_A75A::_id_3FFA( var_0 );
    var_1 thread _id_41ED();
}

_id_41ED()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    _id_A75A::_id_A0E4( 3 );
    var_0 = _id_A75A::_id_4065( self._id_030D["team"] );
    level thread _id_A75A::_id_91F3( "callout_lastteammemberalive", self, self._id_030D["team"] );
    level thread _id_A75A::_id_91F3( "callout_lastenemyalive", self, var_0 );
    level notify( "last_alive", self );
    _id_A7A0::_id_55B9();
}

_id_64DD()
{

}

_id_0CAA()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_50D7 ) && self._id_50D7 == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    while ( self _meth_82E0() )
        wait 0.05;

    while ( !self _meth_8341() )
        wait 0.05;

    if ( _id_A75A::_id_512E() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self._id_030D["gamemodeLoadout"] = level._id_7B59[self._id_04A8];
    self._id_3BF1 = self._id_1E2E;
    self.gamemode_carrierclass = 1;
    self._id_030D["class"] = "gamemode";
    self._id_030D["lastClass"] = "gamemode";
    self._id_1E2E = "gamemode";
    self._id_5586 = "gamemode";
    self notify( "faux_spawn" );
    _id_A781::_id_41DD( self._id_04A8, "gamemode" );

    if ( self.loadoutkeepcurrentkillstreaks )
        _id_A7C3::_id_9B24( 1 );

    _id_72AD();
}

_id_72AD()
{
    var_0 = self _meth_82CE();

    foreach ( var_2 in var_0 )
        self _meth_84A4( var_2 );
}

_id_7393()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_50D7 ) && self._id_50D7 == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    while ( self _meth_82E0() )
        wait 0.05;

    while ( !self _meth_8341() )
        wait 0.05;

    if ( _id_A75A::_id_512E() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self._id_030D["gamemodeLoadout"] = undefined;
    self notify( "faux_spawn" );
    _id_A781::_id_41DD( self._id_04A8, self._id_1E2E );

    if ( self.loadoutkeepcurrentkillstreaks )
        _id_A7C3::_id_9B24( 1 );

    _id_72AD();
}
