// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_937C( var_0 )
{
    if ( !self._id_4742 )
        return 0;

    var_1 = gettime() + var_0 * 1000;
    var_2 = level._id_560B[self._id_030D["team"]];
    var_3 = level._id_A2A2[self._id_030D["team"]] * 1000;
    var_4 = ( var_1 - var_2 ) / var_3;
    var_5 = ceil( var_4 );
    var_6 = var_2 + var_5 * var_3;

    if ( isdefined( self._id_7477 ) )
    {
        var_7 = ( gettime() - self._id_7477 ) / 1000.0;

        if ( self._id_7477 < var_2 )
            return 0;
    }

    if ( isdefined( self._id_A2A6 ) )
        var_6 += 50 * self._id_A2A6;

    return ( var_6 - gettime() ) / 1000;
}

_id_91EB()
{
    var_0 = self._id_030D["teamkills"];

    if ( var_0 <= level._id_5A1F )
        return 0;

    var_1 = var_0 - level._id_5A1F;
    return _id_A7B3::_id_413F( "team", "teamkillspawndelay" ) * var_1;
}

_id_937B( var_0 )
{
    if ( level._id_4C6A && !self._id_4742 || level._id_3BD8 )
        return 0;

    var_1 = 0;

    if ( self._id_4742 )
    {
        var_2 = self [[ level._id_64DF ]]();

        if ( isdefined( var_2 ) )
            var_1 = var_2;
        else
            var_1 = getdvarint( "scr_" + level._id_01B5 + "_playerrespawndelay" );

        if ( var_0 )
        {
            if ( isdefined( self._id_030D["teamKillPunish"] ) && self._id_030D["teamKillPunish"] )
                var_1 += _id_91EB();

            if ( isdefined( self._id_030D["suicideSpawnDelay"] ) )
                var_1 += self._id_030D["suicideSpawnDelay"];
        }

        if ( isdefined( self._id_7477 ) )
        {
            var_3 = ( gettime() - self._id_7477 ) / 1000.0;
            var_1 -= var_3;

            if ( var_1 < 0 )
                var_1 = 0;
        }

        if ( isdefined( self._id_800F ) )
            var_1 += level._id_937F;
    }

    var_4 = getdvarfloat( "scr_" + level._id_01B5 + "_waverespawndelay" ) > 0;

    if ( var_4 )
        return _id_937C( var_1 );

    return var_1;
}

_id_5A5F()
{
    if ( _id_A75A::_id_3FA8() || isdefined( level._id_2B27 ) )
    {
        if ( isdefined( level._id_2B27 ) && level._id_2B27 )
            return 0;

        if ( isdefined( self._id_030D["teamKillPunish"] ) && self._id_030D["teamKillPunish"] )
            return 0;

        if ( !self._id_030D["lives"] && _id_A75A::_id_3BE0() )
            return 0;
        else if ( _id_A75A::_id_3BE0() )
        {
            if ( !level._id_4C6A && !self._id_4742 && ( isdefined( level._id_0AAB ) && !level._id_0AAB ) )
                return 0;
        }

        if ( isdefined( level.disablespawningforplayerfunc ) && [[ level.disablespawningforplayerfunc ]]( self ) )
            return 0;
    }

    return 1;
}

_id_8992()
{
    self endon( "becameSpectator" );

    if ( isdefined( self._id_1F0F ) )
    {

    }
    else
    {

    }

    if ( isdefined( self._id_A043 ) && self._id_A043 )
        self waittill( "notWaitingToSelectClass" );

    if ( isdefined( self._id_0851 ) )
    {
        _id_A79F::_id_0851( self._id_0851 );
        self._id_0851 = undefined;
    }

    if ( !_id_5A5F() )
    {
        wait 0.05;
        self notify( "attempted_spawn" );
        var_0 = self._id_030D["teamKillPunish"];

        if ( isdefined( var_0 ) && var_0 )
        {
            self._id_030D["teamkills"] = max( self._id_030D["teamkills"] - 1, 0 );
            _id_A75A::_id_7F9F( "friendly_fire", &"MP_FRIENDLY_FIRE_WILL_NOT" );

            if ( !self._id_4742 && _id_91EB() <= 0 )
                self._id_030D["teamKillPunish"] = 0;
        }
        else if ( _id_A75A::_id_5191() && !_id_A75A::_id_513E() )
        {
            if ( isdefined( self._id_90D8 ) && self._id_90D8 )
                _id_A75A::_id_7F9F( "spawn_info", game["strings"]["spawn_tag_wait"] );
            else
                _id_A75A::_id_7F9F( "spawn_info", game["strings"]["spawn_next_round"] );

            thread _id_73DB( 3.0 );
        }

        thread _id_8A08();
        return;
    }

    if ( self._id_A044 )
        return;

    self._id_A044 = 1;
    _id_9FFF();

    if ( isdefined( self ) )
        self._id_A044 = 0;
}

_id_8F2B()
{
    if ( _id_A75A::_id_0AA2() && !isai( self ) )
    {
        var_0 = [];
        var_1 = [ "custom1", "custom2", "custom3", "custom4", "custom5", "class0", "class1", "class2", "class3", "class4" ];

        foreach ( var_3 in var_1 )
        {
            var_4 = _id_A781::_id_4007( self._id_04A8, var_3 );
            var_0[var_0.size] = var_4._id_6F81;
        }

        self _meth_8511( var_0 );
    }
}

_id_3C5E( var_0, var_1 )
{
    var_2 = [];
    var_3 = var_1;

    if ( !_id_A75A::_id_51E5( var_3 ) )
        var_3 = self._id_1E2E;

    if ( _id_A75A::_id_51E5( var_3 ) )
    {
        var_4 = _id_A781::_id_4007( self._id_04A8, var_3 );
        var_2[var_2.size] = var_4._id_6F81;

        if ( !isdefined( var_0 ) || !var_0 )
            var_2[var_2.size] = var_4._id_7BF4;
    }

    return var_2;
}

_id_8F2A( var_0, var_1, var_2 )
{
    self._id_1E41 = 0;
    self notify( "endStreamClassWeapons" );
    self endon( "endStreamClassWeapons" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isai( self ) || !isdefined( var_0 ) )
        var_0 = 0;

    var_3 = _id_3C5E( var_1, var_2 );

    if ( var_3.size > 0 )
    {
        while ( isdefined( self.loadingplayerweapons ) && self.loadingplayerweapons )
            wait 0.05;

        var_0 = !self _meth_8511( var_3 ) && var_0;
        self _meth_8538( 1 );

        for ( self._id_1E41 = var_0; var_0; var_0 = !self _meth_8511( var_3 ) )
            waittillframeend;

        self _meth_8538( 0 );
    }

    self._id_1E41 = 0;
    self notify( "streamClassWeaponsComplete" );
}

_id_9FFF()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );
    level endon( "game_ended" );
    self notify( "attempted_spawn" );

    if ( isdefined( self._id_1F0F ) )
    {

    }
    else
    {

    }

    var_0 = 0;
    var_1 = getentarray( "mp_global_intermission", "classname" );
    var_2 = var_1[randomint( var_1.size )];
    var_3 = self._id_030D["teamKillPunish"];

    if ( isdefined( var_3 ) && var_3 )
    {
        var_4 = _id_91EB();

        if ( var_4 > 0 )
        {
            _id_A75A::_id_7F9F( "friendly_fire", &"MP_FRIENDLY_FIRE_WILL_NOT", var_4, 1, 1 );
            thread _id_746A( var_2._id_02E6, var_2._id_0041 );
            var_0 = 1;
            wait(var_4);
            _id_A75A::_id_1EF5( "friendly_fire" );
            self._id_7477 = gettime();
        }

        self._id_030D["teamKillPunish"] = 0;
    }
    else if ( _id_91EB() )
        self._id_030D["teamkills"] = max( self._id_030D["teamkills"] - 1, 0 );

    var_5 = self._id_030D["suicideSpawnDelay"];

    if ( isdefined( var_5 ) && var_5 > 0 )
    {
        _id_A75A::_id_7F9F( "suicidePenalty", &"MP_SUICIDE_PUNISHED", var_5, 1, 1 );

        if ( !var_0 )
            thread _id_746A( var_2._id_02E6, var_2._id_0041 );

        var_0 = 1;
        wait(var_5);
        _id_A75A::_id_1EF5( "suicidePenalty" );
        self._id_7477 = gettime();
        self._id_030D["suicideSpawnDelay"] = 0;
    }

    if ( _id_A75A::_id_51E0() )
    {
        self._id_89DF = 1;
        self._id_2663 = self._id_02E6;
        self waittill( "stopped_using_remote" );
    }

    if ( !isdefined( self._id_A2A6 ) && isdefined( level._id_A2A4[self._id_04A8] ) )
    {
        self._id_A2A6 = level._id_A2A4[self._id_04A8];
        level._id_A2A4[self._id_04A8]++;
    }

    var_6 = _id_937B( 0 );

    if ( var_6 > 0 )
    {
        self _meth_82FB( "ui_killcam_time_until_spawn", gettime() + var_6 * 1000 );

        if ( !var_0 )
            thread _id_746A( var_2._id_02E6, var_2._id_0041 );

        var_0 = 1;
        _id_A75A::_id_A035( var_6, "force_spawn" );
        self notify( "stop_wait_safe_spawn_button" );
    }

    if ( _id_607E() )
    {
        _id_A75A::_id_7F9F( "spawn_info", game["strings"]["press_to_spawn"], undefined, undefined, undefined, undefined, undefined, undefined, 1 );

        if ( !var_0 )
            thread _id_746A( var_2._id_02E6, var_2._id_0041 );

        var_0 = 1;
        _id_A04C();
    }

    self._id_A044 = 0;
    _id_A75A::_id_1EF5( "spawn_info" );
    self._id_A2A6 = undefined;
    thread _id_89F5();
}

_id_607E()
{
    if ( _id_A7B3::_id_413F( "player", "forcerespawn" ) != 0 )
        return 0;

    if ( !self._id_4742 )
        return 0;

    var_0 = getdvarfloat( "scr_" + level._id_01B5 + "_waverespawndelay" ) > 0;

    if ( var_0 )
        return 0;

    if ( self._id_A149 )
        return 0;

    return 1;
}

_id_A04C()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );

    for (;;)
    {
        if ( self _meth_833C() )
            break;

        wait 0.05;
    }
}

_id_73DB( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    waitframe;
    self endon( "end_respawn" );
    wait(var_0);
    _id_A75A::_id_1EF5( "spawn_info" );
}

_id_55EA()
{
    self _meth_82C7();

    if ( _id_A75A::_id_05CB( "specialty_finalstand" ) && !level._id_2A54 )
        _id_A75A::_id_067B( "specialty_finalstand" );

    if ( level._id_2A54 )
        self._id_01E4 = "";

    self _meth_817D( "crouch" );
    self._id_74FA = 1;
    self notify( "revive" );

    if ( isdefined( self._id_8AFE ) )
        self._id_0275 = self._id_8AFE;

    self._id_01E7 = self._id_0275;
    _id_A4F0::_id_0594();

    if ( game["state"] == "postgame" )
        _id_A789::_id_3A33();
}

_id_3F4C()
{
    var_0 = spawn( "script_origin", self._id_02E6 );
    var_0 _meth_8054();
    var_0._id_0041 = self._id_0041;
    return var_0;
}

_id_8526()
{

}

_id_40CF( var_0 )
{
    if ( !getstarttime( var_0._id_02E6 ) )
        return var_0._id_02E6;

    if ( !isdefined( var_0._id_0B03 ) )
        return var_0._id_02E6;

    foreach ( var_2 in var_0._id_0B03 )
    {
        if ( !getstarttime( var_2 ) )
            return var_2;
    }

    return var_0._id_02E6;
}

_id_939C()
{
    if ( !isdefined( self._id_800F ) )
        return 0;

    var_0 = getentarray( "care_package", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( distancesquared( var_2._id_02E6, self._id_800F._id_6D5A ) > 4096 )
            continue;

        _id_A7DB::_id_286F( self._id_800F );
        return 0;
    }

    return 1;
}

_id_89E0()
{
    self notify( "spawningClientThisFrameReset" );
    self endon( "spawningClientThisFrameReset" );
    wait 0.05;
    level._id_62A9--;
}

_id_8036( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );

    while ( self _meth_8432() && !_id_A75A::_id_4FA3() )
        waittillframeend;

    self _meth_82FB( "ui_options_menu", var_0 );
}

gather_spawn_weapons()
{
    var_0 = [];

    if ( isdefined( self._id_57D3 ) )
    {
        var_0[var_0.size] = _id_A75A::_id_3E65( self._id_57D3 );

        if ( isdefined( self._id_57D3._id_7BF4 ) && self._id_57D3._id_7BF4 != "none" )
            var_0[var_0.size] = self._id_57D3._id_7BF4;
    }
    else
    {
        if ( isdefined( self._id_0343 ) && self._id_0343 != "none" )
            var_0[var_0.size] = self._id_0343;

        if ( isdefined( self._id_03B3 ) && self._id_03B3 != "none" )
            var_0[var_0.size] = self._id_03B3;
    }

    return var_0;
}

_id_89F5( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );
    self notify( "spawned" );
    self notify( "end_respawn" );
    self notify( "started_spawnPlayer" );

    if ( isdefined( self._id_1F0F ) )
    {

    }
    else
    {

    }

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
    {
        self.spawnplayergivingloadout = 1;
        thread monitordelayedspawnloadouts();
    }

    self._id_56F4 = _id_A75A::_id_403D();
    self._id_93F4 = 0;
    var_2 = undefined;
    self._id_933D = 0;
    thread _id_8036( 0 );
    self _meth_82FB( "ui_hud_shake", 0 );
    self _meth_82FB( "ui_exo_cooldown_in_use", 0 );
    self _meth_84B3( 0 );
    self _meth_8533();

    if ( !level._id_4C6A && !self._id_4726 )
    {
        level._id_62A9++;

        if ( level._id_62A9 > 1 )
        {
            self._id_A045 = 1;
            wait(0.05 * ( level._id_62A9 - 1 ));
        }

        thread _id_89E0();
        self._id_A045 = 0;
    }

    if ( var_1 )
    {
        var_3 = undefined;

        if ( isdefined( level.iszombiegame ) && level.iszombiegame )
            var_3 = 0;

        _id_A781::_id_41EE( self._id_04A8, self._id_1E2E, undefined, var_3 );
        var_4 = gather_spawn_weapons();
        self.loadingplayerweapons = 1;

        if ( !self _meth_8425( self, var_4 ) )
        {
            self._id_A045 = 1;
            self _meth_8538( 1 );

            for (;;)
            {
                waittillframeend;
                var_4 = gather_spawn_weapons();

                if ( self _meth_8425( self, var_4 ) )
                    break;
            }

            self _meth_8538( 0 );
            self._id_A045 = 0;
        }

        self.loadingplayerweapons = 0;
    }

    if ( isdefined( self._id_39C8 ) )
    {
        var_5 = self._id_39C8;
        self._id_39C8 = undefined;

        if ( isdefined( self._id_39C7 ) )
        {
            var_6 = self._id_39C7;
            self._id_39C7 = undefined;
        }
        else
            var_6 = ( 0, randomfloatrange( 0, 360 ), 0 );
    }
    else if ( isdefined( self._id_800F ) && ( isdefined( self._id_800F._id_623B ) || _id_939C() ) )
    {
        var_2 = self._id_800F;

        if ( !isdefined( self._id_800F._id_623B ) )
        {
            self._id_933D = 1;
            self _meth_82F4( "tactical_spawn" );

            if ( level._id_5FE9 )
            {
                foreach ( var_8 in level._id_91F0 )
                {
                    if ( var_8 != self._id_04A8 )
                        self _meth_8003( "tactical_spawn", var_8 );
                }
            }
            else if ( level._id_91E4 )
                self _meth_8003( "tactical_spawn", level._id_65B0[self._id_04A8] );
            else
                self _meth_809A( "tactical_spawn" );
        }

        foreach ( var_11 in level._id_99E7 )
        {
            if ( distancesquared( var_11._id_02E6, var_2._id_6D5A ) < 1024 )
                var_11 notify( "damage", 5000, var_11._id_02E9, ( 0, 0, 0 ), ( 0, 0, 0 ), "MOD_EXPLOSIVE", "", "", "", undefined, "killstreak_emp_mp" );
        }

        var_5 = self._id_800F._id_6D5A;
        var_6 = self._id_800F._id_0041;

        if ( isdefined( self._id_800F._id_32C6 ) )
            self._id_800F._id_32C6 delete();

        self._id_800F delete();
        var_2 = undefined;
    }
    else if ( isdefined( self._id_51AE ) && isdefined( self._id_132A ) )
    {
        var_5 = undefined;
        var_6 = undefined;
        var_13 = _id_A77F::_id_1CF5();

        if ( var_13._id_8D76 == 0 )
        {
            var_5 = var_13._id_02E6;
            var_6 = var_13._id_0041;
        }
        else
        {
            var_2 = self [[ level._id_40D0 ]]();
            var_5 = var_2._id_02E6;
            var_6 = var_2._id_0041;
        }

        _id_A77F::_id_1E89();
        self _meth_82FB( "cam_scene_name", "battle_spawn" );
        self _meth_82FB( "cam_scene_lead", self._id_132A _meth_81B1() );
        self _meth_82FB( "cam_scene_support", self _meth_81B1() );
    }
    else if ( isdefined( self._id_4814 ) && ( !isdefined( self._id_381F ) || isdefined( self._id_381F ) && self._id_381F ) && level._id_6F06 > 0 && self._id_04A8 == "allies" )
    {
        while ( !isdefined( level._id_0A7E ) )
            wait 0.1;

        var_5 = level._id_0A7E._id_02E6;
        var_6 = level._id_0A7E._id_0041;
        self._id_381F = 0;
    }
    else if ( isdefined( self._id_4814 ) && ( !isdefined( self._id_381F ) || isdefined( self._id_381F ) && self._id_381F ) && level._id_6F06 > 0 && self._id_04A8 == "axis" )
    {
        while ( !isdefined( level._id_1217 ) )
            wait 0.1;

        var_5 = level._id_1217._id_02E6;
        var_6 = level._id_1217._id_0041;
        self._id_381F = 0;
    }
    else
    {
        var_2 = self [[ level._id_40D0 ]]();
        var_5 = var_2._id_02E6;
        var_6 = var_2._id_0041;
    }

    _id_8010();
    var_14 = self._id_4742;
    self._id_3691 = undefined;

    if ( !var_0 )
    {
        self._id_537D = [];
        _id_A75A::_id_9B61( "playing" );
        _id_A75A::_id_1EF2();
        self._id_1AB3 = undefined;
        self._id_0275 = _id_A7B3::_id_413F( "player", "maxhealth" );
        self._id_01E7 = self._id_0275;
        self._id_3A95 = undefined;
        self._id_4742 = 1;
        self._id_03DD = gettime();
        self._id_8A0C = _id_A75A::_id_412C();
        self._id_A1C9 = !isdefined( var_2 );
        self._id_0891 = 0;
        self._id_2599 = [];
        self._id_53A2 = 1;
        self._id_6300 = 1;
        self._id_1E24 = undefined;
        self._id_83C0 = 0;
        self._id_83BF = 0;
        self._id_3501 = [];
        self._id_3501["exo_boost"] = 0;
        self._id_3501["ground_slam"] = 0;
        self._id_3501["exo_dodge"] = 0;
        self._id_3501["exo_slide"] = 0;
        self._id_3506 = [];
        thread _id_57A1();
        self._id_34E9 = 0;
        self._id_3491 = 0;
        self._id_32AD = [];
        self._id_2515 = 0;

        if ( !isai( self ) )
            thread _id_A783::_id_1EED();

        self._id_7895 = self._id_030D["score"];

        if ( isdefined( self._id_030D["summary"] ) && isdefined( self._id_030D["summary"]["xp"] ) )
            self._id_A39B = self._id_030D["summary"]["xp"];
    }

    self._id_5F78 = level._id_1317;
    self._id_4E39 = 0;
    self._id_024D = undefined;
    self._id_4C57 = undefined;
    self._id_2B0A = 0;
    self._id_2B0B = 0;
    self._id_2B04 = 0;
    _id_A4F0::_id_7463();
    self._id_6C87 = [];

    if ( !var_0 )
    {
        self._id_11FC = 5.0;
        var_15 = self._id_030D["lives"];

        if ( var_15 == _id_A75A::_id_3FA8() )
            _id_084D();

        if ( var_15 )
            self._id_030D["lives"]--;

        _id_0844();

        if ( !var_14 || _id_A75A::_id_3BE0() || _id_A75A::_id_3BE0() && level._id_4C6A && self._id_4726 )
            _id_73A8();

        if ( !self._id_A1B5 )
        {
            var_16 = 20;

            if ( _id_A75A::_id_4129() > 0 && var_16 < _id_A75A::_id_4129() * 60 / 4 )
                var_16 = _id_A75A::_id_4129() * 60 / 4;

            if ( level._id_4C6A || _id_A75A::_id_412A() < var_16 * 1000 )
                self._id_A1B5 = 1;
        }
    }

    if ( level._id_2153 )
        self _meth_82FC( "cg_fov", "65" );

    _id_7461();

    if ( isdefined( var_2 ) )
    {
        _id_A7AF::_id_373B( var_2 );
        var_5 = _id_40CF( var_2 );
        var_6 = var_2._id_0041;
    }
    else
        self._id_55DC = gettime();

    self._id_03DC = var_5;
    self _meth_826F( var_5, var_6 );
    _id_A75A::_id_7F4E( level._id_2C7A );

    if ( var_0 && isdefined( self._id_3690 ) )
    {
        self _meth_817D( self._id_3690 );
        self._id_3690 = undefined;
    }

    [[ level._id_64E6 ]]();

    if ( !var_0 )
    {
        _id_A7A0::_id_6D59();

        if ( isai( self ) && isdefined( level._id_161B ) && isdefined( level._id_161B["player_spawned"] ) )
            self [[ level._id_161B["player_spawned"] ]]();
    }

    _id_A781::_id_7F35( self._id_1E2E );

    if ( isdefined( level._id_2546 ) )
        self [[ level._id_2546 ]]( var_0 );
    else if ( var_1 )
    {
        _id_A781::_id_0CAE();
        self notify( "spawnplayer_giveloadout" );
    }

    if ( getdvarint( "camera_thirdPerson" ) )
        _id_A75A::_id_802B( 1 );

    if ( !_id_A75A::_id_3BDB( "prematch_done" ) )
    {
        _id_A75A::_id_3A30( 1 );
        self _meth_800D();
    }
    else
    {
        _id_A75A::_id_3A30( 0 );
        self _meth_800C();
    }

    if ( !_id_A75A::_id_3BDB( "prematch_done" ) || !var_14 && game["state"] == "playing" )
    {
        var_17 = self._id_030D["team"];

        if ( _id_A75A::_id_4E3C() )
            thread _id_A79C::_id_63D8( game["strings"]["overtime"], game["strings"]["overtime_hint"], undefined, ( 1, 0, 0 ), "mp_last_stand" );

        thread _id_8526();
    }

    if ( _id_A75A::_id_3FD9( "scr_showperksonspawn", 1 ) == 1 && game["state"] != "postgame" )
    {

    }

    waitframe;
    self._id_89DF = undefined;
    self notify( "spawned_player" );
    level notify( "player_spawned", self );

    if ( game["state"] == "postgame" )
        _id_A789::_id_3A33();

    if ( isdefined( level._id_59E7 ) && level._id_59E7 )
        self _meth_82FB( "ui_disable_team_change", 1 );
}

monitordelayedspawnloadouts()
{
    _id_A4F0::_id_A060( "disconnected", "joined_spectators", "spawnplayer_giveloadout" );
    self.spawnplayergivingloadout = undefined;
}

_id_57A1()
{
    self endon( "disconnect" );
    self endon( "death" );

    for (;;)
    {
        var_0 = _id_A4F0::_id_A067( "exo_boost", "ground_slam", "exo_dodge", "exo_slide" );
        self._id_3501[var_0]++;
        self._id_3506[var_0] = _id_A75A::_id_412C();
    }
}

_id_8A08( var_0, var_1 )
{
    self notify( "spawned" );
    self notify( "end_respawn" );
    self notify( "joined_spectators" );
    _id_4C0A( var_0, var_1 );
}

_id_746A( var_0, var_1 )
{
    _id_4C0A( var_0, var_1 );
}

_id_4C0A( var_0, var_1 )
{
    _id_8010();
    var_2 = self._id_030D["team"];

    if ( isdefined( var_2 ) && var_2 == "spectator" && !level._id_3BD8 )
        _id_A75A::_id_1EF5( "spawn_info" );

    _id_A75A::_id_9B61( "spectator" );
    _id_A75A::_id_1EF2();
    self._id_3A95 = undefined;
    self.loadingplayerweapons = undefined;
    _id_7462();
    _id_A7B1::_id_8013();
    _id_64E7( var_0, var_1 );

    if ( level._id_91E4 && !level._id_8A76 && !self _meth_82CD() )
        self _meth_8186( 0, 128, 512, 4000, 6, 1.8 );
}

_id_408A( var_0 )
{
    if ( var_0 < 0 )
        return undefined;

    for ( var_1 = 0; var_1 < level._id_0328.size; var_1++ )
    {
        if ( level._id_0328[var_1] _meth_81B1() == var_0 )
            return level._id_0328[var_1];
    }

    return undefined;
}

_id_40A5()
{
    var_0 = "mp_global_intermission";
    var_1 = getentarray( var_0, "classname" );
    var_2 = _id_A7AF::_id_40D6( var_1 );
    return var_2;
}

_id_64E7( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        self _meth_82C9( var_0, var_1 );
        self _meth_826F( var_0, var_1 );
        return;
    }

    var_2 = _id_40A5();
    self _meth_82C9( var_2._id_02E6, var_2._id_0041 );
    self _meth_826F( var_2._id_02E6, var_2._id_0041 );
}

_id_89E3()
{
    self endon( "disconnect" );
    self notify( "spawned" );
    self notify( "end_respawn" );
    _id_8010();
    _id_A75A::_id_1EF6();
    _id_A75A::_id_3A30( 1 );
    self _meth_800D();
    self _meth_82FC( "cg_everyoneHearsEveryone", 1 );
    var_0 = self._id_030D["postGameChallenges"];

    if ( level._id_7134 && ( self._id_6E87 || isdefined( var_0 ) && var_0 ) )
    {
        if ( self._id_6E87 )
            self _meth_82F4( "mp_level_up" );
        else if ( isdefined( var_0 ) )
            self _meth_82F4( "mp_challenge_complete" );

        if ( self._id_6E87 > level._id_6E86 )
            level._id_6E86 = 1;

        if ( isdefined( var_0 ) && var_0 > level._id_6E86 )
            level._id_6E86 = var_0;

        var_1 = 7.0;

        if ( isdefined( var_0 ) )
            var_1 = 4.0 + min( var_0, 3 );

        while ( var_1 )
        {
            wait 0.25;
            var_1 -= 0.25;
        }
    }

    _id_A75A::_id_9B61( "intermission" );
    _id_A75A::_id_1EF2();
    self._id_3A95 = undefined;
    var_2 = getentarray( "mp_global_intermission", "classname" );
    var_3 = var_2[0];
    self _meth_826F( var_3._id_02E6, var_3._id_0041 );
    self _meth_8186( 0, 128, 512, 4000, 6, 1.8 );
}

_id_89B0()
{
    if ( 1 )
    {
        _id_A75A::_id_3A30( 1 );
        self _meth_800D();
        _id_8A08();
        _id_A75A::_id_3A30( 1 );
        self _meth_800D();
        return;
    }

    self notify( "spawned" );
    self notify( "end_respawn" );
    _id_8010();
    _id_A75A::_id_1EF6();
    self _meth_82FC( "cg_everyoneHearsEveryone", 1 );
    _id_A75A::_id_9B61( "dead" );
    _id_A75A::_id_1EF2();
    self._id_3A95 = undefined;
    var_0 = getentarray( "mp_global_intermission", "classname" );
    var_1 = _id_A7AF::_id_40D6( var_0 );
    self _meth_826F( var_1._id_02E6, var_1._id_0041 );
    var_1 _meth_80B1( "tag_origin" );
    self _meth_807C( var_1 );
    self _meth_8005();
    _id_A75A::_id_3A30( 1 );
    self _meth_800D();
    self _meth_8186( 0, 128, 512, 4000, 6, 1.8 );
}

_id_8010()
{
    self _meth_8184();
    self _meth_80AF( "damage_heavy" );
    self._id_2663 = undefined;
}

_id_6223()
{
    waitframe;

    if ( isdefined( self ) )
        level notify( "connecting", self );
}

_id_5821()
{
    if ( isdefined( self._id_030D["numberOfTimesCloakingUsed"] ) )
        setmatchdata( "players", self._id_1F0F, "numberOfTimesCloakingUsed", _id_A75A::_id_1E28( self._id_030D["numberOfTimesCloakingUsed"] ) );

    if ( isdefined( self._id_030D["numberOfTimesHoveringUsed"] ) )
        setmatchdata( "players", self._id_1F0F, "numberOfTimesHoveringUsed", _id_A75A::_id_1E28( self._id_030D["numberOfTimesHoveringUsed"] ) );

    if ( isdefined( self._id_030D["numberOfTimesShieldUsed"] ) )
        setmatchdata( "players", self._id_1F0F, "numberOfTimesShieldUsed", _id_A75A::_id_1E28( self._id_030D["numberOfTimesShieldUsed"] ) );

    if ( isdefined( self._id_030D["bulletsBlockedByShield"] ) )
        setmatchdata( "players", self._id_1F0F, "bulletsBlockedByShield", self._id_030D["bulletsBlockedByShield"] );
}

_id_5845()
{
    _id_5821();

    if ( isdefined( self._id_030D["totalKillcamsSkipped"] ) )
        setmatchdata( "players", self._id_1F0F, "totalKillcamsSkipped", _id_A75A::_id_1E28( self._id_030D["totalKillcamsSkipped"] ) );

    if ( isdefined( self._id_030D["weaponPickupsCount"] ) )
        setmatchdata( "players", self._id_1F0F, "weaponPickupsCount", _id_A75A::_id_1E28( self._id_030D["weaponPickupsCount"] ) );

    if ( isdefined( self._id_030D["suicides"] ) )
        setmatchdata( "players", self._id_1F0F, "suicidesTotal", _id_A75A::_id_1E28( self._id_030D["suicides"] ) );

    if ( isdefined( self._id_030D["headshots"] ) )
        setmatchdata( "players", self._id_1F0F, "headshotsTotal", _id_A75A::_id_1E29( self._id_030D["headshots"] ) );

    if ( isdefined( self._id_030D["pingAccumulation"] ) && isdefined( self._id_030D["pingSampleCount"] ) )
    {
        if ( self._id_030D["pingSampleCount"] > 0 )
        {
            var_0 = _id_A75A::_id_1E28( self._id_030D["pingAccumulation"] / self._id_030D["pingSampleCount"] );
            setmatchdata( "players", self._id_1F0F, "averagePing", var_0 );
        }
    }

    if ( _id_A75A::_id_7136() )
    {
        var_1 = 3;
        var_2 = 0;

        for ( var_3 = 0; var_3 < var_1; var_3++ )
        {
            var_4 = self _meth_8223( "xpMultiplier", var_3 );

            if ( isdefined( var_4 ) && var_4 > var_2 )
                var_2 = var_4;
        }

        if ( var_2 > 0 )
            setmatchdata( "players", self._id_1F0F, "xpMultiplier", var_2 );
    }

    if ( isdefined( self._id_030D["summary"] ) && isdefined( self._id_030D["summary"]["clanWarsXP"] ) )
        setmatchdata( "players", self._id_1F0F, "clanWarsXp", self._id_030D["summary"]["clanWarsXP"] );

    if ( isdefined( level._id_511A ) && level._id_511A )
        [[ level.hordeupdatetimestats ]]( self );
}

_id_19F3( var_0 )
{
    if ( !isdefined( self._id_2148 ) )
        return;

    setmatchdata( "players", self._id_1F0F, "disconnectTimeUTC", getsystemtime() );
    setmatchdata( "players", self._id_1F0F, "disconnectReason", var_0 );

    if ( _id_A75A::_id_7136() )
        _id_A744::_id_5822();

    if ( isdefined( self._id_030D["confirmed"] ) )
        _id_A744::_id_5836();

    if ( isdefined( self._id_030D["denied"] ) )
        _id_A744::_id_5837();

    _id_5845();

    if ( _id_A75A::_id_5191() )
    {
        var_1 = game["roundsPlayed"] + 1;
        setmatchdata( "players", self._id_1F0F, "playerQuitRoundNumber", var_1 );

        if ( isdefined( self._id_04A8 ) && ( self._id_04A8 == "allies" || self._id_04A8 == "axis" ) )
        {
            if ( self._id_04A8 == "allies" )
            {
                setmatchdata( "players", self._id_1F0F, "playerQuitTeamScore", game["roundsWon"]["allies"] );
                setmatchdata( "players", self._id_1F0F, "playerQuitOpposingTeamScore", game["roundsWon"]["axis"] );
            }
            else
            {
                setmatchdata( "players", self._id_1F0F, "playerQuitTeamScore", game["roundsWon"]["axis"] );
                setmatchdata( "players", self._id_1F0F, "playerQuitOpposingTeamScore", game["roundsWon"]["allies"] );
            }
        }
    }
    else if ( isdefined( self._id_04A8 ) && ( self._id_04A8 == "allies" || self._id_04A8 == "axis" ) && level._id_91E4 )
    {
        if ( self._id_04A8 == "allies" )
        {
            setmatchdata( "players", self._id_1F0F, "playerQuitTeamScore", game["teamScores"]["allies"] );
            setmatchdata( "players", self._id_1F0F, "playerQuitOpposingTeamScore", game["teamScores"]["axis"] );
        }
        else
        {
            setmatchdata( "players", self._id_1F0F, "playerQuitTeamScore", game["teamScores"]["axis"] );
            setmatchdata( "players", self._id_1F0F, "playerQuitOpposingTeamScore", game["teamScores"]["allies"] );
        }
    }

    _id_73CF();
    _id_A7AF::_id_73A9();
    _id_A7AF::_id_73A4();
    var_2 = self _meth_81B1();

    if ( !level._id_91E4 )
        game["roundsWon"][self._id_444D] = undefined;

    if ( !level._id_3BD8 )
        _id_A75A::_id_584A();

    if ( level._id_8A76 )
    {
        var_3 = level._id_0328;

        if ( var_3.size <= 1 )
            level thread _id_A789::_id_39BA();
    }

    if ( isdefined( self._id_0390 ) && isdefined( self._id_030D["team"] ) )
    {
        var_4 = self._id_0390;

        if ( _id_A75A::_id_4022() )
            var_4 = self._id_0390 / _id_A75A::_id_4022();

        _func_173( self, self._id_1F0F, int( var_4 ) );
    }

    reconevent( "script_mp_playerquit: player_name %s, player %d, gameTime %d", self._id_02AB, self._id_1F0F, gettime() );
    var_5 = self _meth_81B1();
    var_6 = self._id_444D;
    obituary( "Q;" + var_6 + ";" + var_5 + ";" + self._id_02AB + "\\n" );
    thread _id_A72E::_id_2B35();

    if ( level._id_3BD8 )
        _id_A78B::_id_739B();

    if ( isdefined( self._id_04A8 ) )
        _id_73AC();

    if ( self._id_03BC == "playing" && !( isdefined( self._id_3691 ) && self._id_3691 ) )
        _id_73A1( 1 );
    else if ( self._id_03BC == "spectator" || self._id_03BC == "dead" )
        level thread _id_A789::_id_9B17();
}

_id_73CF()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_0328.size; var_1++ )
    {
        if ( level._id_0328[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level._id_0328.size - 1; var_1++ )
                level._id_0328[var_1] = level._id_0328[var_1 + 1];

            level._id_0328[var_1] = undefined;
            break;
        }
    }
}

_id_4D96()
{
    if ( level._id_8A76 || self _meth_82CD() )
        self _meth_82FD( "cg_hudGrenadeIconHeight", "37.5", "cg_hudGrenadeIconWidth", "37.5", "cg_hudGrenadeIconOffset", "75", "cg_hudGrenadePointerHeight", "18", "cg_hudGrenadePointerWidth", "37.5", "cg_hudGrenadePointerPivot", "18 40.5", "cg_fovscale", "0.75" );
    else
        self _meth_82FD( "cg_hudGrenadeIconHeight", "75", "cg_hudGrenadeIconWidth", "75", "cg_hudGrenadeIconOffset", "50", "cg_hudGrenadePointerHeight", "36", "cg_hudGrenadePointerWidth", "75", "cg_hudGrenadePointerPivot", "36 81", "cg_fovscale", "1" );
}

_id_4D95()
{
    setdvar( "cg_drawTalk", 1 );
    setdvar( "cg_drawCrosshair", 1 );
    setdvar( "cg_drawCrosshairNames", 1 );
    setdvar( "cg_hudGrenadeIconMaxRangeFrag", 250 );

    if ( level._id_46C7 )
    {
        setdvar( "cg_drawTalk", 3 );
        setdvar( "cg_drawCrosshair", 0 );
        setdvar( "cg_drawCrosshairNames", 1 );
        setdvar( "cg_hudGrenadeIconMaxRangeFrag", 0 );
    }

    if ( isdefined( level._id_0B0A ) && level._id_0B0A )
        setdvar( "cg_drawFriendlyNamesAlways", 1 );
    else
        setdvar( "cg_drawFriendlyNamesAlways", 0 );

    _id_4D96();

    if ( _id_A75A::_id_3FA8() )
        self _meth_82FD( "cg_deadChatWithDead", 1, "cg_deadChatWithTeam", 0, "cg_deadHearTeamLiving", 0, "cg_deadHearAllLiving", 0 );
    else
        self _meth_82FD( "cg_deadChatWithDead", 0, "cg_deadChatWithTeam", 1, "cg_deadHearTeamLiving", 1, "cg_deadHearAllLiving", 0 );

    if ( level._id_91E4 )
        self _meth_82FD( "cg_everyonehearseveryone", 0 );

    if ( getdvarint( "scr_hitloc_debug" ) )
    {
        for ( var_0 = 0; var_0 < 6; var_0++ )
            self _meth_82FC( "ui_hitloc_" + var_0, "" );

        self._id_4921 = 1;
    }
}

_id_4010()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < 30; var_1++ )
    {
        foreach ( var_3 in level._id_0328 )
        {
            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_1F0F == var_1 )
            {
                var_0 = 1;
                break;
            }

            var_0 = 0;
        }

        if ( !var_0 )
            return var_1;
    }
}

_id_8335()
{
    self._id_780E = [];

    for ( var_0 = 1; var_0 <= 4; var_0++ )
    {
        self._id_780E[var_0] = spawnstruct();
        self._id_780E[var_0]._id_04D8 = "";
        self._id_780E[var_0]._id_0214 = undefined;
    }

    if ( !level._id_2153 )
    {
        for ( var_0 = 5; var_0 <= 8; var_0++ )
        {
            self._id_780E[var_0] = spawnstruct();
            self._id_780E[var_0]._id_04D8 = "";
            self._id_780E[var_0]._id_0214 = undefined;
        }
    }
}

_id_583F()
{
    var_0 = _func_2CE();
    var_1 = self _meth_8226( "consoleIDChunkLow", var_0 );
    var_2 = self _meth_8226( "consoleIDChunkHigh", var_0 );

    if ( isdefined( var_1 ) && var_1 != 0 )
        setmatchdata( "players", self._id_1F0F, "consoleIDChunkLow", var_1 );

    if ( isdefined( var_2 ) && var_2 != 0 )
        setmatchdata( "players", self._id_1F0F, "consoleIDChunkHigh", var_2 );

    var_3 = 3;
    var_4 = -1;

    if ( isdefined( var_2 ) && var_2 != 0 && isdefined( var_1 ) && var_1 != 0 )
    {
        for ( var_5 = 0; var_5 < var_3; var_5++ )
        {
            var_6 = self _meth_8226( "deviceConnectionHistory", var_5, "device_id_high" );
            var_7 = self _meth_8226( "deviceConnectionHistory", var_5, "device_id_low" );

            if ( var_6 == var_2 && var_7 == var_1 )
            {
                var_4 = var_5;
                break;
            }
        }
    }

    if ( var_4 == -1 )
    {
        var_8 = 0;

        for ( var_5 = 0; var_5 < var_3; var_5++ )
        {
            var_9 = self _meth_8226( "deviceConnectionHistory", var_5, "deviceUseFrequency" );

            if ( var_9 > var_8 )
            {
                var_8 = var_9;
                var_4 = var_5;
            }
        }
    }

    if ( var_4 == -1 )
        var_4 = 0;

    var_10 = self _meth_8226( "deviceConnectionHistory", var_4, "onWifi" );

    if ( var_10 )
        setmatchdata( "players", self._id_1F0F, "playingOnWifi", 1 );
}

truncateplayername( var_0 )
{
    if ( level._id_0531 && var_0.size > 18 )
    {
        var_1 = _id_A4F0::_id_8F4F( var_0, "]" );

        if ( var_1 >= 0 && _id_A4F0::_id_8F51( var_0, "[" ) )
            var_0 = getsubstr( var_0, var_1 + 1 );
    }

    return var_0;
}

_id_19F0()
{
    var_0 = _id_40A5();
    self _meth_82C9( var_0._id_02E6, var_0._id_0041 );
    thread _id_6223();
    self waittill( "begin" );
    self._id_214F = gettime();
    level notify( "connected", self );
    self._id_2148 = 1;

    if ( self _meth_829C() )
        level._id_031D = self;

    if ( !level._id_8A76 && !isdefined( self._id_030D["score"] ) )
        iprintln( &"MP_CONNECTED", self );

    self._id_9C28 = self _meth_8017();
    _id_4D95();
    _id_4DFE();

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self._id_444D = self _meth_8275();
    self._id_0537 = self _meth_8297();
    self._id_93F4 = 0;
    var_1 = 0;

    if ( !isdefined( self._id_030D["clientid"] ) )
    {
        if ( game["clientid"] >= 30 )
            self._id_030D["clientid"] = _id_4010();
        else
            self._id_030D["clientid"] = game["clientid"];

        if ( game["clientid"] < 30 )
            game["clientid"]++;

        var_1 = 1;
    }

    if ( var_1 && !_id_A75A::_id_4FA3() )
        _id_A7C3::_id_7440( 1 );

    if ( _id_A75A::_id_6E98() && var_1 )
        _id_A781::_id_0D75();

    if ( var_1 )
        _id_8F2B();

    self._id_1F0F = self._id_030D["clientid"];
    self._id_030D["teamKillPunish"] = 0;
    self._id_030D["suicideSpawnDelay"] = 0;

    if ( var_1 )
        reconevent( "script_mp_playerjoin: player_name %s, player %d, gameTime %d", self._id_02AB, self._id_1F0F, gettime() );

    obituary( "J;" + self._id_444D + ";" + self _meth_81B1() + ";" + self._id_02AB + "\\n" );

    if ( game["clientid"] <= 30 && game["clientid"] != getmatchdata( "playerCount" ) )
    {
        var_2 = 0;
        var_3 = 0;

        if ( !isai( self ) && _id_A75A::_id_59E0() )
            self _meth_82AA( self._id_1F0F );

        setmatchdata( "playerCount", game["clientid"] );
        setmatchdata( "players", self._id_1F0F, "playerID", "xuid", self _meth_8297() );
        setmatchdata( "players", self._id_1F0F, "playerID", "ucdIDHigh", self _meth_8298() );
        setmatchdata( "players", self._id_1F0F, "playerID", "ucdIDLow", self _meth_8299() );
        setmatchdata( "players", self._id_1F0F, "playerID", "clanIDHigh", self _meth_829A() );
        setmatchdata( "players", self._id_1F0F, "playerID", "clanIDLow", self _meth_829B() );
        setmatchdata( "players", self._id_1F0F, "gamertag", truncateplayername( self._id_02AB ) );
        setmatchdata( "players", self._id_1F0F, "isBot", isai( self ) );
        var_4 = self _meth_81B1();
        setmatchdata( "players", self._id_1F0F, "codeClientNum", _id_A75A::_id_1E28( var_4 ) );
        var_5 = _func_2CE();
        var_3 = self _meth_8226( "connectionIDChunkLow", var_5 );
        var_2 = self _meth_8226( "connectionIDChunkHigh", var_5 );
        setmatchdata( "players", self._id_1F0F, "connectionIDChunkLow", var_3 );
        setmatchdata( "players", self._id_1F0F, "connectionIDChunkHigh", var_2 );
        setmatchclientip( self, self._id_1F0F );
        setmatchdata( "players", self._id_1F0F, "joinType", self _meth_84D3() );
        setmatchdata( "players", self._id_1F0F, "connectTimeUTC", getsystemtime() );
        setmatchdata( "players", self._id_1F0F, "isSplitscreen", issplitscreen() );
        _id_583F();

        if ( self _meth_829C() )
            setmatchdata( "players", self._id_1F0F, "wasAHost", 1 );

        if ( _id_A75A::_id_7136() )
            _id_A744::_id_5834();

        if ( istestclient( self ) || isai( self ) )
            var_6 = 1;
        else
            var_6 = 0;

        if ( _id_A75A::_id_59E0() && _id_A75A::_id_0AB0() && !var_6 )
            setmatchdata( "players", self._id_1F0F, "team", self._id_03BD );

        if ( _id_A75A::_id_50AE( self ) )
        {
            if ( !isdefined( level._id_59DD ) )
                level._id_59DD = [];

            if ( !isdefined( level._id_59DD["botJoinCount"] ) )
                level._id_59DD["botJoinCount"] = 1;
            else
                level._id_59DD["botJoinCount"]++;
        }
    }

    if ( !level._id_91E4 )
        game["roundsWon"][self._id_444D] = 0;

    self._id_5656 = [];
    self._id_5651 = [];
    self._id_564C = "";
    self._id_564F = [];
    self._id_564E = "";

    if ( !isdefined( self._id_030D["cur_kill_streak"] ) )
    {
        self._id_030D["cur_kill_streak"] = 0;
        self._id_023E = 0;
    }

    if ( !isdefined( self._id_030D["cur_death_streak"] ) )
        self._id_030D["cur_death_streak"] = 0;

    if ( !isdefined( self._id_030D["cur_kill_streak_for_nuke"] ) )
        self._id_030D["cur_kill_streak_for_nuke"] = 0;

    if ( _id_A75A::_id_7136() )
        self._id_5339 = _id_A7A4::_id_8D62( "killStreak" );

    self._id_55A2 = -1;
    self._id_91EC = 0;
    self._id_4742 = 0;
    self._id_A044 = 0;
    self._id_A149 = 0;
    self._id_A1B5 = 0;
    self._id_5F78 = level._id_1317;
    self._id_53A2 = 1;
    self._id_6300 = 1;
    self._id_51A8 = 0;
    _id_8335();
    level thread _id_5EA4( self );
    thread _id_A73D::_id_5E5B();
    _id_745F();
    _id_A750::_id_870E();
    waitframe;
    level._id_0328[level._id_0328.size] = self;
    _id_A7AF::_id_084E();
    _id_A7AF::_id_0848();

    if ( level._id_91E4 )
        self _meth_829F();

    if ( game["state"] == "postgame" )
    {
        self._id_214A = 1;
        _id_89E3();
    }
    else
    {
        if ( isai( self ) && isdefined( level._id_161B ) && isdefined( level._id_161B["think"] ) )
            self thread [[ level._id_161B["think"] ]]();

        level endon( "game_ended" );

        if ( isdefined( level._id_4A36 ) )
        {
            if ( !isdefined( self._id_4A33 ) || self._id_4A33 == 0 )
            {
                self._id_4A33 = 0;
                thread _id_A79A::_id_4A37();
            }
        }

        if ( isdefined( level._id_64C6 ) )
            [[ level._id_64C6 ]]();

        if ( !isdefined( self._id_030D["team"] ) )
        {
            if ( _id_A75A::_id_59E0() && self._id_03BD != "none" )
            {
                thread _id_8A08();

                if ( isdefined( level._id_A03F ) && level._id_A03F )
                    _id_A75A::_id_3A30( 1 );

                thread _id_A79F::_id_8021( self._id_03BD );

                if ( _id_A75A::_id_0AA2() )
                    thread _id_8036( 2 );

                thread _id_52EC();
                return;
            }
            else if ( !_id_A75A::_id_59E0() && _id_A75A::_id_0AB0() )
            {
                _id_A79F::_id_5BB2();
                thread _id_8036( 1 );
            }
            else
            {
                thread _id_8A08();
                self [[ level._id_112A ]]();

                if ( _id_A75A::_id_0AA2() )
                    thread _id_8036( 2 );

                if ( _id_A75A::_id_59E0() )
                    thread _id_52EC();

                return;
            }
        }
        else
        {
            _id_A79F::_id_0851( self._id_030D["team"], 1 );

            if ( _id_A75A::_id_51E5( self._id_030D["class"] ) )
            {
                thread _id_8992();
                return;
            }

            thread _id_8A08();

            if ( self._id_030D["team"] == "spectator" )
            {
                if ( _id_A75A::_id_0AB0() )
                {
                    _id_A79F::_id_13A1();
                    return;
                }

                self [[ level._id_112A ]]();
                return;
                return;
            }

            _id_A79F::_id_1398();
        }
    }
}

_id_19F8()
{
    if ( isdefined( self._id_2148 ) && self._id_2148 )
    {
        _id_A75A::_id_9B3A();
        _id_A75A::_id_9B2B();

        if ( level._id_91E4 )
            self _meth_829F();
    }

    if ( self _meth_829C() )
    {
        _id_4D96();
        setmatchdata( "players", self._id_1F0F, "wasAHost", 1 );
    }

    var_0 = 0;

    foreach ( var_2 in level._id_0328 )
    {
        if ( !isbot( var_2 ) && !istestclient( var_2 ) )
            var_0++;
    }

    if ( !isbot( self ) && !istestclient( self ) )
    {
        level._id_4A35++;

        if ( level._id_4A35 >= var_0 * 2 / 3 )
            level notify( "hostmigration_enoughplayers" );

        self notify( "player_migrated" );
    }
}

_id_39C6()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    wait 60.0;

    if ( self._id_4742 )
        return;

    if ( self._id_030D["team"] == "spectator" )
        return;

    if ( !_id_A75A::_id_51E5( self._id_030D["class"] ) )
    {
        self._id_030D["class"] = "CLASS_CUSTOM1";
        self._id_1E2E = self._id_030D["class"];
        _id_A781::_id_1EE7();
    }

    thread _id_8992();
}

_id_52EC()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    self endon( "attempted_spawn" );
    var_0 = getdvarfloat( "scr_kick_time", 90 );
    var_1 = getdvarfloat( "scr_kick_mintime", 45 );
    var_2 = gettime();

    if ( self _meth_829C() )
        _id_52F0( 120 );
    else
        _id_52F0( var_0 );

    var_3 = ( gettime() - var_2 ) / 1000;

    if ( var_3 < var_0 - 0.1 && var_3 < var_1 )
        return;

    if ( self._id_4742 )
        return;

    if ( self._id_030D["team"] == "spectator" )
        return;

    kick( self _meth_81B1(), "EXE_PLAYERKICKED_INACTIVE" );
    level thread _id_A789::_id_9B17();
}

_id_52F0( var_0 )
{
    level endon( "game_ended" );
    _id_A79A::_id_A049( var_0 );
}

_id_4DFE()
{
    _id_A7A4::_id_4D92();
    self._id_030D["lives"] = _id_A75A::_id_3FA8();

    if ( !isdefined( self._id_030D["deaths"] ) )
    {
        _id_A75A::_id_4DF6( "deaths" );
        _id_A7A4::_id_8D74( "round", "deaths", 0 );
    }

    self._id_010E = _id_A75A::_id_407F( "deaths" );

    if ( !isdefined( self._id_030D["score"] ) )
    {
        _id_A75A::_id_4DF6( "score" );
        _id_A7A4::_id_8D74( "round", "score", 0 );
        _id_A7A4::_id_8D75( "round", "timePlayed", 0 );
    }

    self._id_0390 = _id_A75A::_id_407F( "score" );
    self._id_936B["total"] = _id_A7A4::_id_8D65( "round", "timePlayed" );

    if ( !isdefined( self._id_030D["suicides"] ) )
        _id_A75A::_id_4DF6( "suicides" );

    self._id_8FA9 = _id_A75A::_id_407F( "suicides" );

    if ( !isdefined( self._id_030D["kills"] ) )
    {
        _id_A75A::_id_4DF6( "kills" );
        _id_A7A4::_id_8D74( "round", "kills", 0 );
    }

    self._id_023C = _id_A75A::_id_407F( "kills" );

    if ( !isdefined( self._id_030D["headshots"] ) )
    {
        _id_A75A::_id_4DF6( "headshots" );
        _id_A7A4::_id_8D74( "round", "headshots", 0 );
    }

    self._id_01E6 = _id_A75A::_id_407F( "headshots" );

    if ( !isdefined( self._id_030D["assists"] ) )
    {
        _id_A75A::_id_4DF6( "assists" );
        _id_A7A4::_id_8D74( "round", "assists", 0 );
    }

    self._id_004F = _id_A75A::_id_407F( "assists" );

    if ( !isdefined( self._id_030D["captures"] ) )
    {
        _id_A75A::_id_4DF6( "captures" );
        _id_A7A4::_id_8D74( "round", "captures", 0 );
    }

    if ( !isdefined( self._id_030D["returns"] ) )
    {
        _id_A75A::_id_4DF6( "returns" );
        _id_A7A4::_id_8D74( "round", "returns", 0 );
    }

    self._id_74DD = _id_A75A::_id_407F( "returns" );

    if ( !isdefined( self._id_030D["defends"] ) )
    {
        _id_A75A::_id_4DF6( "defends" );
        _id_A7A4::_id_8D74( "round", "defends", 0 );
    }

    if ( !isdefined( self._id_030D["plants"] ) )
    {
        _id_A75A::_id_4DF6( "plants" );
        _id_A7A4::_id_8D74( "round", "plants", 0 );
    }

    if ( !isdefined( self._id_030D["defuses"] ) )
    {
        _id_A75A::_id_4DF6( "defuses" );
        _id_A7A4::_id_8D74( "round", "defuses", 0 );
    }

    if ( !isdefined( self._id_030D["destructions"] ) )
    {
        _id_A75A::_id_4DF6( "destructions" );
        _id_A7A4::_id_8D74( "round", "destructions", 0 );
    }

    if ( !isdefined( self._id_030D["confirmed"] ) )
    {
        _id_A75A::_id_4DF6( "confirmed" );
        _id_A7A4::_id_8D74( "round", "confirmed", 0 );
    }

    if ( !isdefined( self._id_030D["denied"] ) )
    {
        _id_A75A::_id_4DF6( "denied" );
        _id_A7A4::_id_8D74( "round", "denied", 0 );
    }

    if ( !isdefined( self._id_030D["rescues"] ) )
    {
        _id_A75A::_id_4DF6( "rescues" );
        _id_A7A4::_id_8D74( "round", "rescues", 0 );
    }

    if ( !isdefined( self._id_030D["teamkills"] ) )
        _id_A75A::_id_4DF6( "teamkills" );

    if ( !isdefined( self._id_030D["totalTeamKills"] ) )
        _id_A75A::_id_4DF6( "totalTeamKills" );

    if ( !isdefined( self._id_030D["extrascore0"] ) )
        _id_A75A::_id_4DF6( "extrascore0" );

    if ( !isdefined( self._id_030D["extrascore1"] ) )
        _id_A75A::_id_4DF6( "extrascore1" );

    if ( !isdefined( self._id_030D["teamKillPunish"] ) )
        self._id_030D["teamKillPunish"] = 0;

    if ( !isdefined( self._id_030D["suicideSpawnDelay"] ) )
        self._id_030D["suicideSpawnDelay"] = 0;

    _id_A75A::_id_4DF6( "longestStreak" );
    self._id_030D["lives"] = _id_A75A::_id_3FA8();
    _id_A7A4::_id_8D74( "round", "killStreak", 0 );
    _id_A7A4::_id_8D74( "round", "loss", 0 );
    _id_A7A4::_id_8D74( "round", "win", 0 );
    _id_A7A4::_id_8D74( "round", "scoreboardType", "none" );

    if ( _id_A75A::_id_7136() )
    {
        if ( !isdefined( self._id_030D["previous_shots"] ) )
            self._id_030D["previous_shots"] = self _meth_8223( "totalShots" );

        if ( !isdefined( self._id_030D["previous_hits"] ) )
            self._id_030D["previous_hits"] = self _meth_8223( "hits" );
    }

    if ( !isdefined( self._id_030D["mpWeaponStats"] ) )
        self._id_030D["mpWeaponStats"] = [];

    if ( !isdefined( self._id_030D["numberOfTimesCloakingUsed"] ) )
        self._id_030D["numberOfTimesCloakingUsed"] = 0;

    if ( !isdefined( self._id_030D["numberOfTimesHoveringUsed"] ) )
        self._id_030D["numberOfTimesHoveringUsed"] = 0;

    if ( !isdefined( self._id_030D["numberOfTimesShieldUsed"] ) )
        self._id_030D["numberOfTimesShieldUsed"] = 0;

    if ( !isdefined( self._id_030D["bulletsBlockedByShield"] ) )
        self._id_030D["bulletsBlockedByShield"] = 0;

    if ( !isdefined( self._id_030D["totalKillcamsSkipped"] ) )
        self._id_030D["totalKillcamsSkipped"] = 0;

    if ( !isdefined( self._id_030D["weaponPickupsCount"] ) )
        self._id_030D["weaponPickupsCount"] = 0;

    if ( !isdefined( self._id_030D["pingAccumulation"] ) )
        self._id_030D["pingAccumulation"] = 0;

    if ( !isdefined( self._id_030D["pingSampleCount"] ) )
        self._id_030D["pingSampleCount"] = 0;

    if ( !isdefined( self._id_030D["minPing"] ) )
        self._id_030D["minPing"] = 32767;

    if ( !isdefined( self._id_030D["maxPing"] ) )
        self._id_030D["maxPing"] = 0;

    if ( !isdefined( self._id_030D["validationInfractions"] ) )
        self._id_030D["validationInfractions"] = 0;
}

_id_0852()
{
    level._id_91E6[self._id_04A8]++;

    if ( !isdefined( level._id_91EE ) )
        level._id_91EE = [];

    if ( !isdefined( level._id_91EE[self._id_04A8] ) )
        level._id_91EE[self._id_04A8] = [];

    level._id_91EE[self._id_04A8][level._id_91EE[self._id_04A8].size] = self;
    _id_A789::_id_9B17();
}

_id_73AC()
{
    level._id_91E6[self._id_04A8]--;

    if ( isdefined( level._id_91EE ) && isdefined( level._id_91EE[self._id_04A8] ) )
    {
        var_0 = [];

        foreach ( var_2 in level._id_91EE[self._id_04A8] )
        {
            if ( !isdefined( var_2 ) || var_2 == self )
                continue;

            var_0[var_0.size] = var_2;
        }

        level._id_91EE[self._id_04A8] = var_0;
    }
}

_id_0844()
{
    var_0 = self._id_04A8;

    if ( !( isdefined( self._id_0B00 ) && self._id_0B00 ) )
    {
        level._id_4742[var_0]++;
        _id_4C39( var_0 );
    }

    self._id_0B00 = undefined;

    if ( level._id_09DD["allies"] + level._id_09DD["axis"] > level._id_5A4A )
        level._id_5A4A = level._id_09DD["allies"] + level._id_09DD["axis"];
}

_id_4C39( var_0 )
{
    level._id_09DD[var_0]++;
}

_id_73A1( var_0 )
{
    var_1 = self._id_04A8;

    if ( isdefined( self._id_9078 ) && self._id_9078 && isdefined( self._id_5289 ) && self._id_5289 == self._id_04A8 )
        var_1 = self._id_566A;

    if ( isdefined( self._id_9078 ) || isdefined( var_0 ) )
    {
        _id_7392();

        if ( isdefined( self._id_9078 ) )
            self._id_030D["lives"] = 0;
    }

    _id_275D( var_1 );
    return _id_A789::_id_9B17();
}

_id_275D( var_0 )
{
    level._id_09DD[var_0]--;
}

_id_084D()
{
    level._id_57B6[self._id_04A8] += self._id_030D["lives"];
}

_id_73A8()
{
    level._id_57B6[self._id_04A8]--;
    level._id_57B6[self._id_04A8] = int( max( 0, level._id_57B6[self._id_04A8] ) );
}

_id_7392()
{
    level._id_57B6[self._id_04A8] -= self._id_030D["lives"];
    level._id_57B6[self._id_04A8] = int( max( 0, level._id_57B6[self._id_04A8] ) );
}

_id_7461()
{
    self _meth_82FB( "ui_carrying_bomb", 0 );
    self _meth_82FB( "ui_capture_icon", 0 );
    self _meth_82FB( "ui_light_armor", 0 );
    self _meth_82FB( "ui_killcam_end_milliseconds", 0 );
    self _meth_82FB( "ui_uplink_can_pass", 0 );
    self _meth_82FB( "ui_light_armor_percent", 0 );
    self _meth_82FB( "ui_killcam_time_until_spawn", 0 );
}

_id_745F()
{
    self _meth_82FB( "ui_carrying_bomb", 0 );
    self _meth_82FB( "ui_capture_icon", 0 );
    self _meth_82FB( "ui_light_armor", 0 );
    self _meth_82FB( "ui_killcam_end_milliseconds", 0 );
}

_id_7462()
{
    self _meth_82FB( "ui_carrying_bomb", 0 );
    self _meth_82FB( "ui_capture_icon", 0 );
    self _meth_82FB( "ui_light_armor", 0 );
    self _meth_82FB( "ui_killcam_end_milliseconds", 0 );
}

_id_7460()
{

}

_id_5EA4( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    _id_2433( var_0 );

    for (;;)
    {
        var_0 waittill( "spawned_player" );
        _id_7287( var_0 );
    }
}

_id_2433( var_0 )
{
    if ( !isdefined( var_0._id_030D["segments"] ) )
        var_0._id_030D["segments"] = [];

    var_0._id_7C52 = var_0._id_030D["segments"];

    if ( !var_0._id_7C52.size )
    {
        var_0._id_7C52["distanceTotal"] = 0;
        var_0._id_7C52["movingTotal"] = 0;
        var_0._id_7C52["movementUpdateCount"] = 0;
        var_0._id_7C52["killDistanceTotal"] = 0;
        var_0._id_7C52["killDistanceCount"] = 0;
    }
}

_id_7287( var_0 )
{
    var_0 endon( "death" );

    while ( !_id_A75A::_id_3BDB( "prematch_done" ) )
        wait 0.5;

    wait 4;
    var_0._id_7818 = var_0._id_02E6;
    var_0._id_6E5F = var_0._id_02E6;

    for (;;)
    {
        wait 1;

        if ( var_0 _id_A75A::_id_51E0() )
        {
            var_0 waittill( "stopped_using_remote" );
            var_0._id_7818 = var_0._id_02E6;
            var_0._id_6E5F = var_0._id_02E6;
            continue;
        }

        var_0._id_7C52["movementUpdateCount"]++;
        var_0._id_7C52["distanceTotal"] += distance2d( var_0._id_7818, var_0._id_02E6 );
        var_0._id_7818 = var_0._id_02E6;

        if ( var_0._id_7C52["movementUpdateCount"] % 5 == 0 )
        {
            var_1 = distance2d( var_0._id_6E5F, var_0._id_02E6 );
            var_0._id_6E5F = var_0._id_02E6;

            if ( var_1 > 16 )
                var_0._id_7C52["movingTotal"]++;
        }
    }
}

_id_A358( var_0 )
{
    if ( level._id_0328.size < 2 )
        return;

    var_0 endon( "disconnect" );

    if ( var_0._id_7C52["movementUpdateCount"] < 30 || var_0._id_7C52["killDistanceCount"] < 1 )
        return;

    var_1 = var_0._id_7C52["movingTotal"] / int( var_0._id_7C52["movementUpdateCount"] / 5 ) * 100;
    var_2 = var_0._id_7C52["distanceTotal"] / var_0._id_7C52["movementUpdateCount"];
    var_3 = var_0._id_7C52["killDistanceTotal"] / var_0._id_7C52["killDistanceCount"];
    var_1 = min( var_1, float( tablelookup( "mp/playerSegments.csv", 0, "MAX", 3 ) ) );
    var_2 = min( var_2, float( tablelookup( "mp/playerSegments.csv", 0, "MAX", 2 ) ) );
    var_3 = min( var_3, float( tablelookup( "mp/playerSegments.csv", 0, "MAX", 4 ) ) );
    var_4 = _id_19E1( var_1, var_2, var_3 );
    setmatchdata( "players", var_0._id_1F0F, "averageSpeedDuringMatch", var_2 );
    setmatchdata( "players", var_0._id_1F0F, "percentageOfTimeMoving", var_1 );
    setmatchdata( "players", var_0._id_1F0F, "averageKillDistance", var_3 );
    setmatchdata( "players", var_0._id_1F0F, "totalDistanceTravelled", var_0._id_7C52["distanceTotal"] );
    setmatchdata( "players", var_0._id_1F0F, "playstyle", _id_A75A::_id_1E28( var_4 ) );

    if ( isai( var_0 ) )
        return;

    reconevent( "script_PlayerSegments: percentTimeMoving %f, averageSpeed %f, averageKillDistance %f, playStyle %d, name %s", var_1, var_2, var_3, var_4, var_0._id_02AB );

    if ( !var_0 _id_A75A::_id_7136() )
        return;

    var_5 = 50;
    var_6 = var_0 _meth_8223( "combatRecord", "numPlayStyleTrends" );
    var_6++;

    if ( var_6 > var_5 )
    {
        var_6 = var_5;

        if ( var_5 > 1 )
        {
            for ( var_7 = 0; var_7 < var_5 - 1; var_7++ )
            {
                var_8 = var_0 _meth_8223( "combatRecord", "playStyleTimeStamp", var_7 + 1 );
                var_9 = var_0 _meth_8223( "combatRecord", "playStyle", var_7 + 1 );
                var_0 _meth_8244( "combatRecord", "playStyleTimeStamp", var_7, var_8 );
                var_0 _meth_8244( "combatRecord", "playStyle", var_7, var_9 );
            }
        }
    }

    var_8 = _id_A75A::gettimeutc_for_stat_recording();
    var_0 _meth_8244( "combatRecord", "playStyleTimeStamp", var_6 - 1, var_8 );
    var_0 _meth_8244( "combatRecord", "playStyle", var_6 - 1, var_4 );
    var_0 _meth_8244( "combatRecord", "numPlayStyleTrends", var_6 );
}

_id_19E1( var_0, var_1, var_2 )
{
    var_0 = _id_615F( var_0, float( tablelookup( "mp/playerSegments.csv", 0, "Mean", 3 ) ), float( tablelookup( "mp/playerSegments.csv", 0, "SD", 3 ) ) );
    var_1 = _id_615F( var_1, float( tablelookup( "mp/playerSegments.csv", 0, "Mean", 2 ) ), float( tablelookup( "mp/playerSegments.csv", 0, "SD", 2 ) ) );
    var_2 = _id_615F( var_2, float( tablelookup( "mp/playerSegments.csv", 0, "Mean", 4 ) ), float( tablelookup( "mp/playerSegments.csv", 0, "SD", 4 ) ) );
    var_3 = ( var_0, var_1, var_2 );
    var_4 = [ "Camper", "Mobile", "Run", "Sniper", "TacCQ" ];
    var_5 = "Camper";
    var_6 = 1000;

    foreach ( var_8 in var_4 )
    {
        var_9 = _id_3F26( var_3, var_8 );

        if ( var_9 < var_6 )
        {
            var_5 = var_8;
            var_6 = var_9;
        }
    }

    return int( tablelookup( "mp/playerSegments.csv", 0, var_5, 1 ) );
}

_id_615F( var_0, var_1, var_2 )
{
    return ( var_0 - var_1 ) / var_2;
}

_id_3F26( var_0, var_1 )
{
    var_2 = ( float( tablelookup( "mp/playerSegments.csv", 0, var_1, 3 ) ), float( tablelookup( "mp/playerSegments.csv", 0, var_1, 2 ) ), float( tablelookup( "mp/playerSegments.csv", 0, var_1, 4 ) ) );
    return distance( var_0, var_2 );
}

_id_1EFB( var_0, var_1 )
{
    var_0 _meth_8247( "practiceRoundLockoutTime", 0 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
        var_0 _meth_8247( "practiceRoundLockoutMatchTimes", var_2, 0 );
}

_id_1D17( var_0 )
{
    if ( isbot( var_0 ) || isagent( var_0 ) )
        return;

    var_1 = 10;
    var_2 = 3;
    var_3 = 5.0;
    var_4 = int( 86400 );
    var_5 = int( 86400 );
    var_6 = var_0 _meth_8226( "practiceRoundLockoutTime" );

    if ( var_6 > 0 )
        _id_1EFB( var_0, var_1 );

    var_7 = var_0 _meth_8226( "round", "kills" );
    var_8 = var_0 _meth_8226( "round", "deaths" );
    var_8 = max( var_8, 1 );
    var_9 = var_7 / var_8;

    if ( var_9 < var_3 )
    {
        _id_1EFB( var_0, var_1 );
        return;
    }
    else
    {
        var_10 = _id_A75A::gettimeutc_for_stat_recording();
        var_11 = var_10 - var_4;
        var_12 = -1;
        var_13 = var_10;
        var_14 = 1;

        for ( var_15 = 0; var_15 < var_1; var_15++ )
        {
            var_16 = var_0 _meth_8226( "practiceRoundLockoutMatchTimes", var_15 );

            if ( var_16 < var_13 )
            {
                var_13 = var_16;
                var_12 = var_15;
            }

            if ( var_16 >= var_11 )
                var_14++;
        }

        var_0 _meth_8247( "practiceRoundLockoutMatchTimes", var_12, var_10 );

        if ( var_14 >= var_2 )
        {
            var_17 = var_10 + var_5;
            var_0 _meth_8247( "practiceRoundLockoutTime", var_17 );
        }
    }
}
