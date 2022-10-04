// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_67CA = [];
    level._id_8A36 = "specialty_s1_temp";
    level._id_8A34 = "specialty_s1_temp";
    level._id_8A35 = "specialty_s1_temp";
    level._id_8A37 = "specialty_s1_temp";

    if ( !isdefined( level.iszombiegame ) || !level.iszombiegame )
    {
        level._id_89D9["enemy"] = "static_tactical_insertion_device";
        level._id_89D9["friendly"] = "static_tactical_insertion_device";
        level._id_89D8["enemy"] = loadfx( "vfx/props/tac_insert_enemy" );
        level._id_89D8["friendly"] = loadfx( "vfx/props/tac_insert_friendly" );
        level._id_89CB = loadfx( "vfx/explosion/mp_tac_explosion" );
    }

    level._id_058F["ricochet"] = loadfx( "fx/impacts/large_metalhit_1" );
    level._id_7B3F = [];
    level._id_67CE = [];
    level._id_67D2 = [];
    level._id_7B3F["specialty_blastshield"] = 1;
    level._id_7B3F["_specialty_blastshield"] = 1;
    level._id_7B3F["specialty_akimbo"] = 1;
    level._id_7B3F["specialty_falldamage"] = 1;
    level._id_7B3F["specialty_shield"] = 1;
    level._id_7B3F["specialty_feigndeath"] = 1;
    level._id_7B3F["specialty_shellshock"] = 1;
    level._id_7B3F["specialty_delaymine"] = 1;
    level._id_7B3F["specialty_localjammer"] = 1;
    level._id_7B3F["specialty_thermal"] = 1;
    level._id_7B3F["specialty_blackbox"] = 1;
    level._id_7B3F["specialty_steelnerves"] = 1;
    level._id_7B3F["specialty_flashgrenade"] = 1;
    level._id_7B3F["specialty_smokegrenade"] = 1;
    level._id_7B3F["specialty_concussiongrenade"] = 1;
    level._id_7B3F["specialty_saboteur"] = 1;
    level._id_7B3F["specialty_endgame"] = 1;
    level._id_7B3F["specialty_rearview"] = 1;
    level._id_7B3F["specialty_hardline"] = 1;
    level._id_7B3F["specialty_onemanarmy"] = 1;
    level._id_7B3F["specialty_primarydeath"] = 1;
    level._id_7B3F["specialty_secondarybling"] = 1;
    level._id_7B3F["specialty_explosivedamage"] = 1;
    level._id_7B3F["specialty_laststandoffhand"] = 1;
    level._id_7B3F["specialty_dangerclose"] = 1;
    level._id_7B3F["specialty_hardjack"] = 1;
    level._id_7B3F["specialty_extraspecialduration"] = 1;
    level._id_7B3F["specialty_rollover"] = 1;
    level._id_7B3F["specialty_armorpiercing"] = 1;
    level._id_7B3F["specialty_omaquickchange"] = 1;
    level._id_7B3F["_specialty_rearview"] = 1;
    level._id_7B3F["_specialty_onemanarmy"] = 1;
    level._id_7B3F["specialty_steadyaimpro"] = 1;
    level._id_7B3F["specialty_stun_resistance"] = 1;
    level._id_7B3F["specialty_double_load"] = 1;
    level._id_7B3F["specialty_regenspeed"] = 1;
    level._id_7B3F["specialty_twoprimaries"] = 1;
    level._id_7B3F["specialty_autospot"] = 1;
    level._id_7B3F["specialty_overkillpro"] = 1;
    level._id_7B3F["specialty_anytwo"] = 1;
    level._id_7B3F["specialty_fasterlockon"] = 1;
    level._id_7B3F["specialty_paint"] = 1;
    level._id_7B3F["specialty_paint_pro"] = 1;
    level._id_7B3F["specialty_silentkill"] = 1;
    level._id_7B3F["specialty_crouchmovement"] = 1;
    level._id_7B3F["specialty_personaluav"] = 1;
    level._id_7B3F["specialty_unwrapper"] = 1;
    level._id_7B3F["specialty_class_blindeye"] = 1;
    level._id_7B3F["specialty_class_lowprofile"] = 1;
    level._id_7B3F["specialty_class_coldblooded"] = 1;
    level._id_7B3F["specialty_class_hardwired"] = 1;
    level._id_7B3F["specialty_class_scavenger"] = 1;
    level._id_7B3F["specialty_class_hoarder"] = 1;
    level._id_7B3F["specialty_class_gungho"] = 1;
    level._id_7B3F["specialty_class_steadyhands"] = 1;
    level._id_7B3F["specialty_class_hardline"] = 1;
    level._id_7B3F["specialty_class_peripherals"] = 1;
    level._id_7B3F["specialty_class_quickdraw"] = 1;
    level._id_7B3F["specialty_class_toughness"] = 1;
    level._id_7B3F["specialty_class_lightweight"] = 1;
    level._id_7B3F["specialty_class_engineer"] = 1;
    level._id_7B3F["specialty_class_dangerclose"] = 1;
    level._id_7B3F["specialty_horde_weaponsfree"] = 1;
    level._id_7B3F["specialty_horde_dualprimary"] = 1;
    level._id_7B3F["specialty_marksman"] = 1;
    level._id_7B3F["specialty_sharp_focus"] = 1;
    level._id_7B3F["specialty_moredamage"] = 1;
    level._id_7B3F["specialty_copycat"] = 1;
    level._id_7B3F["specialty_finalstand"] = 1;
    level._id_7B3F["specialty_juiced"] = 1;
    level._id_7B3F["specialty_light_armor"] = 1;
    level._id_7B3F["specialty_carepackage"] = 1;
    level._id_7B3F["specialty_stopping_power"] = 1;
    level._id_7B3F["specialty_uav"] = 1;
    level._id_7B3F["bouncingbetty_mp"] = 1;
    level._id_7B3F["c4_mp"] = 1;
    level._id_7B3F["claymore_mp"] = 1;
    level._id_7B3F["frag_grenade_mp"] = 1;
    level._id_7B3F["semtex_mp"] = 1;
    level._id_7B3F["tracking_drone_mp"] = 1;
    level._id_7B3F["throwingknife_mp"] = 1;
    level._id_7B3F["exoknife_mp"] = 1;
    level._id_7B3F["exoknife_jug_mp"] = 1;
    level._id_7B3F["paint_grenade_mp"] = 1;
    level._id_7B3F["tri_drone_mp"] = 1;
    level._id_7B3F["explosive_gel_mp"] = 1;
    level._id_7B3F["frag_grenade_var_mp"] = 1;
    level._id_7B3F["contact_grenade_var_mp"] = 1;
    level._id_7B3F["semtex_grenade_var_mp"] = 1;
    level._id_7B3F["stun_grenade_var_mp"] = 1;
    level._id_7B3F["emp_grenade_var_mp"] = 1;
    level._id_7B3F["paint_grenade_var_mp"] = 1;
    level._id_7B3F["smoke_grenade_var_mp"] = 1;
    level._id_7B3F["explosive_drone_mp"] = 1;
    level._id_7B3F["concussion_grenade_mp"] = 1;
    level._id_7B3F["flash_grenade_mp"] = 1;
    level._id_7B3F["stun_grenade_mp"] = 1;
    level._id_7B3F["smoke_grenade_mp"] = 1;
    level._id_7B3F["emp_grenade_mp"] = 1;
    level._id_7B3F["portable_radar_mp"] = 1;
    level._id_7B3F["scrambler_mp"] = 1;
    level._id_7B3F["trophy_mp"] = 1;
    level._id_7B3F["s1_tactical_insertion_device_mp"] = 1;
    level._id_7B3F["specialty_wildcard_perkslot1"] = 1;
    level._id_7B3F["specialty_wildcard_perkslot2"] = 1;
    level._id_7B3F["specialty_wildcard_perkslot3"] = 1;
    level._id_7B3F["specialty_wildcard_primaryattachment"] = 1;
    level._id_7B3F["specialty_wildcard_secondaryattachment"] = 1;
    level._id_7B3F["specialty_wildcard_extrastreak"] = 1;
    level._id_7B3F["specialty_null"] = 1;
    level._id_67CE["specialty_blastshield"] = _id_A7DB::_id_7F2A;
    level._id_67D2["specialty_blastshield"] = _id_A7DB::_id_9A5C;
    level._id_67CE["specialty_falldamage"] = _id_A7DB::_id_7F71;
    level._id_67D2["specialty_falldamage"] = _id_A7DB::_id_9A6B;
    level._id_67CE["specialty_localjammer"] = _id_A7DB::_id_7F9E;
    level._id_67D2["specialty_localjammer"] = _id_A7DB::_id_9A76;
    level._id_67CE["specialty_thermal"] = _id_A7DB::_id_8029;
    level._id_67D2["specialty_thermal"] = _id_A7DB::_id_9A8C;
    level._id_67CE["specialty_blackbox"] = _id_A7DB::_id_7F29;
    level._id_67D2["specialty_blackbox"] = _id_A7DB::_id_9A5B;
    level._id_67CE["specialty_lightweight"] = _id_A7DB::_id_7F9D;
    level._id_67D2["specialty_lightweight"] = _id_A7DB::_id_9A75;
    level._id_67CE["specialty_steelnerves"] = _id_A7DB::_id_8016;
    level._id_67D2["specialty_steelnerves"] = _id_A7DB::_id_9A88;
    level._id_67CE["specialty_delaymine"] = _id_A7DB::_id_7F49;
    level._id_67D2["specialty_delaymine"] = _id_A7DB::_id_9A60;
    level._id_67CE["specialty_saboteur"] = _id_A7DB::_id_7FFA;
    level._id_67D2["specialty_saboteur"] = _id_A7DB::_id_9A81;
    level._id_67CE["specialty_endgame"] = _id_A7DB::_id_7F5C;
    level._id_67D2["specialty_endgame"] = _id_A7DB::_id_9A63;
    level._id_67CE["specialty_rearview"] = _id_A7DB::_id_7FF4;
    level._id_67D2["specialty_rearview"] = _id_A7DB::_id_9A7E;
    level._id_67CE["specialty_onemanarmy"] = _id_A7DB::_id_7FC9;
    level._id_67D2["specialty_onemanarmy"] = _id_A7DB::_id_9A79;
    level._id_67CE["specialty_steadyaimpro"] = _id_A7DB::_id_8015;
    level._id_67D2["specialty_steadyaimpro"] = _id_A7DB::_id_9A87;
    level._id_67CE["specialty_stun_resistance"] = _id_A7DB::_id_801A;
    level._id_67D2["specialty_stun_resistance"] = _id_A7DB::_id_9A8B;
    level._id_67CE["specialty_marksman"] = _id_A7DB::_id_7FA2;
    level._id_67D2["specialty_marksman"] = _id_A7DB::_id_9A77;
    level._id_67CE["specialty_double_load"] = _id_A7DB::_id_7F53;
    level._id_67D2["specialty_double_load"] = _id_A7DB::_id_9A61;
    level._id_67CE["specialty_sharp_focus"] = _id_A7DB::_id_8001;
    level._id_67D2["specialty_sharp_focus"] = _id_A7DB::_id_9A82;
    level._id_67CE["specialty_regenspeed"] = _id_A7DB::_id_7FF8;
    level._id_67D2["specialty_regenspeed"] = _id_A7DB::_id_9A80;
    level._id_67CE["specialty_autospot"] = _id_A7DB::_id_7F25;
    level._id_67D2["specialty_autospot"] = _id_A7DB::_id_9A5A;
    level._id_67CE["specialty_empimmune"] = _id_A7DB::_id_7F5A;
    level._id_67D2["specialty_empimmune"] = _id_A7DB::_id_9A62;
    level._id_67CE["specialty_overkill_pro"] = _id_A7DB::_id_7FD1;
    level._id_67D2["specialty_overkill_pro"] = _id_A7DB::_id_9A7B;
    level._id_67CE["specialty_personaluav"] = _id_A7DB::_id_7FDA;
    level._id_67D2["specialty_personaluav"] = _id_A7DB::_id_9A7D;
    level._id_67CE["specialty_crouchmovement"] = _id_A7DB::_id_7F3D;
    level._id_67D2["specialty_crouchmovement"] = _id_A7DB::_id_9A5F;
    level._id_67CE["specialty_light_armor"] = _id_A7DB::_id_7F9A;
    level._id_67D2["specialty_light_armor"] = _id_A7DB::_id_9A74;
    level._id_67CE["specialty_finalstand"] = _id_A7DB::_id_7F67;
    level._id_67D2["specialty_finalstand"] = _id_A7DB::_id_9A68;
    level._id_67CE["specialty_juiced"] = _id_A7DB::_id_7F91;
    level._id_67D2["specialty_juiced"] = _id_A7DB::_id_9A70;
    level._id_67CE["specialty_carepackage"] = _id_A7DB::_id_7F2D;
    level._id_67D2["specialty_carepackage"] = _id_A7DB::_id_9A5E;
    level._id_67CE["specialty_stopping_power"] = _id_A7DB::_id_8019;
    level._id_67D2["specialty_stopping_power"] = _id_A7DB::_id_9A8A;
    level._id_67CE["specialty_uav"] = _id_A7DB::_id_8035;
    level._id_67D2["specialty_uav"] = _id_A7DB::_id_9A8D;
    _id_4DF5();
    level thread _id_64C5();
}

_id_9C46( var_0, var_1 )
{
    if ( getdvarint( "scr_game_perks" ) == 0 )
        return "specialty_null";

    if ( var_0 == 0 || var_0 == 1 )
    {
        switch ( var_1 )
        {
            case "specialty_class_lowprofile":
            case "specialty_class_lightweight":
            case "specialty_class_dangerclose":
            case "specialty_extended_battery":
            case "specialty_class_flakjacket":
                return var_1;
            default:
                return "specialty_null";
        }
    }
    else if ( var_0 == 2 || var_0 == 3 )
    {
        switch ( var_1 )
        {
            case "specialty_class_blindeye":
            case "specialty_class_coldblooded":
            case "specialty_class_peripherals":
            case "specialty_class_fasthands":
            case "specialty_class_dexterity":
                return var_1;
            default:
                return "specialty_null";
        }
    }
    else if ( var_0 == 4 || var_0 == 5 )
    {
        switch ( var_1 )
        {
            case "specialty_class_hardwired":
            case "specialty_class_scavenger":
            case "specialty_class_hardline":
            case "specialty_class_toughness":
            case "specialty_exo_blastsuppressor":
                return var_1;
            default:
                return "specialty_null";
        }
    }

    return var_1;
}

_id_3F7A()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 6; var_1++ )
        var_0[var_1] = "specialty_null";

    return var_0;
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
    self._id_030B = [];
    self._id_A2D4 = [];
    self._id_6433 = 0;

    for (;;)
    {
        self waittill( "spawned_player" );
        self._id_6433 = 0;
        thread _id_A7AB::_id_78FA();
    }
}

_id_198D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = 0;
    var_10 = _id_A75A::_id_8F56( var_4, "_lefthand" );

    if ( _id_A75A::_id_50CA( var_3 ) )
    {
        if ( isplayer( var_1 ) && var_1 _id_A75A::_id_05CB( "specialty_paint_pro" ) && !_id_A75A::_id_513A( var_4 ) && isplayer( var_0 ) && !var_0 _id_A75A::_id_05CB( "specialty_class_lowprofile" ) )
        {
            if ( !var_0 _id_A7DB::_id_516A() )
                var_1 _id_A7A0::_id_6FF3( "ch_bulletpaint" );

            if ( var_1._id_9507._id_4701 )
                var_0 thread _id_A758::_id_7E8C( var_1 );

            var_0 thread _id_A7DB::_id_7FD5( var_1 );
        }

        if ( isplayer( var_1 ) && isdefined( var_4 ) && _id_A75A::_id_4164( var_4 ) == "weapon_sniper" && issubstr( var_4, "silencer" ) )
            var_2 *= 0.75;

        if ( isplayer( var_1 ) && ( var_1 _id_A75A::_id_05CB( "specialty_bulletdamage" ) && var_0 _id_A75A::_id_05CB( "specialty_armorvest" ) ) )
            var_9 += 0;
        else if ( isplayer( var_1 ) && ( var_1 _id_A75A::_id_05CB( "specialty_bulletdamage" ) || var_1 _id_A75A::_id_05CB( "specialty_moredamage" ) ) )
            var_9 += var_2 * level._id_18AB;
        else if ( var_0 _id_A75A::_id_05CB( "specialty_armorvest" ) )
            var_9 -= var_2 * level._id_0CD3;

        if ( var_0 _id_A75A::_id_512E() )
        {
            var_11 = isdefined( var_0._id_52A6 ) && var_0._id_52A6 && ( var_7 == "head" || var_7 == "helmet" );

            if ( !var_11 )
                var_2 *= level._id_52A1;
        }
    }
    else if ( isexplosivedamagemod( var_3 ) )
    {
        if ( isplayer( var_1 ) && var_1 != var_0 && ( var_1 _meth_8221( "specialty_paint" ) && var_1 _id_A75A::_id_05CB( "specialty_paint" ) ) && !_id_A75A::_id_513A( var_4 ) )
        {
            if ( !var_0 _id_A7DB::_id_516A() )
                var_1 _id_A7A0::_id_6FF3( "ch_paint_pro" );

            var_0 thread _id_A7DB::_id_7FD5( var_1 );
        }

        if ( isplayer( var_1 ) && weaponinheritsperks( var_4 ) && ( var_1 _id_A75A::_id_05CB( "specialty_explosivedamage" ) && var_0 _id_A75A::_id_05CB( "_specialty_blastshield" ) ) )
            var_9 += 0;
        else if ( isplayer( var_1 ) && weaponinheritsperks( var_4 ) && var_1 _id_A75A::_id_05CB( "specialty_explosivedamage" ) )
            var_9 += var_2 * level._id_354E;
        else if ( var_0 _id_A75A::_id_05CB( "_specialty_blastshield" ) && isdefined( var_0._id_8A33 ) && ( var_10 != "semtex_mp" || var_2 < 125 ) )
            var_9 -= int( var_2 * var_0._id_8A33 );

        if ( _id_A75A::_id_513A( var_4 ) && isplayer( var_1 ) && var_1 _id_A75A::_id_05CB( "specialty_explosivedamage" ) )
            var_9 += var_2 * level._id_354E;

        if ( var_0 _id_A75A::_id_512E() )
        {
            switch ( var_4 )
            {
                case "ac130_25mm_mp":
                    var_2 *= level._id_52A1;
                    break;
                case "remotemissile_projectile_mp":
                case "remotemissile_projectile_cluster_parent_mp":
                case "remotemissile_projectile_gas_mp":
                    if ( var_2 < 350 )
                    {
                        if ( var_2 > 1 )
                            var_2 *= level._id_52A1;
                    }

                    break;
                default:
                    if ( var_2 < 1000 )
                    {
                        if ( var_2 > 1 )
                            var_2 *= level._id_52A1;
                    }

                    break;
            }
        }

        if ( _id_A7B4::_id_4C6B() )
            var_2 *= level._id_52A1;
    }
    else if ( var_3 == "MOD_FALLING" )
    {
        if ( var_0 _meth_8221( "specialty_falldamage" ) && var_0 _id_A75A::_id_05CB( "specialty_falldamage" ) )
        {
            var_9 = 0;
            var_2 = 0;
        }
    }
    else if ( _id_A75A::_id_514D( var_3 ) )
    {
        if ( isdefined( var_0._id_4732 ) && var_0._id_4732 )
        {
            if ( issubstr( var_4, "riotshield" ) || var_4 == "exoshield_equipment_mp" )
                var_2 = int( var_0._id_0275 * 0.66 );
            else
                var_2 = var_0._id_0275 + 1;
        }

        if ( var_0 _id_A75A::_id_512E() )
        {
            var_2 = 20;
            var_9 = 0;
        }
    }
    else if ( var_3 == "MOD_IMPACT" )
    {
        if ( var_0 _id_A75A::_id_512E() )
        {
            switch ( var_10 )
            {
                case "frag_grenade_mp":
                case "stun_grenade_horde_mp":
                case "semtex_mp":
                case "flash_grenade_mp":
                case "concussion_grenade_mp":
                case "stun_grenade_mp":
                case "smoke_grenade_mp":
                case "stun_grenade_var_mp":
                case "smoke_grenade_var_mp":
                    var_2 = 5;
                    break;
                default:
                    if ( var_2 < 1000 )
                        var_2 = 25;

                    break;
            }

            var_9 = 0;
        }
    }

    var_12 = getweaponbasename( var_4 );

    if ( isdefined( var_0._id_5711 ) && isdefined( var_12 ) )
    {
        switch ( var_12 )
        {
            case "exoknife_jug_mp":
            case "exoknife_mp":
                var_2 = var_0._id_01E7;
                var_9 = 0;
                break;
            case "semtexproj_mp":
            case "semtex_mp":
                if ( isdefined( var_8 ) && isdefined( var_8._id_8F66 ) && var_8._id_8F66 == var_0 )
                {
                    var_2 = var_0._id_01E7;
                    var_9 = 0;
                }

                break;
            default:
                if ( var_3 != "MOD_FALLING" && !_id_A75A::_id_514D( var_3 ) && !_id_A75A::_id_5114( var_12, var_7, var_3, var_1 ) && !_id_A75A::_id_5109( var_12, var_3, var_1 ) )
                {
                    var_0 _id_A7DB::_id_7F9B( var_0._id_5711 - var_2 + var_9 );
                    var_2 = 0;
                    var_9 = 0;

                    if ( var_0._id_5711 <= 0 )
                    {
                        var_2 = abs( var_0._id_5711 );
                        var_9 = 0;
                        _id_A7DB::_id_9A74();
                    }
                }

                break;
        }
    }

    if ( var_2 <= 1 )
    {
        var_2 = 1;
        return var_2;
    }
    else
        return int( var_2 + var_9 );
}

_id_4DF5()
{
    level._id_52A1 = 0.08;
    level._id_5298 = 0.08;
    level._id_0CD2 = 1.5;
    level._id_72CF = 0.25;
    level._id_18AB = _id_A75A::_id_3FD9( "perk_bulletDamage", 12 ) / 100;
    level._id_354E = _id_A75A::_id_3FD9( "perk_explosiveDamage", 10 ) / 100;
    level._id_7551 = _id_A75A::_id_3FD9( "perk_riotShield", 100 ) / 100;
    level._id_0CD3 = _id_A75A::_id_3FD9( "perk_armorVest", 20 ) / 100;
}

_id_198F()
{

}

_id_41E0()
{
    self endon( "death" );
    self endon( "disconnect" );
    _id_A75A::_id_41F5( "specialty_blindeye", 0 );
    self._id_89F3 = 1;

    while ( self._id_11FC > 0 )
    {
        self._id_11FC -= 0.05;
        wait 0.05;
    }

    _id_A75A::_id_067B( "specialty_blindeye" );
    self._id_89F3 = 0;
}

_id_0CAF()
{
    self _meth_8309( 0.5 );

    if ( _id_A75A::_id_05CB( "specialty_extended_battery" ) )
        _id_A75A::_id_41F5( "specialty_exo_slamboots", 0 );

    if ( _id_A75A::_id_05CB( "specialty_class_lowprofile" ) )
    {
        _id_A75A::_id_41F5( "specialty_radarimmune", 0 );
        _id_A75A::_id_41F5( "specialty_exoping_immune", 0 );
    }

    if ( _id_A75A::_id_05CB( "specialty_class_flakjacket" ) )
    {
        _id_A75A::_id_41F5( "specialty_hard_shell", 0 );
        _id_A75A::_id_41F5( "specialty_throwback", 0 );
        _id_A75A::_id_41F5( "_specialty_blastshield", 0 );
        self._id_8A33 = _id_A75A::_id_3FD9( "perk_blastShieldScale", 45 ) / 100;

        if ( isdefined( level._id_46C7 ) && level._id_46C7 )
            self._id_8A33 = _id_A75A::_id_3FD9( "perk_blastShieldScale_HC", 50 ) / 100;
    }

    if ( _id_A75A::_id_05CB( "specialty_class_lightweight" ) )
        _id_A75A::_id_41F5( "specialty_lightweight", 0 );

    if ( _id_A75A::_id_05CB( "specialty_class_dangerclose" ) )
        _id_A75A::_id_41F5( "specialty_explosivedamage", 0 );

    if ( _id_A75A::_id_05CB( "specialty_class_blindeye" ) )
    {
        _id_A75A::_id_41F5( "specialty_blindeye", 0 );
        _id_A75A::_id_41F5( "specialty_plainsight", 0 );
    }

    if ( _id_A75A::_id_05CB( "specialty_class_coldblooded" ) )
    {
        _id_A75A::_id_41F5( "specialty_coldblooded", 0 );
        _id_A75A::_id_41F5( "specialty_spygame", 0 );
        _id_A75A::_id_41F5( "specialty_heartbreaker", 0 );
    }

    if ( _id_A75A::_id_05CB( "specialty_class_peripherals" ) || _id_A75A::_id_6E98() )
    {
        _id_A75A::_id_41F5( "specialty_moreminimap", 0 );
        _id_A75A::_id_41F5( "specialty_silentkill", 0 );
    }

    if ( _id_A75A::_id_05CB( "specialty_class_fasthands" ) )
    {
        _id_A75A::_id_41F5( "specialty_quickswap", 0 );
        _id_A75A::_id_41F5( "specialty_fastoffhand", 0 );
        _id_A75A::_id_41F5( "specialty_sprintreload", 0 );
    }

    if ( _id_A75A::_id_05CB( "specialty_class_dexterity" ) )
        _id_A75A::_id_41F5( "specialty_sprintfire", 0 );

    if ( _id_A75A::_id_05CB( "specialty_class_hardwired" ) )
    {
        _id_A75A::_id_41F5( "specialty_empimmune", 0 );
        _id_A75A::_id_41F5( "specialty_stun_resistance", 0 );
        self._id_8F71 = 0.1;
    }

    if ( _id_A75A::_id_05CB( "specialty_class_toughness" ) )
        self _meth_8309( 0.2 );

    if ( _id_A75A::_id_05CB( "specialty_class_scavenger" ) )
    {
        self._id_0B7B = 0.2;
        _id_A75A::_id_41F5( "specialty_scavenger", 0 );
        _id_A75A::_id_41F5( "specialty_bulletresupply", 0 );
        _id_A75A::_id_41F5( "specialty_extraammo", 0 );
    }

    if ( _id_A75A::_id_05CB( "specialty_class_hardline" ) )
        _id_A75A::_id_41F5( "specialty_hardline", 0 );
}
