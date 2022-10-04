// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    if ( level._id_5FE9 )
    {
        for ( var_1 = 0; var_1 < level._id_91F0.size; var_1++ )
        {
            var_2 = "spawn_" + level._id_91F0[var_1];
            var_3 = "defeat_" + level._id_91F0[var_1];
            var_4 = "victory_" + level._id_91F0[var_1];
            var_5 = "winning_" + level._id_91F0[var_1];
            var_6 = "losing_" + level._id_91F0[var_1];
            game["music"][var_2] = _id_A7B2::_id_411E( "allies" ) + "spawn_music";
            game["music"][var_3] = _id_A7B2::_id_411E( "allies" ) + "defeat_music";
            game["music"][var_4] = _id_A7B2::_id_411E( "allies" ) + "victory_music";
            game["music"][var_5] = _id_A7B2::_id_411E( "allies" ) + "winning_music";
            game["music"][var_6] = _id_A7B2::_id_411E( "allies" ) + "losing_music";
            game["voice"][level._id_91F0[var_1]] = _id_A7B2::_id_411E( "allies" ) + "anr0_";
        }
    }
    else
    {
        game["music"]["spawn_allies"] = _id_A7B2::_id_411E( "allies" ) + "spawn_music";
        game["music"]["defeat_allies"] = _id_A7B2::_id_411E( "allies" ) + "defeat_music";
        game["music"]["victory_allies"] = _id_A7B2::_id_411E( "allies" ) + "victory_music";
        game["music"]["winning_allies"] = _id_A7B2::_id_411E( "allies" ) + "winning_music";
        game["music"]["losing_allies"] = _id_A7B2::_id_411E( "allies" ) + "losing_music";
        game["voice"]["allies"] = _id_A7B2::_id_411E( "allies" ) + "anr0_";
        game["music"]["spawn_axis"] = _id_A7B2::_id_411E( "axis" ) + "spawn_music";
        game["music"]["defeat_axis"] = _id_A7B2::_id_411E( "axis" ) + "defeat_music";
        game["music"]["victory_axis"] = _id_A7B2::_id_411E( "axis" ) + "victory_music";
        game["music"]["winning_axis"] = _id_A7B2::_id_411E( "axis" ) + "winning_music";
        game["music"]["losing_axis"] = _id_A7B2::_id_411E( "axis" ) + "losing_music";
        game["voice"]["axis"] = _id_A7B2::_id_411E( "axis" ) + "anr0_";
    }

    game["music"]["losing_time"] = "null";
    game["music"]["suspense"] = [];
    game["music"]["suspense"][game["music"]["suspense"].size] = "null";
    game["music"]["suspense"][game["music"]["suspense"].size] = "null";
    game["music"]["suspense"][game["music"]["suspense"].size] = "null";
    game["music"]["suspense"][game["music"]["suspense"].size] = "null";
    game["music"]["suspense"][game["music"]["suspense"].size] = "null";
    game["music"]["suspense"][game["music"]["suspense"].size] = "null";
    game["dialog"]["mission_success"] = "gbl_win";
    game["dialog"]["mission_failure"] = "gbl_lost";
    game["dialog"]["mission_draw"] = "gbl_draw";
    game["dialog"]["round_success"] = "encourage_win";
    game["dialog"]["round_failure"] = "encourage_lost";
    game["dialog"]["round_draw"] = "draw";
    game["dialog"]["timesup"] = "timesup";
    game["dialog"]["winning_time"] = "gbl_winning";
    game["dialog"]["losing_time"] = "gbl_losing";
    game["dialog"]["winning_score"] = "gbl_winning";
    game["dialog"]["losing_score"] = "gbl_losing";
    game["dialog"]["lead_lost"] = "gbl_lead_lost";
    game["dialog"]["lead_tied"] = "tied";
    game["dialog"]["lead_taken"] = "gbl_lead_taken";
    game["dialog"]["last_alive"] = "gbl_lastman";
    game["dialog"]["boost"] = "gbl_start";

    if ( !isdefined( game["dialog"]["offense_obj"] ) )
        game["dialog"]["offense_obj"] = "boost";

    if ( !isdefined( game["dialog"]["defense_obj"] ) )
        game["dialog"]["defense_obj"] = "boost";

    game["dialog"]["hardcore"] = "hardcore";
    game["dialog"]["highspeed"] = "highspeed";
    game["dialog"]["tactical"] = "tactical";
    game["dialog"]["challenge"] = "challengecomplete";
    game["dialog"]["promotion"] = "promotion";
    game["dialog"]["bomb_taken"] = "acheive_bomb";
    game["dialog"]["bomb_lost"] = "bomb_taken";
    game["dialog"]["bomb_defused_attackers"] = "sd_enemydefused";
    game["dialog"]["bomb_defused_defenders"] = "sd_allydefused";
    game["dialog"]["bomb_planted"] = "sd_bombplanted";
    game["dialog"]["obj_taken"] = "securedobj";
    game["dialog"]["obj_lost"] = "lostobj";
    game["dialog"]["obj_defend"] = "gbl_defendobj";
    game["dialog"]["obj_destroy"] = "gbl_destroyobj";
    game["dialog"]["obj_capture"] = "gbl_secureobj";
    game["dialog"]["objs_capture"] = "gbl_secureobjs";
    game["dialog"]["move_to_new"] = "new_positions";
    game["dialog"]["push_forward"] = "gbl_rally";
    game["dialog"]["attack"] = "attack";
    game["dialog"]["defend"] = "defend";
    game["dialog"]["offense"] = "offense";
    game["dialog"]["defense"] = "defense";
    game["dialog"]["halftime"] = "gbl_halftime";
    game["dialog"]["overtime"] = "gbl_overtime";
    game["dialog"]["side_switch"] = "gbl_switchingsides";
    game["dialog"]["flag_taken"] = "ctf_retrieveflagally";
    game["dialog"]["enemy_flag_taken"] = "ctf_enemyflagacquired";
    game["dialog"]["flag_dropped"] = "ctf_enemydropflag";
    game["dialog"]["enemy_flag_dropped"] = "ctf_allydropflag";
    game["dialog"]["flag_returned"] = "ctf_allyflagback";
    game["dialog"]["enemy_flag_returned"] = "ctf_enemyflagback";
    game["dialog"]["flag_captured"] = "ctf_enemycapflag";
    game["dialog"]["enemy_flag_captured"] = "ctf_allycapflag";
    game["dialog"]["flag_getback"] = "ctf_retrieveflagally";
    game["dialog"]["enemy_flag_bringhome"] = "ctf_bringhomeflag";
    game["dialog"]["hp_online"] = "hpt_identified";
    game["dialog"]["hp_lost"] = "hpt_enemycap";
    game["dialog"]["hp_contested"] = "hpt_contested";
    game["dialog"]["hp_secured"] = "hpt_allyown";
    game["dialog"]["capturing_a"] = "dom_capa";
    game["dialog"]["capturing_b"] = "dom_capb";
    game["dialog"]["capturing_c"] = "dom_capc";
    game["dialog"]["captured_a"] = "dom_owna";
    game["dialog"]["captured_b"] = "dom_ownb";
    game["dialog"]["captured_c"] = "dom_ownc";
    game["dialog"]["securing_a"] = "dom_securinga";
    game["dialog"]["securing_b"] = "dom_securingb";
    game["dialog"]["securing_c"] = "dom_securingc";
    game["dialog"]["secured_a"] = "dom_secure_a";
    game["dialog"]["secured_b"] = "dom_secure_b";
    game["dialog"]["secured_c"] = "dom_secure_c";
    game["dialog"]["losing_a"] = "dom_enemycapa";
    game["dialog"]["losing_b"] = "dom_enemycapb";
    game["dialog"]["losing_c"] = "dom_enemycapc";
    game["dialog"]["lost_a"] = "dom_losta";
    game["dialog"]["lost_b"] = "dom_lostb";
    game["dialog"]["lost_c"] = "dom_lostc";
    game["dialog"]["enemy_taking_a"] = "dom_enemycapa";
    game["dialog"]["enemy_taking_b"] = "dom_enemycapb";
    game["dialog"]["enemy_taking_c"] = "dom_enemycapc";
    game["dialog"]["enemy_has_a"] = "dom_enemyowna";
    game["dialog"]["enemy_has_b"] = "dom_enemyownb";
    game["dialog"]["enemy_has_c"] = "dom_enemyownc";
    game["dialog"]["lost_all"] = "dom_enemyownall";
    game["dialog"]["secure_all"] = "dom_ownall";
    game["dialog"]["destroy_sentry"] = "ks_sentrygun_destroyed";
    game["music"]["nuke_music"] = "nuke_music";
    game["dialog"]["sentry_gone"] = "sentry_gone";
    game["dialog"]["sentry_destroyed"] = "sentry_destroyed";
    game["dialog"]["ti_gone"] = "ti_cancelled";
    game["dialog"]["ti_destroyed"] = "ti_blocked";
    game["dialog"]["ims_destroyed"] = "ims_destroyed";
    game["dialog"]["lbguard_destroyed"] = "lbguard_destroyed";
    game["dialog"]["ballistic_vest_destroyed"] = "ballistic_vest_destroyed";
    game["dialog"]["remote_sentry_destroyed"] = "remote_sentry_destroyed";
    game["dialog"]["sam_destroyed"] = "sam_destroyed";
    game["dialog"]["sam_gone"] = "sam_gone";
    game["dialog"]["claymore_destroyed"] = "null";
    game["dialog"]["mine_destroyed"] = "null";
    game["dialog"]["ti_destroyed"] = "gbl_tactinsertlost";
    game["dialog"]["lockouts"] = [];
    game["dialog"]["lockouts"]["ks_uav_allyuse"] = 6;
    level thread _id_64C5();
    level thread _id_64B4();
    level thread _id_6003();
    level thread _id_64AE();
    level thread _id_64E1();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D3();
        var_0 thread _id_374C();
    }
}

playpracticeroundmusicforactiveclients()
{
    if ( !isdefined( level.practiceroundmusicent ) )
        return;

    level.practiceroundmusicent _meth_8054();

    foreach ( var_1 in level._id_0328 )
    {
        if ( var_1 == self )
            continue;

        if ( !isdefined( var_1.practiceroundmusicplaying ) || !var_1.practiceroundmusicplaying )
            continue;

        if ( _id_A75A::_id_50AA( var_1 ) )
            continue;

        level.practiceroundmusicent _meth_8007( var_1 );
    }
}

practiceroundmusic()
{
    self endon( "disconnect" );

    if ( _id_A75A::_id_50AA( self ) )
        return;

    if ( isdefined( level.practiceroundmusicending ) && level.practiceroundmusicending )
        return;

    if ( isdefined( self.practiceroundmusicstarted ) && self.practiceroundmusicstarted )
        return;
    else
        self.practiceroundmusicstarted = 1;

    if ( !isdefined( level.practiceroundmusicent ) )
    {
        if ( !soundexists( "mus_practice_round_backing_track" ) )
            return;

        level.practiceroundmusicent = spawn( "script_origin", ( 0, 0, 0 ) );
        level.practiceroundmusicent endon( "death" );
        level endon( "practiceRoundMusicEnding" );
        level thread endpracticeroundmusic();
        level.practiceroundmusicent _meth_8054();
        wait 12;
        self.practiceroundmusicplaying = 1;
        level.practiceroundmusicent _meth_8075( "mus_practice_round_backing_track" );
        playpracticeroundmusicforactiveclients();
        level.practiceroundmusicent _meth_8007( self );
        level.practiceroundmusicent _meth_806F( 0, 0.05 );
        wait 0.8;
        level.practiceroundmusicent _meth_806F( 0.8, 2.5 );
    }
    else
    {
        playpracticeroundmusicforactiveclients();
        level.practiceroundmusicent endon( "death" );
        level endon( "practiceRoundMusicEnding" );
        wait 12;
        self.practiceroundmusicplaying = 1;
        level.practiceroundmusicent _meth_8007( self );
    }
}

endpracticeroundmusic()
{
    level.practiceroundmusicent endon( "death" );

    while ( game["state"] == "playing" )
    {
        if ( !level._id_9374 && _id_A75A::_id_4129() )
        {
            var_0 = _id_A789::_id_412F() / 1000;
            var_1 = int( var_0 + 0.5 );

            if ( var_1 <= 10 )
                break;

            if ( var_0 - floor( var_0 ) >= 0.05 )
                wait(var_0 - floor( var_0 ));
        }

        wait 1.0;
    }

    level notify( "practiceRoundMusicEnding" );
    level.practiceroundmusicending = 1;
    level.practiceroundmusicent _meth_806F( 0, 5 );
    wait 5.5;
    level.practiceroundmusicent _meth_80AC();
    level.practiceroundmusicent delete();
}

_id_64D3()
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );

    if ( getdvar( "virtuallobbyactive" ) == "0" )
    {
        if ( !level._id_8A76 || level._id_8A76 && !isdefined( level._id_6A3E ) )
        {
            if ( !self _meth_82CD() || self _meth_82E8() )
                self _meth_82F4( game["music"]["spawn_" + self._id_04A8] );

            if ( level._id_8A76 )
                level._id_6A3E = 1;
        }

        if ( _id_A75A::_id_6E98() )
            thread practiceroundmusic();

        if ( isdefined( game["dialog"]["gametype"] ) && ( !level._id_8A76 || self == level._id_0328[0] ) )
        {
            if ( isdefined( game["dialog"]["allies_gametype"] ) && self._id_04A8 == "allies" )
                _id_A75A::_id_5652( "allies_gametype" );
            else if ( isdefined( game["dialog"]["axis_gametype"] ) && self._id_04A8 == "axis" )
                _id_A75A::_id_5652( "axis_gametype" );
            else if ( !self _meth_82CD() || self _meth_82E8() )
                _id_A75A::_id_5652( "gametype" );
        }

        _id_A75A::_id_3BDF( "prematch_done" );

        if ( self._id_04A8 == game["attackers"] )
        {
            if ( !self _meth_82CD() || self _meth_82E8() )
                _id_A75A::_id_5652( "offense_obj", "introboost" );
        }
        else if ( !self _meth_82CD() || self _meth_82E8() )
            _id_A75A::_id_5652( "defense_obj", "introboost" );
    }
}

_id_64B4()
{
    level endon( "game_ended" );
    level waittill( "last_alive", var_0 );

    if ( !isalive( var_0 ) )
        return;

    var_0 _id_A75A::_id_5652( "last_alive" );
}

_id_64E1()
{
    level waittill( "round_switch", var_0 );

    switch ( var_0 )
    {
        case "halftime":
            foreach ( var_2 in level._id_0328 )
            {
                if ( var_2 _meth_82CD() && !var_2 _meth_82E8() )
                    continue;

                var_2 _id_A75A::_id_5652( "halftime" );
            }

            break;
        case "overtime":
            foreach ( var_2 in level._id_0328 )
            {
                if ( var_2 _meth_82CD() && !var_2 _meth_82E8() )
                    continue;

                var_2 _id_A75A::_id_5652( "overtime" );
            }

            break;
        default:
            foreach ( var_2 in level._id_0328 )
            {
                if ( var_2 _meth_82CD() && !var_2 _meth_82E8() )
                    continue;

                var_2 _id_A75A::_id_5652( "side_switch" );
            }

            break;
    }
}

_id_64AE()
{
    level thread _id_765D();
    level thread _id_3C02();
    level waittill( "game_win", var_0 );

    if ( level._id_91E4 )
    {
        if ( level._id_8A76 )
        {
            if ( var_0 == "allies" )
                _id_A75A::_id_6DDA( game["music"]["victory_allies"], "allies" );
            else if ( var_0 == "axis" )
                _id_A75A::_id_6DDA( game["music"]["victory_axis"], "axis" );
            else
                _id_A75A::_id_6DDA( game["music"]["nuke_music"] );
        }
        else if ( var_0 == "allies" )
        {
            _id_A75A::_id_6DDA( game["music"]["victory_allies"], "allies" );
            _id_A75A::_id_6DDA( game["music"]["defeat_axis"], "axis" );
        }
        else if ( var_0 == "axis" )
        {
            _id_A75A::_id_6DDA( game["music"]["victory_axis"], "axis" );
            _id_A75A::_id_6DDA( game["music"]["defeat_allies"], "allies" );
        }
        else
            _id_A75A::_id_6DDA( game["music"]["nuke_music"] );
    }
    else
    {
        foreach ( var_2 in level._id_0328 )
        {
            if ( var_2 _meth_82CD() && !var_2 _meth_82E8() )
                continue;

            if ( var_2._id_030D["team"] != "allies" && var_2._id_030D["team"] != "axis" )
            {
                var_2 _meth_82F4( game["music"]["nuke_music"] );
                continue;
            }

            if ( isdefined( var_0 ) && isplayer( var_0 ) && var_2 == var_0 )
            {
                var_2 _meth_82F4( game["music"]["victory_" + var_2._id_030D["team"]] );
                continue;
            }

            if ( !level._id_8A76 )
                var_2 _meth_82F4( game["music"]["defeat_" + var_2._id_030D["team"]] );
        }
    }
}

_id_765D()
{
    level waittill( "round_win", var_0 );
    var_1 = level._id_7650 / 4;

    if ( var_1 > 0 )
        wait(var_1);

    if ( !isdefined( var_0 ) || isplayer( var_0 ) )
        return;

    if ( _id_A75A::_id_6E98() )
        return;

    if ( var_0 == "allies" )
    {
        _id_A75A::_id_5648( "round_success", "allies" );
        _id_A75A::_id_5648( "round_failure", "axis" );
    }
    else if ( var_0 == "axis" )
    {
        _id_A75A::_id_5648( "round_success", "axis" );
        _id_A75A::_id_5648( "round_failure", "allies" );
    }
    else
    {

    }
}

_id_3C02()
{
    level waittill( "game_win", var_0 );
    var_1 = level._id_6E89 / 2;

    if ( var_1 > 0 )
        wait(var_1);

    if ( !isdefined( var_0 ) || isplayer( var_0 ) )
        return;

    if ( _id_A75A::_id_6E98() )
        return;

    if ( var_0 == "allies" )
    {
        _id_A75A::_id_5648( "mission_success", "allies" );
        _id_A75A::_id_5648( "mission_failure", "axis" );
    }
    else if ( var_0 == "axis" )
    {
        if ( isdefined( level._id_511A ) )
            [[ level._id_49DB ]]();
        else
        {
            _id_A75A::_id_5648( "mission_success", "axis" );
            _id_A75A::_id_5648( "mission_failure", "allies" );
        }
    }
    else
    {
        _id_A75A::_id_5648( "mission_draw" );
        return;
    }
}

_id_6003()
{
    level endon( "game_ended" );

    if ( !level._id_46C7 && getdvar( "virtualLobbyActive" ) == "0" )
        thread _id_8FFA();

    level waittill( "match_ending_soon", var_0 );

    if ( _id_A75A::_id_415B( "roundlimit" ) == 1 || game["roundsPlayed"] == _id_A75A::_id_415B( "roundlimit" ) - 1 )
    {
        if ( !level._id_8A76 )
        {
            if ( var_0 == "time" )
            {
                if ( level._id_91E4 )
                {
                    if ( _id_A75A::_id_6E98() )
                    {
                        _id_A75A::_id_6DDA( game["music"]["winning_allies"] );
                        _id_A75A::_id_5648( "winning_time" );
                    }
                    else if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
                    {
                        if ( !level._id_46C7 )
                        {
                            _id_A75A::_id_6DDA( game["music"]["winning_allies"], "allies" );
                            _id_A75A::_id_6DDA( game["music"]["losing_axis"], "axis" );
                        }

                        _id_A75A::_id_5648( "winning_time", "allies" );
                        _id_A75A::_id_5648( "losing_time", "axis" );
                    }
                    else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
                    {
                        if ( !level._id_46C7 )
                        {
                            _id_A75A::_id_6DDA( game["music"]["winning_axis"], "axis" );
                            _id_A75A::_id_6DDA( game["music"]["losing_allies"], "allies" );
                        }

                        _id_A75A::_id_5648( "winning_time", "axis" );
                        _id_A75A::_id_5648( "losing_time", "allies" );
                    }
                }
                else
                {
                    if ( !level._id_46C7 )
                        _id_A75A::_id_6DDA( game["music"]["losing_time"] );

                    _id_A75A::_id_5648( "timesup" );
                }
            }
            else if ( var_0 == "score" )
            {
                if ( level._id_91E4 )
                {
                    if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
                    {
                        if ( !level._id_46C7 )
                        {
                            _id_A75A::_id_6DDA( game["music"]["winning_allies"], "allies" );
                            _id_A75A::_id_6DDA( game["music"]["losing_axis"], "axis" );
                        }

                        _id_A75A::_id_5648( "winning_score", "allies" );
                        _id_A75A::_id_5648( "losing_score", "axis" );
                    }
                    else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
                    {
                        if ( !level._id_46C7 )
                        {
                            _id_A75A::_id_6DDA( game["music"]["winning_axis"], "axis" );
                            _id_A75A::_id_6DDA( game["music"]["losing_allies"], "allies" );
                        }

                        _id_A75A::_id_5648( "winning_score", "axis" );
                        _id_A75A::_id_5648( "losing_score", "allies" );
                    }
                }
                else
                {
                    var_1 = _id_A78B::_id_3FC7();
                    var_2 = _id_A78B::_id_400E();
                    var_3[0] = var_1;

                    if ( !level._id_46C7 )
                    {
                        var_1 _meth_82F4( game["music"]["winning_" + var_1._id_030D["team"]] );

                        foreach ( var_5 in level._id_0328 )
                        {
                            if ( var_5 == var_1 )
                                continue;

                            var_5 _meth_82F4( game["music"]["losing_" + var_5._id_030D["team"]] );
                        }
                    }

                    var_1 _id_A75A::_id_5652( "winning_score" );
                    _id_A75A::_id_5655( "losing_score", var_2 );
                }
            }

            level waittill( "match_ending_very_soon" );
            _id_A75A::_id_5648( "timesup" );
        }
    }
    else
    {
        if ( !level._id_46C7 )
            _id_A75A::_id_6DDA( game["music"]["losing_allies"] );

        _id_A75A::_id_5648( "timesup" );
    }
}

_id_8FFA()
{
    level endon( "game_ended" );
    level endon( "match_ending_soon" );
    var_0 = game["music"]["suspense"].size;
    wait 120;

    for (;;)
    {
        wait(randomfloatrange( 60, 120 ));
        _id_A75A::_id_6DDA( game["music"]["suspense"][randomint( var_0 )] );
    }
}

_id_374C()
{
    self waittill( "showing_final_killcam" );
}
