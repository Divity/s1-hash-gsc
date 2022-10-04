// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_752B = [];
    level._id_752B[level._id_752B.size] = "riotshield_mp";
    level._id_752B[level._id_752B.size] = "iw5_riotshieldt6_mp";
    level._id_752B[level._id_752B.size] = "iw5_riotshieldt6loot0_mp";
    level._id_752B[level._id_752B.size] = "iw5_riotshieldt6loot1_mp";
    level._id_752B[level._id_752B.size] = "iw5_riotshieldt6loot2_mp";
    level._id_752B[level._id_752B.size] = "iw5_riotshieldt6loot3_mp";
    level._id_752B[level._id_752B.size] = "iw5_riotshieldjugg_mp";
    _id_6ED1();
    level._id_752A = getent( "riot_shield_collision", "targetname" );
    level._id_058F["riot_shield_shock_fx"] = loadfx( "vfx/explosion/riotshield_stun" );
    level._id_058F["riot_shield_deploy_smoke"] = loadfx( "vfx/smoke/riotshield_deploy_smoke" );
    level._id_058F["riot_shield_deploy_lights"] = loadfx( "vfx/lights/riotshield_deploy_lights" );
}

_id_6ED1()
{
    map_restart( "npc_deployable_riotshield_stand_deploy" );
    map_restart( "npc_deployable_riotshield_stand_destroyed" );
    map_restart( "npc_deployable_riotshield_stand_shot" );
    map_restart( "npc_deployable_riotshield_stand_shot_back" );
    map_restart( "npc_deployable_riotshield_stand_melee_front" );
    map_restart( "npc_deployable_riotshield_stand_melee_back" );
}

_id_473D()
{
    return isdefined( self._id_3AD7 ) || isdefined( self._id_1259 );
}

_id_473E()
{
    return isdefined( self._id_3AD7 );
}

_id_A2D1( var_0 )
{
    if ( !isdefined( level._id_752B ) )
        return 0;

    var_1 = getweaponbasename( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    foreach ( var_3 in level._id_752B )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

_id_A2D2( var_0 )
{
    if ( !_id_A2D1( var_0 ) )
        return 0;

    return issubstr( var_0, "shockplant" );
}

_id_4064( var_0 )
{
    var_1 = 0;
    var_2 = self _meth_830C();

    foreach ( var_4 in var_2 )
    {
        if ( _id_A2D1( var_4 ) )
        {
            if ( var_4 == var_0 && !var_1 )
            {
                var_1 = 1;
                continue;
            }

            return var_4;
        }
    }

    return undefined;
}

_id_9B16( var_0 )
{
    self._id_3AD7 = undefined;
    self._id_1259 = undefined;

    if ( !isdefined( var_0 ) )
        var_0 = self _meth_8312();

    if ( _id_A2D1( var_0 ) )
        self._id_3AD7 = getweaponmodel( var_0 );

    var_1 = _id_4064( var_0 );

    if ( isdefined( var_1 ) )
        self._id_1259 = getweaponmodel( var_1 );

    self _meth_84C6( var_0 );
}

_id_7532()
{
    self._id_3AD7 = undefined;
    self._id_1259 = undefined;
}

_id_330B()
{
    if ( !self _meth_8068() )
        return 0;

    var_0 = self _meth_8531();

    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "tag_inhand":
        case "tag_weapon_left":
        case "tag_shield_back":
            return 1;
    }

    return 0;
}

_id_A24B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    thread _id_9505();

    for (;;)
    {
        self waittill( "raise_riotshield" );
        thread _id_8D34();
    }
}

_id_7547()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "riotshield_change_weapon" );
    var_0 = undefined;
    self waittill( "weapon_change", var_0 );
    self notify( "riotshield_change_weapon", var_0 );
}

_id_754B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "riotshield_change_weapon" );
    var_0 = undefined;

    for (;;)
    {
        self waittill( "weapon_switch_started", var_0 );

        if ( self _meth_801A() )
        {
            thread _id_754A();
            break;
        }

        if ( isdefined( self._id_3AD7 ) && isdefined( self._id_1259 ) )
        {
            wait 0.5;
            break;
        }
    }

    self notify( "riotshield_change_weapon", var_0 );
}

_id_754A()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "weapon_change" );

    while ( self _meth_801A() )
        waittillframeend;

    self notify( "riotshield_change_weapon", self _meth_8312() );
}

_id_7548()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "riotshield_change_weapon" );
    var_0 = undefined;
    var_1 = _id_A735::_id_3D5C();
    self waittillmatch( "grenade_pullback", var_1 );

    while ( !isdefined( self._id_34E9 ) || !self._id_34E9 )
        waittillframeend;

    self notify( "riotshield_change_weapon", var_1 );
}

_id_7549()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "riotshield_change_weapon" );

    if ( !isdefined( self._id_34E9 ) || !self._id_34E9 )
        return;

    var_0 = undefined;
    var_1 = _id_A735::_id_3D5C();
    self waittillmatch( "battery_discharge_end", var_1 );

    while ( isdefined( self._id_34E9 ) && self._id_34E9 )
        waittillframeend;

    self notify( "riotshield_change_weapon", self _meth_8311() );
}

watchriotshieldloadout()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "track_riot_shield" );
    self waittill( "applyLoadout" );
    _id_9B16( self _meth_8311() );
}

_id_9505()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self notify( "track_riot_shield" );
    self endon( "track_riot_shield" );
    _id_9B16( self._id_252E );
    thread watchriotshieldloadout();
    self._id_55C2 = "none";

    for (;;)
    {
        thread _id_A249();
        var_0 = self _meth_8311();

        if ( isdefined( self._id_34E9 ) && self._id_34E9 )
            var_0 = _id_A735::_id_3D5C();

        thread _id_7547();
        thread _id_754B();
        thread _id_7548();
        thread _id_7549();
        self waittill( "riotshield_change_weapon", var_1 );

        if ( _id_A2D1( var_1 ) )
        {
            if ( _id_473D() )
            {
                if ( isdefined( self._id_7553 ) )
                {
                    self _meth_830F( self._id_7553 );
                    self._id_7553 = undefined;
                }
            }

            if ( _id_51EE( var_0 ) )
                self._id_55C2 = var_0;
        }

        _id_9B52( var_1 );
    }
}

_id_9B52( var_0 )
{
    if ( self _meth_82E0() && var_0 == "none" )
        return;

    _id_9B16( var_0 );
}

_id_A249()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "track_riot_shield" );
    self notify( "watch_riotshield_pickup" );
    self endon( "watch_riotshield_pickup" );
    self waittill( "pickup_riotshield" );
    self endon( "weapon_change" );
    wait 0.5;
    _id_9B52( self _meth_8311() );
}

_id_51EE( var_0 )
{
    if ( _id_A75A::_id_513A( var_0 ) )
        return 0;

    if ( var_0 == "none" )
        return 0;

    if ( _id_A781::_id_51E7( var_0, 1 ) || _id_A781::_id_51E7( var_0, 0 ) )
        return 0;

    if ( _id_A2D1( var_0 ) )
        return 0;

    if ( weaponclass( var_0 ) == "ball" )
        return 0;

    return 1;
}

_id_8D34()
{
    thread _id_A248();
}

_id_4676()
{
    var_0 = self._id_754F;
    var_1 = 10;
    var_2 = 50;
    var_3 = 150;
    var_4 = var_3 * var_3;
    var_5 = self._id_754F._id_02E6 + ( 0, 0, -25 );
    self _meth_81D5( var_5, var_3, var_2, var_1, self, "MOD_EXPLOSIVE" );
    playfx( level._id_058F["riot_shield_shock_fx"], var_5, anglestoforward( self._id_754F._id_0041 + ( -90, 0, 0 ) ) );

    foreach ( var_7 in level._id_0328 )
    {
        if ( _id_A75A::_id_5186( var_7 ) && !_func_285( var_7, self ) )
        {
            if ( distancesquared( var_5, var_7._id_02E6 ) < var_4 )
                var_7 _meth_8182( "concussion_grenade_mp", 1 );
        }
    }
}

_id_A248()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "start_riotshield_deploy" );
    self endon( "start_riotshield_deploy" );
    self waittill( "startdeploy_riotshield" );
    self _meth_809A( "wpn_riot_shield_plant_mech" );
    self waittill( "deploy_riotshield", var_0 );

    if ( isdefined( self._id_754F ) )
    {
        self._id_754F thread _id_25B0();
        waittillframeend;
    }

    var_1 = self _meth_8311();
    self _meth_845D( var_1, 0 );
    var_2 = _id_A2D2( var_1 );
    self _meth_809A( "wpn_riot_shield_plant_punch" );

    if ( var_2 )
        self _meth_809A( "wpn_riot_shield_blast_punch" );

    var_3 = 0;

    if ( var_0 )
    {
        var_4 = self _meth_84C1();

        if ( var_4["result"] && _id_754E( var_4["origin"] ) )
        {
            var_5 = 28;
            var_6 = _id_8A03( var_4["origin"] + ( 0, 0, var_5 ), var_4["angles"] );
            var_7 = _id_8A02( var_4["origin"] + ( 0, 0, var_5 ), var_4["angles"], var_6 );
            var_8 = _func_29D( self, var_6 );
            var_9 = self _meth_830C();
            self._id_7552 = var_8;
            self._id_754F = var_6;
            self._id_754D = var_7;

            if ( var_2 )
                thread _id_4676();
            else
                playfxontag( _id_A4F0::_id_3FA6( "riot_shield_deploy_smoke" ), var_6, "tag_weapon" );

            var_6 _meth_827B( "npc_deployable_riotshield_stand_deploy" );
            thread _id_8A07( var_6 );
            var_10 = 0;

            if ( self._id_55C2 != "none" && self _meth_8314( self._id_55C2 ) )
                self _meth_8316( self._id_55C2 );
            else if ( var_9.size > 0 )
                self _meth_8316( var_9[0] );
            else
                var_10 = 1;

            if ( !self _meth_8314( "iw5_combatknife_mp" ) )
            {
                self _meth_830E( "iw5_combatknife_mp" );
                self._id_7553 = "iw5_combatknife_mp";
            }

            if ( var_10 )
                self _meth_8316( "iw5_combatknife_mp" );

            var_11 = spawnstruct();
            var_11._id_2662 = ::_id_25B0;
            var_6 thread _id_A747::_id_45BC( var_11 );
            thread _id_A208();
            thread _id_2868( self._id_7552 );
            thread _id_2869( self._id_7552, self._id_754F );
            thread _id_2867( var_6 );

            if ( isdefined( var_4["entity"] ) )
                thread deleteshieldongrounddelete( var_4["entity"] );

            self._id_754F thread _id_A207();
            level notify( "riotshield_planted", self );
        }
        else
        {
            var_3 = 1;
            var_12 = weaponclipsize( var_1 );
            self _meth_82F6( var_1, var_12 );
        }
    }
    else
        var_3 = 1;

    if ( var_3 )
        self _meth_84C2();
}

_id_8A07( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    wait 0.6;
    playfxontag( _id_A4F0::_id_3FA6( "riot_shield_deploy_lights" ), var_0, "tag_weapon" );
}

_id_754E( var_0 )
{
    var_1 = getdvarfloat( "riotshield_deploy_limit_radius" );
    var_1 *= var_1;

    foreach ( var_3 in level._id_0328 )
    {
        if ( isdefined( var_3._id_754F ) )
        {
            var_4 = distancesquared( var_3._id_754F._id_02E6, var_0 );

            if ( var_1 > var_4 )
                return 0;
        }
    }

    return 1;
}

_id_8A03( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2._id_04A7 = "riotshield_mp";
    var_2._id_0041 = var_1;
    var_3 = undefined;
    var_4 = self _meth_8312();

    if ( _id_A2D1( var_4 ) )
        var_3 = getweaponmodel( var_4 );

    if ( !isdefined( var_3 ) )
        var_3 = "npc_deployable_riot_shield_base";

    var_2 _meth_80B1( var_3 );
    var_2._id_02E9 = self;
    var_2._id_04A8 = self._id_04A8;
    return var_2;
}

_id_8A02( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", var_0, 1 );
    var_3._id_04A7 = "riotshield_coll_mp";
    var_3._id_0041 = var_1;
    var_3 _meth_80B1( "tag_origin" );
    var_3._id_02E9 = self;
    var_3._id_04A8 = self._id_04A8;
    var_3 _meth_8278( level._id_752A );
    var_3 _meth_8057();
    var_3 _meth_8553( 0 );
    return var_3;
}

_id_A208()
{
    self waittill( "destroy_riotshield" );

    if ( isdefined( self._id_7552 ) )
        self._id_7552 delete();

    if ( isdefined( self._id_754D ) )
    {
        self._id_754D _meth_8058();
        self._id_754D delete();
    }

    if ( isdefined( self._id_754F ) )
        self._id_754F delete();
}

_id_2869( var_0, var_1 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 waittill( "trigger", var_2 );
    _func_2CD( var_2, var_1 );
    self notify( "destroy_riotshield" );
}

_id_2868( var_0 )
{
    level endon( "game_ended" );
    var_0 waittill( "death" );
    self notify( "destroy_riotshield" );
}

_id_2867( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "damageThenDestroyRiotshield" );
    _id_A4F0::_id_A060( "death", "disconnect", "remove_planted_weapons" );
    var_0 thread _id_25B0();
}

deleteshieldongrounddelete( var_0 )
{
    level endon( "game_ended" );
    var_0 _id_A4F0::_id_A060( "death", "hidingLightingState" );
    self notify( "destroy_riotshield" );
}

_id_A207()
{
    self endon( "death" );
    var_0 = getdvarint( "riotshield_deployed_health" );
    self._id_0102 = 0;
    var_1 = 0;

    for (;;)
    {
        self._id_0275 = 100000;
        self._id_01E7 = self._id_0275;
        self waittill( "damage", var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );

        if ( !isdefined( var_3 ) )
            continue;

        if ( isplayer( var_3 ) )
        {
            if ( level._id_91E4 && var_3._id_04A8 == self._id_02E9._id_04A8 && var_3 != self._id_02E9 )
                continue;
        }

        var_12 = 0;
        var_13 = 0;

        if ( _id_A75A::_id_514D( var_6 ) )
        {
            var_12 = 1;
            var_2 *= getdvarfloat( "riotshield_melee_damage_scale" );
        }
        else if ( var_6 == "MOD_PISTOL_BULLET" || var_6 == "MOD_RIFLE_BULLET" )
        {
            var_13 = 1;
            var_2 *= getdvarfloat( "riotshield_bullet_damage_scale" );
        }
        else if ( var_6 == "MOD_GRENADE" || var_6 == "MOD_GRENADE_SPLASH" || var_6 == "MOD_EXPLOSIVE" || var_6 == "MOD_EXPLOSIVE_SPLASH" || var_6 == "MOD_PROJECTILE" || var_6 == "MOD_PROJECTILE_SPLASH" )
            var_2 *= getdvarfloat( "riotshield_explosive_damage_scale" );
        else if ( var_6 == "MOD_IMPACT" )
            var_2 *= getdvarfloat( "riotshield_projectile_damage_scale" );
        else if ( var_6 == "MOD_CRUSH" )
            var_2 = var_0;

        self._id_0102 += var_2;

        if ( self._id_0102 >= var_0 )
        {
            thread _id_25B0( var_3, var_11 );
            break;
        }
        else if ( ( var_12 || var_13 ) && gettime() >= var_1 )
        {
            var_1 = gettime() + 500;
            var_14 = 0;
            var_15 = anglestoforward( self._id_0041 );

            if ( vectordot( var_4, var_15 ) > 0 )
                var_14 = 1;

            if ( var_12 )
            {
                if ( var_14 )
                    self _meth_827B( "npc_deployable_riotshield_stand_melee_back" );
                else
                    self _meth_827B( "npc_deployable_riotshield_stand_melee_front" );
            }
            else if ( var_14 )
                self _meth_827B( "npc_deployable_riotshield_stand_shot_back" );
            else
                self _meth_827B( "npc_deployable_riotshield_stand_shot" );
        }
    }
}

_id_25B0( var_0, var_1 )
{
    self notify( "damageThenDestroyRiotshield" );
    self endon( "death" );

    if ( isdefined( self._id_02E9._id_7552 ) )
        self._id_02E9._id_7552 delete();

    if ( isdefined( self._id_02E9._id_754D ) )
    {
        self._id_02E9._id_754D _meth_8058();
        self._id_02E9._id_754D delete();
    }

    self._id_02E9._id_754F = undefined;
    self _meth_82BF();
    self _meth_827B( "npc_deployable_riotshield_stand_destroyed" );
    wait(getdvarfloat( "riotshield_destroyed_cleanup_time" ));
    self delete();
}

_id_A24A( var_0, var_1 )
{
    var_0 endon( "death" );
    _id_A4F0::_id_A060( "damageThenDestroyRiotshield", "death", "disconnect", "weapon_change", "deploy_riotshield" );
    var_0 _meth_81D6( var_1 );
}
