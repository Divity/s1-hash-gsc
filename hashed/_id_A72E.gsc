// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    var_0 = getdvar( "g_gametype" );
    var_1 = 0;
    var_2 = [];
    var_2["dm"] = 4;
    var_2["war"] = 5;
    var_2["sd"] = 6;
    var_2["dom"] = 7;
    var_2["conf"] = 8;
    var_2["sr"] = 9;
    var_2["infect"] = 10;
    var_2["gun"] = 11;
    var_2["ctf"] = 12;
    var_2["horde"] = 13;
    var_2["twar"] = 14;
    var_2["hp"] = 15;
    var_2["ball"] = 16;

    for (;;)
    {
        if ( !isdefined( var_2[var_0] ) )
            var_0 = "war";

        var_3 = tablelookupbyrow( "mp/xp_event_table.csv", var_1, 0 );
        var_4 = tablelookupbyrow( "mp/xp_event_table.csv", var_1, 1 );
        var_5 = tablelookupbyrow( "mp/xp_event_table.csv", var_1, 2 );
        var_6 = tablelookupbyrow( "mp/xp_event_table.csv", var_1, var_2[var_0] );

        if ( !isdefined( var_3 ) || var_3 == "" )
            break;

        if ( var_3 == "win" || var_3 == "loss" || var_3 == "tie" )
            var_6 = float( var_6 );
        else
            var_6 = int( var_6 );

        if ( var_6 != -1 )
        {
            var_5 = int( var_5 );
            var_4 = int( var_4 );
            _id_A7AA::_id_72FC( var_3, var_6, var_5, var_4 );
        }

        var_1++;
    }

    level._id_62A2 = 0;
    level thread _id_64C5();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_535F = [];
        var_0._id_5360 = [];
        var_0._id_2599 = [];
        var_0._id_535B = [];
        var_0._id_55AE = undefined;
        var_0._id_725D = 0;
        var_0._id_55B3 = 0;
        var_0._id_18B1 = 0;
        var_0._id_558A = 0;
    }
}

_id_535D( var_0, var_1, var_2, var_3, var_4 )
{
    level._id_62A2++;
    var_5 = var_1._id_444D;
    var_6 = var_1._id_030D["cur_kill_streak"];
    var_7 = self._id_444D;
    var_8 = gettime();

    if ( _id_A75A::_id_50CA( var_3 ) )
    {
        if ( self._id_55B3 == var_8 )
            self._id_18B1++;
        else
            self._id_18B1 = 1;
    }
    else
        self._id_18B1 = 0;

    self._id_55B3 = gettime();
    self._id_55AF = var_1;
    self._id_02A2 = [];
    self._id_2599[var_5] = undefined;
    thread _id_9B4D( var_0, var_2 );

    if ( !_id_A75A::_id_513A( var_2 ) )
    {
        if ( var_2 == "none" )
            return 0;

        if ( isdefined( var_1._id_9337 ) )
        {
            var_9 = _id_A75A::_id_8F56( var_1._id_9337, "_lefthand" );

            if ( var_9 == "frag_grenade_mp" )
                self._id_02A2["cooking"] = 1;
        }

        if ( _func_1DF( var_2 ) == "primary" )
        {
            self._id_7C52["killDistanceTotal"] += distance2d( self._id_02E6, var_1._id_02E6 );
            self._id_7C52["killDistanceCount"]++;
        }

        if ( var_3 == "MOD_HEAD_SHOT" )
            _id_477B( var_0, var_2, var_3 );

        if ( level._id_62A2 == 1 )
            _id_3814( var_0, var_2, var_3 );

        if ( level._id_91E4 && var_8 - var_1._id_55B3 < 3000 && var_1._id_55AF != self )
            _id_117C( var_0, var_2, var_3 );

        if ( !isalive( self ) && self != var_1 && isdefined( self._id_2670 ) && self._id_2670 + 1200 < gettime() )
            _id_6E84( var_0 );

        if ( self._id_030D["cur_death_streak"] > 3 )
            _id_20B8( var_0, var_2, var_3 );

        if ( isdefined( self._id_0D77 ) && self._id_0D77 )
            _id_0D78( var_0, var_2, var_3 );

        if ( _id_5148( self, var_2, var_3, var_1 ) )
            _id_584D( var_0, var_2, var_3 );

        if ( _id_518C( var_1, var_8 ) )
            _id_27A9( var_0, var_2, var_3 );

        if ( var_6 > 0 && _id_50CD( var_1 ) )
            _id_1967( var_0, var_1, var_2, var_3 );

        if ( _id_5163( var_1, var_2, var_3 ) )
            _id_649E( var_0, var_2, var_3 );

        if ( isdefined( self._id_55AE ) && self._id_55AE == var_1 )
            _id_74E7( var_0 );

        if ( var_1._id_4B53 & level._id_4B59 )
            _id_18AD( var_0, var_2 );

        if ( _id_517D( var_1, var_3 ) )
            _id_6E21( var_0, var_2, var_3 );

        if ( isdefined( var_2 ) && var_2 == "boost_slam_mp" )
            _id_159B( var_0, var_2, var_3 );

        if ( self._id_01E7 < 20 && self._id_01E7 > 0 )
            _id_606C( var_2, var_3 );

        if ( self._id_51A5 )
            _id_8AA6( var_2, var_3 );

        if ( isdefined( self.lastslidetime ) && var_8 - self.lastslidetime < 2000 )
            camosprintslidekillevent( var_2, var_3 );

        if ( _id_A4F0::_id_5105() )
            _id_38AE( var_2, var_3 );

        if ( _id_51CF( var_2, var_3 ) )
            _id_9309();

        if ( self._id_18B1 == 2 )
            _id_5FE3();

        if ( _id_50C2( var_1, var_2, var_3 ) )
            _id_125C();

        if ( _id_51D2( var_1, var_2, var_3 ) )
            _id_9332();

        var_10 = undefined;

        if ( _id_A75A::_id_51B7( var_2, "alt_" ) )
            var_10 = getsubstr( var_2, 4 );

        if ( isdefined( self._id_6808[var_2] ) && self._id_6808[var_2] == var_1 && !_id_A75A::_id_514D( var_3 ) )
            _id_9118();
        else if ( isdefined( var_10 ) && isdefined( self._id_6808[var_10] ) && self._id_6808[var_10] == var_1 && !_id_A75A::_id_514D( var_3 ) )
            _id_9118();

        if ( isdefined( var_2 ) && var_2 == "iw5_carrydrone_mp" )
            _id_53B2();

        if ( isdefined( var_1 ) && var_1 _id_A75A::_id_05CB( "specialty_ballcarrier" ) && !( isdefined( var_1._id_A2EB ) && var_1._id_A2EB == "iw5_dlcgun12loot9_mp" ) )
            _id_5359();

        if ( isdefined( self._id_3506["exo_dodge"] ) && 20 > _id_A75A::_id_412C() - self._id_3506["exo_dodge"] )
            _id_5345( var_2 );

        _id_1D0D( var_1, var_0, var_2, var_3, var_4 );
        _id_1D0C( var_1 );
        _id_1D28( var_1, var_2, var_3 );
    }

    _id_1D1B( var_1 );

    if ( !isdefined( self._id_535F[var_5] ) )
        self._id_535F[var_5] = 0;

    if ( !isdefined( self._id_5360[var_5] ) )
        self._id_5360[var_5] = 0;

    if ( !isdefined( var_1._id_535B[var_7] ) )
        var_1._id_535B[var_7] = 0;

    self._id_535F[var_5]++;
    self._id_5360[var_5]++;
    var_1._id_535B[var_7]++;
    var_1._id_55AE = self;
}

_id_517D( var_0, var_1 )
{
    if ( _id_A75A::_id_50CA( var_1 ) )
    {
        var_2 = self._id_02E6;
        var_3 = 9216;

        if ( isdefined( var_0._id_0E33 ) )
            var_2 = var_0._id_0E33;

        if ( distancesquared( var_2, var_0._id_02E6 ) < var_3 )
            return 1;
    }

    return 0;
}

_id_6E21( var_0, var_1, var_2 )
{
    _id_A75A::_id_4C2C( "pointblank", 1 );
    level thread _id_A7AA::_id_1208( "pointblank", self, var_1, undefined, var_2 );

    if ( isdefined( var_1 ) )
    {
        var_3 = _id_A75A::_id_3F0F( var_1, 1 );

        if ( _id_A75A::_id_514A( var_3 ) )
            var_3 = _id_A781::_id_3F0E( var_3 );

        var_4 = _id_A7A0::_id_3CE6( var_1, var_3 );

        if ( var_4 == "weapon_special" || var_4 == "weapon_shotgun" || var_4 == "weapon_pistol" )
        {
            switch ( var_3 )
            {
                case "iw5_dlcgun3":
                case "iw5_dlcgun4":
                    _id_A7A0::_id_6FF3( "ch_tier1_1_" + var_3 );
                    break;
                case "iw5_dlcgun8loot1":
                    _id_A7A0::_id_6FF3( "ch_tier1_1_iw5_dlcgun9" );
                    break;
                case "iw5_dlcgun13":
                    _id_A7A0::_id_6FF3( "ch_tier1_1_iw5_dlcgun10" );
                    break;
                default:
                    _id_A7A0::_id_6FF3( "ch_pointblank_" + var_3 );
                    break;
            }
        }
    }
}

_id_535E( var_0, var_1, var_2 )
{
    _id_A75A::_id_4C2C( "kills", 1 );
    _id_A75A::_id_4C2B( "kills", 1 );
    self._id_023C = _id_A75A::_id_407F( "kills" );
    _id_A7A4::_id_8D74( "round", "kills", self._id_023C );
    _id_A75A::_id_9B3F( "kdRatio", "kills", "deaths" );
    var_3 = "kill";

    switch ( var_1 )
    {
        case "orbital_laser_fov_mp":
        case "killstreak_orbital_laser_mp":
            var_3 = "vulcan_kill";
            break;
        case "warbird_missile_mp":
        case "warbird_remote_turret_mp":
        case "warbird_player_turret_mp":
        case "paint_missile_killstreak_mp":
            var_3 = "warbird_kill";
            break;
        case "orbitalsupport_105mm_mp":
        case "orbitalsupport_missile_mp":
        case "orbitalsupport_40mm_mp":
        case "orbitalsupport_40mmbuddy_mp":
        case "orbitalsupport_big_turret_mp":
        case "orbitalsupport_medium_turret_mp":
        case "orbitalsupport_small_turret_mp":
            var_3 = "paladin_kill";
            break;
        case "airdrop_trap_explosive_mp":
            var_3 = "airdrop_trap_kill";
            break;
        case "orbital_carepackage_pod_mp":
            var_3 = "airdrop_kill";
            break;
        case "remotemissile_projectile_mp":
        case "remotemissile_projectile_cluster_parent_mp":
        case "remotemissile_projectile_gas_mp":
        case "remotemissile_projectile_cluster_child_mp":
        case "killstreak_strike_missile_gas_mp":
        case "remotemissile_projectile_cluster_child_hellfire_mp":
        case "remotemissile_projectile_secondary_mp":
            var_3 = "missile_strike_kill";
            break;
        case "turretheadenergy_mp":
        case "turretheadrocket_mp":
        case "turretheadmg_mp":
        case "sentry_minigun_mp":
        case "remote_energy_turret_mp":
        case "killstreakmahem_mp":
        case "remote_turret_mp":
        case "iw5_dlcgun12loot3_mp":
            var_3 = "sentry_gun_kill";
            break;
        case "stealth_bomb_mp":
        case "orbital_carepackage_pod_plane_mp":
        case "airstrike_missile_mp":
            var_3 = "strafing_run_kill";
            break;
        case "ugv_missile_mp":
        case "drone_assault_remote_turret_mp":
        case "assaultdrone_c4_mp":
            var_3 = "assault_drone_kill";
            break;
        case "iw5_juggtitan45_mp":
        case "orbital_carepackage_droppod_mp":
        case "killstreak_goliathsd_mp":
        case "juggernaut_sentry_mg_mp":
        case "iw5_juggernautrockets_mp":
        case "iw5_exoxmgjugg_mp_akimbo":
        case "iw5_exominigun_mp":
        case "iw5_mechpunch_mp":
        case "playermech_rocket_mp":
            var_3 = "goliath_kill";
            break;
        case "killstreak_solar_mp":
        case "refraction_turret_mp":
        case "dam_turret_mp":
        case "detroit_tram_turret_mp":
        case "killstreak_terrace_mp":
        case "killstreak_comeback_mp":
        case "mp_laser2_core":
        case "iw5_dlcgun12loot5_mp":
        case "iw5_dlcgun12loot2_mp":
            var_3 = "map_killstreak_kill";
            break;
    }

    if ( var_3 != "kill" )
    {
        _id_A75A::_id_4C2C( var_3, 1 );
        _id_A7A0::_id_1C55( var_3 );
    }

    if ( level._id_6E92 )
        thread _id_6E99( var_0, var_3, var_1, var_2 );

    level thread _id_A7AA::_id_1208( var_3, self, var_1, var_0, var_2 );
}

_id_6E97()
{
    return !isdefined( self._id_60BC ) || gettime() > self._id_60BC;
}

_id_6E96()
{
    self._id_60BC = gettime() + randomintrange( 20000, 40000 );
}

_id_6E99( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isbot( self ) )
        return;

    self _meth_82F4( "ui_practice_round_kill" );
    var_4 = 0.5;

    if ( !isdefined( self._id_13AE ) )
        self._id_13AE = self _meth_8226( "bests", "kills" );

    if ( self._id_13AE > 0 && self._id_023C > self._id_13AE )
    {
        _id_6E96();
        wait(var_4);
        _id_A75A::_id_5652( "ptr_new_best" );
        self._id_13AE = 0;
    }
    else if ( var_1 == "kill" && !_id_A75A::_id_514D( var_3 ) )
    {
        if ( var_3 == "MOD_HEAD_SHOT" )
        {
            _id_6E96();
            wait(var_4);
            _id_A75A::_id_5652( "ptr_headshot" );
        }
        else
        {
            if ( !_id_6E97() )
                return;

            _id_6E96();
            wait(var_4);
            _id_A75A::_id_5652( "ptr_greatshot" );
        }
    }
}

_id_6E93( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isbot( self ) )
        return;

    var_1 = 0.5;
    _id_6E96();
    wait(var_1);
    _id_A75A::_id_5652( "ptr_assist" );
}

_id_51CF( var_0, var_1 )
{
    if ( var_1 == "MOD_IMPACT" || var_1 == "MOD_HEAD_SHOT" )
    {
        if ( _id_51D0( var_0 ) )
            return 1;
    }

    return 0;
}

_id_51D0( var_0 )
{
    switch ( var_0 )
    {
        case "frag_grenade_mp":
        case "semtex_mp":
        case "paint_grenade_mp":
        case "emp_grenade_mp":
        case "smoke_grenade_mp":
        case "stun_grenade_var_mp":
        case "emp_grenade_var_mp":
        case "paint_grenade_var_mp":
        case "smoke_grenade_var_mp":
        case "stun_grenade__mp":
            return 1;
        default:
            return 0;
    }
}

_id_9309()
{
    _id_A75A::_id_4C2C( "think_fast", 1 );
    level thread _id_A7AA::_id_1208( "think_fast", self );
}

_id_159B( var_0, var_1, var_2 )
{
    _id_A75A::_id_4C2C( "boostslamkill", 1 );
    thread _id_A7A0::_id_6FF3( "ch_limited_lookoutbelow", 1 );
    thread _id_A7A0::_id_6FF3( "ch_exomech_hot", 1 );
    level thread _id_A7AA::_id_1208( "boostslamkill", self, var_1, undefined, var_2 );
}

_id_300A( var_0, var_1, var_2, var_3 )
{
    _id_A75A::_id_4C2C( var_0 + "_earned", 1 );
    level thread _id_A7AA::_id_1208( var_0 + "_earned", self );
    thread _id_A79C::_id_53A6( var_0, var_1, undefined, var_2, var_3 );
    _id_A7A0::processchallengedaily( 22, var_0, undefined );
    _id_A7A0::processchallengedaily( 23, var_0, undefined );
    _id_A7A0::processchallengedaily( 32, var_0, undefined );
    _id_A7A0::processchallengedaily( 35, var_0, undefined );
}

_id_18AD( var_0, var_1 )
{
    _id_A75A::_id_4C2C( "bulletpenkills", 1 );
    level thread _id_A7AA::_id_1208( "bulletpen", self );

    if ( isdefined( var_1 ) )
    {
        var_2 = _id_A75A::_id_3F0F( var_1, 1 );

        if ( _id_A75A::_id_514A( var_2 ) )
            var_2 = _id_A781::_id_3F0E( var_2 );

        var_3 = _id_A7A0::_id_3CE6( var_1, var_2 );

        if ( var_3 == "weapon_sniper" )
        {
            if ( isdefined( level._id_1C62["ch_penetrate_" + var_2] ) )
                _id_A7A0::_id_6FF3( "ch_penetrate_" + var_2 );
        }
    }

    _id_A7A0::_id_6FF3( "ch_boot_xray" );
}

_id_5FE3()
{
    _id_A75A::_id_4C2C( "multiKillOneBullet", 1 );
    level thread _id_A7AA::_id_1208( "multiKillOneBullet", self );
}

_id_1D0D( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) && isdefined( var_4.ch_crossbow_player_jumping ) )
        var_5 = var_4.ch_crossbow_player_jumping;
    else
        var_5 = self _meth_83B4();

    if ( isdefined( var_4 ) && isdefined( var_4.ch_crossbow_victim_jumping ) )
        var_6 = var_4.ch_crossbow_victim_jumping;
    else
        var_6 = var_0 _meth_83B4();

    if ( var_5 && var_6 )
        _id_099F( var_1, var_2, var_3 );

    if ( var_5 && !var_6 )
        _id_09A0( var_1, var_2, var_3 );

    if ( !var_5 && var_6 )
        _id_4416( var_1, var_2, var_3 );
}

_id_1D28( var_0, var_1, var_2 )
{
    if ( _id_A7B4::_id_518F( var_1 ) || var_1 == _id_A735::_id_3D5C() )
        _id_7550( var_1, var_2 );

    if ( issubstr( var_1, "exoknife_mp" ) )
        _id_3505( var_1, var_2, var_0 );
}

_id_3505( var_0, var_1, var_2 )
{
    _id_A75A::_id_4C2C( "exo_knife_kill", 1 );

    if ( isdefined( var_2._id_A1C7 ) && var_2._id_A1C7 )
    {
        _id_A75A::_id_4C2C( "exo_knife_recall_kill", 1 );
        level thread _id_A7AA::_id_1208( "exo_knife_recall_kill", self, var_0, undefined, var_1 );
        _id_A7A0::_id_6FF3( "ch_humiliation_boomerang" );
    }
    else
        level thread _id_A7AA::_id_1208( "exo_knife_kill", self, var_0, undefined, var_1 );
}

_id_606C( var_0, var_1 )
{
    _id_A75A::_id_4C2C( "near_death_kill", 1 );
    level thread _id_A7AA::_id_1208( "near_death_kill", self, var_0, undefined, var_1 );
}

_id_8AA6( var_0, var_1 )
{
    _id_A75A::_id_4C2C( "slide_kill", 1 );
    level thread _id_A7AA::_id_1208( "slide_kill", self, var_0, undefined, var_1 );
}

_id_38AE( var_0, var_1 )
{
    _id_A75A::_id_4C2C( "flash_kill", 1 );
    level thread _id_A7AA::_id_1208( "flash_kill", self, var_0, undefined, var_1 );
}

_id_7550( var_0, var_1 )
{
    _id_A75A::_id_4C2C( "riot_kill", 1 );
    level thread _id_A7AA::_id_1208( "riot_kill", self, var_0, undefined, var_1 );
}

_id_099F( var_0, var_1, var_2 )
{
    _id_A75A::_id_4C2C( "air_to_air_kill", 1 );
    thread _id_A7A0::_id_6FF3( "ch_limited_acepilot", 1 );
    thread _id_A7A0::_id_6FF3( "ch_exomech_redbaron", 1 );
    var_3 = _id_A75A::_id_3F0F( var_1, 1 );

    if ( _id_A75A::_id_514A( var_3 ) )
        var_3 = _id_A781::_id_3F0E( var_3 );

    var_4 = _id_A7A0::_id_3CE6( var_1, var_3 );

    if ( _id_A75A::_id_514D( var_2 ) )
    {
        _id_A75A::_id_4C2C( "melee_air_to_air", 1 );
        level thread _id_A7AA::_id_1208( "melee_air_to_air", self, var_1, undefined, var_2 );
    }
    else
    {
        level thread _id_A7AA::_id_1208( "air_to_air_kill", self, var_1, undefined, var_2 );

        if ( var_4 == "weapon_smg" || var_4 == "weapon_shotgun" )
        {
            switch ( var_3 )
            {
                case "iw5_dlcgun4":
                    _id_A7A0::_id_6FF3( "ch_tier2_1_" + var_3 );
                    break;
                case "iw5_dlcgun8loot1":
                    _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgun9" );
                    break;
                case "iw5_dlcgun18":
                    _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgun11" );
                    break;
                case "iw5_dlcgun28":
                    _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgunb" );
                    break;
                case "iw5_dlcgun38":
                    _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgund" );
                    break;
                default:
                    _id_A7A0::_id_6FF3( "ch_dogfight_" + var_3 );
                    break;
            }
        }
    }
}

_id_09A0( var_0, var_1, var_2 )
{
    _id_A75A::_id_4C2C( "air_to_ground_kill", 1 );
    level thread _id_A7AA::_id_1208( "air_to_ground_kill", self, var_1, undefined, var_2 );
    thread _id_A7A0::_id_6FF3( "ch_exomech_buzz" );
    var_3 = _id_A75A::_id_3F0F( var_1, 1 );

    if ( _id_A75A::_id_514A( var_3 ) )
        var_3 = _id_A781::_id_3F0E( var_3 );

    var_4 = _id_A7A0::_id_3CE6( var_1, var_3 );

    if ( var_4 == "weapon_assault" || var_4 == "weapon_heavy" || issubstr( var_1, "exocrossbow" ) )
    {
        switch ( var_3 )
        {
            case "iw5_dlcgun2":
            case "iw5_dlcgun1":
                _id_A7A0::_id_6FF3( "ch_tier2_1_" + var_3 );
                break;
            case "iw5_dlcgun6":
                _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgun5" );
                break;
            case "iw5_dlcgun7loot0":
                _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgun7" );
                break;
            case "iw5_dlcgun7loot6":
                _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgun8" );
                break;
            case "iw5_dlcgun23":
                _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcguna" );
                break;
            case "iw5_dlcgun33":
                _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgunc" );
                break;
            default:
                _id_A7A0::_id_6FF3( "ch_strafe_" + var_3 );
                break;
        }
    }
}

_id_4416( var_0, var_1, var_2 )
{
    _id_A75A::_id_4C2C( "ground_to_air_kill", 1 );
    level thread _id_A7AA::_id_1208( "ground_to_air_kill", self, var_1, undefined, var_2 );
    thread _id_A7A0::_id_6FF3( "ch_exomech_pull" );
    var_3 = _id_A75A::_id_3F0F( var_1, 1 );

    if ( _id_A75A::_id_514A( var_3 ) )
        var_3 = _id_A781::_id_3F0E( var_3 );

    var_4 = _id_A7A0::_id_3CE6( var_1, var_3 );

    if ( var_4 == "weapon_heavy" || issubstr( var_1, "exocrossbow" ) )
    {
        switch ( var_3 )
        {
            case "iw5_dlcgun2":
                _id_A7A0::_id_6FF3( "ch_tier2_3_" + var_3 );
                break;
            default:
                _id_A7A0::_id_6FF3( "ch_skeet_" + var_3 );
                break;
        }
    }
}

_id_5163( var_0, var_1, var_2 )
{
    if ( var_0._id_0E34.size != 1 )
        return 0;

    if ( !isdefined( var_0._id_0E34[self._id_444D] ) )
        return 0;

    if ( _id_A75A::_id_514D( var_2 ) )
        return 0;

    if ( gettime() != var_0._id_0E2C[self._id_444D]._id_3820 )
        return 0;

    var_3 = _id_A75A::_id_4164( var_1 );

    if ( var_3 == "weapon_sniper" || var_3 == "weapon_shotgun" )
        return 1;

    return 0;
}

_id_5148( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3._id_08A2 ) )
        return 0;

    var_4 = self._id_02E6;

    if ( isdefined( var_3._id_0E33 ) )
        var_4 = var_3._id_0E33;

    if ( isalive( var_0 ) && !var_0 _id_A75A::_id_51E0() && ( var_2 == "MOD_RIFLE_BULLET" || var_2 == "MOD_PISTOL_BULLET" || var_2 == "MOD_HEAD_SHOT" || issubstr( var_1, "exoknife_mp" ) || issubstr( var_1, "exocrossbow" ) || issubstr( var_1, "m990" ) ) && !_id_A75A::_id_513A( var_1 ) && !isdefined( var_0._id_0D77 ) )
    {
        var_5 = _id_A75A::_id_4164( var_1 );

        switch ( var_5 )
        {
            case "weapon_pistol":
                var_6 = 800;
                break;
            case "weapon_smg":
                var_6 = 1200;
                break;
            case "weapon_assault":
            case "weapon_heavy":
                var_6 = 1500;
                break;
            case "weapon_sniper":
                var_6 = 2000;
                break;
            case "weapon_shotgun":
                var_6 = 500;
                break;
            case "weapon_projectile":
            default:
                var_6 = 1536;
                break;
        }

        if ( issubstr( var_1, "exoknife_mp" ) || issubstr( var_1, "exocrossbow" ) )
            var_6 = 1200;

        var_7 = var_6 * var_6;

        if ( distancesquared( var_4, var_3._id_02E6 ) > var_7 )
            return 1;
    }

    return 0;
}

_id_518C( var_0, var_1 )
{
    if ( !level._id_91E4 )
        return 0;

    foreach ( var_4, var_3 in var_0._id_2599 )
    {
        if ( var_4 != self._id_444D && var_1 - var_3 < 500 )
            return 1;
    }

    return 0;
}

_id_584D( var_0, var_1, var_2 )
{
    self._id_02A2["longshot"] = 1;
    _id_A75A::_id_4C2C( "longshots", 1 );
    level thread _id_A7AA::_id_1208( "longshot", self, var_1, undefined, var_2 );
    thread _id_A744::_id_5835( var_0, "longshot" );
}

_id_477B( var_0, var_1, var_2 )
{
    self._id_02A2["headshot"] = 1;
    _id_A75A::_id_4C2B( "headshots", 1 );
    _id_A75A::_id_4C2C( "headshots", 1 );
    _id_A7A4::_id_8D74( "round", "headshots", _id_A75A::_id_1E29( self._id_030D["headshots"] ) );
    self._id_01E6 = _id_A75A::_id_407F( "headshots" );
    level thread _id_A7AA::_id_1208( "headshot", self, var_1, undefined, var_2 );
    thread _id_A744::_id_5835( var_0, "headshot" );
    _id_A7A0::_id_6FF3( "ch_limited_headhunter" );
}

_id_51D2( var_0, var_1, var_2 )
{
    if ( !isexplosivedamagemod( var_2 ) )
        return 0;

    if ( !_id_A75A::_id_51B7( var_1, "frag_" ) )
        return 0;

    if ( isdefined( var_0 ) && isdefined( var_0._id_357C ) && isdefined( var_0._id_357C["throwbackKill"] ) && var_0._id_357C["throwbackKill"] )
        return 1;

    return 0;
}

_id_9332()
{
    _id_A75A::_id_4C2C( "throwback_kill", 1 );
    level thread _id_A7AA::_id_1208( "throwback_kill", self );
}

_id_39F5()
{
    _id_A75A::_id_4C2C( "four_play", 1 );
    level thread _id_A7AA::_id_1208( "four_play", self );
}

_id_117C( var_0, var_1, var_2 )
{
    self._id_02A2["avenger"] = 1;
    _id_A75A::_id_4C2C( "avengekills", 1 );
    level thread _id_A7AA::_id_1208( "avenger", self, var_1, undefined, var_2 );
    thread _id_A744::_id_5835( var_0, "avenger" );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_avenger" );
}

_id_0D78( var_0, var_1, var_2 )
{
    self._id_02A2["assistedsuicide"] = 1;
    _id_A75A::_id_4C2C( "assistedsuicide", 1 );
    level thread _id_A7AA::_id_1208( "assistedsuicide", self, var_1, undefined, var_2 );
    thread _id_A744::_id_5835( var_0, "assistedsuicide" );
}

_id_27A9( var_0, var_1, var_2 )
{
    self._id_02A2["defender"] = 1;
    _id_A75A::_id_4C2C( "rescues", 1 );
    level thread _id_A7AA::_id_1208( "defender", self, var_1, undefined, var_2 );
    thread _id_A744::_id_5835( var_0, "defender" );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_savior" );
}

_id_27AD( var_0, var_1 )
{
    _id_A75A::_id_4C2C( "defends", 1 );
    _id_A75A::_id_4C2B( "defends", 1 );
    _id_A7A4::_id_8D74( "round", "defends", self._id_030D["defends"] );
    level thread _id_A7AA::_id_1208( "defend", self );
    var_0 thread _id_A744::_id_5835( var_1, "assaulting" );
}

_id_0D52( var_0, var_1 )
{
    _id_A75A::_id_4C2C( "assault", 1 );
    level thread _id_A7AA::_id_1208( "assault", self );
    var_0 thread _id_A744::_id_5835( var_1, "defending" );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_attacker" );
    _id_A7A0::processchallengedaily( 7, undefined, undefined );
}

_id_6E84( var_0 )
{
    self._id_02A2["posthumous"] = 1;
    _id_A75A::_id_4C2C( "posthumous", 1 );
    level thread _id_A7AA::_id_1208( "posthumous", self );
    thread _id_A744::_id_5835( var_0, "posthumous" );
    _id_A7A0::_id_6FF3( "ch_humiliation_afterlife" );
}

_id_50C2( var_0, var_1, var_2 )
{
    if ( !_id_A75A::_id_514D( var_2 ) )
        return 0;

    if ( _id_A7B4::_id_518F( var_1 ) || var_1 == _id_A735::_id_3D5C() )
        return 0;

    var_3 = var_0 _meth_833B();
    var_4 = self _meth_833B();
    var_5 = angleclamp180( var_3[1] - var_4[1] );

    if ( abs( var_5 ) < 75 )
        return 1;

    return 0;
}

_id_125C( var_0 )
{
    _id_A75A::_id_4C2C( "backstab", 1 );
    level thread _id_A7AA::_id_1208( "backstab", self );
    _id_A7A0::_id_6FF3( "ch_humiliation_backstab" );
}

_id_74E7( var_0 )
{
    self._id_02A2["revenge"] = 1;
    self._id_55AE = undefined;
    _id_A75A::_id_4C2C( "revengekills", 1 );
    level thread _id_A7AA::_id_1208( "revenge", self );
    thread _id_A744::_id_5835( var_0, "revenge" );
    _id_A7A0::_id_6FF3( "ch_humiliation_revenge" );
}

_id_5FE2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_4 = _id_A7A0::_id_3CE6( var_2 );
    var_5 = _id_A75A::_id_3F0F( var_2, 1 );

    if ( _id_A75A::_id_514A( var_5 ) )
        var_5 = _id_A781::_id_3F0E( var_5 );

    var_6 = "";

    if ( _id_A4F0::_id_8F51( var_5, "iw5_" ) )
        var_6 = getsubstr( var_5, 4 );

    switch ( var_1 )
    {
        case 2:
            level thread _id_A7AA::_id_1208( "doublekill", self );
            _id_A75A::_id_4C2C( "doublekill", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_double" );
            _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_double" );

            if ( var_4 == "weapon_smg" || var_4 == "weapon_shotgun" || var_4 == "weapon_sniper" || var_5 == "iw5_microdronelauncher" || var_5 == "iw5_exocrossbow" )
            {
                switch ( var_5 )
                {
                    case "iw5_dlcgun6loot5":
                        _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgun6" );
                        break;
                    case "iw5_dlcgun18":
                        _id_A7A0::_id_6FF3( "ch_tier2_2_iw5_dlcgun11" );
                        break;
                    case "iw5_dlcgun28":
                        _id_A7A0::_id_6FF3( "ch_tier2_2_iw5_dlcgunb" );
                        break;
                    case "iw5_dlcgun38":
                        _id_A7A0::_id_6FF3( "ch_tier2_2_iw5_dlcgund" );
                        break;
                    default:
                        _id_A7A0::_id_6FF3( "ch_double_" + var_5 );
                        break;
                }
            }

            if ( isdefined( level._id_1C62["ch_attach_unlock_double_" + var_6] ) )
                _id_A7A0::_id_6FF3( "ch_attach_unlock_double_" + var_6 );

            break;
        case 3:
            level thread _id_A7AA::_id_1208( "triplekill", self );
            level thread _id_A75A::_id_91F3( "callout_3xkill", self );
            _id_A75A::_id_4C2C( "triplekill", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_triple" );
            _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_triple" );

            if ( _id_A7A0::_id_50B9() )
                _id_A7A0::_id_6FF3( "ch_precision_sitcrit" );

            if ( isdefined( var_4 ) && ( var_4 == "weapon_smg" || var_4 == "weapon_heavy" ) && var_3 == 0 )
                _id_A7A0::_id_6FF3( "ch_precision_hello" );

            break;
        case 4:
            level thread _id_A7AA::_id_1208( "fourkill", self );
            level thread _id_A75A::_id_91F3( "callout_4xkill", self );
            _id_A75A::_id_4C2C( "fourkill", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_feed" );
            _id_A7A0::_id_6FF3( "ch_killer_fury" );
            _id_A7A0::_id_6FF3( "ch_limited_bloodshed_fury" );
            break;
        case 5:
            level thread _id_A7AA::_id_1208( "fivekill", self );
            level thread _id_A75A::_id_91F3( "callout_5xkill", self );
            _id_A75A::_id_4C2C( "fivekill", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_frenzy" );
            break;
        case 6:
            level thread _id_A7AA::_id_1208( "sixkill", self );
            level thread _id_A75A::_id_91F3( "callout_6xkill", self );
            _id_A75A::_id_4C2C( "sixkill", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_super" );
            break;
        case 7:
            level thread _id_A7AA::_id_1208( "sevenkill", self );
            level thread _id_A75A::_id_91F3( "callout_7xkill", self );
            _id_A75A::_id_4C2C( "sevenkill", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_mega" );
            break;
        case 8:
            level thread _id_A7AA::_id_1208( "eightkill", self );
            level thread _id_A75A::_id_91F3( "callout_8xkill", self );
            _id_A75A::_id_4C2C( "eightkill", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_ultra" );
            break;
        default:
            level thread _id_A7AA::_id_1208( "multikill", self );
            thread _id_A75A::_id_91F3( "callout_9xpluskill", self );
            _id_A75A::_id_4C2C( "multikill", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_chain" );
            break;
    }

    thread _id_A744::_id_583A( var_0, var_1 );
}

_id_9118()
{
    _id_A75A::_id_4C2C( "take_and_kill", 1 );
    level thread _id_A7AA::_id_1208( "take_and_kill", self );
    _id_A7A0::_id_6FF3( "ch_humiliation_backfire" );
}

_id_5359()
{
    _id_A75A::_id_4C2C( "killedBallCarrier", 1 );
    level thread _id_A7AA::_id_1208( "killedBallCarrier", self );
}

setuplinkstats()
{
    var_0 = _id_A75A::_id_408D( "fieldgoal" ) + _id_A75A::_id_408D( "touchdown" ) * 2;
    _id_A7A4::_id_8D74( "round", "captures", var_0 );
    _id_A75A::_id_7F65( var_0 );
}

_id_93FD( var_0 )
{
    thread _id_A75A::_id_91F3( "callout_touchdown", self, undefined, var_0 );
    _id_A75A::_id_4C2C( "touchdown", 1 );
    setuplinkstats();
    level thread _id_A7AA::_id_1208( "touchdown", self );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_touchdown" );
    _id_A7A0::processchallengedaily( 13, var_0, undefined );
}

_id_36A1( var_0 )
{
    thread _id_A75A::_id_91F3( "callout_fieldgoal", self, undefined, var_0 );
    _id_A75A::_id_4C2C( "fieldgoal", 1 );
    setuplinkstats();
    level thread _id_A7AA::_id_1208( "fieldgoal", self );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_fieldgoal" );
    _id_A7A0::processchallengedaily( 13, var_0, undefined );
}

_id_4EA7()
{
    _id_A75A::_id_4C2C( "interception", 1 );
    level thread _id_A7AA::_id_1208( "interception", self );
}

_id_53B2()
{
    _id_A75A::_id_4C2C( "kill_with_ball", 1 );
    level thread _id_A7AA::_id_1208( "kill_with_ball", self );
}

_id_12DA()
{
    _id_A75A::_id_4C2C( "ball_score_assist", 1 );
    level thread _id_A7AA::_id_1208( "ball_score_assist", self );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_assist" );
}

_id_66B5()
{
    _id_A75A::_id_4C2C( "pass_kill_pickup", 1 );
    level thread _id_A7AA::_id_1208( "pass_kill_pickup", self );
}

_id_3866()
{
    thread _id_A75A::_id_91F3( "callout_flagpickup", self );
    _id_A75A::_id_4C2C( "flagscarried", 1 );
    level thread _id_A7AA::_id_1208( "flag_pickup", self );
    thread _id_A744::_id_5824( "pickup", self._id_02E6 );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_flag_carry" );
}

_id_385D()
{
    thread _id_A75A::_id_91F3( "callout_flagcapture", self );
    _id_A75A::_id_4C2C( "flagscaptured", 1 );
    _id_A75A::_id_4C2B( "captures", 1 );
    _id_A7A4::_id_8D74( "round", "captures", self._id_030D["captures"] );
    _id_A75A::_id_7F65( self._id_030D["captures"] );
    level thread _id_A7AA::_id_1208( "flag_capture", self );
    thread _id_A744::_id_5824( "capture", self._id_02E6 );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_flag_capture" );
    _id_A7A0::processchallengedaily( 16, undefined, undefined );
}

_id_3867()
{
    thread _id_A75A::_id_91F3( "callout_flagreturn", self );
    _id_A75A::_id_4C2C( "flagsreturned", 1 );
    _id_A75A::_id_4C2B( "returns", 1 );
    self._id_004F = self._id_030D["returns"];
    _id_A7A4::_id_8D74( "round", "returns", self._id_030D["returns"] );
    level thread _id_A7AA::_id_1208( "flag_return", self );
    thread _id_A744::_id_5824( "return", self._id_02E6 );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_flag_return" );
    _id_A7A0::processchallengedaily( 17, undefined, undefined );
}

_id_53B3()
{
    _id_A75A::_id_4C2C( "killsasflagcarrier", 1 );
    level thread _id_A7AA::_id_1208( "kill_with_flag", self );
}

_id_5365( var_0 )
{
    thread _id_A75A::_id_91F3( "callout_killflagcarrier", self );
    _id_A75A::_id_4C2C( "flagcarrierkills", 1 );
    _id_A75A::_id_4C2B( "defends", 1 );
    _id_A7A4::_id_8D74( "round", "defends", self._id_030D["defends"] );
    level thread _id_A7AA::_id_1208( "kill_flag_carrier", self );
    thread _id_A744::_id_5835( var_0, "carrying" );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_flag_defend" );
}

_id_5356( var_0 )
{
    _id_A75A::_id_4C2C( "killsdenied", 1 );
    _id_A75A::_id_4C2B( "denied", 1 );
    _id_A75A::_id_7F66( self._id_030D["denied"] );
    _id_A7A4::_id_8D74( "round", "denied", self._id_030D["denied"] );
    var_1 = "kill_denied";

    if ( var_0 )
    {
        var_1 = "kill_denied_retrieved";
        _id_A75A::_id_4C2C( "kill_denied_retrieved", 1 );
        _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_save_yourself" );
    }

    level thread _id_A7AA::_id_1208( var_1, self );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_denial" );
    _id_A7A0::processchallengedaily( 21, undefined, undefined );
}

_id_5353()
{
    _id_A75A::_id_4C2C( "killsconfirmed", 1 );
    _id_A75A::_id_4C2B( "confirmed", 1 );
    _id_A75A::_id_7F65( self._id_030D["confirmed"] );
    _id_A7A4::_id_8D74( "round", "confirmed", self._id_030D["confirmed"] );
    level thread _id_A7AA::_id_1208( "kill_confirmed", self );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_collector" );
    _id_A7A0::processchallengedaily( 4, undefined, undefined );
}

_id_90D9()
{
    _id_A75A::_id_4C2C( "tag_collector", 1 );
    level thread _id_A7AA::_id_1208( "tag_collector", self );
}

_id_5ECF( var_0 )
{
    if ( !isplayer( var_0 ) )
        return;

    var_0 notify( "tagCollector" );
    var_0 endon( "tagCollector" );

    if ( !isdefined( var_0._id_90DA ) )
        var_0._id_90DA = 0;

    var_0._id_90DA++;

    if ( var_0._id_90DA > 2 )
    {
        var_0 _id_90D9();
        var_0._id_90DA = 0;
    }

    wait 2.5;
    var_0._id_90DA = 0;
}

_id_1548()
{
    _id_A75A::_id_4C2C( "bombsplanted", 1 );
    _id_A75A::_id_4C2B( "plants", 1 );
    _id_A7A4::_id_8D74( "round", "plants", self._id_030D["plants"] );
    _id_A75A::_id_7F65( self._id_030D["plants"] );
    level thread _id_A75A::_id_91F3( "callout_bombplanted", self );
    level thread _id_A7AA::_id_1208( "plant", self );
    thread _id_A744::_id_5824( "plant", self._id_02E6 );
}

_id_1537( var_0 )
{
    _id_A75A::_id_4C2C( "bombsdefused", 1 );
    _id_A75A::_id_4C2B( "defuses", 1 );
    _id_A7A4::_id_8D74( "round", "defuses", self._id_030D["defuses"] );
    _id_A75A::_id_7F66( self._id_030D["defuses"] );
    level thread _id_A75A::_id_91F3( "callout_bombdefused", self );

    if ( var_0 == "ninja_defuse" || var_0 == "last_man_defuse" )
    {
        _id_A75A::_id_4C2C( var_0, 1 );

        if ( var_0 == "last_man_defuse" )
            _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_ninja" );
    }

    level thread _id_A7AA::_id_1208( var_0, self );
    thread _id_A744::_id_5824( "defuse", self._id_02E6 );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_bombdefuse" );
}

_id_305B( var_0, var_1 )
{
    _id_A75A::_id_4C2C( "elimination", 1 );
    level thread _id_A75A::_id_91F3( "callout_eliminated", var_1 );

    if ( var_0 )
    {
        _id_A75A::_id_4C2C( "last_man_standing", 1 );
        level thread _id_A7AA::_id_1208( "last_man_standing", self );
    }
    else
        level thread _id_A7AA::_id_1208( "elimination", self );
}

_id_74FC( var_0 )
{
    _id_A75A::_id_4C2C( "sr_tag_revive", 1 );
    _id_A75A::_id_4C2C( "killsdenied", 1 );
    _id_A75A::_id_4C2B( "denied", 1 );
    _id_A7A4::_id_8D74( "round", "denied", self._id_030D["denied"] );
    self._id_004F = self._id_030D["denied"];
    level thread _id_A75A::_id_91F3( "callout_tag_revive", var_0 );
    level thread _id_A7AA::_id_1208( "sr_tag_revive", self );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_medic" );
}

_id_305C()
{
    _id_A75A::_id_4C2C( "sr_tag_elimination", 1 );
    _id_A75A::_id_4C2C( "killsconfirmed", 1 );
    _id_A75A::_id_4C2B( "confirmed", 1 );
    _id_A7A4::_id_8D74( "round", "confirmed", self._id_030D["confirmed"] );
    level thread _id_A7AA::_id_1208( "sr_tag_elimination", self );
}

_id_1539()
{
    _id_A75A::_id_4C2C( "targetsdestroyed", 1 );
    _id_A75A::_id_4C2B( "destructions", 1 );
    _id_A7A4::_id_8D74( "round", "destructions", self._id_030D["destructions"] );
    level thread _id_A7AA::_id_1208( "destroy", self );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_destroyer" );
}

_id_4C31()
{
    _id_A75A::_id_4C2C( "levelup", 1 );
    level thread _id_A7AA::_id_1208( "gained_gun_score", self );
}

_id_2757()
{
    _id_A75A::_id_4C2C( "dejavu", 1 );
    level thread _id_A7AA::_id_1208( "dropped_gun_score", self );
}

_id_7F26()
{
    _id_A75A::_id_4C2C( "humiliation", 1 );
    level thread _id_A7AA::_id_1208( "dropped_enemy_gun_rank", self );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_regression" );
}

_id_709E()
{
    _id_A75A::_id_4C2C( "gunslinger", 1 );
    level thread _id_A7AA::_id_1208( "quick_gun_rank", self );
}

_id_7F27()
{
    _id_A75A::_id_4C2C( "regicide", 1 );
    level thread _id_A7AA::_id_1208( "dropped_first_player_gun_rank", self );
}

_id_381B()
{
    _id_A75A::_id_4C2C( "patientzero", 1 );
    _id_A75A::_id_6DDA( "mp_enemy_obj_captured" );
    level thread _id_A75A::_id_91F3( "callout_first_infected", self );
    level thread _id_A7AA::_id_1208( "first_infected", self );
    self.patient_zero = 0;
}

_id_374D()
{
    _id_A75A::_id_4C2C( "omegaman", 1 );
    _id_A75A::_id_6DDA( "mp_obj_captured" );
    level thread _id_A75A::_id_91F3( "callout_final_survivor", self );
    level thread _id_A7AA::_id_1208( "final_survivor", self );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_survivor" );
}

_id_4278()
{
    _id_A75A::_id_4C2C( "careless", 1 );
    level thread _id_A7AA::_id_1208( "got_infected", self );
}

_id_6869()
{
    _id_A75A::_id_4C2C( "plague", 1 );
    level thread _id_A7AA::_id_1208( "infected_plague", self );
}

_id_4C50()
{
    _id_A75A::_id_4C2C( "contagious", 1 );
    level thread _id_A75A::_id_91F3( "callout_infected_survivor", self, "axis" );
    level thread _id_A7AA::_id_1208( "infected_survivor", self );
}

_id_8FF6()
{
    _id_A75A::_id_4C2C( "survivor", 1 );
    level thread _id_A7AA::_id_1208( "survivor", self );
}

_id_2CEF( var_0 )
{
    _id_A75A::_id_4C2C( "pointscaptured", 1 );
    _id_A75A::_id_4C2B( "captures", 1 );
    _id_A7A4::_id_8D74( "round", "captures", self._id_030D["captures"] );
    _id_A75A::_id_7F65( self._id_030D["captures"] );
    var_1 = "capture";

    if ( var_0 )
    {
        var_1 = "opening_move";
        _id_A75A::_id_4C2C( "opening_move", 1 );
    }

    level thread _id_A7AA::_id_1208( var_1, self );
    thread _id_A744::_id_5824( "capture", self._id_02E6 );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_aggression" );
    _id_A7A0::processchallengedaily( 6, undefined, undefined );
}

_id_2CFB()
{
    level thread _id_A7AA::_id_1208( "neutralize", self );
}

_id_53B1( var_0, var_1 )
{
    _id_A75A::_id_4C2C( "assault", 1 );
    _id_A75A::_id_4C2C( "kill_while_capture", 1 );
    level thread _id_A7AA::_id_1208( "kill_while_capture", self );
    var_0 thread _id_A744::_id_5835( var_1, "defending" );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_defender" );
}

_id_7C00()
{
    _id_A75A::_id_4C2C( "hp_secure", 1 );
    _id_A75A::_id_4C2B( "captures", 1 );
    _id_A7A4::_id_8D74( "round", "captures", self._id_030D["captures"] );
    _id_A75A::_id_7F65( self._id_030D["captures"] );
    level thread _id_A75A::_id_91F3( "callout_hp_captured_by", self );
    level thread _id_A7AA::_id_1208( "hp_secure", self );
    thread _id_A744::_id_5824( "capture", self._id_02E6 );
    _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_aggression" );
}

_id_3814( var_0, var_1, var_2 )
{
    self._id_02A2["firstblood"] = 1;
    _id_A75A::_id_4C2C( "firstblood", 1 );
    thread _id_A75A::_id_91F3( "callout_firstblood", self );
    level thread _id_A7AA::_id_1208( "firstblood", self, var_1, undefined, var_2 );
    thread _id_A744::_id_5835( var_0, "firstblood" );
}

_id_50CD( var_0 )
{
    foreach ( var_2 in var_0._id_53A0 )
    {
        if ( _id_A7C3::_id_51BF( var_0, var_2 ) )
            continue;

        var_3 = _id_A7C3::_id_40F4( var_2 );
        var_4 = var_0._id_0865;

        if ( var_3 < var_4 )
            continue;

        if ( var_3 - var_4 < 101 )
            return 1;
    }

    return 0;
}

_id_1967( var_0, var_1, var_2, var_3 )
{
    self._id_02A2["buzzkill"] = var_1._id_030D["cur_kill_streak"];
    _id_A75A::_id_4C2C( "buzzkill", 1 );
    level thread _id_A7AA::_id_1208( "buzzkill", self, var_2, undefined, var_3 );
    _id_A7A0::_id_6FF3( "ch_humiliation_buzzkill" );
}

_id_649E( var_0, var_1, var_2 )
{
    self._id_02A2["oneshotkill"] = 1;
    _id_A75A::_id_4C2C( "oneshotkill", 1 );
    level thread _id_A7AA::_id_1208( "oneshotkill", self, var_1, undefined, var_2 );
    _id_A7A0::_id_6FF3( "ch_limited_deadeye" );
    var_3 = _id_A75A::_id_3F0F( var_1, 1 );

    if ( _id_A75A::_id_514A( var_3 ) )
        var_3 = _id_A781::_id_3F0E( var_3 );

    var_4 = _id_A7A0::_id_3CE6( var_1, var_3 );

    if ( var_4 == "weapon_shotgun" )
    {
        switch ( var_3 )
        {
            case "iw5_dlcgun4":
                _id_A7A0::_id_6FF3( "ch_tier2_2_" + var_3 );
                break;
            case "iw5_dlcgun8loot1":
                _id_A7A0::_id_6FF3( "ch_tier2_2_iw5_dlcgun9" );
                break;
            default:
                break;
        }
    }

    if ( var_4 == "weapon_sniper" )
        self notify( "increment_sharpshooter_kills" );
    else if ( var_4 == "weapon_shotgun" )
        self notify( "increment_oneshotgun_kills" );
}

_id_20B8( var_0, var_1, var_2 )
{
    self._id_02A2["comeback"] = 1;
    _id_A75A::_id_4C2C( "comebacks", 1 );
    level thread _id_A7AA::_id_1208( "comeback", self, var_1, undefined, var_2 );
    thread _id_A744::_id_5835( var_0, "comeback" );
}

_id_7C76( var_0 )
{
    _id_A75A::_id_4C2C( "semtex_stick", 1 );
    level thread _id_A7AA::_id_1208( "semtex_stick", self );
    var_0 _id_A75A::_id_4C2C( "stuck_with_explosive", 1 );

    if ( !( isdefined( level.iszombiegame ) && level.iszombiegame == 1 ) )
        level thread _id_A7AA::_id_1208( "stuck_with_explosive", var_0 );

    _id_A7A0::_id_6FF3( "ch_humiliation_stuck" );
    self notify( "increment_stuck_kills" );
}

_id_2479( var_0 )
{
    _id_A75A::_id_4C2C( "crossbow_stick", 1 );
    level thread _id_A7AA::_id_1208( "crossbow_stick", self );
    var_0 _id_A75A::_id_4C2C( "stuck_with_explosive", 1 );

    if ( !( isdefined( level.iszombiegame ) && level.iszombiegame == 1 ) )
        level thread _id_A7AA::_id_1208( "stuck_with_explosive", var_0 );

    _id_A7A0::_id_6FF3( "ch_humiliation_stuck" );
    self notify( "increment_stuck_kills" );
}

_id_2B35()
{
    var_0 = self._id_444D;

    for ( var_1 = 0; var_1 < level._id_0328.size; var_1++ )
    {
        if ( isdefined( level._id_0328[var_1]._id_535F[var_0] ) )
            level._id_0328[var_1]._id_535F[var_0] = undefined;

        if ( isdefined( level._id_0328[var_1]._id_5360[var_0] ) )
            level._id_0328[var_1]._id_5360[var_0] = undefined;

        if ( isdefined( level._id_0328[var_1]._id_535B[var_0] ) )
            level._id_0328[var_1]._id_535B[var_0] = undefined;
    }
}

_id_9B4D( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "";

    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "updateRecentKills" );
    self endon( "updateRecentKills" );
    self._id_725D++;
    var_2 = 0;

    if ( self _meth_8340() >= 0.2 )
        var_2 = 1;

    wait 2.0;

    if ( self._id_725D > 1 )
        _id_5FE2( var_0, self._id_725D, var_1, var_2 );

    self._id_725D = 0;
}

_id_48A5( var_0 )
{
    _id_A75A::_id_4C2C( "hijacker", 1 );
    level thread _id_A7AA::_id_1208( "hijacker", self );
    thread _id_A7A0::_id_3CA8( "hijacker_airdrop" );

    if ( isdefined( var_0 ) )
        var_0 _id_A79C::_id_6C6C( "hijacked_airdrop", self );
}

_id_83AF()
{
    _id_A75A::_id_4C2C( "sharepackage", 1 );
    level thread _id_A7AA::_id_1208( "sharepackage", self );
}

_id_5989()
{
    var_0 = getmatchdata( "players", self._id_1F0F, "numberOfMapstreaksReceived" );
    var_0++;
    setmatchdata( "players", self._id_1F0F, "numberOfMapstreaksReceived", _id_A75A::_id_1E28( var_0 ) );
    _id_A75A::_id_4C2C( "map_killstreak", 1 );
    level thread _id_A7AA::_id_1208( "map_killstreak", self );
}

_id_53A7()
{
    _id_A75A::_id_4C2C( "killstreak_tag", 1 );
    level thread _id_A7AA::_id_1208( "killstreak_tag", self );
}

_id_539B()
{
    var_0 = gettime();
    var_1 = self._id_558A + 10000;

    if ( var_1 > var_0 )
        return;

    self._id_558A = var_0;
    _id_A75A::_id_4C2C( "killstreak_join", 1 );
    level thread _id_A7AA::_id_1208( "killstreak_join", self );
}

_id_1D24( var_0 )
{
    if ( isdefined( level._id_511A ) )
        return;

    if ( !isdefined( self._id_0E31 ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self;

    var_1 = self._id_02E9;

    if ( !isdefined( var_1 ) )
        var_1 = self;

    foreach ( var_3 in self._id_0E31 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == var_1 )
            continue;

        if ( var_3 == var_0 )
            continue;

        if ( var_3._id_04A8 == self._id_04A8 )
            continue;

        var_3 _id_A75A::_id_4C2C( "assist_killstreak_destroyed", 1 );
        level thread _id_A7AA::_id_1208( "assist_killstreak_destroyed", var_3 );
    }
}

_id_1D1B( var_0 )
{
    var_1 = self._id_023E + 1;

    if ( var_1 % 5 && var_1 < 30 )
        return;

    switch ( var_1 )
    {
        case 5:
            level thread _id_A7AA::_id_1208( "5killstreak", self );
            _id_A75A::_id_4C2C( "5killstreak", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_blood" );

            if ( isdefined( self._id_1C61["ch_limited_bloodshed"] ) && self._id_1C61["ch_limited_bloodshed"] == 1 )
                _id_A7A0::_id_6FF3( "ch_limited_bloodshed", 5 );

            break;
        case 10:
            level thread _id_A7AA::_id_1208( "10killstreak", self );
            _id_A75A::_id_4C2C( "10killstreak", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_merciless" );
            _id_A7A0::_id_6FF3( "ch_" + level._id_01B5 + "_merciless" );

            if ( isdefined( self._id_1C61["ch_limited_bloodshed"] ) && self._id_1C61["ch_limited_bloodshed"] == 2 )
                _id_A7A0::_id_6FF3( "ch_limited_bloodshed", 5 );

            if ( self._id_57DA == "specialty_null" && self._id_57D8 == "specialty_null" )
                _id_A7A0::_id_6FF3( "ch_precision_wetwork" );

            break;
        case 15:
            level thread _id_A7AA::_id_1208( "15killstreak", self );
            _id_A75A::_id_4C2C( "15killstreak", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_ruthless" );

            if ( isdefined( self._id_1C61["ch_limited_bloodshed"] ) && self._id_1C61["ch_limited_bloodshed"] == 3 )
                _id_A7A0::_id_6FF3( "ch_limited_bloodshed", 5 );

            break;
        case 20:
            level thread _id_A7AA::_id_1208( "20killstreak", self );
            _id_A75A::_id_4C2C( "20killstreak", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_relentless" );

            if ( isdefined( self._id_1C61["ch_limited_bloodshed"] ) && self._id_1C61["ch_limited_bloodshed"] == 4 )
                _id_A7A0::_id_6FF3( "ch_limited_bloodshed", 5 );

            break;
        case 25:
            level thread _id_A7AA::_id_1208( "25killstreak", self );
            _id_A75A::_id_4C2C( "25killstreak", 1 );
            _id_A7A0::_id_6FF3( "ch_killer_brutal" );

            if ( isdefined( self._id_1C61["ch_limited_bloodshed"] ) && self._id_1C61["ch_limited_bloodshed"] == 5 )
                _id_A7A0::_id_6FF3( "ch_limited_bloodshed", 5 );

            break;
        case 30:
            level thread _id_A7AA::_id_1208( "30killstreak", self );
            _id_A75A::_id_4C2C( "30killstreak", 1 );

            if ( isdefined( self._id_1C61["ch_limited_bloodshed"] ) && self._id_1C61["ch_limited_bloodshed"] == 6 )
                _id_A7A0::_id_6FF3( "ch_limited_bloodshed", 5 );

            break;
        default:
            level thread _id_A7AA::_id_1208( "30pluskillstreak", self );
            _id_A75A::_id_4C2C( "30pluskillstreak", 1 );
            break;
    }

    thread _id_A75A::_id_91F3( "callout_kill_streaking", self, undefined, var_1 );
}

_id_1D0C( var_0 )
{
    if ( _id_A75A::_id_412A() < 90000.0 )
        return;

    var_1 = level._id_0328;

    if ( level._id_91E4 )
        var_1 = level._id_91EE[_id_A75A::_id_4065( self._id_04A8 )];

    if ( var_1.size < 3 )
        return;

    var_2 = _id_A4F0::_id_0D06( var_1, ::_id_5076 );

    if ( isdefined( var_2[0] ) && var_0 == var_2[0] )
    {
        _id_A75A::_id_4C2C( "firstplacekill", 1 );
        level thread _id_A7AA::_id_1208( "firstplacekill", self );
        _id_A7A0::_id_6FF3( "ch_precision_highvalue" );
    }
}

_id_5076( var_0, var_1 )
{
    return var_0._id_0390 > var_1._id_0390;
}

_id_6FF1( var_0, var_1 )
{
    if ( isdefined( level._id_0D7B ) && level._id_0D7B )
        return;

    var_2 = "assist";

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    self endon( "disconnect" );
    var_0 endon( "disconnect" );
    wait 0.05;

    if ( self._id_04A8 != "axis" && self._id_04A8 != "allies" )
        return;

    if ( self._id_04A8 == var_0._id_04A8 )
        return;

    level thread _id_A7AA::_id_1208( var_2, self, undefined, var_0 );
    var_0 _id_A744::_id_5848( self, var_2 );

    if ( var_2 == "assist" || var_2 == "assist_riot_shield" )
    {
        _id_A75A::_id_4C2C( "assists", 1 );
        _id_A75A::_id_4C2B( "assists", 1 );
        self._id_004F = _id_A75A::_id_407F( "assists" );

        if ( var_2 == "assist_riot_shield" )
            _id_A75A::_id_4C2C( "assist_riot_shield", 1 );

        _id_A7A4::_id_8D74( "round", "assists", self._id_004F );
        thread _id_A7A0::_id_6C64();

        if ( level._id_6E92 )
            thread _id_6E93( var_0 );
    }
}

_id_5345( var_0 )
{
    _id_A7A0::_id_6FF3( "ch_exomech_evasive" );
    _id_A7A0::processchallengedaily( 34, undefined, undefined );

    if ( isdefined( var_0 ) )
    {
        var_1 = _id_A75A::_id_3F0F( var_0, 1 );

        if ( _id_A75A::_id_514A( var_1 ) )
            var_1 = _id_A781::_id_3F0E( var_1 );

        var_2 = _id_A7A0::_id_3CE6( var_0, var_1 );

        if ( var_2 == "weapon_assault" || var_2 == "weapon_pistol" || var_2 == "weapon_special" )
        {
            switch ( var_1 )
            {
                case "iw5_dlcgun1":
                case "iw5_dlcgun3":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_" + var_1 );
                    break;
                case "iw5_dlcgun6":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgun5" );
                    break;
                case "iw5_dlcgun7loot0":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgun7" );
                    break;
                case "iw5_dlcgun7loot6":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgun8" );
                    break;
                case "iw5_dlcgun13":
                    _id_A7A0::_id_6FF3( "ch_tier2_2_iw5_dlcgun10" );
                    break;
                case "iw5_dlcgun23":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcguna" );
                    break;
                case "iw5_dlcgun33":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgunc" );
                    break;
                default:
                    _id_A7A0::_id_6FF3( "ch_dodge_" + var_1 );
                    break;
            }
        }
    }
}

camosprintslidekillevent( var_0, var_1 )
{
    var_2 = _id_A75A::_id_3F0F( var_0, 1 );

    if ( _id_A75A::_id_514A( var_2 ) )
        var_2 = _id_A781::_id_3F0E( var_2 );

    var_3 = _id_A7A0::_id_3CE6( var_0, var_2 );

    switch ( var_3 )
    {
        case "weapon_smg":
        case "weapon_shotgun":
        case "weapon_special":
        case "weapon_pistol":
            switch ( var_2 )
            {
                case "iw5_dlcgun3":
                    _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgun3" );
                    break;
                case "iw5_dlcgun4":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgun4" );
                    break;
                case "iw5_dlcgun8loot1":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgun9" );
                    break;
                case "iw5_dlcgun13":
                    _id_A7A0::_id_6FF3( "ch_tier2_1_iw5_dlcgun10" );
                    break;
                case "iw5_dlcgun18":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgun11" );
                    break;
                case "iw5_dlcgun28":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgunb" );
                    break;
                case "iw5_dlcgun38":
                    _id_A7A0::_id_6FF3( "ch_tier2_3_iw5_dlcgund" );
                    break;
                default:
                    _id_A7A0::_id_6FF3( "ch_slide_" + var_2 );
                    break;
            }

            break;
    }
}
