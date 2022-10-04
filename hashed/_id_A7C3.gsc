// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0._id_030D["killstreaks"] ) )
            var_0._id_030D["killstreaks"] = [];

        if ( !isdefined( var_0._id_030D["kID"] ) )
            var_0._id_030D["kID"] = 10;

        var_0._id_56F4 = 0;
        var_0._id_24C4 = 0;

        if ( isdefined( var_0._id_030D["deaths"] ) )
            var_0._id_56F4 = var_0._id_030D["deaths"];

        var_0._id_8AA8 = 0;

        if ( getdvarint( "virtualLobbyActive", 0 ) )
            return;

        var_0 thread _id_64D3();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        _id_A4F0::_id_A060( "spawned_player", "faux_spawn" );
        thread _id_53AA();
        thread _id_8F21();
        thread _id_A00E();
        thread _id_8F25();
        thread _id_8F24();

        if ( !level._id_2153 )
            thread _id_673C();

        if ( !isdefined( self._id_030D["killstreaks"][0] ) )
            _id_4DFB();

        if ( !isdefined( self._id_300B ) )
            self._id_300B = 0;

        if ( !isdefined( self._id_0865 ) || self._id_0865 == 0 )
        {
            self._id_0865 = self._id_030D["ks_totalPoints"];
            self._id_086A = self._id_030D["ks_totalPointsSupport"];
            _id_9B70();

            for ( var_0 = 0; var_0 < level._id_538C; var_0++ )
            {
                var_1 = self._id_030D["killstreaks"][var_0]._id_8F20;
                var_2 = self._id_030D["killstreaks"][var_0]._id_1172;

                if ( isdefined( var_1 ) )
                {
                    if ( var_0 == level._id_5383 && ( !isdefined( var_2 ) || !var_2 ) )
                        continue;

                    var_3 = _id_A75A::_id_3FEC( self._id_030D["killstreaks"][var_0]._id_8F20 );
                    var_4 = "ks_icon" + _id_A4F0::_id_93EB( var_0 );
                    self _meth_82FB( var_4, var_3 );
                }
            }

            updatestreakicons( 0 );
        }

        _id_9B71();
        _id_41F4();
        _id_9B70();
    }
}

updatestreakicons( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_538C; var_1++ )
    {
        if ( !var_0 && var_1 == level._id_5383 )
            continue;

        var_2 = "ks_icon" + _id_A4F0::_id_93EB( var_1 );
        self _meth_82FB( var_2, 0 );
        var_3 = self _meth_8447( "ks_hasStreak" );
        var_4 = var_3 & ~( 1 << var_1 ) & ~( 1 << var_1 + level._id_538C );
        self _meth_82FB( "ks_hasStreak", var_4 );
    }

    var_5 = 1;

    if ( isdefined( self._id_53A0 ) )
    {
        foreach ( var_7 in self._id_53A0 )
        {
            var_8 = self._id_030D["killstreaks"][var_5];
            var_8._id_8F20 = var_7;
            var_9 = var_8._id_8F20;
            var_2 = "ks_icon" + _id_A4F0::_id_93EB( var_5 );
            self _meth_82FB( var_2, _id_A75A::_id_3FEC( var_9 ) );
            var_3 = self _meth_8447( "ks_hasStreak" );
            var_4 = var_3 & ~( 1 << var_5 );

            if ( _id_51BF( self, var_7 ) )
                var_4 |= 1 << var_5 + level._id_538C;
            else
                var_4 &= ~( 1 << var_5 + level._id_538C );

            self _meth_82FB( "ks_hasStreak", var_4 );
            var_5++;
        }
    }
}

_id_4DFB()
{
    var_0 = spawnstruct();
    var_0._id_1172 = 0;
    var_0._id_8F20 = undefined;
    var_0._id_3007 = 0;
    var_0._id_120F = undefined;
    var_0._id_02E9 = undefined;
    var_0._id_52F1 = undefined;
    var_0._id_56F4 = undefined;
    var_0._id_5110 = 1;
    var_0._id_60D9 = undefined;
    self._id_030D["killstreaks"][level._id_5383] = var_0;

    for ( var_1 = level._id_5388; var_1 < level._id_538C; var_1++ )
    {
        var_2 = spawnstruct();
        var_2._id_1172 = 0;
        var_2._id_8F20 = undefined;
        var_2._id_3007 = 1;
        var_2._id_120F = 1;
        var_2._id_02E9 = undefined;
        var_2._id_52F1 = undefined;
        var_2._id_56F4 = -1;
        var_2._id_5110 = 0;
        self._id_030D["killstreaks"][var_1] = var_2;
    }

    updatestreakicons( 1 );
    self _meth_82FB( "ks_selectedIndex", -1 );
    var_3 = self _meth_8447( "ks_hasStreak" );
    var_4 = var_3 & ~( 1 << level._id_538C );
    self _meth_82FB( "ks_hasStreak", var_4 );
}

_id_51BF( var_0, var_1 )
{
    var_2 = getarraykeys( self._id_539D );

    foreach ( var_4 in var_2 )
    {
        var_5 = _id_40F6( var_4 );

        if ( var_5 == var_1 )
        {
            var_6 = tablelookup( level._id_53D9, level._id_53D6, var_4, level._id_53D8 );

            if ( isdefined( var_6 ) && var_6 != "" && var_6 != "0" )
                return 1;
        }
    }

    return 0;
}

_id_9B70()
{
    if ( !isdefined( self._id_030D["killstreaks"] ) )
    {
        for ( var_0 = level._id_5388; var_0 < level._id_538C; var_0++ )
            self _meth_82FB( "ks_count" + _id_A4F0::_id_93EB( var_0 ), 0 );

        self _meth_82FB( "ks_count_updated", 1 );
        return;
    }

    for ( var_0 = level._id_5388; var_0 < level._id_538C; var_0++ )
    {
        var_1 = self._id_030D["killstreaks"][var_0]._id_8F20;
        var_2 = "ks_count" + _id_A4F0::_id_93EB( var_0 );
        var_3 = "ks_points" + _id_A4F0::_id_93EB( var_0 );

        if ( !isdefined( var_1 ) )
        {
            self _meth_82FB( var_2, 0 );
            continue;
        }

        var_4 = _id_40F4( self._id_030D["killstreaks"][var_0]._id_8F20 );

        if ( _id_51BF( self, var_1 ) )
        {
            var_5 = self._id_086A / var_4;
            var_6 = var_4 - self._id_086A;
        }
        else
        {
            var_5 = self._id_0865 / var_4;
            var_6 = var_4 - self._id_0865;
        }

        if ( var_5 >= 1 )
        {
            var_5 = 0;
            var_6 = var_4;
        }

        self _meth_82FB( var_3, var_6 );
        self _meth_82FB( var_2, var_5 );
    }

    self _meth_82FB( "ks_count_updated", 1 );
}

_id_401E( var_0 )
{
    if ( !isdefined( self._id_53A0 ) )
        return 0;

    var_1 = 0;

    foreach ( var_3 in self._id_53A0 )
    {
        var_4 = _id_51BF( self, var_3 );

        if ( var_0 && !var_4 || !var_0 && var_4 )
            continue;

        var_5 = _id_40F4( var_3 );

        if ( var_5 > var_1 )
            var_1 = var_5;
    }

    return var_1;
}

_id_9B71()
{
    if ( !_id_A75A::_id_5186( self ) )
        return;

    var_0 = self._id_030D["killstreaks"];
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_538C; var_2++ )
    {
        if ( isdefined( var_0[var_2] ) && isdefined( var_0[var_2]._id_8F20 ) )
        {
            var_3 = self _meth_8447( "ks_hasStreak" );

            if ( var_0[var_2]._id_1172 == 1 )
                var_4 = var_3 | 1 << var_2;
            else
                var_4 = var_3 & ~( 1 << var_2 );

            self _meth_82FB( "ks_hasStreak", var_4 );

            if ( var_0[var_2]._id_1172 == 1 )
                var_1++;
        }
    }

    if ( isdefined( self._id_539A ) )
        self _meth_82FB( "ks_selectedIndex", self._id_539A );
    else
        self _meth_82FB( "ks_selectedIndex", -1 );
}

_id_A00E()
{
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self notify( "waitForChangeTeam" );
    self endon( "waitForChangeTeam" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_1EF3( 1 );
    }
}

_id_53A9()
{
    var_0 = self._id_030D["killstreaks"];
    var_1 = var_0[self._id_539A]._id_8F20;
    var_2 = var_0[self._id_539A]._id_56F4;
    var_3 = var_0[self._id_539A]._id_3007;
    var_4 = var_0[self._id_539A]._id_120F;
    var_5 = var_0[self._id_539A]._id_52F1;
    var_6 = var_0[self._id_539A]._id_5110;
    var_7 = var_0[self._id_539A]._id_5D57;
    var_8 = undefined;
    var_9 = undefined;
    var_10 = undefined;

    if ( self._id_539A == level._id_5383 )
        var_9 = var_0[level._id_5383]._id_60D9;

    if ( !_id_A75A::_id_9C47( var_1 ) )
        return 0;

    var_11 = 0;

    if ( _id_A75A::_id_05CB( "specialty_explosivebullets" ) && !issubstr( var_1, "explosive_ammo" ) )
        var_11 = 1;

    if ( issubstr( var_1, "airdrop" ) )
    {
        if ( !self [[ level._id_5398[var_1] ]]( var_2, var_5, var_7 ) )
            return 0;
    }
    else if ( !self [[ level._id_5398[var_1] ]]( var_2, var_7 ) )
        return 0;

    if ( var_11 )
        _id_A75A::_id_067B( "specialty_explosivebullets" );

    if ( isdefined( var_9 ) && var_1 != var_0[self._id_539A]._id_8F20 )
    {
        var_10 = 1;
        var_8 = var_9;
    }

    thread _id_9B24( var_10, var_8 );
    _id_9BF2( var_1, var_7, var_4 );
    return 1;
}

_id_9BF2( var_0, var_1, var_2 )
{
    _id_A75A::_id_4C2C( "killStreaksUsed", 1 );

    if ( var_2 )
        thread _id_A7A0::_id_9BF9( var_0 );

    var_3 = self._id_04A8;
    var_4 = var_3 + "_friendly_" + var_0 + "_inbound";
    var_5 = var_3 + "_enemy_" + var_0 + "_inbound";

    if ( var_0 == "emp" )
    {
        var_6 = _id_A7C1::_id_4027( var_1 );
        var_4 += var_6;
        var_5 += var_6;
    }

    if ( level._id_91E4 )
    {
        thread _id_A75A::_id_5648( var_4, var_3 );

        if ( _id_3FED( var_0 ) )
            thread _id_A75A::_id_5648( var_5, level._id_65B0[var_3] );
    }
    else
    {
        thread _id_A75A::_id_5652( var_4 );

        if ( _id_3FED( var_0 ) )
        {
            var_7[0] = self;
            thread _id_A75A::_id_5648( var_5, undefined, undefined, var_7 );
        }
    }

    if ( isdefined( level._id_5986 ) )
    {
        if ( var_0 == level._id_5986 )
        {
            var_8 = getmatchdata( "players", self._id_1F0F, "numberOfMapstreaksUsed" );
            var_8++;
            setmatchdata( "players", self._id_1F0F, "numberOfMapstreaksUsed", _id_A75A::_id_1E28( var_8 ) );
        }
    }
}

_id_9B24( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
    {
        self._id_030D["killstreaks"][self._id_539A]._id_1172 = 0;

        if ( self._id_539A == level._id_5383 )
        {
            self._id_030D["killstreaks"][self._id_030D["killstreaks"][level._id_5383]._id_60D9] = undefined;
            var_2 = undefined;
            var_3 = undefined;
            var_4 = self._id_030D["killstreaks"];

            for ( var_5 = level._id_538C; var_5 < var_4.size; var_5++ )
            {
                if ( !isdefined( var_4[var_5] ) || !isdefined( var_4[var_5]._id_8F20 ) )
                    continue;

                var_2 = var_4[var_5]._id_8F20;

                if ( isdefined( var_4[var_5]._id_5D57 ) )
                    var_3 = var_4[var_5]._id_5D57;

                var_4[level._id_5383]._id_60D9 = var_5;
            }

            if ( isdefined( var_2 ) )
            {
                var_4[level._id_5383]._id_1172 = 1;
                var_4[level._id_5383]._id_8F20 = var_2;

                if ( isdefined( var_3 ) )
                    var_4[level._id_5383]._id_5D57 = var_3;

                var_6 = _id_A75A::_id_3FEC( var_2 );
                var_7 = "ks_icon" + _id_A4F0::_id_93EB( level._id_5383 );
                self _meth_82FB( var_7, var_6 );

                if ( !level._id_2153 && !_id_A4F0::_id_5061() )
                {
                    var_8 = _id_A75A::_id_3FF7( var_2, var_3 );
                    _id_A75A::_id_0634( 4, "weapon", var_8 );
                }
            }
            else
            {
                var_7 = "ks_icon" + _id_A4F0::_id_93EB( level._id_5383 );
                self _meth_82FB( var_7, 0 );
            }
        }
    }

    if ( isdefined( var_1 ) )
        self._id_030D["killstreaks"][var_1] = undefined;

    var_9 = undefined;

    for ( var_5 = 0; var_5 < level._id_538C; var_5++ )
    {
        var_10 = self._id_030D["killstreaks"][var_5];

        if ( isdefined( var_10 ) && isdefined( var_10._id_8F20 ) && var_10._id_1172 )
            var_9 = var_5;
    }

    if ( isdefined( var_9 ) )
    {
        if ( level._id_2153 || _id_A4F0::_id_5061() )
        {
            self._id_539A = var_9;
            self._id_030D["lastEarnedStreak"] = self._id_030D["killstreaks"][var_9]._id_8F20;
            _id_4200();
        }
        else
        {
            for ( var_5 = 0; var_5 < level._id_538C; var_5++ )
            {
                var_10 = self._id_030D["killstreaks"][var_5];

                if ( isdefined( var_10 ) && isdefined( var_10._id_8F20 ) && var_10._id_1172 )
                {
                    var_8 = _id_A75A::_id_3FF7( var_10._id_8F20, var_10._id_5D57 );
                    var_11 = self _meth_82CF();
                    var_12 = 0;

                    for ( var_13 = 0; var_13 < var_11.size; var_13++ )
                    {
                        if ( var_8 == var_11[var_13] )
                        {
                            var_12 = 1;
                            break;
                        }
                    }

                    if ( !var_12 )
                        _id_A75A::_id_05C0( var_8 );
                    else if ( issubstr( var_8, "airdrop_" ) )
                        self _meth_82F6( var_8, 1 );

                    _id_A75A::_id_0634( var_5 + 4, "weapon", var_8 );
                }
            }

            self._id_539A = undefined;
            self._id_030D["lastEarnedStreak"] = self._id_030D["killstreaks"][var_9]._id_8F20;
            _id_9B71();
        }
    }
    else
    {
        self._id_539A = undefined;
        self._id_030D["lastEarnedStreak"] = undefined;
        _id_9B71();
    }

    self _meth_82FB( "ks_used", 1 );
}

_id_1EF3( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 1;

    var_1 = self._id_030D["killstreaks"];

    if ( !isdefined( var_1 ) )
        return;

    for ( var_2 = var_1.size - 1; var_2 > -1; var_2-- )
        self._id_030D["killstreaks"][var_2] = undefined;

    _id_4DFB();
    _id_7440( var_0 );
    self._id_539A = undefined;
    _id_9B71();
}

_id_3F94()
{
    var_0 = self _meth_830C();
    return var_0[0];
}

_id_51D8()
{
    return isdefined( self._id_9898 ) && self._id_9898 && isdefined( self._id_539A );
}

_id_A01B()
{
    self endon( "weapon_switch_invalid" );
    self waittill( "weapon_switch_started", var_0 );
    self notify( "killstreak_weapon_change", "switch_started", var_0 );
}

_id_A01A()
{
    self endon( "weapon_switch_started" );
    self waittill( "weapon_switch_invalid", var_0 );
    self notify( "killstreak_weapon_change", "switch_invalid", var_0 );
}

_id_A019()
{
    childthread _id_A01B();
    childthread _id_A01A();
    self waittill( "killstreak_weapon_change", var_0, var_1 );

    if ( var_0 == "switch_started" )
        return var_1;

    var_2 = _id_A75A::_id_3FF7( self._id_030D["killstreaks"][self._id_539A]._id_8F20, self._id_030D["killstreaks"][self._id_539A]._id_5D57 );
    self _meth_8315( var_2 );
    self waittill( "weapon_switch_started", var_3 );

    if ( var_3 != var_2 )
        return undefined;

    return var_2;
}

_id_9AE8()
{
    foreach ( var_1 in level._id_0328 )
        var_1 notify( "updateKillStreakMarker" );
}

_id_088F()
{
    self endon( "disconnect" );
    self endon( "finish_death" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );
    var_0 = _id_A78A::_id_3F7F( self._id_04A8 );

    for (;;)
    {
        _id_A4F0::_id_A060( "weapon_change", "updateKillStreakMarker" );
        var_1 = self _meth_8311();
        var_2 = weaponclass( var_1 );

        if ( var_2 != "rocketlauncher" )
            continue;

        var_3 = [];
        var_3 = _id_3EDA( var_0 );

        if ( var_3.size == 0 )
            continue;

        foreach ( var_5 in var_3 )
            _id_2446( var_5, self );
    }
}

_id_3EDA( var_0 )
{
    var_1 = [];
    var_2 = [];

    if ( _id_A75A::_id_4FA3() )
        return var_1;

    if ( level._id_91E4 )
        var_2 = level._id_99E1[var_0];
    else
        var_2 = level._id_99E1;

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4._id_5143 ) && var_4._id_5143 )
            continue;

        if ( isdefined( var_4._id_654A ) && var_4._id_654A )
            continue;

        var_1[var_1.size] = var_4;
    }

    foreach ( var_7 in level._id_687B )
    {
        if ( !level._id_91E4 || var_7._id_04A8 == var_0 )
            var_1[var_1.size] = var_7;
    }

    if ( level._id_6572 && isdefined( level._id_656B ) && isdefined( level._id_656B._id_02E9 ) && isdefined( level._id_656B._id_852D ) && level._id_656B._id_852D )
    {
        if ( level._id_91E4 && level._id_656B._id_02E9._id_04A8 == var_0 )
            var_1[var_1.size] = level._id_656B;

        if ( !level._id_91E4 )
            var_1[var_1.size] = level._id_656B;
    }

    if ( isdefined( level._id_3EDA ) )
    {
        var_9 = [[ level._id_3EDA ]]( var_0 );

        foreach ( var_11 in var_9 )
            var_1[var_1.size] = var_11;
    }

    return var_1;
}

_id_2446( var_0, var_1 )
{
    if ( !isdefined( var_0._id_A2A8 ) )
        var_0._id_A2A8 = [];

    var_2 = var_1._id_444D;

    if ( isdefined( var_0._id_A2A8[var_2] ) )
        return;

    var_0._id_A2A8[var_2] = newhudelem();
    var_0._id_A2A8[var_2] _meth_80CC( "waypoint_threat_hostile", 1, 1 );
    var_0._id_A2A8[var_2]._id_0037 = 0.75;
    var_0._id_A2A8[var_2]._id_00C5 = ( 1, 1, 1 );
    var_0._id_A2A8[var_2]._id_0530 = var_0._id_02E6[0];
    var_0._id_A2A8[var_2]._id_0538 = var_0._id_02E6[1];
    var_0._id_A2A8[var_2]._id_053B = var_0._id_02E6[2];
    var_0._id_A2A8[var_2] _meth_80D8( 1, 1, 1 );
    var_0._id_A2A8[var_2] _meth_80CD( var_0 );
    var_0._id_A2A8[var_2]._id_03C4 = 0;
    var_0._id_A2A8[var_2]._id_0048 = 0;
    level thread _id_73DF( self, var_0, var_0._id_A2A8[var_2] );
}

_id_73DF( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_0 _id_A4F0::_id_A061( var_0, "death", var_1, "death", var_0, "weapon_change", var_0, "disconnect", var_1, "leaving" );
    var_2 _meth_8088();
}

_id_53AA()
{
    self endon( "disconnect" );
    self endon( "finish_death" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );
    self notify( "killstreakUseWaiter" );
    self endon( "killstreakUseWaiter" );
    self._id_55B0 = 0;

    if ( !isdefined( self._id_030D["lastEarnedStreak"] ) )
        self._id_030D["lastEarnedStreak"] = undefined;

    thread _id_3793();

    for (;;)
    {
        if ( !isdefined( self._id_52CA ) )
            self waittill( "weapon_change", var_0 );
        else
        {
            var_0 = self._id_52CA;
            self._id_52CA = undefined;
        }

        var_1 = _id_A75A::_id_513A( var_0 );

        if ( !isalive( self ) )
            continue;

        if ( var_1 )
        {

        }

        if ( isdefined( self._id_1287 ) )
            continue;

        if ( var_1 )
        {

        }

        if ( !isdefined( self._id_539A ) )
        {
            if ( !level._id_2153 )
            {
                if ( isdefined( self._id_5595 ) && var_0 == "killstreak_predator_missile_mp" )
                    self _meth_8315( self._id_5595 );
            }

            continue;
        }

        if ( var_1 )
        {

        }

        if ( isdefined( self._id_5978 ) && self._id_5978 )
            continue;

        if ( var_1 )
        {

        }

        if ( isdefined( self._id_50D7 ) && self._id_50D7 )
            continue;

        if ( var_1 )
        {

        }

        if ( !isdefined( self._id_030D["killstreaks"][self._id_539A] ) || !isdefined( self._id_030D["killstreaks"][self._id_539A]._id_8F20 ) )
            continue;

        if ( var_1 )
        {

        }

        var_2 = _id_A75A::_id_3FF7( self._id_030D["killstreaks"][self._id_539A]._id_8F20, self._id_030D["killstreaks"][self._id_539A]._id_5D57 );

        if ( var_0 != var_2 )
        {
            if ( issubstr( var_0, "turrethead" ) )
                self _meth_8315( self._id_5595 );

            if ( _id_A75A::_id_51B7( var_0, "airdrop_" ) )
            {
                self _meth_830F( var_0 );
                self _meth_8315( self._id_5595 );
            }

            continue;
        }

        if ( var_1 )
        {

        }

        waitframe;
        var_3 = self._id_030D["killstreaks"][self._id_539A]._id_8F20;
        var_4 = self._id_030D["killstreaks"][self._id_539A]._id_5110;
        var_5 = self._id_030D["killstreaks"][self._id_539A]._id_5D57;
        var_6 = _id_6CA6();
        var_7 = self._id_539A;

        if ( _id_84B2( var_2 ) )
            childthread _id_907D( var_2, var_6 );

        var_8 = gettime();
        var_9 = _id_53A9();
        var_10 = gettime();
        var_11 = ( var_10 - var_8 ) / 1000;

        if ( !var_9 && !isalive( self ) && !self _meth_8314( _id_A4F0::_id_3FFB() ) )
        {
            var_6 = _id_6CA6( var_9 );
            _id_A75A::_id_05C0( var_6 );
        }

        if ( var_9 )
            thread _id_A058( var_2 );

        if ( _id_84B3( var_9, var_2, var_3, var_5 ) && !isdefined( self._id_52CA ) )
        {
            switch ( var_2 )
            {
                case "killstreak_predator_missile_mp":
                    if ( !var_9 && 1.2 - var_11 > 0 )
                        wait(1.2 - var_11);

                    break;
            }

            if ( !isdefined( self._id_99FC ) )
            {
                if ( !isdefined( level._id_511A ) || isdefined( level._id_511A ) && level._id_511A && !( level._id_49E1 && issubstr( var_2, "turrethead" ) ) )
                    _id_A75A::_id_9074( var_6 );
            }
            else
                self._id_A272 = var_6;
        }

        if ( self _meth_8311() == "none" )
        {
            while ( self _meth_8311() == "none" )
                wait 0.05;

            waitframe;
        }

        if ( isdefined( level._id_1C03 ) && var_9 )
            [[ level._id_1C03 ]]( var_3, var_4, var_7 );
    }
}

_id_907D( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "killstreak_uav_mp":
            wait 0.75;
            break;
        default:
            return;
    }

    _id_A75A::_id_9074( var_1 );
}

_id_6CA6( var_0 )
{
    if ( ( !isdefined( var_0 ) || isdefined( var_0 ) && !var_0 ) && !isalive( self ) && !self _meth_8314( _id_A4F0::_id_3FFB() ) )
        return _id_A4F0::_id_3FFB();
    else if ( !self _meth_8314( _id_A4F0::_id_3FFB() ) )
        return _id_3F94();
    else
        return _id_A4F0::_id_3FFB();
}

_id_A058( var_0 )
{
    self endon( "disconnect" );
    self endon( "finish_death" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self endon( "faux_spawn" );
    self notify( "waitTakeKillstreakWeapon" );
    self endon( "waitTakeKillstreakWeapon" );
    var_1 = self _meth_8311() == "none";
    self waittill( "weapon_change", var_2 );
    var_3 = self _meth_830C();

    if ( _id_A4F0::_id_0CE4( var_3, var_2 ) )
    {
        _id_9125( var_0 );

        if ( !level._id_2153 && !_id_A4F0::_id_5061() )
            self._id_539A = undefined;
    }
    else if ( var_2 != var_0 )
        thread _id_A058( var_0 );
    else if ( var_1 && self _meth_8311() == var_0 )
        thread _id_A058( var_0 );
}

_id_9125( var_0 )
{
    var_1 = 0;
    var_2 = self._id_030D["killstreaks"];

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_2[var_3] ) && isdefined( var_2[var_3]._id_8F20 ) && var_2[var_3]._id_1172 )
        {
            if ( var_0 == _id_A75A::_id_3FF7( var_2[var_3]._id_8F20, var_2[var_3]._id_5D57 ) )
            {
                var_1 = 1;
                break;
            }
        }
    }

    if ( var_1 )
    {
        if ( level._id_2153 || _id_A4F0::_id_5061() )
        {
            if ( isdefined( self._id_539A ) && var_0 != _id_A75A::_id_3FF7( var_2[self._id_539A]._id_8F20, var_2[self._id_539A]._id_5D57 ) )
                self _meth_830F( var_0 );
            else if ( isdefined( self._id_539A ) && var_0 == _id_A75A::_id_3FF7( var_2[self._id_539A]._id_8F20, var_2[self._id_539A]._id_5D57 ) )
            {
                self _meth_830F( var_0 );
                _id_A75A::_id_05C0( var_0, 0 );
                _id_A75A::_id_0634( 4, "weapon", var_0 );
            }
        }
        else
        {
            self _meth_830F( var_0 );
            _id_A75A::_id_05C0( var_0, 0 );
        }
    }
    else
        self _meth_830F( var_0 );
}

_id_84B3( var_0, var_1, var_2, var_3 )
{
    if ( _id_84B2( var_1 ) )
        return 0;

    if ( !var_0 )
        return 1;

    switch ( var_2 )
    {
        case "warbird":
            return _id_A4F0::_id_0CE4( var_3, "warbird_ai_attack" ) || _id_A4F0::_id_0CE4( var_3, "warbird_ai_follow" );
        case "assault_ugv":
        case "zm_ugv":
            return _id_A4F0::_id_0CE4( var_3, "assault_ugv_ai" );
    }

    if ( _id_A75A::_id_518E( var_2 ) )
        return 0;

    return 1;
}

_id_84B2( var_0 )
{
    switch ( var_0 )
    {
        case "killstreak_uav_mp":
            return 1;
        default:
            return 0;
    }
}

_id_3793()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "faux_spawn" );
    self notify( "finishDeathWaiter" );
    self endon( "finishDeathWaiter" );
    self waittill( "death" );
    wait 0.05;
    self notify( "finish_death" );
    self._id_030D["lastEarnedStreak"] = undefined;
}

_id_1D1C()
{
    foreach ( var_1 in self._id_53A0 )
    {
        var_2 = _id_40F4( var_1 );
        var_3 = self._id_0865;
        var_4 = self._id_6F5B;

        if ( _id_51BF( self, var_1 ) )
        {
            var_3 = self._id_086A;
            var_4 = self._id_6F5C;
        }

        if ( var_2 > var_3 && var_3 > var_4 )
            continue;

        if ( var_4 < var_2 && ( var_3 >= var_2 || var_3 <= var_4 ) )
            _id_300C( var_1, var_2 );
    }
}

_id_5397( var_0 )
{
    if ( isdefined( self._id_1E2F ) )
    {
        var_1 = self._id_1E2F;

        if ( var_1 == -1 )
        {
            var_2 = self._id_030D["copyCatLoadout"]["className"];
            var_1 = _id_A75A::_id_3F30( var_2 );

            if ( issubstr( var_2, "practice" ) )
                var_1 = self._id_030D["copyCatLoadout"]["practiceClassNum"];
        }

        if ( issubstr( self._id_1E2E, "custom" ) )
        {
            if ( self _meth_8248( var_1, "assaultStreaks", 0, "streak" ) == var_0 )
                self._id_381D = gettime();
            else if ( self _meth_8248( var_1, "assaultStreaks", 2, "streak" ) == var_0 && isdefined( self._id_381D ) )
            {
                if ( gettime() - self._id_381D < 20000 )
                    thread _id_A7A0::_id_3CA8( "wargasm" );
            }
        }
    }
}

_id_300C( var_0, var_1 )
{
    self._id_300B = var_1;
    var_2 = _id_3FEF( self, var_0 );
    var_3 = getnextkillstreakslotindex( var_0, 1 );
    thread _id_A72E::_id_300A( var_0, var_1, var_2, var_3 );
    thread _id_5397( var_0 );
    self._id_030D["lastEarnedStreak"] = var_0;
    _id_41EB( var_0, 1, 1, self, var_2 );

    if ( _id_A75A::_id_05CB( "specialty_class_hardline" ) )
        _id_A7A0::_id_6FF3( "ch_perk_hardline" );
}

_id_3FEF( var_0, var_1 )
{
    var_2 = [];
    var_3 = getarraykeys( self._id_539D );

    foreach ( var_5 in var_3 )
    {
        var_6 = _id_40F6( var_5 );

        if ( var_6 == var_1 )
            var_2[var_2.size] = var_5;
    }

    return var_2;
}

getnexthordekillstreakslotindex( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = level._id_5383;

    return var_0;
}

_id_41E9( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "givingLoadout" );

    if ( !isdefined( level._id_5398[var_0] ) || tablelookup( level._id_538D, 1, var_0, 0 ) == "" )
        return;

    if ( !isdefined( self._id_030D["killstreaks"] ) )
        return;

    self endon( "disconnect" );
    var_5 = undefined;
    var_6 = self._id_030D["killstreaks"].size;

    if ( isdefined( var_3 ) )
        var_6 = var_3;

    if ( !isdefined( self._id_030D["killstreaks"][var_6] ) )
        self._id_030D["killstreaks"][var_6] = spawnstruct();

    var_7 = self._id_030D["killstreaks"][var_6];
    var_7._id_1172 = 0;
    var_7._id_8F20 = var_0;
    var_7._id_3007 = 0;
    var_7._id_120F = 0;
    var_7._id_02E9 = var_1;
    var_7._id_52F1 = self._id_030D["kID"];
    var_7._id_56F4 = -1;
    var_7._id_5110 = 1;
    var_5 = getnexthordekillstreakslotindex( var_3 );

    if ( !isdefined( var_2 ) || !isarray( var_2 ) )
        var_2 = _id_3FEF( self, var_0 );

    var_7._id_5D57 = var_2;
    self._id_030D["killstreaks"][var_5]._id_60D9 = var_6;
    self._id_030D["killstreaks"][var_5]._id_8F20 = var_0;
    var_8 = _id_A75A::_id_3FEC( var_0 );
    var_9 = "ks_icon" + _id_A4F0::_id_93EB( var_5 );
    self _meth_82FB( var_9, var_8 );

    if ( !var_4 )
    {
        _id_9B71();

        if ( isdefined( level._id_53A4[var_0] ) )
            self [[ level._id_53A4[var_0] ]]();

        self _meth_82FB( "ks_acquired", 1 );
        return;
    }

    var_10 = self._id_030D["killstreaks"][var_5];
    var_10._id_1172 = 1;
    var_10._id_3007 = 0;
    var_10._id_120F = 0;
    var_10._id_02E9 = var_1;
    var_10._id_52F1 = self._id_030D["kID"];

    if ( isdefined( var_2 ) && isarray( var_2 ) )
        var_10._id_5D57 = var_2;
    else
        var_10._id_5D57 = _id_3FEF( self, var_0 );

    self._id_030D["kID"]++;
    var_10._id_56F4 = -1;

    if ( level._id_2153 || _id_A4F0::_id_5061() )
    {
        var_11 = _id_A75A::_id_3FF7( var_0, var_2 );
        _id_41EC( var_11 );

        if ( isdefined( self._id_539A ) )
        {
            var_0 = self._id_030D["killstreaks"][self._id_539A]._id_8F20;
            var_12 = _id_A75A::_id_3FF7( var_0, var_2 );
            var_13 = self _meth_8311();

            if ( var_13 != var_12 && !issubstr( var_13, "turrethead" ) )
                self._id_539A = var_5;
        }
        else
            self._id_539A = var_5;
    }
    else
    {
        if ( level._id_5383 == var_5 && self._id_030D["killstreaks"][level._id_5383]._id_60D9 > level._id_538C )
        {
            var_14 = self._id_030D["killstreaks"][level._id_5383]._id_60D9 - 1;
            var_15 = _id_A75A::_id_3FF7( self._id_030D["killstreaks"][var_14]._id_8F20, self._id_030D["killstreaks"][var_14]._id_5D57 );
            self _meth_830F( var_15 );
        }

        var_12 = _id_A75A::_id_3FF7( var_0, var_2 );
        _id_A75A::_id_05C0( var_12, 0 );
        _id_A75A::_id_0634( var_5 + 4, "weapon", var_12 );
    }

    _id_9B71();

    if ( isdefined( level._id_53A4[var_0] ) )
        self [[ level._id_53A4[var_0] ]]();

    self _meth_82FB( "ks_acquired", 1 );
}

getnextkillstreakslotindex( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( !isdefined( var_1 ) || var_1 == 0 )
    {
        if ( !isdefined( var_2 ) )
            var_3 = level._id_5383;
        else
            var_3 = var_2;
    }
    else
    {
        for ( var_4 = level._id_5388; var_4 < level._id_538C; var_4++ )
        {
            var_5 = self._id_030D["killstreaks"][var_4];

            if ( isdefined( var_5 ) && isdefined( var_5._id_8F20 ) && var_0 == var_5._id_8F20 )
            {
                var_3 = var_4;
                break;
            }
        }
    }

    return var_3;
}

_id_41EB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "givingLoadout" );

    if ( !isdefined( level._id_5398[var_0] ) || tablelookup( level._id_538D, 1, var_0, 0 ) == "" )
        return;

    if ( !isdefined( self._id_030D["killstreaks"] ) )
        return;

    self endon( "disconnect" );
    var_6 = undefined;

    if ( !isdefined( var_1 ) || var_1 == 0 )
    {
        var_7 = self._id_030D["killstreaks"].size;

        if ( isdefined( var_5 ) )
            var_7 = var_5;

        if ( !isdefined( self._id_030D["killstreaks"][var_7] ) )
            self._id_030D["killstreaks"][var_7] = spawnstruct();

        var_8 = self._id_030D["killstreaks"][var_7];
        var_8._id_1172 = 0;
        var_8._id_8F20 = var_0;
        var_8._id_3007 = 0;
        var_8._id_120F = isdefined( var_2 ) && var_2;
        var_8._id_02E9 = var_3;
        var_8._id_52F1 = self._id_030D["kID"];
        var_8._id_56F4 = -1;
        var_8._id_5110 = 1;
        var_6 = getnextkillstreakslotindex( var_0, var_1, var_5 );

        if ( !isdefined( var_4 ) || !isarray( var_4 ) )
            var_4 = _id_3FEF( self, var_0 );

        var_8._id_5D57 = var_4;
        self._id_030D["killstreaks"][var_6]._id_60D9 = var_7;
        self._id_030D["killstreaks"][var_6]._id_8F20 = var_0;
        var_9 = _id_A75A::_id_3FEC( var_0 );
        var_10 = "ks_icon" + _id_A4F0::_id_93EB( var_6 );
        self _meth_82FB( var_10, var_9 );
    }
    else
    {
        var_6 = getnextkillstreakslotindex( var_0, var_1, var_5 );

        if ( !isdefined( var_6 ) )
            return;
    }

    var_14 = self._id_030D["killstreaks"][var_6];
    var_14._id_1172 = 1;
    var_14._id_3007 = isdefined( var_1 ) && var_1;
    var_14._id_120F = isdefined( var_2 ) && var_2;
    var_14._id_02E9 = var_3;
    var_14._id_52F1 = self._id_030D["kID"];

    if ( isdefined( var_4 ) && isarray( var_4 ) )
        var_14._id_5D57 = var_4;
    else
        var_14._id_5D57 = _id_3FEF( self, var_0 );

    self._id_030D["kID"]++;

    if ( !var_14._id_3007 )
        var_14._id_56F4 = -1;
    else
        var_14._id_56F4 = self._id_030D["deaths"];

    if ( level._id_2153 || _id_A4F0::_id_5061() )
    {
        var_15 = _id_A75A::_id_3FF7( var_0, var_4 );
        _id_41EC( var_15 );

        if ( isdefined( self._id_539A ) )
        {
            var_0 = self._id_030D["killstreaks"][self._id_539A]._id_8F20;
            var_16 = _id_A75A::_id_3FF7( var_0, var_4 );
            var_17 = self _meth_8311();

            if ( var_17 != var_16 && !issubstr( var_17, "turrethead" ) )
                self._id_539A = var_6;
        }
        else
            self._id_539A = var_6;
    }
    else
    {
        if ( level._id_5383 == var_6 && self._id_030D["killstreaks"][level._id_5383]._id_60D9 > level._id_538C )
        {
            var_18 = self._id_030D["killstreaks"][level._id_5383]._id_60D9 - 1;
            var_19 = _id_A75A::_id_3FF7( self._id_030D["killstreaks"][var_18]._id_8F20, self._id_030D["killstreaks"][var_18]._id_5D57 );
            self _meth_830F( var_19 );
        }

        var_16 = _id_A75A::_id_3FF7( var_0, var_4 );
        _id_A75A::_id_05C0( var_16, 0 );
        _id_A75A::_id_0634( var_6 + 4, "weapon", var_16 );
    }

    _id_9B71();

    if ( isdefined( level._id_53A4[var_0] ) )
        self [[ level._id_53A4[var_0] ]]();

    if ( isdefined( var_1 ) && var_1 && isdefined( var_2 ) && var_2 )
        self notify( "received_earned_killstreak" );

    self _meth_82FB( "ks_acquired", 1 );
}

_id_41EC( var_0 )
{
    self endon( "disconnect" );

    if ( !level._id_2153 && !_id_A4F0::_id_5061() )
        return;

    var_1 = self _meth_82CF();

    foreach ( var_3 in var_1 )
    {
        if ( !_id_A75A::_id_51B7( var_3, "killstreak_" ) && !_id_A75A::_id_51B7( var_3, "airdrop_" ) && !_id_A75A::_id_51B7( var_3, "deployable_" ) )
            continue;

        if ( self _meth_8311() == var_3 )
            continue;

        while ( _id_A75A::_id_50DB() )
            wait 0.05;

        self _meth_830F( var_3 );
    }

    if ( isdefined( self._id_539A ) )
    {
        var_5 = self._id_030D["killstreaks"][self._id_539A]._id_8F20;
        var_6 = self._id_030D["killstreaks"][self._id_539A]._id_5D57;
        var_7 = _id_A75A::_id_3FF7( var_5, var_6 );

        if ( self _meth_8311() != var_7 )
        {
            _id_A75A::_id_05C0( var_0, 0 );
            _id_A75A::_id_0634( 4, "weapon", var_0 );
            return;
        }
    }
    else
    {
        _id_A75A::_id_05C0( var_0, 0 );
        _id_A75A::_id_0634( 4, "weapon", var_0 );
    }
}

_id_40F7( var_0 )
{
    return int( tablelookup( level._id_53D9, level._id_53D6, var_0, level._id_53D4 ) );
}

_id_40F6( var_0 )
{
    return tablelookup( level._id_53D9, level._id_53D6, var_0, level._id_53D5 );
}

_id_3EE9( var_0 )
{
    var_1 = 0;
    var_2 = getarraykeys( self._id_539D );

    foreach ( var_4 in var_2 )
    {
        var_5 = _id_40F6( var_4 );

        if ( var_5 == var_0 )
            var_1 += self._id_539D[var_4];
    }

    return var_1;
}

_id_40F4( var_0 )
{
    var_1 = int( _id_A75A::_id_3FEE( var_0 ) );

    if ( isplayer( self ) )
        var_1 += _id_3EE9( var_0 );

    if ( isdefined( self ) && isplayer( self ) )
    {
        if ( var_1 > 100 && _id_A75A::_id_05CB( "specialty_hardline" ) )
            var_1 -= 100;
    }

    return var_1;
}

_id_3FEA( var_0 )
{
    return tablelookupistring( level._id_538D, 1, var_0, 5 );
}

_id_3FED( var_0 )
{
    return int( tablelookup( level._id_538D, 1, var_0, 10 ) );
}

_id_3FE3( var_0 )
{
    return tablelookup( level._id_538D, 1, var_0, 7 );
}

_id_3FE1( var_0, var_1 )
{
    var_2 = 14;

    if ( isdefined( var_1 ) && var_1.size > 0 )
    {
        switch ( var_1.size )
        {
            case 1:
                var_2 = 15;
                break;
            case 2:
                var_2 = 16;
                break;
            case 3:
                var_2 = 17;
                break;
            default:
                break;
        }
    }

    return tablelookup( level._id_538D, 1, var_0, var_2 );
}

_id_41F4( var_0 )
{
    var_1 = self._id_030D["killstreaks"];

    if ( level._id_2153 || _id_A4F0::_id_5061() )
    {
        var_2 = -1;
        var_3 = -1;

        for ( var_4 = 0; var_4 < level._id_538C; var_4++ )
        {
            if ( isdefined( var_1[var_4] ) && isdefined( var_1[var_4]._id_8F20 ) && var_1[var_4]._id_1172 && _id_40F4( var_1[var_4]._id_8F20 ) > var_3 )
            {
                var_3 = 0;

                if ( !var_1[var_4]._id_5110 )
                    var_3 = _id_40F4( var_1[var_4]._id_8F20 );

                var_2 = var_4;
            }
        }

        if ( var_2 != -1 )
        {
            self._id_539A = var_2;
            var_5 = var_1[self._id_539A]._id_8F20;
            var_6 = self._id_030D["killstreaks"][self._id_539A]._id_5D57;
            var_7 = _id_A75A::_id_3FF7( var_5, var_6 );
            _id_41EC( var_7 );
        }
        else
            self._id_539A = undefined;
    }
    else
    {
        var_2 = -1;
        var_3 = -1;

        for ( var_4 = 0; var_4 < level._id_538C; var_4++ )
        {
            if ( isdefined( var_1[var_4] ) && isdefined( var_1[var_4]._id_8F20 ) && var_1[var_4]._id_1172 )
            {
                var_8 = _id_A75A::_id_3FF7( var_1[var_4]._id_8F20, var_1[var_4]._id_5D57 );
                var_9 = self _meth_82CF();
                var_10 = 0;

                for ( var_11 = 0; var_11 < var_9.size; var_11++ )
                {
                    if ( var_8 == var_9[var_11] )
                    {
                        var_10 = 1;
                        break;
                    }
                }

                if ( !var_10 )
                    _id_A75A::_id_05C0( var_8 );
                else if ( issubstr( var_8, "airdrop_" ) )
                    self _meth_82F6( var_8, 1 );

                _id_A75A::_id_0634( var_4 + 4, "weapon", var_8 );

                if ( _id_40F4( var_1[var_4]._id_8F20 ) > var_3 )
                {
                    var_3 = 0;

                    if ( !var_1[var_4]._id_5110 )
                        var_3 = _id_40F4( var_1[var_4]._id_8F20 );

                    var_2 = var_4;
                }
            }
        }

        if ( var_2 != -1 )
            var_5 = var_1[var_2]._id_8F20;

        self._id_539A = undefined;
    }

    _id_9B71();
}

_id_6D85()
{
    if ( !isdefined( self._id_7326 ) )
        return;

    self endon( "rideKillstreakComplete" );
    self waittill( "rideKillstreakFailed" );
}

_id_6D84()
{
    if ( !isdefined( self._id_7326 ) )
        return;

    self endon( "rideKillstreakBlack" );
    self waittill( "rideKillstreakFailed" );
}

_id_4E00( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    _id_6C85();
    _id_A4F0::_id_0586();
    _id_A75A::_id_3A30( 1 );
    self._id_7326 = 1;
    var_4 = _id_4E01( var_0, var_1, var_2, var_3 );

    if ( isdefined( self ) )
    {
        _id_A75A::_id_3A30( 0 );
        _id_A4F0::_id_0594();
        self._id_7326 = undefined;

        if ( var_4 == "success" )
            self notify( "rideKillstreakBlack" );
        else
        {
            _id_A75A::_id_6D2C();
            self notify( "rideKillstreakFailed" );
        }
    }

    return var_4;
}

_id_4E01( var_0, var_1, var_2, var_3 )
{
    thread _id_7452();
    var_4 = "none";
    var_5 = 0.75;

    if ( isdefined( var_0 ) && var_0 == "coop" )
        var_5 = 0.05;

    var_4 = _id_A4F0::_id_A06A( var_5, "disconnect", "death", "weapon_switch_started" );
    _id_A79A::_id_A0D4();

    if ( var_4 == "disconnect" )
        return "disconnect";

    if ( var_4 == "death" )
        return "fail";

    if ( var_4 == "weapon_switch_started" )
        return "fail";

    if ( !isdefined( self ) || !isalive( self ) )
        return "fail";

    if ( !self _meth_8341() && !self _meth_8068() )
        return "fail";

    if ( isdefined( self._id_99FC ) && self._id_99FC )
        return "fail";

    if ( level._id_3BD8 )
        return "fail";

    if ( _id_A75A::_id_50F6() || _id_A75A::_id_50AB() )
        return "fail";

    _id_A75A::_id_6D2B();
    _id_6C85();

    if ( var_1 )
    {
        if ( !isdefined( var_2 ) )
            var_2 = 1.0;
    }
    else
    {
        if ( !isdefined( var_2 ) )
            var_2 = 0.8;

        self _meth_82FB( "ui_killstreak_blackout", 1 );
        self _meth_82FB( "ui_killstreak_blackout_fade_end", gettime() + int( var_2 * 1000 ) );
        thread _id_1F00();
        thread clearrideintroonroundtransition();
    }

    var_4 = _id_A4F0::_id_A06A( var_2, "disconnect", "death" );

    if ( var_4 == "disconnect" || !isdefined( self ) )
        return "disconnect";

    if ( !isdefined( var_3 ) )
        var_3 = 0.6;

    if ( var_1 )
        self notify( "intro_cleared" );
    else
        thread _id_1EFF( var_3 );

    if ( var_4 == "death" )
        return "fail";

    if ( !isdefined( self ) || !isalive( self ) )
        return "fail";

    if ( !self _meth_8341() && !self _meth_8068() )
        return "fail";

    if ( isdefined( self._id_99FC ) && self._id_99FC )
        return "fail";

    if ( level._id_3BD8 )
        return "fail";

    if ( _id_A75A::_id_50F6() || _id_A75A::_id_50AB() )
        return "fail";

    _id_A79A::_id_A0D4();
    return "success";
}

_id_1EFF( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );

    if ( isdefined( var_0 ) )
        _id_A79A::_id_A049( var_0 );

    var_1 = 0.5;
    self _meth_82FB( "ui_killstreak_blackout", 0 );
    self _meth_82FB( "ui_killstreak_blackout_fade_end", gettime() + int( var_1 * 1000 ) );
    wait(var_1);

    if ( !isdefined( self ) )
        return;

    self notify( "rideKillstreakComplete" );
}

_id_7452()
{
    self endon( "rideKillstreakComplete" );
    self endon( "rideKillstreakFailed" );
    self waittill( "joined_team" );
    _id_A75A::_id_3A30( 0 );
    self._id_7326 = undefined;

    if ( self._id_2B09 )
        _id_A4F0::_id_0594();

    if ( _id_A75A::_id_51E0() )
        _id_A75A::_id_1F0D();
}

_id_1F00()
{
    self endon( "rideKillstreakComplete" );
    self endon( "rideKillstreakFailed" );
    self waittill( "joined_team" );
    self _meth_82FB( "ui_killstreak_blackout", 0 );
    self _meth_82FB( "ui_killstreak_blackout_fade_end", 0 );
    _id_A75A::_id_6D2C();
    self notify( "rideKillstreakComplete" );
}

clearrideintroonroundtransition()
{
    self endon( "rideKillstreakComplete" );
    self endon( "rideKillstreakFailed" );
    level waittill( "game_ended" );
    self _meth_82FB( "ui_killstreak_blackout", 0 );
    self _meth_82FB( "ui_killstreak_blackout_fade_end", 0 );
    _id_A75A::_id_6D2C();
    self notify( "rideKillstreakComplete" );
}

_id_6C85()
{
    if ( self _meth_8341() )
    {
        var_0 = bullettrace( self._id_02E6 + ( 0, 0, 5 ), self._id_02E6 + ( 0, 0, -5 ), 0 );

        if ( isdefined( var_0["glass"] ) )
            destroyglass( var_0["glass"] );
    }
}

_id_4200()
{
    var_0 = self._id_030D["killstreaks"][self._id_539A]._id_8F20;
    var_1 = self._id_030D["killstreaks"][self._id_539A]._id_5D57;
    var_2 = _id_A75A::_id_3FF7( var_0, var_1 );
    _id_41EC( var_2 );
    _id_9B71();
}

_id_3FE0()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_538C; var_1++ )
    {
        if ( isdefined( self._id_030D["killstreaks"][var_1] ) && isdefined( self._id_030D["killstreaks"][var_1]._id_8F20 ) && self._id_030D["killstreaks"][var_1]._id_1172 )
            var_0++;
    }

    return var_0;
}

_id_8540()
{
    if ( _id_3FE0() > 1 )
    {
        for (;;)
        {
            self._id_539A++;

            if ( self._id_539A >= level._id_538C )
                self._id_539A = 0;

            if ( self._id_030D["killstreaks"][self._id_539A]._id_1172 == 1 )
                break;
        }

        _id_4200();
    }
}

_id_853F()
{
    if ( _id_3FE0() > 1 )
    {
        for (;;)
        {
            self._id_539A--;

            if ( self._id_539A < 0 )
                self._id_539A = level._id_538C - 1;

            if ( self._id_030D["killstreaks"][self._id_539A]._id_1172 == 1 )
                break;
        }

        _id_4200();
    }
}

_id_8F25()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "horde_end_spectate" );

    for (;;)
    {
        self waittill( "toggled_up" );

        if ( !level._id_2153 && !_id_A4F0::_id_5061() )
            continue;

        if ( _id_1AEB() )
            _id_8540();

        wait 0.12;
    }
}

_id_8F24()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    if ( isdefined( level._id_511A ) && level._id_511A )
        self endon( "horde_end_spectate" );

    for (;;)
    {
        self waittill( "toggled_down" );

        if ( !level._id_2153 && !_id_A4F0::_id_5061() )
            continue;

        if ( _id_1AEB() )
            _id_853F();

        wait 0.12;
    }
}

_id_1AEB()
{
    return !self _meth_82E0() && ( !isdefined( self._id_1C87 ) || isdefined( self._id_1C87 ) && self._id_1C87 == "none" ) && _id_1AEC() && ( !isdefined( self._id_50D7 ) || isdefined( self._id_50D7 ) && self._id_50D7 == 0 );
}

_id_1AEC()
{
    var_0 = self _meth_8311();
    return !_id_A75A::_id_513A( var_0 ) || _id_A75A::_id_513A( var_0 ) && _id_A75A::_id_512E();
}

_id_8F21()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "faux_spawn" );

    if ( isbot( self ) )
        return;

    _id_A75A::_id_3BDF( "prematch_done" );
    self _meth_82DD( "toggled_up", "+actionslot 1" );
    self _meth_82DD( "toggled_down", "+actionslot 2" );

    if ( !level._id_2153 )
    {
        self _meth_82DD( "streakUsed1", "+actionslot 4" );
        self _meth_82DD( "streakUsed2", "+actionslot 5" );
        self _meth_82DD( "streakUsed3", "+actionslot 6" );
        self _meth_82DD( "streakUsed4", "+actionslot 7" );
        self _meth_82DD( "streakUsed5", "+actionslot 8" );
    }
}

_id_41DC( var_0 )
{
    if ( !var_0 )
        return;

    var_1 = self._id_0865 + var_0;
    var_2 = _id_401E( 0 );

    if ( var_1 >= var_2 )
        var_1 -= var_2;

    _id_7F10( var_1 );
    var_1 = self._id_086A + var_0;
    var_2 = _id_401E( 1 );

    if ( var_1 >= var_2 )
        var_1 -= var_2;

    _id_7F11( var_1 );
    _id_9B70();
    _id_1D1C();
}

_id_765B( var_0 )
{
    if ( int( var_0 ) != var_0 )
        return int( var_0 + 1 );
    else
        return int( var_0 );
}

_id_41DB( var_0 )
{
    var_1 = _id_A7AA::_id_40BF( var_0 );

    if ( _id_A75A::_id_5186( self ) )
        _id_41DC( var_1 );

    _id_2B63( var_0, var_1 );
}

_id_2B63( var_0, var_1 )
{
    if ( !level._id_46C7 )
        thread _id_A7AA::_id_A39D( var_0, var_1 );
}

_id_7440( var_0 )
{
    self._id_300B = 0;
    _id_7F10( 0 );

    if ( var_0 )
    {
        _id_7F11( 0 );
        self._id_030D["ks_totalPointsSupport"] = 0;
    }

    _id_9B70();
    self._id_030D["ks_totalPoints"] = 0;
    self._id_030D["lastEarnedStreak"] = undefined;
}

_id_7F10( var_0 )
{
    if ( var_0 < 0 )
        var_0 = 0;

    if ( isdefined( self._id_0865 ) && self._id_0865 != 0 )
        self._id_6F5B = self._id_0865;
    else
        self._id_6F5B = 0;

    self._id_0865 = var_0;
    self._id_030D["ks_totalPoints"] = self._id_0865;
}

_id_7F11( var_0 )
{
    if ( var_0 < 0 )
        var_0 = 0;

    if ( isdefined( self._id_086A ) && self._id_086A != 0 )
        self._id_6F5C = self._id_086A;
    else
        self._id_6F5C = 0;

    self._id_086A = var_0;
    self._id_030D["ks_totalPointsSupport"] = self._id_086A;
}

pc_watchcontrolschanged()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = _id_A4F0::_id_5061();

    for (;;)
    {
        if ( _id_A75A::_id_5128() || _id_A75A::_id_51E0() || _id_A75A::_id_50DB() )
        {
            while ( _id_A75A::_id_5128() || _id_A75A::_id_51E0() || _id_A75A::_id_50DB() )
                waittillframeend;

            waittillframeend;
        }

        if ( var_0 != _id_A4F0::_id_5061() )
        {
            thread _id_9B24( 1 );
            var_0 = _id_A4F0::_id_5061();
        }

        waittillframeend;
    }
}

_id_673C()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "faux_spawn" );
    self._id_06F2 = [];
    self._id_06F2[level._id_5383] = 1;
    self._id_06F2[level._id_5388] = 1;
    self._id_06F2[level._id_5389] = 1;
    self._id_06F2[level._id_538A] = 1;
    self._id_06F2[level._id_538B] = 1;

    if ( !isbot( self ) )
        thread pc_watchcontrolschanged();

    for (;;)
    {
        var_0 = _id_A4F0::_id_A067( "streakUsed1", "streakUsed2", "streakUsed3", "streakUsed4", "streakUsed5" );

        if ( _id_A4F0::_id_5061() )
            continue;

        if ( !isdefined( var_0 ) )
            continue;

        if ( isdefined( self._id_1C87 ) && self._id_1C87 == "none" )
            continue;

        switch ( var_0 )
        {
            case "streakUsed1":
                if ( self._id_030D["killstreaks"][level._id_5383]._id_1172 && self._id_06F2[level._id_5383] )
                    self._id_539A = level._id_5383;

                break;
            case "streakUsed2":
                if ( self._id_030D["killstreaks"][level._id_5388]._id_1172 && self._id_06F2[level._id_5388] )
                    self._id_539A = level._id_5388;

                break;
            case "streakUsed3":
                if ( self._id_030D["killstreaks"][level._id_5389]._id_1172 && self._id_06F2[level._id_5389] )
                    self._id_539A = level._id_5389;

                break;
            case "streakUsed4":
                if ( self._id_030D["killstreaks"][level._id_538A]._id_1172 && self._id_06F2[level._id_538A] )
                    self._id_539A = level._id_538A;

                break;
            case "streakUsed5":
                if ( self._id_030D["killstreaks"][level._id_538B]._id_1172 && self._id_06F2[level._id_538B] )
                    self._id_539A = level._id_538B;

                break;
        }

        if ( isdefined( self._id_539A ) && !self._id_030D["killstreaks"][self._id_539A]._id_1172 )
            self._id_539A = undefined;

        if ( isdefined( self._id_539A ) )
        {
            if ( !isbot( self ) )
                _id_2B15();

            for (;;)
            {
                self waittill( "weapon_change", var_1 );

                if ( isdefined( self._id_539A ) )
                {
                    var_2 = _id_A75A::_id_3FF7( self._id_030D["killstreaks"][self._id_539A]._id_8F20, self._id_030D["killstreaks"][self._id_539A]._id_5D57 );

                    if ( var_1 == var_2 || var_1 == "none" || var_2 == "killstreak_uav_mp" && var_1 == "uav_remote_mp" || var_2 == "killstreak_recreation_mp" && var_1 == "uav_remote_mp" )
                        continue;

                    break;
                }

                break;
            }

            if ( !isbot( self ) )
                _id_3110();

            self._id_539A = undefined;
        }
    }
}

_id_2B15()
{
    for ( var_0 = 0; var_0 < level._id_538C; var_0++ )
    {
        if ( !isdefined( self._id_539A ) )
            break;

        if ( self._id_539A == var_0 )
            continue;

        _id_A75A::_id_0634( var_0 + 4, "" );
        self._id_06F2[var_0] = 0;
    }
}

_id_3110()
{
    for ( var_0 = 0; var_0 < level._id_538C; var_0++ )
    {
        if ( self._id_030D["killstreaks"][var_0]._id_1172 )
        {
            var_1 = _id_A75A::_id_3FF7( self._id_030D["killstreaks"][var_0]._id_8F20, self._id_030D["killstreaks"][var_0]._id_5D57 );
            _id_A75A::_id_0634( var_0 + 4, "weapon", var_1 );
        }
        else
            _id_A75A::_id_0634( var_0 + 4, "" );

        self._id_06F2[var_0] = 1;
    }
}

_id_5399( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) && isplayer( var_0 ) && isdefined( var_2._id_02E9 ) && isdefined( var_2._id_02E9._id_04A8 ) )
    {
        if ( ( level._id_91E4 && var_2._id_02E9._id_04A8 != var_0._id_04A8 || !level._id_91E4 ) && var_0 != var_2._id_02E9 )
        {
            if ( _id_A75A::_id_513A( var_1 ) )
                return;

            if ( !isdefined( var_0._id_55A8[var_1] ) )
                var_0._id_55A8[var_1] = 0;

            if ( var_0._id_55A8[var_1] == gettime() )
                return;

            var_0._id_55A8[var_1] = gettime();
            var_0 thread _id_A789::_id_930E( var_1, 1, "hits" );
            var_3 = var_0 _id_A7A4::_id_8D63( "totalShots" );
            var_4 = var_0 _id_A7A4::_id_8D63( "hits" ) + 1;

            if ( var_4 <= var_3 )
            {
                var_0 _id_A7A4::_id_8D73( "hits", var_4 );
                var_0 _id_A7A4::_id_8D73( "misses", int( var_3 - var_4 ) );
                var_5 = clamp( float( var_4 ) / float( var_3 ), 0.0, 1.0 ) * 10000.0;
                var_0 _id_A7A4::_id_8D73( "accuracy", int( var_5 ) );
            }
        }
    }
}
