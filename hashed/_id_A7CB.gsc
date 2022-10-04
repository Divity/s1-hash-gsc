// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_6574 = spawnstruct();
    level._id_6574._id_89F2 = undefined;
    level._id_6574._id_8989 = undefined;
    level._id_6574._id_898A = undefined;
    level._id_6574._id_898B = undefined;
    level._id_6574._id_8A00 = undefined;
    level._id_6574._id_89DC = undefined;
    level._id_6574._id_03E3 = undefined;
    level._id_6574._id_99B1 = undefined;
    level._id_6574._id_0252 = undefined;
    level._id_6574._id_0380 = undefined;
    level._id_6574._id_04BD = undefined;
    level._id_6574._id_0089 = undefined;

    if ( isdefined( level._id_6573 ) )
        [[ level._id_6573 ]]();

    level._id_6570 = 40;
    level._id_656E = 123;

    if ( isdefined( level._id_6574._id_03E3 ) )
        level._id_656E = level._id_6574._id_03E3;

    var_0 = getentarray( "minimap_corner", "targetname" );
    var_1 = ( 0, 0, 0 );

    if ( var_0.size )
        var_1 = _id_A7AF::_id_3777( var_0[0]._id_02E6, var_0[1]._id_02E6 );

    if ( isdefined( level._id_6574._id_89F2 ) )
        var_1 = level._id_6574._id_89F2;

    level._id_65AA = spawn( "script_model", var_1 );
    level._id_65AA _meth_80B1( "c130_zoomrig" );
    level._id_65AA._id_0041 = ( 0, 115, 0 );
    level._id_65AA _meth_8054();
    thread _id_7600( level._id_656E );
    level._id_058F["orbitalsupport_cloud"] = loadfx( "vfx/cloud/orbitalsupport_cloud" );
    level._id_058F["orbitalsupport_rocket_explode_player"] = loadfx( "vfx/explosion/rocket_explosion_distant" );
    level._id_058F["orbitalsupport_entry"] = loadfx( "vfx/vehicle/vehicle_osp_enter_clouds_parent" );
    level._id_058F["orbitalsupport_entry_complete"] = loadfx( "vfx/vehicle/vehicle_osp_enter_shock" );
    level._id_058F["vehicle_osp_jet"] = loadfx( "vfx/vehicle/vehicle_osp_jet" );
    level._id_058F["vehicle_osp_jet_lg"] = loadfx( "vfx/vehicle/vehicle_osp_jet_lg" );
    level._id_058F["vehicle_osp_rocket_marker"] = loadfx( "vfx/unique/vfx_marker_killstreak_guide" );
    level._id_058F["vehicle_osp_jet_lg_trl"] = loadfx( "vfx/vehicle/vehicle_osp_jet_lg_trl" );
    level._id_058F["orbitalsupport_entry_flash"] = loadfx( "vfx/vehicle/vehicle_osp_enter_flash" );
    level._id_058F["orbitalsupport_explosion"] = loadfx( "vfx/explosion/vehicle_mil_blimp_explosion" );
    level._id_058F["orbitalsupport_explosion_jet"] = loadfx( "vfx/explosion/vehicle_mil_blimp_explosion_jet" );
    level._id_058F["orbitalsupport_light"] = loadfx( "vfx/lights/vehicle_osp_light" );
    level._id_6801["orbitalsupport_40mm_mp"] = 600;
    level._id_6801["orbitalsupport_40mmbuddy_mp"] = 600;
    level._id_6801["orbitalsupport_105mm_mp"] = 1000;
    level._id_6800["orbitalsupport_40mm_mp"] = 3.0;
    level._id_6800["orbitalsupport_40mmbuddy_mp"] = 3.0;
    level._id_6800["orbitalsupport_105mm_mp"] = 6.0;
    level._id_6572 = 0;
    level thread _id_64BE();
    level._id_5398["orbitalsupport"] = ::_id_98B8;
    level._id_53AC["orbitalsupport_105mm_mp"] = "orbitalsupport";
    level._id_53AC["orbitalsupport_40mm_mp"] = "orbitalsupport";
    level._id_53AC["orbitalsupport_40mmbuddy_mp"] = "orbitalsupport";
    level._id_53AC["orbitalsupport_big_turret_mp"] = "orbitalsupport";
    level._id_53AC["orbitalsupport_missile_mp"] = "orbitalsupport";
    level._id_6567 = 0;
    level._id_6565 = 0;
    game["dialog"]["assist_mp_paladin"] = "ks_paladin_joinreq";
    game["dialog"]["pilot_sup_mp_paladin"] = "pilot_sup_mp_paladin";
    game["dialog"]["pilot_aslt_mp_paladin"] = "pilot_aslt_mp_paladin";
    game["dialog"]["copilot_sup_mp_paladin"] = "copilot_sup_mp_paladin";
    game["dialog"]["copilot_aslt_mp_paladin"] = "copilot_aslt_mp_paladin";
    game["dialog"]["copilot_enemykill_mp_paladin"] = "copilot_enemykill_mp_paladin";
    game["dialog"]["copilot_marked_mp_paladin"] = "copilot_marked_mp_paladin";
}

_id_98B8( var_0, var_1 )
{
    if ( isdefined( level._id_656C ) || level._id_6572 )
    {
        self _meth_826E( &"MP_ORBITALSUPPORT_IN_USE" );
        return 0;
    }

    level._id_6572 = 1;
    thread _id_6C72();
    var_2 = _id_A7C3::_id_4E00( "paladin", 0, undefined, 3.0 );

    if ( var_2 != "success" )
    {
        level._id_6572 = 0;
        return 0;
    }

    _id_A75A::_id_8347( "orbitalsupport" );
    thread _id_7FCC( self, var_1 );
    _id_A744::_id_5838( "orbitalsupport", self._id_02E6 );
    level._id_656B._id_2359 = undefined;
    return 1;
}

_id_6C72()
{
    self endon( "rideKillstreakBlack" );
    self waittill( "joined_team" );
    level._id_6572 = 0;
}

_id_7FCC( var_0, var_1 )
{
    self endon( "orbitalsupport_player_removed" );
    self endon( "disconnect" );
    level._id_656C = var_0;
    var_0 _id_A75A::_id_6D3C();
    var_0 _id_656D();
    level._id_656B._id_4C28 = 0;
    level._id_656B._id_04FE = "paladin";
    level._id_656B thread _id_A783::_id_7F5F( 3000, undefined, ::_id_235F, _id_A7B5::_id_47D3, 1 );
    level._id_656B._id_5D57 = var_1;
    level._id_656B._id_473F = _id_A4F0::_id_0CE4( var_1, "orbitalsupport_rockets" );
    level._id_656B._id_474A = _id_A4F0::_id_0CE4( var_1, "orbitalsupport_turret" );
    level._id_656B._id_21C9 = _id_A4F0::_id_0CE4( var_1, "orbitalsupport_coop_offensive" );
    level._id_656B._id_35AA = _id_A4F0::_id_0CE4( var_1, "orbitalsupport_flares" );
    level._id_656B._id_0B79 = _id_A4F0::_id_0CE4( var_1, "orbitalsupport_ammo" );
    level._id_656B._id_031D = var_0;

    if ( level._id_656B._id_35AA )
        var_2 = 1;
    else
        var_2 = 0;

    level._id_656B._id_4815 = "osp";
    level._id_656B thread _id_A7B5::_id_47BC( var_2 );
    thread _id_A75A::_id_91F3( "used_orbitalsupport", var_0 );
    var_0 _meth_834A();
    var_0 _id_A7B5::_id_6C89();
    var_0 _id_A7C3::_id_6D85();
    var_0 thread _id_A051( 1.0 );
    var_0 thread _id_A006( 1.0 );
    var_0 thread _id_7FCF( 1.25 );
    var_0 thread _id_1FEE();

    if ( getdvarint( "camera_thirdPerson" ) )
        var_0 _id_A75A::_id_802B( 0 );

    var_0 _id_6D69( level._id_6563 );
    var_0._id_218B = "medium";
    var_0._id_7315 = 0;
    var_0._id_7317 = 0;
    var_0._id_7318 = 0;
    var_0._id_7316 = 0;
    var_0._id_5B2A = 8;
    var_0 thread _id_73C6();
    var_0 thread _id_73C3();
    var_0 thread _id_73C8();
    var_0 thread _id_73C5();
    var_0 thread _id_73C7();
    wait 1;
    _id_A79A::_id_A0D4();
    var_0 _id_6D44();
    var_0 _meth_82FB( "ui_osp_weapon", 1 );
    var_0 _meth_82FB( "ui_osp_toggle", 1 );
    var_0 thread _id_A04F( 0.1 );
    var_0 thread _id_704F();
    var_3 = level._id_6570;

    if ( _id_A4F0::_id_0CE4( var_1, "orbitalsupport_time" ) )
        var_3 += 15;

    var_0._id_6568 = gettime() + var_3 * 1000;
    var_0 _meth_82FB( "ui_warbird_countdown", var_0._id_6568 );
    self _meth_82DD( "orbitalsupport_fire", "+attack" );
    self _meth_82DD( "orbitalsupport_fire", "+attack_akimbo_accessible" );
    var_0 thread _id_1C85();
    var_0 thread _id_37CC();
    var_0 thread _id_37DD();
    var_0 thread _id_37E3();
    var_0 thread _id_84F5();
    var_0 thread _id_73C2( var_3 );
    var_0 thread _id_73C4();

    if ( level._id_91E4 )
        level thread _id_464F( var_0 );

    level thread _id_8328();
}

_id_A04F( var_0 )
{
    self endon( "orbitalsupport_player_removed" );
    self endon( "disconnect" );
    wait(var_0);
    _id_A7B5::_id_6C96();
}

_id_A051( var_0 )
{
    self endon( "disconnect" );
    level endon( "orbitalsupport_player_removed" );
    self endon( "orbitalsupport_player_removed" );
    wait(var_0);
    self _meth_80B8();
    var_1 = 9275;

    if ( isdefined( level._id_6574._id_89DC ) )
        var_1 = level._id_6574._id_89DC - level._id_5983[2];

    var_2 = 0.3;
    var_3 = var_1;
    var_4 = 0.3;
    var_5 = var_1 * 0.75;
    var_6 = 20;
    var_7 = 30;
    thread _id_A7B5::_id_92FD( "orbitalsupport_player_removed", var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_A006( var_0 )
{
    self endon( "disconnect" );
    level endon( "orbitalsupport_player_removed" );
    self endon( "orbitalsupport_player_removed" );
    wait(var_0);
    self _meth_851A( 0 );
}

_id_7FCF( var_0 )
{
    self endon( "disconnect" );
    level endon( "orbitalsupport_player_removed" );
    wait(var_0);

    if ( isdefined( level._id_65AB ) )
        self _meth_847A( level._id_65AB, 0 );

    if ( isdefined( level._id_65A9 ) )
        self _meth_83C0( level._id_65A9 );

    _id_A7B5::_id_45F0();
}

_id_73C9( var_0 )
{
    self _meth_847A( "", var_0 );
    self _meth_83C0( "" );
    _id_A7B5::_id_45E2();
}

_id_73C4()
{
    self endon( "orbitalsupport_player_removed" );
    var_0 = 0;

    for (;;)
    {
        if ( self _meth_833C() )
        {
            var_0 += 0.05;

            if ( var_0 > 1.0 )
            {
                if ( isdefined( level._id_6564 ) && level._id_6564._id_5287 == 1 || !isdefined( level._id_6564 ) )
                {
                    level thread _id_73C1( self, 0 );
                    return;
                }
            }
        }
        else
            var_0 = 0;

        wait 0.05;
    }
}

_id_73C7()
{
    self endon( "orbitalsupport_player_removed" );
    level waittill( "game_ended" );
    level thread _id_73C1( self, 0 );
}

_id_73C5()
{
    self endon( "orbitalsupport_player_removed" );
    level._id_656B waittill( "crashing" );
    level thread _id_73C1( self, 0 );
}

_id_73C6()
{
    self endon( "orbitalsupport_player_removed" );
    self waittill( "disconnect" );
    level thread _id_73C1( self, 1 );
}

_id_73C3()
{
    self endon( "orbitalsupport_player_removed" );
    self waittill( "joined_team" );
    level thread _id_73C1( self, 0 );
}

_id_73C8()
{
    self endon( "orbitalsupport_player_removed" );
    _id_A4F0::_id_A060( "joined_spectators", "spawned" );
    level thread _id_73C1( self, 0 );
}

_id_73C2( var_0 )
{
    self endon( "orbitalsupport_player_removed" );

    if ( _id_A75A::_id_05CB( "specialty_blackbox" ) && isdefined( self._id_8A32 ) )
        var_0 *= self._id_8A32;

    _id_A79A::_id_A049( var_0 );

    if ( isdefined( level._id_6564 ) )
        _id_A79A::_id_A049( 7 );

    level thread _id_73C1( self, 0 );
}

_id_73C1( var_0, var_1 )
{
    var_0 notify( "orbitalsupport_player_removed" );
    level notify( "orbitalsupport_player_removed" );
    waitframe;
    level._id_656B._id_031D = undefined;

    if ( isdefined( level._id_6564 ) )
        level._id_6564 thread _id_73BC( 0 );

    if ( !var_1 )
    {
        var_0 _id_6D33();
        var_0 _meth_849C( "orbitalsupport_fire", "+attack" );
        var_0 _meth_849C( "orbitalsupport_fire", "+attack_akimbo_accessible" );

        if ( !isbot( var_0 ) && ( level._id_656B._id_473F || level._id_656B._id_474A ) )
            var_0 _meth_849C( "switch_orbitalsupport_turret", "weapnext" );

        var_0 _meth_80E9( level._id_6563 );
        level._id_6563 _meth_8054();
        var_0 _meth_804F();
        var_2 = _id_A75A::_id_3FF7( "orbitalsupport" );
        var_0 _meth_830F( var_2 );

        if ( var_0 _id_A75A::_id_51E0() )
            var_0 _id_A75A::_id_1F0D();

        _id_A7B5::_id_2B1E( var_0 );
        var_0 _meth_851A( 1 );
        var_0 _meth_80B9();
        var_0 _meth_82D9( 0, 0 );
        var_0 _id_73C9( 1.5 );
        var_0 _meth_834B();

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 _id_A75A::_id_802B( 1 );

        if ( isdefined( var_0._id_25F3 ) )
            var_0._id_25F3 _meth_8088();

        var_0._id_7315 = undefined;
        var_0._id_7317 = undefined;
        var_0._id_7318 = undefined;
        var_0._id_7316 = undefined;
        var_0 _id_A75A::_id_6D35();
    }

    if ( isdefined( level._id_656B._id_2359 ) )
    {
        level._id_656C = undefined;
        return;
    }

    level._id_656C = undefined;
    level._id_656B _meth_80AB();
    level._id_656B _meth_809A( "paladin_orbit_return" );
    level._id_656B _id_6571();
}

_id_1E8E()
{
    level._id_656B _meth_80AB();

    if ( isdefined( level._id_656F ) )
    {
        stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_rocket_marker" ), level._id_656F, "tag_origin" );
        level._id_656F delete();
    }

    level._id_6566 turretdeletesoundent();
    level._id_6566 delete();

    if ( isdefined( level._id_656B._id_366B ) )
    {
        level._id_656B._id_366B _meth_80AB();
        level._id_656B._id_366B delete();
    }

    if ( isdefined( level._id_656B._id_1FDC ) )
    {
        level._id_656B._id_1FDC _meth_80AB();
        level._id_656B._id_1FDC delete();
    }

    if ( isdefined( level._id_656B._id_5C73 ) )
        level._id_656B._id_5C73 delete();
}

_id_656D()
{
    var_0 = getentarray( "minimap_corner", "targetname" );
    var_1 = ( 0, 0, 0 );

    if ( var_0.size )
    {
        var_1 = _id_A7AF::_id_3777( var_0[0]._id_02E6, var_0[1]._id_02E6 );
        var_1 = ( var_1[0], var_1[1], 0 );
    }

    if ( isdefined( level._id_6574._id_89F2 ) )
    {
        var_1 = level._id_6574._id_89F2;
        var_1 = ( var_1[0], var_1[1], 0 );
    }

    level._id_656B = spawn( "script_model", var_1 );
    level._id_656B._id_0041 = ( 0, 0, 0 );
    level._id_656B _meth_80B1( "vehicle_mil_blimp_orbital_platform_ai" );
    level._id_656B._id_02E9 = self;
    level._id_656B _id_A4F0::_id_5920( self._id_04A8 );
    level._id_656B._id_5C73 = spawnplane( self, "script_model", var_1, "compass_objpoint_ac130_friendly", "compass_objpoint_ac130_enemy" );
    level._id_656B._id_5C73 _meth_80B1( "tag_origin" );
    level._id_656B._id_5C73 _meth_8446( level._id_656B, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    level._id_656B _meth_82C0( 1 );
    level._id_656B _meth_82C1( 1 );
    level._id_656B._id_0275 = 2000;
    level._id_656B._id_01E7 = level._id_656B._id_0275;
    level._id_656B._id_852D = 0;
    level._id_656B _id_7FF3();
    level._id_6563 = _id_89F1( "orbitalsupport_big_turret_mp", "orbitalsupport_big_turret", "tag_orbitalsupport_biggun", 0 );
    level._id_6566 = _id_89F1( "orbitalsupport_buddy_turret_mp", "orbitalsupport_small_turret", "tag_orbitalsupport_mediumgun2", 1 );
    level._id_656B thread _id_5F5E();
}

_id_89F1( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnturret( "misc_turret", level._id_656B _meth_8180( var_2 ), var_0, 0 );
    var_4._id_0041 = level._id_656B _meth_8181( var_2 );
    var_4 _meth_80B1( var_1 );
    var_4 _meth_815A( 45 );
    var_4 _meth_804D( level._id_656B, var_2, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_4._id_02E9 = undefined;
    var_4._id_01E7 = 99999;
    var_4._id_0275 = 1000;
    var_4._id_0102 = 0;
    var_4._id_8F6E = 0;
    var_4._id_8F70 = 0.0;
    var_4 _meth_82C0( 0 );
    var_4 _meth_82C1( 0 );
    var_4 _meth_815C();

    if ( var_3 )
        var_4 thread turretspawnsoundent( var_2 );

    return var_4;
}

turretspawnsoundent( var_0 )
{
    waittillframeend;
    self.soundent = spawn( "script_model", self._id_02E6 );
    self.soundent _meth_80B1( "tag_origin" );
    self.soundent _meth_804D( level._id_656B, var_0, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

_id_704F()
{
    level endon( "orbitalsupport_player_removed" );
    self endon( "orbitalsupport_player_removed" );
    self endon( "switch_orbitalsupport_turret" );
    self _meth_82FB( "ui_osp_reload_bitfield", 0 );
    var_0 = 1;
    var_1 = 2;
    var_2 = 4;

    for (;;)
    {
        var_3 = 0;

        if ( self._id_7315 )
            var_3 += var_0;

        if ( self._id_7317 || self._id_7316 )
            var_3 += var_1;

        if ( self._id_7318 )
            var_3 += var_2;

        self _meth_82FB( "ui_osp_reload_bitfield", var_3 );
        wait 0.05;
    }
}

_id_1C85()
{
    self endon( "orbitalsupport_player_removed" );

    if ( isbot( self ) )
        return;

    var_0 = level._id_656B._id_473F;
    var_1 = level._id_656B._id_474A;

    if ( !var_0 && !var_1 )
        return;

    self _meth_82DD( "switch_orbitalsupport_turret", "weapnext" );
    wait 0.05;
    self _meth_82FB( "ui_osp_weapon", 1 );

    for (;;)
    {
        self waittill( "switch_orbitalsupport_turret" );

        if ( self._id_218B == "medium" )
        {
            if ( var_0 )
                _id_6D68();
            else
                _id_6D66();
        }
        else if ( self._id_218B == "rocket" )
        {
            if ( var_1 )
                _id_6D66();
            else
                _id_6D67();
        }
        else if ( self._id_218B == "big" )
            _id_6D67();

        self _meth_82F4( "paladin_weapon_cycle_plr" );
    }
}

_id_6D44()
{
    var_0 = level._id_656B._id_473F;
    var_1 = level._id_656B._id_474A;
    var_2 = 1;

    if ( var_1 )
        var_2 += 2;

    if ( var_0 )
        var_2 += 4;

    self _meth_82FB( "ui_osp_avail_weapons", var_2 );
}

_id_6D69( var_0 )
{
    self _meth_804F();
    level thread _id_4689( var_0 );
    var_1 = 25;
    var_2 = 25;
    var_3 = -25;
    var_4 = 60;

    if ( isdefined( level._id_6574._id_0380 ) )
        var_1 = level._id_6574._id_0380;

    if ( isdefined( level._id_6574._id_0252 ) )
        var_2 = level._id_6574._id_0252;

    if ( isdefined( level._id_6574._id_04BD ) )
        var_3 = level._id_6574._id_04BD;

    if ( isdefined( level._id_6574._id_0089 ) )
        var_4 = level._id_6574._id_0089;

    self _meth_807E( var_0, "tag_player", 0, var_1, var_2, var_3, var_4, 1 );
    self _meth_80A1( 1 );
    var_5 = 45;

    if ( isdefined( level._id_6574._id_99B1 ) )
        var_5 = level._id_6574._id_99B1;

    self _meth_80E8( var_0, var_5 );
}

_id_4689( var_0 )
{
    var_0 endon( "death" );
    var_0 notify( "startHandleSoundEnt" );
    var_0 endon( "startHandleSoundEnt" );

    if ( isdefined( var_0.soundent ) )
        var_0.soundent _meth_8054();

    foreach ( var_2 in level._id_0328 )
    {
        if ( isdefined( var_0._id_02E9 ) && var_0._id_02E9 != var_2 )
        {
            if ( isdefined( var_0.soundent ) )
                var_0.soundent _meth_8007( var_2 );
        }
    }

    for (;;)
    {
        level waittill( "connected", var_2 );

        if ( isdefined( var_0.soundent ) )
            var_0.soundent _meth_8007( var_2 );
    }
}

_id_6D66()
{
    self._id_218B = "big";
    self _meth_82FB( "ui_osp_weapon", 0 );
    thread _id_704F();

    if ( isdefined( level._id_656F ) )
        stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_rocket_marker" ), level._id_656F, "tag_origin" );
}

_id_6D68()
{
    self._id_218B = "rocket";
    self _meth_82FB( "ui_osp_weapon", 3 );
    thread _id_704F();

    if ( isdefined( level._id_656F ) )
        playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_rocket_marker" ), level._id_656F, "tag_origin" );
}

_id_6D67()
{
    self._id_218B = "medium";
    self _meth_82FB( "ui_osp_weapon", 1 );
    thread _id_704F();

    if ( isdefined( level._id_656F ) )
        stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_rocket_marker" ), level._id_656F, "tag_origin" );
}

_id_6CAC( var_0 )
{
    if ( !isdefined( var_0 ) || !var_0 )
        return level._id_6563 _meth_8180( "tag_player" ) + anglestoforward( level._id_6563 _meth_8181( "tag_player" ) ) * 20000;
    else
        return level._id_6566 _meth_8180( "tag_player" ) + anglestoforward( level._id_6566 _meth_8181( "tag_player" ) ) * 20000;
}

_id_37CC()
{
    self endon( "orbitalsupport_player_removed" );

    if ( !level._id_656B._id_0B79 )
        var_0 = 6;
    else
        var_0 = 4;

    while ( !isdefined( level._id_656B.paladinflying ) )
        waittillframeend;

    for (;;)
    {
        self._id_7315 = 0;
        self waittill( "orbitalsupport_fire" );

        if ( isdefined( level._id_4A36 ) )
            continue;

        if ( self._id_218B == "big" )
        {
            var_1 = _id_6CAC();
            var_2 = level._id_6563 _meth_8180( "tag_missile1" );
            var_3 = magicbullet( "orbitalsupport_105mm_mp", var_2, var_1, self, 1 );
            var_3._id_9CBC = level._id_656B;
            level._id_656B _meth_809A( "paladin_cannon_snap" );
            var_3 _meth_809A( "orbitalsupport_105mm_proj_travel" );
            self _meth_80AD( "ac130_105mm_fire" );
            self _meth_82F4( "paladin_cannon_reload" );
            earthquake( 0.3, 1, level._id_656B._id_02E6, 1000, self );
            self._id_7315 = 1;
            wait(var_0);
        }
    }
}

_id_37DD()
{
    self endon( "orbitalsupport_player_removed" );

    while ( !isdefined( level._id_656B.paladinflying ) )
        waittillframeend;

    for (;;)
    {
        self._id_7317 = 0;

        if ( !level._id_656B._id_0B79 )
            var_0 = 3;
        else
            var_0 = 2;

        if ( self._id_218B == "medium" && self _meth_833D() && !isdefined( level._id_4A36 ) )
        {
            var_1 = level._id_6563 _meth_8180( "tag_missile1" );
            var_2 = _id_6CAC();
            level._id_656B _meth_809A( "paladin_mgun_burst_plr" );
            var_3 = magicbullet( "orbitalsupport_40mm_mp", var_1, var_2, self, 1 );
            var_3._id_9CBC = level._id_656B;
            var_4 = bullettrace( var_1, var_2, 0 );
            wait 0.05;
            earthquake( 0.1, 0.5, level._id_656B._id_02E6, 1000, self );
            _id_37DE( var_4["position"], "orbitalsupport_40mm_mp" );
            _id_37DE( var_4["position"], "orbitalsupport_40mm_mp" );
            _id_37DE( var_4["position"], "orbitalsupport_40mm_mp" );
            self._id_5B2A--;

            if ( self._id_5B2A <= 0 )
            {
                self._id_7317 = 1;
                wait(var_0);
                self._id_5B2A = 8;
            }
        }

        wait 0.05;
    }
}

_id_37CE()
{
    self endon( "orbitalsupport_player_removed" );

    for (;;)
    {
        self waittill( "orbitalsupport_fire" );
        _id_A7B5::_id_6C9D( level._id_6566.soundent );
        wait 2;
    }
}

_id_37CD()
{
    self endon( "orbitalsupport_player_removed" );
    var_0 = 6;
    self._id_7316 = 0;
    self._id_218B = "buddy";
    thread _id_704F();

    for (;;)
    {
        self._id_7316 = 0;

        if ( !level._id_656B._id_0B79 )
            var_1 = 5;
        else
            var_1 = 3;

        if ( self _meth_833D() )
        {
            var_2 = level._id_6566 _meth_8180( "tag_missile1" );
            var_3 = _id_6CAC( 1 );
            level._id_656B _meth_809A( "paladin_mgun_burst_plr" );
            var_4 = magicbullet( "orbitalsupport_40mmbuddy_mp", var_2, var_3, self );
            var_4._id_9CBC = level._id_656B;
            var_5 = bullettrace( var_2, var_3, 0 );
            waittillframeend;
            earthquake( 0.1, 0.5, level._id_656B._id_02E6, 1000, self );
            _id_37DE( var_5["position"], "orbitalsupport_40mmbuddy_mp" );
            _id_37DE( var_5["position"], "orbitalsupport_40mmbuddy_mp" );
            _id_37DE( var_5["position"], "orbitalsupport_40mmbuddy_mp" );
            var_0--;

            if ( var_0 <= 0 )
            {
                self._id_7316 = 1;
                wait(var_1);
                var_0 = 6;
            }
        }

        wait 0.05;
    }
}

_id_37DE( var_0, var_1 )
{
    var_2 = level._id_656B _meth_8180( "tag_orbitalsupport_mediumgun1" );
    var_3 = randomfloat( 400 ) - 200;
    var_4 = randomfloat( 400 ) - 200;
    var_5 = magicbullet( var_1, var_2, ( var_0[0] + var_3, var_0[1] + var_4, var_0[2] ), self, 1 );
    var_5._id_9CBC = level._id_656B;
    self _meth_80AD( "ac130_25mm_fire" );
    wait 0.05;
    var_2 = level._id_656B _meth_8180( "tag_orbitalsupport_mediumgun0" );
    var_3 = randomfloat( 400 ) - 200;
    var_4 = randomfloat( 400 ) - 200;
    var_5 = magicbullet( var_1, var_2, ( var_0[0] + var_3, var_0[1] + var_4, var_0[2] ), self, 1 );
    var_5._id_9CBC = level._id_656B;
    self _meth_80AD( "ac130_25mm_fire" );
    wait 0.05;
    var_2 = level._id_656B _meth_8180( "tag_orbitalsupport_mediumgun3" );
    var_3 = randomfloat( 400 ) - 200;
    var_4 = randomfloat( 400 ) - 200;
    var_5 = magicbullet( var_1, var_2, ( var_0[0] + var_3, var_0[1] + var_4, var_0[2] ), self, 1 );
    var_5._id_9CBC = level._id_656B;
    self _meth_80AD( "ac130_25mm_fire" );
    wait 0.05;
}

_id_7117( var_0 )
{
    return ( randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5 );
}

_id_37E3()
{
    self endon( "orbitalsupport_player_removed" );
    var_0 = 3;
    var_1 = var_0;
    self _meth_82FB( "ui_osp_rockets", var_1 );

    if ( !level._id_656B._id_0B79 )
        var_2 = 6;
    else
        var_2 = 4;

    thread _id_9B62();

    while ( !isdefined( level._id_656B.paladinflying ) )
        waittillframeend;

    for (;;)
    {
        self._id_7318 = 0;

        if ( self._id_218B == "rocket" && self _meth_833D() && !isdefined( level._id_4A36 ) )
        {
            earthquake( 0.3, 1, level._id_656B._id_02E6, 1000, self );
            var_3 = level._id_6563 _meth_8180( "tag_missile1" );
            var_4 = vectornormalize( anglestoforward( self _meth_833B() ) );
            var_5 = vectornormalize( anglestoforward( level._id_656B _meth_8181( "tag_origin" ) ) );

            for ( var_6 = 0; var_6 < 3; var_6++ )
            {
                var_7 = var_4 + ( 0, 0, 0.4 ) + _id_7117( 1 );
                var_8 = magicbullet( "orbitalsupport_missile_mp", var_3, var_3 + var_7, self );
                var_8._id_9CBC = level._id_656B;
                self _meth_82F4( "paladin_missile_shot_2d" );
                self _meth_80AD( "ac130_40mm_fire" );
                var_8 _meth_81D9( level._id_656F );
                var_8 _meth_81DC();
                wait 0.1;
            }

            var_1--;
            self _meth_82FB( "ui_osp_rockets", var_1 );

            if ( var_1 == 0 )
            {
                self._id_7318 = 1;
                thread _id_7590( var_2 );
                wait(var_2);
                var_1 = var_0;
                self _meth_82FB( "ui_osp_rockets", var_1 );
                self notify( "rocketReloadComplete" );
                continue;
            }
            else
                wait 1.3;
        }

        waittillframeend;
    }
}

_id_9B62()
{
    self endon( "orbitalsupport_player_removed" );
    level._id_656F = spawn( "script_model", ( 0, 0, 0 ) );
    level._id_656F _meth_80B1( "tag_origin" );
    level._id_6563 _meth_8508( level._id_656F );

    for (;;)
    {
        var_0 = level._id_6563 _meth_8180( "tag_player" );
        var_1 = level._id_6563 _meth_8180( "tag_player" ) + anglestoforward( level._id_6563 _meth_8181( "tag_player" ) ) * 20000;
        var_2 = bullettrace( var_0, var_1, 0, level._id_6563 );
        var_3 = var_2["position"];
        level._id_656F._id_02E6 = var_3;
        waittillframeend;
    }
}

_id_7590( var_0 )
{
    self endon( "rocketReloadComplete" );
    self endon( "orbitalsupport_player_removed" );
    var_1 = 3;
    self _meth_82F4( "warbird_missile_reload_bed" );
    wait 0.5;

    for (;;)
    {
        self _meth_82F4( "warbird_missile_reload" );
        wait(var_0 / var_1);
    }
}

_id_84F5()
{
    level._id_656B endon( "death" );

    while ( !isdefined( level._id_656B.paladinflying ) )
        waittillframeend;

    level._id_656B._id_852D = 1;
    level._id_656B thread _id_A7C3::_id_9AE8();
    level._id_656B _id_A4F0::_id_A07E( "crashing", "leaving" );
    level._id_656B._id_852D = 0;
    level._id_656B thread _id_A7C3::_id_9AE8();
}

_id_1FEE()
{
    self endon( "orbitalsupport_player_removed" );
    wait 6;
    _id_1FEF();

    for (;;)
    {
        wait(randomfloatrange( 40, 80 ));
        _id_1FEF();
    }
}

_id_1FEF()
{
    if ( isdefined( level._id_6D90 ) && issubstr( tolower( level._id_6D90 ), "25" ) )
        return;

    playfxontagforclients( level._id_058F["orbitalsupport_cloud"], level._id_656B, "tag_player", level._id_656C );
}

_id_235F( var_0, var_1, var_2, var_3 )
{
    level._id_656B notify( "crashing" );
    level._id_656B._id_2359 = 1;
    level._id_656B _id_A783::_id_64B3( var_0, var_1, var_2, var_3, "paladin_destroyed", undefined, "callout_destroyed_orbitalsupport", 1 );
    thread _id_235C();
    level._id_656B _meth_80AC();
    playsoundatpos( level._id_656B._id_02E6, "paladin_ground_death" );
    waittillframeend;
    _id_1E8E();
    level._id_656B delete();
    level._id_6572 = 0;
}

_id_235C()
{
    var_0 = _id_4063( "TAG_FX_ENGINE_B" );
    var_1 = _id_4063( "tag_origin" );
    var_2 = _id_4063( "tag_light_belly" );
    var_3 = _id_4063( "TAG_FX_ENGINE_L_1" );
    var_4 = _id_4063( "TAG_FX_ENGINE_L_2" );
    var_5 = _id_4063( "TAG_FX_ENGINE_R_1" );
    var_6 = _id_4063( "TAG_FX_ENGINE_R_2" );
    playfx( _id_A4F0::_id_3FA6( "orbitalsupport_explosion" ), var_1._id_02E6, var_2._id_2A67 );
    playfx( _id_A4F0::_id_3FA6( "orbitalsupport_explosion_jet" ), var_3._id_02E6, var_3._id_2A67 );
    playfx( _id_A4F0::_id_3FA6( "orbitalsupport_explosion_jet" ), var_4._id_02E6, var_4._id_2A67 );
    wait 0.05;
    playfx( _id_A4F0::_id_3FA6( "orbitalsupport_explosion_jet" ), var_5._id_02E6, var_5._id_2A67 );
    playfx( _id_A4F0::_id_3FA6( "orbitalsupport_explosion_jet" ), var_6._id_02E6, var_6._id_2A67 );
}

_id_4063( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_02E6 = level._id_656B _meth_8180( var_0 );
    var_1._id_2A67 = anglestoforward( level._id_656B _meth_8181( var_0 ) );
    return var_1;
}

_id_464F( var_0 )
{
    var_1 = "orbitalsupport_coop_defensive";
    var_2 = &"MP_JOIN_ORBITALSUPPORT_DEF";
    var_3 = "pilot_sup_mp_paladin";
    var_4 = "copilot_sup_mp_paladin";

    if ( level._id_656B._id_21C9 )
    {
        var_1 = "orbitalsupport_coop_offensive";
        var_2 = &"MP_JOIN_ORBITALSUPPORT_OFF";
        var_3 = "pilot_aslt_mp_paladin";
        var_4 = "copilot_aslt_mp_paladin";
    }

    for (;;)
    {
        var_5 = _id_A7BB::_id_7017( var_0._id_04A8, var_2, var_1, "assist_mp_paladin", var_3, var_0, var_4 );
        level thread _id_A21B( var_5, var_0 );
        var_6 = _id_A0E3( "orbitalsupport_buddy_added" );
        _id_A7BB::_id_8EF9( var_5 );

        if ( !isdefined( var_6 ) )
            return;

        var_6 = _id_A0E3( "orbitalsupport_buddy_removed" );

        if ( !isdefined( var_6 ) )
            return;

        waitframe;
    }
}

_id_A0E3( var_0 )
{
    level endon( "orbitalsupport_player_removed" );
    level waittill( var_0 );
    return 1;
}

_id_A21B( var_0, var_1 )
{
    level endon( "orbitalsupport_player_removed" );
    var_2 = _id_A7BB::_id_A0C9( var_0 );
    var_2 thread _id_7FCB( var_1 );
}

_id_64BE()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_6569 = 0;
    }
}

_id_7FCB( var_0 )
{
    self endon( "orbitalsupport_player_removed" );
    level._id_6564 = self;
    level._id_6564._id_5287 = 0;
    level._id_6565 = 0;
    level notify( "orbitalsupport_buddy_added" );
    var_0 _id_A75A::_id_6D3C();
    _id_8310();
    level thread _id_A75A::_id_91F3( "joined_orbitalsupport", self );

    if ( getdvarint( "camera_thirdPerson" ) )
        _id_A75A::_id_802B( 0 );

    thread _id_6C91();
    self waittill( "initRideKillstreak_complete", var_1 );

    if ( !var_1 )
        return;

    _id_A75A::_id_8347( "orbitalsupport" );
    self _meth_834A();
    _id_A7B5::_id_6C89();
    _id_6D69( level._id_6566 );
    thread _id_A04F( 0.1 );
    thread _id_A051( 1.0 );
    thread _id_A006( 1.0 );
    thread _id_7FCF( 1.25 );
    thread _id_1FEE();
    self._id_7315 = 0;
    self._id_7317 = 0;
    self._id_7318 = 0;
    self._id_7316 = 0;

    if ( isdefined( level._id_656B ) && level._id_656B._id_21C9 )
    {
        self _meth_82FB( "ui_osp_avail_weapons", 1 );
        self _meth_82FB( "ui_osp_weapon", 1 );
        thread _id_37CD();
    }
    else
    {
        self _meth_82DD( "orbitalsupport_fire", "+attack" );
        self _meth_82DD( "orbitalsupport_fire", "+attack_akimbo_accessible" );
        self _meth_82FB( "ui_osp_weapon", 4 );
        thread _id_37CE();
    }

    thread _id_73BF();
    thread _id_73BD();
    thread _id_73C0();

    if ( !isbot( self ) )
        thread _id_73BE();

    wait 0.5;
    level._id_6564._id_5287 = 1;
    self _meth_82FB( "ui_osp_toggle", 2 );
    self _meth_82FB( "ui_warbird_countdown", var_0._id_6568 );
    var_2 = var_0 _meth_81B1();
    self _meth_82FB( "ui_coop_primary_num", var_2 );
}

_id_6C91()
{
    var_0 = _id_A7C3::_id_4E00( "coop" );

    if ( var_0 != "success" )
    {
        _id_73BC( var_0 == "disconnect" );
        self notify( "initRideKillstreak_complete", 0 );
        return;
    }

    self notify( "initRideKillstreak_complete", 1 );
}

_id_73BC( var_0 )
{
    self notify( "orbitalsupport_player_removed" );
    level notify( "orbitalsupport_buddy_removed" );

    if ( !var_0 )
    {
        _id_6D33();
        thread _id_73C9( 0.5 );
        _id_A75A::_id_74F7( 0 );
        self _meth_849C( "ExitButtonDown", "+activate" );
        self _meth_849C( "ExitButtonUp", "-activate" );
        self _meth_849C( "ExitButtonDown", "+usereload" );
        self _meth_849C( "ExitButtonUp", "-usereload" );

        if ( !isdefined( level._id_656B ) || !level._id_656B._id_21C9 )
        {
            self _meth_849C( "orbitalsupport_fire", "+attack" );
            self _meth_849C( "orbitalsupport_fire", "+attack_akimbo_accessible" );
        }

        self _meth_80E9( level._id_6566 );
        self _meth_804F();
        level._id_6566 _meth_8054();
        _id_A7B5::_id_2B1E( self );
        self _meth_851A( 1 );
        self _meth_80B9();
        self _meth_82D9( 0, 0 );
        _id_A7B5::_id_45E2();
        self _meth_834B();

        if ( getdvarint( "camera_thirdPerson" ) )
            _id_A75A::_id_802B( 1 );

        if ( isdefined( self._id_25F3 ) )
            self._id_25F3 _meth_8088();

        if ( _id_A75A::_id_51E0() )
            _id_A75A::_id_1F0D();

        self._id_7315 = undefined;
        self._id_7317 = undefined;
        self._id_7318 = undefined;
        self._id_7316 = undefined;
        _id_A75A::_id_6D35();
        _id_A7BB::_id_6D2F();
        _id_A75A::_id_6D2C();
    }

    level._id_6564 = undefined;
    _id_8310();
}

_id_73BF()
{
    self endon( "orbitalsupport_player_removed" );
    self waittill( "disconnect" );
    thread _id_73BC( 1 );
}

_id_73BD()
{
    self endon( "orbitalsupport_player_removed" );
    self waittill( "joined_team" );
    thread _id_73BC( 0 );
}

_id_73C0()
{
    self endon( "orbitalsupport_player_removed" );
    _id_A4F0::_id_A060( "joined_spectators", "spawned" );
    thread _id_73BC( 0 );
}

_id_73BE()
{
    self endon( "orbitalsupport_player_removed" );
    self _meth_82DD( "ExitButtonDown", "+activate" );
    self _meth_82DD( "ExitButtonUp", "-activate" );
    self _meth_82DD( "ExitButtonDown", "+usereload" );
    self _meth_82DD( "ExitButtonUp", "-usereload" );

    for (;;)
    {
        self waittill( "ExitButtonDown" );
        thread _id_8D2E();
        thread _id_1ABC();
    }
}

_id_8D2E()
{
    self endon( "orbitalsupport_player_removed" );
    self endon( "ExitButtonUp" );
    self._id_65A8 = 1;
    wait 0.5;

    if ( self._id_65A8 == 1 )
        thread _id_73BC( 0 );
}

_id_1ABC()
{
    self endon( "orbitalsupport_player_removed" );
    self waittill( "ExitButtonUp" );
    self._id_65A8 = 0;
}

_id_7FF3()
{
    var_0 = level._id_5983[2] + 9275;
    var_1 = 8000;
    var_2 = ( 0, randomint( 360 ), 0 );

    if ( isdefined( level._id_6574._id_8989 ) )
        var_2 = ( 0, level._id_6574._id_8989, 0 );
    else if ( isdefined( level._id_6574._id_898B ) && isdefined( level._id_6574._id_898A ) )
        var_2 = ( 0, randomintrange( level._id_6574._id_898B, level._id_6574._id_898A ), 0 );

    if ( isdefined( level._id_6574._id_8A00 ) )
        var_1 = level._id_6574._id_8A00;

    if ( isdefined( level._id_6574._id_89DC ) )
        var_0 = level._id_6574._id_89DC;

    level._id_656B._id_0041 = var_2;
    level._id_656B._id_02E6 -= vectornormalize( -1 * anglestoright( level._id_656B _meth_8181( "tag_origin" ) ) ) * var_1;
    level._id_656B._id_02E6 += ( 0, 0, var_0 );
    level._id_656B._id_28BC = spawnstruct();
    level._id_656B._id_28BC._id_02E6 = level._id_656B._id_02E6;
    level._id_656B._id_28BC._id_0041 = level._id_656B._id_0041;
    level._id_656B._id_02E6 += ( 0, 0, 65000 );
}

_id_5F5E( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    level endon( "game_ended" );
    level endon( "orbitalsupport_player_removed" );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    thread _id_7600( 1, "off" );
    level._id_656B thread _id_6DB7();
    thread _id_6A41();
    level._id_656B _meth_827B( "paladin_ks_callin", "paladin_notetrack" );

    if ( isdefined( level._id_656B._id_02E9 ) )
        level._id_656B._id_02E9 thread _id_6C82( 1.5 );

    level._id_656B waittillmatch( "paladin_notetrack", "engines_full" );
    level._id_656B waittillmatch( "paladin_notetrack", "downward_stop" );

    if ( isdefined( level._id_656B._id_02E9 ) )
    {
        level._id_656B._id_02E9 _meth_80AF( "orbital_laser_charge" );
        level._id_656B._id_02E9 _meth_80AD( "ac130_105mm_fire" );
        earthquake( 0.2, 2, level._id_656B._id_28BC._id_02E6, 1000 );
    }

    level._id_656B waittillmatch( "paladin_notetrack", "engines_idle" );

    if ( var_0 )
    {
        level._id_656B _meth_8446( level._id_65AA, "tag_player" );
        thread _id_7600( level._id_656E );
    }

    level._id_656B waittillmatch( "paladin_notetrack", "end" );
    level._id_656B _meth_827A();
    level._id_656B _meth_8279( "paladin_ks_loop", "paladin_notetrack" );

    if ( isdefined( level._id_656B._id_02E9 ) )
    {
        level._id_656B._id_1FDC = spawn( "script_origin", ( 0, 0, 0 ) );
        level._id_656B._id_1FDC _meth_8446( level._id_656B, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        level._id_656B._id_1FDC _meth_8075( "paladin_flight_loop_near" );
    }

    level._id_656B._id_366B = spawn( "script_origin", ( 0, 0, 0 ) );
    level._id_656B._id_366B _meth_8446( level._id_656B, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    level._id_656B._id_366B _meth_8075( "paladin_flight_loop_dist" );
    _id_8310();
    level._id_656B.paladinflying = 1;
}

_id_8310()
{
    if ( isdefined( level._id_656B._id_1FDC ) )
    {
        level._id_656B._id_1FDC _meth_8054();

        if ( isdefined( level._id_656B._id_02E9 ) )
            level._id_656B._id_1FDC _meth_8007( level._id_656B._id_02E9 );

        if ( isdefined( level._id_6564 ) && !level._id_8A76 && !_id_173B( level._id_656B._id_02E9, level._id_6564 ) )
            level._id_656B._id_1FDC _meth_8007( level._id_6564 );
    }

    if ( isdefined( level._id_656B._id_366B ) )
    {
        level._id_656B._id_366B _meth_8054();

        foreach ( var_1 in level._id_0328 )
        {
            if ( level._id_8A76 || isdefined( level._id_656B._id_02E9 ) && _id_173B( level._id_656B._id_02E9, var_1 ) )
                continue;

            if ( isdefined( level._id_656B._id_02E9 ) && var_1 != level._id_656B._id_02E9 )
                level._id_656B._id_366B _meth_8007( var_1 );
        }
    }
}

_id_173B( var_0, var_1 )
{
    return var_0 _meth_82CD() && var_1 _meth_82CD();
}

_id_6C82( var_0 )
{
    self endon( "disconnect" );
    self endon( "orbitalsupport_player_removed" );
    wait(var_0);
    self _meth_80AD( "orbital_laser_charge" );
}

_id_6DB7()
{
    level._id_656B endon( "death" );
    level._id_656B endon( "crashing" );
    level endon( "game_ended" );
    level endon( "orbitalsupport_player_removed" );
    level._id_656B endon( "stopEffects" );
    playfxontag( _id_A4F0::_id_3FA6( "orbitalsupport_entry" ), level._id_656B, "tag_origin" );
    waittillframeend;
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_L_1" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_L_2" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_R_1" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_R_2" );
    waittillframeend;
    playfx( _id_A4F0::_id_3FA6( "orbitalsupport_entry_flash" ), level._id_656B._id_28BC._id_02E6 );
    level._id_656B waittillmatch( "paladin_notetrack", "engines_full" );
    playfxontag( _id_A4F0::_id_3FA6( "orbitalsupport_light" ), level._id_656B, "tag_light_tail" );
    playfxontag( _id_A4F0::_id_3FA6( "orbitalsupport_entry_complete" ), level._id_656B, "tag_light_belly" );
    waittillframeend;
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_L_1" );
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_R_1" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg" ), level._id_656B, "TAG_FX_ENGINE_L_1" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg" ), level._id_656B, "TAG_FX_ENGINE_L_2" );
    waittillframeend;
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_L_2" );
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_R_2" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg" ), level._id_656B, "TAG_FX_ENGINE_R_1" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg" ), level._id_656B, "TAG_FX_ENGINE_R_2" );
    level._id_656B waittillmatch( "paladin_notetrack", "engines_idle" );
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg" ), level._id_656B, "TAG_FX_ENGINE_L_1" );
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg" ), level._id_656B, "TAG_FX_ENGINE_R_1" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_L_1" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_R_1" );
    waittillframeend;
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg" ), level._id_656B, "TAG_FX_ENGINE_L_2" );
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg" ), level._id_656B, "TAG_FX_ENGINE_R_2" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_L_2" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_R_2" );
    waittillframeend;
    stopfxontag( _id_A4F0::_id_3FA6( "orbitalsupport_entry" ), level._id_656B, "tag_origin" );
}

_id_6A41()
{
    self endon( "death" );
    self endon( "crashing" );
    level endon( "game_ended" );
    level endon( "orbitalsupport_player_removed" );
    wait 1;
    playsoundatpos( level._id_656B._id_28BC._id_02E6, "paladin_orbit_drop" );
}

_id_6571()
{
    level._id_656B endon( "crashing" );
    level._id_656B notify( "leaving" );
    level._id_656B _meth_804F();
    level._id_656B _meth_827B( "paladin_ks_exit", "paladin_notetrack" );
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_L_1" );
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_L_2" );
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_R_1" );
    stopfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet" ), level._id_656B, "TAG_FX_ENGINE_R_2" );
    waittillframeend;
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg_trl" ), level._id_656B, "TAG_FX_ENGINE_L_1" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg_trl" ), level._id_656B, "TAG_FX_ENGINE_L_2" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg_trl" ), level._id_656B, "TAG_FX_ENGINE_R_1" );
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg_trl" ), level._id_656B, "TAG_FX_ENGINE_R_2" );
    waittillframeend;
    playfxontag( _id_A4F0::_id_3FA6( "vehicle_osp_jet_lg_trl" ), level._id_656B, "TAG_FX_ENGINE_B" );
    wait 4.8;
    _id_1E8E();
    level._id_656B delete();
    level._id_6572 = 0;
}

_id_8328()
{
    level._id_6567 = 0;

    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1._id_04A8 ) && level._id_656B._id_02E9._id_04A8 == var_1._id_04A8 )
            continue;
        else if ( !isdefined( var_1._id_04A8 ) )
        {
            var_1 _id_64D4();
            continue;
        }

        var_1 thread _id_6D14();
        var_1 thread _id_6D16();
    }

    level thread _id_64C7();
}

_id_64C7()
{
    level endon( "game_ended" );
    level._id_656B._id_02E9 endon( "orbitalsupport_player_removed" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D4();
    }
}

_id_64D4()
{
    self waittill( "spawned_player" );
    thread _id_6D14();
    thread _id_6D16();
    _id_8310();
}

_id_6D16()
{
    self endon( "disconnect" );
    level._id_656B._id_02E9 endon( "orbitalsupport_player_removed" );
    var_0 = level._id_656B._id_02E9._id_04A8;

    for (;;)
    {
        self waittill( "paint_marked_target", var_1 );

        if ( self._id_04A8 == var_0 || !isdefined( var_1 ) )
            continue;

        if ( isdefined( level._id_6564 ) && var_1 == level._id_6564 && gettime() > level._id_6565 )
        {
            level._id_6565 = gettime() + 10000;

            if ( !level._id_656B._id_21C9 )
                var_1 _id_A75A::_id_5652( "copilot_marked_mp_paladin" );
        }
    }
}

_id_6D14()
{
    self endon( "disconnect" );
    level._id_656B._id_02E9 endon( "orbitalsupport_player_removed" );
    var_0 = level._id_656B._id_02E9._id_04A8;

    for (;;)
    {
        self waittill( "death", var_1, var_2, var_3 );

        if ( self._id_04A8 == var_0 || !isdefined( var_1 ) )
            continue;

        if ( var_1 == level._id_656B._id_02E9 && gettime() > level._id_6567 )
        {
            level._id_6567 = gettime() + 10000;
            var_1 _id_A75A::_id_5652( "copilot_enemykill_mp_paladin" );
        }

        if ( isdefined( level._id_6564 ) && var_1 == level._id_6564 && gettime() > level._id_6565 )
        {
            level._id_6565 = gettime() + 10000;

            if ( level._id_656B._id_21C9 )
                var_1 _id_A75A::_id_5652( "copilot_enemykill_mp_paladin" );
        }
    }
}

turretdeletesoundent()
{
    if ( isdefined( self.soundent ) )
        self.soundent delete();
}

_id_6D33()
{
    self _meth_82FB( "ui_killstreak_optic", 0 );
    self _meth_82FB( "ui_osp_rockets", 0 );
    self _meth_82FB( "ui_osp_avail_weapons", 0 );
    self _meth_82FB( "ui_osp_weapon", 0 );
    self _meth_82FB( "ui_osp_reload_bitfield", 0 );
    self _meth_82FB( "ui_osp_toggle", 0 );
    self _meth_82FB( "ui_coop_primary_num", 0 );
    _id_A7B5::_id_6C89();
}

_id_7600( var_0, var_1 )
{
    level notify( "stop_rotatePlane_thread" );
    level endon( "stop_rotatePlane_thread" );

    if ( !isdefined( var_1 ) )
        var_1 = "on";

    if ( var_1 == "on" )
    {
        level._id_65AA _meth_82B7( 360, var_0, 0.5 );
        wait(var_0);

        for (;;)
        {
            level._id_65AA _meth_82B7( 360, var_0 );
            wait(var_0);
        }
    }
    else if ( var_1 == "off" )
    {
        var_2 = 10;
        var_3 = var_0 / 360 * var_2;
        level._id_65AA _meth_82B7( level._id_65AA._id_0041[2] + var_2, var_3, 0, var_3 );
    }
}

spawnmuzzleflashent( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 _meth_80B1( "tag_origin" );
    var_3 _meth_804D( var_0, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 _meth_8054();

    foreach ( var_5 in level._id_0328 )
    {
        if ( var_5 != var_2 )
            var_3 _meth_8007( var_5 );
    }

    thread onplayerconnectmuzzleflashent( var_3 );
    return var_3;
}

onplayerconnectmuzzleflashent( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_1 );
        thread onplayerspawnedmuzzleflashent( var_0, var_1 );
    }
}

onplayerspawnedmuzzleflashent( var_0, var_1 )
{
    var_0 endon( "death" );
    var_1 endon( "disconnect" );
    var_1 waittill( "spawned_player" );
    var_0 _meth_8007( var_1 );
}
