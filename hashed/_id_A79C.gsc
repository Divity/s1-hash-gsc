// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    game["round_end"]["draw"] = 1;
    game["round_end"]["round_draw"] = 2;
    game["round_end"]["round_win"] = 3;
    game["round_end"]["round_loss"] = 4;
    game["round_end"]["victory"] = 5;
    game["round_end"]["defeat"] = 6;
    game["round_end"]["halftime"] = 7;
    game["round_end"]["overtime"] = 8;
    game["round_end"]["roundend"] = 9;
    game["round_end"]["intermission"] = 10;
    game["round_end"]["side_switch"] = 11;
    game["round_end"]["match_bonus"] = 12;
    game["round_end"]["tie"] = 13;
    game["round_end"]["game_end"] = 14;
    game["round_end"]["spectator"] = 15;
    game["round_end"]["zombies_hard_mode"] = 16;
    game["end_reason"]["score_limit_reached"] = 1;
    game["end_reason"]["time_limit_reached"] = 2;
    game["end_reason"]["players_forfeited"] = 3;
    game["end_reason"]["target_destroyed"] = 4;
    game["end_reason"]["bomb_defused"] = 5;
    game["end_reason"]["allies_eliminated"] = 6;
    game["end_reason"]["axis_eliminated"] = 7;
    game["end_reason"]["allies_forfeited"] = 8;
    game["end_reason"]["axis_forfeited"] = 9;
    game["end_reason"]["enemies_eliminated"] = 10;
    game["end_reason"]["tie"] = 11;
    game["end_reason"]["objective_completed"] = 12;
    game["end_reason"]["objective_failed"] = 13;
    game["end_reason"]["switching_sides"] = 14;
    game["end_reason"]["round_limit_reached"] = 15;
    game["end_reason"]["ended_game"] = 16;
    game["end_reason"]["host_ended_game"] = 17;
    game["end_reason"]["survivors_eliminated"] = 18;
    game["end_reason"]["zombies_completed"] = 19;
    game["end_reason"]["zombie_extraction_failed"] = 20;
    game["end_reason"]["survivors_eliminated"] = 21;
    game["end_reason"]["infected_eliminated"] = 22;
    game["end_reason"]["survivors_forfeited"] = 23;
    game["end_reason"]["infected_forfeited"] = 24;
    game["end_reason"]["zombies_hard_mode"] = 25;
    game["strings"]["overtime"] = &"MP_OVERTIME";
    level thread _id_64C5();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_58A4();
        var_0 thread _id_4DF2();
    }
}

_id_4906( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_6235 = var_0;
    _id_622B( var_1 );
}

_id_4DF2()
{
    if ( level._id_8A76 || self _meth_82CD() )
    {
        var_0 = 1.5;
        var_1 = 1.25;
        var_2 = 24;
        var_3 = "hudsmall";
        var_4 = "TOP";
        var_5 = "BOTTOM";
        var_6 = 0;
        var_7 = 0;
    }
    else
    {
        var_0 = 2.5;
        var_1 = 1.75;
        var_2 = 30;
        var_3 = "hudsmall";
        var_4 = "TOP";
        var_5 = "BOTTOM";
        var_6 = 50;
        var_7 = 0;
    }

    self._id_6237 = _id_A79D::_id_2401( var_3, var_0 );
    self._id_6237 _id_A79D::_id_7FE8( var_4, undefined, var_7, var_6 );
    self._id_6237._id_01EE = 1;
    self._id_6237._id_0048 = 0;
    self._id_6237._id_0037 = 0;
    self._id_6235 = _id_A79D::_id_2401( var_3, var_1 );
    self._id_6235 _id_A79D::_id_7FD6( self._id_6237 );
    self._id_6235 _id_A79D::_id_7FE8( var_4, var_5, 0, 0 );
    self._id_6235._id_01EE = 1;
    self._id_6235._id_0048 = 0;
    self._id_6235._id_0037 = 0;
    self._id_6236 = _id_A79D::_id_2401( var_3, var_1 );
    self._id_6236 _id_A79D::_id_7FD6( self._id_6237 );
    self._id_6236 _id_A79D::_id_7FE8( var_4, var_5, 0, 0 );
    self._id_6236._id_01EE = 1;
    self._id_6236._id_0048 = 0;
    self._id_6236._id_0037 = 0;
    self._id_622A = _id_A79D::_id_2420( "white", var_2, var_2 );
    self._id_622A _id_A79D::_id_7FD6( self._id_6236 );
    self._id_622A _id_A79D::_id_7FE8( var_4, var_5, 0, 0 );
    self._id_622A._id_01EE = 1;
    self._id_622A._id_0048 = 0;
    self._id_622A._id_0037 = 0;
    self._id_6230 = _id_A79D::_id_2420( "white", var_2, var_2 );
    self._id_6230 _id_A79D::_id_7FD6( self._id_622A );
    self._id_6230 _id_A79D::_id_7FE8( "CENTER", "CENTER", 0, 0 );
    self._id_6230._id_01EE = 1;
    self._id_6230._id_0048 = 0;
    self._id_6230._id_0037 = 0;
    self._id_2CE8 = [];
    self._id_2CE8[0] = undefined;
    self._id_2CE8[1] = undefined;
    self._id_2CE8[2] = undefined;
    self._id_2CE8[3] = undefined;
    self._id_8A65 = [];
    self._id_8A65[0] = [];
    self._id_8A65[1] = [];
    self._id_8A65[2] = [];
    self._id_8A65[3] = [];
}

_id_63D8( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6._id_939B = var_0;
    var_6._id_6235 = var_1;
    var_6._id_4B45 = var_2;
    var_6._id_01C0 = var_3;
    var_6._id_8893 = var_4;
    var_6._id_0137 = var_5;
    _id_622B( var_6 );
}

_id_622B( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( !isdefined( var_0._id_862B ) )
        var_0._id_862B = 0;

    var_1 = var_0._id_862B;

    if ( !isdefined( var_0._id_04D8 ) )
        var_0._id_04D8 = "";

    if ( !isdefined( self._id_2CE8[var_1] ) )
    {
        thread _id_851B( var_0 );
        return;
    }

    self._id_8A65[var_1][self._id_8A65[var_1].size] = var_0;
}

_id_2B3F( var_0 )
{
    waitframe;
    var_1 = self._id_8A65[var_0][0];

    for ( var_2 = 1; var_2 < self._id_8A65[var_0].size; var_2++ )
        self._id_8A65[var_0][var_2 - 1] = self._id_8A65[var_0][var_2];

    self._id_8A65[var_0][var_2 - 1] = undefined;

    if ( isdefined( var_1._id_02AB ) )
        _id_06F0( var_1 );
    else
        _id_851B( var_1 );
}

_id_7015()
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );
    var_0 = spawnstruct();
    var_1 = "promotion";
    var_0._id_02AB = var_1;
    var_0._id_04D8 = tablelookup( _id_3E81(), 0, var_1, 11 );
    var_0._id_8893 = tablelookup( _id_3E81(), 0, var_1, 9 );
    var_0._id_862B = 0;
    thread _id_06F0( var_0 );
}

_id_851B( var_0 )
{
    self endon( "disconnect" );
    var_1 = var_0._id_862B;

    if ( level._id_3BD8 )
    {
        if ( isdefined( var_0._id_04D8 ) && var_0._id_04D8 == "rank" )
        {
            self _meth_82FC( "ui_promotion", 1 );
            self._id_6E87 = 1;
        }

        if ( self._id_8A65[var_1].size )
            thread _id_2B3F( var_1 );

        return;
    }

    self._id_2CE8[var_1] = var_0;
    _id_A04B( 0 );

    if ( isdefined( var_0._id_0137 ) )
        var_2 = var_0._id_0137;
    else if ( level._id_3BD8 )
        var_2 = 2.0;
    else
        var_2 = 4.0;

    thread _id_7450();

    if ( isdefined( var_0._id_8893 ) )
        self _meth_82F4( var_0._id_8893 );

    if ( isdefined( var_0._id_5658 ) )
        _id_A75A::_id_5652( var_0._id_5658 );

    var_3 = var_0._id_01C0;
    var_4 = self._id_6237;

    if ( isdefined( var_0._id_939B ) )
    {
        if ( isdefined( var_0._id_9399 ) )
            self._id_6237._id_0245 = var_0._id_9399;
        else
            self._id_6237._id_0245 = &"";

        if ( isdefined( var_0._id_9399 ) && !isdefined( var_0._id_9398 ) )
            self._id_6237 _meth_80D7( var_0._id_939B );
        else
            self._id_6237 _meth_80CA( var_0._id_939B );

        if ( isdefined( var_3 ) )
            self._id_6237._id_01C0 = var_3;

        self._id_6237._id_0037 = 1;
        self._id_6237 _meth_8084( var_2 * 1.25 );
        self._id_6237._id_0037 = 0;
    }

    if ( isdefined( var_0._id_92B5 ) )
        var_3 = var_0._id_92B5;

    if ( isdefined( var_0._id_6235 ) )
    {
        if ( isdefined( var_0._id_92B8 ) )
            self._id_6235._id_0245 = var_0._id_92B8;
        else
            self._id_6235._id_0245 = &"";

        if ( isdefined( var_0._id_92B8 ) && !isdefined( var_0._id_92B7 ) )
            self._id_6235 _meth_80D7( var_0._id_6235 );
        else
            self._id_6235 _meth_80CA( var_0._id_6235 );

        if ( isdefined( var_3 ) )
            self._id_6235._id_01C0 = var_3;

        self._id_6235._id_0037 = 1;
        self._id_6235 _meth_8084( var_2 * 1.25 );
        self._id_6235._id_0037 = 0;
        var_4 = self._id_6235;
    }

    if ( isdefined( var_0._id_6236 ) )
    {
        self._id_6236 _id_A79D::_id_7FD6( var_4 );

        if ( isdefined( var_0._id_92B3 ) )
            self._id_6236._id_0245 = var_0._id_92B3;
        else
            self._id_6236._id_0245 = &"";

        self._id_6236 _meth_80CA( var_0._id_6236 );

        if ( isdefined( var_3 ) )
            self._id_6236._id_01C0 = var_3;

        self._id_6236._id_0037 = 1;
        self._id_6236 _meth_8084( var_2 * 1.25 );
        self._id_6236._id_0037 = 0;
        var_4 = self._id_6236;
    }

    if ( isdefined( var_0._id_4B45 ) )
    {
        self._id_622A _id_A79D::_id_7FD6( var_4 );

        if ( level._id_8A76 || self _meth_82CD() )
            self._id_622A _meth_80CC( var_0._id_4B45, 30, 30 );
        else
            self._id_622A _meth_80CC( var_0._id_4B45, 60, 60 );

        self._id_622A._id_0037 = 0;

        if ( isdefined( var_0._id_4B49 ) )
        {
            self._id_622A _meth_8084( 0.15 );
            self._id_622A._id_0037 = 1;
            var_0._id_65F4 = 0;
            self._id_6230 _id_A79D::_id_7FD6( self._id_622A );
            self._id_6230 _id_A79D::_id_7FE8( "CENTER", "CENTER", 0, var_0._id_65F4 );
            self._id_6230 _meth_80CC( var_0._id_4B49, 511, 511 );
            self._id_6230._id_0037 = 0;
            self._id_6230._id_00C5 = game["colors"]["orange"];
            self._id_6230 _meth_8084( 0.4 );
            self._id_6230._id_0037 = 0.85;
            self._id_6230 _meth_8085( 0.4, 32, 32 );
            _id_A04B( var_2 );
            self._id_622A _meth_8084( 0.75 );
            self._id_622A._id_0037 = 0;
            self._id_6230 _meth_8084( 0.75 );
            self._id_6230._id_0037 = 0;
        }
        else
        {
            self._id_622A _meth_8084( 1.0 );
            self._id_622A._id_0037 = 1;
            _id_A04B( var_2 );
            self._id_622A _meth_8084( 0.75 );
            self._id_622A._id_0037 = 0;
        }
    }
    else
        _id_A04B( var_2 );

    self notify( "notifyMessageDone" );
    self._id_2CE8[var_1] = undefined;

    if ( self._id_8A65[var_1].size )
        thread _id_2B3F( var_1 );
}

_id_21C7( var_0, var_1 )
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );
    waitframe;

    if ( level._id_3BD8 )
        return;

    var_2 = spawnstruct();
    var_2._id_02AB = var_0;
    var_2._id_04D8 = tablelookup( _id_3E81(), 0, var_0, 11 );
    var_2._id_6544 = 0;
    var_2._id_8893 = tablelookup( _id_3E81(), 0, var_0, 9 );
    var_2._id_5658 = var_1;
    var_2._id_862B = 0;
    thread _id_06F0( var_2 );
}

_id_53A6( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );
    waitframe;

    if ( level._id_3BD8 )
        return;

    var_5 = spawnstruct();

    if ( isdefined( var_2 ) )
        var_0 += ( "_" + var_2 );

    if ( !isdefined( var_4 ) )
        var_4 = -1;

    var_5._id_02AB = var_0;
    var_5._id_04D8 = tablelookup( _id_3E81(), 0, var_0, 11 );
    var_5._id_6544 = var_1;
    var_5._id_8893 = _id_A75A::_id_3FF5( var_0 );
    var_5._id_5658 = var_0;
    var_5._id_5659 = "killstreak_earned";
    var_5._id_862B = 0;
    var_5.killstreakslot = var_4;

    if ( isdefined( var_3 ) && isarray( var_3 ) )
    {
        if ( var_3.size > 0 )
            var_5._id_5D51 = tablelookuprownum( level._id_53D9, level._id_53D6, var_3[0] );

        if ( var_3.size > 1 )
            var_5._id_5D52 = tablelookuprownum( level._id_53D9, level._id_53D6, var_3[1] );

        if ( var_3.size > 2 )
            var_5._id_5D53 = tablelookuprownum( level._id_53D9, level._id_53D6, var_3[2] );
    }

    thread _id_06F0( var_5 );
}

_id_1C64( var_0, var_1, var_2 )
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );
    waitframe;
    wait 0.05;

    for ( var_3 = var_2 - 1; var_3 >= var_1; var_3-- )
    {
        var_4 = _id_A79D::_id_1C4E( var_0, var_3 );

        if ( var_4 == 0 )
            var_4 = 1;

        if ( var_0 == "ch_longersprint_pro" || var_0 == "ch_longersprint_pro_daily" || var_0 == "ch_longersprint_pro_weekly" )
            var_4 = int( var_4 / 528 );
        else if ( var_0 == "ch_exomech_frontier" )
            var_4 = int( var_4 / 528 );

        var_5 = spawnstruct();
        var_5._id_02AB = var_0;
        var_5._id_04D8 = tablelookup( _id_3E81(), 0, var_0, 11 );
        var_5.challengetier = var_3;
        var_5._id_6544 = var_4;
        var_5._id_8893 = tablelookup( _id_3E81(), 0, var_0, 9 );
        var_5._id_862B = 0;
        thread _id_06F0( var_5 );
    }
}

_id_8A62( var_0, var_1, var_2 )
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );
    wait 0.05;
    var_3 = spawnstruct();
    var_3._id_02AB = var_0;
    var_3._id_04D8 = tablelookup( _id_3E81(), 0, var_0, 11 );
    var_3._id_6544 = var_1;
    var_3._id_8893 = tablelookup( _id_3E81(), 0, var_3._id_02AB, 9 );

    if ( !isdefined( var_2 ) )
        var_2 = -1;

    var_3.killstreakslot = var_2;
    var_3._id_862B = 0;
    thread _id_06F0( var_3 );
}

_id_8A64( var_0, var_1 )
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );
    wait 0.05;
    var_2 = spawnstruct();
    var_2._id_02AB = var_0;
    var_2._id_04D8 = tablelookup( _id_3E81(), 0, var_0, 11 );
    var_2._id_6544 = var_1;
    var_2._id_8893 = tablelookup( _id_3E81(), 0, var_0, 9 );
    var_2._id_862B = 0;
    thread _id_06F0( var_2 );
}

_id_8A63( var_0, var_1 )
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );
    waitframe;

    if ( level._id_3BD8 )
        return;

    var_2 = spawnstruct();
    var_2._id_02AB = var_0;
    var_2._id_04D8 = tablelookup( _id_3E81(), 0, var_0, 11 );
    var_2._id_6544 = var_1;
    var_2._id_8893 = tablelookup( _id_3E81(), 0, var_0, 9 );
    var_2._id_862B = 0;
    thread _id_06F0( var_2 );
}

_id_7138( var_0, var_1, var_2 )
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );
    waitframe;

    if ( level._id_3BD8 )
        return;

    var_3 = spawnstruct();
    var_3._id_02AB = var_0;
    var_3._id_04D8 = tablelookup( _id_3E81(), 0, var_0, 11 );
    var_3._id_8893 = tablelookup( _id_3E81(), 0, var_0, 9 );
    var_3._id_0357 = var_1;
    var_3._id_0333 = var_2;
    var_3._id_862B = 0;
    thread _id_06F0( var_3 );
}

_id_6C6C( var_0, var_1, var_2 )
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );
    waitframe;

    if ( level._id_3BD8 )
        return;

    var_3 = spawnstruct();
    var_3._id_02AB = var_0;
    var_3._id_04D8 = tablelookup( _id_3E81(), 0, var_0, 11 );
    var_3._id_6544 = var_2;
    var_3._id_8893 = tablelookup( _id_3E81(), 0, var_0, 9 );
    var_3._id_6C6B = var_1;
    var_3._id_862B = 0;

    if ( var_3._id_04D8 == "playercard_splash" )
        var_3._id_862B = 1;

    thread _id_06F0( var_3 );
}

_id_06F0( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_1 = var_0._id_862B;

    if ( !isdefined( var_0._id_04D8 ) )
        var_0._id_04D8 = "";

    if ( !isdefined( self._id_2CE8[var_1] ) )
    {
        thread _id_06F1( var_0 );
        return;
    }
    else
    {
        switch ( var_0._id_04D8 )
        {
            case "urgent_splash":
                self._id_6235._id_0037 = 0;
                self._id_6236._id_0037 = 0;
                self._id_622A._id_0037 = 0;
                self _meth_82FB( "ui_splash_idx", -1 );
                self _meth_82FB( "ui_splash_killstreak_mod_1", -1 );
                self _meth_82FB( "ui_splash_killstreak_mod_2", -1 );
                self _meth_82FB( "ui_splash_killstreak_mod_3", -1 );
                self _meth_82FB( "ui_splash_killstreak_idx", -1 );
                thread _id_06F1( var_0 );
                return;
            case "splash":
            case "killstreak_coop_splash":
            case "killstreak_splash":
                if ( self._id_2CE8[var_1]._id_04D8 != "splash" && self._id_2CE8[var_1]._id_04D8 != "urgent_splash" && self._id_2CE8[var_1]._id_04D8 != "killstreak_coop_splash" && self._id_2CE8[var_1]._id_04D8 != "killstreak_splash" && self._id_2CE8[var_1]._id_04D8 != "challenge_splash" && self._id_2CE8[var_1]._id_04D8 != "promotion_splash" && self._id_2CE8[var_1]._id_04D8 != "intel_splash" && self._id_2CE8[var_1]._id_04D8 != "rankup_splash" )
                {
                    self._id_6235._id_0037 = 0;
                    self._id_6236._id_0037 = 0;
                    self._id_622A._id_0037 = 0;
                    thread _id_06F1( var_0 );
                    return;
                }

                break;
        }
    }

    if ( var_0._id_04D8 == "challenge_splash" || var_0._id_04D8 == "killstreak_splash" || var_0._id_04D8 == "killstreak_coop_splash" )
    {
        for ( var_2 = self._id_8A65[var_1].size; var_2 > 0; var_2-- )
            self._id_8A65[var_1][var_2] = self._id_8A65[var_1][var_2 - 1];

        self._id_8A65[var_1][0] = var_0;
    }
    else
        self._id_8A65[var_1][self._id_8A65[var_1].size] = var_0;
}

_id_06F1( var_0 )
{
    self endon( "disconnect" );
    var_1 = var_0._id_862B;

    if ( level._id_3BD8 )
    {
        if ( isdefined( var_0._id_04D8 ) && ( var_0._id_04D8 == "promotion_splash" || var_0._id_04D8 == "promotion_weapon_splash" ) )
        {
            self _meth_82FC( "ui_promotion", 1 );
            self._id_6E87 = 1;
        }
        else if ( isdefined( var_0._id_04D8 ) && var_0._id_04D8 == "challenge_splash" )
        {
            self._id_030D["postGameChallenges"]++;
            self _meth_82FC( "ui_challenge_" + self._id_030D["postGameChallenges"] + "_ref", var_0._id_02AB );
        }

        if ( self._id_8A65[var_1].size )
            thread _id_2B3F( var_1 );

        return;
    }

    if ( isdefined( var_0._id_02AB ) && var_0._id_02AB == "horde_support_drop" )
        setomnvar( "ui_horde_support_bar_highlight", 1 );

    if ( tablelookup( _id_3E81(), 0, var_0._id_02AB, 0 ) != "" )
    {
        var_2 = tablelookuprownum( _id_3E81(), 0, var_0._id_02AB );
        var_3 = _id_A75A::_id_8F54( tablelookupbyrow( _id_3E81(), var_2, 4 ) );

        switch ( var_0._id_04D8 )
        {
            case "killstreak_coop_splash":
            case "killstreak_splash":
                if ( isdefined( var_0.killstreakslot ) && !level._id_2153 )
                    self _meth_82FB( "ui_splash_killstreak_slot_idx", var_0.killstreakslot );

                self _meth_82FB( "ui_splash_killstreak_idx", var_2 );

                if ( isdefined( var_0._id_6C6B ) && var_0._id_6C6B != self )
                    self _meth_82FB( "ui_splash_killstreak_clientnum", var_0._id_6C6B _meth_81B1() );
                else
                    self _meth_82FB( "ui_splash_killstreak_clientnum", -1 );

                if ( isdefined( var_0._id_6544 ) )
                    self _meth_82FB( "ui_splash_killstreak_optional_number", var_0._id_6544 );
                else
                    self _meth_82FB( "ui_splash_killstreak_optional_number", 0 );

                if ( isdefined( var_0._id_5D51 ) )
                    self _meth_82FB( "ui_splash_killstreak_mod_1", var_0._id_5D51 );
                else
                    self _meth_82FB( "ui_splash_killstreak_mod_1", -1 );

                if ( isdefined( var_0._id_5D52 ) )
                    self _meth_82FB( "ui_splash_killstreak_mod_2", var_0._id_5D52 );
                else
                    self _meth_82FB( "ui_splash_killstreak_mod_2", -1 );

                if ( isdefined( var_0._id_5D53 ) )
                    self _meth_82FB( "ui_splash_killstreak_mod_3", var_0._id_5D53 );
                else
                    self _meth_82FB( "ui_splash_killstreak_mod_3", -1 );

                break;
            case "playercard_splash":
                if ( isdefined( var_0._id_6C6B ) )
                {
                    self _meth_82FB( "ui_splash_playercard_idx", var_2 );

                    if ( isplayer( var_0._id_6C6B ) )
                        self _meth_82FB( "ui_splash_playercard_clientnum", var_0._id_6C6B _meth_81B1() );

                    if ( isdefined( var_0._id_6544 ) )
                        self _meth_82FB( "ui_splash_playercard_optional_number", var_0._id_6544 );
                }

                break;
            case "splash":
            case "urgent_splash":
            case "intel_splash":
                self _meth_82FB( "ui_splash_idx", var_2 );

                if ( isdefined( var_0._id_6544 ) )
                    self _meth_82FB( "ui_splash_optional_number", var_0._id_6544 );

                break;
            case "rankup_splash":
                self _meth_82FB( "ui_rankup_splash_idx", var_2 );

                if ( isdefined( var_0._id_0357 ) )
                    self _meth_82FB( "ui_rank_splash_rank", var_0._id_0357 );

                if ( isdefined( var_0._id_0333 ) )
                    self _meth_82FB( "ui_rank_splash_prestige", var_0._id_0333 );

                break;
            case "challenge_splash":
            case "perk_challenge_splash":
                var_2 = int( tablelookup( "mp/allchallengestable.csv", 0, var_0._id_02AB, 27 ) );
                self _meth_82FB( "ui_challenge_splash_idx", var_2 );

                if ( isdefined( var_0.challengetier ) )
                    self _meth_82FB( "ui_challenge_splash_tier", var_0.challengetier );

                if ( isdefined( var_0._id_6544 ) )
                    self _meth_82FB( "ui_challenge_splash_optional_number", var_0._id_6544 );

                break;
            default:
                break;
        }

        self._id_2CE8[var_1] = var_0;

        if ( isdefined( var_0._id_8893 ) )
            self _meth_82F4( var_0._id_8893 );

        if ( isdefined( var_0._id_5658 ) )
        {
            if ( isdefined( var_0._id_5659 ) )
                _id_A75A::_id_5652( var_0._id_5658, var_0._id_5659, 1 );
            else
                _id_A75A::_id_5652( var_0._id_5658 );
        }

        self notify( "actionNotifyMessage" + var_1 );
        self endon( "actionNotifyMessage" + var_1 );
        wait(var_3 + 0.5);
        self._id_2CE8[var_1] = undefined;
    }

    if ( self._id_8A65[var_1].size )
        thread _id_2B3F( var_1 );
}

_id_A04B( var_0 )
{
    var_1 = 0.05;

    while ( !_id_1ADA() )
        wait(var_1);

    while ( var_0 > 0 )
    {
        wait(var_1);

        if ( _id_1ADA() )
            var_0 -= var_1;
    }
}

_id_1ADA()
{
    if ( _id_A73D::_id_5104() )
        return 0;

    return 1;
}

_id_7451()
{
    self endon( "notifyMessageDone" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_744F();
}

_id_7450()
{
    self notify( "resetOnCancel" );
    self endon( "resetOnCancel" );
    self endon( "notifyMessageDone" );
    self endon( "disconnect" );
    level waittill( "cancel_notify" );
    _id_744F();
}

_id_744F()
{
    self._id_6237._id_0037 = 0;
    self._id_6235._id_0037 = 0;
    self._id_622A._id_0037 = 0;
    self._id_6230._id_0037 = 0;
    self._id_2CE8[0] = undefined;
    self._id_2CE8[1] = undefined;
    self._id_2CE8[2] = undefined;
    self._id_2CE8[3] = undefined;
}

_id_58A4()
{
    self endon( "disconnect" );
    self._id_58A3 = [];
    var_0 = "default";

    if ( isdefined( level._id_58A2 ) )
        var_0 = level._id_58A2;

    var_1 = -110;
    var_2 = level._id_58A5;
    var_3 = 1.25;

    if ( level._id_8A76 || self _meth_82CD() && !isai( self ) )
    {
        var_1 -= 40;
        var_2 = level._id_58A5 * 1.3;
        var_3 *= 1.5;
    }

    self._id_58A1 = _id_A79D::_id_2401( var_0, var_2 );
    self._id_58A1 _meth_80CA( "" );
    self._id_58A1._id_0048 = 0;
    self._id_58A1._id_03D5 = 10;
    self._id_58A1._id_03C4 = 0;
    self._id_58A1 _id_A79D::_id_7FE8( "CENTER", level._id_58A7, 0, var_1 );
    self._id_58A8 = _id_A79D::_id_2401( "default", var_3 );
    self._id_58A8 _id_A79D::_id_7FD6( self._id_58A1 );
    self._id_58A8 _id_A79D::_id_7FE8( "TOP", "BOTTOM", 0, 0 );
    self._id_58A8 _meth_80CA( "" );
    self._id_58A8._id_0048 = 0;
    self._id_58A8._id_03D5 = 10;
    self._id_58A8._id_03C4 = 0;
}

_id_65B3( var_0 )
{
    if ( level._id_91E4 )
    {
        if ( var_0 == "tie" )
            _id_59E1( "draw" );
        else if ( var_0 == self._id_04A8 )
            _id_59E1( "victory" );
        else
            _id_59E1( "defeat" );
    }
    else if ( var_0 == self )
        _id_59E1( "victory" );
    else
        _id_59E1( "defeat" );
}

_id_59E1( var_0 )
{
    var_1 = self._id_04A8;
    var_2 = _id_A79D::_id_2401( "bigfixed", 1.0 );
    var_2 _id_A79D::_id_7FE8( "TOP", undefined, 0, 50 );
    var_2._id_019A = 1;
    var_2._id_01BF = 1;
    var_2._id_01EE = 0;
    var_2._id_0048 = 0;
    var_2 _meth_80CA( game["strings"][var_0] );
    var_2._id_0037 = 0;
    var_2 _meth_8084( 0.5 );
    var_2._id_0037 = 1;

    switch ( var_0 )
    {
        case "victory":
            var_2._id_01C0 = game["colors"]["cyan"];
            break;
        default:
            var_2._id_01C0 = game["colors"]["orange"];
            break;
    }

    var_3 = _id_A79D::_id_2420( game["icons"][var_1], 64, 64 );
    var_3 _id_A79D::_id_7FD6( var_2 );
    var_3 _id_A79D::_id_7FE8( "TOP", "BOTTOM", 0, 30 );
    var_3._id_019A = 1;
    var_3._id_01EE = 0;
    var_3._id_0048 = 0;
    var_3._id_0037 = 0;
    var_3 _meth_8084( 0.5 );
    var_3._id_0037 = 1;
    wait 3.0;
    var_2 _id_A79D::_id_28E8();
    var_3 _id_A79D::_id_28E8();
}

_id_50F2()
{
    if ( isdefined( self._id_2CE8[0] ) )
        return 1;

    if ( isdefined( self._id_2CE8[1] ) )
        return 1;

    if ( isdefined( self._id_2CE8[2] ) )
        return 1;

    if ( isdefined( self._id_2CE8[3] ) )
        return 1;

    return 0;
}

_id_91F2( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );
    self notify( "reset_outcome" );
    thread _id_56B2( 32, 1 );
    wait 0.5;
    var_4 = self._id_030D["team"];

    if ( !isdefined( var_4 ) || var_4 != "allies" && var_4 != "axis" )
        var_4 = "allies";

    while ( _id_50F2() )
        wait 0.05;

    self endon( "reset_outcome" );
    var_5 = 0;

    if ( level._id_01B5 == "ctf" && isdefined( var_3 ) && var_3 )
        var_5 = 1;

    if ( var_0 == "halftime" )
    {
        self _meth_82FB( "ui_round_end_title", game["round_end"]["halftime"] );
        var_0 = "allies";

        if ( level._id_01B5 == "ctf" )
            var_5 = 1;
    }
    else if ( var_0 == "intermission" )
    {
        self _meth_82FB( "ui_round_end_title", game["round_end"]["intermission"] );
        var_0 = "allies";
    }
    else if ( var_0 == "roundend" )
    {
        self _meth_82FB( "ui_round_end_title", game["round_end"]["roundend"] );
        var_0 = "allies";
    }
    else if ( var_0 == "none" && _id_A75A::_id_6E98() )
        self _meth_82FB( "ui_round_end_title", game["round_end"]["game_end"] );
    else if ( _id_A75A::_id_5169( var_0 ) )
    {
        self _meth_82FB( "ui_round_end_title", game["round_end"]["overtime"] );

        if ( level._id_01B5 == "ctf" && var_0 == "overtime" )
            var_5 = 1;

        var_0 = "allies";
    }
    else if ( var_0 == "tie" )
    {
        if ( var_1 )
            self _meth_82FB( "ui_round_end_title", game["round_end"]["round_draw"] );
        else
            self _meth_82FB( "ui_round_end_title", game["round_end"]["draw"] );

        var_0 = "allies";
    }
    else if ( self _meth_8432() )
        self _meth_82FB( "ui_round_end_title", game["round_end"]["spectator"] );
    else if ( isdefined( self._id_030D["team"] ) && var_0 == var_4 )
    {
        if ( var_1 )
            self _meth_82FB( "ui_round_end_title", game["round_end"]["round_win"] );
        else if ( isdefined( level.iszombiegame ) && level.iszombiegame && isdefined( level.zmbtransitiontohardmode ) && level.zmbtransitiontohardmode )
            self _meth_82FB( "ui_round_end_title", game["round_end"]["zombies_hard_mode"] );
        else
            self _meth_82FB( "ui_round_end_title", game["round_end"]["victory"] );
    }
    else if ( var_1 )
        self _meth_82FB( "ui_round_end_title", game["round_end"]["round_loss"] );
    else
        self _meth_82FB( "ui_round_end_title", game["round_end"]["defeat"] );

    self _meth_82FB( "ui_round_end_reason", var_2 );

    if ( var_5 && !level._id_A322 )
    {
        self _meth_82FB( "ui_round_end_friendly_score", game["roundsWon"][var_4] );
        self _meth_82FB( "ui_round_end_enemy_score", game["roundsWon"][level._id_65B0[var_4]] );
    }
    else if ( !_id_A75A::_id_5191() || !_id_A75A::_id_515D() )
    {
        self _meth_82FB( "ui_round_end_friendly_score", _id_A78B::_id_05BD( var_4 ) );
        self _meth_82FB( "ui_round_end_enemy_score", _id_A78B::_id_05BD( level._id_65B0[var_4] ) );
    }
    else
    {
        self _meth_82FB( "ui_round_end_friendly_score", game["roundsWon"][var_4] );
        self _meth_82FB( "ui_round_end_enemy_score", game["roundsWon"][level._id_65B0[var_4]] );
    }

    if ( isdefined( self._id_59DC ) )
        self _meth_82FB( "ui_round_end_match_bonus", self._id_59DC );

    if ( isdefined( game["round_time_to_beat"] ) )
        self _meth_82FB( "ui_round_end_stopwatch", int( game["round_time_to_beat"] * 60 ) );

    self _meth_82FB( "ui_round_end", 1 );
}

_id_65B2( var_0, var_1 )
{
    self endon( "disconnect" );
    self notify( "reset_outcome" );

    while ( _id_50F2() )
        wait 0.05;

    self endon( "reset_outcome" );
    var_2 = level._id_685E["all"];
    var_3 = var_2[0];
    var_4 = var_2[1];
    var_5 = var_2[2];
    var_6 = 0;

    if ( isdefined( var_3 ) && self._id_0390 == var_3._id_0390 && self._id_010E == var_3._id_010E )
    {
        if ( self != var_3 )
            var_6 = 1;
        else if ( isdefined( var_4 ) && var_4._id_0390 == var_3._id_0390 && var_4._id_010E == var_3._id_010E )
            var_6 = 1;
    }

    if ( var_6 )
        self _meth_82FB( "ui_round_end_title", game["round_end"]["tie"] );
    else if ( isdefined( var_3 ) && self == var_3 )
        self _meth_82FB( "ui_round_end_title", game["round_end"]["victory"] );
    else
        self _meth_82FB( "ui_round_end_title", game["round_end"]["defeat"] );

    self _meth_82FB( "ui_round_end_reason", var_1 );

    if ( isdefined( self._id_59DC ) )
        self _meth_82FB( "ui_round_end_match_bonus", self._id_59DC );

    self _meth_82FB( "ui_round_end", 1 );
    self waittill( "update_outcome" );
}

_id_1AEA( var_0 )
{

}

_id_56B2( var_0, var_1 )
{
    self _meth_82D9( var_0, var_1 );
}

_id_3E81()
{
    return "mp/splashTable.csv";
}
