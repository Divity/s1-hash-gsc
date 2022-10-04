// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_64AC( var_0 )
{
    if ( isdefined( level._id_39DD ) )
        return;

    level endon( "abort_forfeit" );
    level thread _id_39DE();
    level._id_39DD = 1;

    if ( !level._id_91E4 && level._id_0328.size > 1 )
        wait 10;
    else
        wait 1.05;

    level._id_39DC = 0;
    var_1 = 20.0;
    _id_59DE( var_1 );
    var_2 = &"";

    if ( !isdefined( var_0 ) )
    {
        level._id_374B = "none";
        var_2 = game["end_reason"]["players_forfeited"];
        var_3 = level._id_0328[0];
    }
    else if ( var_0 == "axis" )
    {
        level._id_374B = "axis";
        var_2 = game["end_reason"]["allies_forfeited"];

        if ( level._id_01B5 == "infect" )
            var_2 = game["end_reason"]["survivors_forfeited"];

        var_3 = "axis";
    }
    else if ( var_0 == "allies" )
    {
        level._id_374B = "allies";
        var_2 = game["end_reason"]["axis_forfeited"];

        if ( level._id_01B5 == "infect" )
            var_2 = game["end_reason"]["infected_forfeited"];

        var_3 = "allies";
    }
    else if ( level._id_5FE9 && issubstr( var_0, "team_" ) )
        var_3 = var_0;
    else
    {
        level._id_374B = "none";
        var_3 = "tie";
    }

    level._id_39B6 = 1;

    if ( isplayer( var_3 ) )
        logstring( "forfeit, win: " + var_3 _meth_8297() + "(" + var_3._id_02AB + ")" );
    else
        logstring( "forfeit, win: " + var_3 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );

    thread _id_315E( var_3, var_2 );
}

_id_39DE()
{
    level endon( "game_ended" );
    level waittill( "abort_forfeit" );
    level._id_39DC = 1;
    setomnvar( "ui_match_countdown", 0 );
    setomnvar( "ui_match_countdown_title", 0 );
    setomnvar( "ui_match_countdown_toggle", 0 );
}

_id_59DF( var_0 )
{
    waitframe;
    level endon( "match_forfeit_timer_beginning" );
    setomnvar( "ui_match_countdown_title", 3 );
    setomnvar( "ui_match_countdown_toggle", 1 );

    while ( var_0 > 0 && !level._id_3BD8 && !level._id_39DC && !level._id_4C6A )
    {
        setomnvar( "ui_match_countdown", var_0 );
        wait 1;
        var_0--;
    }
}

_id_59DE( var_0 )
{
    level notify( "match_forfeit_timer_beginning" );
    var_1 = int( var_0 );
    _id_59DF( var_1 );
    setomnvar( "ui_match_countdown", 0 );
    setomnvar( "ui_match_countdown_title", 0 );
    setomnvar( "ui_match_countdown_toggle", 0 );
}

_id_2783( var_0 )
{
    level._id_374B = "none";

    if ( var_0 == "allies" )
    {
        logstring( "team eliminated, win: opfor, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
        level._id_374B = "axis";
        thread _id_315E( "axis", game["end_reason"]["allies_eliminated"] );
    }
    else if ( var_0 == "axis" )
    {
        logstring( "team eliminated, win: allies, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
        level._id_374B = "allies";
        thread _id_315E( "allies", game["end_reason"]["axis_eliminated"] );
    }
    else
    {
        logstring( "tie, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
        level._id_374B = "none";

        if ( level._id_91E4 )
            thread _id_315E( "tie", game["end_reason"]["tie"] );
        else
            thread _id_315E( undefined, game["end_reason"]["tie"] );
    }
}

_id_2785( var_0 )
{
    if ( level._id_91E4 )
    {
        var_1 = _id_A75A::_id_3FFA( var_0 );
        var_1 thread _id_41ED();
    }
    else
    {
        var_1 = _id_A75A::_id_3FFA();
        logstring( "last one alive, win: " + var_1._id_02AB );
        level._id_374B = "none";
        thread _id_315E( var_1, game["end_reason"]["enemies_eliminated"] );
    }

    return 1;
}

_id_2786()
{
    var_0 = undefined;
    level._id_374B = "none";

    if ( level._id_91E4 )
    {
        if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
            var_0 = "tie";
        else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        {
            level._id_374B = "axis";
            var_0 = "axis";
        }
        else
        {
            level._id_374B = "allies";
            var_0 = "allies";
        }

        if ( _id_A75A::_id_6E98() )
            var_0 = "none";

        logstring( "time limit, win: " + var_0 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    }
    else
    {
        var_0 = _id_A78B::_id_3FC7();

        if ( isdefined( var_0 ) )
            logstring( "time limit, win: " + var_0._id_02AB );
        else
            logstring( "time limit, tie" );
    }

    thread _id_315E( var_0, game["end_reason"]["time_limit_reached"] );
}

_id_2784( var_0 )
{
    var_1 = undefined;
    level._id_374B = "none";
    thread _id_315E( "halftime", game["end_reason"][var_0] );
}

_id_39BA()
{
    if ( level._id_4A2E || level._id_39B6 )
        return;

    var_0 = undefined;
    level._id_374B = "none";

    if ( level._id_91E4 )
    {
        if ( isdefined( level._id_511A ) )
            var_0 = "axis";
        else if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
            var_0 = "tie";
        else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        {
            level._id_374B = "axis";
            var_0 = "axis";
        }
        else
        {
            level._id_374B = "allies";
            var_0 = "allies";
        }

        logstring( "host ended game, win: " + var_0 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    }
    else
    {
        var_0 = _id_A78B::_id_3FC7();

        if ( isdefined( var_0 ) )
            logstring( "host ended game, win: " + var_0._id_02AB );
        else
            logstring( "host ended game, tie" );
    }

    level._id_39B6 = 1;
    level._id_4A2E = 1;

    if ( level._id_8A76 )
        var_1 = game["end_reason"]["ended_game"];
    else
        var_1 = game["end_reason"]["host_ended_game"];

    thread _id_315E( var_0, var_1 );
}

_id_64E3()
{
    var_0 = game["end_reason"]["score_limit_reached"];
    var_1 = undefined;
    level._id_374B = "none";

    if ( level._id_5FE9 )
    {
        var_1 = _id_A78B::_id_416C();

        if ( var_1 == "none" )
            var_1 = "tie";
    }
    else if ( level._id_91E4 )
    {
        if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
            var_1 = "tie";
        else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        {
            var_1 = "axis";
            level._id_374B = "axis";
        }
        else
        {
            var_1 = "allies";
            level._id_374B = "allies";
        }

        logstring( "scorelimit, win: " + var_1 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    }
    else
    {
        var_1 = _id_A78B::_id_3FC7();

        if ( isdefined( var_1 ) )
            logstring( "scorelimit, win: " + var_1._id_02AB );
        else
            logstring( "scorelimit, tie" );
    }

    thread _id_315E( var_1, var_0 );
    return 1;
}

_id_9B17()
{
    if ( _id_A75A::_id_59E0() && !level._id_4C6A && !getdvarint( "force_ranking" ) && ( !isdefined( level._id_2B10 ) || !level._id_2B10 ) )
    {
        if ( level._id_5FE9 )
        {
            var_0 = 0;
            var_1 = 0;

            for ( var_2 = 0; var_2 < level._id_91F0.size; var_2++ )
            {
                var_0 += level._id_91E6[level._id_91F0[var_2]];

                if ( level._id_91E6[level._id_91F0[var_2]] )
                    var_1 += 1;
            }

            for ( var_2 = 0; var_2 < level._id_91F0.size; var_2++ )
            {
                if ( var_0 == level._id_91E6[level._id_91F0[var_2]] && game["state"] == "playing" )
                {
                    thread _id_64AC( level._id_91F0[var_2] );
                    return;
                }
            }

            if ( var_1 > 1 )
            {
                level._id_39DD = undefined;
                level notify( "abort_forfeit" );
            }
        }
        else if ( level._id_91E4 )
        {
            if ( level._id_91E6["allies"] < 1 && level._id_91E6["axis"] > 0 && game["state"] == "playing" )
            {
                thread _id_64AC( "axis" );
                return;
            }

            if ( level._id_91E6["axis"] < 1 && level._id_91E6["allies"] > 0 && game["state"] == "playing" )
            {
                thread _id_64AC( "allies" );
                return;
            }

            if ( level._id_91E6["axis"] > 0 && level._id_91E6["allies"] > 0 )
            {
                level._id_39DD = undefined;
                level notify( "abort_forfeit" );
            }
        }
        else
        {
            if ( level._id_91E6["allies"] + level._id_91E6["axis"] == 1 && level._id_5A4A >= 1 && !getdvarint( "virtualLobbyActive", 0 ) )
            {
                thread _id_64AC();
                return;
            }

            if ( level._id_91E6["axis"] + level._id_91E6["allies"] > 1 )
            {
                level._id_39DD = undefined;
                level notify( "abort_forfeit" );
            }
        }
    }

    if ( !_id_A75A::_id_3FA8() && ( !isdefined( level._id_2B27 ) || !level._id_2B27 ) )
        return;

    if ( !_id_A75A::_id_3BE0() )
        return;

    if ( level._id_4C6A )
        return;

    if ( level._id_5FE9 )
        return;

    if ( level._id_91E4 )
    {
        var_3["allies"] = level._id_57B6["allies"];
        var_3["axis"] = level._id_57B6["axis"];

        if ( isdefined( level._id_2B27 ) && level._id_2B27 )
        {
            var_3["allies"] = 0;
            var_3["axis"] = 0;
        }

        if ( !level._id_09DD["allies"] && !level._id_09DD["axis"] && !var_3["allies"] && !var_3["axis"] )
            return [[ level._id_6463 ]]( "all" );

        if ( !level._id_09DD["allies"] && !var_3["allies"] )
            return [[ level._id_6463 ]]( "allies" );

        if ( !level._id_09DD["axis"] && !var_3["axis"] )
            return [[ level._id_6463 ]]( "axis" );

        var_4 = level._id_09DD["allies"] == 1 && !var_3["allies"];
        var_5 = level._id_09DD["axis"] == 1 && !var_3["axis"];

        if ( ( var_4 || var_5 ) && !isdefined( level._id_1702 ) )
        {
            var_6 = undefined;

            if ( var_4 && !isdefined( level._id_6488["allies"] ) )
            {
                level._id_6488["allies"] = gettime();
                var_7 = [[ level._id_64BD ]]( "allies" );

                if ( isdefined( var_7 ) )
                {
                    if ( !isdefined( var_6 ) )
                        var_6 = var_7;

                    var_6 = var_6 || var_7;
                }
            }

            if ( var_5 && !isdefined( level._id_6488["axis"] ) )
            {
                level._id_6488["axis"] = gettime();
                var_8 = [[ level._id_64BD ]]( "axis" );

                if ( isdefined( var_8 ) )
                {
                    if ( !isdefined( var_6 ) )
                        var_6 = var_8;

                    var_6 = var_6 || var_8;
                }
            }

            return var_6;
            return;
        }
    }
    else
    {
        if ( !level._id_09DD["allies"] && !level._id_09DD["axis"] && ( !level._id_57B6["allies"] && !level._id_57B6["axis"] ) )
            return [[ level._id_6463 ]]( "all" );

        var_9 = _id_A75A::_id_4091();

        if ( var_9.size == 1 )
            return [[ level._id_64BD ]]( "all" );
    }
}

_id_A0D1()
{
    if ( !isdefined( level._id_374B ) )
        return 0;

    level waittill( "final_killcam_done" );
    return 1;
}

_id_935E( var_0 )
{
    setgameendtime( gettime() + int( var_0 * 1000 ) );
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1 _meth_8054();

    if ( var_0 >= 10.0 )
        wait(var_0 - 10.0);

    for (;;)
    {
        var_1 _meth_809A( "ui_mp_timer_countdown" );
        wait 1.0;
    }
}

_id_A022( var_0 )
{
    var_1 = gettime();
    var_2 = var_1 + var_0 * 1000 - 200;

    if ( var_0 > 5 )
        var_3 = gettime() + getdvarint( "min_wait_for_players" ) * 1000;
    else
        var_3 = 0;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        var_4 = level._id_214B;
    else
        var_4 = level._id_214B / 3;

    var_5 = 0;

    for (;;)
    {
        if ( isdefined( game["roundsPlayed"] ) && game["roundsPlayed"] )
            break;

        var_6 = level._id_5A4A;
        var_7 = gettime();

        if ( var_6 >= var_4 && var_7 > var_3 || var_7 > var_2 )
            break;

        wait 0.05;
    }
}

_id_6F06()
{
    level endon( "game_ended" );
    level._id_214B = getdvarint( "party_partyPlayerCountNum" );

    if ( level._id_6F06 > 0 )
    {
        level._id_A03F = 1;
        _id_59ED();
        level._id_A03F = 0;
    }
    else
        _id_59EC();

    for ( var_0 = 0; var_0 < level._id_0328.size; var_0++ )
    {
        level._id_0328[var_0] _id_A75A::_id_3A30( 0 );
        level._id_0328[var_0] _meth_831E();
        level._id_0328[var_0] _meth_800C();
        var_1 = _id_A75A::_id_4058( level._id_0328[var_0]._id_030D["team"] );

        if ( !isdefined( var_1 ) || !level._id_0328[var_0]._id_4742 )
            continue;

        level._id_0328[var_0] thread _id_A79C::_id_4906( var_1 );
    }

    if ( game["state"] != "playing" )
        return;
}

_id_42F0()
{
    level endon( "game_ended" );

    if ( !isdefined( game["clientActive"] ) )
    {
        while ( _func_27D() == 0 )
            wait 0.05;

        game["clientActive"] = 1;
    }

    while ( level._id_4C6A > 0 )
    {
        wait 1.0;
        level._id_4C6A--;
    }

    level notify( "grace_period_ending" );
    wait 0.05;
    _id_A75A::_id_3BDE( "graceperiod_done" );
    level._id_4C6A = 0;

    if ( game["state"] != "playing" )
        return;

    level thread _id_9B17();
}

_id_7F7F( var_0, var_1 )
{
    var_0._id_4726 = var_1;
    var_0 notify( "hasDoneCombat" );
    var_2 = !isdefined( var_0._id_4725 ) || !var_0._id_4725;

    if ( var_2 && var_1 )
    {
        var_0._id_4725 = 1;
        var_0._id_030D["participation"] = 1;

        if ( isdefined( var_0._id_030D["hasMatchLoss"] ) && var_0._id_030D["hasMatchLoss"] )
            return;

        _id_9B28( var_0 );
    }
}

_id_9B9F( var_0 )
{
    if ( !var_0 _id_A75A::_id_7136() )
        return;

    if ( ( !isdefined( var_0._id_4725 ) || !var_0._id_4725 ) && !( level._id_01B5 == "infect" ) )
        return;

    var_0 _id_A7A4::_id_8D4A( "losses", -1 );
    var_0 _id_A7A4::_id_8D4A( "wins", 1 );
    var_0 _id_A75A::_id_9B3F( "winLossRatio", "wins", "losses" );
    var_0 _id_A7A4::_id_8D4A( "currentWinStreak", 1 );
    var_1 = var_0 _id_A7A4::_id_8D62( "currentWinStreak" );

    if ( var_1 > var_0 _id_A7A4::_id_8D62( "winStreak" ) )
        var_0 _id_A7A4::_id_8D72( "winStreak", var_1 );

    var_0 _id_A7A4::_id_8D74( "round", "win", 1 );
    var_0 _id_A7A4::_id_8D74( "round", "loss", 0 );
    var_0 _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_wins" );
    var_0._id_20B1 = 1;
    var_0 _id_A7A0::processchallengedaily( 25, undefined, undefined );
    var_0 _id_A7A0::processchallengedaily( 26, undefined, undefined );
    var_0 _id_A7A0::processchallengedaily( 27, undefined, undefined );
    var_0 _id_A7A0::processchallengedaily( 28, undefined, undefined );
    var_0 _id_A7A0::processchallengedaily( 29, undefined, undefined );
    var_0 _id_A7A0::processchallengedaily( 30, undefined, undefined );
    var_0 _id_A7A0::processchallengedaily( 36, undefined, undefined );
    var_0 _id_A7A0::processchallengedaily( 37, undefined, undefined );

    if ( _id_A75A::isgrapplinghookgamemode() )
        var_0 _id_A7A0::_id_6FF3( "ch_tier2_4_iw5_dlcgun12" );

    if ( level._id_0328.size > 5 )
    {
        _id_8FD8( var_0 );

        switch ( level._id_01B5 )
        {
            case "war":
                if ( game["teamScores"][var_0._id_04A8] >= game["teamScores"][_id_A75A::_id_4065( var_0._id_04A8 )] + 20 )
                    var_0 _id_A7A0::_id_6FF3( "ch_war_crushing" );

                break;
            case "hp":
                if ( game["teamScores"][var_0._id_04A8] >= game["teamScores"][_id_A75A::_id_4065( var_0._id_04A8 )] + 70 )
                    var_0 _id_A7A0::_id_6FF3( "ch_hp_crushing" );

                break;
            case "conf":
                if ( game["teamScores"][var_0._id_04A8] >= game["teamScores"][_id_A75A::_id_4065( var_0._id_04A8 )] + 15 )
                    var_0 _id_A7A0::_id_6FF3( "ch_conf_crushing" );

                break;
            case "ball":
                if ( game["teamScores"][var_0._id_04A8] >= game["teamScores"][_id_A75A::_id_4065( var_0._id_04A8 )] + 7 )
                    var_0 _id_A7A0::_id_6FF3( "ch_ball_crushing" );

                break;
            case "infect":
                if ( var_0._id_04A8 == "allies" )
                {
                    if ( game["teamScores"][var_0._id_04A8] >= 4 )
                        var_0 _id_A7A0::_id_6FF3( "ch_infect_crushing" );

                    if ( game["teamScores"][_id_A75A::_id_4065( var_0._id_04A8 )] == 1 )
                        var_0 _id_A7A0::_id_6FF3( "ch_infect_cleanup" );
                }

                break;
            case "dm":
                if ( isdefined( level._id_685E["all"][0] ) )
                {
                    var_2 = level._id_685E["all"][0];
                    var_3 = 9999;

                    if ( var_0 == var_2 )
                    {
                        foreach ( var_5 in level._id_0328 )
                        {
                            if ( var_0 == var_5 )
                                continue;

                            var_6 = var_0._id_0390 - var_5._id_0390;

                            if ( var_6 < var_3 )
                                var_3 = var_6;
                        }

                        if ( var_3 >= 7 )
                            var_0 _id_A7A0::_id_6FF3( "ch_dm_crushing" );
                    }
                }

                break;
            case "gun":
                foreach ( var_9 in level._id_0328 )
                {
                    if ( var_0 == var_9 )
                        continue;

                    if ( var_0._id_0390 < var_9._id_0390 + 5 )
                        break;
                }

                var_0 _id_A7A0::_id_6FF3( "ch_gun_crushing" );
                break;
            case "ctf":
            case "twar":
                if ( game["shut_out"][var_0._id_04A8] )
                    var_0 _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_crushing" );

                break;
        }
    }
}

_id_8FD8( var_0 )
{
    var_1 = 0;
    var_2 = 9999;

    foreach ( var_4 in level._id_0328 )
    {
        if ( var_4._id_023C > var_1 )
            var_1 = var_4._id_023C;

        if ( var_4._id_010E < var_2 )
            var_2 = var_4._id_010E;
    }

    if ( var_0._id_023C >= var_1 && var_0._id_010E <= var_2 && var_0._id_023C > 0 && !isai( var_0 ) )
        var_0 _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_star" );
}

_id_1D07()
{
    if ( level._id_01B5 == "dom" )
    {
        foreach ( var_1 in level._id_2CF8 )
        {
            if ( !isdefined( var_1._id_662E ) || !var_1._id_662E )
                continue;

            var_2 = var_1 _id_A78A::_id_4076();

            foreach ( var_4 in level._id_0328 )
            {
                if ( var_4._id_04A8 != var_2 )
                    continue;

                switch ( var_1._id_0245 )
                {
                    case "_a":
                        var_4 _id_A7A0::_id_6FF3( "ch_dom_alphalock" );
                        continue;
                    case "_b":
                        var_4 _id_A7A0::_id_6FF3( "ch_dom_bravolock" );
                        continue;
                    case "_c":
                        var_4 _id_A7A0::_id_6FF3( "ch_dom_charlielock" );
                        continue;
                }
            }
        }
    }
}

_id_9B28( var_0 )
{
    if ( !var_0 _id_A75A::_id_7136() )
        return;

    if ( !isdefined( var_0._id_4725 ) || !var_0._id_4725 )
        return;

    var_0._id_030D["hasMatchLoss"] = 1;
    var_0 _id_A7A4::_id_8D4A( "losses", 1 );
    var_0 _id_A75A::_id_9B3F( "winLossRatio", "wins", "losses" );
    var_0 _id_A7A4::_id_8D74( "round", "loss", 1 );
}

_id_9B81( var_0 )
{
    if ( !var_0 _id_A75A::_id_7136() )
        return;

    if ( !isdefined( var_0._id_4725 ) || !var_0._id_4725 )
        return;

    var_0 _id_A7A4::_id_8D4A( "losses", -1 );
    var_0 _id_A7A4::_id_8D4A( "ties", 1 );
    var_0 _id_A75A::_id_9B3F( "winLossRatio", "wins", "losses" );
    var_0 _id_A7A4::_id_8D72( "currentWinStreak", 0 );
    var_0._id_20B0 = 1;
}

_id_9B9E( var_0 )
{
    if ( _id_A75A::_id_6FCD() )
        return;

    if ( _id_A75A::_id_6E98() )
        return;

    if ( !isdefined( var_0 ) || isdefined( var_0 ) && isstring( var_0 ) && var_0 == "tie" )
    {
        foreach ( var_2 in level._id_0328 )
        {
            if ( isdefined( var_2._id_214A ) )
                continue;

            if ( level._id_4A2E && var_2 _meth_829C() )
            {
                var_2 _id_A7A4::_id_8D72( "currentWinStreak", 0 );
                continue;
            }

            _id_9B81( var_2 );
        }
    }
    else if ( isplayer( var_0 ) )
    {
        var_4[0] = var_0;

        if ( level._id_0328.size > 5 )
            var_4 = _id_A78B::_id_3FC8( 3 );

        foreach ( var_2 in var_4 )
        {
            if ( isdefined( var_2._id_214A ) )
                continue;

            if ( level._id_4A2E && var_2 _meth_829C() )
            {
                var_2 _id_A7A4::_id_8D72( "currentWinStreak", 0 );
                continue;
            }

            _id_9B9F( var_2 );
        }
    }
    else if ( isstring( var_0 ) )
    {
        foreach ( var_2 in level._id_0328 )
        {
            if ( isdefined( var_2._id_214A ) )
                continue;

            if ( level._id_4A2E && var_2 _meth_829C() )
            {
                var_2 _id_A7A4::_id_8D72( "currentWinStreak", 0 );
                continue;
            }

            if ( var_0 == "tie" )
            {
                _id_9B81( var_2 );
                continue;
            }

            if ( var_2._id_030D["team"] == var_0 )
            {
                _id_9B9F( var_2 );
                continue;
            }

            var_2 _id_A7A4::_id_8D72( "currentWinStreak", 0 );
        }
    }

    if ( level._id_0328.size > 5 )
    {
        var_4 = _id_A78B::_id_3FC8( 3 );

        for ( var_9 = 0; var_9 < var_4.size; var_9++ )
        {
            if ( var_9 == 0 )
                var_4[var_9] _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_mvp" );

            var_4[var_9] _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_superior" );
        }
    }
}

_id_3A33( var_0 )
{
    self endon( "disconnect" );
    _id_A75A::_id_1EF6();

    if ( !isdefined( var_0 ) )
        var_0 = 0.05;

    self _meth_8325();
    self _meth_826C();
    wait(var_0);
    _id_A75A::_id_3A30( 1 );
}

_id_9B2C( var_0 )
{
    if ( !game["timePassed"] )
        return;

    if ( !_id_A75A::_id_59E0() )
        return;

    if ( _id_A75A::_id_6E98() )
        return;

    if ( level._id_91E4 )
    {
        if ( var_0 == "allies" )
        {
            var_1 = "allies";
            var_2 = "axis";
        }
        else if ( var_0 == "axis" )
        {
            var_1 = "axis";
            var_2 = "allies";
        }
        else
        {
            var_1 = "tie";
            var_2 = "tie";
        }

        if ( var_1 != "tie" )
            clientannouncement( var_1 );

        foreach ( var_4 in level._id_0328 )
        {
            if ( isdefined( var_4._id_214A ) )
                continue;

            if ( !var_4 _id_A75A::_id_7136() )
                continue;

            if ( var_4._id_936B["total"] < 1 || var_4._id_030D["participation"] < 1 )
                continue;

            if ( level._id_4A2E && var_4 _meth_829C() )
                continue;

            var_5 = 0;

            if ( var_1 == "tie" )
            {
                var_5 = _id_A7AA::_id_40BF( "tie" );
                var_4._id_2A4E = 1;
                var_4._id_5207 = 0;
            }
            else if ( isdefined( var_4._id_030D["team"] ) && var_4._id_030D["team"] == var_1 )
            {
                var_5 = _id_A7AA::_id_40BF( "win" );
                var_4._id_5207 = 1;
            }
            else if ( isdefined( var_4._id_030D["team"] ) && var_4._id_030D["team"] == var_2 )
            {
                var_5 = _id_A7AA::_id_40BF( "loss" );
                var_4._id_5207 = 0;
            }

            var_4._id_59DC = int( var_5 );
        }
    }
    else
    {
        foreach ( var_4 in level._id_0328 )
        {
            if ( isdefined( var_4._id_214A ) )
                continue;

            if ( !var_4 _id_A75A::_id_7136() )
                continue;

            if ( var_4._id_936B["total"] < 1 || var_4._id_030D["participation"] < 1 )
                continue;

            if ( level._id_4A2E && var_4 _meth_829C() )
                continue;

            var_4._id_5207 = 0;

            for ( var_8 = 0; var_8 < min( level._id_685E["all"].size, 3 ); var_8++ )
            {
                if ( level._id_685E["all"][var_8] != var_4 )
                    continue;

                var_4._id_5207 = 1;
            }

            var_5 = 0;

            if ( var_4._id_5207 )
                var_5 = _id_A7AA::_id_40BF( "win" );
            else
                var_5 = _id_A7AA::_id_40BF( "loss" );

            var_4._id_59DC = int( var_5 );
        }
    }

    foreach ( var_4 in level._id_0328 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( var_4._id_5207 ) )
            continue;

        var_11 = "loss";

        if ( var_4._id_5207 )
            var_11 = "win";

        if ( isdefined( var_4._id_2A4E ) && var_4._id_2A4E )
            var_11 = "tie";

        var_4 thread _id_41EF( var_11, var_4._id_59DC );
    }
}

_id_41EF( var_0, var_1 )
{
    self endon( "disconnect" );
    level waittill( "give_match_bonus" );
    _id_A7AA::_id_41FC( var_0, var_1 );
    _id_A75A::_id_584A();
}

_id_8353( var_0 )
{
    var_1 = level._id_0328;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3._id_0390 ) || !isdefined( var_3._id_030D["team"] ) )
            continue;
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3._id_0390 ) || !isdefined( var_3._id_030D["team"] ) )
            continue;

        var_4 = var_3._id_0390;

        if ( _id_A75A::_id_4022() )
            var_4 = var_3._id_0390 / _id_A75A::_id_4022();

        _func_173( var_3, var_3._id_1F0F, int( var_4 ) );
    }
}

_id_1D20( var_0 )
{
    if ( isdefined( level._id_935F ) && level._id_935F )
        return;

    if ( game["state"] != "playing" )
    {
        setgameendtime( 0 );
        return;
    }

    if ( _id_A75A::_id_4129() <= 0 )
    {
        if ( isdefined( level._id_8D3B ) )
            setgameendtime( level._id_8D3B );
        else
            setgameendtime( 0 );

        return;
    }

    if ( !_id_A75A::_id_3BDB( "prematch_done" ) )
    {
        setgameendtime( 0 );
        return;
    }

    if ( !isdefined( level._id_8D3B ) )
        return;

    if ( _id_A75A::_id_412E() > level._id_936A )
        _func_260( 1 );

    var_1 = _id_412F();

    if ( _id_A75A::_id_3FBE() && game["status"] != "halftime" )
        setgameendtime( gettime() + int( var_1 ) - int( _id_A75A::_id_4129() * 60 * 1000 * 0.5 ) );
    else
        setgameendtime( gettime() + int( var_1 ) );

    if ( var_1 > 0 )
    {
        if ( _id_A75A::_id_3FBE() && _id_1D0A( var_0 ) )
            [[ level._id_64AF ]]( "time_limit_reached" );

        return;
    }

    [[ level._id_64ED ]]();
}

_id_1D0B()
{
    if ( !level._id_44FA )
        return 0;

    if ( !level._id_91E4 )
        return 0;

    if ( game["status"] != "normal" )
        return 0;

    var_0 = _id_A75A::_id_415B( "scorelimit" );

    if ( var_0 )
    {
        if ( game["teamScores"]["allies"] >= var_0 || game["teamScores"]["axis"] >= var_0 )
            return 0;

        var_1 = int( var_0 / 2 + 0.5 );

        if ( game["teamScores"]["allies"] >= var_1 || game["teamScores"]["axis"] >= var_1 )
        {
            game["roundMillisecondsAlreadyPassed"] = _id_A75A::_id_412A();
            game["round_time_to_beat"] = _id_A75A::_id_4022();
            return 1;
        }
    }

    return 0;
}

_id_1D0A( var_0 )
{
    if ( !level._id_91E4 )
        return 0;

    if ( game["status"] != "normal" )
        return 0;

    if ( _id_A75A::_id_4129() )
    {
        var_1 = _id_A75A::_id_4129() * 60 * 1000 * 0.5;

        if ( _id_A75A::_id_412A() >= var_1 && var_0 < var_1 && var_0 > 0 )
        {
            game["roundMillisecondsAlreadyPassed"] = _id_A75A::_id_412A();
            return 1;
        }
    }

    return 0;
}

_id_412F()
{
    var_0 = _id_A75A::_id_412A();
    var_1 = _id_A75A::_id_4129() * 60 * 1000;

    if ( _id_A75A::_id_3FBE() && game["status"] == "halftime" && isdefined( level._id_381A ) )
    {
        var_2 = var_1 * 0.5;

        if ( level._id_381A < var_2 )
        {
            if ( level._id_44FA )
                var_0 = var_1 - level._id_381A + var_0 - level._id_381A;
            else
                var_0 += var_2 - level._id_381A;
        }
    }

    return var_1 - var_0;
}

_id_1D1F( var_0 )
{
    if ( _id_A75A::_id_415B( "scorelimit" ) <= 0 || _id_A75A::_id_515D() )
        return;

    if ( isdefined( level._id_789E ) && level._id_789E )
        return;

    if ( level._id_01B5 == "conf" )
        return;

    if ( !level._id_91E4 )
        return;

    if ( _id_A75A::_id_412A() < 60000 )
        return;

    var_1 = _id_3387( var_0 );

    if ( var_1 < 2 )
        level notify( "match_ending_soon", "score" );
}

_id_1D16()
{
    if ( _id_A75A::_id_415B( "scorelimit" ) <= 0 || _id_A75A::_id_515D() )
        return;

    if ( level._id_91E4 )
        return;

    if ( _id_A75A::_id_412A() < 60000 )
        return;

    var_0 = _id_3387();

    if ( var_0 < 2 )
        level notify( "match_ending_soon", "score" );
}

_id_1D1A()
{
    if ( _id_A75A::_id_515D() )
        return 0;

    if ( isdefined( level._id_789E ) && level._id_789E )
        return 0;

    if ( game["state"] != "playing" )
        return 0;

    if ( _id_A75A::_id_415B( "scorelimit" ) <= 0 )
        return 0;

    if ( _id_A75A::_id_3FBE() && _id_1D0B() )
        return [[ level._id_64AF ]]( "score_limit_reached" );
    else if ( level._id_5FE9 )
    {
        var_0 = 0;

        for ( var_1 = 0; var_1 < level._id_91F0.size; var_1++ )
        {
            if ( game["teamScores"][level._id_91F0[var_1]] >= _id_A75A::_id_415B( "scorelimit" ) )
                var_0 = 1;
        }

        if ( !var_0 )
            return 0;
    }
    else if ( level._id_91E4 )
    {
        if ( game["teamScores"]["allies"] < _id_A75A::_id_415B( "scorelimit" ) && game["teamScores"]["axis"] < _id_A75A::_id_415B( "scorelimit" ) )
            return 0;
    }
    else
    {
        if ( !isplayer( self ) )
            return 0;

        if ( self._id_0390 < _id_A75A::_id_415B( "scorelimit" ) )
            return 0;
    }

    return _id_64E3();
}

_id_9B1A()
{
    level endon( "game_ended" );

    while ( game["state"] == "playing" )
    {
        if ( isdefined( level._id_8D3B ) )
        {
            if ( _id_412F() < 3000 )
            {
                wait 0.1;
                continue;
            }
        }

        wait 1;
    }
}

_id_59ED()
{
    setomnvar( "ui_match_countdown_title", 6 );
    setomnvar( "ui_match_countdown_toggle", 0 );

    if ( level._id_00E4 )
        setomnvar( "ui_cg_world_blur", 1 );

    _id_A022( level._id_6F06 );

    if ( level._id_6F07 > 0 && !isdefined( level._id_4A36 ) )
        _id_59EA( level._id_6F07 );
}

_id_59EB( var_0 )
{
    waitframe;
    level endon( "match_start_timer_beginning" );
    setomnvar( "ui_match_countdown_title", 1 );
    setomnvar( "ui_match_countdown_toggle", 1 );

    while ( var_0 > 0 && !level._id_3BD8 )
    {
        setomnvar( "ui_match_countdown", var_0 );
        var_0--;

        if ( level._id_00E4 )
            setomnvar( "ui_cg_world_blur", 1 );

        wait 1;
    }

    if ( level._id_00E4 )
        setomnvar( "ui_cg_world_blur_fade_out", 1 );

    if ( level._id_A3A1 > 1 && !( isdefined( level._id_511A ) && level._id_511A ) && !_id_A75A::_id_6FCD() && !_id_A75A::_id_6E98() && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
    {
        foreach ( var_2 in level._id_0328 )
            var_2 thread _id_A79C::_id_8A62( "double_xp" );
    }

    setomnvar( "ui_match_countdown_toggle", 0 );
    setomnvar( "ui_match_countdown", 0 );
    setomnvar( "ui_match_countdown_title", 2 );
    level endon( "match_forfeit_timer_beginning" );
    wait 1.5;
    setomnvar( "ui_match_countdown_title", 0 );
}

_id_59EA( var_0 )
{
    self notify( "matchStartTimer" );
    self endon( "matchStartTimer" );
    level notify( "match_start_timer_beginning" );
    var_1 = int( var_0 );

    if ( var_1 >= 2 )
    {
        _id_59EB( var_1 );
        visionsetnaked( "", 3.0 );
    }
    else
    {
        if ( level._id_00E4 )
            setomnvar( "ui_cg_world_blur_fade_out", 1 );

        if ( level._id_A3A1 > 1 && !( isdefined( level._id_511A ) && level._id_511A ) && !_id_A75A::_id_6FCD() && !_id_A75A::_id_6E98() && !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
        {
            foreach ( var_3 in level._id_0328 )
                var_3 thread _id_A79C::_id_8A62( "double_xp" );
        }

        visionsetnaked( "", 1.0 );
    }
}

_id_59EC()
{
    visionsetnaked( "", 0 );
}

_id_64E1()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["roundsWon"]["allies"] == _id_A75A::_id_415B( "winlimit" ) - 1 && game["roundsWon"]["axis"] == _id_A75A::_id_415B( "winlimit" ) - 1 )
    {
        var_0 = _id_3F18();

        if ( var_0 != game["defenders"] )
            game["switchedsides"] = !game["switchedsides"];

        level._id_44FC = "overtime";
        game["dynamicEvent_Overtime"] = 1;
    }
    else
    {
        level._id_44FC = "halftime";
        game["switchedsides"] = !game["switchedsides"];
    }
}

_id_1D18()
{
    if ( !level._id_91E4 )
        return 0;

    if ( !isdefined( level._id_7657 ) || !level._id_7657 )
        return 0;

    if ( game["roundsPlayed"] % level._id_7657 == 0 )
    {
        _id_64E1();
        return 1;
    }

    return 0;
}

_id_937A()
{
    if ( level._id_3BD8 )
    {
        var_0 = ( gettime() - level._id_3BDA ) / 1000;
        var_1 = level._id_6E89 - var_0;

        if ( var_1 < 0 )
            return 0;

        return var_1;
    }

    if ( _id_A75A::_id_4129() <= 0 )
        return undefined;

    if ( !isdefined( level._id_8D3B ) )
        return undefined;

    var_2 = _id_A75A::_id_4129();
    var_0 = ( gettime() - level._id_8D3B ) / 1000;
    var_1 = _id_A75A::_id_4129() * 60 - var_0;

    if ( isdefined( level._id_9369 ) )
        var_1 += level._id_9369;

    return var_1 + level._id_6E89;
}

_id_3A26()
{
    if ( isdefined( self._id_67CB ) )
    {
        if ( isdefined( self._id_67CB[0] ) )
        {
            self._id_67CB[0] _id_A79D::_id_28E8();
            self._id_67CC[0] _id_A79D::_id_28E8();
        }

        if ( isdefined( self._id_67CB[1] ) )
        {
            self._id_67CB[1] _id_A79D::_id_28E8();
            self._id_67CC[1] _id_A79D::_id_28E8();
        }

        if ( isdefined( self._id_67CB[2] ) )
        {
            self._id_67CB[2] _id_A79D::_id_28E8();
            self._id_67CC[2] _id_A79D::_id_28E8();
        }
    }

    self notify( "perks_hidden" );
    self._id_58A1 _id_A79D::_id_28E8();
    self._id_58A8 _id_A79D::_id_28E8();

    if ( isdefined( self._id_703E ) )
        self._id_703E _id_A79D::_id_28E8();

    if ( isdefined( self._id_703F ) )
        self._id_703F _id_A79D::_id_28E8();
}

_id_3FCD()
{
    var_0 = getentarray( "player", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] _meth_829C() )
            return var_0[var_1];
    }
}

_id_4A2F()
{
    var_0 = _id_3FCD();

    if ( isdefined( var_0 ) && !var_0._id_4742 && !isdefined( var_0._id_7C62 ) )
        return 1;

    return 0;
}

_id_7652( var_0, var_1 )
{
    foreach ( var_3 in level._id_0328 )
        var_3 _id_A783::streamfinalkillcam();

    var_5 = 0;

    while ( !var_5 )
    {
        var_6 = level._id_0328;
        var_5 = 1;

        foreach ( var_3 in var_6 )
        {
            if ( !isdefined( var_3._id_2CE8 ) )
                continue;

            if ( !var_3 _id_A79C::_id_50F2() )
                continue;

            var_5 = 0;
        }

        wait 0.5;
    }

    if ( !var_1 )
    {
        wait(var_0);
        var_6 = level._id_0328;

        foreach ( var_3 in var_6 )
            var_3 _meth_82FB( "ui_round_end", 0 );

        level notify( "round_end_finished" );
        return;
    }

    wait(var_0 / 2);
    level notify( "give_match_bonus" );
    wait(var_0 / 2);
    var_5 = 0;

    while ( !var_5 )
    {
        var_6 = level._id_0328;
        var_5 = 1;

        foreach ( var_3 in var_6 )
        {
            if ( !isdefined( var_3._id_2CE8 ) )
                continue;

            if ( !var_3 _id_A79C::_id_50F2() )
                continue;

            var_5 = 0;
        }

        wait 0.5;
    }

    var_6 = level._id_0328;

    foreach ( var_3 in var_6 )
        var_3 _meth_82FB( "ui_round_end", 0 );

    level notify( "round_end_finished" );
}

_id_7651( var_0 )
{
    self _meth_8186( 0, 128, 512, 4000, 6, 1.8 );
}

_id_19F9()
{
    _id_A742::main();
    _id_A75A::_id_56D8( "round_over", 0 );
    _id_A75A::_id_56D8( "game_over", 0 );
    _id_A75A::_id_56D8( "block_notifies", 0 );
    level._id_6F06 = 0;
    level._id_6F07 = 0;
    level._id_6E86 = 0;
    level._id_020C = 0;
    setdvar( "bg_compassShowEnemies", getdvar( "scr_game_forceuav" ) );

    if ( !isdefined( game["gamestarted"] ) )
    {
        game["clientid"] = 0;
        var_0 = getmapcustom( "allieschar" );

        if ( !isdefined( var_0 ) || var_0 == "" )
        {
            if ( !isdefined( game["allies"] ) )
                var_0 = "sentinel";
            else
                var_0 = game["allies"];
        }

        var_1 = getmapcustom( "axischar" );

        if ( !isdefined( var_1 ) || var_1 == "" )
        {
            if ( !isdefined( game["axis"] ) )
                var_1 = "atlas";
            else
                var_1 = game["axis"];
        }

        if ( level._id_5FE9 )
        {
            var_2 = getmapcustom( "allieschar" );

            if ( !isdefined( var_2 ) || var_2 == "" )
                var_2 = "delta_multicam";

            for ( var_3 = 0; var_3 < level._id_91F0.size; var_3++ )
                game[level._id_91F0[var_3]] = var_2;
        }

        game["allies"] = var_0;
        game["axis"] = var_1;

        if ( !isdefined( game["attackers"] ) || !isdefined( game["defenders"] ) )
            thread _id_A4F0::_id_334D( "No attackers or defenders team defined in level .gsc." );

        if ( !isdefined( game["attackers"] ) )
            game["attackers"] = "allies";

        if ( !isdefined( game["defenders"] ) )
            game["defenders"] = "axis";

        if ( !isdefined( game["state"] ) )
            game["state"] = "playing";

        if ( level._id_91E4 )
        {
            game["strings"]["waiting_for_teams"] = &"MP_WAITING_FOR_TEAMS";
            game["strings"]["opponent_forfeiting_in"] = &"MP_OPPONENT_FORFEITING_IN";
        }
        else
        {
            game["strings"]["waiting_for_teams"] = &"MP_WAITING_FOR_MORE_PLAYERS";
            game["strings"]["opponent_forfeiting_in"] = &"MP_OPPONENT_FORFEITING_IN";
        }

        game["strings"]["press_to_spawn"] = &"PLATFORM_PRESS_TO_SPAWN";
        game["strings"]["match_starting_in"] = &"MP_MATCH_STARTING_IN";
        game["strings"]["match_resuming_in"] = &"MP_MATCH_RESUMING_IN";
        game["strings"]["waiting_for_players"] = &"MP_WAITING_FOR_PLAYERS";
        game["strings"]["spawn_tag_wait"] = &"MP_SPAWN_TAG_WAIT";
        game["strings"]["spawn_next_round"] = &"MP_SPAWN_NEXT_ROUND";
        game["strings"]["waiting_to_spawn"] = &"MP_WAITING_TO_SPAWN";
        game["strings"]["match_starting"] = &"MP_MATCH_STARTING";
        game["strings"]["change_class"] = &"MP_CHANGE_CLASS_NEXT_SPAWN";
        game["strings"]["change_class_cancel"] = &"MP_CHANGE_CLASS_CANCEL";
        game["strings"]["change_class_wait"] = &"MP_CHANGE_CLASS_WAIT";
        game["strings"]["last_stand"] = &"MPUI_LAST_STAND";
        game["strings"]["final_stand"] = &"MPUI_FINAL_STAND";
        game["strings"]["cowards_way"] = &"PLATFORM_COWARDS_WAY_OUT";
        game["colors"]["blue"] = ( 0.25, 0.25, 0.75 );
        game["colors"]["red"] = ( 0.75, 0.25, 0.25 );
        game["colors"]["white"] = ( 1, 1, 1 );
        game["colors"]["black"] = ( 0, 0, 0 );
        game["colors"]["grey"] = ( 0.5, 0.5, 0.5 );
        game["colors"]["green"] = ( 0.25, 0.75, 0.25 );
        game["colors"]["yellow"] = ( 0.65, 0.65, 0 );
        game["colors"]["orange"] = ( 1, 0.45, 0 );
        game["colors"]["cyan"] = ( 0.35, 0.7, 0.9 );
        game["strings"]["allies_name"] = _id_A7B2::_id_4119( "allies" );
        game["icons"]["allies"] = _id_A7B2::_id_4116( "allies" );
        game["colors"]["allies"] = _id_A7B2::_id_4109( "allies" );
        game["strings"]["axis_name"] = _id_A7B2::_id_4119( "axis" );
        game["icons"]["axis"] = _id_A7B2::_id_4116( "axis" );
        game["colors"]["axis"] = _id_A7B2::_id_4109( "axis" );

        if ( game["colors"]["allies"] == ( 0, 0, 0 ) )
            game["colors"]["allies"] = ( 0.5, 0.5, 0.5 );

        if ( game["colors"]["axis"] == ( 0, 0, 0 ) )
            game["colors"]["axis"] = ( 0.5, 0.5, 0.5 );

        [[ level._id_64D7 ]]();
        setdvarifuninitialized( "min_wait_for_players", 5 );

        if ( level._id_2153 )
        {
            if ( !level._id_8A76 )
            {
                if ( _func_27A() )
                    level._id_6F06 = _id_A7B3::_id_413F( "game", "graceperiod_ds" );
                else
                    level._id_6F06 = _id_A7B3::_id_413F( "game", "graceperiod" );

                level._id_6F07 = _id_A7B3::_id_413F( "game", "matchstarttime" );
            }
        }
        else
        {
            if ( _func_27A() )
                level._id_6F06 = _id_A7B3::_id_413F( "game", "playerwaittime_ds" );
            else
                level._id_6F06 = _id_A7B3::_id_413F( "game", "playerwaittime" );

            level._id_6F07 = _id_A7B3::_id_413F( "game", "matchstarttime" );
        }
    }
    else
    {
        setdvarifuninitialized( "min_wait_for_players", 5 );

        if ( level._id_2153 )
        {
            if ( !level._id_8A76 )
            {
                level._id_6F06 = 5;
                level._id_6F07 = _id_A7B3::_id_413F( "game", "roundstarttime" );
            }
        }
        else
        {
            level._id_6F06 = 5;
            level._id_6F07 = _id_A7B3::_id_413F( "game", "roundstarttime" );
        }
    }

    if ( !isdefined( game["status"] ) )
        game["status"] = "normal";

    if ( game["status"] != "overtime" && game["status"] != "halftime" && game["status"] != "overtime_halftime" )
    {
        game["teamScores"]["allies"] = 0;
        game["teamScores"]["axis"] = 0;

        if ( level._id_5FE9 )
        {
            for ( var_3 = 0; var_3 < level._id_91F0.size; var_3++ )
                game["teamScores"][level._id_91F0[var_3]] = 0;
        }
    }

    if ( !isdefined( game["timePassed"] ) )
        game["timePassed"] = 0;

    if ( !isdefined( game["roundsPlayed"] ) )
        game["roundsPlayed"] = 0;

    setomnvar( "ui_current_round", game["roundsPlayed"] + 1 );

    if ( !isdefined( game["roundsWon"] ) )
        game["roundsWon"] = [];

    if ( level._id_91E4 )
    {
        if ( !isdefined( game["roundsWon"]["axis"] ) )
            game["roundsWon"]["axis"] = 0;

        if ( !isdefined( game["roundsWon"]["allies"] ) )
            game["roundsWon"]["allies"] = 0;

        if ( level._id_5FE9 )
        {
            for ( var_3 = 0; var_3 < level._id_91F0.size; var_3++ )
            {
                if ( !isdefined( game["roundsWon"][level._id_91F0[var_3]] ) )
                    game["roundsWon"][level._id_91F0[var_3]] = 0;
            }
        }
    }

    level._id_3BD8 = 0;
    level._id_39B6 = 0;
    level._id_4A2E = 0;
    level._id_46C7 = getdvarint( "g_hardcore" );

    if ( level._id_46C7 )
        logstring( "game mode: hardcore" );

    level._id_2A54 = getdvarint( "scr_diehard" );

    if ( !level._id_91E4 )
        level._id_2A54 = 0;

    if ( level._id_2A54 )
        logstring( "game mode: diehard" );

    level._id_539E = getdvarint( "scr_game_hardpoints" );

    if ( !isdefined( level.iszombiegame ) )
        level.iszombiegame = 0;

    level._id_9C0C = 1;
    level._id_62FE = 1;
    level._id_1317 = 1;
    level._id_5A1F = 2;
    thread _id_A755::main();
    thread _id_A7A4::_id_0209();
    thread _id_A79F::_id_0209();
    thread _id_A79B::_id_0209();
    thread _id_A7AC::_id_0209();
    thread _id_A7B2::_id_0209();
    thread _id_A7B4::_id_0209();
    thread _id_A79E::_id_0209();
    thread _id_A7AD::_id_0209();
    thread _id_A785::_id_0209();
    thread _id_A784::_id_0209();
    thread _id_A78F::_id_0209();
    thread _id_A7B1::_id_0209();
    thread _id_A7A2::_id_0209();
    thread _id_A78A::_id_0209();
    thread _id_A7AF::_id_0209();
    thread _id_A780::_id_0209();
    thread _id_A7A1::_id_0209();
    thread _id_A790::_id_0209();
    thread maps\mp\_grappling_hook::_id_0209();
    thread _id_A744::_id_0209();
    thread _id_A725::_id_0209();
    thread _id_A722::_id_0209();

    if ( !_id_A75A::_id_4FA3() )
        thread _id_A7C4::_id_0209();

    thread _id_A7DC::_id_0209();
    thread _id_A72E::_id_0209();
    thread _id_A783::_id_4DBB();
    thread _id_A756::_id_0209();
    thread _id_A736::_id_0209();
    thread _id_A74C::_id_0209();
    thread _id_A750::_id_0209();
    thread _id_A75A::_id_1876();

    if ( level._id_91E4 )
        thread _id_A788::_id_0209();

    thread _id_A79C::_id_0209();
    thread maps\mp\gametypes\_divisions::_id_0209();

    foreach ( var_5 in game["strings"] )
        precachestring( var_5 );

    foreach ( var_8 in game["icons"] )
        precacheshader( var_8 );

    game["gamestarted"] = 1;
    level._id_5A4A = 0;
    level._id_A2A2["allies"] = 0;
    level._id_A2A2["axis"] = 0;
    level._id_560B["allies"] = 0;
    level._id_560B["axis"] = 0;
    level._id_A2A4["allies"] = 0;
    level._id_A2A4["axis"] = 0;
    level._id_09DE["allies"] = [];
    level._id_09DE["axis"] = [];
    level._id_0722 = [];

    if ( level._id_5FE9 )
    {
        for ( var_3 = 0; var_3 < level._id_91F0.size; var_3++ )
        {
            level._id_0699[level._id_91F0[var_3]] = 0;
            level._id_05DC[level._id_91F0[var_3]] = 0;
            level._id_069A[level._id_91F0[var_3]] = 0;
            level._id_054C[level._id_91F0[var_3]] = [];
        }
    }

    setdvar( "ui_scorelimit", 0 );
    setdvar( "ui_allow_teamchange", 1 );

    if ( _id_A75A::_id_3FA8() )
        setdvar( "g_deadChat", 0 );
    else
        setdvar( "g_deadChat", 1 );

    var_10 = getdvarfloat( "scr_" + level._id_01B5 + "_waverespawndelay" );

    if ( var_10 > 0 )
    {
        level._id_A2A2["allies"] = var_10;
        level._id_A2A2["axis"] = var_10;
        level._id_560B["allies"] = 0;
        level._id_560B["axis"] = 0;

        if ( level._id_5FE9 )
        {
            for ( var_3 = 0; var_3 < level._id_91F0.size; var_3++ )
            {
                level._id_0699[level._id_91F0[var_3]] = var_10;
                level._id_05DC[level._id_91F0[var_3]] = 0;
            }
        }

        level thread _id_A2A7();
    }

    _id_A75A::_id_3BDD( "prematch_done", 0 );
    level._id_42F0 = 15;
    level._id_4C6A = level._id_42F0;
    _id_A75A::_id_3BDD( "graceperiod_done", 0 );
    level._id_7650 = 4;
    level._id_44FB = 4;
    level._id_6157 = getentarray( "noragdoll", "targetname" );

    if ( level._id_91E4 )
    {
        _id_A78B::_id_9B7C( "axis" );
        _id_A78B::_id_9B7C( "allies" );

        if ( level._id_5FE9 )
        {
            for ( var_3 = 0; var_3 < level._id_91F0.size; var_3++ )
                _id_A78B::_id_9B7C( level._id_91F0[var_3] );
        }
    }
    else
        thread _id_A78B::_id_4DD2();

    thread _id_9B8D();
    level notify( "update_scorelimit" );
    [[ level._id_64E9 ]]();
    level._id_789F = getdvarint( "scr_" + level._id_01B5 + "_score_percentage_cut_off", 80 );
    level._id_936A = getdvarint( "scr_" + level._id_01B5 + "_time_percentage_cut_off", 80 );

    if ( !level._id_2153 && ( getdvar( "dedicated" ) == "dedicated LAN server" || getdvar( "dedicated" ) == "dedicated internet server" ) )
        thread _id_9D82();

    _id_7F24();
    thread _id_8D13();
    level thread _id_A75A::_id_9B9B();
    level thread _id_9360();
    level thread _id_A783::_id_2C7B();
}

_id_7F24()
{
    if ( game["attackers"] == "axis" )
        var_0 = 1;
    else if ( game["attackers"] == "allies" )
        var_0 = 2;
    else
        var_0 = 0;

    setomnvar( "ui_attacking_team", var_0 );
}

_id_19EC()
{
    _func_174();

    if ( !level._id_3BD8 )
        level thread _id_39BA();
}

_id_9D82()
{
    for (;;)
    {
        if ( level._id_7134 )
            exitlevel( 0 );

        if ( !getdvarint( "xblive_privatematch" ) )
            exitlevel( 0 );

        if ( getdvar( "dedicated" ) != "dedicated LAN server" && getdvar( "dedicated" ) != "dedicated internet server" )
            exitlevel( 0 );

        wait 5;
    }
}

_id_9360()
{
    level endon( "game_ended" );
    var_0 = _id_A75A::_id_412A();

    while ( game["state"] == "playing" )
    {
        thread _id_1D20( var_0 );
        var_0 = _id_A75A::_id_412A();

        if ( isdefined( level._id_8D3B ) )
        {
            if ( _id_412F() < 3000 )
            {
                wait 0.1;
                continue;
            }
        }

        wait 1;
    }
}

_id_9B8D()
{
    for (;;)
    {
        level _id_A4F0::_id_A07E( "update_scorelimit", "update_winlimit" );

        if ( !_id_A75A::_id_5191() || !_id_A75A::_id_515D() )
        {
            setdvar( "ui_scorelimit", _id_A75A::_id_415B( "scorelimit" ) );
            thread _id_1D1A();
            continue;
        }

        setdvar( "ui_scorelimit", _id_A75A::_id_415B( "winlimit" ) );
    }
}

_id_6DE2()
{
    self endon( "death" );
    self endon( "stop_ticking" );
    level endon( "game_ended" );
    var_0 = level._id_1551;

    for (;;)
    {
        self _meth_809A( "ui_mp_suitcasebomb_timer" );

        if ( var_0 > 10 )
        {
            var_0 -= 1;
            wait 1;
        }
        else if ( var_0 > 4 )
        {
            var_0 -= 0.5;
            wait 0.5;
        }
        else if ( var_0 > 1 )
        {
            var_0 -= 0.4;
            wait 0.4;
        }
        else
        {
            var_0 -= 0.3;
            wait 0.3;
        }

        _id_A79A::_id_A0D4();
    }
}

_id_8F00()
{
    self notify( "stop_ticking" );
}

_id_935D()
{
    level endon( "game_ended" );
    wait 0.05;
    var_0 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_0 _meth_8054();

    while ( game["state"] == "playing" )
    {
        if ( !level._id_9374 && _id_A75A::_id_4129() )
        {
            var_1 = _id_412F() / 1000;
            var_2 = int( var_1 + 0.5 );
            var_3 = int( _id_A75A::_id_4129() * 60 * 0.5 );

            if ( _id_A75A::_id_3FBE() && var_2 > var_3 )
                var_2 -= var_3;

            if ( var_2 >= 30 && var_2 <= 60 )
                level notify( "match_ending_soon", "time" );

            if ( var_2 <= 10 || var_2 <= 30 && var_2 % 2 == 0 )
            {
                level notify( "match_ending_very_soon" );

                if ( var_2 == 0 )
                    break;

                var_0 _meth_809A( "ui_mp_timer_countdown" );
            }

            if ( var_1 - floor( var_1 ) >= 0.05 )
                wait(var_1 - floor( var_1 ));
        }

        wait 1.0;
    }
}

_id_3BFF()
{
    level endon( "game_ended" );
    level waittill( "prematch_over" );
    level._id_8D3B = gettime();
    level._id_2B2F = 0;
    level.matchdurationstarttime = gettime();

    if ( isdefined( game["roundMillisecondsAlreadyPassed"] ) )
    {
        level._id_8D3B -= game["roundMillisecondsAlreadyPassed"];
        level._id_381A = game["roundMillisecondsAlreadyPassed"];
        game["roundMillisecondsAlreadyPassed"] = undefined;
    }

    var_0 = gettime();

    while ( game["state"] == "playing" )
    {
        if ( !level._id_9374 )
            game["timePassed"] += gettime() - var_0;

        var_0 = gettime();
        wait 1.0;
    }
}

_id_9B84()
{
    var_0 = level._id_9375 || isdefined( level._id_4A36 );

    if ( !_id_A75A::_id_3BDB( "prematch_done" ) )
        var_0 = 0;

    if ( !level._id_9374 && var_0 )
    {
        level._id_9374 = 1;
        level._id_9373 = gettime();
    }
    else if ( level._id_9374 && !var_0 )
    {
        level._id_9374 = 0;
        level._id_2B2F += gettime() - level._id_9373;
    }
}

_id_6724()
{
    level._id_9375 = 1;
    _id_9B84();
}

_id_74B9()
{
    level._id_9375 = 0;
    _id_9B84();
}

_id_8D13()
{
    thread _id_3BFF();
    level._id_9374 = 0;
    level._id_9375 = 0;
    setdvar( "ui_inprematch", 1 );
    _id_6F06();
    _id_A75A::_id_3BDE( "prematch_done" );
    level notify( "prematch_over" );
    setdvar( "ui_inprematch", 0 );
    level._id_6F04 = gettime();
    _id_9B84();
    thread _id_935D();
    thread _id_42F0();
    thread _id_A7A0::_id_764D();
    thread _id_A744::_id_59E9();
    var_0 = isdefined( level._id_511A ) && level._id_511A;
    var_1 = isdefined( level.iszombiegame ) && level.iszombiegame;

    if ( var_0 || var_1 )
        thread updategameduration();

    _func_240();
}

_id_A2A7()
{
    level endon( "game_ended" );

    while ( game["state"] == "playing" )
    {
        var_0 = gettime();

        if ( var_0 - level._id_560B["allies"] > level._id_A2A2["allies"] * 1000 )
        {
            level notify( "wave_respawn_allies" );
            level._id_560B["allies"] = var_0;
            level._id_A2A4["allies"] = 0;
        }

        if ( var_0 - level._id_560B["axis"] > level._id_A2A2["axis"] * 1000 )
        {
            level notify( "wave_respawn_axis" );
            level._id_560B["axis"] = var_0;
            level._id_A2A4["axis"] = 0;
        }

        if ( level._id_5FE9 )
        {
            for ( var_1 = 0; var_1 < level._id_91F0.size; var_1++ )
            {
                if ( var_0 - level._id_560B[level._id_91F0[var_1]] > level._id_0699[level._id_91F0[var_1]] * 1000 )
                {
                    var_2 = "wave_rewpawn_" + level._id_91F0[var_1];
                    level notify( var_2 );
                    level._id_560B[level._id_91F0[var_1]] = var_0;
                    level._id_A2A4[level._id_91F0[var_1]] = 0;
                }
            }
        }

        wait 0.05;
    }
}

_id_3F18()
{
    var_0["allies"] = 0;
    var_0["axis"] = 0;
    var_1["allies"] = 0;
    var_1["axis"] = 0;
    var_2["allies"] = 0;
    var_2["axis"] = 0;

    foreach ( var_4 in level._id_0328 )
    {
        var_5 = var_4._id_030D["team"];

        if ( isdefined( var_5 ) && ( var_5 == "allies" || var_5 == "axis" ) )
        {
            var_0[var_5] += var_4._id_0390;
            var_1[var_5] += var_4._id_023C;
            var_2[var_5] += var_4._id_010E;
        }
    }

    if ( var_0["allies"] > var_0["axis"] )
        return "allies";
    else if ( var_0["axis"] > var_0["allies"] )
        return "axis";

    if ( var_1["allies"] > var_1["axis"] )
        return "allies";
    else if ( var_1["axis"] > var_1["allies"] )
        return "axis";

    if ( var_2["allies"] < var_2["axis"] )
        return "allies";
    else if ( var_2["axis"] < var_2["allies"] )
        return "axis";

    if ( randomint( 2 ) == 0 )
        return "allies";

    return "axis";
}

_id_7135( var_0 )
{
    if ( !_id_A75A::_id_A1C1() )
        return;

    var_0 = _id_3FA9( var_0, 0 );

    if ( _id_A75A::_id_59E0() )
    {
        _id_8353();

        if ( _id_4A2F() )
        {
            level._id_4A2E = 1;
            logstring( "host idled out" );
            endlobby();
        }

        _id_9B2C( var_0 );
    }

    _id_9B9E( var_0 );
}

_id_2B64( var_0, var_1 )
{
    if ( !_id_A75A::_id_6E98() )
    {
        foreach ( var_3 in level._id_0328 )
        {
            if ( isdefined( var_3._id_214A ) || var_3._id_030D["team"] == "spectator" && !var_3 _meth_8432() )
                continue;

            if ( level._id_91E4 )
            {
                var_3 thread _id_A79C::_id_91F2( var_0, 1, var_1 );
                continue;
            }

            var_3 thread _id_A79C::_id_65B2( var_0, var_1 );
        }
    }

    if ( !_id_A75A::_id_A1C1() )
        level notify( "round_win", var_0 );

    if ( _id_A75A::_id_A1C1() )
        _id_7652( level._id_7650, 0 );
    else
        _id_7652( level._id_7650, 1 );
}

_id_2B5F( var_0, var_1 )
{
    if ( !_id_A75A::_id_6E98() )
    {
        foreach ( var_3 in level._id_0328 )
        {
            if ( isdefined( var_3._id_214A ) || var_3._id_030D["team"] == "spectator" && !var_3 _meth_8432() )
                continue;

            if ( level._id_91E4 )
            {
                var_3 thread _id_A79C::_id_91F2( var_0, 0, var_1, 1 );
                continue;
            }

            var_3 thread _id_A79C::_id_65B2( var_0, var_1 );
        }
    }

    level notify( "game_win", var_0 );
    _id_7652( level._id_6E89, 1 );
}

_id_2B65()
{
    var_0 = level._id_44FC;

    if ( var_0 == "halftime" )
    {
        if ( _id_A75A::_id_415B( "roundlimit" ) )
        {
            if ( game["roundsPlayed"] * 2 == _id_A75A::_id_415B( "roundlimit" ) )
                var_0 = "halftime";
            else
                var_0 = "intermission";
        }
        else if ( _id_A75A::_id_415B( "winlimit" ) )
        {
            if ( game["roundsPlayed"] == _id_A75A::_id_415B( "winlimit" ) - 1 )
                var_0 = "halftime";
            else
                var_0 = "intermission";
        }
        else
            var_0 = "intermission";
    }

    level notify( "round_switch", var_0 );

    foreach ( var_2 in level._id_0328 )
    {
        if ( isdefined( var_2._id_214A ) || var_2._id_030D["team"] == "spectator" && !var_2 _meth_8432() )
            continue;

        var_2 thread _id_A79C::_id_91F2( var_0, 1, game["end_reason"]["switching_sides"] );
    }

    _id_7652( level._id_44FB, 0 );
}

_id_3A2E( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    foreach ( var_3 in level._id_0328 )
    {
        var_3 _meth_800D();
        var_3 thread _id_3A33( var_0 );
        var_3 thread _id_7651( 4.0 );
        var_3 _id_3A26();

        if ( isdefined( var_1 ) && var_1 )
        {
            var_3 _meth_82FD( "cg_everyoneHearsEveryone", 1, "cg_fovScale", 1 );
            var_3 _meth_82FB( "fov_scale", 1 );
            continue;
        }

        var_3 _meth_82FD( "cg_everyoneHearsEveryone", 1 );
    }

    if ( isdefined( level._id_08A1 ) )
    {
        foreach ( var_6 in level._id_08A1 )
            var_6 _id_A75A::_id_3A30( 1 );
    }
}

_id_3163( var_0, var_1 )
{
    setdvar( "bg_compassShowEnemies", 0 );
    _id_3A2E( 1.0, 1 );

    foreach ( var_3 in level._id_0328 )
    {
        var_3._id_030D["stats"] = var_3._id_8D71;
        var_3._id_030D["segments"] = var_3._id_7C52;
    }

    level notify( "round_switch", "overtime" );
    var_5 = 0;
    var_6 = var_0 == "overtime";

    if ( level._id_01B5 == "ctf" )
    {
        var_0 = "tie";
        var_5 = 1;

        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            var_0 = "axis";

        if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            var_0 = "allies";
    }

    foreach ( var_3 in level._id_0328 )
    {
        if ( isdefined( var_3._id_214A ) || var_3._id_030D["team"] == "spectator" && !var_3 _meth_8432() )
            continue;

        if ( level._id_91E4 )
        {
            var_3 thread _id_A79C::_id_91F2( var_0, var_5, var_1 );
            continue;
        }

        var_3 thread _id_A79C::_id_65B2( var_0, var_1 );
    }

    _id_7652( level._id_7650, 0 );

    if ( level._id_01B5 == "ctf" )
        var_0 = "overtime_halftime";

    if ( isdefined( level._id_374B ) && var_6 )
    {
        level._id_3746[level._id_374B] = _id_A75A::_id_40C5();

        foreach ( var_3 in level._id_0328 )
            var_3 notify( "reset_outcome" );

        level notify( "game_cleanup" );
        _id_A0D1();

        if ( level._id_01B5 == "ctf" )
        {
            var_0 = "overtime";
            var_1 = game["end_reason"]["tie"];
        }

        foreach ( var_3 in level._id_0328 )
        {
            if ( isdefined( var_3._id_214A ) || var_3._id_030D["team"] == "spectator" && !var_3 _meth_8432() )
                continue;

            if ( level._id_91E4 )
            {
                var_3 thread _id_A79C::_id_91F2( var_0, 0, var_1 );
                continue;
            }

            var_3 thread _id_A79C::_id_65B2( var_0, var_1 );
        }

        _id_7652( level._id_44FB, 0 );
    }

    game["status"] = var_0;
    level notify( "restarting" );
    game["state"] = "playing";
    setdvar( "ui_game_state", game["state"] );
    _func_169( 1 );
}

_id_3160( var_0 )
{
    setdvar( "bg_compassShowEnemies", 0 );
    var_1 = "halftime";
    var_2 = 1;

    if ( isdefined( level._id_44F9 ) && !level._id_44F9 )
        var_2 = 0;

    if ( var_2 )
    {
        game["switchedsides"] = !game["switchedsides"];
        var_3 = game["end_reason"]["switching_sides"];
    }
    else
        var_3 = var_0;

    _id_3A2E( 1.0, 1 );

    if ( level._id_01B5 == "ctf" )
    {
        var_3 = var_0;
        var_1 = "tie";

        if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            var_1 = "axis";

        if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            var_1 = "allies";
    }

    foreach ( var_5 in level._id_0328 )
    {
        var_5._id_030D["stats"] = var_5._id_8D71;
        var_5._id_030D["segments"] = var_5._id_7C52;
    }

    level notify( "round_switch", "halftime" );

    foreach ( var_5 in level._id_0328 )
    {
        if ( isdefined( var_5._id_214A ) || var_5._id_030D["team"] == "spectator" && !var_5 _meth_8432() )
            continue;

        var_5 thread _id_A79C::_id_91F2( var_1, 1, var_3 );
    }

    _id_7652( level._id_7650, 0 );

    if ( isdefined( level._id_374B ) )
    {
        level._id_3746[level._id_374B] = _id_A75A::_id_40C5();

        foreach ( var_5 in level._id_0328 )
            var_5 notify( "reset_outcome" );

        level notify( "game_cleanup" );
        _id_A0D1();
        var_11 = game["end_reason"]["switching_sides"];

        if ( !var_2 )
            var_11 = var_3;

        foreach ( var_5 in level._id_0328 )
        {
            if ( isdefined( var_5._id_214A ) || var_5._id_030D["team"] == "spectator" && !var_5 _meth_8432() )
                continue;

            var_5 thread _id_A79C::_id_91F2( "halftime", 1, var_11 );
        }

        _id_7652( level._id_44FB, 0 );
    }

    game["status"] = "halftime";
    level notify( "restarting" );
    game["state"] = "playing";
    setdvar( "ui_game_state", game["state"] );
    _func_169( 1 );
}

updategameduration()
{
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = getgameduration();
        setomnvar( "ui_game_duration", var_0 * 1000 );
        wait 1.0;
    }
}

getgameduration()
{
    var_0 = _id_A75A::getgametimepassedseconds();

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_0 = gamedurationclamp( var_0 );

    return var_0;
}

gamedurationclamp( var_0 )
{
    if ( var_0 > 86399 )
        return 86399;

    return var_0;
}

_id_315E( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( game["state"] == "postgame" || level._id_3BD8 )
        return;

    game["state"] = "postgame";
    setdvar( "ui_game_state", "postgame" );
    level._id_3BDA = gettime();
    level._id_3BD8 = 1;
    level._id_4C6A = 0;
    level notify( "game_ended", var_0 );
    _id_A75A::_id_56DA( "game_over" );
    _id_A75A::_id_56DA( "block_notifies" );
    var_3 = getgameduration();
    setomnvar( "ui_game_duration", var_3 * 1000 );
    waittillframeend;
    setgameendtime( 0 );
    setmatchdata( "gameLengthSeconds", var_3 );
    setmatchdata( "endTimeUTC", getsystemtime() );
    _id_1D07();

    if ( isdefined( var_0 ) && isstring( var_0 ) && _id_A75A::_id_5169( var_0 ) )
    {
        level._id_374B = "none";
        _id_3163( var_0, var_1 );
        return;
    }

    if ( isdefined( var_0 ) && isstring( var_0 ) && var_0 == "halftime" )
    {
        level._id_374B = "none";
        _id_3160( var_1 );
        return;
    }

    if ( isdefined( level._id_374B ) )
        level._id_3746[level._id_374B] = _id_A75A::_id_40C5();

    game["roundsPlayed"]++;
    setomnvar( "ui_current_round", game["roundsPlayed"] );

    if ( level._id_91E4 )
    {
        if ( ( var_0 == "axis" || var_0 == "allies" ) && level._id_01B5 != "ctf" )
            game["roundsWon"][var_0]++;

        _id_A78B::_id_9B7C( "axis" );
        _id_A78B::_id_9B7C( "allies" );
    }
    else if ( isdefined( var_0 ) && isplayer( var_0 ) )
        game["roundsWon"][var_0._id_444D]++;

    _id_A78B::_id_9B41();
    _id_7135( var_0 );

    foreach ( var_5 in level._id_0328 )
    {
        var_5 _meth_82FC( "ui_opensummary", 1 );

        if ( _id_A75A::_id_A1C3() || _id_A75A::_id_A1C1() )
            var_5 _id_A7C3::_id_1EF3( 1 );
    }

    setdvar( "g_deadChat", 1 );
    setdvar( "ui_allow_teamchange", 0 );
    setdvar( "bg_compassShowEnemies", 0 );
    _id_3A2E( 1.0, 1 );

    if ( !_id_A75A::_id_A1C3() && !var_2 )
    {
        _id_2B64( var_0, var_1 );

        if ( isdefined( level._id_374B ) )
        {
            foreach ( var_5 in level._id_0328 )
                var_5 notify( "reset_outcome" );

            level notify( "game_cleanup" );
            _id_A0D1();
        }

        if ( !_id_A75A::_id_A1C1() )
        {
            _id_A75A::_id_56D7( "block_notifies" );

            if ( _id_1D18() )
                _id_2B65();

            foreach ( var_5 in level._id_0328 )
            {
                var_5._id_030D["stats"] = var_5._id_8D71;
                var_5._id_030D["segments"] = var_5._id_7C52;
            }

            level notify( "restarting" );
            game["state"] = "playing";
            setdvar( "ui_game_state", "playing" );
            _func_169( 1 );
            return;
        }

        if ( !level._id_39B6 )
            var_1 = _id_9B0C( var_0 );
    }

    if ( !isdefined( game["clientMatchDataDef"] ) )
    {
        game["clientMatchDataDef"] = "mp/clientmatchdata.def";
        setclientmatchdatadef( game["clientMatchDataDef"] );
    }

    _id_A7A0::_id_764F( var_0 );
    var_0 = _id_3FA9( var_0, 1 );

    if ( level._id_91E4 )
    {
        setomnvar( "ui_game_victor", 0 );

        if ( var_0 == "allies" )
            setomnvar( "ui_game_victor", 2 );
        else if ( var_0 == "axis" )
            setomnvar( "ui_game_victor", 1 );
    }

    _id_2B5F( var_0, var_1 );
    var_11 = gettime();

    if ( isdefined( level._id_374B ) && _id_A75A::_id_A1C3() )
    {
        foreach ( var_5 in level._id_0328 )
            var_5 notify( "reset_outcome" );

        level notify( "game_cleanup" );
        _id_A0D1();
    }

    _id_A75A::_id_56D7( "block_notifies" );
    level._id_020C = 1;
    level notify( "spawning_intermission" );

    foreach ( var_5 in level._id_0328 )
    {
        var_5 _meth_8325();
        var_5 _meth_826C();
        var_5 notify( "reset_outcome" );
        var_5 thread _id_A7A7::_id_89E3();
    }

    _id_6FF9();
    wait 1.0;
    _id_1D04();
    _id_9AFB();

    if ( level._id_91E4 )
    {
        if ( var_0 == "axis" || var_0 == "allies" )
            setmatchdata( "victor", var_0 );
        else
            setmatchdata( "victor", "none" );

        setmatchdata( "alliesScore", game["teamScores"]["allies"] );
        setmatchdata( "axisScore", game["teamScores"]["axis"] );
        _func_242( var_0 );
    }
    else
        setmatchdata( "victor", "none" );

    level _id_A744::_id_31B6();

    foreach ( var_5 in level._id_0328 )
    {
        if ( var_5 _id_A75A::_id_7136() )
            var_5 _id_A744::_id_5822();

        var_5 _id_A7A7::_id_5845();
    }

    setmatchdata( "host", _id_A7A7::truncateplayername( level._id_4A3B ) );

    if ( _id_A75A::_id_59E0() )
    {
        setmatchdata( "playlistVersion", _func_27B() );
        setmatchdata( "playlistID", _func_27C() );
        setmatchdata( "isDedicated", _func_27A() );
    }

    setmatchdata( "levelMaxClients", level._id_5A26 );
    sendmatchdata();

    foreach ( var_5 in level._id_0328 )
    {
        var_5._id_030D["stats"] = var_5._id_8D71;
        var_5._id_030D["segments"] = var_5._id_7C52;
    }

    _func_243();
    var_20 = 0;

    if ( _id_A75A::_id_6E98() )
        var_20 = 5.0;

    if ( isdefined( level.endgamewaitfunc ) )
        [[ level.endgamewaitfunc ]]( var_2, level._id_6E86, var_20, var_0 );
    else if ( !var_2 && !level._id_6E86 )
    {
        if ( !_id_A75A::_id_A1C3() )
            wait(6.0 + var_20);
        else
            wait(min( 10.0, 4.0 + var_20 + level._id_6E86 ));
    }
    else
        wait(min( 10.0, 4.0 + var_20 + level._id_6E86 ));

    var_21 = "_gamelogic.gsc";
    var_22 = "all";

    if ( level._id_91E4 && isdefined( var_0 ) )
        var_22 = var_0;

    var_23 = "undefined";

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case 1:
                var_23 = "MP_SCORE_LIMIT_REACHED";
                break;
            case 2:
                var_23 = "MP_TIME_LIMIT_REACHED";
                break;
            case 3:
                var_23 = "MP_PLAYERS_FORFEITED";
                break;
            case 4:
                var_23 = "MP_TARGET_DESTROYED";
                break;
            case 5:
                var_23 = "MP_BOMB_DEFUSED";
                break;
            case 6:
                var_23 = "MP_GHOSTS_ELIMINATED";
                break;
            case 7:
                var_23 = "MP_FEDERATION_ELIMINATED";
                break;
            case 8:
                var_23 = "MP_GHOSTS_FORFEITED";
                break;
            case 9:
                var_23 = "MP_FEDERATION_FORFEITED";
                break;
            case 10:
                var_23 = "MP_ENEMIES_ELIMINATED";
                break;
            case 11:
                var_23 = "MP_MATCH_TIE";
                break;
            case 12:
                var_23 = "GAME_OBJECTIVECOMPLETED";
                break;
            case 13:
                var_23 = "GAME_OBJECTIVEFAILED";
                break;
            case 14:
                var_23 = "MP_SWITCHING_SIDES";
                break;
            case 15:
                var_23 = "MP_ROUND_LIMIT_REACHED";
                break;
            case 16:
                var_23 = "MP_ENDED_GAME";
                break;
            case 17:
                var_23 = "MP_HOST_ENDED_GAME";
                break;
            default:
                break;
        }
    }

    if ( !isdefined( var_11 ) )
        var_11 = -1;

    var_24 = 15;
    var_25 = var_24;
    var_26 = getmatchdata( "playerCount" );
    var_27 = getmatchdata( "lifeCount" );

    if ( !isdefined( level._id_59DD ) )
    {
        var_28 = 0;
        var_29 = 0;
        var_30 = 0;
        var_31 = 0;
        var_32 = 0;
        var_33 = 0;
        var_34 = 0;
    }
    else
    {
        if ( isdefined( level._id_59DD["botJoinCount"] ) )
            var_28 = level._id_59DD["botJoinCount"];
        else
            var_28 = 0;

        if ( isdefined( level._id_59DD["deathCount"] ) )
            var_29 = level._id_59DD["deathCount"];
        else
            var_29 = 0;

        if ( isdefined( level._id_59DD["badSpawnDiedTooFastCount"] ) )
            var_30 = level._id_59DD["badSpawnDiedTooFastCount"];
        else
            var_30 = 0;

        if ( isdefined( level._id_59DD["badSpawnKilledTooFastCount"] ) )
            var_31 = level._id_59DD["badSpawnKilledTooFastCount"];
        else
            var_31 = 0;

        if ( isdefined( level._id_59DD["badSpawnDmgDealtCount"] ) )
            var_32 = level._id_59DD["badSpawnDmgDealtCount"];
        else
            var_32 = 0;

        if ( isdefined( level._id_59DD["badSpawnDmgReceivedCount"] ) )
            var_33 = level._id_59DD["badSpawnDmgReceivedCount"];
        else
            var_33 = 0;

        if ( isdefined( level._id_59DD["badSpawnByAnyMeansCount"] ) )
            var_34 = level._id_59DD["badSpawnByAnyMeansCount"];
        else
            var_34 = 0;
    }

    var_35 = 0;

    if ( isdefined( level.spawnsighttracesused_pres1tu ) )
        var_35 += 1;

    if ( isdefined( level.spawnsighttracesused_posts1tu ) )
        var_35 += 2;

    reconevent( "script_mp_match_end: script_file %s, gameTime %d, match_winner %s, win_reason %s, version %d, joinCount %d, botJoinCount %d, spawnCount %d, deathCount %d, badSpawnDiedTooFastCount %d, badSpawnKilledTooFastCount %d, badSpawnDmgDealtCount %d, badSpawnDmgReceivedCount %d, badSpawnByAnyMeansCount %d, sightTraceMethodsUsed %d", var_21, var_11, var_22, var_23, var_25, var_26, var_28, var_27, var_29, var_30, var_31, var_32, var_33, var_34, var_35 );

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( isdefined( level._id_A3CA ) && level._id_A3CA )
            setdvar( "cg_drawCrosshair", 1 );
    }

    level notify( "exitLevel_called" );
    exitlevel( 0 );
}

_id_3FA9( var_0, var_1 )
{
    if ( !isstring( var_0 ) )
        return var_0;

    var_2 = var_0;

    if ( level._id_91E4 && ( _id_A75A::_id_5191() || level._id_01B5 == "ctf" ) && level._id_3BD8 )
    {
        var_3 = "roundsWon";

        if ( isdefined( level._id_A322 ) && level._id_A322 )
            var_3 = "teamScores";

        if ( game[var_3]["allies"] == game[var_3]["axis"] )
            var_2 = "tie";
        else if ( game[var_3]["axis"] > game[var_3]["allies"] )
            var_2 = "axis";
        else
            var_2 = "allies";
    }

    if ( var_1 && ( var_2 == "allies" || var_2 == "axis" ) )
        level._id_374B = var_2;

    return var_2;
}

_id_9B0C( var_0 )
{
    if ( !level._id_91E4 )
        return 1;

    if ( _id_A75A::_id_4922() )
        return game["end_reason"]["round_limit_reached"];

    if ( _id_A75A::_id_4928() )
        return game["end_reason"]["score_limit_reached"];

    return game["end_reason"]["objective_completed"];
}

_id_3387( var_0 )
{
    var_1 = _id_40C1( var_0 );
    var_2 = _id_40C2( var_0 );
    var_3 = 999999;

    if ( var_1 )
        var_3 = var_2 / var_1;

    return var_3;
}

_id_40C1( var_0 )
{
    var_1 = _id_A75A::_id_415B( "scorelimit" );
    var_2 = _id_A75A::_id_4129();
    var_3 = _id_A75A::_id_412A() / 60000 + 0.0001;

    if ( isplayer( self ) )
        var_4 = self._id_0390 / var_3;
    else
        var_4 = setclientnamemode( var_0 ) / var_3;

    return var_4;
}

_id_40C2( var_0 )
{
    var_1 = _id_A75A::_id_415B( "scorelimit" );

    if ( isplayer( self ) )
        var_2 = var_1 - self._id_0390;
    else
        var_2 = var_1 - setclientnamemode( var_0 );

    return var_2;
}

_id_41ED()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    _id_A75A::_id_A0E4( 3 );
    thread _id_A75A::_id_91F3( "callout_lastteammemberalive", self, self._id_030D["team"] );

    if ( level._id_5FE9 )
    {
        foreach ( var_1 in level._id_91F0 )
        {
            if ( self._id_030D["team"] != var_1 )
                thread _id_A75A::_id_91F3( "callout_lastenemyalive", self, var_1 );
        }
    }
    else
    {
        var_3 = _id_A75A::_id_4065( self._id_030D["team"] );
        thread _id_A75A::_id_91F3( "callout_lastenemyalive", self, var_3 );
    }

    level notify( "last_alive", self );
}

_id_6FF9()
{
    var_0 = 0;

    foreach ( var_2 in level._id_0328 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2._id_1F10 = var_0;
        var_0++;

        if ( isdefined( level.iszombiegame ) && level.iszombiegame )
            var_2._id_1F10 = var_2 _meth_81B1();

        setclientmatchdata( "players", var_2._id_1F10, "name", _id_A7A7::truncateplayername( var_2._id_02AB ) );
        setclientmatchdata( "players", var_2._id_1F10, "xuid", var_2._id_0537 );
    }

    _id_A725::_id_0D70();
    _id_A74E::_id_6FFA();
    sendclientmatchdata();
    _func_23E();
}

_id_94FA( var_0, var_1 )
{
    thread _id_930E( var_0, 1, "deaths" );
}

_id_94AF( var_0, var_1, var_2 )
{
    if ( isdefined( self ) && isplayer( self ) )
    {
        if ( var_1 != "MOD_FALLING" )
        {
            if ( _id_A75A::_id_514D( var_1 ) && issubstr( var_0, "tactical" ) )
                return;

            if ( _id_A75A::_id_514D( var_1 ) && !issubstr( var_0, "riotshield" ) && !issubstr( var_0, "combatknife" ) )
                return;

            thread _id_930E( var_0, 1, "kills" );
            var_3 = 0;

            if ( isdefined( var_2 ) && isdefined( var_2.firedads ) )
                var_3 = var_2.firedads;
            else
                var_3 = self _meth_8340();

            if ( var_3 < 0.2 )
                thread _id_930E( var_0, 1, "hipfirekills" );
        }

        if ( var_1 == "MOD_HEAD_SHOT" )
            thread _id_930E( var_0, 1, "headShots" );
    }
}

_id_8350( var_0, var_1, var_2 )
{
    if ( !var_1 )
        return;

    var_3 = _id_A75A::_id_4164( var_0 );

    if ( var_3 == "killstreak" || var_3 == "other" )
        return;

    if ( _id_A75A::_id_50FB( var_0 ) )
        return;

    if ( _id_A75A::_id_50C6( var_0 ) )
        return;

    if ( var_0 == maps\mp\_grappling_hook::get_grappling_hook_weapon() )
        return;

    if ( var_3 == "weapon_grenade" || var_3 == "weapon_explosive" )
    {
        var_4 = _id_A75A::_id_8F56( var_0, "_lefthand" );
        var_4 = _id_A75A::_id_8F56( var_4, "_mp" );
        _id_A7A4::_id_4C3D( var_4, var_2, var_1 );
        _id_A744::_id_5849( var_4, var_2, var_1 );
        return;
    }

    var_5 = _id_A7B4::isprimaryorsecondaryprojectileweapon( var_0 );

    if ( var_2 != "timeInUse" && var_2 != "deaths" && !var_5 )
    {
        var_6 = var_0;
        var_0 = self _meth_8311();

        if ( var_0 != var_6 && _id_A75A::_id_513A( var_0 ) )
            return;
    }

    if ( !isdefined( self._id_94F4 ) )
        self._id_94F4 = var_0;

    if ( var_0 != self._id_94F4 )
    {
        _id_A7A4::_id_9B9C();
        self._id_94F4 = var_0;
        self._id_2515 = 0;
    }

    switch ( var_2 )
    {
        case "shots":
            self._id_94F5++;
            self._id_2515++;
            break;
        case "hits":
            self._id_94F2++;
            break;
        case "headShots":
            self._id_94F0++;
            self._id_94F2++;
            break;
        case "kills":
            self._id_94F3++;
            break;
        case "hipfirekills":
            self._id_94F1++;
            break;
        case "timeInUse":
            self._id_94F6 += var_1;
            break;
    }

    if ( var_2 == "deaths" )
    {
        var_7 = _id_A75A::_id_3F0F( var_0 );

        if ( !_id_A75A::_id_50CE( var_7 ) && !_id_A75A::_id_50CF( var_7 ) )
            return;

        var_8 = _id_A75A::_id_4160( var_0 );
        _id_A7A4::_id_4C3D( var_7, var_2, var_1 );
        _id_A744::_id_5849( var_7, "deaths", var_1 );

        foreach ( var_10 in var_8 )
            _id_A7A4::_id_4C3A( var_10, var_2, var_1 );
    }
}

_id_7F8D( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( !isdefined( var_0 ) )
    {
        var_1 _id_8350( var_2, 1, "hits" );
        return;
    }

    if ( !isdefined( var_0._id_6C5B ) )
        var_0._id_6C5B = [];

    var_3 = 1;

    for ( var_4 = 0; var_4 < var_0._id_6C5B.size; var_4++ )
    {
        if ( var_0._id_6C5B[var_4] == self )
        {
            var_3 = 0;
            break;
        }
    }

    if ( var_3 )
    {
        var_0._id_6C5B[var_0._id_6C5B.size] = self;
        var_1 _id_8350( var_2, 1, "hits" );
    }
}

_id_930E( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    waitframe;
    _id_8350( var_0, var_1, var_2 );
}

_id_1D04()
{
    foreach ( var_1 in level._id_0328 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 _id_A75A::_id_7136() )
        {
            var_2 = var_1 _meth_8226( "round", "kills" );
            var_3 = var_1 _meth_8226( "round", "deaths" );
            var_4 = var_1._id_030D["summary"]["xp"];
            var_5 = var_1._id_0390;
            var_6 = _id_40B7( var_1 );
            var_7 = var_1 _meth_8223( "bestKills" );
            var_8 = var_1 _meth_8223( "mostDeaths" );
            var_9 = var_1 _meth_8223( "mostXp" );
            var_10 = var_1 _meth_8223( "bestScore" );
            var_11 = var_1 _meth_8223( "bestAccuracy" );

            if ( var_2 > var_7 )
                var_1 _meth_8244( "bestKills", var_2 );

            if ( var_4 > var_9 )
                var_1 _meth_8244( "mostXp", var_4 );

            if ( var_3 > var_8 )
                var_1 _meth_8244( "mostDeaths", var_3 );

            if ( var_5 > var_10 )
                var_1 _meth_8244( "bestScore", var_5 );

            if ( var_6 > var_11 )
                var_1 _meth_8244( "bestAccuracy", var_6 );

            var_1 _id_1CFE();
            var_1 _id_A744::_id_5846( var_4, "totalXp" );
            var_1 _id_A744::_id_5846( var_1._id_030D["summary"]["score"], "scoreXp" );
            var_1 _id_A744::_id_5846( var_1._id_030D["summary"]["challenge"], "challengeXp" );
            var_1 _id_A744::_id_5846( var_1._id_030D["summary"]["match"], "matchXp" );
            var_1 _id_A744::_id_5846( var_1._id_030D["summary"]["misc"], "miscXp" );
        }

        if ( isdefined( var_1._id_030D["confirmed"] ) )
            var_1 _id_A744::_id_5836();

        if ( isdefined( var_1._id_030D["denied"] ) )
            var_1 _id_A744::_id_5837();
    }
}

_id_40B7( var_0 )
{
    var_1 = float( var_0 _meth_8223( "totalShots" ) - var_0._id_030D["previous_shots"] );

    if ( var_1 == 0 )
        return 0;

    var_2 = float( var_0 _meth_8223( "hits" ) - var_0._id_030D["previous_hits"] );
    var_3 = clamp( var_2 / var_1, 0.0, 1.0 ) * 10000.0;
    return int( var_3 );
}

_id_1CFE()
{
    var_0 = _id_A744::_id_1877();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        var_2 = _id_A75A::_id_3F0F( var_2 );
        var_3 = _id_A75A::_id_4164( var_2 );

        if ( !_id_A75A::_id_513A( var_2 ) && var_3 != "killstreak" && var_3 != "other" )
        {
            var_4 = self _meth_8223( "bestWeapon", "kills" );
            var_5 = 0;

            if ( isdefined( self._id_030D["mpWeaponStats"][var_2] ) && isdefined( self._id_030D["mpWeaponStats"][var_2]["kills"] ) )
            {
                var_5 = self._id_030D["mpWeaponStats"][var_2]["kills"];

                if ( var_5 > var_4 )
                {
                    self _meth_8244( "bestWeapon", "kills", var_5 );
                    var_6 = 0;

                    if ( isdefined( self._id_030D["mpWeaponStats"][var_2]["shots"] ) )
                        var_6 = self._id_030D["mpWeaponStats"][var_2]["shots"];

                    var_7 = 0;

                    if ( isdefined( self._id_030D["mpWeaponStats"][var_2]["headShots"] ) )
                        var_7 = self._id_030D["mpWeaponStats"][var_2]["headShots"];

                    var_8 = 0;

                    if ( isdefined( self._id_030D["mpWeaponStats"][var_2]["hits"] ) )
                        var_8 = self._id_030D["mpWeaponStats"][var_2]["hits"];

                    var_9 = 0;

                    if ( isdefined( self._id_030D["mpWeaponStats"][var_2]["deaths"] ) )
                        var_9 = self._id_030D["mpWeaponStats"][var_2]["deaths"];

                    self _meth_8244( "bestWeapon", "shots", var_6 );
                    self _meth_8244( "bestWeapon", "headShots", var_7 );
                    self _meth_8244( "bestWeapon", "hits", var_8 );
                    self _meth_8244( "bestWeapon", "deaths", var_9 );
                    var_10 = int( tablelookup( "mp/statstable.csv", 4, var_2, 0 ) );
                    self _meth_8244( "bestWeaponIndex", var_10 );
                }
            }
        }
    }
}

_id_9AFF()
{
    var_0 = 5;
    var_1 = self _meth_8223( "combatRecord", "numTrends" );
    var_1++;

    if ( var_1 > var_0 )
    {
        var_1 = var_0;

        if ( var_0 > 1 )
        {
            for ( var_2 = 0; var_2 < var_0 - 1; var_2++ )
            {
                var_3 = self _meth_8223( "combatRecord", "trend", var_2 + 1, "timestamp" );
                var_4 = self _meth_8223( "combatRecord", "trend", var_2 + 1, "kills" );
                var_5 = self _meth_8223( "combatRecord", "trend", var_2 + 1, "deaths" );
                self _meth_8244( "combatRecord", "trend", var_2, "timestamp", var_3 );
                self _meth_8244( "combatRecord", "trend", var_2, "kills", var_4 );
                self _meth_8244( "combatRecord", "trend", var_2, "deaths", var_5 );
            }
        }
    }

    var_3 = _id_A75A::gettimeutc_for_stat_recording();
    var_4 = self._id_023C;
    var_5 = self._id_010E;
    self _meth_8244( "combatRecord", "trend", var_1 - 1, "timestamp", var_3 );
    self _meth_8244( "combatRecord", "trend", var_1 - 1, "kills", var_4 );
    self _meth_8244( "combatRecord", "trend", var_1 - 1, "deaths", var_5 );
    self _meth_8244( "combatRecord", "numTrends", var_1 );
}

_id_9AFC()
{
    var_0 = _id_A75A::gettimeutc_for_stat_recording();
    _id_7F36( "timeStampLastGame", var_0 );
    _id_4C3B( "numMatches", 1 );
    _id_4C3B( "timePlayed", self._id_936B["total"] );
    _id_4C3B( "kills", self._id_023C );
    _id_4C3B( "deaths", self._id_010E );
    _id_4C3B( "xpEarned", self._id_030D["summary"]["xp"] );

    if ( isdefined( self._id_20B1 ) )
        _id_4C3B( "wins", 1 );

    if ( isdefined( self._id_20B0 ) )
        _id_4C3B( "ties", 1 );

    var_1 = self _meth_8223( "combatRecord", level._id_01B5, "timeStampFirstGame" );

    if ( var_1 == 0 )
        _id_7F36( "timeStampFirstGame", var_0 );
}

_id_4C3B( var_0, var_1 )
{
    var_2 = self _meth_8223( "combatRecord", level._id_01B5, var_0 );
    var_2 += var_1;
    self _meth_8244( "combatRecord", level._id_01B5, var_0, var_2 );
}

_id_7F36( var_0, var_1 )
{
    self _meth_8244( "combatRecord", level._id_01B5, var_0, var_1 );
}

_id_7F37( var_0, var_1 )
{
    var_2 = self _meth_8223( "combatRecord", level._id_01B5, var_0 );

    if ( var_1 > var_2 )
        _id_7F36( var_0, var_1 );
}

_id_9AFE()
{
    if ( level._id_01B5 == "war" || level._id_01B5 == "dm" )
    {
        _id_9AFC();
        var_0 = self._id_010E;

        if ( var_0 == 0 )
            var_0 = 1;

        var_1 = int( self._id_023C / var_0 ) * 1000;
        _id_7F37( "mostkills", self._id_023C );
        _id_7F37( "bestkdr", var_1 );
    }
    else if ( level._id_01B5 == "ctf" )
    {
        _id_9AFC();
        var_2 = _id_A75A::_id_407F( "captures" );
        var_3 = _id_A75A::_id_407F( "returns" );
        _id_4C3B( "captures", var_2 );
        _id_4C3B( "returns", var_3 );
        _id_7F37( "mostcaptures", var_2 );
        _id_7F37( "mostreturns", var_3 );
    }
    else if ( level._id_01B5 == "dom" )
    {
        _id_9AFC();
        var_2 = _id_A75A::_id_407F( "captures" );
        var_4 = _id_A75A::_id_407F( "defends" );
        _id_4C3B( "captures", var_2 );
        _id_4C3B( "defends", var_4 );
        _id_7F37( "mostcaptures", var_2 );
        _id_7F37( "mostdefends", var_4 );
    }
    else if ( level._id_01B5 == "conf" )
    {
        _id_9AFC();
        var_5 = _id_A75A::_id_407F( "confirmed" );
        var_6 = _id_A75A::_id_407F( "denied" );
        _id_4C3B( "confirms", var_5 );
        _id_4C3B( "denies", var_6 );
        _id_7F37( "mostconfirms", var_5 );
        _id_7F37( "mostdenies", var_6 );
    }
    else if ( level._id_01B5 == "sd" )
    {
        _id_9AFC();
        var_7 = _id_A75A::_id_407F( "plants" );
        var_8 = _id_A75A::_id_407F( "defuses" );
        var_9 = _id_A75A::_id_407F( "destructions" );
        _id_4C3B( "plants", var_7 );
        _id_4C3B( "defuses", var_8 );
        _id_4C3B( "detonates", var_9 );
        _id_7F37( "mostplants", var_7 );
        _id_7F37( "mostdefuses", var_8 );
        _id_7F37( "mostdetonates", var_9 );
    }
    else if ( level._id_01B5 == "hp" )
    {
        _id_9AFC();
        var_2 = _id_A75A::_id_407F( "captures" );
        var_4 = _id_A75A::_id_407F( "defends" );
        _id_4C3B( "captures", var_2 );
        _id_4C3B( "defends", var_4 );
        _id_7F37( "mostcaptures", var_2 );
        _id_7F37( "mostdefends", var_4 );
    }
    else if ( level._id_01B5 == "sr" )
    {
        _id_9AFC();
        var_7 = _id_A75A::_id_407F( "plants" );
        var_8 = _id_A75A::_id_407F( "defuses" );
        var_9 = _id_A75A::_id_407F( "destructions" );
        var_5 = _id_A75A::_id_407F( "confirmed" );
        var_6 = _id_A75A::_id_407F( "denied" );
        _id_4C3B( "plants", var_7 );
        _id_4C3B( "defuses", var_8 );
        _id_4C3B( "detonates", var_9 );
        _id_4C3B( "confirms", var_5 );
        _id_4C3B( "denies", var_6 );
        _id_7F37( "mostplants", var_7 );
        _id_7F37( "mostdefuses", var_8 );
        _id_7F37( "mostdetonates", var_9 );
        _id_7F37( "mostconfirms", var_5 );
        _id_7F37( "mostdenies", var_6 );
    }
    else if ( level._id_01B5 == "infect" )
    {
        _id_9AFC();
        var_10 = _id_A75A::_id_408D( "contagious" );
        var_11 = self._id_023C - var_10;
        _id_4C3B( "infectedKills", var_11 );
        _id_4C3B( "survivorKills", var_10 );
        _id_7F37( "mostInfectedKills", var_11 );
        _id_7F37( "mostSurvivorKills", var_10 );
    }
    else if ( level._id_01B5 == "gun" )
    {
        _id_9AFC();
        var_12 = _id_A75A::_id_408D( "levelup" );
        var_13 = _id_A75A::_id_408D( "humiliation" );
        _id_4C3B( "gunPromotions", var_12 );
        _id_4C3B( "stabs", var_13 );
        _id_7F37( "mostGunPromotions", var_12 );
        _id_7F37( "mostStabs", var_13 );
    }
    else if ( level._id_01B5 == "ball" )
    {
        _id_9AFC();
        var_14 = _id_A75A::_id_408D( "fieldgoal" ) + _id_A75A::_id_408D( "touchdown" ) * 2;
        var_15 = _id_A75A::_id_408D( "killedBallCarrier" );
        _id_4C3B( "pointsScored", var_14 );
        _id_4C3B( "killedBallCarrier", var_15 );
        _id_7F37( "mostPointsScored", var_14 );
        _id_7F37( "mostKilledBallCarrier", var_15 );
    }
    else if ( level._id_01B5 == "twar" )
    {
        _id_9AFC();
        var_2 = _id_A75A::_id_407F( "captures" );
        var_16 = _id_A75A::_id_408D( "kill_while_capture" );
        _id_4C3B( "captures", var_2 );
        _id_4C3B( "killWhileCaptures", var_16 );
        _id_7F37( "mostCaptures", var_2 );
        _id_7F37( "mostKillWhileCaptures", var_16 );
    }
}

_id_9AFD()
{
    _id_9AFF();
    _id_9AFE();
}

_id_9AFB()
{
    foreach ( var_1 in level._id_0328 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 _id_A75A::_id_7136() )
            var_1 _id_9AFD();

        level _id_A7A7::_id_A358( var_1 );

        if ( _id_A75A::_id_6E98() )
            level _id_A7A7::_id_1D17( var_1 );
    }
}
