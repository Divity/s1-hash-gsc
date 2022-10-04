// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_52AA = [];
    level._id_52AA["juggernaut_exosuit"] = spawnstruct();
    level._id_52AA["juggernaut_exosuit"]._id_8A67 = "used_juggernaut";
    level._id_52AA["juggernaut_exosuit"]._id_8A5F = "callout_destroyed_heavyexoattachment";
    level._id_52AA["juggernaut_exosuit"]._id_8A68 = "callout_weakened_heavyexoattachment";
    level._id_058F["green_light_mp"] = loadfx( "vfx/lights/aircraft_light_wingtip_green" );
    level._id_058F["juggernaut_sparks"] = loadfx( "vfx/explosion/bouncing_betty_explosion" );
    level._id_058F["jugg_droppod_open"] = loadfx( "vfx/explosion/goliath_pod_opening" );
    level._id_058F["jugg_droppod_marker"] = loadfx( "vfx/unique/vfx_marker_killstreak_guide_goliath" );
    level._id_058F["exo_ping_inactive"] = loadfx( "vfx/unique/exo_ping_inactive" );
    level._id_058F["exo_ping_active"] = loadfx( "vfx/unique/exo_ping_active" );
    level._id_058F["goliath_death_fire"] = loadfx( "vfx/fire/goliath_death_fire" );
    level._id_058F["goliath_self_destruct"] = loadfx( "vfx/explosion/goliath_self_destruct" );
    level._id_058F["lethal_rocket_wv"] = loadfx( "vfx/muzzleflash/playermech_lethal_flash_wv" );
    level._id_058F["swarm_rocket_wv"] = loadfx( "vfx/muzzleflash/playermech_tactical_wv_run" );
    level._id_53AC["juggernaut_sentry_mg_mp"] = "juggernaut_exosuit";
    level._id_53AC["iw5_juggernautrockets_mp"] = "juggernaut_exosuit";
    level._id_53AC["iw5_exoxmgjugg_mp_akimbo"] = "juggernaut_exosuit";
    level._id_53AC["iw5_juggtitan45_mp"] = "juggernaut_exosuit";
    level._id_53AC["iw5_exominigun_mp"] = "juggernaut_exosuit";
    level._id_53AC["iw5_mechpunch_mp"] = "juggernaut_exosuit";
    level._id_53AC["playermech_rocket_mp"] = "juggernaut_exosuit";
    level._id_53AC["killstreak_goliathsd_mp"] = "juggernaut_exosuit";
    level._id_53AC["orbital_carepackage_droppod_mp"] = "juggernaut_exosuit";
    level._id_53AC["heavy_exo_trophy_mp"] = "juggernaut_exosuit";
    level._id_5398["heavy_exosuit"] = ::_id_98AB;
    game["dialog"]["assist_mp_goliath"] = "ks_goliath_joinreq";
    game["dialog"]["copilot_mp_goliath"] = "copilot_mp_goliath";
    game["dialog"]["sntryoff_mp_exoai"] = "sntryoff_mp_exoai";
    game["dialog"]["mancoff_mp_exoai"] = "mancoff_mp_exoai";
    game["dialog"]["longoff_mp_exoai"] = "longoff_mp_exoai";
    game["dialog"]["rcnoff_mp_exoai"] = "rcnoff_mp_exoai";
    game["dialog"]["rcktoff_mp_exoai"] = "rcktoff_mp_exoai";
    game["dialog"]["trphyoff_mp_exoai"] = "trphyoff_mp_exoai";
    game["dialog"]["weakdmg_mp_exoai"] = "weakdmg_mp_exoai";
    level thread _id_64C5();
}

_id_98AB( var_0, var_1 )
{
    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( isdefined( self.hordegoliathpodinfield ) || isdefined( self.hordegoliathcontroller ) || isdefined( self.hordeclassgoliathcontroller ) )
        {
            self _meth_826E( &"KILLSTREAKS_HEAVY_EXO_IN_USE" );
            return 0;
        }
    }

    var_2 = _id_6CD8( var_1 );
    return var_2;
}

_id_7466()
{
    var_0 = _id_A75A::_id_3FF7( "heavy_exosuit" );
    self _meth_8315( _id_A4F0::_id_3FFB() );
    _id_A7C3::_id_9125( var_0 );
}

_id_1AE6()
{
    if ( self _meth_817C() == "prone" || self _meth_817C() == "crouch" )
        self _meth_817D( "stand" );

    _id_A75A::_id_3A30( 1 );
    var_0 = gettime() + 1500;

    while ( gettime() < var_0 && self _meth_817C() != "stand" )
        waittillframeend;

    _id_A75A::_id_3A30( 0 );
    return self _meth_817C() == "stand";
}

_id_41EA( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    if ( _id_A7DB::_id_4732() )
        _id_A7DB::_id_9A74();

    if ( _id_A75A::_id_05CB( "specialty_explosivebullets" ) )
        _id_A75A::_id_067B( "specialty_explosivebullets" );

    self._id_0275 = 125;

    if ( isdefined( level._id_511A ) && level._id_511A )
        self._id_0275 = 300 + 25 * self._id_4957;

    self._id_01E7 = self._id_0275;
    self._id_0E31 = [];

    switch ( var_0 )
    {
        case "juggernaut_exosuit":
        default:
            var_2 = 1;
            var_3 = "juggernaut_exosuit";

            if ( !isdefined( var_1 ) || _id_A4F0::_id_0CE4( var_1, "heavy_exosuit_maniac" ) )
            {
                var_2 = 1.15;
                var_3 = "juggernaut_exosuit_maniac";
            }

            self._id_52A7 = var_2;
            _id_73E9();
            var_4 = isdefined( self._id_030B["specialty_hardline"] );
            _id_A781::_id_41DD( self._id_030D["team"], var_3, 0, 0 );
            _id_A7A7::_id_8F2A( 0, 0, var_3 );
            self._id_512E = 1;
            self._id_5F78 = var_2;
            _id_A75A::_id_41F5( "specialty_radarjuggernaut", 0 );

            if ( var_4 )
                _id_A75A::_id_41F5( "specialty_hardline", 0 );

            thread _id_6D4B( var_1, var_0 );
            self._id_7811 = self _meth_830C()[0];
            break;
    }

    _id_A7B4::_id_9B35();
    self _meth_82CB();

    if ( !isdefined( var_1 ) || _id_A4F0::_id_0CE4( var_1, "heavy_exosuit_maniac" ) )
        self _meth_809A( "goliath_suit_up_mp" );
    else
        self _meth_809A( "goliath_suit_up_mp" );

    thread _id_A75A::_id_91F3( level._id_52AA[var_0]._id_8A67, self );
    thread _id_52A9();
    level notify( "juggernaut_equipped", self );
    _id_A744::_id_5838( "juggernaut", self._id_02E6 );
}

_id_52A4()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    for (;;)
    {
        wait 3.0;
        self _meth_809A( "juggernaut_breathing_sound" );
    }
}

_id_70AC( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    self endon( "jugdar_removed" );

    for (;;)
    {
        var_0 _meth_82AE( self._id_02E6, 0.05 );
        wait 0.05;
    }
}

_id_52A9()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    thread _id_52A8();
    _id_A4F0::_id_A060( "death", "joined_team", "joined_spectators", "lost_juggernaut" );
    self _meth_82CC();
    self._id_512E = 0;
    _id_A4F0::_id_7463();
    self _meth_8301( 1 );
    self _meth_8119( 1 );
    self _meth_8302( 1 );
    self _meth_8303( 1 );
    self _meth_84B3( 0 );

    if ( isdefined( self._id_52A3 ) )
        self._id_52A3 _meth_8088();

    self _meth_82A9( "specialty_radarjuggernaut", 1 );

    if ( isdefined( self._id_67E0 ) )
    {
        self notify( "jugdar_removed" );
        level _id_A7A8::_id_2864( self._id_67E0 );
        self._id_67E0 = undefined;
    }

    self notify( "jugg_removed" );
}

_id_52A8()
{
    self endon( "disconnect" );
    self endon( "jugg_removed" );
    level waittill( "game_ended" );

    if ( isdefined( self._id_52A3 ) )
        self._id_52A3 _meth_8088();
}

_id_73E9()
{
    self._id_6F8A = _id_A4F0::_id_3FFB();

    foreach ( var_1 in self._id_A2D4 )
    {
        var_2 = _id_A75A::_id_4169( var_1 );

        if ( var_2[0] == "alt" )
        {
            self._id_74B1[var_1] = self _meth_82F8( var_1 );
            self._id_74B3[var_1] = self _meth_82F9( var_1 );
            continue;
        }

        self._id_74B1[var_1] = self _meth_82F8( var_1 );
        self._id_74B3[var_1] = self _meth_82F9( var_1 );
    }

    self._id_A2E4 = [];

    foreach ( var_1 in self._id_A2D4 )
    {
        var_2 = _id_A75A::_id_4169( var_1 );

        if ( var_2[0] == "alt" )
            continue;

        if ( _id_A75A::_id_513A( var_1 ) )
            continue;

        self._id_A2E4[self._id_A2E4.size] = var_1;
        self _meth_830F( var_1 );
    }
}

_id_6D4B( var_0, var_1 )
{
    var_2 = spawnstruct();
    self._id_4798 = var_2;
    var_2._id_8F22 = self;
    var_2._id_4722 = 1;
    var_2._id_5D57 = var_0;
    var_2._id_52AB = var_1;

    if ( isdefined( var_0 ) )
    {
        var_2._id_01E0 = _id_A4F0::_id_0CE4( var_0, "heavy_exosuit_radar" );
        var_2._id_4734 = _id_A4F0::_id_0CE4( var_0, "heavy_exosuit_maniac" );
        var_2._id_4733 = _id_A4F0::_id_0CE4( var_0, "heavy_exosuit_punch" );
        var_2._id_4749 = _id_A4F0::_id_0CE4( var_0, "heavy_exosuit_trophy" );
        var_2._id_473F = _id_A4F0::_id_0CE4( var_0, "heavy_exosuit_rockets" );
        var_2._id_472A = _id_A4F0::_id_0CE4( var_0, "heavy_exosuit_ammo" );
    }
    else
    {
        var_2._id_01E0 = 1;
        var_2._id_4734 = 1;
        var_2._id_4733 = 0;
        var_2._id_4749 = 1;
        var_2._id_473F = 1;
        var_2._id_472A = 1;
    }

    var_3 = 0;

    if ( var_2._id_473F )
        var_3 += 1;

    if ( var_2._id_4733 )
        var_3 += 2;

    if ( var_2._id_01E0 )
        var_3 += 4;

    if ( var_2._id_4749 )
        var_3 += 8;

    if ( var_2._id_4734 )
        var_3 += 16;

    if ( var_2._id_4722 )
        var_3 += 32;

    self _meth_82FB( "ui_exo_suit_modules_on", var_3 );
    _id_A75A::_id_6C61( 0, "heavyexo" );

    if ( !var_2._id_4734 )
    {
        _id_A75A::_id_6C5E( 0, "heavyexo" );
        _id_A75A::_id_6C5D( 0, "heavyexo" );
        _id_A75A::_id_6C5F( 0, "heavyexo" );
        _id_A75A::_id_6C60( 0, "heavyexo" );
    }

    _id_A4F0::_id_0586();
    self _meth_8301( 0 );
    self _meth_8119( 0 );
    self _meth_8302( 0 );
    self _meth_8303( 0 );
    self._id_4E3A = 1;
    self._id_5B1D = 125;

    if ( isdefined( level._id_511A ) && level._id_511A )
        self._id_5B1D = self._id_0275;

    self _meth_84B3( 1 );
    self _meth_82FB( "ui_exo_suit_health", 1 );
    _id_6D48( var_2 );
    thread _id_6D52( var_2 );
    thread _id_6C6F( var_2 );
    thread _id_6C70();
    thread _id_6D36();
    thread _id_6CF0();
    thread _id_6CB3();
    thread _id_6955();
    thread _id_6D11();

    if ( isdefined( level._id_511A ) && level._id_511A )
        thread playermechtimeout();

    if ( var_2._id_4722 )
    {

    }

    if ( var_2._id_01E0 )
        level thread _id_832E( self, var_2 );

    if ( var_2._id_4734 )
    {
        level thread _id_831C( self );
        _id_7E6E( "offline" );
    }
    else
    {
        thread _id_6CB2();
        _id_7E6E( "ready" );
    }

    if ( var_2._id_4733 )
    {
        level thread _id_831B( self, var_2 );
        _id_7E70( "ready" );
        thread _id_6CF4();
    }
    else
    {
        _id_7E70( "offline" );

        if ( !var_2._id_4734 )
            self _meth_831F();
    }

    if ( var_2._id_4749 )
        level thread _id_8339( self, var_2 );

    if ( var_2._id_473F )
    {
        level thread _id_8334( self, var_2 );
        _id_7E73( "ready" );
        thread _id_6CF5();
    }
    else
    {
        self _meth_84BF();
        _id_7E73( "offline" );
    }

    level thread _id_27EB( self );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "horde_cancel_goliath" );

    wait 5;

    if ( isdefined( self ) )
        thread _id_7C6C();
}

_id_6CB3()
{
    self._id_426D = 1;
    wait 4.16;
    self._id_426D = undefined;
}

_id_52A2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !var_0 _id_A75A::_id_512E() )
        return var_2;

    var_9 = var_2;

    if ( isdefined( var_3 ) && var_3 == "MOD_FALLING" )
        var_9 = 0;

    if ( isdefined( var_4 ) && var_4 == "boost_slam_mp" )
        var_9 = 20;

    if ( isdefined( var_1 ) && isdefined( var_0 ) && var_1 == var_0 && isdefined( var_4 ) && ( var_4 == "iw5_juggernautrockets_mp" || var_4 == "playermech_rocket_mp" ) )
        var_9 = 0;

    if ( isdefined( var_0._id_426D ) && var_0._id_426D )
    {
        if ( isdefined( level._id_511A ) && level._id_511A && var_3 == "MOD_TRIGGER_HURT" && var_0 _id_A75A::_id_9402() )
            var_9 = 10000;
        else
            var_9 = 0;
    }

    if ( isdefined( var_1 ) && !_id_A7B4::_id_3AA4( var_0, var_1 ) )
        var_9 = 0;

    if ( var_9 > 0 )
    {
        if ( _id_A75A::_id_0E30( var_0, var_1 ) )
        {
            if ( isdefined( level._id_52A1 ) )
                var_9 *= level._id_52A1;
            else
                var_9 *= 0.08;
        }

        if ( isdefined( var_7 ) && var_7 == "head" )
            var_9 *= 4.0;

        if ( isdefined( var_4 ) && var_4 == "killstreak_goliathsd_mp" && isdefined( var_1 ) && isdefined( var_0 ) && var_1 == var_0 )
            var_9 = var_0._id_5B1D + 1;

        if ( isdefined( var_4 ) && var_4 == "nuke_mp" && isdefined( var_1 ) && isdefined( var_0 ) && var_1 != var_0 )
            var_9 = var_0._id_5B1D + 1;

        var_0._id_5B1D -= var_9;

        if ( isdefined( level._id_511A ) && level._id_511A )
            var_0 _meth_82FB( "ui_exo_suit_health", var_0._id_5B1D / var_0._id_0275 );
        else
            var_0 _meth_82FB( "ui_exo_suit_health", var_0._id_5B1D / 125 );

        if ( isdefined( var_1 ) && isplayer( var_1 ) )
        {
            if ( isdefined( var_7 ) && var_7 == "head" )
                var_1 _id_A784::_id_9B04( "headshot" );
            else
                var_1 _id_A784::_id_9B04( "hitjuggernaut" );

            if ( var_0 _id_A783::_id_5156( var_1 ) )
                var_0._id_0E31[var_0._id_0E31.size] = var_1;
        }

        if ( var_0._id_5B1D < 0 )
        {
            if ( isdefined( level._id_511A ) && level._id_511A )
            {
                _id_A750::_id_8706( "goliath_self_destruct" );
                playfx( _id_A4F0::_id_3FA6( "goliath_self_destruct" ), self._id_02E6, anglestoup( self._id_0041 ) );
                self thread [[ level.hordehandlejuggdeath ]]();
            }
            else
                var_0 thread _id_6CD6( var_5, var_1, var_3, var_4, var_8 );
        }
    }

    return int( var_9 );
}

_id_6CD6( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "killHeavyExo" );
    self _meth_8301( 1 );
    self _meth_8119( 1 );
    self _meth_8302( 1 );
    self _meth_8303( 1 );
    self _meth_84B3( 0 );
    self._id_512E = 0;
    var_5 = 1001;

    if ( !isdefined( var_0 ) )
        var_0 = self._id_02E6;

    var_6 = 0;

    if ( isdefined( var_3 ) && isdefined( var_1 ) && isdefined( var_2 ) && isdefined( var_4 ) )
        var_6 = self _meth_8051( var_5, var_0, var_1, var_4, var_2, var_3 );
    else if ( isdefined( var_3 ) && isdefined( var_1 ) && isdefined( var_2 ) )
        var_6 = self _meth_8051( var_5, var_0, var_1, undefined, var_2, var_3 );
    else if ( isdefined( var_1 ) && isdefined( var_2 ) )
        var_6 = self _meth_8051( var_5, var_0, var_1, undefined, var_2 );
    else if ( isdefined( var_1 ) )
        var_6 = self _meth_8051( var_5, var_0, var_1, undefined );
    else
        var_6 = self _meth_8051( var_5, var_0 );
}

_id_27EB( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_0 endon( "becameSpectator" );

    var_1 = _id_A75A::_id_3FF7( "heavy_exosuit" );
    var_0 _id_A7C3::_id_9125( var_1 );
    var_0 _meth_830E( "iw5_exominigun_mp" );
    var_0 _meth_8315( "iw5_exominigun_mp" );
    var_0 notify( "waitTakeKillstreakWeapon" );
    waittillframeend;
    var_0 _meth_8494( 1 );
    var_0 _meth_8321();
}

_id_6C6F( var_0 )
{
    self endon( "disconnect" );
    self waittill( "death", var_1, var_2, var_3 );

    if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 != self && var_1._id_04A8 != self._id_04A8 )
    {
        var_1 _id_A75A::_id_4C2C( "goliath_destroyed", 1 );
        level thread _id_A7AA::_id_1208( "goliath_destroyed", var_1, var_3, self, var_2 );
    }

    if ( !isdefined( level._id_511A ) )
        _id_A72E::_id_1D24( var_1 );

    self._id_4E3A = undefined;
    self._id_5B1D = undefined;
    _id_6D2E( var_0 );
}

_id_6C70()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    level _id_A4F0::_id_A060( "game_ended" );
    _id_6D32();
}

_id_6D2E( var_0 )
{
    self notify( "lost_juggernaut" );
    self notify( "exit_mech" );
    _id_6D32();
    _id_A75A::_id_6C5E( 1, "heavyexo" );
    _id_A75A::_id_6C61( 1, "heavyexo" );
    _id_A75A::_id_6C5D( 1, "heavyexo" );
    _id_A75A::_id_6C5F( 1, "heavyexo" );
    self _meth_84C0();
    self _meth_8320();
    self _meth_8322();
    self _meth_8494( 0 );
    self._id_74B1 = undefined;
    self._id_74B3 = undefined;
    self._id_52A6 = undefined;
    self._id_4798 = undefined;

    if ( isdefined( self._id_529F ) )
        self._id_529F = undefined;

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in var_0._id_4AB0 )
        {
            if ( isdefined( var_2 ) )
            {
                var_2._id_92B9 = undefined;
                var_2._id_04D8 = undefined;
                var_2 _meth_8088();
            }
        }
    }
}

_id_6D32()
{
    self _meth_82FB( "ui_exo_suit_enabled", 0 );
    self _meth_82FB( "ui_exo_suit_modules_on", 0 );
    self _meth_82FB( "ui_exo_suit_health", 0 );
    self _meth_82FB( "ui_exo_suit_recon_cd", 0 );
    self _meth_82FB( "ui_exo_suit_punch_cd", 0 );
    self _meth_82FB( "ui_exo_suit_rockets_cd", 0 );
    self _meth_82FB( "ui_playermech_swarmrecharge", 0 );
    self _meth_82FB( "ui_playermech_rocketrecharge", 0 );
}

_id_6D48( var_0 )
{
    self _meth_802B();
    self _meth_80B1( "npc_exo_armor_mp_base" );
    self _meth_801D( "head_hero_cormack_sentinel_halo" );
    self _meth_8343( "vm_view_arms_mech_mp" );

    if ( isdefined( var_0 ) && !var_0._id_4734 || isdefined( level._id_511A ) )
        self _meth_801D( "npc_exo_armor_minigun_handle", "TAG_HANDLE" );

    if ( isai( self ) )
        self._id_4878 = 1;

    self notify( "goliath_equipped" );
}

_id_6CB2()
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    thread _id_6C6E();
    self _meth_82DD( "goliathAttack", "+attack" );
    self _meth_82DD( "goliathAttackDone", "-attack" );
    self._id_12E9 = spawn( "script_model", self _meth_8180( "tag_barrel" ) );
    self._id_12E9 _meth_80B1( "generic_prop_raven" );
    self._id_12E9 _meth_8446( self, "tag_barrel", ( 12.7, 0, -2.9 ), ( 90, 0, 0 ) );
    self._id_12E4 = spawn( "script_model", self._id_12E9 _meth_8180( "j_prop_1" ) );
    self._id_12E4 _meth_80B1( "npc_exo_armor_minigun_barrel" );
    self._id_12E4 _meth_8446( self._id_12E9, "j_prop_1", ( 0, 0, 0 ), ( -90, 0, 0 ) );

    if ( isdefined( level._id_511A ) && level._id_511A && isplayer( self ) )
        self._id_12E4 _meth_83FA( 5, 1 );

    self._id_12E9 _meth_827B( "mp_generic_prop_spin_02" );
    self._id_12E9 _meth_84BD( 1 );

    for (;;)
    {
        self waittill( "goliathAttack" );
        self._id_12E9 _meth_84BD( 0 );
        self waittill( "goliathAttackDone" );
        self._id_12E9 _meth_84BD( 1 );
    }
}

_id_6C6E()
{
    if ( isdefined( level._id_511A ) && level._id_511A )
        _id_A4F0::_id_A060( "death", "disconnect", "becameSpectator" );
    else
        _id_A4F0::_id_A060( "death", "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self._id_12E4 _meth_83FB();

    self._id_12E4 delete();
    self._id_12E9 delete();
}

_id_6D36()
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    for (;;)
    {
        self waittill( "grenade_pullback", var_0 );

        if ( var_0 == "playermech_rocket_mp" )
        {
            self notify( "mech_rocket_pullback" );
            self waittill( "grenade_fire", var_1 );
            self notify( "mech_rocket_fire", var_1 );
        }
        else if ( var_0 == "playermech_rocket_swarm_mp" || var_0 == "playermech_rocket_swarm_maniac_mp" )
        {
            self notify( "mech_swarm_pullback" );
            self waittill( "grenade_fire", var_1 );
            self notify( "mech_swarm_fire", var_1._id_02E6 );
            var_1 delete();
        }

        waittillframeend;
    }
}

_id_8301( var_0, var_1 )
{
    var_2 = var_1 _meth_8180( "tag_turret" );
    var_3 = _id_898C( "juggernaut_sentry_mg_mp", "npc_heavy_exo_armor_turret_base", var_2, 200, var_1, &"KILLSTREAKS_HEAVY_EXO_SENTRY_LOST" );
    var_3 _meth_8065( "sentry_offline" );
    var_3 _meth_8103( var_1 );
    var_3 _meth_8156( 180 );
    var_3 _meth_8155( 180 );
    var_3 _meth_8157( 55 );
    var_3 _meth_8158( 30 );
    var_3 _meth_815A( 0.0 );
    var_3 _meth_817A( 1 );
    var_3 _meth_80C0();
    var_3 _meth_8136();
    var_3._id_7593 = 0;
    var_3._id_32CD = 0;
    var_3._id_99BD = "mg_turret";
    var_3._id_5199 = 0;
    var_3._id_8F6E = 0;
    var_3._id_60DB = 5;
    var_3._id_4795 = 0;
    var_3._id_1316 = var_1;

    if ( level._id_91E4 )
        var_3 _meth_8135( var_1._id_04A8 );

    var_3 _id_A4F0::_id_5920( var_1._id_04A8 );
    var_3 _id_A7BA::_id_0855( var_3 _meth_81B1() );
    var_3 thread _id_A7CD::_id_9999();
    var_3 _meth_804D( var_1, "tag_turret", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3._id_3017 = _id_898D( var_2, var_1 );
    var_3._id_3017 _meth_804D( var_3, "tag_player", ( 29, -7, -6 ), ( 0, 0, 0 ) );
    var_3._id_3017 _meth_8054();
    var_0._id_21CA = var_3;
    thread _id_8F01( var_0, var_3, var_1 );
    thread _id_4650( var_0, var_3, var_1 );
    thread _id_4688( var_0, var_3, var_1 );
    return var_3;
}

_id_8F01( var_0, var_1, var_2 )
{
    var_1 waittill( "death" );

    if ( isdefined( var_1 ) )
    {
        var_1._id_5199 = 0;
        var_2 notify( "turretDead" );
        _id_7397( var_0 );
        _id_8EE2( var_1, _id_A4F0::_id_3FA6( "green_light_mp" ), 1 );
        var_1 _meth_809A( "sentry_explode" );
        var_1 thread _id_A7CD::_id_7CBE();
        var_1 _id_A7BA::_id_73AF( var_1 _meth_81B1() );
        var_1 _meth_8065( "sentry_offline" );
        var_1._id_258D = undefined;
        var_1 _meth_82C0( 0 );
        var_1 _meth_8495( 0 );
        var_1 _meth_813A();
        var_1 _meth_815A( 35 );
        var_1 _meth_8103( undefined );
        level thread _id_2D89( var_1 );
    }
}

_id_4650( var_0, var_1, var_2 )
{
    var_1 endon( "death" );
    var_3 = weaponfiretime( "juggernaut_sentry_mg_mp" );

    for (;;)
    {
        if ( !isdefined( var_1._id_7320 ) || !var_1._id_7320 )
        {
            waittillframeend;
            continue;
        }

        if ( var_1._id_02E9 _meth_833D() && !var_1 _meth_844F() )
        {
            var_1 _id_99B6( var_1._id_1316 );
            wait(var_3);
            continue;
        }

        waittillframeend;
    }
}

_id_99B5()
{
    self _meth_80EA();
    _id_99B6( self._id_1316 );
}

_id_99B6( var_0 )
{
    var_1 = self _meth_8180( "tag_flash" );
    var_2 = anglestoforward( self _meth_8181( "tag_flash" ) );
    var_3 = var_1 + var_2 * 1000;
    var_4 = 0;
    self._id_60DB--;

    if ( self._id_60DB <= 0 )
    {
        var_4 = 1;
        self._id_60DB = 5;
    }

    _func_2A0( var_1, var_3, "juggernaut_sentry_mg_mp", var_4, var_0 );
}

_id_2D89( var_0 )
{
    var_0 _meth_809A( "sentry_explode" );
    playfxontag( _id_A4F0::_id_3FA6( "sentry_explode_mp" ), var_0, "tag_aim" );
    wait 1.5;

    if ( !isdefined( var_0 ) )
        return;

    var_0 _meth_809A( "sentry_explode_smoke" );

    for ( var_1 = 0; var_1 < 10; var_1++ )
    {
        playfxontag( _id_A4F0::_id_3FA6( "sentry_smoke_mp" ), var_0, "tag_aim" );
        wait 0.4;

        if ( !isdefined( var_0 ) )
            return;
    }
}

_id_4688( var_0, var_1, var_2 )
{
    thread _id_0DFE( var_0, var_1, var_2 );
    _id_A0C6( var_2 );
    _id_8EE2( var_1, _id_A4F0::_id_3FA6( "green_light_mp" ) );
    var_1 _id_A7BA::_id_73AF( var_1 _meth_81B1() );
    var_1._id_5199 = 0;
    var_2 notify( "turretDead" );
    _id_7397( var_0 );
    var_1 delete();
}

_id_832E( var_0, var_1 )
{
    var_2 = var_0 _meth_8180( "tag_recon_back" );
    var_3 = _id_898C( "radar", "npc_heavy_exo_armor_recon_back_base", var_2, undefined, var_0 );
    var_3 _meth_804D( var_0, "tag_recon_back", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0 thread _id_6CBA( var_1, var_3 );
    _id_A0C6( var_0 );
    waittillframeend;
    var_3 delete();
}

_id_6CBA( var_0, var_1 )
{
    var_1 endon( "death" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "joined_team" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    if ( !isbot( self ) )
        self _meth_82DD( "juggernautPing", "weapnext" );

    playfxontag( _id_A4F0::_id_3FA6( "exo_ping_inactive" ), self, "J_SpineUpper" );

    for (;;)
    {
        self waittill( "juggernautPing" );
        _id_06F8();
        self _meth_82FB( "ui_exo_suit_recon_cd", 1 );
        wait 10;
        _id_262B();
        _id_A001( 5, "ui_exo_suit_recon_cd" );
    }
}

_id_06F8()
{
    thread _id_8E77();
    self _meth_82A6( "specialty_exo_ping", 1, 0 );
    self _meth_82F4( "mp_exo_cloak_activate" );
    self._id_488E = _id_A756::_id_299E( self, -1 );
    killfxontag( _id_A4F0::_id_3FA6( "exo_ping_inactive" ), self, "J_SpineUpper" );
    playfxontag( _id_A4F0::_id_3FA6( "exo_ping_active" ), self, "J_SpineUpper" );
}

_id_262B()
{
    self _meth_82A9( "specialty_exo_ping", 1 );
    self _meth_82F4( "mp_exo_cloak_deactivate" );

    if ( isdefined( self._id_488E ) )
        _id_A756::_id_299C( self._id_488E );

    killfxontag( _id_A4F0::_id_3FA6( "exo_ping_active" ), self, "J_SpineUpper" );
    playfxontag( _id_A4F0::_id_3FA6( "exo_ping_inactive" ), self, "J_SpineUpper" );
}

_id_8E77()
{
    self endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        _id_A4F0::_id_A060( "death", "faux_spawn", "joined_team", "becameSpectator" );
    else
        _id_A4F0::_id_A060( "death", "faux_spawn", "joined_team" );

    self _meth_82A9( "specialty_exo_ping", 1 );

    if ( isdefined( self._id_488E ) )
        _id_A756::_id_299C( self._id_488E );

    killfxontag( _id_A4F0::_id_3FA6( "exo_ping_active" ), self, "J_SpineUpper" );
}

_id_831C( var_0 )
{
    var_1 = var_0 _meth_8180( "tag_maniac_l" );
    var_2 = _id_898C( "speedAttachment", "npc_heavy_exo_armor_maniac_l_base", var_1, undefined, var_0 );
    var_2 _meth_804D( var_0, "tag_maniac_l", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_1 = var_0 _meth_8180( "tag_maniac_r" );
    var_3 = _id_898C( "speedAttachment", "npc_heavy_exo_armor_maniac_r_base", var_1, undefined, var_0 );
    var_3 _meth_804D( var_0, "tag_maniac_r", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_4 = var_0 _meth_8180( "tag_jetpack" );
    var_5 = _id_898C( "speedAttachment", "npc_heavy_exo_armor_jetpack_base", var_4, undefined, var_0 );
    var_5 _meth_804D( var_0, "tag_jetpack", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    _id_A0C6( var_0 );
    _id_0DFF( var_2, var_0, "maniac", var_3 );
    _id_0DFF( var_5, var_0, "maniac" );
    waittillframeend;
    var_2 delete();
    var_3 delete();
    var_5 delete();
}

_id_831B( var_0, var_1 )
{
    var_0 _meth_8344( "playermech_rocket_mp" );
    var_0 _meth_830E( "playermech_rocket_mp" );
    var_2 = "tag_origin";
    var_0 thread _id_6D8D( var_1 );
    _id_A0C6( var_0 );
}

_id_6D8D( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    for (;;)
    {
        self waittill( "mech_rocket_fire", var_1 );
        playfxontag( _id_A4F0::_id_3FA6( "lethal_rocket_wv" ), self, "TAG_WEAPON_RIGHT" );
        thread _id_7319( self, var_0 );
    }
}

_id_7319( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_0 endon( "becameSpectator" );

    _id_A001( 10, "ui_exo_suit_punch_cd" );
}

_id_6DD1( var_0 )
{
    self _meth_82F4( "orbitalsupport_reload_40mm" );
}

_id_A001( var_0, var_1 )
{
    var_2 = 0;

    for (;;)
    {
        wait 0.05;
        var_2 += 0.05;
        var_3 = 1 - var_2 / var_0;
        var_3 = clamp( var_3, 0, 1 );
        self _meth_82FB( var_1, var_3 );

        if ( var_3 <= 0 )
            break;
    }
}

_id_8339( var_0, var_1 )
{
    var_2 = var_0 _meth_8180( "j_spine4" );
    var_3 = _id_898C( "trophy", "npc_heavy_exo_armor_trophy_l_base", var_2, undefined, var_0 );
    var_3._id_8F6E = 0;
    var_3._id_0B6E = 1;
    var_3 _meth_804D( var_0, "tag_trophy_l", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3._id_A2D6 = "heavy_exo_trophy_mp";
    var_3 thread _id_A787::_id_982C( var_0, undefined, 1, var_3._id_A2D6 );
    var_3 thread _id_A787::_id_982D( 12, ( 90, 90, 270 ) );
    var_3 thread _id_A787::_id_983E( -0.087, ( 90, 90, 270 ) );
    level._id_9820[level._id_9820.size] = var_3;
    var_4 = _id_898C( "trophy", "npc_heavy_exo_armor_trophy_r_base", var_2, undefined, var_0 );
    var_4._id_8F6E = 0;
    var_4._id_0B6E = 1;
    var_4 _meth_804D( var_0, "tag_trophy_r", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_4._id_A2D6 = "heavy_exo_trophy_mp";
    var_4 thread _id_A787::_id_982C( var_0, undefined, 1, var_4._id_A2D6 );
    var_4 thread _id_A787::_id_982D( 6, ( 260, 90, 270 ) );
    var_4 thread _id_A787::_id_983E( -0.087, ( 260, 90, 270 ) );
    level._id_9820[level._id_9820.size] = var_4;
    var_3._id_65B1 = var_4;
    var_4._id_65B1 = var_3;
    _id_A0C6( var_0 );
    var_3 notify( "trophyDisabled" );
    var_4 notify( "trophyDisabled" );
    waittillframeend;

    if ( isdefined( var_3._id_54F1 ) )
        var_3._id_54F1 delete();

    if ( isdefined( var_4._id_54F1 ) )
        var_4._id_54F1 delete();

    var_3 delete();
    var_4 delete();
}

_id_983F()
{
    if ( self._id_8F6E )
        return;

    self._id_8F6E = 1;
    self._id_65B1._id_8F6E = 1;
    var_0 = spawn( "script_model", self._id_02E6 );
    var_0 _meth_80B1( "tag_origin" );
    playfxontag( _id_A4F0::_id_3FA6( "mine_stunned" ), var_0, "tag_origin" );
    thread _id_983B( var_0 );
    _id_A4F0::_id_A097( "death", 3 );
    self notify( "stunEnd" );
    stopfxontag( _id_A4F0::_id_3FA6( "mine_stunned" ), var_0, "tag_origin" );
    waittillframeend;
    var_0 delete();

    if ( isdefined( self ) )
    {
        self._id_8F6E = 0;
        self._id_65B1._id_8F6E = 0;
    }
}

_id_983B( var_0 )
{
    self endon( "death" );
    self endon( "stunEnd" );

    for (;;)
    {
        var_0._id_02E6 = self._id_02E6;
        waittillframeend;
    }
}

_id_8334( var_0, var_1 )
{
    var_2 = "playermech_rocket_swarm_mp";

    if ( var_1._id_4734 )
        var_2 = "playermech_rocket_swarm_maniac_mp";

    var_0 _meth_8319( var_2 );
    var_0 _meth_830E( var_2 );
    var_3 = "tag_origin";
    var_4 = var_0 _meth_8180( var_3 );
    var_5 = _id_898C( "rocketAttachment", "npc_heavy_exo_armor_missile_pack_base", var_4, undefined, var_0 );
    var_5._id_580D = 0;
    var_5._id_7314 = 0;
    var_5._id_7591 = [];
    var_5._id_4B4D = [];
    var_5 _meth_804D( var_0, var_3, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_5 _meth_8054();
    var_0._id_758A = var_5;
    thread _id_783C( var_5, var_0 );
    var_0 thread _id_6D8E( var_5, var_1 );
    _id_A0C6( var_0, var_5 );
    waittillframeend;
    var_5 delete();
    var_0._id_758A = undefined;
}

_id_783C( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1 endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_1 endon( "becameSpectator" );

    for (;;)
    {
        waittillframeend;

        if ( var_0._id_7314 || var_0._id_7591.size > 0 || var_0._id_580D )
            continue;

        var_2 = _id_3F14( var_1, 4 );

        if ( isdefined( var_2 ) )
        {
            if ( !isdefined( var_0._id_32C4 ) || var_0._id_32C4 != var_2 )
                thread _id_59CC( var_0, var_1, var_2 );

            continue;
        }

        if ( isdefined( var_0._id_32C4 ) )
        {
            var_0 notify( "unmark" );
            var_0._id_32C4 = undefined;
        }
    }
}

_id_6CD2()
{
    return isdefined( self._id_758A ) && isdefined( self._id_758A._id_7314 ) && self._id_758A._id_7314;
}

_id_6CD3()
{
    return isdefined( self._id_758A ) && isdefined( self._id_758A._id_32C4 );
}

_id_3F14( var_0, var_1 )
{
    var_2 = 0.843391;
    var_3 = anglestoforward( var_0 _meth_833B() );
    var_4 = var_0 _meth_80A8();
    var_5 = undefined;
    var_6 = [];

    foreach ( var_8 in level._id_669A )
    {
        if ( var_8._id_04A8 == var_0._id_04A8 )
            continue;

        if ( !_id_A75A::_id_5186( var_8 ) )
            continue;

        var_9 = var_8 _meth_80A8();
        var_10 = vectornormalize( var_9 - var_4 );
        var_11 = vectordot( var_3, var_10 );

        if ( var_11 > var_2 )
        {
            var_6[var_6.size] = var_8;
            var_8._id_2D7F = var_11;
            var_8._id_1CFB = 0;
        }
    }

    if ( var_6.size == 0 )
        return;

    for ( var_13 = 0; var_13 < var_1 && var_13 < var_6.size; var_13++ )
    {
        var_14 = _id_3FC4( var_6 );
        var_14._id_1CFB = 1;
        var_15 = var_4;
        var_16 = var_14 _meth_80A8();
        var_17 = sighttracepassed( var_15, var_16, 1, var_0, var_14 );

        if ( var_17 )
        {
            var_5 = var_14;
            break;
        }
    }

    foreach ( var_8 in level._id_669A )
    {
        var_8._id_2D7F = undefined;
        var_8._id_1CFB = undefined;
    }

    return var_5;
}

_id_3FC4( var_0 )
{
    if ( var_0.size == 0 )
        return;

    var_1 = undefined;
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        if ( !var_4._id_1CFB && var_4._id_2D7F > var_2 )
        {
            var_1 = var_4;
            var_2 = var_4._id_2D7F;
        }
    }

    return var_1;
}

_id_6D8E( var_0, var_1 )
{
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( "mech_swarm_fire", var_2 );

        if ( var_0._id_7314 || var_0._id_580D )
        {
            waittillframeend;
            continue;
        }

        thread _id_4662( var_0, var_1 );
        thread _id_731A( var_0, self, var_1 );
        thread _id_37E4( var_0, self, var_2 );
    }
}

_id_4662( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0._id_580D = 1;
    var_0 notify( "lockedTarget" );
    _id_A0EA( var_0 );

    if ( isdefined( var_0 ) )
    {
        var_0._id_580D = 0;
        var_0._id_32C4 = undefined;
    }
}

_id_37E4( var_0, var_1, var_2 )
{
    var_3 = anglestoforward( var_1 _meth_833B() );
    var_4 = anglestoright( var_1 _meth_833B() );
    var_5 = [ ( 0, 0, 50 ), ( 0, 0, 20 ), ( 10, 0, 0 ), ( 0, 10, 0 ) ];
    playfxontag( _id_A4F0::_id_3FA6( "swarm_rocket_wv" ), var_1, "TAG_ROCKET4" );

    for ( var_6 = 0; var_6 < 4; var_6++ )
    {
        var_7 = var_2 + var_3 * 20 + var_4 * -30;
        var_8 = var_3 + _id_7117( 0.2 );
        var_9 = magicbullet( "iw5_juggernautrockets_mp", var_7, var_7 + var_8, var_1 );
        var_0._id_7591 = _id_A4F0::_id_0CDA( var_0._id_7591, var_9 );
        var_9 thread _id_7592( var_0, var_0._id_32C4, var_5[var_6] );
        var_9 thread _id_758C( 7 );
    }
}

_id_7592( var_0, var_1, var_2 )
{
    var_0 endon( "death" );

    if ( isdefined( var_1 ) )
        self _meth_81D9( var_1, var_2 );

    self waittill( "death" );
    var_0._id_7591 = _id_A4F0::_id_0CF6( var_0._id_7591, self );
}

_id_758C( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self delete();
}

_id_731A( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0._id_7314 = 1;
    _id_A001( 10, "ui_exo_suit_rockets_cd" );
    var_0._id_7314 = 0;
}

_id_6DD2( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_3 = 3;
    self _meth_82F4( "warbird_missile_reload_bed" );
    wait 0.5;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        self _meth_82F4( "warbird_missile_reload" );
        wait(var_2 / var_3);
    }
}

_id_59CC( var_0, var_1, var_2 )
{
    var_2 endon( "disconnect" );
    var_0 notify( "mark" );
    var_0 endon( "mark" );
    var_0 endon( "unmark" );
    var_3 = ( 0, 0, 60 );
    var_4 = var_2 _meth_81B1();
    var_0._id_32C4 = var_2;

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        var_2 _meth_8420( var_1, 1, 0 );
        var_1.markedformech[var_1.markedformech.size] = var_2;
    }
    else
        var_2 _meth_8420( var_1, 4, 0 );

    thread _id_1E8F( var_0, var_2, var_1 );
    var_0 waittill( "lockedTarget" );
    var_2 _meth_8420( var_1, 0, 0 );
    _id_A0EA( var_0 );

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( level._id_2509 < 3 )
        {
            if ( level._id_62DC && distancesquared( var_1._id_02E6, level._id_250F._id_02E6 ) > 640000 )
                var_2 _meth_8420( var_1, level._id_32B6, 0 );

            var_1.markedformech = _id_A4F0::_id_0CF6( var_1.markedformech, var_2 );
        }
        else
        {
            var_2 _meth_8421( var_1 );
            var_1.markedformech = _id_A4F0::_id_0CF6( var_1.markedformech, var_2 );
        }
    }
    else
        var_2 _meth_8421( var_1 );
}

_id_1E8F( var_0, var_1, var_2 )
{
    var_1 endon( "disconnect" );
    _id_A0F0( var_0 );

    if ( isdefined( level._id_511A ) && level._id_511A && isdefined( var_2 ) )
    {
        if ( level._id_2509 < 3 )
        {
            if ( level._id_62DC && distancesquared( var_2._id_02E6, level._id_250F._id_02E6 ) > 640000 )
                var_1 _meth_8420( var_2, level._id_32B6, 0 );

            var_2.markedformech = _id_A4F0::_id_0CF6( var_2.markedformech, var_1 );
        }
        else
        {
            var_1 _meth_8421( var_2 );
            var_2.markedformech = _id_A4F0::_id_0CF6( var_2.markedformech, var_1 );
        }
    }
    else if ( isdefined( var_2 ) )
        var_1 _meth_8421( var_2 );
}

_id_A0F0( var_0 )
{
    var_0._id_32C4 endon( "death" );
    var_0 _id_A4F0::_id_A060( "death", "mark", "unmark" );
}

_id_A0EA( var_0 )
{
    wait 0.1;

    while ( isdefined( var_0 ) && var_0._id_7591.size > 0 )
        waittillframeend;
}

_id_A0C6( var_0, var_1, var_2 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "death" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_0 endon( "becameSpectator" );

    if ( isdefined( var_1 ) )
        var_1 endon( "death" );

    if ( isdefined( var_2 ) )
        var_2 endon( "death" );

    var_0 waittill( "forever" );
}

_id_27E9( var_0, var_1 )
{
    var_0 endon( "death" );
    waittillframeend;
    waittillframeend;
    playfxontag( var_1, var_0, "tag_origin" );
}

_id_8EE2( var_0, var_1, var_2 )
{
    if ( isdefined( var_0._id_3017 ) )
    {
        stopfxontag( var_1, var_0._id_3017, "tag_origin" );

        if ( isdefined( var_2 ) && var_2 )
            playfx( _id_A4F0::_id_3FA6( "juggernaut_sparks" ), var_0._id_3017._id_02E6 );

        var_0._id_3017 delete();
    }
}

_id_0DFE( var_0, var_1, var_2, var_3 )
{
    var_2 endon( "death" );
    var_2 endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_2 endon( "becameSpectator" );

    if ( isdefined( var_3 ) )
        var_3 endon( "death" );

    var_1 waittill( "death", var_4, var_5, var_6 );

    if ( isdefined( var_4 ) && isplayer( var_4 ) )
    {
        var_7 = level._id_52AA[var_0._id_52AB]._id_8A5F;

        if ( issubstr( var_1._id_0E06, "weakSpot" ) )
            var_7 = level._id_52AA[var_0._id_52AB]._id_8A68;

        _id_A75A::_id_91F3( var_7, var_4 );
    }
}

_id_0DFF( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) )
    {
        if ( isalive( var_1 ) )
            var_1 thread _id_6D21( var_0._id_0E06 );

        if ( isdefined( var_0 ) )
            playfx( _id_A4F0::_id_3FA6( "juggernaut_sparks" ), var_0._id_02E6 );

        if ( isdefined( var_3 ) )
            playfx( _id_A4F0::_id_3FA6( "juggernaut_sparks" ), var_3._id_02E6 );

        var_1 _meth_809A( "sentry_explode" );
    }
}

_id_4871( var_0 )
{
    self _meth_8054();

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 != var_0 )
            self _meth_8007( var_2 );
    }
}

_id_4872( var_0 )
{
    self _meth_8054();

    foreach ( var_2 in level._id_0328 )
    {
        if ( !_id_A4F0::_id_0CE4( var_0, var_2 ) )
            self _meth_8007( var_2 );
    }
}

_id_898C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = undefined;

    if ( issubstr( var_0, "sentry" ) )
        var_6 = spawnturret( "misc_turret", var_2, var_0 );
    else
        var_6 = spawn( "script_model", var_2 );

    var_6 _meth_80B1( var_1 );
    var_6._id_0E06 = var_0;

    if ( isdefined( var_3 ) )
    {
        var_6._id_01E7 = var_3;
        var_6._id_0275 = var_6._id_01E7;
        var_6._id_258D = ::_id_4647;

        if ( isdefined( var_5 ) )
            var_6 thread _id_4648( var_0, var_4, var_5 );

        var_6 _meth_8495( 1 );
    }

    var_6 _id_4871( var_4 );
    var_6._id_02E9 = var_4;

    if ( level._id_91E4 )
        var_6._id_04A8 = var_4._id_04A8;

    return var_6;
}

_id_898D( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = spawn( "script_model", var_0 );
    var_3 _meth_80B1( "tag_origin" );
    var_3 _id_4871( var_1 );
    thread _id_27E9( var_3, _id_A4F0::_id_3FA6( "green_light_mp" ) );
    return var_3;
}

_id_4648( var_0, var_1, var_2 )
{
    if ( var_0 == "weakSpotHead" )
        return;

    level endon( "game_ended" );
    self waittill( "death", var_3, var_4, var_5 );

    if ( !isdefined( var_3 ) || !isplayer( var_3 ) || isdefined( var_1 ) && var_3 == var_1 )
        return;

    level thread _id_A7AA::_id_1208( "heavy_exo_attachment", var_3, undefined, undefined, undefined, var_2 );
}

_id_4647( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( self._id_5603 ) )
        self._id_5603 = 0;

    var_12 = var_2;

    if ( isdefined( var_1 ) && !_id_A7B4::_id_3AA4( self._id_02E9, var_1 ) || var_1 == self._id_02E9 || self._id_5603 == gettime() )
        var_12 = 0;
    else
    {
        if ( isdefined( var_5 ) && var_5 == "boost_slam_mp" && var_2 > 10 )
            var_12 = 10;

        if ( _id_A75A::_id_514D( var_4 ) )
            var_12 += self._id_0275;

        if ( isdefined( var_3 ) && var_3 & level._id_4B59 )
            self._id_A1BC = 1;

        self._id_A1BA = 1;
        self._id_259B = 0.0;

        if ( isplayer( var_1 ) )
        {
            if ( var_1 _id_A75A::_id_05CB( "specialty_armorpiercing" ) )
                var_12 *= level._id_0CD2;

            var_1 _id_A784::_id_9B04( "juggernautAttachment" );
            var_1 notify( "hitHeavyExoAttachment" );
            self._id_024A = var_1;
        }

        if ( isdefined( var_5 ) )
        {
            var_13 = _id_A75A::_id_8F56( var_5, "_lefthand" );

            switch ( var_13 )
            {
                case "remotemissile_projectile_mp":
                case "stinger_mp":
                case "ac130_105mm_mp":
                case "ac130_40mm_mp":
                    self._id_54BD = 1;
                    var_12 = self._id_0275 + 1;
                    break;
                case "artillery_mp":
                case "stealth_bomb_mp":
                    self._id_54BD = 0;
                    var_12 += var_2 * 4;
                    break;
                case "bomb_site_mp":
                case "emp_grenade_mp":
                case "emp_grenade_var_mp":
                case "emp_grenade_killstreak_mp":
                    self._id_54BD = 0;
                    var_12 = self._id_0275 + 1;
                    break;
            }

            _id_A7C3::_id_5399( var_1, var_5, self );
        }
    }

    self._id_5603 = gettime();
    self finishentitydamage( var_0, var_1, var_12, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

_id_7117( var_0 )
{
    return ( randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5 );
}

_id_464F( var_0, var_1 )
{
    for (;;)
    {
        var_2 = _id_A7BB::_id_7017( var_1._id_04A8, &"MP_JOIN_HEAVY_EXO", "heavy_exosuit_coop_offensive", "assist_mp_goliath", "copilot_mp_goliath", var_1 );
        level thread _id_A21B( var_2, var_1, var_0 );
        var_3 = _id_A0E3( var_1, "buddyJoinedStreak" );
        _id_A7BB::_id_8EF9( var_2 );

        if ( !isdefined( var_3 ) )
            return;

        var_3 = _id_A0E3( var_1, "buddyLeftCoopTurret" );

        if ( !isdefined( var_3 ) )
            return;
    }
}

_id_A0E3( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "turretDead" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_0 endon( "becameSpectator" );

    return var_0 _id_A4F0::_id_A068( var_1, var_2, var_3 );
}

_id_A0EF( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1 endon( "disconnect" );
    var_1 endon( "turretDead" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_1 endon( "becameSpectator" );

    for (;;)
    {
        waittillframeend;

        if ( var_0._id_21CA._id_8F6E || var_0._id_21CA._id_2A6A )
            continue;

        return 1;
    }
}

_id_A21B( var_0, var_1, var_2 )
{
    var_1 endon( "disconnect" );
    var_1 endon( "death" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_1 endon( "becameSpectator" );

    var_3 = _id_A7BB::_id_A0C9( var_0 );
    var_1 notify( "buddyJoinedStreak" );
    var_3 thread _id_6D2A( var_2 );
}

_id_6D2A( var_0 )
{
    self endon( "disconnect" );
    var_0._id_21CA endon( "death" );
    var_0._id_8F22 endon( "death" );
    var_0._id_8F22 endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        self endon( "becameSpectator" );
        var_0._id_8F22 endon( "becameSpectator" );
    }

    var_0._id_21CA _meth_8103( undefined );
    var_0._id_21CA _meth_8103( self );
    var_0._id_21CA._id_02E9 = self;
    var_0._id_21CA._id_3017 _id_4872( [ self, var_0._id_8F22 ] );
    self._id_9C1E = 1;
    var_0._id_21CA _id_A7CD::_id_8D41( 180, 180, 55, 30, 1 );
    thread _id_7398( var_0 );
    var_0._id_21CA _id_A7CD::_id_A0E6();
    _id_7397( var_0 );
}

_id_7398( var_0 )
{
    var_0._id_21CA endon( "removeCoopTurretBuddy" );
    self waittill( "disconnect" );
    thread _id_7397( var_0 );
}

_id_7397( var_0 )
{
    if ( !isdefined( var_0._id_21CA._id_7320 ) )
        return;

    var_0._id_21CA notify( "removeCoopTurretBuddy" );
    var_0._id_21CA._id_7320 = undefined;
    var_1 = var_0._id_21CA._id_02E9;

    if ( isdefined( var_1 ) )
    {
        var_1._id_9C1E = undefined;
        var_0._id_21CA _id_A7CD::_id_8F02( 0 );
    }
    else if ( isalive( var_0._id_21CA ) )
    {

    }

    var_1 _meth_8322();

    if ( isdefined( var_0._id_8F22 ) && _id_A75A::_id_5186( var_0._id_8F22 ) )
    {
        if ( isdefined( var_0._id_21CA._id_3017 ) )
            var_0._id_21CA._id_3017 _meth_8054();

        var_0._id_21CA _meth_8103( undefined );
        var_0._id_21CA _meth_8103( var_0._id_8F22 );
        var_0._id_21CA._id_02E9 = var_0._id_8F22;
        var_0._id_8F22 notify( "buddyLeftCoopTurret" );
    }
}

_id_6D52( var_0 )
{
    var_0._id_4AB0 = [];
    thread _id_6D8A( var_0 );
    _id_2423( var_0 );
}

_id_2423( var_0 )
{
    self _meth_82FB( "ui_exo_suit_enabled", 1 );
    thread _id_6D03();
}

_id_6D8A( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    for (;;)
    {
        _id_A4F0::_id_A060( "emp_grenaded", "applyEMPkillstreak", "directHackStarted" );

        foreach ( var_2 in var_0._id_4AB0 )
            var_2._id_0037 = 0;

        for (;;)
        {
            _id_A4F0::_id_A060( "empGrenadeTimedOut", "removeEMPkillstreak", "directHackTimedOut" );
            waittillframeend;

            if ( _id_6D50() )
                break;
        }

        foreach ( var_2 in var_0._id_4AB0 )
        {
            if ( var_2._id_04D8 != "rocketReload" )
            {
                var_2 _meth_8084( 0.5 );
                var_2._id_0037 = 1;
            }
        }
    }
}

_id_6D50()
{
    return !isdefined( self._id_3086 ) || !self._id_3086 || !isdefined( self._id_3089 ) || !self._id_3089;
}

_id_6D21( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "juggernaut_sentry_mp_mp":
            var_1 = "sntryoff_mp_exoai";
            break;
        case "speedAttachment":
            var_1 = "mancoff_mp_exoai";
            break;
        case "punchAttachment":
            var_1 = "longoff_mp_exoai";
            break;
        case "radar":
            var_1 = "rcnoff_mp_exoai";
            break;
        case "rocketAttachment":
            var_1 = "rcktoff_mp_exoai";
            break;
        case "trophy":
            var_1 = "trphyoff_mp_exoai";
            break;
        default:
            var_1 = "weakdmg_mp_exoai";
            break;
    }

    _id_A75A::_id_5652( var_1 );
}

_id_6CD8( var_0 )
{
    var_1 = _id_A7CA::_id_6CAA();

    if ( !isdefined( var_1 ) )
    {
        thread _id_A7CA::_id_6D22( _id_A4F0::_id_3FA6( "ocp_ground_marker_bad" ) );
        self _meth_82FB( "ui_invalid_goliath", 1 );
        return 0;
    }

    thread _id_37D3( var_1, var_0 );
    return 1;
}

droppodmovenearbyallies( var_0 )
{
    if ( !isdefined( self ) || !isdefined( var_0 ) )
        return;

    self._id_9A55 = getnodesinradius( self._id_02E6, 300, 80, 200 );

    foreach ( var_2 in level._id_1C8E )
    {
        if ( !isalive( var_2 ) )
            continue;

        if ( _func_285( var_2, var_0 ) )
        {
            if ( distancesquared( self._id_02E6, var_2._id_02E6 ) < 6000 )
                _id_A747::_id_9A54( var_2, 1 );
        }
    }
}

givebackgoliathstreak( var_0 )
{
    var_1 = _id_A7C3::_id_40F4( "heavy_exosuit" );
    var_2 = _id_A7C3::getnextkillstreakslotindex( "heavy_exosuit", 0 );
    thread _id_A79C::_id_53A6( "heavy_exosuit", var_1, undefined, var_0, var_2 );
    thread _id_A7C3::_id_41EB( "heavy_exosuit", 0, 0, self, var_0 );
}

_id_37D3( var_0, var_1 )
{
    var_2 = _id_A7CA::_id_6CA9( var_0 );
    var_3 = var_0._id_02E6;
    var_4 = magicbullet( "orbital_carepackage_droppod_mp", var_2, var_3, self, 0, 1 );
    var_4._id_04A8 = self._id_04A8;
    var_4._id_534A = spawn( "script_model", ( 0, 0, 0 ) );
    var_4._id_534A _meth_8446( var_4, "tag_origin", ( 0, 0, 200 ), ( 0, 10, 10 ) );
    var_4._id_534A._id_04A7 = "killCamEnt_goliath_droppod";
    var_4._id_534A _meth_834D( "missile" );
    var_4 thread _id_A742::_id_284B();
    var_5 = _id_A78A::_id_403F();
    objective_add( var_5, "invisible", ( 0, 0, 0 ) );
    objective_position( var_5, var_3 );
    objective_state( var_5, "active" );
    var_6 = "compass_waypoint_farp";
    objective_icon( var_5, var_6 );
    var_7 = spawn( "script_model", var_3 + ( 0, 0, 5 ) );
    var_7._id_0041 = ( -90, 0, 0 );
    var_7 _meth_80B1( "tag_origin" );
    var_7 _meth_8054();
    var_7 _meth_8007( self );
    playfxontag( _id_A4F0::_id_3FA6( "jugg_droppod_marker" ), var_7, "tag_origin" );
    _id_A7CA::_id_07DF( var_7 );
    var_8 = 0;

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( self._id_539A == 1 )
        {
            self notify( "used_horde_goliath" );
            var_8 = 1;
            self.hordeclassgoliathpodinfield = 1;
        }

        self.hordegoliathpodinfield = 1;
    }

    var_4 waittill( "death" );

    if ( distancesquared( var_4._id_02E6, var_3 ) > 22500 )
    {
        var_7 delete();
        _id_A75A::_id_0603( var_5 );

        if ( !isdefined( level._id_511A ) || !level._id_511A )
            givebackgoliathstreak( var_1 );
        else
        {
            self [[ level.hordegivebackgoliath ]]( var_8 );
            self.hordeclassgoliathpodinfield = undefined;
            self.hordegoliathpodinfield = undefined;
        }

        return;
    }

    var_3 = getgroundposition( var_4._id_02E6 + ( 0, 0, 8 ), 20 );
    thread destroy_nearby_turrets( var_3 );
    var_7 _meth_8054();
    earthquake( 0.4, 1, var_3, 800 );
    playrumbleonposition( "artillery_rumble", var_3 );
    stopfxontag( _id_A4F0::_id_3FA6( "jugg_droppod_marker" ), var_7, "tag_origin" );
    var_9 = spawn( "script_model", var_3 );
    var_9._id_0041 = ( 0, 0, 0 );
    var_9 _id_23F2( var_3 );
    var_9._id_04A7 = "care_package";
    var_9._id_2F75 = 0;
    var_9._id_24C7 = var_5;
    var_10 = spawn( "script_model", var_3 );
    var_10._id_0041 = ( 90, 0, 0 );
    var_10._id_04A7 = "goliath_pod_model";
    var_10 _meth_80B1( "vehicle_drop_pod" );
    var_10 thread _id_458D( var_9 );

    if ( isdefined( self ) )
        var_9._id_02E9 = self;

    var_9._id_2383 = "juggernaut";
    var_9._id_2F97 = "juggernaut";
    var_9 thread _id_2168();
    var_9 _meth_80DB( &"KILLSTREAKS_HEAVY_EXO_PICKUP" );
    var_9 thread _id_A7B7::_id_237B();
    var_9 thread _id_A7B7::_id_237C();
    var_9 thread _id_9BF8();
    var_11 = spawnstruct();
    var_11._id_9BF6 = var_9;
    var_11._id_6A3B = 1;
    var_11._id_2662 = ::_id_5FA4;
    var_11._id_9403 = ::_id_5FA5;
    var_9 thread _id_A747::_id_45BC( var_11 );
    var_9 thread _id_458E( var_8 );
    var_9 droppodmovenearbyallies( self );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_9 _meth_8057();

    if ( isdefined( level._id_511A ) && level._id_511A )
    {
        if ( level._id_A3D0 || level._id_91E7["allies"] )
            var_9 _id_2851();
        else
            var_9 thread delete_goliath_drop_pod_for_event( self );
    }

    var_12 = var_9 _id_6D83();

    if ( isdefined( level._id_511A ) && level._id_511A && isdefined( self ) )
    {
        if ( isdefined( var_12 ) && var_12 != self )
        {
            if ( var_8 )
            {
                var_12.hordeclassgoliathowner = self;
                self.hordeclassgoliathcontroller = var_12;
            }
            else
            {
                var_12.hordegoliathowner = self;
                self.hordegoliathcontroller = var_12;
            }

            var_12 [[ level.laststandsaveloadoutinfo ]]( 1, 1, 1 );
        }
        else
            self [[ level.laststandsaveloadoutinfo ]]( 1, 1, 1 );

        self.hordeclassgoliathpodinfield = undefined;
        self.hordegoliathpodinfield = undefined;
    }

    if ( isdefined( var_12 ) && isalive( var_12 ) )
    {
        _id_A789::_id_7F7F( var_12, 1 );
        self notify( "entering_juggernaut" );
        var_12.enteringgoliath = 1;
        var_12 _meth_8310();
        var_12 _meth_830E( "iw5_combatknifegoliath_mp", 0, 0, 0, 1 );
        var_12 _meth_8315( "iw5_combatknifegoliath_mp" );
        var_12 _meth_804F();
        var_12 _id_A75A::_id_3A30( 1 );
        var_13 = var_3 - var_12._id_02E6;
        var_14 = vectortoangles( var_13 );
        var_15 = ( 0, var_14[1], 0 );
        var_16 = rotatevector( var_13, ( 45, 0, 0 ) );
        var_17 = spawn( "script_model", var_3 );
        var_17._id_0041 = var_15;
        var_17 _meth_80B1( "npc_exo_armor_ingress" );
        var_17 _meth_827B( "mp_goliath_spawn" );
        var_12 _id_A750::_id_8706( "goliath_pod_burst" );

        if ( isdefined( var_9 ) )
            var_9 _id_2851( 0 );

        playfx( level._id_058F["jugg_droppod_open"], var_3, var_16 );
        wait 0.1;
        var_12 _id_501D( var_17, var_3 );

        if ( isdefined( var_12 ) && isalive( var_12 ) && !( isdefined( level._id_511A ) && level._id_511A && isdefined( var_12._id_51B2 ) && var_12._id_51B2 ) )
        {
            var_12 _meth_8338( var_3, 1 );
            var_12 _meth_833A( var_17._id_0041 );
            var_12 _meth_831E();
            var_12 _id_41EA( "juggernaut_exosuit", var_1 );
            var_17 delete();
            var_12 _meth_8517();

            if ( isdefined( level._id_511A ) && level._id_511A )
                var_12.enteringgoliath = undefined;

            wait 1;
            var_12.enteringgoliath = undefined;
            var_12 _id_A75A::_id_3A30( 0 );

            if ( isdefined( level._id_511A ) && level._id_511A )
                var_12 _meth_83FA( 5, 1 );
        }
        else
            var_17 delete();
    }

    var_7 delete();
}

destroy_nearby_turrets( var_0 )
{
    var_1 = 4096;

    foreach ( var_3 in level._id_0328 )
    {
        if ( isdefined( var_3._id_9938 ) && distancesquared( var_3._id_9938._id_02E6, var_0 ) <= var_1 )
            var_3._id_9938 notify( "death" );
    }
}

is_goliath_drop_pod( var_0 )
{
    return isdefined( var_0._id_2383 ) && var_0._id_2383 == "juggernaut" && isdefined( var_0._id_2F97 ) && var_0._id_2F97 == "juggernaut";
}

_id_5FA4( var_0 )
{
    if ( isdefined( self ) && isdefined( self._id_24C7 ) )
        _id_A75A::_id_0603( self._id_24C7 );

    if ( isdefined( var_0._id_3095 ) )
        var_0._id_3095 delete();

    if ( isdefined( var_0._id_9BF6 ) )
        var_0._id_9BF6 delete();
}

_id_5FA5( var_0 )
{
    return _id_4268( var_0 ) && _id_4269( var_0 ) && _id_426A( var_0 );
}

_id_4268( var_0 )
{
    return !isdefined( self._id_2383 ) || !isdefined( var_0._id_04A7 ) || self._id_2383 != "juggernaut" || var_0._id_04A7 != "care_package";
}

_id_4269( var_0 )
{
    return !isdefined( self._id_2383 ) || !isdefined( var_0._id_2383 ) || self._id_2383 != "juggernaut" || var_0._id_2383 != "juggernaut";
}

_id_426A( var_0 )
{
    return !isdefined( self._id_2383 ) || !isdefined( var_0._id_1B9E ) || self._id_2383 != "juggernaut" || !var_0._id_1B9E;
}

_id_2168()
{
    self endon( "captured" );
    self endon( "death" );
    level endon( "game_ended" );
    self _meth_80BF();

    foreach ( var_1 in level._id_0328 )
        self _meth_800B( var_1 );

    for (;;)
    {
        foreach ( var_1 in level._id_0328 )
        {
            var_4 = 0;

            if ( var_1 _meth_8341() && !var_1 _meth_801A() && !var_1 _meth_83B3() && !var_1 _meth_82E0() && _id_A75A::_id_5186( var_1 ) && var_1 _meth_817C() == "stand" )
            {
                if ( distancesquared( self._id_02E6, var_1._id_02E6 ) < 6000 )
                {
                    if ( var_1 _meth_8215( self._id_02E6 + ( 0, 0, 50 ), 65, 400, 600 ) )
                        var_4 = 1;
                }
            }

            if ( var_4 == 1 )
            {
                self _meth_800A( var_1 );
                continue;
            }

            self _meth_800B( var_1 );
        }

        wait 0.2;
    }
}

_id_501D( var_0, var_1 )
{
    var_2 = anglestoforward( var_0._id_0041 );
    var_1 -= var_2 * 37;
    self _meth_8338( var_1, 0 );
    self _meth_833A( var_0._id_0041 );
    wait 0.05;
    var_0 _meth_827B( "mp_goliath_enter" );
    self _meth_8516();
    wait 2.3;
}

_id_23F2( var_0 )
{
    var_1 = getent( "goliath_collision", "targetname" );

    if ( isdefined( var_1 ) )
        self _meth_8278( var_1 );
}

_id_6D83()
{
    self endon( "death" );
    self waittill( "captured", var_0 );
    var_0 _meth_817D( "stand" );
    var_0 _meth_84B3( 1 );

    if ( isdefined( self._id_02E9 ) && var_0 != self._id_02E9 )
    {
        if ( !level._id_91E4 || var_0._id_04A8 != self._id_02E9._id_04A8 )
            var_0 thread _id_A72E::_id_48A5( self._id_02E9 );
        else if ( !isdefined( level._id_511A ) )
            self._id_02E9 thread _id_A72E::_id_83AF();
    }

    return var_0;
}

_id_9BF8()
{
    self endon( "death" );
    level endon( "game_ended" );

    foreach ( var_1 in level._id_0328 )
    {
        if ( var_1 _id_A75A::_id_512E() )
        {
            self _meth_800B( var_1 );
            thread _id_9C05( var_1 );
        }
    }

    for (;;)
    {
        level waittill( "juggernaut_equipped", var_1 );
        self _meth_800B( var_1 );
        thread _id_9C05( var_1 );
    }
}

_id_9C05( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_0 endon( "becameSpectator" );

    var_0 waittill( "death" );
    self _meth_800A( var_0 );
}

_id_0861( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    thread _id_2DE3( var_2, var_0 );
    setdvar( "scr_adjust_angles", "" + var_4 );
    setdvar( "scr_adjust_origin", "" + var_3 );
    var_5 = ( 0, 0, 0 );
    var_6 = ( 0, 0, 0 );

    for (;;)
    {
        waittillframeend;
        var_7 = getdvarvector( "scr_adjust_angles" );
        var_8 = getdvarvector( "scr_adjust_origin" );

        if ( var_7 == var_5 && var_8 == var_6 )
            continue;

        var_5 = var_7;
        var_6 = var_8;
        var_0 _meth_804F();
        var_0 _meth_804D( var_2, var_1, var_6, var_5 );
    }
}

_id_2DE3( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    var_1 endon( "death" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        var_0 endon( "becameSpectator" );

    for (;;)
    {
        var_2 = var_1._id_02E6;
        var_3 = var_1._id_0041;
        _id_267B( var_2, var_3 );
        waittillframeend;
    }
}

_id_267B( var_0, var_1 )
{
    var_2 = 20;
    var_3 = anglestoforward( var_1 ) * var_2;
    var_4 = anglestoright( var_1 ) * var_2;
    var_5 = anglestoup( var_1 ) * var_2;
}

_id_6D0B()
{
    if ( !isdefined( self._id_5B27 ) )
    {
        self._id_5B27 = spawnstruct();
        self._id_5B27._id_1C58 = spawnstruct();
        self._id_5B27._id_900E = spawnstruct();
        self._id_5B27._id_0383 = spawnstruct();
        self._id_5B27._id_9319 = spawnstruct();
        self._id_5B27._id_8D50 = "none";
        self._id_5B27._id_1C58._id_8D50 = "none";
        self._id_5B27._id_1C58._id_555B = "none";
        self._id_5B27._id_900E._id_8D50 = "none";
        self._id_5B27._id_900E._id_555B = "none";
        self._id_5B27._id_0383._id_8D50 = "none";
        self._id_5B27._id_0383._id_555B = "none";
    }

    _id_7E71();
    self._id_5B27._id_9319._id_932A = [];
    self._id_5B27._id_9319._id_20CD = [];
    self._id_5B27._id_1C58._id_4795 = 0;
    self._id_5B27._id_1C58._id_65F1 = 0;
    self._id_5B27._id_900E._id_931C = 0;
    self._id_5B27._id_900E._id_7261 = 100;
    self._id_5B27._id_0383._id_379B = 0;
    self._id_5B27._id_0383._id_7261 = 100;
}

_id_6D03()
{
    self endon( "disconnect" );
    self endon( "exit_mech" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    _id_6D0B();
    _id_7E71();
    _id_7E6E();
    _id_7E70();
    _id_7E73();
    waittillframeend;

    for (;;)
    {
        _id_8D51();
        _id_8D5B();
        _id_8D5C();
        _id_6D0E( self._id_5B27 );
        wait 0.05;
    }
}

_id_7E71( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "none";

    if ( !isdefined( self._id_5B27 ) )
        return;

    if ( self._id_5B27._id_8D50 == var_0 )
        return;

    self._id_5B27._id_8D50 = var_0;
}

_id_3DD7()
{
    if ( !isdefined( self._id_5B27 ) )
        return;

    return self._id_5B27._id_8D50;
}

get_is_in_mech()
{
    var_0 = self _meth_802D( 0 );

    if ( isdefined( var_0 ) && var_0 == "head_hero_cormack_sentinel_halo" )
        return 1;

    return 0;
}

_id_3D81( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( vectordot( var_4._id_02E6 - self._id_02E6, var_1 ) < 0 )
            continue;

        var_2[var_2.size] = var_4;
    }

    var_2 = sortbydistance( var_2, self._id_02E6 );
    return var_2;
}

_id_6D10( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "exit_mech" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    self _meth_82FB( var_1, 0 );

    for (;;)
    {
        while ( !self call [[ var_0 ]]() )
            wait 0.05;

        self _meth_82FB( var_1, 1 );

        while ( self call [[ var_0 ]]() )
            wait 0.05;

        self _meth_82FB( var_1, 0 );
        wait 0.05;
    }
}

_id_6D0E( var_0 )
{
    var_1 = _id_6CD3();
    var_2 = 0;

    if ( var_1 )
        var_2 = 1;

    if ( self._id_4798._id_473F )
        self _meth_82FB( "ui_playermech_swarmrecharge", var_0._id_900E._id_7261 );

    if ( self._id_4798._id_4733 )
        self _meth_82FB( "ui_playermech_rocketrecharge", var_0._id_0383._id_7261 );
}

_id_6CEC()
{
    if ( self._id_5B27._id_1C58._id_65F1 )
        return 1;

    return 0;
}

_id_6CED()
{
    if ( self._id_5B27._id_0383._id_7261 < 100 )
        return 1;

    return 0;
}

_id_6CEE()
{
    if ( self._id_5B27._id_900E._id_7261 < 100 )
        return 1;

    return 0;
}

_id_6CEF( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "exit_mech" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    var_2 = 0;

    for (;;)
    {
        wait 0.05;

        if ( self call [[ var_0 ]]() )
        {
            if ( !var_2 )
            {
                if ( [[ var_1 ]]() )
                {
                    var_2 = 1;
                    self _meth_82F4( "wpn_mech_offline" );
                    wait 1.5;
                }
            }

            continue;
        }

        var_2 = 0;
    }
}

_id_6CF0()
{
    thread _id_6CEF( ::_meth_833D, ::_id_6CEC );
    thread _id_6CEF( ::_meth_82EE, ::_id_6CED );
    thread _id_6CEF( ::_meth_82EF, ::_id_6CEE );
}

_id_8D58()
{
    switch ( _id_3DD7() )
    {
        case "base_noweap_bootup":
        case "base_swarmonly_nolegs":
        case "base_swarmonly_exit":
        case "base_noweap":
        case "base_swarmonly":
        case "base_transition":
        case "base":
        case "dmg1_transition":
        case "dmg1":
        case "dmg2_transition":
        case "dmg2":
            break;
        case "none":
            _id_6D0B();
            break;
        default:
    }
}

_id_8D51()
{
    var_0 = _id_3DD5();
    var_1 = self _meth_8311();
    self._id_5B27._id_1C58._id_4795 = self _meth_83B9( var_1 );
    self._id_5B27._id_1C58._id_65F1 = self _meth_83BA( var_1 );

    if ( var_0 == "ready" )
    {
        if ( self._id_5B27._id_1C58._id_65F1 )
            _id_7E6E( "overheat" );
        else if ( self _meth_833D() )
            _id_7E6E( "firing" );
    }
    else if ( var_0 == "firing" )
    {
        if ( self._id_5B27._id_1C58._id_65F1 )
            _id_7E6E( "overheat" );
        else if ( !self _meth_833D() )
            _id_7E6E( "ready" );
    }
    else if ( var_0 == "overheat" && !self._id_5B27._id_1C58._id_65F1 )
        _id_7E6E( "ready" );
}

_id_8D5B()
{
    var_0 = _id_3DD6();

    if ( var_0 != "offline" && _id_6CED() )
        _id_7E70( "reload" );
    else if ( var_0 == "reload" && !_id_6CED() )
        _id_7E70( "ready" );
}

_id_8D5C()
{
    var_0 = _id_3DD8();

    if ( !_id_6CD3() && !_id_6CD2() )
        _id_7E73( "target" );
    else if ( var_0 == "target" && _id_6CEE() )
        _id_7E73( "reload" );
    else if ( var_0 == "reload" && !_id_6CEE() )
        _id_7E73( "ready" );
}

_id_7E6E( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "none";

    if ( !isdefined( self._id_5B27._id_1C58._id_8D50 ) )
        self._id_5B27._id_1C58._id_8D50 = "none";

    if ( self._id_5B27._id_1C58._id_8D50 == var_0 )
        return;

    self._id_5B27._id_1C58._id_8D50 = var_0;
    self notify( "chaingun_state_" + var_0 );
}

_id_3DD5()
{
    if ( !isdefined( self._id_5B27 ) )
        return;

    return self._id_5B27._id_1C58._id_8D50;
}

_id_77DE()
{
    if ( isdefined( self._id_5B27._id_1C58._id_555B ) && self._id_5B27._id_1C58._id_8D50 == self._id_5B27._id_1C58._id_555B )
        return 1;

    self._id_5B27._id_1C58._id_555B = self._id_5B27._id_1C58._id_8D50;
    return 0;
}

_id_7E70( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "none";

    if ( !isdefined( self._id_5B27._id_0383._id_8D50 ) )
        self._id_5B27._id_0383._id_8D50 = "none";

    if ( self._id_5B27._id_0383._id_8D50 == var_0 )
        return;

    self._id_5B27._id_0383._id_8D50 = var_0;
}

_id_3DD6()
{
    if ( !isdefined( self._id_5B27 ) )
        return;

    return self._id_5B27._id_0383._id_8D50;
}

_id_77DF()
{
    if ( isdefined( self._id_5B27._id_0383._id_555B ) && self._id_5B27._id_0383._id_8D50 == self._id_5B27._id_0383._id_555B )
        return 1;

    self._id_5B27._id_0383._id_555B = self._id_5B27._id_0383._id_8D50;
    return 0;
}

_id_7E73( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "none";

    if ( !isdefined( self._id_5B27._id_900E._id_8D50 ) )
        self._id_5B27._id_900E._id_8D50 = "none";

    if ( self._id_5B27._id_900E._id_8D50 == var_0 )
        return;

    self._id_5B27._id_900E._id_8D50 = var_0;
}

_id_3DD8()
{
    if ( !isdefined( self._id_5B27 ) )
        return;

    return self._id_5B27._id_900E._id_8D50;
}

_id_77E0()
{
    if ( isdefined( self._id_5B27._id_900E._id_555B ) && self._id_5B27._id_900E._id_8D50 == self._id_5B27._id_900E._id_555B )
        return 1;

    self._id_5B27._id_900E._id_555B = self._id_5B27._id_900E._id_8D50;
    return 0;
}

_id_6CF6( var_0, var_1 )
{
    var_0._id_7261 = 0;
    var_2 = 100.0 / ( var_1 / 0.05 );

    while ( var_0._id_7261 < 100 )
    {
        var_0._id_7261 += var_2;
        wait 0.05;
    }

    var_0._id_7261 = 100;

    while ( isdefined( self._id_9A19 ) )
        wait 0.05;
}

_id_6CF4()
{
    self endon( "disconnect" );
    self endon( "exit_mech" );
    self notify( "stop_rocket_recharge" );
    self endon( "stop_rocket_recharge" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    for (;;)
    {
        self waittill( "mech_rocket_fire" );
        self _meth_831F();
        _id_6CF6( self._id_5B27._id_0383, 10 );
        self _meth_8320();
        wait 0.05;
    }
}

_id_6CF5()
{
    self endon( "disconnect" );
    self endon( "exit_mech" );
    self notify( "stop_swarm_recharge" );
    self endon( "stop_swarm_recharge" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    for (;;)
    {
        self waittill( "mech_swarm_fire" );
        self _meth_84BF();
        _id_6CF6( self._id_5B27._id_900E, 10 );
        self _meth_84C0();
        wait 0.05;
    }
}

_id_6955()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    _id_A4F0::_id_A060( "death", "joined_team", "faux_spawn" );

    if ( isai( self ) )
    {
        _id_A750::_id_8706( "goliath_self_destruct" );
        playfx( _id_A4F0::_id_3FA6( "goliath_self_destruct" ), self._id_02E6, anglestoup( self._id_0041 ) );

        if ( isagent( self ) && isdefined( self._id_4878 ) && self._id_4878 == 1 )
        {
            var_0 = self _meth_842C();

            if ( isdefined( var_0 ) )
                var_0 _meth_8054();
        }
    }
    else if ( !isdefined( self._id_52A5 ) && !isdefined( level._id_511A ) )
    {
        playfxontag( _id_A4F0::_id_3FA6( "goliath_death_fire" ), self._id_0087, "J_NECK" );
        _id_A750::_id_8706( "goliath_death_explosion" );
    }

    self._id_52A5 = undefined;
}

_id_7C6C()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "horde_cancel_goliath" );

    var_0 = 0;

    while ( _id_A75A::_id_512E() )
    {
        if ( self _meth_833C() )
        {
            var_0 += 0.05;

            if ( var_0 > 1.0 )
            {
                _id_A750::_id_8706( "goliath_self_destruct" );
                playfx( _id_A4F0::_id_3FA6( "goliath_self_destruct" ), self._id_02E6, anglestoup( self._id_0041 ) );
                wait 0.05;
                self._id_4878 = 1;
                self._id_52A5 = 1;
                radiusdamage( self._id_02E6 + ( 0, 0, 50 ), 400, 200, 20, self, "MOD_EXPLOSIVE", "killstreak_goliathsd_mp" );

                if ( isdefined( level._id_511A ) && level._id_511A )
                    self thread [[ level.hordehandlejuggdeath ]]();
            }
        }
        else
            var_0 = 0;

        wait 0.05;
    }
}

playermechtimeout()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "lost_juggernaut" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "horde_cancel_goliath" );

    for (;;)
    {
        wait 1;
        self._id_5B1D -= int( self._id_0275 / 100 );

        if ( self._id_5B1D < 0 )
        {
            _id_A750::_id_8706( "goliath_self_destruct" );
            playfx( _id_A4F0::_id_3FA6( "goliath_self_destruct" ), self._id_02E6, anglestoup( self._id_0041 ) );
            self thread [[ level.hordehandlejuggdeath ]]();
        }

        self _meth_82FB( "ui_exo_suit_health", self._id_5B1D / self._id_0275 );
    }
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D3();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        self._id_4878 = 0;
    }
}

_id_2851( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( isdefined( self._id_24C7 ) )
        _id_A75A::_id_0603( self._id_24C7 );

    if ( isdefined( self._id_2F97 ) )
    {
        if ( var_0 )
            playfx( _id_A4F0::_id_3FA6( "ocp_death" ), self._id_02E6 );

        if ( var_1 )
            playsoundatpos( self._id_02E6, "orbital_pkg_self_destruct" );
    }

    self delete();
}

_id_458E( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    wait 120;

    if ( isdefined( level._id_511A ) && level._id_511A && var_0 )
    {
        self._id_02E9.hordeclassgoliathpodinfield = undefined;
        self._id_02E9.hordegoliathpodinfield = undefined;
        self._id_02E9 notify( "startJuggCooldown" );
    }

    _id_2851();
}

delete_goliath_drop_pod_for_event( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    _id_A4F0::_id_A061( level, "zombies_start", level, "EMP_JamTeamallies", var_0, "disconnect" );
    _id_2851();
}

_id_458D( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    var_0 waittill( "death" );
    self delete();
}

_id_6D11()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    for (;;)
    {
        self waittill( "emp_grenaded", var_0 );

        if ( isdefined( var_0 ) && isplayer( var_0 ) )
            var_0 thread _id_1C4B();
    }
}

_id_1C4B()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "becameSpectator" );

    var_0 = 5.0;
    wait(var_0);

    if ( _id_A75A::_id_5186( self ) )
        _id_A7A0::_id_6FF3( "ch_precision_closecall" );
}
