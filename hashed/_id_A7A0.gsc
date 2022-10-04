// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    precachestring( &"MP_CHALLENGE_COMPLETED" );

    if ( !_id_5A5D() )
        return;

    level._id_5CD9 = [];
    _id_72EF( "playerKilled", ::_id_1C50 );
    _id_72EF( "playerKilled", ::_id_1C57 );
    _id_72EF( "playerHardpoint", ::_id_1C4F );
    _id_72EF( "playerAssist", ::_id_1C47 );
    _id_72EF( "roundEnd", ::_id_1C52 );
    _id_72EF( "roundEnd", ::_id_1C51 );
    _id_72EF( "vehicleKilled", ::_id_1C56 );
    level thread _id_64C5();
}

_id_5A5D()
{
    if ( _id_A75A::_id_6E98() )
        return 0;

    return level._id_7134;
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( isbot( var_0 ) )
            continue;

        if ( !isdefined( var_0._id_030D["postGameChallenges"] ) )
            var_0._id_030D["postGameChallenges"] = 0;

        var_0 thread _id_64D3();
        var_0 thread _id_4DEF();
        var_0 thread _id_5E2F();
        var_0 thread _id_5ECA();
        var_0 thread _id_5EC9();
        var_0 thread _id_5EB8();
        var_0 thread _id_5E2E();
        var_0 thread _id_5EB1();
        var_0 thread _id_5E73();
        var_0 thread _id_5E5A();
        var_0 thread _id_5E21();
        var_0 thread _id_5EB2();
        var_0 thread monitorpowerslidetime();
        var_0 thread _id_5EDE();
        var_0 thread _id_5E5C();
        var_0 thread _id_5E33();
        var_0 thread _id_5E81();
        var_0 thread _id_5E30();
        var_0 thread _id_5EA2();
        var_0 _meth_82DD( "hold_breath", "+breath_sprint" );
        var_0 _meth_82DD( "hold_breath", "+melee_breath" );
        var_0 _meth_82DD( "release_breath", "-breath_sprint" );
        var_0 _meth_82DD( "release_breath", "-melee_breath" );
        var_0 thread _id_5E6D();
        var_0 _meth_82DD( "jumped", "+goStand" );
        var_0 thread _id_5E7C();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_64CF();
        thread _id_5EC6();
    }
}

_id_64CF()
{
    self endon( "disconnect" );
    self waittill( "death" );

    if ( isdefined( self._id_4740 ) )
        self._id_4740 = 0;
}

_id_5EB8()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "scavenger_pickup" );

        if ( self _meth_8221( "specialty_scavenger" ) && _id_A75A::_id_05CB( "specialty_scavenger" ) && !_id_A75A::_id_512E() )
        {
            _id_6FF3( "ch_scavenger_pro" );
            self._id_4740 = 1;
        }

        wait 0.05;
    }
}

_id_5EC9()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "received_earned_killstreak" );

        if ( self _meth_8221( "specialty_hardline" ) && _id_A75A::_id_05CB( "specialty_hardline" ) )
            _id_6FF3( "ch_hardline_pro" );

        wait 0.05;
    }
}

_id_5E2E()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "survived_explosion", var_0 );

        if ( isdefined( var_0 ) && isplayer( var_0 ) && self == var_0 )
            continue;

        if ( self _meth_8221( "_specialty_blastshield" ) && _id_A75A::_id_05CB( "_specialty_blastshield" ) )
            _id_6FF3( "ch_blastshield_pro" );

        waittillframeend;
    }
}

_id_5E5A()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "revive" );
        _id_6FF3( "ch_livingdead" );
        waittillframeend;
    }
}

_id_4DEF()
{
    var_0 = getarraykeys( level._id_5398 );

    foreach ( var_2 in var_0 )
        self._id_030D[var_2] = 0;

    self._id_030D["lastBulletKillTime"] = 0;
    self._id_030D["bulletStreak"] = 0;
    self._id_357C = [];
}

_id_72EF( var_0, var_1 )
{
    if ( !isdefined( level._id_5CD9[var_0] ) )
        level._id_5CD9[var_0] = [];

    level._id_5CD9[var_0][level._id_5CD9[var_0].size] = var_1;
}

_id_3F2A( var_0 )
{
    if ( isdefined( self._id_1C61[var_0] ) )
        return self._id_1C61[var_0];
    else
        return 0;
}

_id_1C47( var_0 )
{
    var_1 = var_0._id_031D;
    var_1 _id_6FF3( "ch_assists" );
}

_id_1C55( var_0 )
{
    switch ( var_0 )
    {
        case "vulcan_kill":
            _id_6FF3( "ch_streak_orbitallaser" );
            break;
        case "warbird_kill":
            _id_6FF3( "ch_streak_warbird" );
            break;
        case "paladin_kill":
            _id_6FF3( "ch_streak_paladin" );
            break;
        case "missile_strike_kill":
            _id_6FF3( "ch_streak_missle" );
            break;
        case "sentry_gun_kill":
            _id_6FF3( "ch_streak_sentry" );
            break;
        case "strafing_run_kill":
            _id_6FF3( "ch_streak_strafing" );
            break;
        case "assault_drone_kill":
            _id_6FF3( "ch_streak_assault" );
            break;
        case "goliath_kill":
            _id_6FF3( "ch_streak_goliath" );
            break;
        default:
            break;
    }
}

_id_1C4F( var_0 )
{
    if ( isbot( var_0._id_031D ) )
        return;

    var_1 = var_0._id_031D;
    var_1._id_030D[var_0._id_46CC]++;

    switch ( var_0._id_46CC )
    {
        case "uav":
            var_1 _id_6FF3( "ch_uav" );
            var_1 _id_6FF3( "ch_assault_streaks" );

            if ( var_1._id_030D["uav"] >= 3 )
                var_1 _id_6FF3( "ch_nosecrets" );

            break;
        case "airdrop_assault":
            var_1 _id_6FF3( "ch_airdrop_assault" );
            var_1 _id_6FF3( "ch_assault_streaks" );
            break;
        case "airdrop_sentry_minigun":
            var_1 _id_6FF3( "ch_airdrop_sentry_minigun" );
            var_1 _id_6FF3( "ch_assault_streaks" );
            break;
        case "nuke":
            var_1 _id_6FF3( "ch_nuke" );
            break;
    }
}

_id_1C57( var_0 )
{
    if ( !isdefined( var_0._id_0055 ) || !isplayer( var_0._id_0055 ) )
        return;

    if ( !_id_A75A::_id_513A( var_0._id_901E ) )
        return;

    var_1 = var_0._id_0055;

    if ( !isdefined( var_1._id_030D[var_0._id_901E + "_streak"] ) || isdefined( var_1._id_030D[var_0._id_901E + "_streakTime"] ) && gettime() - var_1._id_030D[var_0._id_901E + "_streakTime"] > 7000 )
    {
        var_1._id_030D[var_0._id_901E + "_streak"] = 0;
        var_1._id_030D[var_0._id_901E + "_streakTime"] = gettime();
    }

    var_1._id_030D[var_0._id_901E + "_streak"]++;

    switch ( var_0._id_901E )
    {
        case "artillery_mp":
            var_1 _id_6FF3( "ch_carpetbomber" );

            if ( var_1._id_030D[var_0._id_901E + "_streak"] >= 5 )
                var_1 _id_6FF3( "ch_carpetbomb" );

            if ( isdefined( var_1._id_373C ) )
                var_1 _id_6FF3( "ch_finishingtouch" );

            break;
        case "stealth_bomb_mp":
            var_1 _id_6FF3( "ch_thespirit" );

            if ( var_1._id_030D[var_0._id_901E + "_streak"] >= 6 )
                var_1 _id_6FF3( "ch_redcarpet" );

            if ( isdefined( var_1._id_373C ) )
                var_1 _id_6FF3( "ch_technokiller" );

            break;
        case "sentry_minigun_mp":
            var_1 _id_6FF3( "ch_looknohands" );

            if ( isdefined( var_1._id_373C ) )
                var_1 _id_6FF3( "ch_absentee" );

            break;
        case "ac130_25mm_mp":
        case "ac130_105mm_mp":
        case "ac130_40mm_mp":
            var_1 _id_6FF3( "ch_spectre" );

            if ( isdefined( var_1._id_373C ) )
                var_1 _id_6FF3( "ch_deathfromabove" );

            break;
        case "remotemissile_projectile_mp":
            var_1 _id_6FF3( "ch_predator" );

            if ( var_1._id_030D[var_0._id_901E + "_streak"] >= 4 )
                var_1 _id_6FF3( "ch_reaper" );

            if ( isdefined( var_1._id_373C ) )
                var_1 _id_6FF3( "ch_dronekiller" );

            break;
        case "nuke_mp":
            var_0._id_9DFE _id_6FF3( "ch_radiationsickness" );
            break;
        default:
            break;
    }
}

_id_1C56( var_0 )
{
    if ( !isdefined( var_0._id_0055 ) || !isplayer( var_0._id_0055 ) )
        return;

    var_1 = var_0._id_0055;
    var_2 = _id_A75A::_id_3F0F( var_0._id_901E, 1 );

    if ( _id_A75A::_id_514A( var_2 ) )
        var_2 = _id_A781::_id_3F0E( var_2 );

    var_3 = _id_3CE6( var_0._id_901E, var_2 );

    if ( var_3 == "weapon_launcher" )
    {
        var_1 _id_6FF3( "ch_launcher_kill" );

        if ( isdefined( level._id_1C62["ch_vehicle_" + var_2] ) )
            var_1 _id_6FF3( "ch_vehicle_" + var_2 );

        if ( isdefined( level._id_1C62["ch_marksman_" + var_2] ) )
            var_1 _id_6FF3( "ch_marksman_" + var_2 );
    }

    if ( var_1 _id_A75A::_id_05CB( "specialty_coldblooded" ) && var_1 _id_A75A::_id_05CB( "specialty_spygame" ) && var_1 _id_A75A::_id_05CB( "specialty_heartbreaker" ) )
    {
        if ( !isdefined( var_0._id_9C76 ) || !isdefined( var_0._id_9C76._id_7CC6 ) || var_0._id_9C76._id_7CC6 != "prison_turret" )
            var_1 _id_6FF3( "ch_precision_airhunt" );
    }

    if ( isdefined( var_0._id_9C76 ) && isdefined( var_0._id_9C76._id_04FE ) && var_0._id_9C76._id_04FE == "drone_recon" && issubstr( var_2, "exoknife" ) )
        var_1 _id_6FF3( "ch_precision_knife" );

    if ( var_1 _id_A75A::_id_05CB( "specialty_class_blindeye" ) && ( !isdefined( var_0._id_9C76._id_9D6D ) || var_0._id_9C76._id_9D6D != "vehicle_tracking_drone_mp" ) )
        var_1 _id_6FF3( "ch_perk_blindeye" );
}

_id_1EF0( var_0 )
{
    self endon( "disconnect" );
    self notify( "clearing_expID_" + var_0 );
    self endon( "clearing_expID_" + var_0 );
    wait 3.0;
    self._id_357D[var_0] = undefined;
}

_id_5BCE()
{
    var_0 = self;

    if ( !isdefined( var_0._id_030D["MGStreak"] ) )
    {
        var_0._id_030D["MGStreak"] = 0;
        var_0 thread _id_31B4();

        if ( !isdefined( var_0._id_030D["MGStreak"] ) )
            return;
    }

    var_0._id_030D["MGStreak"]++;

    if ( var_0._id_030D["MGStreak"] >= 5 )
        var_0 _id_6FF3( "ch_mgmaster" );
}

_id_31B4()
{
    self endon( "disconnect" );

    for (;;)
    {
        if ( !isalive( self ) || self _meth_833C() )
        {
            self._id_030D["MGStreak"] = undefined;
            break;
        }

        wait 0.05;
    }
}

_id_31B3()
{
    self._id_030D["MGStreak"] = undefined;
}

_id_535A( var_0 )
{
    if ( !isdefined( self._id_030D["countermvp_streak"] ) || !var_0 )
        self._id_030D["countermvp_streak"] = 0;

    self._id_030D["countermvp_streak"]++;

    if ( self._id_030D["countermvp_streak"] == 3 )
        _id_6FF3( "ch_thebiggertheyare" );
    else if ( self._id_030D["countermvp_streak"] == 5 )
        _id_6FF3( "ch_thehardertheyfall" );

    if ( self._id_030D["countermvp_streak"] >= 10 )
        _id_6FF3( "ch_countermvp" );
}

_id_5117( var_0 )
{
    if ( !isdefined( var_0._id_0390 ) || var_0._id_0390 < 1 )
        return 0;

    var_1 = level._id_0328;

    if ( level._id_91E4 )
        var_2 = var_0._id_030D["team"];
    else
        var_2 = "all";

    var_3 = var_0._id_0390;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( !isdefined( var_1[var_4]._id_0390 ) )
            continue;

        if ( var_1[var_4]._id_0390 < 1 )
            continue;

        if ( var_2 != "all" && var_1[var_4]._id_030D["team"] != var_2 )
            continue;

        if ( var_1[var_4]._id_0390 > var_3 )
            return 0;
    }

    return 1;
}

processchallengedaily( var_0, var_1, var_2 )
{
    if ( !_id_A75A::_id_7136() || _id_A75A::_id_6FCD() )
        return;

    if ( getdvarint( "dailychallenge_killswitch", 0 ) == 0 && getdvarint( "dailychallenge_killswitch2", 0 ) == 0 )
        return;

    var_3 = self _meth_8222( "dailyChallengeId", 0 );
    var_4 = getdvarint( "scr_current_playlist", 0 );
    var_5 = getdvarint( "scr_game_division", 0 );
    var_6 = 0;
    var_6 = var_4 == 1 || var_4 == 2 || var_4 == 3 || var_4 == 4;
    var_7 = 0;
    var_7 = var_4 == 3;

    if ( !isdefined( var_3 ) || !isdefined( var_0 ) || var_3 != var_0 )
        return;

    switch ( var_3 )
    {
        case 1:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "war" && var_8 == "weapon_shotgun" )
                _id_6FF3( "ch_daily_01" );

            break;
        case 2:
            if ( level._id_01B5 == "war" )
                _id_6FF3( "ch_daily_02" );

            break;
        case 3:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "conf" && var_8 == "weapon_sniper" )
                _id_6FF3( "ch_daily_03" );

            break;
        case 4:
            if ( level._id_01B5 == "conf" )
                _id_6FF3( "ch_daily_04" );

            break;
        case 5:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "dom" && var_8 == "weapon_heavy" )
                _id_6FF3( "ch_daily_05" );

            break;
        case 6:
            if ( level._id_01B5 == "dom" )
                _id_6FF3( "ch_daily_06" );

            break;
        case 7:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "dom" && var_8 == "weapon_smg" )
                _id_6FF3( "ch_daily_07" );

            break;
        case 8:
            var_8 = var_1;

            if ( isdefined( var_8 ) && var_6 == 1 && var_8 == "weapon_smg" )
                _id_6FF3( "ch_daily_08" );

            break;
        case 9:
            var_8 = var_1;

            if ( isdefined( var_8 ) && var_6 == 1 && var_8 == "weapon_heavy" )
                _id_6FF3( "ch_daily_09" );

            break;
        case 10:
            var_8 = var_1;

            if ( isdefined( var_8 ) && var_6 == 1 && var_8 == "weapon_launcher" )
                _id_6FF3( "ch_daily_10" );

            break;
        case 11:
            var_9 = var_1;

            if ( isdefined( var_9 ) && var_6 == 1 && _id_A75A::_id_513A( var_9 ) )
                _id_6FF3( "ch_daily_11" );

            break;
        case 12:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "ball" && var_8 == "weapon_shotgun" )
                _id_6FF3( "ch_daily_12" );

            break;
        case 13:
            var_10 = var_1;

            if ( isdefined( var_10 ) && level._id_01B5 == "ball" )
                _id_6FF3( "ch_daily_13", var_10 );

            break;
        case 14:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "hp" && var_8 == "weapon_smg" )
                _id_6FF3( "ch_daily_14" );

            break;
        case 15:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "hp" && var_8 == "weapon_heavy" )
                _id_6FF3( "ch_daily_15" );

            break;
        case 16:
            if ( level._id_01B5 == "ctf" )
                _id_6FF3( "ch_daily_16" );

            break;
        case 17:
            if ( level._id_01B5 == "ctf" )
                _id_6FF3( "ch_daily_17" );

            break;
        case 18:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "ctf" && var_8 == "weapon_smg" )
                _id_6FF3( "ch_daily_18" );

            break;
        case 19:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "ctf" && var_8 == "weapon_heavy" )
                _id_6FF3( "ch_daily_19" );

            break;
        case 20:
            var_9 = var_1;

            if ( isdefined( var_9 ) && issubstr( var_9, "_lefthand" ) )
                var_9 = _id_A75A::_id_8F56( var_9, "_lefthand" );

            if ( isdefined( var_9 ) && level._id_01B5 == "hp" && _id_5045( var_9 ) )
                _id_6FF3( "ch_daily_20" );

            break;
        case 21:
            if ( level._id_01B5 == "conf" )
                _id_6FF3( "ch_daily_21" );

            break;
        case 22:
            var_11 = var_1;
            var_12 = 0;

            foreach ( var_14 in self.ch_unique_earned_streaks )
            {
                if ( var_14 == var_11 )
                {
                    var_12 = 1;
                    break;
                }
            }

            if ( var_12 == 0 )
                self.ch_unique_earned_streaks[self.ch_unique_earned_streaks.size] = var_11;

            if ( self.ch_unique_earned_streaks.size == 4 )
                _id_6FF3( "ch_daily_22" );

            break;
        case 23:
            var_11 = var_1;

            if ( isdefined( var_11 ) && var_11 == "orbital_carepackage" )
                _id_6FF3( "ch_daily_23" );

            break;
        case 24:
            var_9 = var_1;

            if ( isdefined( var_9 ) )
            {
                var_16 = getweaponattachments( var_9 );

                if ( level._id_01B5 == "war" && _id_A75A::_id_50CE( var_9 ) && var_16.size == 3 )
                    _id_6FF3( "ch_daily_24" );
            }

            break;
        case 25:
            if ( level._id_01B5 == "ctf" )
                _id_6FF3( "ch_daily_25" );

            break;
        case 26:
            if ( level._id_01B5 == "dom" )
                _id_6FF3( "ch_daily_26" );

            break;
        case 27:
            if ( level._id_01B5 == "conf" )
                _id_6FF3( "ch_daily_27" );

            break;
        case 28:
            if ( level._id_01B5 == "ball" )
                _id_6FF3( "ch_daily_28" );

            break;
        case 29:
            if ( level._id_01B5 == "twar" )
                _id_6FF3( "ch_daily_29" );

            break;
        case 30:
            if ( level._id_01B5 == "hp" )
                _id_6FF3( "ch_daily_30" );

            break;
        case 31:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "sd" && var_8 == "weapon_assault" )
                _id_6FF3( "ch_daily_31" );

            break;
        case 32:
            var_11 = var_1;

            if ( isdefined( var_11 ) && var_11 == "orbital_strike_laser" )
                _id_6FF3( "ch_daily_32" );

            break;
        case 33:
            if ( var_7 == 1 )
                _id_6FF3( "ch_daily_33" );

            break;
        case 34:
            _id_6FF3( "ch_daily_34" );
            break;
        case 35:
            var_11 = var_1;

            if ( isdefined( var_11 ) && var_11 == "missile_strike" )
                _id_6FF3( "ch_daily_35" );

            break;
        case 36:
            if ( var_6 == 1 )
                _id_6FF3( "ch_daily_36" );

            break;
        case 37:
            if ( var_5 == 1 )
                _id_6FF3( "ch_daily_37" );

            break;
        case 38:
            _id_6FF3( "ch_daily_38" );
            break;
        case 39:
            var_8 = var_1;

            if ( isdefined( var_8 ) && var_5 == 1 && var_8 == "weapon_smg" )
                _id_6FF3( "ch_daily_39" );

            break;
        case 40:
            var_8 = var_1;

            if ( isdefined( var_8 ) && var_5 == 1 && var_8 == "weapon_assault" )
                _id_6FF3( "ch_daily_40" );

            break;
        case 41:
            var_17 = var_1;

            if ( isdefined( var_17 ) && isdefined( self.lastslidetime ) && var_17 - self.lastslidetime < 2000 )
                _id_6FF3( "ch_daily_41" );

            break;
        case 42:
            if ( level._id_01B5 == "hp" )
                _id_6FF3( "ch_daily_42" );

            break;
        case 43:
            var_9 = var_1;

            if ( isdefined( var_9 ) )
            {
                if ( issubstr( var_9, "_lefthand" ) )
                    var_9 = _id_A75A::_id_8F56( var_9, "_lefthand" );

                if ( level._id_01B5 == "twar" && _id_5045( var_9 ) )
                    _id_6FF3( "ch_daily_43" );
            }

            break;
        case 44:
            var_8 = var_1;

            if ( isdefined( var_8 ) && level._id_01B5 == "twar" && var_8 == "weapon_shotgun" )
                _id_6FF3( "ch_daily_44" );

            break;
        case 45:
            var_9 = var_1;

            if ( isdefined( var_9 ) )
            {
                var_16 = getweaponattachments( var_9 );

                if ( level._id_01B5 == "ball" && _id_A75A::_id_50CE( var_9 ) && var_16.size == 3 )
                    _id_6FF3( "ch_daily_45" );
            }

            break;
        default:
            break;
    }
}

_id_1C50( var_0 )
{
    var_0._id_9DFE _id_6C86();

    if ( !isdefined( var_0._id_0055 ) || !isplayer( var_0._id_0055 ) )
        return;
    else
        var_1 = var_0._id_0055;

    if ( isbot( var_1 ) )
        return;

    var_2 = 0;
    var_3 = 0;
    var_4 = 1;
    var_5[var_0._id_9DFE._id_02AB] = var_0._id_9DFE._id_02AB;
    var_6[var_0._id_901E] = var_0._id_901E;
    var_7 = 1;
    var_8 = [];
    var_9 = var_0._id_8676;
    var_10 = var_0._id_04B8;
    var_11 = getweaponattachments( var_0._id_901E );
    var_12 = 0;

    if ( isdefined( var_1._id_6808[var_0._id_901E] ) && !_id_A75A::_id_514D( var_9 ) )
        var_12++;

    var_13 = _id_A75A::_id_513A( var_0._id_901E );
    var_14 = _id_A75A::_id_50FB( var_0._id_901E );
    var_15 = 0;

    if ( var_9 == "MOD_HEAD_SHOT" )
        var_15 = 1;

    var_16 = 0;
    var_17 = 0;

    if ( isdefined( var_0._id_02A2["longshot"] ) )
    {
        var_16 = 1;
        var_17++;
    }

    var_18 = var_0.was_ads;
    var_19 = 0;

    if ( var_1._id_725D == 2 )
        var_19 = 1;

    var_20 = 0;

    if ( var_1._id_725D == 3 )
        var_20 = 1;

    var_21 = "";

    if ( isdefined( var_0._id_0E35 ) )
        var_21 = var_0._id_0E35;

    var_22 = 0;
    var_23 = 0;
    var_24 = 0;
    var_25 = 0;
    var_26 = 0;
    var_27 = 0;

    switch ( var_1._id_537D.size + 1 )
    {
        case 5:
            var_22 = 1;
            break;
        case 10:
            var_23 = 1;
            break;
        case 15:
            var_24 = 1;
            break;
        case 20:
            var_25 = 1;
            break;
        case 25:
            var_26 = 1;
            break;
        case 30:
            var_27 = 1;
            break;
        default:
            break;
    }

    foreach ( var_29 in var_1._id_537D )
    {
        if ( _id_A75A::_id_50CF( var_29._id_901E ) && !_id_A75A::_id_514D( var_29._id_8676 ) )
            var_3++;

        if ( isdefined( var_29._id_02A2["longshot"] ) )
            var_17++;

        if ( var_17 == 3 )
            var_1 _id_6FF3( "ch_precision_farsight" );

        if ( var_10 - var_29._id_04B8 < 10000 )
            var_4++;

        if ( isdefined( var_1._id_6808[var_29._id_901E] ) && !_id_A75A::_id_514D( var_29._id_8676 ) )
        {
            var_12++;

            if ( var_12 == 5 )
                var_1 _id_6FF3( "ch_humiliation_finders" );
        }

        if ( _id_A75A::_id_513A( var_29._id_901E ) )
        {
            if ( !isdefined( var_8[var_29._id_901E] ) )
                var_8[var_29._id_901E] = 0;

            var_8[var_29._id_901E]++;
            continue;
        }

        if ( isdefined( level._id_6488[var_1._id_04A8] ) && var_29._id_04B8 > level._id_6488[var_1._id_04A8] )
            var_2++;

        if ( isdefined( var_29._id_9DFE ) )
        {
            if ( !isdefined( var_5[var_29._id_9DFE._id_02AB] ) && !isdefined( var_6[var_29._id_901E] ) && !_id_A75A::_id_513A( var_29._id_901E ) )
                var_7++;

            var_5[var_29._id_9DFE._id_02AB] = var_29._id_9DFE._id_02AB;
        }

        var_6[var_29._id_901E] = var_29._id_901E;
    }

    var_31 = _id_A75A::_id_3F0F( var_0._id_901E, 1 );

    if ( _id_A75A::_id_514A( var_31 ) )
        var_31 = _id_A781::_id_3F0E( var_31 );

    var_32 = var_31;

    if ( _id_A4F0::_id_8F51( var_31, "iw5_" ) )
        var_32 = getsubstr( var_31, 4 );

    var_33 = _id_3CE6( var_0._id_901E, var_31 );

    if ( level._id_91E4 )
    {
        if ( level._id_91E6[var_0._id_9DFE._id_030D["team"]] > 3 && var_1._id_535F.size >= level._id_91E6[var_0._id_9DFE._id_030D["team"]] )
            var_1 _id_6FF3( "ch_precision_cleanhouse" );
    }

    if ( isdefined( var_1._id_354D ) && var_0._id_9DFE == var_1._id_354D )
        var_1 _id_6FF3( "ch_precision_protected" );

    if ( isdefined( var_1.powerslidetime ) && var_10 - var_1.powerslidetime < 3000 )
        var_1 _id_6FF3( "ch_boot_hero" );

    var_34 = undefined;

    if ( _id_A75A::_id_51B7( var_0._id_901E, "alt_" ) )
        var_34 = getsubstr( var_0._id_901E, 4 );

    if ( isdefined( var_1._id_6808[var_0._id_901E] ) || isdefined( var_34 ) && isdefined( var_1._id_6808[var_34] ) )
    {
        if ( !_id_A75A::_id_514D( var_9 ) )
            var_1 _id_6FF3( "ch_boot_stolen" );
    }

    if ( var_21 == "crouch" )
        var_1 _id_6FF3( "ch_boot_crouch" );

    if ( var_21 == "prone" )
        var_1 _id_6FF3( "ch_boot_prone" );

    if ( var_0._id_9DFE != var_0._id_0055 )
    {
        foreach ( var_36 in var_1._id_57E5 )
        {
            var_37 = undefined;
            var_38 = 0;

            if ( var_36 == "specialty_wildcard_perkslot1" )
            {
                var_38 = 1;
                var_37 = [ "specialty_extended_battery", "specialty_class_lowprofile", "specialty_class_flakjacket", "specialty_class_lightweight", "specialty_class_dangerclose" ];
            }

            if ( var_36 == "specialty_wildcard_perkslot2" )
            {
                var_38 = 2;
                var_37 = [ "specialty_class_blindeye", "specialty_class_coldblooded", "specialty_class_peripherals", "specialty_class_fasthands", "specialty_class_dexterity" ];
            }

            if ( var_36 == "specialty_wildcard_perkslot3" )
            {
                var_38 = 3;
                var_37 = [ "specialty_class_hardwired", "specialty_class_toughness", "specialty_class_scavenger", "specialty_class_hardline", "specialty_exo_blastsuppressor" ];
            }

            if ( isdefined( var_37 ) && var_38 > 0 )
            {
                var_39 = 0;

                foreach ( var_41 in var_1._id_57DB )
                {
                    if ( _id_A4F0::_id_0CE4( var_37, var_41 ) )
                        var_39++;
                }

                if ( var_39 >= 2 && var_38 == 1 && var_36 == "specialty_wildcard_perkslot1" )
                    var_1 _id_6FF3( "ch_wild_perk1" );

                if ( var_39 >= 2 && var_38 == 2 && var_36 == "specialty_wildcard_perkslot2" )
                    var_1 _id_6FF3( "ch_wild_perk2" );

                if ( var_39 >= 2 && var_38 == 3 && var_36 == "specialty_wildcard_perkslot3" )
                    var_1 _id_6FF3( "ch_wild_perk3" );
            }

            if ( var_36 == "specialty_wildcard_primaryattachment" || var_36 == "specialty_wildcard_secondaryattachment" )
            {
                if ( var_36 == "specialty_wildcard_primaryattachment" && _id_A75A::_id_50CE( var_0._id_901E ) && var_11.size >= 3 )
                    var_1 _id_6FF3( "ch_wild_primary" );

                if ( var_36 == "specialty_wildcard_secondaryattachment" && _id_A75A::_id_50CF( var_0._id_901E ) && var_11.size >= 2 )
                    var_1 _id_6FF3( "ch_wild_secondary" );
            }

            if ( var_36 == "specialty_wildcard_dualprimaries" )
            {
                var_43 = var_1._id_57DC;
                var_44 = var_1._id_57DF;

                if ( !_id_A75A::_id_50CE( var_43 ) || !_id_A75A::_id_50CE( var_44 ) )
                    continue;

                var_45 = _id_A75A::_id_3F0F( var_0._id_901E );
                var_46 = undefined;

                if ( var_45 == var_43 )
                    var_46 = var_44;
                else if ( var_45 == var_44 )
                    var_46 = var_43;
                else
                    continue;

                var_47 = var_1._id_537D;
                var_48 = 0;
                var_49 = 0;

                foreach ( var_51 in var_47 )
                {
                    if ( _id_A75A::_id_3F0F( var_51._id_901E ) == var_46 )
                        var_48 = 1;

                    if ( _id_A75A::_id_3F0F( var_51._id_901E ) == var_45 )
                        var_49 = 1;
                }

                if ( var_48 && !var_49 )
                {
                    var_1 _id_6FF3( "ch_wild_overkill" );
                    var_1 processchallengedaily( 2, var_31, var_33 );
                    var_1 processchallengedaily( 42, var_31, var_33 );
                }
            }

            if ( var_36 == "specialty_wildcard_dualtacticals" )
            {
                if ( _id_A75A::_id_501E( var_1._id_57D8 ) && _id_A75A::_id_501E( var_1._id_57DA ) )
                    var_1 _id_6FF3( "ch_wild_exotac" );
            }

            if ( var_36 == "specialty_wildcard_duallethals" && !_id_A75A::isgrapplinghookgamemode() )
            {
                if ( _id_A7B4::_id_5111( var_0._id_901E ) && !issubstr( var_0._id_901E, "exoknife_mp" ) )
                {
                    if ( var_1._id_57D8 != "specialty_null" && _id_A781::_id_51E7( var_1._id_57D8, 0 ) && var_1._id_57DA != "specialty_null" && _id_A781::_id_51E7( var_1._id_57DA, 0 ) )
                        var_1 _id_6FF3( "ch_wild_exobomb" );
                }
            }

            if ( var_36 == "specialty_wildcard_extrastreak" )
            {
                if ( !var_13 )
                    continue;

                if ( var_1._id_53A0.size < 4 )
                    continue;

                var_1 _id_6FF3( "ch_wild_fourthscore" );
            }
        }
    }

    if ( var_0._id_9DFE != var_0._id_0055 )
    {
        var_54 = !level._id_91E4 || var_0._id_9DFE._id_04A8 != var_0._id_0055._id_04A8;

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_lowprofile" ) )
        {
            var_55 = 0;

            if ( isdefined( level._id_99E1 ) )
            {
                if ( level._id_91E4 )
                    var_55 = level._id_99E1[_id_A75A::_id_4065( var_0._id_0055._id_04A8 )].size;
                else if ( level._id_99E1.size > 0 )
                {
                    var_56 = 0;

                    foreach ( var_58 in level._id_99E1 )
                    {
                        if ( var_58._id_02E9 == var_1 )
                            var_56++;
                    }

                    if ( var_56 > 0 )
                        var_55 = level._id_99E1.size - var_56;
                    else
                        var_55 = level._id_99E1.size;
                }
            }

            if ( var_55 > 0 )
                var_1 _id_6FF3( "ch_perk_lowprofile" );
        }

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_quickdraw" ) && var_1 _meth_833E() )
            var_1 _id_6FF3( "ch_perk_quickdraw" );

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_lightweight" ) )
            var_1 _id_6FF3( "ch_perk_lightweight" );

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_coldblooded" ) )
            var_1 _id_6FF3( "ch_perk_coldblood" );

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_peripherals" ) )
            var_1 _id_6FF3( "ch_perk_peripheral" );

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_dexterity" ) && ( var_1 _meth_83D8() || var_1 _meth_8520() ) )
            var_1 _id_6FF3( "ch_perk_gungho" );

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_exo_blastsuppressor" ) )
            var_1 _id_6FF3( "ch_perk_blast" );

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_hardwired" ) )
        {
            var_60 = 0;

            if ( isdefined( level._id_99E1 ) )
            {
                if ( level._id_91E4 )
                {
                    foreach ( var_58 in level._id_99E1[_id_A75A::_id_4065( var_1._id_04A8 )] )
                    {
                        if ( var_58._id_99E5 == "counter" )
                        {
                            var_60 = 1;
                            break;
                        }
                    }

                    if ( isdefined( level._id_308A ) && level._id_308A._id_04A8 != var_1._id_04A8 )
                        var_60 = 1;
                }
                else
                {
                    foreach ( var_58 in level._id_99E1 )
                    {
                        if ( var_58._id_99E5 == "counter" && !( var_58._id_02E9 == var_1 ) )
                        {
                            var_60 = 1;
                            break;
                        }
                    }
                }
            }

            if ( var_60 )
                var_1 _id_6FF3( "ch_perk_hardwire" );
        }

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_fasthands" ) )
        {
            if ( isdefined( var_1._id_55CA ) && gettime() - var_1._id_55CA < 5000 )
                var_1 _id_6FF3( "ch_perk_fasthand" );
        }

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_toughness" ) )
        {
            if ( isdefined( var_1._id_558D ) && gettime() - var_1._id_558D < 2000 )
                var_1 _id_6FF3( "ch_perk_tough" );
        }

        if ( var_54 && var_1 _id_A75A::_id_05CB( "specialty_class_scavenger" ) && isdefined( var_1._id_4740 ) && var_1._id_4740 == 1 )
            var_1 _id_6FF3( "ch_perk_scavenge" );
    }

    if ( var_10 < var_0._id_9DFE._id_20DF )
        var_1 _id_6FF3( "ch_exolauncher_stun" );

    if ( isdefined( var_0._id_9DFE._id_4E3F ) )
        var_1 _id_6FF3( "ch_exolauncher_smoke" );

    foreach ( var_66 in var_0._id_9DFE._id_0675._id_8515 )
    {
        if ( var_66._id_33DB == "PAINT_GRENADE" && var_10 < var_66._id_31C7 )
        {
            var_1 _id_6FF3( "ch_exolauncher_threat" );
            break;
        }
    }

    if ( isdefined( var_0._id_9DFE._id_3086 ) && ( var_0._id_9DFE._id_3086 == 1 || var_10 < var_0._id_9DFE._id_3081 ) )
        var_1 _id_6FF3( "ch_exolauncher_emp" );

    if ( isdefined( var_0._id_9DFE._id_2A52 ) && var_0._id_9DFE._id_2A52 == 1 )
    {
        var_0._id_9DFE._id_2A52 = undefined;
        var_1 _id_6FF3( "ch_exolauncher_tracking" );
    }

    if ( ( var_1._id_57D8 == "adrenaline_mp" || var_1._id_57DA == "adrenaline_mp" ) && var_1._id_65D5 == 1 )
        var_1 _id_6FF3( "ch_exoability_overclock" );

    if ( var_1._id_57D8 == "exocloak_equipment_mp" || var_1._id_57DA == "exocloak_equipment_mp" )
    {
        if ( var_1._id_3474 == 1 || isdefined( var_1._id_3473 ) && var_0._id_04B8 < var_1._id_3473 + 3000 )
            var_1 _id_6FF3( "ch_exoability_cloak" );
    }

    if ( ( var_1._id_57D8 == "exohover_equipment_mp" || var_1._id_57DA == "exohover_equipment_mp" ) && var_1._id_3491 == 1 )
        var_1 _id_6FF3( "ch_exoability_hover" );

    if ( ( var_1._id_57D8 == "exomute_equipment_mp" || var_1._id_57DA == "exomute_equipment_mp" ) && var_1._id_601E == 1 )
        var_1 _id_6FF3( "ch_exoability_mute" );

    if ( ( var_1._id_57D8 == "extra_health_mp" || var_1._id_57DA == "extra_health_mp" ) && var_1._id_348D == 1 )
    {
        if ( isdefined( var_0._id_0055._id_558C ) && var_0._id_04B8 < var_0._id_0055._id_558C + 4000 )
            var_1 _id_6FF3( "ch_exoability_health" );
    }

    foreach ( var_69 in var_11 )
    {
        switch ( var_69 )
        {
            case "opticsacog2":
            case "opticsacog2ar":
                if ( var_18 )
                    var_1 _id_6FF3( "ch_attach_kill_opticsacog2" );

                continue;
            case "ironsights":
            case "opticsreddot":
            case "opticseotech":
            case "variablereddot":
            case "opticstargetenhancer":
                if ( var_18 )
                    var_1 _id_6FF3( "ch_attach_kill_" + var_69 );

                continue;
            case "akimbo":
            case "xmags":
            case "dualmag":
            case "parabolicmicrophone":
            case "foregrip":
            case "firerate":
            case "longrange":
            case "quickdraw":
            case "stock":
            case "lasersight":
            case "trackrounds":
            case "heatsink":
                var_1 _id_6FF3( "ch_attach_kill_" + var_69 );
                continue;
            case "opticsthermal":
            case "opticsthermalar":
                var_1 _id_6FF3( "ch_attach_kill_opticsthermal" );
                continue;
            case "silencer01":
            case "silencerpistol":
            case "silencersniper":
                var_1 _id_6FF3( "ch_attach_kill_silencer01" );
                continue;
            case "stabilizer":
            case "morsstabilizer":
            case "gm6stabilizer":
            case "m990stabilizer":
            case "thorstabilizer":
                var_1 _id_6FF3( "ch_attach_kill_stabilizer" );
                continue;
            case "scopevz":
            case "morsscopevz":
            case "gm6scopevz":
            case "thorscopevz":
            case "m990scopevz":
                var_1 _id_6FF3( "ch_attach_kill_scopevz" );
                continue;
        }
    }

    if ( ( var_9 == "MOD_PISTOL_BULLET" || var_9 == "MOD_RIFLE_BULLET" || var_9 == "MOD_HEAD_SHOT" || var_31 == "iw5_m990" ) && !var_14 && !var_13 )
    {
        switch ( var_33 )
        {
            case "weapon_smg":
                var_1 _id_6FF3( "ch_smg_kill" );

                if ( var_15 )
                    var_1 _id_6FF3( "ch_smg_headshot" );

                break;
            case "weapon_assault":
                var_1 _id_6FF3( "ch_ar_kill" );

                if ( var_15 )
                    var_1 _id_6FF3( "ch_ar_headshot" );

                break;
            case "weapon_shotgun":
                var_1 _id_6FF3( "ch_shotgun_kill" );

                if ( var_15 )
                    var_1 _id_6FF3( "ch_shotgun_headshot" );

                break;
            case "weapon_sniper":
                var_1 _id_6FF3( "ch_sniper_kill" );

                if ( var_15 )
                    var_1 _id_6FF3( "ch_sniper_headshot" );

                break;
            case "weapon_pistol":
                var_1 _id_6FF3( "ch_pistol_kill" );

                if ( var_15 )
                    var_1 _id_6FF3( "ch_pistol_headshot" );

                break;
            case "weapon_heavy":
                var_1 _id_6FF3( "ch_heavy_kill" );

                if ( var_15 )
                    var_1 _id_6FF3( "ch_heavy_headshot" );

                break;
            case "weapon_special":
                var_1 _id_6FF3( "ch_special_kill" );
                break;
            default:
                break;
        }

        if ( var_9 == "MOD_HEAD_SHOT" )
        {
            if ( var_33 == "weapon_pistol" )
                var_1 notify( "increment_pistol_headshots" );
            else if ( var_33 == "weapon_assault" )
                var_1 notify( "increment_ar_headshots" );
        }

        switch ( var_31 )
        {
            case "iw5_dlcgun6":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgun5" );
                break;
            case "iw5_dlcgun6loot5":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgun6" );
                break;
            case "iw5_dlcgun7loot0":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgun7" );
                break;
            case "iw5_dlcgun7loot6":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgun8" );
                break;
            case "iw5_dlcgun8loot1":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgun9" );
                break;
            case "iw5_dlcgun13":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgun10" );
                break;
            case "iw5_dlcgun18":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgun11" );
                break;
            case "iw5_dlcgun23":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcguna" );
                break;
            case "iw5_dlcgun28":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgunb" );
                break;
            case "iw5_dlcgun33":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgunc" );
                break;
            case "iw5_dlcgun38":
                var_1 _id_6FF3( "ch_marksman_iw5_dlcgund" );
                break;
            default:
                var_1 _id_6FF3( "ch_marksman_" + var_31 );
                break;
        }
    }
    else if ( issubstr( var_31, "microdronelauncher" ) && !_id_A75A::_id_514D( var_9 ) )
        var_1 _id_6FF3( "ch_marksman_" + var_31 );
    else if ( issubstr( var_31, "exocrossbow" ) && !_id_A75A::_id_514D( var_9 ) )
        var_1 _id_6FF3( "ch_marksman_" + var_31 );

    if ( issubstr( var_0._id_901E, "iw5_dlcgun12loot7_mp" ) )
        var_1 _id_6FF3( "ch_tier2_1_iw5_dlcgun12" );

    if ( isdefined( var_1.last_grapple_time ) )
    {
        var_71 = var_10 - var_1.last_grapple_time;
        var_72 = undefined;

        if ( isdefined( var_1.last_grapple_time_prev ) )
            var_72 = var_10 - var_1.last_grapple_time_prev;

        if ( var_71 < 0 && isdefined( var_72 ) )
        {
            if ( var_72 < 2000 )
                var_1 _id_6FF3( "ch_tier2_3_iw5_dlcgun12" );
        }
        else if ( var_71 < 2000 && var_71 > 0 )
            var_1 _id_6FF3( "ch_tier2_3_iw5_dlcgun12" );
    }

    var_1 processchallengedaily( 1, var_33, undefined );
    var_1 processchallengedaily( 3, var_33, undefined );
    var_1 processchallengedaily( 5, var_33, undefined );
    var_1 processchallengedaily( 7, var_33, undefined );
    var_1 processchallengedaily( 8, var_33, undefined );
    var_1 processchallengedaily( 9, var_33, undefined );
    var_1 processchallengedaily( 12, var_33, undefined );
    var_1 processchallengedaily( 14, var_33, undefined );
    var_1 processchallengedaily( 15, var_33, undefined );
    var_1 processchallengedaily( 18, var_33, undefined );
    var_1 processchallengedaily( 19, var_33, undefined );
    var_1 processchallengedaily( 24, var_0._id_901E, undefined );
    var_1 processchallengedaily( 31, var_33, undefined );
    var_1 processchallengedaily( 33, undefined, undefined );
    var_1 processchallengedaily( 39, var_33, undefined );
    var_1 processchallengedaily( 40, var_33, undefined );
    var_1 processchallengedaily( 41, var_10, undefined );
    var_1 processchallengedaily( 44, var_33, undefined );
    var_1 processchallengedaily( 45, var_0._id_901E, undefined );
    var_1 processchallengedaily( 20, var_0._id_901E, undefined );
    var_1 processchallengedaily( 43, var_0._id_901E, undefined );
    var_1 processchallengedaily( 11, var_0._id_901E, undefined );

    if ( ( var_9 == "MOD_PISTOL_BULLET" || var_9 == "MOD_RIFLE_BULLET" || var_9 == "MOD_HEAD_SHOT" || var_31 == "iw5_m990" ) && !var_14 && !var_13 )
    {
        switch ( var_33 )
        {
            case "weapon_smg":
            case "weapon_assault":
            case "weapon_sniper":
            case "weapon_shotgun":
            case "weapon_heavy":
            case "weapon_special":
            case "weapon_pistol":
                switch ( var_31 )
                {
                    case "iw5_dlcgun2":
                    case "iw5_dlcgun1":
                    case "iw5_dlcgun3":
                    case "iw5_dlcgun4":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_" + var_32 );
                        break;
                    case "iw5_dlcgun6":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgun5" );
                        break;
                    case "iw5_dlcgun6loot5":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgun6" );
                        break;
                    case "iw5_dlcgun7loot0":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgun7" );
                        break;
                    case "iw5_dlcgun7loot6":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgun8" );
                        break;
                    case "iw5_dlcgun8loot1":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgun9" );
                        break;
                    case "iw5_dlcgun13":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgun10" );
                        break;
                    case "iw5_dlcgun18":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgun11" );
                        break;
                    case "iw5_dlcgun23":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcguna" );
                        break;
                    case "iw5_dlcgun28":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgunb" );
                        break;
                    case "iw5_dlcgun33":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgunc" );
                        break;
                    case "iw5_dlcgun38":
                        var_1 _id_6FF3( "ch_attach_unlock_type1_dlcgund" );
                        break;
                    default:
                        var_1 _id_6FF3( "ch_attach_unlock_kills_" + var_32 );
                        break;
                }

                if ( var_18 )
                {
                    switch ( var_31 )
                    {
                        case "iw5_dlcgun2":
                        case "iw5_dlcgun1":
                        case "iw5_dlcgun3":
                        case "iw5_dlcgun4":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_" + var_32 );
                            break;
                        case "iw5_dlcgun6":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgun5" );
                            break;
                        case "iw5_dlcgun6loot5":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgun6" );
                            break;
                        case "iw5_dlcgun7loot0":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgun7" );
                            break;
                        case "iw5_dlcgun7loot6":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgun8" );
                            break;
                        case "iw5_dlcgun8loot1":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgun9" );
                            break;
                        case "iw5_dlcgun13":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgun10" );
                            break;
                        case "iw5_dlcgun18":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgun11" );
                            break;
                        case "iw5_dlcgun23":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcguna" );
                            break;
                        case "iw5_dlcgun28":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgunb" );
                            break;
                        case "iw5_dlcgun33":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgunc" );
                            break;
                        case "iw5_dlcgun38":
                            var_1 _id_6FF3( "ch_attach_unlock_type3_dlcgund" );
                            break;
                        default:
                            var_1 _id_6FF3( "ch_attach_unlock_ads_" + var_32 );
                            break;
                    }
                }
                else
                {
                    switch ( var_31 )
                    {
                        case "iw5_dlcgun2":
                        case "iw5_dlcgun1":
                        case "iw5_dlcgun3":
                        case "iw5_dlcgun4":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_" + var_32 );
                            break;
                        case "iw5_dlcgun6":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_dlcgun5" );
                            break;
                        case "iw5_dlcgun7loot0":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_dlcgun7" );
                            break;
                        case "iw5_dlcgun7loot6":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_dlcgun8" );
                            break;
                        case "iw5_dlcgun13":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_dlcgun10" );
                            break;
                        case "iw5_dlcgun18":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_dlcgun11" );
                            break;
                        case "iw5_dlcgun23":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_dlcguna" );
                            break;
                        case "iw5_dlcgun28":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_dlcgunb" );
                            break;
                        case "iw5_dlcgun33":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_dlcgunc" );
                            break;
                        case "iw5_dlcgun38":
                            var_1 _id_6FF3( "ch_attach_unlock_type2_dlcgund" );
                            break;
                        default:
                            var_1 _id_6FF3( "ch_attach_unlock_hipfirekills_" + var_32 );
                            break;
                    }
                }
            default:
                break;
        }

        if ( var_9 == "MOD_HEAD_SHOT" )
        {
            switch ( var_31 )
            {
                case "iw5_dlcgun6loot5":
                    var_1 _id_6FF3( "ch_attach_unlock_type2_dlcgun6" );
                    break;
                default:
                    var_1 _id_6FF3( "ch_attach_unlock_headShots_" + var_32 );
                    break;
            }
        }
    }

    if ( isdefined( var_1._id_754F ) )
    {
        if ( var_10 - var_1._id_754F._id_007D < 3000 )
            var_1 _id_6FF3( "ch_attach_unlock_postplant_riotshieldt6" );
    }

    if ( _id_A75A::_id_514D( var_9 ) && !var_14 && !var_13 )
    {
        if ( !issubstr( var_31, "riotshield" ) )
        {
            var_1._id_030D["meleeKillStreak"]++;

            foreach ( var_69 in var_11 )
            {
                if ( var_69 == "tactical" )
                    var_1 _id_6FF3( "ch_attach_kill_tactical" );
            }
        }
        else if ( issubstr( var_31, "riotshield" ) )
        {
            if ( var_31 == "iw5_riotshieldt6" )
            {
                var_1 _id_6FF3( "ch_attach_unlock_meleekills_riotshieldt6" );
                var_1 _id_6FF3( "ch_marksman_iw5_riotshieldt6" );
                var_1 _id_6FF3( "ch_special_kill" );
                var_1._id_030D["shieldKillStreak"]++;
            }
        }

        if ( issubstr( var_31, "exoshield" ) )
            var_1 _id_6FF3( "ch_exoability_shield" );

        if ( issubstr( var_31, "combatknife" ) )
            var_1 notify( "increment_knife_kill" );
    }

    if ( issubstr( var_9, "MOD_IMPACT" ) && !var_14 && !var_13 )
    {
        if ( issubstr( var_0._id_901E, "exoknife_mp" ) )
        {
            var_1 notify( "increment_knife_kill" );
            var_1 _id_6FF3( "ch_exolauncher_knife" );

            if ( var_16 )
                var_1 _id_6FF3( "ch_humiliation_hailmary" );

            foreach ( var_36 in var_1._id_57E5 )
            {
                if ( var_36 == "specialty_wildcard_duallethals" && !_id_A75A::isgrapplinghookgamemode() )
                {
                    var_76 = _id_A75A::_id_8F56( var_1._id_57D8, "_lefthand" );
                    var_77 = _id_A75A::_id_8F56( var_1._id_57DA, "_lefthand" );

                    if ( _id_5045( var_76 ) && _id_5045( var_77 ) )
                        var_1 notify( "increment_duallethal_kills" );

                    break;
                }
            }
        }

        if ( var_31 == "iw5_microdronelauncher" && isdefined( level._id_1C62["ch_impact_iw5_microdronelauncher"] ) )
            var_1 _id_6FF3( "ch_impact_iw5_microdronelauncher" );

        if ( var_31 == "iw5_exocrossbow" )
        {
            if ( isdefined( level._id_1C62["ch_attach_unlock_kills_" + var_32] ) )
                var_1 _id_6FF3( "ch_attach_unlock_kills_" + var_32 );

            if ( var_18 )
            {
                if ( isdefined( level._id_1C62["ch_attach_unlock_ads_" + var_32] ) )
                    var_1 _id_6FF3( "ch_attach_unlock_ads_" + var_32 );
            }
        }
    }

    if ( issubstr( var_9, "MOD_GRENADE" ) || issubstr( var_9, "MOD_PROJECTILE" ) || issubstr( var_9, "MOD_EXPLOSIVE" ) && !var_14 && !var_13 )
    {
        switch ( var_33 )
        {
            case "weapon_special":
                var_1 _id_6FF3( "ch_special_kill" );
                break;
            default:
        }

        if ( var_31 == "iw5_exocrossbow" )
        {
            if ( isdefined( level._id_1C62["ch_attach_unlock_kills_" + var_32] ) )
                var_1 _id_6FF3( "ch_attach_unlock_kills_" + var_32 );

            if ( var_18 )
            {
                if ( isdefined( level._id_1C62["ch_attach_unlock_ads_" + var_32] ) )
                    var_1 _id_6FF3( "ch_attach_unlock_ads_" + var_32 );
            }
        }

        if ( _id_A75A::_id_51B7( var_0._id_901E, "frag_" ) )
        {
            var_1 _id_6FF3( "ch_exolauncher_frag" );

            if ( var_0._id_9DFE._id_357C["cookedKill"] )
                var_1 _id_6FF3( "ch_precision_masterchef" );

            if ( var_0._id_9DFE._id_357C["throwbackKill"] )
                var_1 _id_6FF3( "ch_precision_return" );
        }

        if ( _id_A75A::_id_51B7( var_0._id_901E, "semtex_" ) )
            var_1 _id_6FF3( "ch_exolauncher_semtex" );

        if ( _id_A75A::_id_51B7( var_0._id_901E, "explosive_drone" ) )
            var_1 _id_6FF3( "ch_exolauncher_explosive_drone" );

        if ( isdefined( var_0._id_301F._id_00AB ) && var_0._id_301F._id_00AB == "scriptable" )
        {
            var_1 _id_6FF3( "ch_boot_vandalism" );
            var_1 _id_6FF3( "ch_precision_sitaware" );
        }

        if ( isdefined( var_0._id_901E ) && var_0._id_901E == "mp_lab_gas_explosion" )
            var_1 _id_6FF3( "ch_precision_sitaware" );

        if ( issubstr( var_0._id_901E, "frag" ) || issubstr( var_0._id_901E, "semtex" ) || issubstr( var_0._id_901E, "explosive_drone" ) )
        {
            foreach ( var_36 in var_1._id_57E5 )
            {
                if ( var_36 == "specialty_wildcard_duallethals" && !_id_A75A::isgrapplinghookgamemode() )
                {
                    var_76 = _id_A75A::_id_8F56( var_1._id_57D8, "_lefthand" );
                    var_77 = _id_A75A::_id_8F56( var_1._id_57DA, "_lefthand" );

                    if ( _id_5045( var_76 ) && _id_5045( var_77 ) )
                        var_1 notify( "increment_duallethal_kills" );

                    break;
                }
            }
        }

        if ( _id_A75A::_id_5177( var_1 ) && var_1 _id_A75A::_id_05CB( "specialty_class_dangerclose" ) )
            var_1 _id_6FF3( "ch_perk_dangerclose" );
    }

    foreach ( var_69 in var_11 )
    {
        switch ( var_69 )
        {
            case "gl":
                if ( isdefined( level._id_1C62["ch_attach_kill_" + var_69] ) )
                    var_1 _id_6FF3( "ch_attach_kill_" + var_69 );

                continue;
        }
    }

    if ( issubstr( var_9, "MOD_EXPLOSIVE" ) && var_0._id_901E == "airdrop_trap_explosive_mp" )
        var_1 _id_6FF3( "ch_precision_surprise" );

    if ( !_id_A75A::_id_514D( var_9 ) && ( var_9 == "MOD_PISTOL_BULLET" || var_9 == "MOD_RIFLE_BULLET" || var_9 == "MOD_HEAD_SHOT" || var_31 == "iw5_microdronelauncher" || var_31 == "iw5_exocrossbow" || var_31 == "iw5_m990" ) )
    {
        if ( var_16 )
        {
            if ( var_33 == "weapon_assault" || var_33 == "weapon_sniper" || var_31 == "iw5_exocrossbow" || var_33 == "weapon_heavy" )
            {
                switch ( var_31 )
                {
                    case "iw5_dlcgun2":
                    case "iw5_dlcgun1":
                        var_1 _id_6FF3( "ch_tier1_1_" + var_31 );
                        break;
                    case "iw5_dlcgun6":
                        var_1 _id_6FF3( "ch_tier1_1_iw5_dlcgun5" );
                        break;
                    case "iw5_dlcgun6loot5":
                        var_1 _id_6FF3( "ch_tier1_1_iw5_dlcgun6" );
                        break;
                    case "iw5_dlcgun7loot0":
                        var_1 _id_6FF3( "ch_tier1_1_iw5_dlcgun7" );
                        break;
                    case "iw5_dlcgun7loot6":
                        var_1 _id_6FF3( "ch_tier1_1_iw5_dlcgun8" );
                        break;
                    case "iw5_dlcgun23":
                        var_1 _id_6FF3( "ch_tier1_1_iw5_dlcguna" );
                        break;
                    case "iw5_dlcgun33":
                        var_1 _id_6FF3( "ch_tier1_1_iw5_dlcgunc" );
                        break;
                    default:
                        var_1 _id_6FF3( "ch_longshot_" + var_31 );
                        break;
                }
            }
        }

        if ( !var_18 )
        {
            if ( var_33 == "weapon_shotgun" || var_33 == "weapon_smg" || var_33 == "weapon_heavy" || var_31 == "iw5_microdronelauncher" )
            {
                switch ( var_31 )
                {
                    case "iw5_dlcgun2":
                    case "iw5_dlcgun4":
                        var_1 _id_6FF3( "ch_tier1_2_" + var_31 );
                        break;
                    case "iw5_dlcgun8loot1":
                        var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgun9" );
                        break;
                    case "iw5_dlcgun18":
                        var_1 _id_6FF3( "ch_tier1_1_iw5_dlcgun11" );
                        break;
                    case "iw5_dlcgun28":
                        var_1 _id_6FF3( "ch_tier1_1_iw5_dlcgunb" );
                        break;
                    case "iw5_dlcgun38":
                        var_1 _id_6FF3( "ch_tier1_1_iw5_dlcgund" );
                        break;
                    default:
                        var_1 _id_6FF3( "ch_hip_" + var_31 );
                        break;
                }
            }
        }

        if ( issubstr( var_31, "iw5_exocrossbow" ) )
        {
            if ( !var_18 )
                var_1 _id_6FF3( "ch_hip_iw5_exocrossbow" );
        }

        if ( var_15 )
        {
            switch ( var_33 )
            {
                case "weapon_smg":
                case "weapon_assault":
                case "weapon_sniper":
                case "weapon_shotgun":
                case "weapon_special":
                case "weapon_pistol":
                    switch ( var_31 )
                    {
                        case "iw5_dlcgun1":
                        case "iw5_dlcgun3":
                            var_1 _id_6FF3( "ch_tier1_2_" + var_31 );
                            break;
                        case "iw5_dlcgun6":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgun5" );
                            break;
                        case "iw5_dlcgun6loot5":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgun6" );
                            break;
                        case "iw5_dlcgun7loot0":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgun7" );
                            break;
                        case "iw5_dlcgun7loot6":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgun8" );
                            break;
                        case "iw5_dlcgun13":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgun10" );
                            break;
                        case "iw5_dlcgun18":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgun11" );
                            break;
                        case "iw5_dlcgun23":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcguna" );
                            break;
                        case "iw5_dlcgun28":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgunb" );
                            break;
                        case "iw5_dlcgun33":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgunc" );
                            break;
                        case "iw5_dlcgun38":
                            var_1 _id_6FF3( "ch_tier1_2_iw5_dlcgund" );
                            break;
                        default:
                            var_1 _id_6FF3( "ch_headshot_" + var_31 );
                            break;
                    }

                    break;
            }
        }

        if ( var_31 == "iw5_microdronelauncher" )
        {
            if ( isdefined( level._id_1C62["ch_kills_iw5_microdronelauncher"] ) )
                var_1 _id_6FF3( "ch_kills_iw5_microdronelauncher" );
        }
    }

    if ( !_id_A75A::_id_514D( var_9 ) && var_33 == "weapon_launcher" )
    {
        if ( isdefined( level._id_1C62["ch_kills_" + var_31] ) )
            var_1 _id_6FF3( "ch_kills_" + var_31 );

        var_1 processchallengedaily( 10, var_33, undefined );

        if ( issubstr( var_0._id_9DFE._id_02A0, "npc_exo_armor_mp_base" ) )
        {
            var_1 _id_6FF3( "ch_launcher_kill" );

            if ( isdefined( level._id_1C62["ch_vehicle_" + var_31] ) )
                var_1 _id_6FF3( "ch_vehicle_" + var_31 );

            if ( isdefined( level._id_1C62["ch_goliath_" + var_31] ) )
                var_1 _id_6FF3( "ch_goliath_" + var_31 );
        }
    }

    if ( var_22 || var_23 || var_24 || var_25 || var_26 || var_27 )
    {
        if ( var_33 == "weapon_sniper" )
        {
            switch ( var_31 )
            {
                case "iw5_dlcgun6loot5":
                    var_1 _id_6FF3( "ch_tier2_2_iw5_dlcgun6" );
                    break;
                default:
                    var_1 _id_6FF3( "ch_blood_" + var_31 );
                    break;
            }
        }
        else if ( var_33 == "weapon_assault" || var_33 == "weapon_heavy" || var_31 == "iw5_microdronelauncher" )
        {
            switch ( var_31 )
            {
                case "iw5_dlcgun2":
                case "iw5_dlcgun1":
                    var_1 _id_6FF3( "ch_tier2_2_" + var_31 );
                    break;
                case "iw5_dlcgun6":
                    var_1 _id_6FF3( "ch_tier2_2_iw5_dlcgun5" );
                    break;
                case "iw5_dlcgun7loot0":
                    var_1 _id_6FF3( "ch_tier2_2_iw5_dlcgun7" );
                    break;
                case "iw5_dlcgun7loot6":
                    var_1 _id_6FF3( "ch_tier2_2_iw5_dlcgun8" );
                    break;
                case "iw5_dlcgun23":
                    var_1 _id_6FF3( "ch_tier2_2_iw5_dlcguna" );
                    break;
                case "iw5_dlcgun33":
                    var_1 _id_6FF3( "ch_tier2_2_iw5_dlcgunc" );
                    break;
                default:
                    var_1 _id_6FF3( "ch_triple_" + var_31 );
                    break;
            }
        }
    }

    if ( var_11.size == 0 )
    {
        if ( !issubstr( var_9, "MOD_MELEE" ) )
        {
            switch ( var_33 )
            {
                case "weapon_smg":
                case "weapon_assault":
                case "weapon_sniper":
                case "weapon_shotgun":
                case "weapon_heavy":
                case "weapon_special":
                case "weapon_pistol":
                    switch ( var_31 )
                    {
                        case "iw5_dlcgun2":
                        case "iw5_dlcgun1":
                        case "iw5_dlcgun3":
                        case "iw5_dlcgun4":
                            var_1 _id_6FF3( "ch_tier2_4_" + var_31 );
                            break;
                        case "iw5_dlcgun6":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgun5" );
                            break;
                        case "iw5_dlcgun6loot5":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgun6" );
                            break;
                        case "iw5_dlcgun7loot0":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgun7" );
                            break;
                        case "iw5_dlcgun7loot6":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgun8" );
                            break;
                        case "iw5_dlcgun8loot1":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgun9" );
                            break;
                        case "iw5_dlcgun13":
                            var_1 _id_6FF3( "ch_tier2_3_iw5_dlcgun10" );
                            break;
                        case "iw5_dlcgun18":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgun11" );
                            break;
                        case "iw5_dlcgun23":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcguna" );
                            break;
                        case "iw5_dlcgun28":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgunb" );
                            break;
                        case "iw5_dlcgun33":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgunc" );
                            break;
                        case "iw5_dlcgun38":
                            var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgund" );
                            break;
                        default:
                            var_1 _id_6FF3( "ch_barebone_" + var_31 );
                            break;
                    }

                    break;
            }
        }
    }

    var_83 = 0;

    foreach ( var_85 in var_1._id_57DB )
    {
        if ( var_85 == "specialty_null" )
        {
            var_83++;
            continue;
        }

        break;
    }

    if ( var_83 == 6 && !_id_A75A::_id_514D( var_9 ) )
    {
        switch ( var_33 )
        {
            case "weapon_smg":
            case "weapon_assault":
            case "weapon_sniper":
            case "weapon_shotgun":
            case "weapon_heavy":
            case "weapon_special":
            case "weapon_pistol":
                switch ( var_31 )
                {
                    case "iw5_dlcgun2":
                    case "iw5_dlcgun1":
                    case "iw5_dlcgun3":
                    case "iw5_dlcgun4":
                        var_1 _id_6FF3( "ch_tier2_5_" + var_31 );
                        break;
                    case "iw5_dlcgun6":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcgun5" );
                        break;
                    case "iw5_dlcgun6loot5":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcgun6" );
                        break;
                    case "iw5_dlcgun7loot0":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcgun7" );
                        break;
                    case "iw5_dlcgun7loot6":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcgun8" );
                        break;
                    case "iw5_dlcgun8loot1":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcgun9" );
                        break;
                    case "iw5_dlcgun13":
                        var_1 _id_6FF3( "ch_tier2_4_iw5_dlcgun10" );
                        break;
                    case "iw5_dlcgun18":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcgun11" );
                        break;
                    case "iw5_dlcgun23":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcguna" );
                        break;
                    case "iw5_dlcgun28":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcgunb" );
                        break;
                    case "iw5_dlcgun33":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcgunc" );
                        break;
                    case "iw5_dlcgun38":
                        var_1 _id_6FF3( "ch_tier2_5_iw5_dlcgund" );
                        break;
                    default:
                        var_1 _id_6FF3( "ch_noperk_" + var_31 );
                        break;
                }

                break;
        }
    }

    if ( isdefined( var_1.patient_zero ) )
    {
        var_1.patient_zero++;

        if ( var_1.patient_zero == 3 )
            var_1 _id_6FF3( "ch_infect_patientzero" );
    }
}

_id_3CE6( var_0, var_1 )
{
    var_2 = _id_A75A::_id_4164( var_0 );

    if ( !isdefined( var_1 ) )
    {
        var_1 = _id_A75A::_id_3F0F( var_0, 1 );

        if ( _id_A75A::_id_514A( var_1 ) )
            var_1 = _id_A781::_id_3F0E( var_1 );
    }

    if ( var_1 == "iw5_exocrossbow" || var_1 == "iw5_exocrossbowblops2" )
        return "weapon_special";

    if ( var_1 == "iw5_maaws" || var_1 == "iw5_mahem" || var_1 == "iw5_stingerm7" )
        return "weapon_launcher";

    return var_2;
}

_id_1C48( var_0, var_1, var_2, var_3 )
{
    if ( !_id_A75A::_id_50FB( var_0._id_901E ) )
        var_1 _id_31B3();

    if ( _id_A75A::_id_513A( var_0._id_901E ) )
        return;

    if ( isbot( var_1 ) )
        return;

    if ( var_1._id_030D["lastBulletKillTime"] == var_2 )
        var_1._id_030D["bulletStreak"]++;
    else
        var_1._id_030D["bulletStreak"] = 1;

    var_1._id_030D["lastBulletKillTime"] = var_2;

    if ( !var_0._id_9DFF )
        var_1 _id_6FF3( "ch_hardlanding" );

    if ( !var_0._id_0E32 )
        var_1._id_030D["midairStreak"]++;

    if ( var_1._id_030D["midairStreak"] == 2 )
        var_1 _id_6FF3( "ch_airborne" );

    if ( var_2 < var_0._id_9DFE._id_38AF )
        var_1 _id_6FF3( "ch_flashbangvet" );

    if ( var_2 < var_1._id_38AF )
        var_1 _id_6FF3( "ch_blindfire" );

    if ( var_2 < var_0._id_9DFE._id_20DF )
        var_1 _id_6FF3( "ch_concussionvet" );

    if ( var_2 < var_1._id_20DF )
        var_1 _id_6FF3( "ch_slowbutsure" );

    if ( var_1._id_030D["bulletStreak"] == 2 )
    {
        if ( isdefined( var_0._id_02A2["headshot"] ) )
        {
            foreach ( var_5 in var_1._id_537D )
            {
                if ( var_5._id_04B8 != var_2 )
                    continue;

                if ( !isdefined( var_0._id_02A2["headshot"] ) )
                    continue;

                var_1 _id_6FF3( "ch_allpro" );
            }
        }

        if ( var_3 == "weapon_sniper" )
            var_1 _id_6FF3( "ch_collateraldamage" );
    }

    if ( var_3 == "weapon_pistol" )
    {
        if ( isdefined( var_0._id_9DFE._id_0E2C ) && isdefined( var_0._id_9DFE._id_0E2C[var_1._id_444D] ) )
        {
            if ( isdefined( var_0._id_9DFE._id_0E2C[var_1._id_444D]._id_5181 ) )
                var_1 _id_6FF3( "ch_fastswap" );
        }
    }

    if ( !isdefined( var_1._id_4C57 ) || !var_1._id_4C57 )
    {
        if ( var_0._id_0E35 == "crouch" )
            var_1 _id_6FF3( "ch_crouchshot" );
        else if ( var_0._id_0E35 == "prone" )
        {
            var_1 _id_6FF3( "ch_proneshot" );

            if ( var_3 == "weapon_sniper" )
                var_1 _id_6FF3( "ch_invisible" );
        }
    }

    if ( var_3 == "weapon_sniper" )
    {
        if ( isdefined( var_0._id_02A2["oneshotkill"] ) )
            var_1 _id_6FF3( "ch_ghillie" );
    }

    if ( issubstr( var_0._id_901E, "silencer" ) )
        var_1 _id_6FF3( "ch_stealthvet" );
}

_id_1C51( var_0 )
{
    var_1 = var_0._id_031D;

    if ( var_1._id_A1B5 )
    {
        var_2 = var_1._id_030D["deaths"];
        var_3 = var_1._id_030D["kills"];
        var_4 = 1000000;

        if ( var_2 > 0 )
            var_4 = var_3 / var_2;

        if ( var_4 >= 5.0 && var_3 >= 5.0 )
            var_1 _id_6FF3( "ch_starplayer" );

        if ( var_2 == 0 && _id_A75A::_id_412A() > 300000 )
            var_1 _id_6FF3( "ch_flawless" );

        if ( level._id_685E["all"].size < 3 )
            return;

        if ( var_1._id_0390 > 0 )
        {
            switch ( level._id_01B5 )
            {
                case "dm":
                    if ( var_0._id_6858 < 3 )
                    {
                        var_1 _id_6FF3( "ch_victor_dm" );
                        var_1 _id_6FF3( "ch_ffa_win" );
                    }

                    var_1 _id_6FF3( "ch_ffa_participate" );
                    break;
                case "war":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_war_win" );

                    var_1 _id_6FF3( "ch_war_participate" );
                    break;
                case "kc":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_kc_win" );

                    var_1 _id_6FF3( "ch_kc_participate" );
                    break;
                case "dd":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_dd_win" );

                    var_1 _id_6FF3( "ch_dd_participate" );
                    break;
                case "koth":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_koth_win" );

                    var_1 _id_6FF3( "ch_koth_participate" );
                    break;
                case "sab":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_sab_win" );

                    var_1 _id_6FF3( "ch_sab_participate" );
                    break;
                case "sd":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_sd_win" );

                    var_1 _id_6FF3( "ch_sd_participate" );
                    break;
                case "dom":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_dom_win" );

                    var_1 _id_6FF3( "ch_dom_participate" );
                    break;
                case "ctf":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_ctf_win" );

                    var_1 _id_6FF3( "ch_ctf_participate" );
                    break;
                case "tdef":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_tdef_win" );

                    var_1 _id_6FF3( "ch_tdef_participate" );
                    break;
                case "hp":
                    if ( var_0._id_A339 )
                        var_1 _id_6FF3( "ch_hp_win" );

                    var_1 _id_6FF3( "ch_hp_participate" );
            }
        }
    }
}

_id_1C52( var_0 )
{
    if ( !var_0._id_A339 )
        return;

    var_1 = var_0._id_031D;

    if ( var_1._id_A1B5 )
    {
        switch ( level._id_01B5 )
        {
            case "war":
                if ( level._id_46C7 )
                {
                    var_1 _id_6FF3( "ch_teamplayer_hc" );

                    if ( var_0._id_6858 == 0 )
                        var_1 _id_6FF3( "ch_mvp_thc" );
                }
                else
                {
                    var_1 _id_6FF3( "ch_teamplayer" );

                    if ( var_0._id_6858 == 0 )
                        var_1 _id_6FF3( "ch_mvp_tdm" );
                }

                break;
            case "sab":
                var_1 _id_6FF3( "ch_victor_sab" );
                break;
            case "sd":
                var_1 _id_6FF3( "ch_victor_sd" );
                break;
            case "hp":
            case "dm":
            case "ctf":
            case "dom":
            case "koth":
            case "hc":
                break;
            default:
                break;
        }
    }
}

_id_6C7F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );

    if ( isdefined( var_1 ) )
        var_1 endon( "disconnect" );

    wait 0.05;
    _id_A75A::_id_A0EB();
    var_6 = spawnstruct();
    var_6._id_9DFE = self;
    var_6._id_301F = var_0;
    var_6._id_0055 = var_1;
    var_6._id_4B51 = var_2;
    var_6._id_8676 = var_3;
    var_6._id_901E = var_4;
    var_6._id_83C8 = var_5;
    var_6._id_9DFF = var_6._id_9DFE _meth_8341();

    if ( isplayer( var_1 ) )
    {
        var_6._id_0E2E = isdefined( var_6._id_0055._id_024D );
        var_6._id_0E32 = var_6._id_0055 _meth_8341();
        var_6._id_0E35 = var_6._id_0055 _meth_817C();
    }
    else
    {
        var_6._id_0E2E = 0;
        var_6._id_0E32 = 0;
        var_6._id_0E35 = "stand";
    }

    if ( isdefined( self ) && isdefined( var_1 ) && isdefined( self._id_04A8 ) && isdefined( var_1._id_04A8 ) )
    {
        if ( self._id_04A8 != var_1._id_04A8 && _id_A75A::_id_05CB( "specialty_class_flakjacket" ) && isexplosivedamagemod( var_6._id_8676 ) && _id_A75A::_id_5186( self ) && var_4 != "killstreak_solar_mp" )
            _id_6FF3( "ch_perk_flakjack" );

        if ( self._id_04A8 != var_1._id_04A8 && _id_A75A::_id_05CB( "specialty_class_toughness" ) )
            self._id_558D = gettime();
    }

    _id_2CFA( "playerDamaged", var_6 );
}

_id_6CD4( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self._id_0BA0 = self _meth_833B();

    if ( isdefined( var_1 ) )
        var_1._id_0BA1 = var_1 _meth_833B();

    self endon( "disconnect" );
    var_8 = spawnstruct();
    var_8._id_9DFE = self;
    var_8._id_301F = var_0;
    var_8._id_0055 = var_1;
    var_8._id_4B51 = var_2;
    var_8._id_8676 = var_3;
    var_8._id_901E = var_4;
    var_8._id_8A9F = var_5;
    var_8._id_83C8 = var_6;
    var_8._id_04B8 = gettime();
    var_8._id_02A2 = var_7;
    var_8._id_9DFF = var_8._id_9DFE _meth_8341();

    if ( isplayer( var_1 ) )
    {
        var_8._id_0E2E = isdefined( var_8._id_0055._id_024D );
        var_8._id_0E32 = var_8._id_0055 _meth_8341();
        var_8._id_0E35 = var_8._id_0055 _meth_817C();
    }
    else
    {
        var_8._id_0E2E = 0;
        var_8._id_0E32 = 0;
        var_8._id_0E35 = "stand";
    }

    var_9 = 0;

    if ( isdefined( var_8._id_301F ) && isdefined( var_8._id_301F.firedads ) )
        var_9 = var_8._id_301F.firedads;
    else if ( isdefined( var_1 ) && isplayer( var_1 ) )
        var_9 = var_1 _meth_8340();

    var_8.was_ads = 0;

    if ( var_9 >= 0.2 )
        var_8.was_ads = 1;

    _id_9FFE( var_8 );

    if ( isdefined( var_1 ) && _id_A75A::_id_5186( var_1 ) )
        var_1._id_537D[var_1._id_537D.size] = var_8;

    var_8._id_0055 notify( "playerKilledChallengesProcessed" );
}

_id_9D70( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = spawnstruct();
    var_7._id_9C76 = var_1;
    var_7._id_9DFE = var_0;
    var_7._id_301F = var_2;
    var_7._id_0055 = var_3;
    var_7._id_4B51 = var_4;
    var_7._id_8676 = var_5;
    var_7._id_901E = var_6;
    var_7._id_04B8 = gettime();
    _id_2CFA( "vehicleKilled", var_7 );
}

_id_9FFE( var_0 )
{
    if ( isdefined( var_0._id_0055 ) )
        var_0._id_0055 endon( "disconnect" );

    self._id_6FF8 = 1;
    wait 0.05;
    _id_A75A::_id_A0EB();
    _id_2CFA( "playerKilled", var_0 );
    self._id_6FF8 = undefined;
}

_id_6C64()
{
    var_0 = spawnstruct();
    var_0._id_031D = self;
    _id_2CFA( "playerAssist", var_0 );
}

_id_9BF9( var_0 )
{
    self endon( "disconnect" );
    wait 0.05;
    _id_A75A::_id_A0EB();
    var_1 = spawnstruct();
    var_1._id_031D = self;
    var_1._id_46CC = var_0;
    _id_2CFA( "playerHardpoint", var_1 );
}

_id_764D()
{
    _id_2CFA( "roundBegin" );
}

_id_764F( var_0 )
{
    var_1 = spawnstruct();

    if ( level._id_91E4 )
    {
        var_2 = "allies";

        for ( var_3 = 0; var_3 < level._id_685E[var_2].size; var_3++ )
        {
            var_1._id_031D = level._id_685E[var_2][var_3];
            var_1._id_A339 = var_2 == var_0;
            var_1._id_6858 = var_3;
            _id_2CFA( "roundEnd", var_1 );
        }

        var_2 = "axis";

        for ( var_3 = 0; var_3 < level._id_685E[var_2].size; var_3++ )
        {
            var_1._id_031D = level._id_685E[var_2][var_3];
            var_1._id_A339 = var_2 == var_0;
            var_1._id_6858 = var_3;
            _id_2CFA( "roundEnd", var_1 );
        }
    }
    else
    {
        for ( var_3 = 0; var_3 < level._id_685E["all"].size; var_3++ )
        {
            var_1._id_031D = level._id_685E["all"][var_3];
            var_1._id_A339 = isdefined( var_0 ) && isplayer( var_0 ) && var_1._id_031D == var_0;
            var_1._id_6858 = var_3;
            _id_2CFA( "roundEnd", var_1 );
        }
    }
}

_id_2CFA( var_0, var_1 )
{
    if ( !_id_5A5D() )
        return;

    if ( getdvarint( "disable_challenges" ) > 0 )
        return;

    if ( !isdefined( level._id_5CD9[var_0] ) )
        return;

    if ( isdefined( var_1 ) )
    {
        for ( var_2 = 0; var_2 < level._id_5CD9[var_0].size; var_2++ )
            thread [[ level._id_5CD9[var_0][var_2] ]]( var_1 );
    }
    else
    {
        for ( var_2 = 0; var_2 < level._id_5CD9[var_0].size; var_2++ )
            thread [[ level._id_5CD9[var_0][var_2] ]]();
    }
}

_id_5EC6()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "sprint_begin" );
        self._id_8AA5 = 0;
        thread _id_5EC7();
        _id_5EBF();

        if ( self _meth_8221( "specialty_longersprint" ) && _id_A75A::_id_05CB( "specialty_longersprint" ) )
            _id_6FF3( "ch_longersprint_pro", int( self._id_8AA5 / 12 ) );
    }
}

_id_5EBF()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "sprint_end" );
    var_0 = self._id_02E6;

    for (;;)
    {
        wait 0.1;
        self._id_8AA5 += distance( self._id_02E6, var_0 );
        var_0 = self._id_02E6;
    }
}

_id_5EC7()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );
    self waittill( "sprint_end" );
    self._id_55DD = gettime();
}

_id_5E58()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( !isalive( self ) )
        {
            self waittill( "spawned_player" );
            continue;
        }

        if ( !self _meth_8341() )
        {
            var_0 = self._id_02E6[2];

            while ( !self _meth_8341() && isalive( self ) )
            {
                if ( self._id_02E6[2] > var_0 )
                    var_0 = self._id_02E6[2];

                wait 0.05;
            }

            var_1 = var_0 - self._id_02E6[2];

            if ( var_1 < 0 )
                var_1 = 0;

            if ( var_1 / 12.0 > 15 && isalive( self ) && _id_A75A::_id_50F6() )
                _id_6FF3( "ch_boot_shortcut" );

            if ( var_1 / 12.0 > 30 && !isalive( self ) && _id_A75A::_id_50F6() )
                _id_6FF3( "ch_boot_gravity" );
        }

        wait 0.05;
    }
}

_id_5E30()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( !isalive( self ) )
        {
            self waittill( "spawned_player" );
            continue;
        }

        self waittill( "exo_boost" );

        if ( !self _meth_8341() )
        {
            var_0 = self._id_02E6[2];
            var_1 = self._id_02E6[2];

            while ( !self _meth_8341() && isalive( self ) )
            {
                if ( self._id_02E6[2] > var_0 )
                    var_0 = self._id_02E6[2];

                wait 0.05;
            }

            var_2 = var_0 - var_1;

            if ( var_2 < 0 )
                var_2 = 0;

            _id_6FF3( "ch_exomech_frontier", int( ceil( var_2 / 12 / 10 ) ) );
        }

        wait 0.05;
    }
}

_id_5EA2()
{
    thread _id_5E80( "increment_knife_kill", 15, "ch_precision_slice" );
    thread _id_5E80( "increment_stuck_kills", 5, "ch_precision_ticktick" );
    thread _id_5E80( "increment_pistol_headshots", 10, "ch_precision_pistoleer" );
    thread _id_5E80( "increment_ar_headshots", 5, "ch_precision_headhunt" );
    thread _id_5E80( "increment_sharpshooter_kills", 10, "ch_precision_sharpshoot" );
    thread _id_5E80( "increment_oneshotgun_kills", 10, "ch_precision_cqexpert" );
    thread _id_5E80( "increment_duallethal_kills", 5, "ch_precision_dangerclose" );
}

_id_5E80( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( !isdefined( game[var_2] ) )
        game[var_2] = [];

    if ( !isdefined( game[var_2][self._id_444D] ) )
        game[var_2][self._id_444D] = 0;

    thread _id_7383( var_2 );

    for (;;)
    {
        self waittill( var_0 );
        var_3 = game[var_2][self._id_444D];
        var_3++;
        game[var_2][self._id_444D] = var_3;

        if ( var_3 == var_1 )
            _id_6FF3( var_2 );
    }
}

_id_7383( var_0 )
{
    level endon( "game_ended" );
    self waittill( "disconnect" );

    if ( isdefined( game[var_0][self._id_444D] ) )
        game[var_0][self._id_444D] = undefined;
}

_id_55B9()
{
    if ( !_id_5A5D() )
        return;

    if ( !self._id_A1B5 )
        return;

    if ( self._id_91EC > 0 )
        return;

    _id_6FF3( "ch_lastmanstanding" );
}

_id_5E2F()
{
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = _id_A4F0::_id_A067( "bomb_planted", "bomb_defused" );

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 == "bomb_planted" )
        {
            _id_6FF3( "ch_saboteur" );
            continue;
        }

        if ( var_0 == "bomb_defused" )
            _id_6FF3( "ch_hero" );
    }
}

_id_5E79()
{
    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_8FF1();
    }
}

_id_8FF1()
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 300;

    if ( isdefined( self ) )
        _id_6FF3( "ch_survivalist" );
}

_id_5ECA()
{
    self endon( "disconnect" );
    self._id_030D["airstrikeStreak"] = 0;
    self._id_030D["meleeKillStreak"] = 0;
    self._id_030D["shieldKillStreak"] = 0;
    thread _id_5E82();

    for (;;)
    {
        self waittill( "death" );
        self._id_030D["airstrikeStreak"] = 0;
        self._id_030D["meleeKillStreak"] = 0;
        self._id_030D["shieldKillStreak"] = 0;
    }
}

_id_5E82()
{
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = _id_A4F0::_id_A068( "destroyed_explosive", "begin_airstrike", "destroyed_car", "destroyed_car" );
        _id_5E83( var_0 );
    }
}

_id_5E83( var_0 )
{
    switch ( var_0 )
    {
        case "begin_airstrike":
            self._id_030D["airstrikeStreak"] = 0;
            break;
        case "destroyed_explosive":
            _id_6FF3( "ch_backdraft" );

            if ( self _meth_8221( "specialty_detectexplosive" ) && _id_A75A::_id_05CB( "specialty_detectexplosive" ) )
                _id_6FF3( "ch_detectexplosives_pro" );

            break;
        case "destroyed_car":
            _id_6FF3( "ch_vandalism" );
            break;
        case "crushed_enemy":
            _id_6FF3( "ch_heads_up" );

            if ( isdefined( self._id_373C ) )
                _id_6FF3( "ch_droppincrates" );

            break;
    }
}

_id_478C()
{
    if ( !isalive( self ) )
        return;

    if ( !_id_5A5D() )
        return;

    if ( !_id_A75A::_id_7136() )
        return;

    thread _id_7443();

    if ( isdefined( self._id_558E ) && self._id_558E )
    {
        self._id_478E++;

        if ( self._id_478E >= 5 )
            _id_6FF3( "ch_invincible" );
    }
}

_id_7443()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "damage" );
    wait 1;
    self._id_1818 = 0;
}

_id_6D59()
{
    self._id_1818 = 0;
    self._id_478E = 0;
}

_id_6C86()
{
    self._id_1818 = 0;
    self._id_478E = 0;
}

_id_50B9()
{
    var_0 = self._id_01E7 / self._id_0275;
    return var_0 <= level._id_478A;
}

_id_6FF3( var_0, var_1, var_2 )
{
    if ( !_id_5A5D() )
        return;

    if ( level._id_0328.size < 2 && !getdvarint( "force_ranking" ) )
    {
        var_3 = undefined;

        if ( isdefined( var_3 ) )
        {
            if ( var_3 == 0 )
                return;
        }
        else
            return;
    }

    if ( !_id_A75A::_id_7136() )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_4 = _id_3F2A( var_0 );

    if ( var_4 == 0 )
        return;

    if ( var_4 > level._id_1C62[var_0]["targetval"].size )
        return;

    var_5 = _id_A79D::_id_1C4C( var_0 );

    if ( isdefined( var_2 ) && var_2 )
        var_6 = var_1;
    else if ( _id_A79D::_id_5203( var_0 ) )
        var_6 = var_5;
    else
        var_6 = var_5 + var_1;

    var_7 = 0;

    for ( var_8 = level._id_1C62[var_0]["targetval"][var_4]; isdefined( var_8 ) && var_6 >= var_8; var_8 = level._id_1C62[var_0]["targetval"][var_4 + var_7] )
        var_7++;

    if ( var_5 < var_6 )
        _id_A79D::_id_1C53( var_0, var_6 );

    if ( var_7 > 0 )
    {
        var_9 = var_4;

        while ( var_7 )
        {
            thread _id_41FD( var_0, var_4 );
            var_10 = _func_2C7( var_0, var_4 );
            self _meth_8443( var_10 );
            var_11 = _id_A4F0::_id_93EB( var_10 );
            var_12 = int( getsubstr( var_11, 0, var_11.size - 2 ) );

            if ( !isdefined( game["challengeStruct"]["challengesCompleted"][self._id_444D] ) )
                game["challengeStruct"]["challengesCompleted"][self._id_444D] = [];

            var_13 = 0;

            foreach ( var_15 in game["challengeStruct"]["challengesCompleted"][self._id_444D] )
            {
                if ( var_15 == var_12 )
                    var_13 = 1;
            }

            if ( !var_13 )
                game["challengeStruct"]["challengesCompleted"][self._id_444D][game["challengeStruct"]["challengesCompleted"][self._id_444D].size] = var_12;

            if ( var_4 >= level._id_1C62[var_0]["targetval"].size && level._id_1C62[var_0]["parent_challenge"] != "" )
                _id_6FF3( level._id_1C62[var_0]["parent_challenge"] );

            var_4++;
            var_7--;
            var_17 = _func_2D3( var_10 );

            if ( var_17 != 0 )
                _id_A744::_id_581F( var_10 );
        }

        if ( !issubstr( var_0, "ch_limited_bloodshed" ) )
            thread _id_A79C::_id_1C64( var_0, var_9, var_4 );

        _id_A79D::_id_1C54( var_0, var_4 );
        self._id_1C61[var_0] = var_4;
    }
}

_id_41FD( var_0, var_1 )
{
    self endon( "disconnect" );
    wait 0.25;
    _id_A7AA::_id_41FC( "challenge", level._id_1C62[var_0]["reward"][var_1], undefined, undefined, var_0 );
}

_id_4014( var_0, var_1 )
{
    return tablelookup( "mp/unlockTable.csv", 0, var_0, 4 + var_1 );
}

_id_59D7( var_0 )
{
    if ( tablelookup( "mp/allChallengesTable.csv", 0, "ch_" + var_0 + "_mastery", 1 ) == "" )
        return;

    var_1 = 0;
    var_2 = _id_A75A::_id_415F( var_0 );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 == "" )
            continue;

        if ( _id_A781::_id_50BD( var_0, var_4 ) )
            var_1++;
    }

    _id_6FF3( "ch_" + var_0 + "_mastery", var_1, 1 );
}

_id_50DA( var_0, var_1 )
{
    var_2 = tablelookupbyrow( "mp/allChallengesTable.csv", var_1, 8 );

    if ( var_2 != "" )
    {
        var_3 = _id_3F2A( var_2 );

        if ( var_3 > 1 )
            return 1;
    }

    var_4 = tablelookupbyrow( "mp/allChallengesTable.csv", var_1, 6 );

    if ( var_4 != "" )
    {
        var_5 = _id_A7AA::_id_40A7();

        if ( var_5 < int( var_4 ) )
            return 0;
    }

    var_6 = tablelookupbyrow( "mp/allChallengesTable.csv", var_1, 7 );

    if ( var_6 != "" )
    {
        var_7 = _id_3F2A( var_6 );

        if ( var_7 <= 1 )
            return 0;
    }

    return 1;
}

_id_9AF6()
{
    self._id_1C61 = [];

    if ( !isdefined( self.ch_unique_earned_streaks ) )
        self.ch_unique_earned_streaks = [];

    if ( !isdefined( game["challengeStruct"] ) )
        game["challengeStruct"] = [];

    if ( !isdefined( game["challengeStruct"]["limitedChallengesReset"] ) )
        game["challengeStruct"]["limitedChallengesReset"] = [];

    if ( !isdefined( game["challengeStruct"]["challengesCompleted"] ) )
        game["challengeStruct"]["challengesCompleted"] = [];

    self endon( "disconnect" );

    if ( !_id_5A5D() )
        return;

    if ( !self _meth_8221( "challenges" ) )
        return;

    var_0 = 0;

    foreach ( var_5, var_2 in level._id_1C62 )
    {
        var_0++;

        if ( var_0 % 40 == 0 )
            wait 0.05;

        self._id_1C61[var_5] = 0;
        var_3 = var_2["index"];
        var_4 = _id_A79D::_id_1C4D( var_5 );

        if ( _id_A79D::_id_51D3( var_5 ) && !isdefined( game["challengeStruct"]["limitedChallengesReset"][self._id_444D] ) )
        {
            _id_A79D::_id_1C53( var_5, 0 );
            var_4 = 0;
        }

        if ( var_4 == 0 )
        {
            _id_A79D::_id_1C54( var_5, 1 );
            var_4 = 1;
        }

        self._id_1C61[var_5] = var_4;
    }

    game["challengeStruct"]["limitedChallengesReset"][self._id_444D] = 1;
}

_id_512C( var_0 )
{
    return tablelookup( "mp/unlockTable.csv", 0, var_0, 0 ) != "";
}

_id_3F29( var_0 )
{
    return tablelookup( "mp/allChallengesTable.csv", 0, var_0, 5 );
}

_id_3F2B( var_0 )
{
    return tablelookup( "mp/challengeTable.csv", 8, var_0, 4 );
}

_id_4125( var_0, var_1 )
{
    return tablelookup( var_0, 0, var_1, 1 );
}

_id_5202( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_3F29( var_0 );

    if ( isdefined( var_1 ) && var_1 == "riotshield" )
        return 1;

    var_2 = _id_A75A::_id_4169( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( var_4 == "iw5" || var_4 == "iw6" )
            var_4 = var_2[var_3] + "_" + var_2[var_3 + 1];

        if ( _id_A781::_id_51F0( var_4 ) || _id_A781::_id_51F2( var_4, 0 ) )
            return 1;
    }

    return 0;
}

_id_4166( var_0 )
{
    var_1 = "ch_";

    if ( issubstr( var_0, "ch_marksman_" ) )
        var_1 = "ch_marksman_";
    else if ( issubstr( var_0, "ch_expert_" ) )
        var_1 = "ch_expert_";
    else if ( issubstr( var_0, "pr_marksman_" ) )
        var_1 = "pr_marksman_";
    else if ( issubstr( var_0, "pr_expert_" ) )
        var_1 = "pr_expert_";

    var_2 = getsubstr( var_0, var_1.size, var_0.size );
    var_3 = _id_A75A::_id_4169( var_2 );
    var_2 = undefined;

    if ( var_3[0] == "iw5" || var_3[0] == "iw6" )
        var_2 = var_3[0] + "_" + var_3[1];
    else
        var_2 = var_3[0];

    return var_2;
}

_id_415E( var_0 )
{
    var_1 = "ch_";

    if ( issubstr( var_0, "ch_marksman_" ) )
        var_1 = "ch_marksman_";
    else if ( issubstr( var_0, "ch_expert_" ) )
        var_1 = "ch_expert_";
    else if ( issubstr( var_0, "pr_marksman_" ) )
        var_1 = "pr_marksman_";
    else if ( issubstr( var_0, "pr_expert_" ) )
        var_1 = "pr_expert_";

    var_2 = getsubstr( var_0, var_1.size, var_0.size );
    var_3 = _id_A75A::_id_4169( var_2 );
    var_4 = undefined;

    if ( isdefined( var_3[2] ) && _id_A75A::_id_50BA( var_3[2] ) )
        var_4 = var_3[2];

    return var_4;
}

_id_5137( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_3F29( var_0 );

    if ( isdefined( var_1 ) && ( var_1 == "killstreaks_assault" || var_1 == "killstreaks_support" ) )
        return 1;

    return 0;
}

_id_3FE9( var_0 )
{
    var_1 = "ch_";
    var_2 = getsubstr( var_0, var_1.size, var_0.size );

    if ( var_2 == "assault_streaks" || var_2 == "support_streaks" )
        var_2 = undefined;

    return var_2;
}

_id_1C60( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 9 + ( var_2 - 1 ) * 2 );
    return int( var_3 );
}

_id_1C5F( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 10 + ( var_2 - 1 ) * 2 );
    return int( var_3 );
}

_id_1C5C( var_0, var_1 )
{
    var_2 = tablelookup( var_0, 0, var_1, 42 );

    if ( !isdefined( var_2 ) )
        var_2 = "";

    return var_2;
}

_id_1879( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        var_3++;
        var_4 = tablelookupbyrow( var_0, var_3, 0 );

        if ( var_4 == "" )
            break;

        var_5 = tablelookupbyrow( var_0, var_3, 43 );

        if ( var_5 == "1" )
            continue;

        level._id_1C62[var_4] = [];
        level._id_1C62[var_4]["index"] = var_3;
        level._id_1C62[var_4]["type"] = var_1;
        level._id_1C62[var_4]["targetval"] = [];
        level._id_1C62[var_4]["reward"] = [];
        level._id_1C62[var_4]["parent_challenge"] = "";

        if ( _id_5202( var_4 ) )
        {
            var_6 = _id_4166( var_4 );
            var_7 = _id_415E( var_4 );

            if ( isdefined( var_6 ) )
                level._id_1C62[var_4]["weapon"] = var_6;

            if ( isdefined( var_7 ) )
                level._id_1C62[var_4]["attachment"] = var_7;
        }
        else if ( _id_5137( var_4 ) )
        {
            var_8 = _id_3FE9( var_4 );

            if ( isdefined( var_8 ) )
                level._id_1C62[var_4]["killstreak"] = var_8;
        }

        for ( var_9 = 1; var_9 < 11; var_9++ )
        {
            var_10 = _id_1C60( var_0, var_4, var_9 );
            var_11 = _id_1C5F( var_0, var_4, var_9 );

            if ( var_10 == 0 )
                break;

            level._id_1C62[var_4]["targetval"][var_9] = var_10;
            level._id_1C62[var_4]["reward"][var_9] = var_11;
            var_2 += var_11;
        }

        level._id_1C62[var_4]["parent_challenge"] = _id_1C5C( var_0, var_4 );
    }

    return int( var_2 );
}

_id_1878()
{
    level._id_1C62 = [];

    if ( getdvar( "virtualLobbyActive" ) == "1" )
        return;

    var_0 = 0;
    var_0 += _id_1879( "mp/allChallengesTable.csv", 0 );
}

_id_5EB1()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        if ( !_id_5A5D() )
            return;

        self waittill( "process", var_0 );
        _id_6FF3( var_0 );
    }
}

_id_5E73()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        self waittill( "got_killstreak", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 == 9 && isdefined( self._id_53A0[7] ) && isdefined( self._id_53A0[8] ) && isdefined( self._id_53A0[9] ) )
            _id_6FF3( "ch_6fears7" );

        if ( var_0 == 10 && self._id_53A0.size == 0 )
            _id_6FF3( "ch_theloner" );
    }
}

_id_5E71()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        self waittill( "destroyed_killstreak", var_0 );

        if ( self _meth_8221( "specialty_blindeye" ) && _id_A75A::_id_05CB( "specialty_blindeye" ) )
            _id_6FF3( "ch_blindeye_pro" );

        if ( isdefined( var_0 ) && var_0 == "stinger_mp" )
        {
            _id_6FF3( "ch_marksman_stinger" );
            _id_6FF3( "pr_marksman_stinger" );
        }
    }
}

_id_3CA8( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "hijacker_airdrop":
            _id_6FF3( "ch_smoothcriminal" );
            break;
        case "wargasm":
            _id_6FF3( "ch_wargasm" );
            break;
        case "weapon_assault":
            _id_6FF3( "ch_surgical_assault" );
            break;
        case "weapon_smg":
            _id_6FF3( "ch_surgical_smg" );
            break;
        case "weapon_lmg":
            _id_6FF3( "ch_surgical_lmg" );
            break;
        case "weapon_dmr":
            break;
        case "weapon_sniper":
            _id_6FF3( "ch_surgical_sniper" );
            break;
        case "shield_damage":
            if ( !_id_A75A::_id_512E() )
                _id_6FF3( "ch_shield_damage", var_1 );

            break;
        case "shield_bullet_hits":
            if ( !_id_A75A::_id_512E() )
                _id_6FF3( "ch_shield_bullet", var_1 );

            break;
        case "shield_explosive_hits":
            if ( !_id_A75A::_id_512E() )
                _id_6FF3( "ch_shield_explosive", var_1 );

            break;
    }
}

_id_6CBB()
{
    var_0 = self _meth_830C();

    foreach ( var_2 in var_0 )
    {
        if ( self _meth_82F8( var_2 ) )
            return 1;

        var_3 = _func_1E2( var_2 );

        if ( !isdefined( var_3 ) || var_3 == "none" )
            continue;

        if ( self _meth_82F8( var_3 ) )
            return 1;
    }

    return 0;
}

_id_5E21()
{
    self endon( "disconnect" );
    self._id_087B = 0.0;

    for (;;)
    {
        if ( self _meth_8340() == 1 )
            self._id_087B += 0.05;
        else
            self._id_087B = 0.0;

        wait 0.05;
    }
}

_id_5EB2()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_7027 = undefined;
    var_0 = 0;

    for (;;)
    {
        var_1 = self _meth_817C();

        if ( var_1 == "prone" && var_0 == 0 )
        {
            self._id_7027 = gettime();
            var_0 = 1;
        }
        else if ( var_1 != "prone" )
        {
            self._id_7027 = undefined;
            var_0 = 0;
        }

        wait 0.05;
    }
}

monitorpowerslidetime()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self.powerslidetime = undefined;

    for (;;)
    {
        while ( !self _meth_8520() )
            wait 0.05;

        self.powerslidetime = gettime();
        wait 0.05;
    }
}

_id_5E6D()
{
    self endon( "disconnect" );
    self._id_493B = 0;

    for (;;)
    {
        self waittill( "hold_breath" );
        self._id_493B = 1;
        self waittill( "release_breath" );
        self._id_493B = 0;
    }
}

_id_5E7C()
{
    self endon( "disconnect" );
    self._id_596D = 0;

    for (;;)
    {
        self waittill( "jumped" );
        var_0 = self _meth_8311();
        _id_A4F0::_id_A097( "weapon_change", 1 );
        var_1 = self _meth_8311();

        if ( var_1 == "none" )
            self._id_596D = 1;
        else
            self._id_596D = 0;

        if ( self._id_596D )
        {
            if ( self _meth_8221( "specialty_fastmantle" ) && _id_A75A::_id_05CB( "specialty_fastmantle" ) )
                _id_6FF3( "ch_fastmantle" );

            _id_A4F0::_id_A097( "weapon_change", 1 );
            var_1 = self _meth_8311();

            if ( var_1 == var_0 )
                self._id_596D = 0;
        }
    }
}

_id_5EDE()
{
    self endon( "disconnect" );
    var_0 = self _meth_8311();

    for (;;)
    {
        self waittill( "weapon_change", var_1 );

        if ( var_1 == "none" )
            continue;

        if ( var_1 == var_0 )
            continue;

        if ( _id_A75A::_id_513A( var_1 ) )
            continue;

        if ( _id_A75A::_id_50C6( var_1 ) )
            continue;

        var_2 = _func_1DF( var_1 );

        if ( var_2 != "primary" )
            continue;

        self._id_55CA = gettime();
    }
}

_id_5E5C()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "flashbang", var_0, var_1, var_2, var_3 );

        if ( isdefined( var_3 ) && self == var_3 )
            continue;

        self._id_559E = gettime();
    }
}

_id_5E33()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "concussed", var_0 );

        if ( self == var_0 )
            continue;

        self._id_5588 = gettime();
    }
}

_id_5E81()
{
    self endon( "disconnect" );

    for (;;)
    {
        _id_A4F0::_id_A060( "triggered_mine", "triggered_claymore" );
        thread _id_A005();
    }
}

_id_A005()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait(level._id_27E8 + 2);
    _id_6FF3( "ch_delaymine" );
}

_id_5045( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "frag_grenade_mp":
        case "semtex_mp":
        case "exoknife_mp":
        case "explosive_drone_mp":
            return 1;
        default:
            return 0;
    }
}
