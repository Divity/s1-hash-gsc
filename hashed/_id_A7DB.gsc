// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7F3D()
{
    thread _id_248D();
    _id_2483();
}

_id_248D()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetCrouchMovement" );
    self _meth_82DD( "adjustedStance", "+stance" );
    self _meth_82DD( "adjustedStance", "+goStand" );

    for (;;)
    {
        _id_A4F0::_id_A060( "adjustedStance", "sprint_begin", "weapon_change" );
        wait 0.5;
        _id_2483();
    }
}

_id_2483()
{
    self._id_8AF5 = self _meth_817C();
    var_0 = 0;

    if ( isdefined( self._id_0867 ) )
        var_0 = self._id_0867;
    else if ( self._id_8AF5 == "crouch" )
        var_0 = self._id_247D;
    else if ( _id_A75A::_id_05CB( "specialty_lightweight" ) )
        var_0 = _id_A75A::_id_575E();

    self._id_5F78 = var_0;
    _id_A7B4::_id_9B35();
}

_id_9A5F()
{
    self notify( "unsetCrouchMovement" );
    var_0 = 1;

    if ( _id_A75A::_id_05CB( "specialty_lightweight" ) )
        var_0 = _id_A75A::_id_575E();

    self._id_5F78 = var_0;
    _id_A7B4::_id_9B35();
}

_id_7FDA()
{
    var_0 = spawn( "script_model", self._id_02E6 );
    var_0._id_04A8 = self._id_04A8;
    var_0 _meth_800F( self );
    self._id_67E0 = var_0;
    thread _id_70AC( var_0 );
}

_id_70AC( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "personal_uav_remove" );
    self endon( "personal_uav_removed" );

    for (;;)
    {
        var_0 _meth_82AE( self._id_02E6, 0.05 );
        wait 0.05;
    }
}

_id_9A7D()
{
    if ( isdefined( self._id_67E0 ) )
    {
        self notify( "personal_uav_removed" );
        level _id_A7A8::_id_2864( self._id_67E0 );
        self._id_67E0 = undefined;
    }
}

_id_7FD1()
{

}

_id_9A7B()
{

}

_id_7F5A()
{

}

_id_9A62()
{

}

_id_7F25()
{
    _id_116E();
    _id_116F();
}

_id_116F()
{
    self waittill( "death" );
    self endon( "disconnect" );
    self endon( "endAutoSpotAdsWatcher" );
    level endon( "game_ended" );
    self _meth_80BB();
}

_id_9A5A()
{
    self notify( "endAutoSpotAdsWatcher" );
    self _meth_80BB();
}

_id_116E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endAutoSpotAdsWatcher" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        wait 0.05;

        if ( self _meth_8342() )
        {
            self _meth_80BB();
            continue;
        }

        var_1 = self _meth_8340();

        if ( var_1 < 1 && var_0 )
        {
            var_0 = 0;
            self _meth_80BB();
        }

        if ( var_1 < 1 && !var_0 )
            continue;

        if ( var_1 == 1 && !var_0 )
        {
            var_0 = 1;
            self _meth_80BA();
        }
    }
}

_id_7FF8()
{

}

_id_9A80()
{

}

_id_8001()
{
    self _meth_8309( 0.5 );
}

_id_9A82()
{
    self _meth_8309( 1 );
}

_id_7F53()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endDoubleLoad" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self _meth_82D1( "primary" );

        foreach ( var_2 in var_0 )
        {
            var_3 = self _meth_82F8( var_2 );
            var_4 = weaponclipsize( var_2 );
            var_5 = var_4 - var_3;
            var_6 = self _meth_82F9( var_2 );

            if ( var_3 != var_4 && var_6 > 0 )
            {
                if ( var_3 + var_6 >= var_4 )
                {
                    self _meth_82F6( var_2, var_4 );
                    self _meth_82F7( var_2, var_6 - var_5 );
                    continue;
                }

                self _meth_82F6( var_2, var_3 + var_6 );

                if ( var_6 - var_5 > 0 )
                {
                    self _meth_82F7( var_2, var_6 - var_5 );
                    continue;
                }

                self _meth_82F7( var_2, 0 );
            }
        }
    }
}

_id_9A61()
{
    self notify( "endDoubleLoad" );
}

_id_7FA2( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !isdefined( var_0 ) )
        var_0 = 10;
    else
        var_0 = int( var_0 ) * 2;

    _id_A75A::_id_7FF5( var_0 );
    self._id_7265 = var_0;
}

_id_9A77()
{
    _id_A75A::_id_7FF5( 0 );
    self._id_7265 = 0;
}

_id_801A( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !isdefined( var_0 ) )
        self._id_8F71 = 0.5;
    else
        self._id_8F71 = int( var_0 ) / 10;
}

_id_9A8B()
{
    self._id_8F71 = 1;
}

_id_8015()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self _meth_8307( 0.5 );
}

_id_9A87()
{
    self notify( "end_SteadyAimPro" );
    self _meth_8307( 1.0 );
}

_id_1496( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "end_perkUseTracker" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "empty_offhand" );

        if ( !_id_A4F0::_id_5160() )
            continue;

        self [[ var_1 ]]( _id_A75A::_id_05CB( "_specialty_blastshield" ) );
    }
}

_id_67D3()
{
    self endon( "disconnect" );
    self waittill( "death" );
    self._id_0682 = undefined;
}

_id_7FF4()
{

}

_id_9A7E()
{
    self notify( "end_perkUseTracker" );
}

_id_7F5C()
{
    if ( isdefined( self._id_315E ) )
        return;

    self._id_0275 = _id_A7B3::_id_413F( "player", "maxhealth" ) * 4;
    self._id_01E7 = self._id_0275;
    self._id_315E = 1;
    self._id_0E36[0] = "";
    self _meth_82D4( "end_game", 5 );
    thread _id_315F( 7 );
    self._id_4726 = 1;
}

_id_9A63()
{
    self notify( "stopEndGame" );
    self._id_315E = undefined;
    _id_A75A::_id_74F7();

    if ( !isdefined( self._id_3164 ) )
        return;

    self._id_3164 _id_A79D::_id_28E8();
    self._id_3161 _id_A79D::_id_28E8();
}

_id_315F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self endon( "stopEndGame" );
    wait(var_0 + 1);
    _id_A75A::_id_066F();
}

_id_8AF7()
{
    self endon( "death" );
    self endon( "disconnect" );
    self _meth_82DD( "adjustedStance", "+stance" );

    for (;;)
    {
        self waittill( "adjustedStance" );

        if ( self._id_5F78 != 0 )
            continue;

        _id_9A85();
    }
}

_id_52C8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self _meth_82DD( "jumped", "+goStand" );

    for (;;)
    {
        self waittill( "jumped" );

        if ( self._id_5F78 != 0 )
            continue;

        _id_9A85();
    }
}

_id_9A85()
{
    self._id_5F78 = level._id_1317;
    self _meth_8306();
    _id_A7B4::_id_9B35();
    self _meth_82E3();
    self _meth_8301( 1 );
}

_id_7FFA()
{
    self._id_6300 = 2;
}

_id_9A81()
{
    self._id_6300 = 1;
}

_id_7F9D( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 10;

    self._id_5F78 = _id_A75A::_id_575E( var_0 );
    _id_A7B4::_id_9B35();
}

_id_9A75()
{
    self._id_5F78 = level._id_1317;
    _id_A7B4::_id_9B35();
}

_id_7F29()
{
    self._id_53A2 = 1.5;
}

_id_9A5B()
{
    self._id_53A2 = 1;
}

_id_8016()
{
    _id_A75A::_id_41F5( "specialty_bulletaccuracy", 1 );
    _id_A75A::_id_41F5( "specialty_holdbreath", 0 );
}

_id_9A88()
{
    _id_A75A::_id_067B( "specialty_bulletaccuracy" );
    _id_A75A::_id_067B( "specialty_holdbreath" );
}

_id_7F49()
{

}

_id_9A60()
{

}

_id_7F9E()
{
    if ( !_id_A75A::_id_50F6() )
        self _meth_8212( 0 );
}

_id_9A76()
{
    self _meth_8212( 1 );
}

_id_8029()
{
    self _meth_80B6();
}

_id_9A8C()
{
    self _meth_80B7();
}

_id_7FC9()
{
    thread _id_6489();
}

_id_9A79()
{
    self notify( "stop_oneManArmyTracker" );
}

_id_6489()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "stop_oneManArmyTracker" );

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( var_0 != "onemanarmy_mp" )
            continue;

        thread _id_7C6A();
    }
}

_id_5162( var_0 )
{
    if ( var_0 == game["menu_onemanarmy"] )
        return 1;

    if ( isdefined( game["menu_onemanarmy_defaults_splitscreen"] ) && var_0 == game["menu_onemanarmy_defaults_splitscreen"] )
        return 1;

    if ( isdefined( game["menu_onemanarmy_custom_splitscreen"] ) && var_0 == game["menu_onemanarmy_custom_splitscreen"] )
        return 1;

    return 0;
}

_id_7C6A()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    _id_A4F0::_id_0588();
    _id_A4F0::_id_0585();
    _id_A4F0::_id_0586();
    self _meth_8323( game["menu_onemanarmy"] );
    thread _id_1FDD();
    self waittill( "menuresponse", var_0, var_1 );
    _id_A4F0::_id_0596();
    _id_A4F0::_id_0593();
    _id_A4F0::_id_0594();

    if ( var_1 == "back" || !_id_5162( var_0 ) || _id_A75A::_id_51E0() )
    {
        if ( self _meth_8311() == "onemanarmy_mp" )
        {
            _id_A4F0::_id_0588();
            _id_A4F0::_id_0585();
            _id_A4F0::_id_0586();
            self _meth_8315( _id_A4F0::_id_3FFB() );
            self waittill( "weapon_change" );
            _id_A4F0::_id_0596();
            _id_A4F0::_id_0593();
            _id_A4F0::_id_0594();
        }

        return;
    }

    thread _id_41F3( var_1 );
}

_id_1FDD()
{
    self endon( "menuresponse" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_A4F0::_id_0596();
    _id_A4F0::_id_0593();
    _id_A4F0::_id_0594();
    self _meth_8325();
}

_id_41F3( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( _id_A75A::_id_05CB( "specialty_omaquickchange" ) )
    {
        var_1 = 3.0;
        self _meth_82F4( "foly_onemanarmy_bag3_plr" );
        self _meth_8003( "foly_onemanarmy_bag3_npc", "allies", self );
        self _meth_8003( "foly_onemanarmy_bag3_npc", "axis", self );
    }
    else
    {
        var_1 = 6.0;
        self _meth_82F4( "foly_onemanarmy_bag6_plr" );
        self _meth_8003( "foly_onemanarmy_bag6_npc", "allies", self );
        self _meth_8003( "foly_onemanarmy_bag6_npc", "axis", self );
    }

    thread _id_6434( var_1 );
    _id_A4F0::_id_0587();
    _id_A4F0::_id_0585();
    _id_A4F0::_id_0586();
    wait(var_1);
    _id_A4F0::_id_0595();
    _id_A4F0::_id_0593();
    _id_A4F0::_id_0594();
    self._id_6433 = 1;
    _id_A781::_id_41DD( self._id_030D["team"], var_0, 0 );

    if ( isdefined( self._id_1BB4 ) )
        self _meth_801D( self._id_1BB4, "J_spine4", 1 );

    self notify( "changed_kit" );
    level notify( "changed_kit" );
}

_id_6434( var_0 )
{
    self endon( "disconnect" );
    var_1 = _id_A79D::_id_2435( 0, -25 );
    var_2 = _id_A79D::_id_2436( 0, -25 );
    var_2 _meth_80CA( &"MPUI_CHANGING_KIT" );
    var_1 _id_A79D::_id_9AEF( 0, 1 / var_0 );

    for ( var_3 = 0; var_3 < var_0 && isalive( self ) && !level._id_3BD8; var_3 += 0.05 )
        wait 0.05;

    var_1 _id_A79D::_id_28E8();
    var_2 _id_A79D::_id_28E8();
}

_id_7F2A()
{
    self _meth_821B( "primaryoffhand", "specialty_s1_temp" );
}

_id_9A5C()
{
    self _meth_821B( "primaryoffhand", "none" );
}

_id_7F71()
{

}

_id_9A6B()
{

}

_id_801C()
{
    _id_A75A::_id_05C0( "s1_tactical_insertion_device_mp", 0 );
    self _meth_8331( "s1_tactical_insertion_device_mp" );
    thread _id_5ED5();
}

_id_1EFC()
{
    self notify( "clearPreviousTISpawnpointStarted" );
    self endon( "clearPreviousTISpawnpointStarted" );
    _id_A4F0::_id_A060( "disconnect", "joined_team", "joined_spectators" );

    if ( isdefined( self._id_800F ) )
        _id_286F( self._id_800F );
}

_id_9B85()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    while ( _id_A75A::_id_5186( self ) )
    {
        if ( _id_51F7() )
            self._id_9380 = self._id_02E6;

        wait 0.05;
    }
}

_id_51F7()
{
    if ( precachestatusicon( self._id_02E6 ) && self _meth_8341() )
        return 1;
    else
        return 0;
}

_id_5ED5()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );
    thread _id_1EFC();
    thread _id_9B85();
    thread _id_5ED1();

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 != "s1_tactical_insertion_device_mp" )
            continue;

        if ( isdefined( self._id_800F ) )
            _id_286F( self._id_800F );

        if ( !isdefined( self._id_9380 ) )
            continue;

        if ( _id_A75A::_id_9402() )
            continue;

        var_2 = playerphysicstrace( self._id_9380 + ( 0, 0, 16 ), self._id_9380 - ( 0, 0, 2048 ) ) + ( 0, 0, 1 );
        var_3 = spawn( "script_model", var_2 );
        var_3._id_0041 = self._id_0041;
        var_3._id_04A8 = self._id_04A8;
        var_3._id_02E9 = self;
        var_3._id_32C6 = spawn( "script_origin", var_2 );
        var_3 thread _id_4237( self );
        var_3._id_6D5A = self._id_9380;
        var_3 _meth_8383( self );
        var_3 _id_A4F0::_id_5920( self._id_04A8, 1 );
        var_3 _meth_8075( "tac_insert_spark_lp" );
        self._id_800F = var_3;
        return;
    }
}

_id_5ED1()
{
    self notify( "third_person_ti" );
    self endon( "third_person_ti" );

    for (;;)
    {
        if ( isdefined( self._id_0E08 ) )
        {
            self _meth_802A( "npc_tactical_insertion_device", "tag_inhand" );
            self._id_0E08 = undefined;
        }

        self waittillmatch( "grenade_pullback", "s1_tactical_insertion_device_mp" );
        self _meth_801D( "npc_tactical_insertion_device", "tag_inhand", 1 );
        self._id_0E08 = "npc_tactical_insertion_device";
        _id_A75A::_id_A035( 3, "death" );
        self _meth_802A( "npc_tactical_insertion_device", "tag_inhand" );
        self._id_0E08 = undefined;
    }
}

_id_4237( var_0 )
{
    self _meth_80B1( level._id_89D9["enemy"] );
    thread _id_A783::_id_7F5F( 100, undefined, ::_id_6469, undefined, 0 );
    thread _id_4236( var_0 );
    thread _id_4239( var_0 );
    thread _id_4238( self._id_04A8, level._id_89D8["enemy"], var_0 );
    var_1 = spawn( "script_model", self._id_02E6 + ( 0, 0, 0 ) );
    var_1._id_0041 = self._id_0041;
    var_1 _meth_80B1( level._id_89D9["friendly"] );
    var_1 _meth_80BE( 0 );
    var_1 thread _id_4238( self._id_04A8, level._id_89D8["friendly"], var_0 );
    var_1 _meth_8075( "tac_insert_spark_lp" );
    self waittill( "death" );
    var_1 _meth_80AB();
    var_1 delete();
}

_id_4238( var_0, var_1, var_2 )
{
    self endon( "death" );
    wait 0.05;
    var_3 = self _meth_8181( "tag_fire_fx" );
    var_4 = spawnfx( var_1, self _meth_8180( "tag_fire_fx" ), anglestoforward( var_3 ), anglestoup( var_3 ) );
    triggerfx( var_4 );
    thread _id_67C9( var_4 );

    for (;;)
    {
        self _meth_8054();
        var_4 _meth_8054();

        foreach ( var_6 in level._id_0328 )
        {
            if ( var_6._id_04A8 == var_0 && level._id_91E4 && var_1 == level._id_89D8["friendly"] )
            {
                self _meth_8007( var_6 );
                var_4 _meth_8007( var_6 );
                continue;
            }

            if ( var_6._id_04A8 != var_0 && level._id_91E4 && var_1 == level._id_89D8["enemy"] )
            {
                self _meth_8007( var_6 );
                var_4 _meth_8007( var_6 );
                continue;
            }

            if ( !level._id_91E4 && var_6 == var_2 && var_1 == level._id_89D8["friendly"] )
            {
                self _meth_8007( var_6 );
                var_4 _meth_8007( var_6 );
                continue;
            }

            if ( !level._id_91E4 && var_6 != var_2 && var_1 == level._id_89D8["enemy"] )
            {
                self _meth_8007( var_6 );
                var_4 _meth_8007( var_6 );
            }
        }

        level _id_A4F0::_id_A07E( "joined_team", "player_spawned" );
    }
}

_id_67C9( var_0 )
{
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_6469( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self._id_02E9 ) && var_0 != self._id_02E9 )
    {
        var_0 notify( "destroyed_explosive" );
        var_0 thread _id_A7A0::_id_6FF3( "ch_darkbringer" );
    }

    playfx( level._id_89CB, self._id_02E6 );
    self._id_02E9 thread _id_A75A::_id_5652( "ti_destroyed", undefined, undefined, self._id_02E6 );
    var_0 thread _id_286F( self );
}

_id_4239( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self _meth_80DA( "HINT_NOICON" );
    self _meth_80DB( &"MP_PATCH_PICKUP_TI" );
    thread _id_9B0E( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_1 );
        var_1 _meth_809A( "tac_insert_pickup_plr" );
        var_1 thread _id_801C();
        var_1 thread _id_286F( self );
    }
}

_id_9B0E( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        _id_A75A::_id_7FFF( var_0 );
        level _id_A4F0::_id_A07E( "joined_team", "player_spawned" );
    }
}

_id_286F( var_0 )
{
    if ( isdefined( var_0._id_32C6 ) )
        var_0._id_32C6 delete();

    var_0 _meth_80AB();
    var_0 delete();
}

_id_4236( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self._id_32C6 _meth_80DA( "HINT_NOICON" );
    self._id_32C6 _meth_80DB( &"MP_PATCH_DESTROY_TI" );
    self._id_32C6 _id_A75A::_id_593C( var_0 );

    for (;;)
    {
        self._id_32C6 waittill( "trigger", var_1 );
        thread _id_6469( var_1 );
    }
}

_id_7FD5( var_0 )
{
    if ( isplayer( self ) )
    {
        if ( isdefined( var_0._id_8A38 ) && !_id_A75A::_id_05CB( "specialty_coldblooded" ) )
        {
            self._id_665A = 1;
            self _meth_82A6( "specialty_radararrow", 1, 0 );
            thread _id_9A7C( var_0._id_8A38 );
            thread _id_A23E();
        }
    }
}

_id_A23E()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "unsetPainted" );
    self waittill( "death" );
    self._id_665A = 0;
}

_id_9A7C( var_0 )
{
    self notify( "painted_again" );
    self endon( "painted_again" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    wait(var_0);
    self._id_665A = 0;
    self _meth_82A9( "specialty_radararrow", 1 );
    self notify( "unsetPainted" );
}

_id_516A()
{
    return isdefined( self._id_665A ) && self._id_665A;
}

_id_7FF6()
{
    if ( isdefined( self._id_6F80 ) )
        self _meth_8332( self._id_6F80 );

    if ( isdefined( self._id_7BF3 ) )
        self _meth_8332( self._id_7BF3 );
}

_id_7F67()
{
    _id_A75A::_id_41F5( "specialty_pistoldeath", 0 );
}

_id_9A68()
{
    _id_A75A::_id_067B( "specialty_pistoldeath" );
}

_id_7F2D()
{
    thread _id_A7C3::_id_41EB( "airdrop_assault", 0, 0, self );
}

_id_9A5E()
{

}

_id_8035()
{
    thread _id_A7C3::_id_41EB( "uav", 0, 0, self );
}

_id_9A8D()
{

}

_id_8019()
{
    _id_A75A::_id_41F5( "specialty_bulletdamage", 0 );
    thread _id_A255();
}

_id_A255()
{
    self notify( "watchStoppingPowerKill" );
    self endon( "watchStoppingPowerKill" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "killed_enemy" );
    _id_9A8A();
}

_id_9A8A()
{
    _id_A75A::_id_067B( "specialty_bulletdamage" );
    self notify( "watchStoppingPowerKill" );
}

_id_7F91( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );
    self endon( "unset_juiced" );
    level endon( "end_game" );
    self._id_5134 = 1;

    if ( !isdefined( var_0 ) )
        var_0 = 1.25;

    self._id_5F78 = var_0;
    _id_A7B4::_id_9B35();

    if ( level._id_8A76 )
    {
        var_3 = 56;
        var_4 = 21;
    }
    else
    {
        var_3 = 80;
        var_4 = 32;
    }

    if ( !isdefined( var_1 ) )
        var_1 = 7;

    if ( !isdefined( var_2 ) || var_2 == 1 )
    {
        self._id_52AD = _id_A79D::_id_2447( "hudsmall", 1.0 );
        self._id_52AD _id_A79D::_id_7FE8( "CENTER", "CENTER", 0, var_3 );
        self._id_52AD _meth_80CF( var_1 );
        self._id_52AD._id_00C5 = ( 0.8, 0.8, 0 );
        self._id_52AD._id_0048 = 0;
        self._id_52AD._id_019A = 1;
        self._id_52AC = _id_A79D::_id_2420( level._id_8A37, var_4, var_4 );
        self._id_52AC._id_0037 = 0;
        self._id_52AC _id_A79D::_id_7FD6( self._id_52AD );
        self._id_52AC _id_A79D::_id_7FE8( "BOTTOM", "TOP" );
        self._id_52AC._id_0048 = 1;
        self._id_52AC._id_03D5 = 1;
        self._id_52AC._id_019A = 1;
        self._id_52AC _meth_8084( 1.0 );
        self._id_52AC._id_0037 = 0.85;
    }

    thread _id_9A71();
    thread _id_9A72();
    wait(var_1 - 2);

    if ( isdefined( self._id_52AC ) )
    {
        self._id_52AC _meth_8084( 2.0 );
        self._id_52AC._id_0037 = 0.0;
    }

    if ( isdefined( self._id_52AD ) )
    {
        self._id_52AD _meth_8084( 2.0 );
        self._id_52AD._id_0037 = 0.0;
    }

    wait 2;
    _id_9A70();
}

_id_9A70( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( _id_A75A::_id_512E() )
        {
            if ( isdefined( self._id_52A7 ) )
                self._id_5F78 = self._id_52A7;
            else
                self._id_5F78 = 0.7;
        }
        else
        {
            self._id_5F78 = level._id_1317;

            if ( _id_A75A::_id_05CB( "specialty_lightweight" ) )
                self._id_5F78 = _id_A75A::_id_575E();
        }

        _id_A7B4::_id_9B35();
    }

    if ( isdefined( self._id_52AC ) )
        self._id_52AC _meth_8088();

    if ( isdefined( self._id_52AD ) )
        self._id_52AD _meth_8088();

    self._id_5134 = undefined;
    self notify( "unset_juiced" );
}

_id_9A72()
{
    self endon( "disconnect" );
    self endon( "unset_juiced" );

    for (;;)
    {
        wait 0.05;

        if ( _id_A75A::_id_51E0() )
        {
            thread _id_9A70();
            break;
        }
    }
}

_id_9A71()
{
    self endon( "disconnect" );
    self endon( "unset_juiced" );
    _id_A4F0::_id_A060( "death", "faux_spawn" );
    thread _id_9A70( 1 );
}

_id_7F9B( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        self._id_5711 = var_0;

        if ( isplayer( self ) && isdefined( self._id_5A3B ) && self._id_5A3B > 0 )
        {
            var_1 = clamp( self._id_5711 / self._id_5A3B, 0, 1 );
            self _meth_82FB( "ui_light_armor_percent", var_1 );
        }
    }
    else
    {
        self._id_5711 = undefined;
        self._id_5A3B = undefined;
        self _meth_82FB( "ui_light_armor_percent", 0 );
    }
}

_id_7F9A( var_0 )
{
    self notify( "give_light_armor" );

    if ( isdefined( self._id_5711 ) )
        _id_9A74();

    thread _id_73B6();
    thread _id_73B7();

    if ( isdefined( var_0 ) )
        self._id_5A3B = var_0;
    else
        self._id_5A3B = 150;

    _id_7F9B( self._id_5A3B );
}

_id_73B6()
{
    self endon( "disconnect" );
    self endon( "give_light_armor" );
    self endon( "remove_light_armor" );
    self waittill( "death" );
    _id_9A74();
}

_id_9A74()
{
    _id_7F9B( undefined );
    self notify( "remove_light_armor" );
}

_id_73B7()
{
    self endon( "disconnect" );
    self endon( "remove_light_armor" );
    level _id_A4F0::_id_A060( "round_end_finished", "game_ended" );
    thread _id_9A74();
}

_id_4732()
{
    return isdefined( self._id_5711 ) && self._id_5711 > 0;
}
