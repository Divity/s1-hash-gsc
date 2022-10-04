// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_7858 = 1;
    level._id_7859 = 1;
    level._id_5A47 = max( _id_A75A::_id_3FD9( "scr_maxPerPlayerExplosives", 2 ), 1 );
    level._id_7554 = _id_A75A::_id_3FD9( "scr_riotShieldXPBullets", 15 );
    createthreatbiasgroup( "DogsDontAttack" );
    createthreatbiasgroup( "Dogs" );
    setignoremegroup( "DogsDontAttack", "Dogs" );

    switch ( _id_A75A::_id_3FD9( "perk_scavengerMode", 0 ) )
    {
        case 1:
            level._id_7858 = 0;
            break;
        case 2:
            level._id_7859 = 0;
            break;
        case 3:
            level._id_7858 = 0;
            level._id_7859 = 0;
            break;
    }

    var_0 = getdvar( "g_gametype" );
    var_1 = _id_A75A::_id_3F07();
    var_1 = _id_A4F0::_id_0AF9( var_1 );
    var_2 = 150;
    level._id_A2D4 = [];
    level._id_A2CA = [];

    for ( var_3 = 0; var_3 <= var_2; var_3++ )
    {
        var_4 = tablelookup( "mp/statstable.csv", 0, var_3, 4 );

        if ( var_4 == "" )
            continue;

        if ( tablelookup( "mp/statsTable.csv", 0, var_3, 51 ) != "" )
            continue;

        if ( !issubstr( tablelookup( "mp/statsTable.csv", 0, var_3, 2 ), "weapon_" ) )
            continue;

        if ( issubstr( var_4, "iw5" ) || issubstr( var_4, "iw6" ) )
        {
            var_5 = _id_A75A::_id_4169( var_4 );
            var_4 = var_5[0] + "_" + var_5[1] + "_mp";
            level._id_A2D4[level._id_A2D4.size] = var_4;
            continue;
        }
        else
            level._id_A2D4[level._id_A2D4.size] = var_4 + "_mp";

        var_6 = _id_A75A::_id_415D( var_4 );
        var_7 = [];

        foreach ( var_9 in var_1 )
        {
            if ( !isdefined( var_6[var_9] ) )
                continue;

            level._id_A2D4[level._id_A2D4.size] = var_4 + "_" + var_9 + "_mp";
            var_7[var_7.size] = var_9;
        }

        var_11 = [];

        for ( var_12 = 0; var_12 < var_7.size - 1; var_12++ )
        {
            var_13 = tablelookuprownum( "mp/attachmentCombos.csv", 0, var_7[var_12] );

            for ( var_14 = var_12 + 1; var_14 < var_7.size; var_14++ )
            {
                if ( tablelookup( "mp/attachmentCombos.csv", 0, var_7[var_14], var_13 ) == "no" )
                    continue;

                var_11[var_11.size] = var_7[var_12] + "_" + var_7[var_14];
            }
        }

        foreach ( var_16 in var_11 )
            level._id_A2D4[level._id_A2D4.size] = var_4 + "_" + var_16 + "_mp";
    }

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
    {
        foreach ( var_19 in level._id_A2D4 )
            precacheitem( var_19 );
    }

    thread _id_A73D::main();
    thread _id_A72D::_id_0209();
    thread _id_A72C::_id_0209();

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
    {
        thread _id_A759::_id_0209();
        thread _id_A73A::_id_0209();
        thread _id_A74D::_id_0209();
    }

    thread _id_A738::_id_0209();

    if ( !isdefined( level._id_A2CF ) )
        level._id_A2CF = ::_id_2F98;

    var_22 = 70;
    level._id_1E44 = cos( var_22 );
    level._id_1E46 = 20;
    level._id_1E45 = 0.75;
    level._id_1E47 = 192;

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
    {
        level._id_5C55 = 0.3;
        level._id_5C57 = 100;
        level._id_5C56 = 20;
        level._id_5C53 = 256;
        level._id_5C51 = 70;
        level._id_5C50 = 210;
        level._id_5C4E = 46;
        level._id_5C5C = 120;
        level._id_5C46 = loadfx( "vfx/weaponimpact/bouncing_betty_launch_dirt" );
        level._id_5C47 = loadfx( "vfx/dust/bouncing_betty_swirl" );
        level._id_5C45 = loadfx( "vfx/explosion/bouncing_betty_explosion" );
        level._id_5C44["enemy"] = loadfx( "vfx/lights/light_c4_blink" );
        level._id_5C44["friendly"] = loadfx( "vfx/lights/light_mine_blink_friendly" );
        level._id_3088 = loadfx( "vfx/explosion/emp_grenade_mp" );
    }

    level._id_058F["mine_stunned"] = loadfx( "vfx/sparks/emp_drone_damage" );
    level._id_27E8 = 3.0;
    level._id_7CA7 = loadfx( "fx/muzzleflashes/shotgunflash" );
    level._id_8E40 = loadfx( "fx/explosions/aerial_explosion_large" );
    level._id_6F7E = [];
    level._id_8555 = [];
    level._id_43DE = [];
    level._id_5C89 = [];
    level._id_4F96 = [];
    level._id_5C5A = [];
    level._id_9820 = [];

    if ( !_id_A75A::_id_4FA3() )
    {
        if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
        {
            precachemodel( "weapon_claymore_bombsquad" );
            precachemodel( "weapon_c4_bombsquad" );
            precachemodel( "projectile_m67fraggrenade_bombsquad" );
            precachemodel( "projectile_semtex_grenade_bombsquad" );
            precachemodel( "weapon_light_stick_tactical_bombsquad" );
            precachemodel( "projectile_bouncing_betty_grenade" );
            precachemodel( "projectile_bouncing_betty_grenade_bombsquad" );
            precachemodel( "weapon_jammer" );
            precachemodel( "weapon_jammer_bombsquad" );
            precachemodel( "weapon_radar" );
            precachemodel( "weapon_radar_bombsquad" );
            precachemodel( "mp_trophy_system" );
            precachemodel( "mp_trophy_system_bombsquad" );
            precachemodel( "projectile_semtex_grenade" );
            precachemodel( "npc_variable_grenade_lethal" );
            precacheshader( "exo_hud_cloak_overlay" );
        }

        _func_251( "mp_attachment_lasersight" );
        _func_251( "mp_attachment_directhack" );
        _func_251( "mp_attachment_lasersight_short" );
        level._id_058F["equipment_explode"] = loadfx( "vfx/explosion/sparks_burst_lrg_c" );
        level._id_058F["sniperDustLarge"] = loadfx( "vfx/dust/sniper_dust_kickup" );
        level._id_058F["sniperDustLargeSuppress"] = loadfx( "vfx/dust/sniper_dust_kickup_accum_suppress" );
    }

    level thread _id_64C5();
    level._id_1974 = 0;
    _id_A4F0::_id_0D13( getentarray( "misc_turret", "classname" ), ::_id_996C );
}

_id_2FC6()
{
    wait 5.0;
}

_id_1550()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = _id_A75A::_id_8F56( var_1, "_lefthand" );

        if ( var_2 == "c4_mp" )
        {
            var_0 thread _id_23E6( "weapon_c4_bombsquad", "tag_origin", self );
            continue;
        }

        if ( var_2 == "claymore_mp" )
        {
            var_0 thread _id_23E6( "weapon_claymore_bombsquad", "tag_origin", self );
            continue;
        }

        if ( var_2 == "frag_grenade_mp" )
        {
            var_0 thread _id_23E6( "projectile_m67fraggrenade_bombsquad", "tag_weapon", self );
            continue;
        }

        if ( var_2 == "frag_grenade_short_mp" )
        {
            var_0 thread _id_23E6( "projectile_m67fraggrenade_bombsquad", "tag_weapon", self );
            continue;
        }

        if ( var_2 == "semtex_mp" )
        {
            var_0 thread _id_23E6( "projectile_semtex_grenade_bombsquad", "tag_weapon", self );
            continue;
        }

        if ( var_2 == "thermobaric_grenade_mp" )
            var_0 thread _id_23E6( "projectile_m67fraggrenade_bombsquad", "tag_weapon", self );
    }
}

_id_23E6( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 _meth_8054();
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    var_3 thread _id_154F( var_2 );
    var_3 _meth_80B1( var_0 );
    var_3 _meth_804D( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 _meth_80BE( 0 );
    self waittill( "death" );

    if ( isdefined( self._id_04C6 ) )
        self._id_04C6 delete();

    var_3 delete();
}

_id_154F( var_0 )
{
    self endon( "death" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0._id_04A8;

    foreach ( var_3 in level._id_0328 )
    {
        if ( level._id_91E4 )
        {
            if ( var_3._id_04A8 == "spectator" )
                continue;

            if ( var_3._id_04A8 != var_1 && var_3 _id_A75A::_id_05CB( "specialty_detectexplosive" ) )
                self _meth_8007( var_3 );

            continue;
        }

        if ( isdefined( var_0 ) && var_3 == var_0 )
            continue;

        if ( !var_3 _id_A75A::_id_05CB( "specialty_detectexplosive" ) )
            continue;

        self _meth_8007( var_3 );
    }

    for (;;)
    {
        level _id_A4F0::_id_A060( "joined_team", "player_spawned", "changed_kit", "update_bombsquad" );
        self _meth_8054();

        foreach ( var_3 in level._id_0328 )
        {
            if ( level._id_91E4 )
            {
                if ( var_3._id_04A8 == "spectator" )
                    continue;

                if ( var_3._id_04A8 != var_1 && var_3 _id_A75A::_id_05CB( "specialty_detectexplosive" ) )
                    self _meth_8007( var_3 );

                continue;
            }

            if ( isdefined( var_0 ) && var_3 == var_0 )
                continue;

            if ( !var_3 _id_A75A::_id_05CB( "specialty_detectexplosive" ) )
                continue;

            self _meth_8007( var_3 );
        }
    }
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_4923 = 0;
        var_0._id_51A5 = 0;
        _id_A789::_id_7F7F( var_0, 0 );

        if ( !_id_A75A::_id_4FA3() )
        {
            if ( !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
                var_0 _meth_82C6( "remotemissile_projectile_mp" );

            var_0 thread _id_87FA();
        }

        var_0 thread _id_64D3();
        var_0 thread _id_1550();
        var_0 thread _id_A237();
        var_0 thread _id_9AAF();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        _id_A4F0::_id_A060( "spawned_player", "faux_spawn" );
        self._id_252E = self _meth_8311();
        self._id_3081 = 0;
        self._id_20DF = 0;
        self._id_4923 = 0;
        _id_A789::_id_7F7F( self, 0 );

        if ( !isdefined( self._id_94F4 ) )
        {
            self._id_94F4 = "";
            self._id_94F4 = "none";
            self._id_94F5 = 0;
            self._id_94F3 = 0;
            self._id_94F2 = 0;
            self._id_94F0 = 0;
            self._id_94F1 = 0;
            self._id_94EF = 0;
            self._id_94F6 = 0;
        }

        thread _id_A251();
        thread _id_A25C();
        thread _id_A229();
        thread _id_A254();
        thread _id_A25B();
        thread _id_A234();

        if ( !( isdefined( level.iszombiegame ) && level.iszombiegame ) || isagent( self ) )
            thread _id_A74D::_id_A24B();

        thread _id_8AF6();
        thread _id_A7DB::_id_5ED5();
        thread _id_A754::_id_9198();
        thread _id_A74B::_id_653F();
        thread _id_A753::_id_8E57();
        thread _id_A741::_id_54FC();
        thread _id_A746::_id_5DBB();
        thread _id_A737::_id_5D9A();
        thread _id_A752::_id_8E50();
        thread _id_A758::_id_950A();
        thread _id_A74A::main();
        thread _id_A743::_id_5DB7();
        thread _id_A738::_id_34A2();
        thread _id_A72F::_id_6965();
        thread _id_A72F::_id_6964();
        thread _id_A225();

        if ( !( isdefined( level.iszombiegame ) && level.iszombiegame ) )
        {
            thread _id_A757::_id_A257();
            thread _id_A739::_id_A20F();
        }

        if ( !_id_A75A::_id_4FA3() )
            thread _id_A24E();

        thread _id_A25A();

        if ( isdefined( level.onplayerspawnedweaponsfunc ) )
            self thread [[ level.onplayerspawnedweaponsfunc ]]();

        self._id_55A8 = [];
        self._id_2F73 = undefined;
        self._id_93E1 = [];
        self._id_6808 = [];
        thread _id_9B56();
        thread _id_5EBB();
        self._id_252E = undefined;
        self._id_983D = undefined;
        thread _id_949B();

        if ( !isdefined( self._id_89DE ) )
            self._id_89DE = spawnstruct();

        self._id_89DE._id_03DD = gettime();
        self._id_89DE._id_2595 = 0;
        self._id_89DE._id_25AB = 0;
        self._id_89DE._id_126D = 0;
        var_0 = self._id_89DE._id_03DD;

        if ( !isdefined( self._id_627F ) )
            self._id_627F = 0;

        self._id_627F++;

        if ( isagent( self ) )
            return;

        if ( isdefined( self._id_354D ) )
            self._id_354D = undefined;

        var_1 = 0.1;
        var_2 = var_1;
        var_3 = "_matchdata.gsc";
        var_4 = -1;
        var_5 = -1;
        var_6 = -1;

        if ( isdefined( self._id_89DE ) )
        {
            if ( isdefined( self._id_89DE._id_89F7 ) )
            {
                if ( isdefined( self._id_89DE._id_89F7._id_5185 ) )
                    var_4 = self._id_89DE._id_89F7._id_5185;

                if ( isdefined( self._id_89DE._id_89F7._id_6290 ) )
                    var_5 = self._id_89DE._id_89F7._id_6290;

                if ( isdefined( self._id_89DE._id_89F7._id_5606 ) )
                    var_6 = self._id_89DE._id_89F7._id_5606;
            }
        }

        reconspatialevent( self._id_03DC, "script_mp_playerspawn: player_name %s, life_id %d, life_index %d, was_tactical_insertion %b, team %s, gameTime %d, version %f, script_file %s, randomSpawn %b, number_of_choices %d, last_update_time %d", self._id_02AB, self._id_56F4, self._id_627F, self._id_A1C9, self._id_04A8, var_0, var_2, var_3, var_4, var_5, var_6 );
    }
}

_id_7288()
{
    self._id_030D["toggleScopeStates"] = [];
    var_0 = self _meth_830C();

    foreach ( var_2 in var_0 )
    {
        if ( var_2 == self._id_0343 || var_2 == self._id_03B3 )
        {
            var_3 = getweaponattachments( var_2 );

            foreach ( var_5 in var_3 )
            {
                if ( var_5 == "variablereddot" )
                {
                    self._id_030D["toggleScopeStates"][var_2] = self _meth_8317( var_2 );
                    break;
                }
            }
        }
    }
}

_id_87FA()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = undefined;

    for (;;)
    {
        self waittill( "weapon_fired" );

        if ( self _meth_817C() != "prone" )
            continue;

        if ( _id_A75A::_id_4164( self _meth_8311() ) != "weapon_sniper" )
            continue;

        var_1 = anglestoforward( self._id_0041 );

        if ( !isdefined( var_0 ) || gettime() - var_0 > 2000 )
        {
            playfx( level._id_058F["sniperDustLarge"], self._id_02E6 + ( 0, 0, 10 ) + var_1 * 50, var_1 );
            var_0 = gettime();
            continue;
        }

        playfx( level._id_058F["sniperDustLargeSuppress"], self._id_02E6 + ( 0, 0, 10 ) + var_1 * 50, var_1 );
    }
}

_id_A254()
{
    _id_A751::_id_8E55();
}

_id_A25A()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    thread _id_A253();
    self._id_5595 = self._id_252E;
    self._id_4926 = [];
    var_0 = self _meth_8311();

    if ( _id_A75A::_id_50CE( var_0 ) && !isdefined( self._id_4926[var_0] ) )
        self._id_4926[var_0] = weaponclipsize( var_0 );

    self._id_173A = undefined;

    if ( issubstr( var_0, "ranger" ) )
        thread _id_A246( var_0 );

    var_1 = 1;

    for (;;)
    {
        if ( !var_1 )
            self waittill( "weapon_change" );

        var_1 = 0;
        var_0 = self _meth_8311();

        if ( var_0 == "none" )
            continue;

        var_2 = getweaponattachments( var_0 );
        self.has_opticsthermal = 0;
        self.has_target_enhancer = 0;
        self.has_stock = 0;
        self.has_laser = 0;

        if ( isdefined( var_2 ) )
        {
            foreach ( var_4 in var_2 )
            {
                if ( var_4 == "opticstargetenhancer" )
                {
                    self.has_target_enhancer = 1;
                    continue;
                }

                if ( var_4 == "stock" )
                {
                    self.has_stock = 1;
                    continue;
                }

                if ( var_4 == "lasersight" )
                {
                    self.has_laser = 1;
                    continue;
                }

                if ( issubstr( var_4, "opticsthermal" ) )
                    self.has_opticsthermal = 1;
            }
        }

        if ( _id_A75A::_id_50C6( var_0 ) )
            continue;

        if ( _id_A75A::_id_513A( var_0 ) )
        {
            if ( _id_A7C3::_id_1AEC() )
                self._id_1C87 = undefined;

            continue;
        }

        var_6 = _id_A75A::_id_4169( var_0 );
        self._id_173A = undefined;

        if ( issubstr( var_0, "ranger" ) )
            thread _id_A246( var_0 );

        if ( var_6[0] == "alt" )
        {
            var_7 = getsubstr( var_0, 4 );
            var_0 = var_7;
            var_6 = _id_A75A::_id_4169( var_0 );
        }

        if ( var_0 != "none" && var_6[0] != "iw5" && var_6[0] != "iw6" )
        {
            if ( _id_A75A::_id_50CE( var_0 ) && !isdefined( self._id_4926[var_0 + "_mp"] ) )
                self._id_4926[var_0 + "_mp"] = weaponclipsize( var_0 + "_mp" );
        }
        else if ( var_0 != "none" && ( var_6[0] == "iw5" || var_6[0] == "iw6" ) )
        {
            if ( _id_A75A::_id_50CE( var_0 ) && !isdefined( self._id_4926[var_0] ) )
                self._id_4926[var_0] = weaponclipsize( var_0 );
        }

        if ( _id_5A5B( var_0 ) )
            self._id_5595 = var_0;

        self._id_1C87 = undefined;
    }
}

_id_A253()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );
    self._id_1C87 = undefined;

    for (;;)
    {
        self waittill( "weapon_switch_started", var_0 );
        thread _id_5947( self _meth_8311() );
        self._id_1C87 = var_0;

        if ( var_0 == "none" && isdefined( self._id_50D4 ) && self._id_50D4 )
        {
            while ( self._id_50D4 )
                wait 0.05;

            self._id_1C87 = undefined;
        }
    }
}

_id_5947( var_0 )
{
    self endon( "weapon_switch_started" );
    self endon( "weapon_change" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );

    if ( !_id_A7C3::_id_1AEC() )
        return;

    wait 1.0;
    self._id_1C87 = undefined;
}

_id_A25B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self _meth_8311();
        self._id_173A = undefined;

        if ( !issubstr( var_0, "ranger" ) )
            continue;

        thread _id_A246( var_0 );
    }
}

_id_A246( var_0 )
{
    var_1 = self _meth_82F8( var_0, "right" );
    var_2 = self _meth_82F8( var_0, "left" );
    self endon( "reload" );
    self endon( "weapon_change" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "weapon_fired", var_3 );

        if ( var_3 != var_0 )
            continue;

        self._id_173A = undefined;

        if ( issubstr( var_0, "akimbo" ) )
        {
            var_4 = self _meth_82F8( var_0, "left" );
            var_5 = self _meth_82F8( var_0, "right" );

            if ( var_2 != var_4 && var_1 != var_5 )
                self._id_173A = 1;

            if ( !var_4 || !var_5 )
                return;

            var_2 = var_4;
            var_1 = var_5;
            continue;
        }

        if ( var_1 == 2 && !self _meth_82F8( var_0, "right" ) )
        {
            self._id_173A = 1;
            return;
        }
    }
}

_id_5A5B( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( issubstr( var_0, "uav" ) )
        return 0;

    if ( issubstr( var_0, "killstreak" ) )
        return 0;

    if ( _id_A75A::_id_4164( var_0 ) == "weapon_projectile" )
        return 0;

    var_1 = _func_1DF( var_0 );

    if ( var_1 != "primary" )
        return 0;

    if ( issubstr( var_0, "combatknife" ) || issubstr( var_0, "underwater" ) )
        return 0;

    return 1;
}

_id_2F98( var_0, var_1 )
{
    if ( !_id_A75A::_id_51E0() )
        waitframe;

    if ( isdefined( level._id_14B5 ) )
        return;

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_2F73 ) )
        return;

    if ( level._id_4C6A )
        return;

    var_2 = self._id_5595;

    if ( !isdefined( var_2 ) )
        return;

    if ( var_2 == "none" )
        return;

    if ( !self _meth_8314( var_2 ) )
        return;

    if ( _id_A75A::_id_512E() )
        return;

    if ( isdefined( level._id_3BF3 ) && !self [[ level._id_3BF3 ]]( var_2 ) )
        return;

    var_3 = _id_A75A::_id_4169( var_2 );

    if ( var_3[0] == "alt" )
    {
        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( var_4 > 0 && var_4 < 2 )
            {
                var_2 += var_3[var_4];
                continue;
            }

            if ( var_4 > 0 )
            {
                var_2 += ( "_" + var_3[var_4] );
                continue;
            }

            var_2 = "";
        }
    }

    if ( var_2 != "riotshield_mp" )
    {
        if ( !self _meth_82FA( var_2 ) )
            return;

        var_5 = self _meth_82F8( var_2, "right" );
        var_6 = self _meth_82F8( var_2, "left" );

        if ( !var_5 && !var_6 )
            return;

        var_7 = self _meth_82F9( var_2 );
        var_8 = _func_1E1( var_2 );

        if ( var_7 > var_8 )
            var_7 = var_8;

        var_9 = self _meth_8250( var_2 );

        if ( !isdefined( var_9 ) )
            return;

        if ( _id_A75A::_id_514D( var_1 ) )
            var_9._id_02E6 = ( var_9._id_02E6[0], var_9._id_02E6[1], var_9._id_02E6[2] - 5 );

        var_9 _meth_817E( var_5, var_7, var_6 );
    }
    else
    {
        var_9 = self _meth_8250( var_2 );

        if ( !isdefined( var_9 ) )
            return;

        var_9 _meth_817E( 1, 1, 0 );
    }

    self._id_2F73 = 1;

    if ( _id_A74D::_id_A2D1( var_2 ) )
        self _meth_84C6();

    var_9._id_02E9 = self;
    var_9._id_6635 = var_0;
    var_9._id_04A7 = "dropped_weapon";
    var_9 thread _id_A240();
    var_9 thread _id_285C();
}

_id_2981( var_0, var_1 )
{
    var_2 = self _meth_802C();

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = self _meth_802D( var_3 );

        if ( var_4 != var_0 )
            continue;

        var_5 = self _meth_802E( var_3 );
        self _meth_802A( var_0, var_5 );

        if ( var_5 != var_1 )
        {
            var_2 = self _meth_802C();

            for ( var_3 = 0; var_3 < var_2; var_3++ )
            {
                var_5 = self _meth_802E( var_3 );

                if ( var_5 != var_1 )
                    continue;

                var_0 = self _meth_802D( var_3 );
                self _meth_802A( var_0, var_5 );
                break;
            }
        }

        return 1;
    }

    return 0;
}

_id_285C()
{
    self endon( "death" );
    wait 60;

    if ( !isdefined( self ) )
        return;

    self delete();
}

_id_3FDA()
{
    var_0 = self._id_00AB;
    var_1 = getsubstr( var_0, 7 );
    return var_1;
}

_id_A240()
{
    self endon( "death" );
    var_0 = _id_3FDA();
    var_1 = self._id_02E9;

    for (;;)
    {
        self waittill( "trigger", var_2, var_3 );

        if ( isdefined( var_0 ) && var_0 == var_2._id_0343 )
            return;

        if ( isdefined( var_0 ) && var_0 == var_2._id_03B3 )
            return;

        var_2._id_6808[var_0] = undefined;
        var_2._id_93E1[var_0] = undefined;

        if ( isdefined( var_2._id_030D["weaponPickupsCount"] ) )
            var_2._id_030D["weaponPickupsCount"]++;

        if ( isdefined( var_1 ) && var_1 != var_2 )
        {
            var_2._id_6808[var_0] = var_1;

            if ( isdefined( self._id_6635 ) && self._id_6635 == var_2 )
                var_2._id_93E1[var_0] = var_1;
        }

        if ( isdefined( var_3 ) )
            break;
    }

    var_3._id_02E9 = var_2;
    var_3._id_04A7 = "dropped_weapon";
    var_4 = var_3 _id_3FDA();

    if ( isdefined( var_2._id_0343 ) && var_2._id_0343 == var_4 )
        var_2._id_0343 = var_0;

    if ( isdefined( var_2._id_03B3 ) && var_2._id_03B3 == var_4 )
        var_2._id_03B3 = var_0;

    if ( isdefined( var_2._id_6808[var_4] ) )
    {
        var_3._id_02E9 = var_2._id_6808[var_4];
        var_2._id_6808[var_4] = undefined;
    }

    if ( isdefined( var_2._id_93E1[var_4] ) )
    {
        var_3._id_6635 = var_2;
        var_2._id_93E1[var_4] = undefined;
    }

    var_3 thread _id_A240();
}

_id_5209()
{
    var_0 = _id_3FDA();
    var_1 = _func_1E2( var_0 );

    for ( var_2 = 1; var_1 != "none" && var_1 != var_0; var_2++ )
    {
        self _meth_817E( 0, 0, 0, var_2 );
        var_1 = _func_1E2( var_1 );
    }
}

_id_467A( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "scavenger", var_1 );
    var_1 notify( "scavenger_pickup" );
    var_2 = var_1 _meth_82CE();

    foreach ( var_4 in var_2 )
    {
        if ( _id_A781::_id_51EF( var_4, 0 ) && var_1 _id_A75A::_id_05CB( "specialty_tacticalresupply" ) )
        {
            var_1 _meth_84A4( var_4 );
            continue;
        }

        if ( _id_A781::_id_51E7( var_4, 0 ) && var_1 _id_A75A::_id_05CB( "specialty_lethalresupply" ) )
        {
            var_5 = var_1 _meth_82F8( var_4 );
            var_1 _meth_82F6( var_4, var_5 + 1 );
        }
    }

    if ( var_1 _id_A75A::_id_05CB( "specialty_scavenger" ) )
    {
        var_7 = var_1 _meth_830C();

        foreach ( var_9 in var_7 )
        {
            if ( _id_A75A::_id_50CE( var_9 ) || level._id_7859 && _id_A75A::_id_50CF( var_9 ) )
            {
                var_10 = var_1 _meth_82F9( var_9 );
                var_11 = 0;
                var_12 = _id_A75A::_id_4164( var_9 );

                if ( isbeamweapon( var_9 ) || var_12 == "weapon_riot" || issubstr( var_9, "riotshield" ) )
                {

                }
                else if ( var_12 == "weapon_projectile" || issubstr( var_9, "exocrossbow" ) || issubstr( var_9, "microdronelauncher" ) )
                {
                    if ( var_1 _id_A75A::_id_05CB( "specialty_explosiveammoresupply" ) )
                        var_11 = weaponclipsize( var_9 );
                }
                else if ( issubstr( var_9, "alt" ) && issubstr( var_9, "gl" ) )
                {
                    if ( var_1 _id_A75A::_id_05CB( "specialty_explosiveammoresupply" ) )
                        var_11 = weaponclipsize( var_9 );
                }
                else if ( _id_50CB( var_9 ) )
                {
                    if ( var_1 _id_A75A::_id_05CB( "specialty_bulletresupply" ) )
                    {
                        var_13 = _func_1E1( var_9 );
                        var_11 = int( var_13 * var_1._id_0B7B );
                    }
                }

                if ( var_11 > 0 )
                    var_1 _meth_82F7( var_9, var_10 + var_11 );
            }
        }
    }

    var_1 _id_A784::_id_9B04( "scavenger" );
}

_id_2F8F( var_0 )
{
    waitframe;

    if ( level._id_4C6A )
        return;

    if ( !isdefined( self ) )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 == self )
        return;

    if ( level.iszombiegame )
        return;

    if ( !isdefined( self._id_08A2 ) )
        var_1 = self _meth_8251( "scavenger_bag_mp" );
    else
        var_1 = self._id_08A2 _meth_8251( "scavenger_bag_mp" );

    var_1 thread _id_467A( self );

    if ( isdefined( level._id_161B["bots_add_scavenger_bag"] ) )
        [[ level._id_161B["bots_add_scavenger_bag"] ]]( var_1 );
}

_id_4161( var_0 )
{
    return 2;
}

_id_4162( var_0 )
{
    return 1;
}

_id_3F9F()
{
    var_0 = "frag_grenade_mp";
    var_1 = self _meth_817F( var_0 );
    return var_1;
}

_id_40CA()
{
    var_0 = self _meth_817F( "smoke_grenade_mp" );
    var_0 += self _meth_817F( "smoke_grenade_mp_lefthand" );
    var_0 += self _meth_817F( "smoke_grenade_var_mp" );
    var_0 += self _meth_817F( "smoke_grenade_var_mp_lefthand" );
    return var_0;
}

_id_8350( var_0, var_1, var_2 )
{
    _id_A789::_id_8350( var_0, var_1, var_2 );
}

_id_A25C( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    if ( isai( self ) )
        return;

    for (;;)
    {
        self waittill( "weapon_fired", var_1 );
        _id_A789::_id_7F7F( self, 1 );
        self._id_55D6 = gettime();

        if ( !_id_A75A::_id_50CE( var_1 ) && !_id_A75A::_id_50CF( var_1 ) )
            continue;

        if ( isdefined( self._id_4926[var_1] ) )
            thread _id_9B2A( var_1 );

        var_2 = _id_A7A4::_id_8D63( "totalShots" ) + 1;
        var_3 = _id_A7A4::_id_8D63( "hits" );
        var_4 = clamp( float( var_3 ) / float( var_2 ), 0.0, 1.0 ) * 10000.0;
        _id_A7A4::_id_8D73( "totalShots", var_2 );
        _id_A7A4::_id_8D73( "accuracy", int( var_4 ) );
        _id_A7A4::_id_8D73( "misses", int( var_2 - var_3 ) );

        if ( isdefined( self._id_55E9 ) && self._id_55E9._id_55EE == gettime() )
        {
            self._id_4923 = 0;
            return;
        }

        var_5 = 1;
        _id_8350( var_1, var_5, "shots" );
        _id_8350( var_1, self._id_4923, "hits" );
        self._id_4923 = 0;
    }
}

_id_9B2A( var_0 )
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );
    self endon( "updateMagShots_" + var_0 );
    self._id_4926[var_0]--;
    wait 0.05;
    self._id_4926[var_0] = weaponclipsize( var_0 );
}

_id_1D0F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "updateMagShots_" + var_0 );
    waitframe;

    if ( isdefined( self._id_4926[var_0] ) && self._id_4926[var_0] == 0 )
    {
        var_1 = _id_A75A::_id_4164( var_0 );
        _id_A7A0::_id_3CA8( var_1 );
        self._id_4926[var_0] = weaponclipsize( var_0 );
    }
}

_id_1D0E( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( _id_A75A::_id_51B7( var_0, "alt_" ) )
    {
        var_2 = _id_A75A::_id_4169( var_0 );

        foreach ( var_4 in var_2 )
        {
            if ( var_4 == "shotgun" )
            {
                var_5 = getsubstr( var_0, 0, 4 );

                if ( !_id_5182( var_5 ) && !_id_51A4( var_5 ) )
                    self._id_4923 = 1;

                continue;
            }

            if ( var_4 == "hybrid" )
            {
                var_6 = getsubstr( var_0, 4 );
                var_0 = var_6;
            }
        }
    }

    if ( !_id_5182( var_0 ) && !_id_51A4( var_0 ) )
        return;

    if ( self _meth_833F() )
        return;

    switch ( weaponclass( var_0 ) )
    {
        case "sniper":
        case "rifle":
        case "pistol":
        case "mg":
        case "smg":
        case "beam":
            self._id_4923++;
            break;
        case "spread":
            self._id_4923 = 1;
            break;
        case "grenade":
        case "underwater":
        case "item":
        case "shield":
        case "ball":
        case "rocketlauncher":
            break;
        default:
            break;
    }

    if ( issubstr( var_0, "riotshield" ) )
    {
        thread _id_A789::_id_930E( "riotshield", self._id_4923, "hits" );
        self._id_4923 = 0;
    }

    waitframe;

    if ( isdefined( self._id_4926[var_0] ) )
        thread _id_1D0F( var_0 );

    if ( !isdefined( self._id_55A8[var_0] ) )
        self._id_55A8[var_0] = 0;

    if ( self._id_55A8[var_0] == gettime() )
        return;

    self._id_55A8[var_0] = gettime();
    var_8 = _id_A7A4::_id_8D63( "totalShots" );
    var_9 = _id_A7A4::_id_8D63( "hits" ) + 1;

    if ( var_9 <= var_8 )
    {
        _id_A7A4::_id_8D73( "hits", var_9 );
        _id_A7A4::_id_8D73( "misses", int( var_8 - var_9 ) );
        var_10 = clamp( float( var_9 ) / float( var_8 ), 0.0, 1.0 ) * 10000.0;
        _id_A7A4::_id_8D73( "accuracy", int( var_10 ) );
    }
}

_id_0E2B( var_0, var_1 )
{
    return _id_3AA4( var_1, var_0 );
}

_id_3AA4( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return 1;

    if ( !level._id_91E4 )
        return 1;

    var_3 = var_1._id_04A8;
    var_4 = level._id_01A9;

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    if ( var_4 != 0 )
        return 1;

    if ( var_1 == var_0 )
        return 1;

    if ( !isdefined( var_3 ) )
        return 1;

    if ( var_3 != var_0._id_04A8 )
        return 1;

    return 0;
}

_id_A229()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self._id_9337 = undefined;
    self._id_4288 = 0;

    if ( _id_A75A::_id_3FD9( "scr_deleteexplosivesonspawn", 1 ) == 1 )
    {
        if ( isdefined( self._id_2D1D ) )
            self._id_2D1D = undefined;
        else
            _id_27F8();
    }
    else
    {
        if ( !isdefined( self._id_5976 ) )
            self._id_5976 = [];

        if ( !isdefined( self._id_1E43 ) )
            self._id_1E43 = [];

        if ( !isdefined( self._id_1756 ) )
            self._id_1756 = [];
    }

    thread _id_A232();
    thread _id_A230();
    thread _id_A22F();
    thread _id_A1FF();
    thread _id_A201();
    thread _id_2846();
    thread _id_A223();

    for (;;)
    {
        self waittill( "grenade_pullback", var_0 );
        _id_8350( var_0, 1, "shots" );
        _id_A789::_id_7F7F( self, 1 );
        thread _id_A239();

        if ( var_0 == "claymore_mp" )
            continue;

        self._id_9337 = var_0;
        self._id_4288 = 1;

        if ( var_0 == "c4_mp" )
            _id_1397();
        else
            _id_139C();

        self._id_9337 = undefined;
    }
}

_id_139C()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "offhand_end" );
    self endon( "weapon_change" );
    var_0 = gettime();
    self waittill( "grenade_fire", var_1, var_2 );

    if ( isdefined( var_1 ) )
    {
        var_3 = _id_A75A::_id_8F56( var_2, "_lefthand" );

        if ( gettime() - var_0 > 1000 && var_3 == "frag_grenade_mp" )
            var_1._id_50E5 = 1;

        self._id_1C87 = undefined;
        var_1._id_02E9 = self;
        var_1._id_A2D6 = var_2;

        switch ( var_3 )
        {
            case "frag_grenade_mp":
            case "semtex_mp":
            case "frag_grenade_var_mp":
            case "semtex_grenade_var_mp":
                var_1 thread _id_A7AD::_id_43E6();
                var_1._id_65A0 = self;
                break;
            case "flash_grenade_mp":
                var_1 thread _id_60E9();
                break;
            case "concussion_grenade_mp":
                var_1 thread _id_3084();
                break;
            case "stun_grenade_mp":
            case "stun_grenade_var_mp":
                break;
            case "smoke_grenade_mp":
            case "smoke_grenade_var_mp":
                var_1 thread _id_A252();
                break;
            case "paint_grenade_mp":
            case "paint_grenade_var_mp":
            case "paint_grenade_horde_mp":
                var_1 thread _id_A23F();
                break;
        }
    }
}

_id_A239()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "grenade_fire" );
    self waittill( "offhand_end" );

    if ( isdefined( self._id_1C87 ) && self._id_1C87 != self _meth_8311() )
        self._id_1C87 = undefined;
}

_id_A23F()
{
    var_0 = self._id_02E9;
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self waittill( "explode", var_1 );

    if ( var_0 _id_A75A::_id_50F6() && isdefined( level._id_3082 ) && level._id_3082 )
        return;

    _id_2999( var_1, var_0 );
}

_id_2999( var_0, var_1 )
{
    var_2 = getdvarfloat( "paintExplosionRadius" );
    var_3 = 1.0;
    var_4 = 1.5;

    if ( isdefined( level._id_511A ) )
        var_4 = 10;

    thread _id_A756::_id_2996( var_1, var_0, var_3, var_2 );
    thread _id_A756::_id_299A( var_1, var_4 );

    foreach ( var_6 in level._id_0328 )
    {
        if ( !isdefined( var_6 ) || !isalive( var_6 ) || var_6 _id_A75A::_id_05CB( "specialty_coldblooded" ) || level._id_91E4 == 1 && var_1 != var_6 && var_1._id_04A8 == var_6._id_04A8 )
            continue;

        if ( distance( var_6._id_02E6, var_0 ) < var_2 )
        {
            if ( var_6 _meth_81D8( var_0 ) )
            {
                if ( var_1 == var_6 )
                {
                    foreach ( var_8 in level._id_0328 )
                    {
                        if ( isdefined( var_8 ) && ( level._id_91E4 == 0 || var_1._id_04A8 != var_8._id_04A8 || var_1 == var_8 ) )
                        {
                            thread _id_A756::_id_299A( var_8, var_4 );
                            var_1 _id_A756::_id_0840( [ var_8 ], var_4, "PAINT_GRENADE", 1, 0 );
                        }
                    }

                    continue;
                }

                var_6 _id_A756::_id_0840( [ var_1 ], var_4, "PAINT_GRENADE", 1, 0 );
                var_1 _id_A784::_id_9B04( "paint" );
            }
        }
    }

    if ( isdefined( level._id_08A1 ) )
    {
        foreach ( var_12 in level._id_08A1 )
        {
            if ( !isdefined( var_12 ) || !isalive( var_12 ) || isdefined( var_12._id_04A8 ) && level._id_91E4 == 1 && var_1._id_04A8 == var_12._id_04A8 )
                continue;

            if ( distance( var_12._id_02E6, var_0 ) < var_2 )
            {
                if ( var_12 _meth_81D8( var_0 ) )
                {
                    var_12 _id_A756::_id_0840( [ var_1 ], var_4, "PAINT_GRENADE", 1, 0 );
                    var_1 _id_A784::_id_9B04( "paint" );
                }
            }
        }
    }
}

_id_A252()
{
    level endon( "smokeTimesUp" );
    var_0 = self._id_02E9;
    var_0 endon( "disconnect" );
    self waittill( "explode", var_1 );
    var_2 = 128;
    var_3 = 8;
    level thread _id_A053( var_3, var_2, var_1 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            break;

        foreach ( var_5 in level._id_0328 )
        {
            if ( !isdefined( var_5 ) )
                continue;

            if ( level._id_91E4 && var_5._id_04A8 == var_0._id_04A8 )
                continue;

            if ( distancesquared( var_5._id_02E6, var_1 ) < var_2 * var_2 )
            {
                var_5._id_4E3F = var_0;
                continue;
            }

            var_5._id_4E3F = undefined;
        }

        wait 0.05;
    }
}

_id_A053( var_0, var_1, var_2 )
{
    _id_A79A::_id_A049( var_0 );
    level notify( "smokeTimesUp" );
    waitframe;

    foreach ( var_4 in level._id_0328 )
    {
        if ( isdefined( var_4 ) )
            var_4._id_4E3F = undefined;
    }
}

_id_A237()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "missile_fire", var_0, var_1 );
        var_2 = [ var_0 ];

        if ( issubstr( var_1, "_gl" ) )
        {
            var_0._id_02E9 = self;
            var_0._id_0343 = self _meth_8312();
            var_0 thread _id_A7AD::_id_43E6();
        }

        if ( isdefined( var_0 ) )
        {
            var_0._id_A2D6 = var_1;

            if ( isprimaryorsecondaryprojectileweapon( var_1 ) )
                var_0.firedads = self _meth_8340();
        }

        switch ( var_1 )
        {
            case "stinger_mp":
            case "iw5_lsr_mp":
                var_0._id_580C = self._id_8E54;
                level notify( "stinger_fired", self, var_2 );
                thread _id_A75A::_id_7F19( var_0, "tag_origin", 65 );
                break;
            default:
                break;
        }

        switch ( var_1 )
        {
            case "remotemissile_projectile_mp":
            case "rpg_mp":
            case "ac130_105mm_mp":
            case "ac130_40mm_mp":
                var_0 thread _id_A7AD::_id_43E6();
            default:
                continue;
        }
    }
}

_id_A22B()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "hit_by_missile", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );

        if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
            continue;

        if ( level._id_91E4 && self._id_04A8 == var_0._id_04A8 )
        {
            self _meth_83F8( var_1, var_3, var_4, var_5, var_6, var_7 );
            continue;
        }

        if ( var_2 != "rpg_mp" )
        {
            self _meth_83F8( var_1, var_3, var_4, var_5, var_6, var_7 );
            continue;
        }

        if ( randomintrange( 0, 100 ) < 99 )
        {
            self _meth_83F8( var_1, var_3, var_4, var_5, var_6, var_7 );
            continue;
        }

        var_8 = getdvarfloat( "rocket_corpse_max_air_time", 0.5 );
        var_9 = getdvarfloat( "rocket_corpse_view_offset_up", 100 );
        var_10 = getdvarfloat( "rocket_corpse_view_offset_forward", 35 );
        self._id_5190 = 1;
        self _meth_80BE( 0 );
        var_11 = self _meth_83E2( 1 );
        var_12 = var_11 / 1000.0;
        self._id_534A = spawn( "script_model", var_1._id_02E6 );
        self._id_534A._id_0041 = var_1._id_0041;
        self._id_534A _meth_804D( var_1 );
        self._id_534A _meth_834D( "rocket_corpse" );
        self._id_534A _meth_80BE( 0 );
        self _meth_8051( 1000, self._id_02E6, var_0, var_1 );
        self._id_0087 = self _meth_8271( var_11 );
        self._id_0087._id_02E6 = var_1._id_02E6;
        self._id_0087._id_0041 = var_1._id_0041;
        self._id_0087 _meth_83E3( 0 );
        self._id_0087 _meth_8069();
        self._id_0087 _meth_804D( var_1 );
        self._id_0087 _meth_80BE( 0 );

        if ( !isdefined( self._id_9078 ) )
            thread _id_A785::_id_07DE( self._id_0087, self, self._id_04A8, 5.0 );

        self _meth_8005();
        var_13 = vectornormalize( anglestoup( var_1._id_0041 ) );
        var_14 = vectornormalize( anglestoforward( var_1._id_0041 ) );
        var_15 = var_14 * var_9 + var_13 * var_10;
        var_16 = var_1._id_02E6 + var_15;
        var_17 = spawn( "script_model", var_16 );
        var_17 _meth_80B1( "tag_origin" );
        var_17._id_0041 = vectortoangles( var_1._id_02E6 - var_17._id_02E6 );
        var_17 _meth_804D( var_1 );
        var_17 _meth_80BE( 0 );
        self _meth_81E2( var_17, "tag_origin" );

        if ( var_8 > var_12 )
            var_8 = var_12;

        var_18 = var_1 _id_A4F0::_id_A099( "death", var_8 );

        if ( isdefined( var_18 ) && var_18 == "timeout" && isdefined( var_1 ) )
            var_1 _meth_81D6();

        self notify( "final_rocket_corpse_death" );
        self._id_0087 _meth_804F();
        self._id_0087 _meth_83E3( 1 );
        self._id_0087 _meth_8023();
        var_17 _meth_804D( self._id_0087 );
        self._id_5190 = undefined;
        self waittill( "death_delay_finished" );
        self _meth_81E3();
        self._id_534A delete();
        var_17 delete();
    }
}

_id_A24E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "sentry_placement_finished", var_0 );
        thread _id_A75A::_id_7F19( var_0, "tag_flash", 65 );
    }
}

_id_3084()
{
    thread _id_A7AD::_id_31B7();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    var_1 = _id_3F78( var_0, 512, 0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_02E9 ) && !_id_3AA4( self._id_02E9, var_3._id_02E9 ) )
            continue;

        var_3 notify( "emp_damage", self._id_02E9, 8.0 );
    }
}

_id_60E9()
{
    thread _id_A7AD::_id_31B7();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    level thread _id_2D02( var_0, self._id_02E9 );
    var_1 = _id_3F78( var_0, 512, 0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_02E9 ) && !_id_3AA4( self._id_02E9, var_3._id_02E9 ) )
            continue;

        var_3 notify( "emp_damage", self._id_02E9, 8.0 );
    }
}

_id_38A8( var_0, var_1, var_2 )
{
    var_3 = 640000;
    var_4 = 40000;
    var_5 = 60;
    var_6 = 40;
    var_7 = 11;

    if ( !_id_A75A::_id_5186( var_0 ) || var_0._id_03BC != "playing" )
        return;

    var_8 = distancesquared( var_1, var_0._id_02E6 );

    if ( var_8 > var_3 )
        return;

    if ( var_8 <= var_4 )
        var_9 = 1.0;
    else
        var_9 = 1.0 - ( var_8 - var_4 ) / ( var_3 - var_4 );

    var_10 = var_0 _meth_81D8( var_1 );

    if ( var_10 < 0.5 )
        return;

    var_11 = anglestoforward( var_0 _meth_833B() );
    var_12 = var_0._id_02E6;

    switch ( var_0 _meth_817C() )
    {
        case "stand":
            var_12 = ( var_12[0], var_12[1], var_12[2] + var_5 );
            break;
        case "crouch":
            var_12 = ( var_12[0], var_12[1], var_12[2] + var_6 );
            break;
        case "prone":
            var_12 = ( var_12[0], var_12[1], var_12[2] + var_7 );
            break;
    }

    var_13 = var_1 - var_12;
    var_13 = vectornormalize( var_13 );
    var_14 = 0.5 * ( 1.0 + vectordot( var_11, var_13 ) );
    var_0 notify( "flashbang", var_1, var_9, var_14, var_2 );
}

_id_2D02( var_0, var_1 )
{
    level endon( "game_ended" );
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        if ( var_3 > 0 )
        {
            playsoundatpos( var_0, "null" );

            foreach ( var_5 in level._id_0328 )
                _id_38A8( var_5, var_0, var_1 );
        }

        var_7 = _id_3F78( var_0, 512, 0 );

        foreach ( var_9 in var_7 )
        {
            if ( isdefined( var_9._id_02E9 ) && !_id_3AA4( self._id_02E9, var_9._id_02E9 ) )
                continue;

            var_9 notify( "emp_damage", self._id_02E9, 8.0 );
        }

        wait(randomfloatrange( 0.25, 0.5 ));
    }
}

_id_1397()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );
    _id_A4F0::_id_A060( "grenade_fire", "weapon_change", "offhand_end" );
    self._id_1C87 = undefined;
}

_id_A223()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( self._id_4288 )
        {
            self._id_4288 = 0;
            continue;
        }

        if ( !issubstr( var_1, "frag_" ) && !issubstr( var_1, "semtex_" ) )
            continue;

        var_0._id_9330 = 1;
        var_0._id_65A0 = self;
        var_0 thread _id_A7AD::_id_43E6();
    }
}

_id_5975( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3[0] ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_A232()
{
    self endon( "spawned_player" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = _func_1E5( var_1 );
        var_3 = _func_299( var_1 );

        if ( var_2 || var_3 )
        {
            if ( !self._id_5976.size )
                thread _id_A231();

            if ( self._id_5976.size )
            {
                self._id_5976 = _id_5975( self._id_5976 );

                if ( self._id_5976.size >= level._id_5A47 )
                    self._id_5976[0][0] _meth_81D6();
            }

            var_4 = self._id_5976.size;
            self._id_5976[var_4] = [];
            self._id_5976[var_4][0] = var_0;
            self._id_5976[var_4][1] = var_2;
            self._id_5976[var_4][2] = var_3;

            if ( isdefined( var_0 ) )
            {
                var_0._id_02E9 = self;
                var_0 _meth_8383( self );
                var_0._id_04A8 = self._id_04A8;
                var_0._id_A2D6 = var_1;
                var_0._id_8F6E = 0;
            }
        }
    }
}

_id_A1FF()
{
    self endon( "faux_spawn" );
    self endon( "spawned_player" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "c4" || var_1 == "c4_mp" )
        {
            level._id_5C5A[level._id_5C5A.size] = var_0;
            var_0 thread _id_A7AD::_id_196B();
            var_0 thread _id_196E();
            var_0 thread _id_1972();
            var_0 thread _id_1973();
            var_0 thread _id_A1FE();
            var_0 thread _id_7FA5( self._id_030D["team"] );
        }
    }
}

_id_A1FE()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    self._id_04C6 = spawn( "script_origin", self._id_02E6 );
    self._id_04C6._id_02E9 = self;
    thread _id_334B( self._id_02E9, 1 );
    _id_593E();
}

_id_1972()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        playfxontag( _id_A4F0::_id_3FA6( "sentry_explode_mp" ), self, "tag_origin" );
        self._id_2AFC = 1;
        self notify( "disabled" );
        wait(var_1);
        self._id_2AFC = undefined;
        self notify( "enabled" );
    }
}

_id_1973()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "emp_update" );

        if ( level._id_91E4 && level._id_91E7[self._id_04A8] || !level._id_91E4 && isdefined( level._id_308B ) && level._id_308B != self._id_02E9 )
        {
            self._id_2AFC = 1;
            self notify( "disabled" );
            continue;
        }

        self._id_2AFC = undefined;
        self notify( "enabled" );
    }
}

_id_7FA5( var_0 )
{
    self endon( "death" );
    wait 0.05;

    if ( level._id_91E4 )
        _id_A72D::_id_8022( var_0, ( 0, 0, 20 ) );
    else if ( isdefined( self._id_02E9 ) )
        _id_A72D::_id_7FDF( self._id_02E9, ( 0, 0, 20 ) );
}

_id_A201()
{
    self endon( "faux_spawn" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self._id_1E43 = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "claymore" || var_1 == "claymore_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            var_0 _meth_8054();
            var_0 _id_A4F0::_id_A06A( 0.05, "missile_stuck" );
            var_2 = 60;
            var_3 = ( 0, 0, 4 );
            var_4 = distancesquared( self._id_02E6, var_0._id_02E6 );
            var_5 = distancesquared( self _meth_80A8(), var_0._id_02E6 );
            var_4 += 600;
            var_6 = var_0 _meth_83EC();

            if ( isdefined( var_6 ) )
                var_0 _meth_804F();

            if ( var_4 < var_5 )
            {
                if ( var_2 * var_2 < distancesquared( var_0._id_02E6, self._id_02E6 ) )
                {
                    var_7 = bullettrace( self._id_02E6, self._id_02E6 - ( 0, 0, var_2 ), 0, self );

                    if ( var_7["fraction"] == 1 )
                    {
                        var_0 delete();
                        self _meth_82F7( "claymore_mp", self _meth_82F9( "claymore_mp" ) + 1 );
                        continue;
                    }
                    else
                    {
                        var_0._id_02E6 = var_7["position"];
                        var_6 = var_7["entity"];
                    }
                }
                else
                {

                }
            }
            else if ( var_2 * var_2 < distancesquared( var_0._id_02E6, self _meth_80A8() ) )
            {
                var_7 = bullettrace( self._id_02E6, self._id_02E6 - ( 0, 0, var_2 ), 0, self );

                if ( var_7["fraction"] == 1 )
                {
                    var_0 delete();
                    self _meth_82F7( "claymore_mp", self _meth_82F9( "claymore_mp" ) + 1 );
                    continue;
                }
                else
                {
                    var_0._id_02E6 = var_7["position"];
                    var_6 = var_7["entity"];
                }
            }
            else
            {
                var_3 = ( 0, 0, -5 );
                var_0._id_0041 += ( 0, 180, 0 );
            }

            var_0._id_0041 *= ( 0, 1, 1 );
            var_0._id_02E6 += var_3;

            if ( isdefined( var_6 ) )
                var_0 _meth_804D( var_6 );

            var_0 _meth_8053();
            self._id_1E43 = _id_A4F0::_id_0D01( self._id_1E43 );

            if ( self._id_1E43.size >= level._id_5A47 )
                _id_284E( self._id_1E43[0] );

            self._id_1E43[self._id_1E43.size] = var_0;
            var_0._id_02E9 = self;
            var_0 _meth_8383( self );
            var_0._id_04A8 = self._id_04A8;
            var_0._id_A2D6 = var_1;
            var_0._id_04C6 = spawn( "script_origin", var_0._id_02E6 );
            var_0._id_04C6._id_02E9 = var_0;
            var_0._id_8F6E = 0;
            var_0 _id_593E();
            level._id_5C5A[level._id_5C5A.size] = var_0;
            var_0 thread _id_196E();
            var_0 thread _id_1972();
            var_0 thread _id_1973();
            var_0 thread _id_1E48();
            var_0 thread _id_334B( self, 1 );
            var_0 thread _id_7FA5( self._id_030D["team"] );
            self._id_1C87 = undefined;
        }
    }
}

_id_3347( var_0 )
{
    self notify( "equipmentWatchUse" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "equipmentWatchUse" );
    self endon( "change_owner" );
    self._id_04C6 _meth_80DA( "HINT_NOICON" );

    if ( self._id_A2D6 == "c4_mp" )
        self._id_04C6 _meth_80DB( &"MP_PICKUP_C4" );
    else if ( self._id_A2D6 == "claymore_mp" )
        self._id_04C6 _meth_80DB( &"MP_PICKUP_CLAYMORE" );
    else if ( self._id_A2D6 == "bouncingbetty_mp" )
        self._id_04C6 _meth_80DB( &"MP_PICKUP_BOUNCING_BETTY" );

    self._id_04C6 _id_A75A::_id_7FFF( var_0 );
}

_id_3345( var_0 )
{
    self._id_04C6 _meth_80DB( "" );
    self._id_04C6 _id_A75A::_id_7FFE();
}

_id_334A( var_0 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    var_1 = 1;

    for (;;)
    {
        if ( var_0 _meth_82F9( self._id_A2D6 ) < _func_1E1( self._id_A2D6 ) )
        {
            if ( !var_1 )
            {
                _id_3347( var_0 );
                var_1 = 1;
            }
        }
        else if ( var_1 )
        {
            _id_3345( var_0 );
            var_1 = 0;
        }

        wait 0.05;
    }
}

_id_334B( var_0, var_1 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "change_owner" );
    self._id_04C6 _meth_80DA( "HINT_NOICON" );
    _id_3347( var_0 );

    if ( isdefined( var_1 ) && var_1 )
        thread _id_9B88();

    for (;;)
    {
        thread _id_334A( var_0 );
        self._id_04C6 waittill( "trigger", var_0 );
        var_2 = var_0 _meth_82F9( self._id_A2D6 );

        if ( var_2 < _func_1E1( self._id_A2D6 ) )
        {
            var_0 _meth_82F4( "scavenger_pack_pickup" );
            var_0 _meth_82F7( self._id_A2D6, var_2 + 1 );
            self._id_04C6 delete();
            self delete();
            self notify( "death" );
        }
    }
}

_id_9B88()
{
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self ) && isdefined( self._id_04C6 ) )
        {
            self._id_04C6._id_02E6 = self._id_02E6;

            if ( isdefined( self._id_154E ) )
                self._id_154E._id_02E6 = self._id_02E6;
        }
        else
            return;

        wait 0.05;
    }
}

_id_1E48()
{
    self endon( "death" );
    self endon( "change_owner" );
    var_0 = spawn( "trigger_radius", self._id_02E6 + ( 0, 0, 0 - level._id_1E47 ), 0, level._id_1E47, level._id_1E47 * 2 );
    thread _id_2859( var_0 );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( self._id_8F6E )
        {
            wait 0.05;
            continue;
        }

        if ( getdvarint( "scr_claymoredebug" ) != 1 )
        {
            if ( isdefined( self._id_02E9 ) )
            {
                if ( var_1 == self._id_02E9 )
                    continue;

                if ( isdefined( var_1._id_02E9 ) && var_1._id_02E9 == self._id_02E9 )
                    continue;
            }

            if ( !_id_3AA4( self._id_02E9, var_1, 0 ) )
                continue;
        }

        if ( lengthsquared( var_1 _meth_81B2() ) < 10 )
            continue;

        var_2 = abs( var_1._id_02E6[2] - self._id_02E6[2] );

        if ( var_2 > 128 )
            continue;

        if ( !var_1 _id_847C( self ) )
            continue;

        if ( var_1 _meth_81D7( self._id_02E6, self ) > 0 )
            break;
    }

    self _meth_809A( "claymore_activated" );

    if ( isplayer( var_1 ) && var_1 _id_A75A::_id_05CB( "specialty_delaymine" ) )
    {
        var_1 notify( "triggered_claymore" );
        wait(level._id_27E8);
    }
    else
        wait(level._id_1E45);

    if ( isdefined( self._id_04C6 ) )
        self._id_04C6 delete();

    if ( isdefined( self._id_02E9 ) && isdefined( level._id_5653 ) )
        self._id_02E9 thread [[ level._id_5653 ]]( "claymore_destroyed", undefined, undefined, self._id_02E6 );

    self _meth_81D6();
}

_id_847C( var_0 )
{
    if ( isdefined( var_0._id_2AFC ) )
        return 0;

    var_1 = self._id_02E6 + ( 0, 0, 32 );
    var_2 = var_1 - var_0._id_02E6;
    var_3 = anglestoforward( var_0._id_0041 );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 < level._id_1E46 )
        return 0;

    var_2 = vectornormalize( var_2 );
    var_5 = vectordot( var_2, var_3 );
    return var_5 > level._id_1E44;
}

_id_2859( var_0 )
{
    self waittill( "death" );
    wait 0.05;

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_04C6 ) )
            var_0._id_04C6 delete();

        var_0 delete();
    }
}

_id_284E( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_04C6 ) )
            var_0._id_04C6 delete();

        var_0 delete();
    }
}

_id_A231()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "all_detonated" );
    level endon( "game_ended" );
    self endon( "change_owner" );
    var_0 = 0;

    for (;;)
    {
        if ( self _meth_833C() )
        {
            var_0 = 0;

            while ( self _meth_833C() )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            var_0 = 0;

            while ( !self _meth_833C() && var_0 < 0.35 )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.35 )
                continue;

            if ( !self._id_5976.size )
                return;

            self notify( "detonate_double_tap" );
        }

        wait 0.05;
    }
}

_id_A230()
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "detonate" );
        _id_5974( 1 );
    }
}

_id_A22F()
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "detonate_double_tap" );
        var_0 = self _meth_8311();

        if ( !_func_299( var_0 ) )
            _id_5974( 2 );
    }
}

_id_5974( var_0 )
{
    var_1 = 0;
    var_2 = [];

    for ( var_3 = 0; var_3 < self._id_5976.size; var_3++ )
    {
        if ( !self._id_5976[var_3][var_0] )
        {
            var_1 = 1;
            continue;
        }

        var_4 = self._id_5976[var_3][0];

        if ( isdefined( var_4 ) )
        {
            if ( var_4._id_8F6E )
            {
                var_1 = 1;
                return;
            }

            if ( isdefined( var_4._id_A2D6 ) && !self _meth_84C4( var_4._id_A2D6 ) )
            {
                var_1 = 1;
                continue;
            }

            if ( isdefined( var_4._id_5977 ) )
            {
                self thread [[ var_4._id_5977 ]]( var_4 );
                continue;
            }

            var_4 thread _id_9FFD( 0, var_0 );
        }
    }

    if ( var_1 )
        self._id_5976 = _id_5975( self._id_5976 );
    else
    {
        self._id_5976 = var_2;
        self notify( "all_detonated" );
    }
}

_id_9FFD( var_0, var_1 )
{
    self endon( "death" );
    wait(var_0);
    _id_A0CF();

    if ( var_1 == 2 )
        self _meth_8524();
    else
        self _meth_81D6();

    level._id_5C5A = _id_A4F0::_id_0D01( level._id_5C5A );
}

_id_2846()
{
    self endon( "faux_spawn" );
    self endon( "death" );
    self waittill( "disconnect" );
    var_0 = self._id_5976;
    var_1 = self._id_1E43;
    wait 0.05;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2][0] ) )
            var_0[var_2][0] delete();
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2] ) )
            var_1[var_2] delete();
    }
}

_id_196E()
{
    self endon( "death" );
    self _meth_82C0( 1 );
    self._id_0275 = 100000;
    self._id_01E7 = self._id_0275;
    var_0 = undefined;

    for (;;)
    {
        self waittill( "damage", var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isplayer( var_0 ) && !isagent( var_0 ) )
            continue;

        if ( !_id_3AA4( self._id_02E9, var_0 ) )
            continue;

        if ( isdefined( var_9 ) )
        {
            var_10 = _id_A75A::_id_8F56( var_9, "_lefthand" );

            switch ( var_10 )
            {
                case "flash_grenade_mp":
                case "concussion_grenade_mp":
                case "stun_grenade_mp":
                case "smoke_grenade_mp":
                case "stun_grenade_var_mp":
                case "smoke_grenade_var_mp":
                    continue;
            }
        }

        break;
    }

    if ( level._id_1974 )
        wait(0.1 + randomfloat( 0.4 ));
    else
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    level._id_1974 = 1;
    thread _id_7444();

    if ( isdefined( var_4 ) && ( issubstr( var_4, "MOD_GRENADE" ) || issubstr( var_4, "MOD_EXPLOSIVE" ) ) )
        self._id_A1B7 = 1;

    if ( isdefined( var_8 ) && var_8 & level._id_4B59 )
        self._id_A1BC = 1;

    self._id_A1BA = 1;

    if ( isplayer( var_0 ) )
        var_0 _id_A784::_id_9B04( "c4" );

    if ( level._id_91E4 )
    {
        if ( isdefined( var_0 ) && isdefined( self._id_02E9 ) )
        {
            var_11 = var_0._id_030D["team"];
            var_12 = self._id_02E9._id_030D["team"];

            if ( isdefined( var_11 ) && isdefined( var_12 ) && var_11 != var_12 )
                var_0 notify( "destroyed_explosive" );
        }
    }
    else if ( isdefined( self._id_02E9 ) && isdefined( var_0 ) && var_0 != self._id_02E9 )
        var_0 notify( "destroyed_explosive" );

    if ( isdefined( self._id_04C6 ) )
        self._id_04C6 delete();

    self _meth_81D6( var_0 );
}

_id_7444()
{
    wait 0.05;
    level._id_1974 = 0;
}

_id_7820( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 60; var_2++ )
        wait 0.05;
}

_id_A0CF()
{
    if ( !isdefined( self._id_2AFC ) )
        return;

    self waittill( "enabled" );
}

_id_593E( var_0 )
{
    _id_A4F0::_id_5920( self._id_02E9._id_04A8 );

    if ( !isdefined( var_0 ) || !var_0 )
        self _meth_8388();

    if ( issentient( self ) )
        self _meth_8177( "DogsDontAttack" );
}

_id_82F9()
{
    self._id_154D = [];

    if ( self._id_2991 && !self._id_154C.size )
    {
        for ( var_0 = 0; var_0 < 4; var_0++ )
        {
            self._id_154C[var_0] = newclienthudelem( self );
            self._id_154C[var_0]._id_0530 = 0;
            self._id_154C[var_0]._id_0538 = 0;
            self._id_154C[var_0]._id_053B = 0;
            self._id_154C[var_0]._id_0037 = 0;
            self._id_154C[var_0]._id_0048 = 1;
            self._id_154C[var_0] _meth_80CC( "waypoint_bombsquad", 14, 14 );
            self._id_154C[var_0] _meth_80D8( 0, 0 );
            self._id_154C[var_0]._id_2993 = "";
        }
    }
    else if ( !self._id_2991 )
    {
        for ( var_0 = 0; var_0 < self._id_154C.size; var_0++ )
            self._id_154C[var_0] _meth_8088();

        self._id_154C = [];
    }
}

_id_850C( var_0 )
{
    var_1 = var_0._id_2993;
    var_2 = -1;

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        var_4 = self._id_154C[var_3]._id_2993;

        if ( var_4 == var_1 )
            return;

        if ( var_4 == "" )
            var_2 = var_3;
    }

    if ( var_2 < 0 )
        return;

    self._id_154D[var_1] = 1;
    self._id_154C[var_2]._id_0530 = var_0._id_02E6[0];
    self._id_154C[var_2]._id_0538 = var_0._id_02E6[1];
    self._id_154C[var_2]._id_053B = var_0._id_02E6[2] + 24 + 128;
    self._id_154C[var_2] _meth_8084( 0.25 );
    self._id_154C[var_2]._id_0037 = 1;
    self._id_154C[var_2]._id_2993 = var_0._id_2993;

    while ( isalive( self ) && isdefined( var_0 ) && self _meth_80A9( var_0 ) )
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    self._id_154C[var_2]._id_2993 = "";
    self._id_154C[var_2] _meth_8084( 0.25 );
    self._id_154C[var_2]._id_0037 = 0;
    self._id_154D[var_1] = undefined;
}

_id_3F46( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = var_1 * var_1;
    var_6 = level._id_0328;

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( !isalive( var_6[var_7] ) || var_6[var_7]._id_03BC != "playing" )
            continue;

        var_8 = _id_A75A::_id_3D26( var_6[var_7] );
        var_9 = distancesquared( var_0, var_8 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2CD( var_0, var_8, var_3, var_6[var_7] ) ) )
            var_4[var_4.size] = _id_A75A::_id_3D25( var_6[var_7], var_8 );
    }

    var_10 = getentarray( "grenade", "classname" );

    for ( var_7 = 0; var_7 < var_10.size; var_7++ )
    {
        var_11 = _id_A75A::_id_3D23( var_10[var_7] );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2CD( var_0, var_11, var_3, var_10[var_7] ) ) )
            var_4[var_4.size] = _id_A75A::_id_3D22( var_10[var_7], var_11 );
    }

    var_12 = getentarray( "destructible", "targetname" );

    for ( var_7 = 0; var_7 < var_12.size; var_7++ )
    {
        var_11 = var_12[var_7]._id_02E6;
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2CD( var_0, var_11, var_3, var_12[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13._id_5172 = 0;
            var_13._id_50A5 = 0;
            var_13._id_0152 = var_12[var_7];
            var_13._id_258E = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_14 = getentarray( "destructable", "targetname" );

    for ( var_7 = 0; var_7 < var_14.size; var_7++ )
    {
        var_11 = var_14[var_7]._id_02E6;
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2CD( var_0, var_11, var_3, var_14[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13._id_5172 = 0;
            var_13._id_50A5 = 1;
            var_13._id_0152 = var_14[var_7];
            var_13._id_258E = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_15 = getentarray( "misc_turret", "classname" );

    foreach ( var_17 in var_15 )
    {
        var_11 = var_17._id_02E6 + ( 0, 0, 32 );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2CD( var_0, var_11, var_3, var_17 ) ) )
        {
            switch ( var_17._id_02A0 )
            {
                case "sentry_minigun_weak":
                case "mp_scramble_turret":
                case "mp_remote_turret":
                case "vehicle_ugv_talon_gun_mp":
                case "vehicle_ugv_talon_gun_cloaked_mp":
                    var_4[var_4.size] = _id_A75A::_id_3D27( var_17, var_11 );
                    continue;
            }
        }
    }

    var_19 = getentarray( "script_model", "classname" );

    foreach ( var_21 in var_19 )
    {
        if ( var_21._id_02A0 != "projectile_bouncing_betty_grenade" && var_21._id_02A0 != "ims_scorpion_body" )
            continue;

        var_11 = var_21._id_02E6 + ( 0, 0, 32 );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_A2CD( var_0, var_11, var_3, var_21 ) ) )
            var_4[var_4.size] = _id_A75A::_id_3D24( var_21, var_11 );
    }

    return var_4;
}

_id_3F78( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = getentarray( "grenade", "classname" );

    foreach ( var_7 in var_5 )
    {
        var_8 = var_7._id_02E6;
        var_9 = distance( var_0, var_8 );

        if ( var_9 < var_1 && ( !var_2 || _id_A2CD( var_0, var_8, var_3, var_7 ) ) )
            var_4[var_4.size] = var_7;
    }

    var_11 = getentarray( "misc_turret", "classname" );

    foreach ( var_13 in var_11 )
    {
        var_8 = var_13._id_02E6;
        var_9 = distance( var_0, var_8 );

        if ( var_9 < var_1 && ( !var_2 || _id_A2CD( var_0, var_8, var_3, var_13 ) ) )
            var_4[var_4.size] = var_13;
    }

    return var_4;
}

_id_A2CD( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;
    var_5 = var_1 - var_0;

    if ( lengthsquared( var_5 ) < var_2 * var_2 )
        return 1;

    var_6 = vectornormalize( var_5 );
    var_4 = var_0 + ( var_6[0] * var_2, var_6[1] * var_2, var_6[2] * var_2 );
    var_7 = bullettrace( var_4, var_1, 0, var_3 );

    if ( getdvarint( "scr_damage_debug" ) != 0 || getdvarint( "scr_debugMines" ) != 0 )
    {
        thread _id_2730( var_0, ".dmg" );

        if ( isdefined( var_3 ) )
            thread _id_2730( var_1, "." + var_3._id_00AB );
        else
            thread _id_2730( var_1, ".undefined" );

        if ( var_7["fraction"] == 1 )
            thread _id_2728( var_4, var_1, ( 1, 1, 1 ) );
        else
        {
            thread _id_2728( var_4, var_7["position"], ( 1, 0.9, 0.8 ) );
            thread _id_2728( var_7["position"], var_1, ( 1, 0.4, 0.3 ) );
        }
    }

    return var_7["fraction"] == 1;
}

_id_259A( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( self._id_5172 )
    {
        self._id_25A7 = var_5;
        self._id_0152 thread [[ level._id_19FE ]]( var_0, var_1, var_2, 0, var_3, var_4, var_5, var_6, "none", 0 );
    }
    else
    {
        if ( self._id_50A5 && ( var_4 == "artillery_mp" || var_4 == "claymore_mp" || var_4 == "stealth_bomb_mp" ) )
            return;

        self._id_0152 notify( "damage", var_2, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ), "MOD_EXPLOSIVE", "", "", "", undefined, var_4 );
    }
}

_id_2728( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < 600; var_3++ )
        wait 0.05;
}

_id_271E( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 16;

    var_4 = 360 / var_3;
    var_5 = [];

    for ( var_6 = 0; var_6 < var_3; var_6++ )
    {
        var_7 = var_4 * var_6;
        var_8 = cos( var_7 ) * var_1;
        var_9 = sin( var_7 ) * var_1;
        var_10 = var_0[0] + var_8;
        var_11 = var_0[1] + var_9;
        var_12 = var_0[2];
        var_5[var_5.size] = ( var_10, var_11, var_12 );
    }

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_13 = var_5[var_6];

        if ( var_6 + 1 >= var_5.size )
            var_14 = var_5[0];
        else
            var_14 = var_5[var_6 + 1];

        thread _id_2728( var_13, var_14, var_2 );
    }
}

_id_2730( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 600; var_2++ )
        wait 0.05;
}

_id_64FA( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_5 = 700;
    var_6 = 25;
    var_7 = var_5 * var_5;
    var_8 = var_6 * var_6;
    var_9 = 60;
    var_10 = 40;
    var_11 = 11;

    if ( issubstr( var_1, "_uts19_" ) )
        thread _id_9C38( var_0 );
    else
    {
        var_12 = _id_A75A::_id_8F56( var_1, "_lefthand" );

        switch ( var_12 )
        {
            case "stun_grenade_horde_mp":
            case "stun_grenade_mp":
            case "stun_grenade_var_mp":
                var_13 = var_0._id_02E6;
                var_14 = distancesquared( var_13, self._id_02E6 );

                if ( var_14 > var_7 )
                    return;

                var_15 = self _meth_81D8( var_13 );

                if ( var_15 < 0.5 )
                    return;

                if ( var_14 <= var_8 )
                    var_16 = 1.0;
                else
                    var_16 = 1.0 - ( var_14 - var_8 ) / ( var_7 - var_8 );

                var_17 = anglestoforward( self _meth_833B() );
                var_18 = self._id_02E6;

                switch ( self _meth_817C() )
                {
                    case "stand":
                        var_18 = ( var_18[0], var_18[1], var_18[2] + var_9 );
                        break;
                    case "crouch":
                        var_18 = ( var_18[0], var_18[1], var_18[2] + var_10 );
                        break;
                    case "prone":
                        var_18 = ( var_18[0], var_18[1], var_18[2] + var_11 );
                        break;
                }

                var_19 = var_13 - var_18;
                var_19 = vectornormalize( var_19 );
                var_20 = 0.5 * ( 1.0 + vectordot( var_17, var_19 ) );

                if ( !isdefined( var_0 ) )
                    return;
                else if ( var_2 == "MOD_IMPACT" )
                    return;

                var_21 = 1;

                if ( isdefined( var_0._id_02E9 ) && var_0._id_02E9 == var_4 )
                    var_21 = 0;

                var_22 = 3;

                if ( isdefined( self._id_8F71 ) )
                    var_22 *= self._id_8F71;

                wait 0.05;
                self notify( "concussed", var_4 );

                if ( var_4 != self )
                    var_4 _id_A7A0::_id_6FF3( "ch_alittleconcussed" );

                var_23 = var_16 * var_20 * var_22;
                self _meth_8182( "stun_grenade_mp", var_23, 0, 1, var_16 * var_22 );
                self._id_20DF = gettime() + var_22 * 1000;

                if ( var_23 > 0.1 )
                    thread _id_A75A::_id_5709( "flashed", 0.1, 0.1, var_16 * var_20 * var_22 - 0.1 );

                if ( var_21 && var_4 != self )
                    var_4 thread _id_A784::_id_9B04( "stun" );

                break;
            case "concussion_grenade_mp":
                if ( !isdefined( var_0 ) )
                    return;
                else if ( var_2 == "MOD_IMPACT" )
                    return;

                var_21 = 1;

                if ( isdefined( var_0._id_02E9 ) && var_0._id_02E9 == var_4 )
                    var_21 = 0;

                var_24 = 512;
                var_25 = 1 - distance( self._id_02E6, var_0._id_02E6 ) / var_24;

                if ( var_25 < 0 )
                    var_25 = 0;

                var_22 = 2 + 4 * var_25;

                if ( isdefined( self._id_8F71 ) )
                    var_22 *= self._id_8F71;

                wait 0.05;
                self notify( "concussed", var_4 );

                if ( var_4 != self )
                    var_4 _id_A7A0::_id_6FF3( "ch_alittleconcussed" );

                self _meth_8182( "concussion_grenade_mp", var_22 );
                self._id_20DF = gettime() + var_22 * 1000;

                if ( var_21 && var_4 != self )
                    var_4 thread _id_A784::_id_9B04( "stun" );

                break;
            case "weapon_cobra_mk19_mp":
                break;
            default:
                _id_A7AD::_id_83B8( var_2, var_3 );
                break;
        }
    }
}

_id_9C38( var_0 )
{
    if ( getdvarint( "scr_game_uts19_shock", 0 ) == 0 )
        return;

    if ( !isdefined( var_0 ) )
        return;

    var_1 = 0.45;
    var_2 = 1.2;
    var_3 = 250;
    var_4 = 700;
    var_5 = ( distance( self._id_02E6, var_0._id_02E6 ) - var_3 ) / ( var_4 - var_3 );
    var_6 = 1 - var_5;
    var_6 = clamp( var_6, 0, 1 );
    var_7 = var_1 + ( var_2 - var_1 ) * var_6;

    if ( isdefined( self._id_9C39 ) )
    {
        if ( self._id_9C39 >= var_7 )
            return;
    }

    self._id_9C39 = var_7;
    self _meth_8182( "uts19_mp", var_7 );
    waitframe;

    if ( isdefined( self ) )
        self._id_9C39 = undefined;
}

_id_5182( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( _func_1DF( var_0 ) != "primary" )
        return 0;

    switch ( weaponclass( var_0 ) )
    {
        case "spread":
        case "sniper":
        case "rifle":
        case "pistol":
        case "mg":
        case "smg":
        case "beam":
        case "rocketlauncher":
            return 1;
        default:
            return 0;
    }
}

_id_50CB( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    switch ( _id_A75A::_id_4164( var_0 ) )
    {
        case "weapon_smg":
        case "weapon_assault":
        case "weapon_sniper":
        case "weapon_lmg":
        case "weapon_shotgun":
        case "weapon_pistol":
        case "weapon_machine_pistol":
            return 1;
        case "weapon_heavy":
            return issubstr( var_0, "exoxmg" ) || issubstr( var_0, "lsat" ) || issubstr( var_0, "asaw" ) || issubstr( var_0, "dlcgun2_mp" ) || issubstr( var_0, "dlcgun2loot" );
        case "weapon_special":
            return issubstr( var_0, "dlcgun3_mp" ) || issubstr( var_0, "dlcgun3loot" ) || issubstr( var_0, "dlcgun5loot5" );
        default:
            return 0;
    }
}

isbeamweapon( var_0 )
{
    return issubstr( var_0, "em1" ) || issubstr( var_0, "epm3" ) || issubstr( var_0, "dlcgun1_" ) || issubstr( var_0, "dlcgun1loot" ) || issubstr( var_0, "dlcgun9loot6" );
}

_id_50B3( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return _func_1DF( var_0 ) == "altmode";
}

_id_512D( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return _func_1DF( var_0 ) == "item";
}

_id_518F( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weapontype( var_0 ) == "riotshield";
}

_id_515F( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return _func_1DF( var_0 ) == "offhand";
}

_id_51A4( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( _func_1DF( var_0 ) != "primary" )
        return 0;

    return weaponclass( var_0 ) == "pistol";
}

_id_5111( var_0 )
{
    var_1 = weaponclass( var_0 );
    var_2 = _func_1DF( var_0 );

    if ( var_1 != "grenade" )
        return 0;

    if ( var_2 != "offhand" )
        return 0;

    return 1;
}

_id_51EC( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    var_1 = _func_1DF( var_0 );
    return var_1 == "primary" || var_1 == "altmode";
}

_id_9B56()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = self._id_252E;
    self._id_7811 = var_0;
    _id_8351( var_0 );

    for (;;)
    {
        self waittill( "weapon_change", var_1 );
        _id_9B9D( var_1 );

        if ( _id_51ED( var_1 ) )
            _id_9B35();

        self._id_7811 = var_0;

        if ( _id_51EC( var_1 ) )
            var_0 = var_1;
    }
}

_id_9B9D( var_0 )
{
    var_1 = int( ( gettime() - self._id_A2EC ) / 1000 );
    thread _id_8350( self._id_A2EB, var_1, "timeInUse" );
    _id_8351( var_0 );
}

_id_8351( var_0 )
{
    self._id_A2EB = var_0;
    self._id_A2EC = gettime();
}

_id_308B( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    thread _id_1EEA();
}

_id_1EEA()
{
    self endon( "disconnect" );
    self waittill( "death" );
}

_id_4168()
{
    var_0 = 1000;
    self._id_A2D4 = self _meth_830C();

    if ( self._id_A2D4.size )
    {
        foreach ( var_2 in self._id_A2D4 )
        {
            var_3 = _id_416A( var_2 );

            if ( var_3 == 0 )
                continue;

            if ( var_3 < var_0 )
                var_0 = var_3;
        }

        if ( var_0 > 10 )
            var_0 = 10;
    }
    else
        var_0 = 8;

    var_0 = _id_1E2A( var_0 );
    return var_0;
}

_id_416A( var_0 )
{
    var_1 = undefined;
    var_2 = _id_A75A::_id_3F0F( var_0 );

    if ( isdefined( level.weaponweightfunc ) )
        return [[ level.weaponweightfunc ]]( var_2 );

    var_1 = int( tablelookup( "mp/statstable.csv", 4, var_2, 8 ) );
    return var_1;
}

_id_1E2A( var_0 )
{
    return clamp( var_0, 0.0, 10.0 );
}

_id_51ED( var_0 )
{
    if ( _id_51EC( var_0 ) )
        return 1;

    var_1 = weaponclass( var_0 );

    if ( var_1 == "ball" )
        return 1;

    return 0;
}

_id_9B35()
{
    var_0 = undefined;
    self._id_A2D4 = self _meth_830C();

    if ( !self._id_A2D4.size )
        var_0 = 8;
    else
    {
        var_1 = self _meth_8311();

        if ( !_id_51ED( var_1 ) )
        {
            if ( isdefined( self._id_7811 ) )
                var_1 = self._id_7811;
            else
                var_1 = undefined;
        }

        if ( !isdefined( var_1 ) || !self _meth_8314( var_1 ) )
            var_0 = _id_4168();
        else if ( _id_A75A::_id_3F0F( var_1 ) == "iw5_underwater" )
            var_0 = 5;
        else
        {
            var_0 = _id_416A( var_1 );
            var_0 = _id_1E2A( var_0 );
        }
    }

    var_2 = var_0 / 10;
    self._id_A2E2 = var_2;
    self _meth_81E1( var_2 * self._id_5F78 );
}

_id_8AF6()
{
    if ( !isplayer( self ) )
        return;

    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self _meth_82DD( "adjustedStance", "+stance" );
    self _meth_82DD( "adjustedStance", "+goStand" );

    for (;;)
    {
        _id_A4F0::_id_A060( "adjustedStance", "sprint_begin", "weapon_change" );
        wait 0.5;
        self._id_8AEC = self _meth_817C();

        if ( self._id_8AEC == "prone" )
        {
            var_0 = self _meth_8312();
            var_1 = _id_A75A::_id_4164( var_0 );

            if ( var_1 == "weapon_lmg" )
                _id_A75A::_id_7FF5( 0, 40 );
            else if ( var_1 == "weapon_sniper" )
                _id_A75A::_id_7FF5( 0, 60 );
            else
                _id_A75A::_id_7FF5();

            continue;
        }

        if ( self._id_8AEC == "crouch" )
        {
            var_0 = self _meth_8312();
            var_1 = _id_A75A::_id_4164( var_0 );

            if ( var_1 == "weapon_lmg" )
                _id_A75A::_id_7FF5( 0, 10 );
            else if ( var_1 == "weapon_sniper" )
                _id_A75A::_id_7FF5( 0, 30 );
            else
                _id_A75A::_id_7FF5();

            continue;
        }

        _id_A75A::_id_7FF5();
    }
}

_id_188B( var_0 )
{

}

_id_5EBB()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( !isdefined( var_0._id_A2D6 ) )
            continue;

        if ( !issubstr( var_0._id_A2D6, "semtex" ) )
            continue;

        var_0 thread _id_5EBC();
    }
}

_id_5EBC()
{
    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "faux_spawn" );
    self waittill( "missile_stuck", var_0 );
    thread _id_8E2E( "detonate" );

    if ( !isplayer( var_0 ) )
        return;

    if ( self._id_02E9 _id_51B9( var_0 ) )
    {
        self._id_02E9._id_51B8 = "friendly";
        return;
    }

    self._id_51B8 = "enemy";
    self._id_8F66 = var_0;
    self._id_02E9 _id_A72E::_id_7C76( var_0 );
    self._id_02E9 notify( "process", "ch_bullseye" );
}

_id_51B9( var_0 )
{
    return level._id_91E4 && isdefined( var_0._id_04A8 ) && var_0._id_04A8 == self._id_04A8;
}

_id_996C()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread _id_9978( var_0 );
    }
}

_id_9978( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 notify( "weapon_change", "none" );
    self waittill( "turret_deactivate" );
    var_0 notify( "weapon_change", var_0 _meth_8311() );
}

_id_89EF( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, randomfloat( 360 ), 0 );

    var_5 = "projectile_bouncing_betty_grenade";
    var_6 = spawn( "script_model", var_0 );
    var_6._id_0041 = var_3;
    var_6 _meth_80B1( var_5 );
    var_6._id_02E9 = var_1;
    var_6._id_8F6E = 0;
    var_6 _meth_8383( var_1 );
    var_6._id_A2D6 = "bouncingbetty_mp";
    level._id_5C5A[level._id_5C5A.size] = var_6;
    var_6._id_534D = ( 0, 0, 4 );
    var_6._id_534A = spawn( "script_model", var_6._id_02E6 + var_6._id_534D );
    var_6._id_534A _meth_834D( "explosive" );
    var_1._id_3349 = _id_A4F0::_id_0D01( var_1._id_3349 );

    if ( var_1._id_3349.size >= level._id_5A47 )
        var_1._id_3349[0] delete();

    var_1._id_3349[var_1._id_3349.size] = var_6;
    var_6 thread _id_23E6( "projectile_bouncing_betty_grenade_bombsquad", "tag_origin", var_1 );
    var_6 thread _id_5C48();
    var_6 thread _id_7FA5( var_1._id_030D["team"] );
    var_6 thread _id_5C52();
    var_6 thread _id_5C59();
    var_7 = self _meth_83EC();

    if ( isdefined( var_7 ) )
        var_6 _meth_804D( var_7 );

    var_6 _id_593E( !var_4 );
    return var_6;
}

_id_5C52()
{
    self endon( "mine_triggered" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self _meth_82C0( 1 );
    self._id_0275 = 100000;
    self._id_01E7 = self._id_0275;
    var_0 = undefined;

    for (;;)
    {
        self waittill( "damage", var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isplayer( var_0 ) && !isagent( var_0 ) )
            continue;

        if ( isdefined( var_9 ) && var_9 == "bouncingbetty_mp" )
            continue;

        if ( !_id_3AA4( self._id_02E9, var_0 ) )
            continue;

        if ( isdefined( var_9 ) )
        {
            var_10 = _id_A75A::_id_8F56( var_9, "_lefthand" );

            switch ( var_10 )
            {
                case "smoke_grenade_mp":
                case "smoke_grenade_var_mp":
                    continue;
            }
        }

        break;
    }

    self notify( "mine_destroyed" );

    if ( isdefined( var_4 ) && ( issubstr( var_4, "MOD_GRENADE" ) || issubstr( var_4, "MOD_EXPLOSIVE" ) ) )
        self._id_A1B7 = 1;

    if ( isdefined( var_8 ) && var_8 & level._id_4B59 )
        self._id_A1BC = 1;

    self._id_A1BA = 1;

    if ( isplayer( var_0 ) )
        var_0 _id_A784::_id_9B04( "bouncing_betty" );

    if ( level._id_91E4 )
    {
        if ( isdefined( var_0 ) && isdefined( self._id_02E9 ) )
        {
            var_11 = var_0._id_030D["team"];
            var_12 = self._id_02E9._id_030D["team"];

            if ( isdefined( var_11 ) && isdefined( var_12 ) && var_11 != var_12 )
                var_0 notify( "destroyed_explosive" );
        }
    }
    else if ( isdefined( self._id_02E9 ) && isdefined( var_0 ) && var_0 != self._id_02E9 )
        var_0 notify( "destroyed_explosive" );

    thread _id_5C58( var_0 );
}

_id_5C59()
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    wait 2;
    var_0 = spawn( "trigger_radius", self._id_02E6, 0, level._id_5C57, level._id_5C56 );
    var_0._id_02E9 = self;
    thread _id_5C54( var_0 );
    var_1 = undefined;

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( self._id_8F6E )
            continue;

        if ( getdvarint( "scr_minesKillOwner" ) != 1 )
        {
            if ( isdefined( self._id_02E9 ) )
            {
                if ( var_1 == self._id_02E9 )
                    continue;

                if ( isdefined( var_1._id_02E9 ) && var_1._id_02E9 == self._id_02E9 )
                    continue;
            }

            if ( !_id_3AA4( self._id_02E9, var_1, 0 ) )
                continue;
        }

        if ( lengthsquared( var_1 _meth_81B2() ) < 10 )
            continue;

        if ( var_1 _meth_81D7( self._id_02E6, self ) > 0 )
            break;
    }

    self notify( "mine_triggered" );
    self _meth_809A( "mine_betty_click" );

    if ( isplayer( var_1 ) && var_1 _id_A75A::_id_05CB( "specialty_delaymine" ) )
    {
        var_1 notify( "triggered_mine" );
        wait(level._id_27E8);
    }
    else
        wait(level._id_5C55);

    thread _id_5C4A();
}

_id_5C54( var_0 )
{
    _id_A4F0::_id_A060( "mine_triggered", "mine_destroyed", "mine_selfdestruct", "death" );
    var_0 delete();
}

_id_5C5B()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "death" );
    wait(level._id_5C5C);
    wait(randomfloat( 0.4 ));
    self notify( "mine_selfdestruct" );
    thread _id_5C58();
}

_id_5C4A()
{
    self _meth_809A( "mine_betty_spin" );
    playfx( level._id_5C46, self._id_02E6 );

    if ( isdefined( self._id_04C6 ) )
        self._id_04C6 delete();

    var_0 = self._id_02E6 + ( 0, 0, 64 );
    self _meth_82AE( var_0, 0.7, 0, 0.65 );
    self._id_534A _meth_82AE( var_0 + self._id_534D, 0.7, 0, 0.65 );
    self _meth_82BD( ( 0, 750, 32 ), 0.7, 0, 0.65 );
    thread _id_6DDE();
    wait 0.65;
    thread _id_5C58();
}

_id_5C58( var_0 )
{
    if ( !isdefined( self ) || !isdefined( self._id_02E9 ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self._id_02E9;

    self _meth_809A( "null" );
    var_1 = self _meth_8180( "tag_fx" );
    playfx( level._id_5C45, var_1 );
    wait 0.05;

    if ( !isdefined( self ) || !isdefined( self._id_02E9 ) )
        return;

    self _meth_8054();
    self _meth_81D5( self._id_02E6, level._id_5C53, level._id_5C50, level._id_5C51, var_0, "MOD_EXPLOSIVE" );

    if ( isdefined( self._id_02E9 ) && isdefined( level._id_5653 ) )
        self._id_02E9 thread [[ level._id_5653 ]]( "mine_destroyed", undefined, undefined, self._id_02E6 );

    wait 0.2;

    if ( !isdefined( self ) || !isdefined( self._id_02E9 ) )
        return;

    if ( isdefined( self._id_04C6 ) )
        self._id_04C6 delete();

    self._id_534A delete();
    self delete();
}

_id_5C5D()
{
    if ( self._id_8F6E )
        return;

    self._id_8F6E = 1;
    playfxontag( _id_A4F0::_id_3FA6( "mine_stunned" ), self, "tag_origin" );
}

_id_5C5E()
{
    self._id_8F6E = 0;
    stopfxontag( _id_A4F0::_id_3FA6( "mine_stunned" ), self, "tag_origin" );
}

_id_5C4B( var_0 )
{
    if ( isdefined( self._id_A2D6 ) )
    {
        if ( isdefined( self._id_3316 ) )
            self._id_3316 _meth_8088();

        if ( self._id_A2D6 == "bouncingbetty_mp" )
        {
            if ( isdefined( self._id_04C6 ) )
                self._id_04C6 delete();

            if ( isdefined( self._id_3017["friendly"] ) )
                self._id_3017["friendly"] delete();

            if ( isdefined( self._id_3017["enemy"] ) )
                self._id_3017["enemy"] delete();

            for ( var_1 = 0; var_1 < self._id_02E9._id_3349.size; var_1++ )
            {
                if ( self._id_02E9._id_3349[var_1] == self )
                    self._id_02E9._id_3349[var_1] = undefined;
            }

            self._id_02E9._id_3349 = _id_A4F0::_id_0D01( self._id_02E9._id_3349 );
            self notify( "change_owner" );
            self._id_02E9 = var_0;
            self._id_02E9._id_3349[self._id_02E9._id_3349.size] = self;
            self._id_04A8 = var_0._id_04A8;
            self _meth_8383( var_0 );
            self._id_04C6 = spawn( "script_origin", self._id_02E6 + ( 0, 0, 25 ) );
            self._id_04C6._id_02E9 = self;
            _id_3345( var_0 );
            thread _id_5C48();
            thread _id_7FA5( var_0._id_04A8 );
            var_0 thread _id_5C61( self );
            var_0 thread _id_5C60( self );
        }
        else if ( self._id_A2D6 == "claymore_mp" )
        {
            if ( isdefined( self._id_04C6 ) )
                self._id_04C6 delete();

            for ( var_1 = 0; var_1 < self._id_02E9._id_1E43.size; var_1++ )
            {
                if ( self._id_02E9._id_1E43[var_1] == self )
                    self._id_02E9._id_1E43[var_1] = undefined;
            }

            self._id_02E9._id_1E43 = _id_A4F0::_id_0D01( self._id_02E9._id_1E43 );
            self notify( "change_owner" );
            self._id_02E9 = var_0;
            self._id_02E9._id_1E43[self._id_02E9._id_1E43.size] = self;
            self._id_04A8 = var_0._id_04A8;
            self _meth_8383( var_0 );
            self._id_04C6 = spawn( "script_origin", self._id_02E6 );
            self._id_04C6._id_02E9 = self;
            _id_3345( var_0 );
            thread _id_7FA5( var_0._id_04A8 );
            var_0 thread _id_5C61( self );
            var_0 thread _id_5C60( self );
            thread _id_1E48();
        }
        else if ( self._id_A2D6 == "c4_mp" )
        {
            var_2 = 0;
            var_3 = 0;

            for ( var_1 = 0; var_1 < self._id_02E9._id_5976.size; var_1++ )
            {
                if ( self._id_02E9._id_5976[var_1][0] == self )
                {
                    self._id_02E9._id_5976[var_1][0] = undefined;
                    var_2 = self._id_02E9._id_5976[var_1][1];
                    var_3 = self._id_02E9._id_5976[var_1][2];
                }
            }

            self._id_02E9._id_5976 = _id_5975( self._id_02E9._id_5976 );
            self notify( "change_owner" );
            self._id_02E9 = var_0;
            var_4 = self._id_02E9._id_5976.size;
            self._id_02E9._id_5976[var_4] = [];
            self._id_02E9._id_5976[var_4][0] = self;
            self._id_02E9._id_5976[var_4][1] = var_2;
            self._id_02E9._id_5976[var_4][2] = var_3;
            self._id_04A8 = var_0._id_04A8;
            self _meth_8383( var_0 );
            _id_3345( var_0 );
            thread _id_7FA5( var_0._id_04A8 );
        }
    }
}

_id_6DDE()
{
    self endon( "death" );
    var_0 = gettime() + 1000;

    while ( gettime() < var_0 )
    {
        wait 0.05;
        playfxontag( level._id_5C47, self, "tag_fx_spin1" );
        playfxontag( level._id_5C47, self, "tag_fx_spin3" );
        wait 0.05;
        playfxontag( level._id_5C47, self, "tag_fx_spin2" );
        playfxontag( level._id_5C47, self, "tag_fx_spin4" );
    }
}

_id_5C4D( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6[0] = ( 1, 0, 0 );
    var_6[1] = ( 0, 1, 0 );

    if ( var_1[2] < var_5 )
        var_7 = 0;
    else
        var_7 = 1;

    var_8 = ( var_0[0], var_0[1], var_5 );
    var_9 = ( var_1[0], var_1[1], var_5 );
    thread _id_271E( var_8, level._id_5C53, var_6[var_7], 32 );
    var_10 = distancesquared( var_0, var_1 );

    if ( var_10 > var_2 )
        var_7 = 0;
    else
        var_7 = 1;

    thread _id_2728( var_8, var_9, var_6[var_7] );
}

_id_5C4F( var_0, var_1 )
{
    if ( isplayer( var_1 ) && isalive( var_1 ) && var_1._id_03BC == "playing" )
        var_2 = var_1 _id_A75A::_id_40E5();
    else if ( var_1._id_00AB == "misc_turret" )
        var_2 = var_1._id_02E6 + ( 0, 0, 32 );
    else
        var_2 = var_1._id_02E6;

    var_3 = 0;
    var_4 = var_0._id_02E6[2] + var_3 + level._id_5C4E;
    var_5 = var_0._id_02E6[2] + var_3 - level._id_5C4E;

    if ( var_2[2] > var_4 || var_2[2] < var_5 )
        return 0;

    return 1;
}

_id_A251()
{
    self endon( "disconnect" );
    self endon( "spawned_player" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self._id_51A5 = 0;
        self waittill( "sprint_slide_begin" );
        self._id_51A5 = 1;
        self.lastslidetime = gettime();
        self waittill( "sprint_slide_end" );
    }
}

_id_A234()
{
    self endon( "disconnect" );
    self endon( "spawned_player" );
    self endon( "faux_spawn" );

    if ( isdefined( self._id_3349 ) )
    {
        if ( _id_A75A::_id_3FD9( "scr_deleteexplosivesonspawn", 1 ) == 1 )
        {
            if ( isdefined( self._id_2D1E ) )
                self._id_2D1E = undefined;
            else
                _id_27F9();
        }
    }
    else
        self._id_3349 = [];

    if ( !isdefined( self._id_539C ) )
        self._id_539C = [];

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "bouncingbetty" || var_1 == "bouncingbetty_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            _id_A789::_id_7F7F( self, 1 );
            var_0 thread _id_5C5F( self, 1 );
        }
    }
}

_id_5C5F( var_0, var_1 )
{
    self._id_02E9 = var_0;
    self waittill( "missile_stuck" );

    if ( !isdefined( var_0 ) )
        return;

    var_2 = bullettrace( self._id_02E6 + ( 0, 0, 4 ), self._id_02E6 - ( 0, 0, 4 ), 0, self );
    var_3 = var_2["position"];

    if ( var_2["fraction"] == 1 )
    {
        var_3 = getgroundposition( self._id_02E6, 12, 0, 32 );
        var_2["normal"] *= -1;
    }

    var_4 = vectornormalize( var_2["normal"] );
    var_5 = vectortoangles( var_4 );
    var_5 += ( 90, 0, 0 );
    var_6 = _id_89EF( var_3, var_0, undefined, var_5, var_1 );
    var_6._id_04C6 = spawn( "script_origin", var_6._id_02E6 + ( 0, 0, 25 ) );
    var_6._id_04C6._id_02E9 = var_6;
    var_6 thread _id_334B( var_0 );
    var_0 thread _id_5C61( var_6 );
    var_0 thread _id_5C60( var_6 );
    self delete();
}

_id_5C61( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "change_owner" );
    self waittill( "disconnect" );

    if ( isdefined( var_0._id_04C6 ) )
        var_0._id_04C6 delete();

    var_0 delete();
}

_id_5C60( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "change_owner" );
    _id_A4F0::_id_A07E( "joined_team", "joined_spectators" );

    if ( isdefined( var_0._id_04C6 ) )
        var_0._id_04C6 delete();

    var_0 delete();
}

_id_5C48()
{
    self endon( "change_owner" );
    self._id_3017["friendly"] = spawnfx( level._id_5C44["friendly"], self _meth_8180( "tag_fx" ) );
    self._id_3017["enemy"] = spawnfx( level._id_5C44["enemy"], self _meth_8180( "tag_fx" ) );
    thread _id_5C49();
    self waittill( "death" );
    self._id_3017["friendly"] delete();
    self._id_3017["enemy"] delete();
}

_id_5C49()
{
    self endon( "death" );
    self endon( "change_owner" );
    var_0 = self._id_02E9._id_04A8;
    wait 0.05;
    triggerfx( self._id_3017["friendly"] );
    triggerfx( self._id_3017["enemy"] );

    for (;;)
    {
        self._id_3017["friendly"] _meth_8054();
        self._id_3017["enemy"] _meth_8054();

        foreach ( var_2 in level._id_0328 )
        {
            if ( level._id_91E4 )
            {
                if ( var_2._id_04A8 == var_0 )
                    self._id_3017["friendly"] _meth_8007( var_2 );
                else
                    self._id_3017["enemy"] _meth_8007( var_2 );

                continue;
            }

            if ( var_2 == self._id_02E9 )
            {
                self._id_3017["friendly"] _meth_8007( var_2 );
                continue;
            }

            self._id_3017["enemy"] _meth_8007( var_2 );
        }

        level _id_A4F0::_id_A07E( "joined_team", "player_spawned" );
    }
}

_id_27F8()
{
    if ( isdefined( self._id_5976 ) )
    {
        for ( var_0 = 0; var_0 < self._id_5976.size; var_0++ )
        {
            if ( isdefined( self._id_5976[var_0][0] ) )
            {
                if ( isdefined( self._id_5976[var_0][0]._id_04C6 ) )
                    self._id_5976[var_0][0]._id_04C6 delete();

                self._id_5976[var_0][0] delete();
            }
        }
    }

    self._id_5976 = [];

    if ( isdefined( self._id_1E43 ) )
    {
        for ( var_0 = 0; var_0 < self._id_1E43.size; var_0++ )
        {
            if ( isdefined( self._id_1E43[var_0] ) )
            {
                if ( isdefined( self._id_1E43[var_0]._id_04C6 ) )
                    self._id_1E43[var_0]._id_04C6 delete();

                self._id_1E43[var_0] delete();
            }
        }
    }

    self._id_1E43 = [];

    if ( isdefined( self._id_1756 ) )
    {
        for ( var_0 = 0; var_0 < self._id_1756.size; var_0++ )
        {
            if ( isdefined( self._id_1756[var_0] ) )
            {
                if ( isdefined( self._id_1756[var_0]._id_04C6 ) )
                    self._id_1756[var_0]._id_04C6 delete();

                self._id_1756[var_0] delete();
            }
        }
    }

    self._id_1756 = [];
}

_id_27F9()
{
    if ( isdefined( self._id_3349 ) )
    {
        self._id_3349 = _id_A4F0::_id_0D01( self._id_3349 );

        foreach ( var_1 in self._id_3349 )
        {
            if ( isdefined( var_1._id_04C6 ) )
                var_1._id_04C6 delete();

            var_1 delete();
        }
    }
}

_id_96E6( var_0 )
{
    var_0 _id_27F8();
    var_0 _id_27F9();

    if ( isdefined( self._id_5976 ) )
        var_0._id_5976 = _id_5975( self._id_5976 );
    else
        var_0._id_5976 = undefined;

    if ( isdefined( self._id_1E43 ) )
        var_0._id_1E43 = _id_A4F0::_id_0D01( self._id_1E43 );
    else
        var_0._id_1E43 = undefined;

    if ( isdefined( self._id_1756 ) )
        var_0._id_1756 = _id_A4F0::_id_0D01( self._id_1756 );
    else
        var_0._id_1756 = undefined;

    if ( isdefined( self._id_3349 ) )
        var_0._id_3349 = _id_A4F0::_id_0D01( self._id_3349 );
    else
        var_0._id_3349 = undefined;

    if ( isdefined( self._id_539C ) )
        var_0._id_539C = _id_A4F0::_id_0D01( self._id_539C );
    else
        var_0._id_539C = undefined;

    if ( isdefined( var_0._id_5976 ) )
    {
        foreach ( var_2 in var_0._id_5976 )
        {
            var_2[0]._id_02E9 = var_0;
            var_2[0] thread _id_334B( var_0 );
        }
    }

    if ( isdefined( var_0._id_1E43 ) )
    {
        foreach ( var_5 in var_0._id_1E43 )
        {
            var_5._id_02E9 = var_0;
            var_5 thread _id_334B( var_0 );
        }
    }

    if ( isdefined( var_0._id_1756 ) )
    {
        foreach ( var_8 in var_0._id_1756 )
        {
            var_8._id_02E9 = var_0;
            var_8 thread _id_334B( var_0 );
        }
    }

    if ( isdefined( var_0._id_3349 ) )
    {
        foreach ( var_11 in var_0._id_3349 )
        {
            var_11._id_02E9 = var_0;
            var_11 thread _id_334B( var_0 );
        }
    }

    if ( isdefined( var_0._id_539C ) )
    {
        foreach ( var_14 in var_0._id_539C )
        {
            var_14._id_02E9 = var_0;
            var_14 thread _id_334B( var_0 );
        }
    }

    self._id_5976 = [];
    self._id_1E43 = [];
    self._id_1756 = [];
    self._id_3349 = [];
    self._id_539C = [];
    self._id_2D1D = 1;
    self._id_2D1E = 1;
}

_id_9AAF()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = self _meth_8311();

        if ( issubstr( var_0, "em1" ) || issubstr( var_0, "epm3" ) || issubstr( var_0, "dlcgun1_" ) || issubstr( var_0, "dlcgun1loot" ) || issubstr( var_0, "dlcgun9loot6" ) || issubstr( var_0, "dlcgun10loot6" ) || issubstr( var_0, "dlcgun10loot4" ) )
        {
            var_1 = self _meth_83B9( var_0 );
            self _meth_82FB( "ui_em1_heat", var_1 );
        }

        wait 0.05;
    }
}

_id_3343()
{
    playfx( _id_A4F0::_id_3FA6( "equipment_sparks" ), self._id_02E6 );
    self _meth_809A( "sentry_explode" );
}

_id_3344()
{
    playfx( _id_A4F0::_id_3FA6( "equipment_explode_big" ), self._id_02E6 );
    playfx( _id_A4F0::_id_3FA6( "equipment_smoke" ), self._id_02E6 );
}

_id_3346()
{
    playfxontag( _id_A4F0::_id_3FA6( "emp_stun" ), self, "tag_origin" );
}

_id_949B()
{
    self._id_2582 = [];
    thread _id_7425();
}

_id_7425()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        if ( self._id_01E7 >= 100 && isdefined( self._id_2582 ) && self._id_2582.size > 0 )
            self._id_2582 = [];

        wait 0.05;
    }
}

_id_8E2E( var_0, var_1 )
{
    var_2 = spawnstruct();

    if ( isdefined( var_0 ) )
        var_2._id_6234 = var_0;

    if ( isdefined( var_1 ) )
        var_2._id_31BA = var_1;

    var_2._id_2662 = ::_id_8E2F;
    thread _id_A747::_id_45BC( var_2 );
}

_id_8E2F( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self endon( "death" );

    if ( isdefined( self ) )
    {
        if ( isdefined( var_0._id_6234 ) )
        {
            if ( var_0._id_6234 == "detonate" )
                self _meth_81D6();
            else
                self notify( var_0._id_6234 );
        }
        else
            self delete();
    }
}

_id_3FAC()
{
    var_0 = 10;

    if ( isdefined( level._id_43FD ) )
        var_0 = level._id_43FD;

    var_1 = 0;

    if ( isdefined( level._id_6F04 ) )
        var_1 = ( gettime() - level._id_6F04 ) / 1000;

    return var_0 - var_1;
}

_id_4C6B()
{
    return _id_3FAC() > 0;
}

_id_5201( var_0 )
{
    if ( isendstr( var_0, "_gl" ) )
        return 0;

    switch ( var_0 )
    {
        case "frag_grenade_mp":
        case "semtex_mp":
        case "explosive_drone_mp":
        case "semtex_mp_lefthand":
        case "explosive_drone_mp_lefthand":
        case "frag_grenade_mp_lefthand":
            return 0;
        default:
            break;
    }

    var_1 = getweaponbasename( var_0 );

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case "iw5_mahem_mp":
            case "iw5_maaws_mp":
            case "iw5_exocrossbow_mp":
            case "iw5_microdronelauncher_mp":
            case "iw5_stingerm7_mp":
                return 0;
            default:
                break;
        }
    }

    return 1;
}

_id_A225()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        [ var_1, var_2, var_3 ] = _id_A4F0::_id_A069( "grenade_fire", "missile_fire" );

        if ( !isdefined( var_3 ) || var_3 == "" )
            continue;

        if ( _id_4C6B() )
        {
            if ( !_id_5201( var_3 ) )
            {
                var_4 = int( _id_3FAC() + 0.5 );

                if ( !var_4 )
                    var_4 = 1;

                if ( isplayer( self ) )
                    self _meth_826E( &"MP_EXPLOSIVES_UNAVAILABLE_FOR_N", var_4 );
            }

            continue;
        }

        break;
    }
}

isprimaryorsecondaryprojectileweapon( var_0 )
{
    var_1 = _id_A75A::_id_4164( var_0 );
    var_2 = _id_A75A::_id_3F0F( var_0 );

    if ( var_1 == "weapon_projectile" )
        return 1;

    if ( isdefined( var_2 ) && ( issubstr( var_2, "microdronelauncher" ) || issubstr( var_2, "exocrossbow" ) ) )
        return 1;

    return 0;
}

saveweapon( var_0, var_1, var_2 )
{
    var_3 = self.saveweapons.size;

    if ( var_3 == 0 )
        self.firstsaveweapon = var_1;

    self.saveweapons[var_3]["type"] = var_0;
    self.saveweapons[var_3]["use"] = var_2;
}

getsavedweapon( var_0 )
{
    var_1 = self.saveweapons.size;
    var_2 = -1;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        if ( self.saveweapons[var_3]["type"] == var_0 )
        {
            var_2 = var_3;
            break;
        }
    }

    if ( var_2 >= 0 )
        return self.saveweapons[var_2]["use"];
    else
        return "none";
}

_id_74B0( var_0 )
{
    var_1 = [];
    var_2 = self.saveweapons.size;
    var_3 = -1;
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        if ( var_3 < 0 && self.saveweapons[var_5]["type"] == var_0 )
        {
            var_3 = var_5;
            continue;
        }

        var_1[var_4] = self.saveweapons[var_5];
        var_4++;
    }

    if ( var_3 >= 0 )
    {
        var_6 = "none";

        if ( var_1.size == 0 )
        {
            var_6 = self.firstsaveweapon;
            self.saveweapons = var_1;
            self.firstsaveweapon = "none";
        }
        else
        {
            self.saveweapons = var_1;
            var_6 = getsavedweapon( "underwater" );

            if ( var_6 == "none" )
                var_6 = self.saveweapons[0]["use"];
        }

        var_7 = self _meth_8311();

        if ( var_7 != var_6 )
            self _meth_8316( var_6 );
    }
}
