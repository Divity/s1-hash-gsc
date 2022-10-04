// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( level._id_5FE9 )
    {
        foreach ( var_1 in level._id_91F0 )
        {
            level._id_51CD[var_1] = 0;
            level._id_8A13[var_1] = [];
        }
    }
    else
    {
        level._id_51CD["allies"] = 0;
        level._id_51CD["axis"] = 0;
        level._id_8A13["allies"] = [];
        level._id_8A13["axis"] = [];
    }

    level._id_1358 = [];
    level._id_1358["reload"] = "inform_reloading_generic";
    level._id_1358["frag_out"] = "inform_attack_grenade";
    level._id_1358["semtex_out"] = "semtex_use";
    level._id_1358["conc_out"] = "inform_attack_stun";
    level._id_1358["smoke_out"] = "inform_attack_smoke";
    level._id_1358["emp_out"] = "emp_use";
    level._id_1358["threat_out"] = "threat_use";
    level._id_1358["drone_out"] = "inform_drone_use";
    level._id_1358["grenade_incoming"] = "grenade_incoming";
    level._id_1358["semtex_incoming"] = "semtex_incoming";
    level._id_1358["stun_incoming"] = "stun_incoming";
    level._id_1358["emp_incoming"] = "incoming_emp";
    level._id_1358["drone_incoming"] = "inform_drone_enemy";
    level._id_1358["exo_cloak_use"] = "inform_cloaking_use";
    level._id_1358["exo_overclock_use"] = "inform_overclock_use";
    level._id_1358["exo_ping_use"] = "exo_ping";
    level._id_1358["exo_shield_use"] = "exo_shield_use";
    level._id_1358["callout_generic"] = "threat_infantry_generic";
    level._id_1358["callout_sniper"] = "threat_sniper_generic";
    level._id_1358["callout_hover"] = "enemy_hover";
    level._id_1358["callout_shield"] = "exo_shield_enemy";
    level._id_1358["callout_cloak"] = "inform_cloaking_enemy";
    level._id_1358["callout_overclock"] = "inform_overclock_enemy";
    level._id_1358["callout_response_generic"] = "response_ack_yes";
    level._id_1358["kill"] = "inform_killfirm_infantry";
    level._id_1358["casualty"] = "inform_casualty_generic";
    level._id_1358["suppressing_fire"] = "cmd_suppressfire";
    level._id_1358["moving"] = "order_move_combat";
    level._id_1358["damage"] = "inform_taking_fire";
    level._id_133F = [];
    level._id_133F["timeout"]["suppressing_fire"] = 5000;
    level._id_133F["timeout"]["moving"] = 45000;
    level._id_133F["timeout"]["callout_generic"] = 15000;
    level._id_133F["timeout"]["callout_location"] = 3000;
    level._id_133F["timeout_player"]["suppressing_fire"] = 10000;
    level._id_133F["timeout_player"]["moving"] = 120000;
    level._id_133F["timeout_player"]["callout_generic"] = 5000;
    level._id_133F["timeout_player"]["callout_location"] = 5000;

    foreach ( var_5, var_4 in level._id_8A13 )
    {
        level._id_133F["last_say_time"][var_5]["suppressing_fire"] = -99999;
        level._id_133F["last_say_time"][var_5]["moving"] = -99999;
        level._id_133F["last_say_time"][var_5]["callout_generic"] = -99999;
        level._id_133F["last_say_time"][var_5]["callout_location"] = -99999;
        level._id_133F["last_say_pos"][var_5]["suppressing_fire"] = ( 0, 0, -9000 );
        level._id_133F["last_say_pos"][var_5]["moving"] = ( 0, 0, -9000 );
        level._id_133F["last_say_pos"][var_5]["callout_generic"] = ( 0, 0, -9000 );
        level._id_133F["last_say_pos"][var_5]["callout_location"] = ( 0, 0, -9000 );
        level._id_9F2A[var_5][""] = 0;
        level._id_9F2A[var_5]["w"] = 0;
    }

    common_scripts\_bcs_location_trigs::_id_1349();
    var_6 = getdvar( "g_gametype" );
    level._id_51C4 = 1;

    if ( var_6 == "war" || var_6 == "kc" || var_6 == "dom" )
        level._id_51C4 = 0;

    level thread _id_64C5();
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
        self._id_133F = [];
        self._id_133F["last_say_time"]["suppressing_fire"] = -99999;
        self._id_133F["last_say_time"]["moving"] = -99999;
        self._id_133F["last_say_time"]["callout_generic"] = -99999;
        self._id_133F["last_say_time"]["callout_location"] = -99999;
        var_0 = _id_A7B2::_id_411E( self._id_04A8 );

        if ( level._id_00E4 )
        {
            var_1 = 5;
            var_2 = 3;
        }
        else
        {
            var_1 = 9;
            var_2 = 5;
        }

        var_3 = "";

        if ( !isagent( self ) && self _meth_843A() )
            var_3 = "w";

        self._id_030D["voiceNum"] = level._id_9F2A[self._id_04A8][var_3];

        if ( var_3 == "w" )
            level._id_9F2A[self._id_04A8][var_3] = ( level._id_9F2A[self._id_04A8][var_3] + 1 ) % var_2;
        else
            level._id_9F2A[self._id_04A8][var_3] = ( level._id_9F2A[self._id_04A8][var_3] + 1 ) % var_1;

        self._id_030D["voicePrefix"] = var_0 + var_3 + self._id_030D["voiceNum"] + "_";

        if ( level._id_8A76 )
            continue;

        if ( !level._id_91E4 )
            continue;

        thread _id_731B();
        thread _id_440B();
        thread _id_4402();
        thread _id_34FA();
        thread _id_8FE3();
        thread _id_1BC5();
        thread _id_25B1();
        thread _id_8AA7();
        thread _id_9321();
    }
}

_id_4402()
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 = self._id_02E6;
    var_1 = 147456;

    for (;;)
    {
        if ( _id_A4F0::_id_2006() )
        {
            wait 5;
            continue;
        }

        var_2 = _id_A4F0::_id_928D( isdefined( level._id_4404 ), level._id_4404, [] );
        var_3 = _id_A4F0::_id_928D( isdefined( level._id_5CBF ), level._id_5CBF, [] );
        var_4 = _id_A4F0::_id_928D( isdefined( level._id_94EA ), level._id_94EA, [] );

        if ( var_2.size + var_3.size + var_4.size < 1 || !_id_A75A::_id_5186( self ) )
        {
            wait 0.05;
            continue;
        }

        var_2 = _id_A4F0::_id_0CDD( var_2, var_3 );
        var_2 = _id_A4F0::_id_0CDD( var_2, var_4 );

        if ( var_2.size < 1 )
        {
            wait 0.05;
            continue;
        }

        foreach ( var_6 in var_2 )
        {
            wait 0.05;

            if ( !isdefined( var_6 ) )
                continue;

            var_7 = isdefined( var_6._id_04D8 ) && ( var_6._id_04D8 == "explosive_drone" || var_6._id_04D8 == "tracking_drone" );

            if ( isdefined( var_6._id_A2D6 ) )
            {
                switch ( var_6._id_A2D6 )
                {
                    case "gamemode_ball":
                        continue;
                }

                if ( _func_1DF( var_6._id_A2D6 ) != "offhand" && weaponclass( var_6._id_A2D6 ) == "grenade" )
                    continue;
            }

            if ( !isdefined( var_6._id_02E9 ) && !var_7 )
                var_6._id_02E9 = getmissileowner( var_6 );

            if ( isdefined( var_6._id_02E9 ) && isdefined( var_6._id_02E9._id_04A8 ) && level._id_91E4 && var_6._id_02E9._id_04A8 == self._id_04A8 )
                continue;

            var_8 = distancesquared( var_6._id_02E6, self._id_02E6 );

            if ( var_8 < var_1 )
            {
                if ( bullettracepassed( var_6._id_02E6, self._id_02E6, 0, self ) )
                {
                    var_9 = "";

                    if ( var_7 )
                        var_9 = "drone_incoming";
                    else if ( isdefined( var_6._id_A2D6 ) )
                    {
                        switch ( var_6._id_A2D6 )
                        {
                            case "semtex_mp":
                                var_9 = "semtex_incoming";
                                break;
                            case "stun_grenade_mp":
                            case "stun_grenade_var_mp":
                                var_9 = "stun_incoming";
                                break;
                            case "emp_grenade_mp":
                            case "emp_grenade_var_mp":
                                var_9 = "emp_incoming";
                        }
                    }

                    if ( var_9 == "" )
                        var_9 = "grenade_incoming";

                    level thread _id_7823( self, var_9 );
                    wait 5;
                }
            }
        }
    }
}

_id_8FE3()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = undefined;

    for (;;)
    {
        self waittill( "begin_firing" );
        thread _id_8FE9();
        thread _id_8FE8();
        self notify( "stoppedFiring" );
    }
}

_id_8FE8()
{
    thread _id_A057();
    self endon( "begin_firing" );
    self waittill( "end_firing" );
    wait 0.3;
    self notify( "stoppedFiring" );
}

_id_A057()
{
    self endon( "stoppedFiring" );
    self waittill( "begin_firing" );
    thread _id_8FE8();
}

_id_8FE9()
{
    self notify( "suppressWaiter" );
    self endon( "suppressWaiter" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stoppedFiring" );
    wait 1;

    if ( _id_1ADD( "suppressing_fire" ) )
        level thread _id_7823( self, "suppressing_fire" );
}

_id_731B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "reload_start" );
        level thread _id_7823( self, "reload" );
    }
}

_id_440B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = _id_A75A::_id_8F56( var_1, "_lefthand" );

        if ( var_2 == "frag_grenade_mp" || var_2 == "frag_grenade_var_mp" || var_2 == "contact_grenade_var_mp" )
        {
            level thread _id_7823( self, "frag_out" );
            continue;
        }

        if ( var_2 == "semtex_mp" || var_2 == "semtex_grenade_var_mp" )
        {
            level thread _id_7823( self, "semtex_out" );
            continue;
        }

        if ( var_2 == "explosive_drone_mp" || var_2 == "tracking_drone_mp" )
        {
            level thread _id_7823( self, "drone_out" );
            continue;
        }

        if ( var_2 == "concussion_grenade_mp" || var_2 == "stun_grenade_mp" || var_2 == "stun_grenade_var_mp" )
        {
            level thread _id_7823( self, "conc_out" );
            continue;
        }

        if ( var_2 == "smoke_grenade_mp" || var_2 == "smoke_grenade_var_mp" )
        {
            level thread _id_7823( self, "smoke_out" );
            continue;
        }

        if ( var_2 == "emp_grenade_mp" || var_2 == "emp_grenade_var_mp" )
        {
            level thread _id_7823( self, "emp_out" );
            continue;
        }

        if ( var_2 == "paint_grenade_mp" || var_2 == "paint_grenade_var_mp" )
            level thread _id_7823( self, "threat_out" );
    }
}

_id_34FA()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = _id_A735::_id_3D5C();
    var_1 = _id_A730::_id_3D5A();
    var_2 = "exoping_equipment_mp";

    for (;;)
    {
        var_3 = _id_A4F0::_id_A069( "grenade_pullback", "grenade_fire", "exo_adrenaline_fire" );
        waittillframeend;

        if ( var_3[0] == "grenade_pullback" && isdefined( var_3[1] ) && var_3[1] == var_0 && isdefined( self._id_34E9 ) && self._id_34E9 )
        {
            level thread _id_7823( self, "exo_shield_use" );
            continue;
        }

        if ( var_3[0] == "grenade_fire" && isdefined( var_3[2] ) && var_3[2] == var_1 && isdefined( self._id_3474 ) && self._id_3474 )
        {
            level thread _id_7823( self, "exo_cloak_use" );
            continue;
        }

        if ( var_3[0] == "grenade_fire" && isdefined( var_3[2] ) && var_3[2] == var_2 && isdefined( self._id_34B3 ) && self._id_34B3 )
        {
            level thread _id_7823( self, "exo_ping_use" );
            continue;
        }

        if ( var_3[0] == "exo_adrenaline_fire" && isdefined( self._id_65D5 ) && self._id_65D5 )
            level thread _id_7823( self, "exo_overclock_use" );
    }
}

_id_8AA7()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "sprint_begin" );

        if ( _id_1ADD( "moving" ) )
            level thread _id_7823( self, "moving", 0, 0 );
    }
}

_id_25B1()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !isdefined( var_1._id_00AB ) )
            continue;

        if ( isdefined( level._id_511A ) && level._id_511A && isdefined( var_1._id_08A0 ) && var_1._id_08A0 == "dog" )
            continue;

        if ( var_1 != self && var_1._id_00AB != "worldspawn" )
        {
            wait 1.5;
            level thread _id_7823( self, "damage" );
            wait 3;
        }
    }
}

_id_1BC5()
{
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = self._id_04A8;
    self waittill( "death" );

    foreach ( var_2 in level._id_669A )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( var_2 == self )
            continue;

        if ( !_id_A75A::_id_5186( var_2 ) )
            continue;

        if ( var_2._id_04A8 != var_0 )
            continue;

        if ( isdefined( self ) && distancesquared( self._id_02E6, var_2._id_02E6 ) <= 262144 )
        {
            level thread _id_7824( var_2, "casualty", 0.75 );
            break;
        }
    }
}

_id_9321()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "enemy_sighted" );

        if ( getdvarint( "ui_inprematch" ) )
        {
            level waittill( "prematch_over" );
            continue;
        }

        if ( !_id_1ADD( "callout_location" ) && !_id_1ADD( "callout_generic" ) )
            continue;

        var_0 = self _meth_82EB();

        if ( !isdefined( var_0 ) )
            continue;

        var_1 = undefined;
        var_2 = 4000000;

        if ( self _meth_8340() > 0.7 )
            var_2 = 6250000;

        foreach ( var_4 in var_0 )
        {
            if ( isdefined( var_4 ) && _id_A75A::_id_5186( var_4 ) && !var_4 _id_A75A::_id_05CB( "specialty_coldblooded" ) && distancesquared( self._id_02E6, var_4._id_02E6 ) < var_2 )
            {
                var_5 = var_4 _id_4148( self );
                var_1 = var_4;

                if ( isdefined( var_5 ) && _id_1ADD( "callout_location" ) && _id_3A6F( 4840000 ) )
                {
                    if ( _id_A75A::_id_05CB( "specialty_quieter" ) || !_id_3A6F( 262144 ) )
                        level thread _id_7823( self, var_5._id_57F8[0], 0 );
                    else
                        level thread _id_7823( self, var_5._id_57F8[0], 1 );

                    break;
                }
            }
        }

        if ( isdefined( var_1 ) && _id_1ADD( "callout_generic" ) )
        {
            var_7 = var_1 _meth_8312();
            var_8 = var_1 _meth_84F8();
            var_9 = isdefined( var_1._id_3491 ) && var_1._id_3491;
            var_10 = isdefined( var_1._id_65D5 ) && var_1._id_65D5;
            var_11 = isdefined( var_1._id_34E9 ) && var_1._id_34E9;
            var_11 = var_11 || isdefined( self._id_3AD7 );
            var_12 = weaponclass( var_7 ) == "sniper";

            if ( var_8 )
                level thread _id_7823( self, "callout_cloak" );
            else if ( var_9 )
                level thread _id_7823( self, "callout_hover" );
            else if ( var_10 )
                level thread _id_7823( self, "callout_overclock" );
            else if ( var_11 )
                level thread _id_7823( self, "callout_shield" );
            else if ( var_12 )
                level thread _id_7823( self, "callout_sniper" );
            else
                level thread _id_7823( self, "callout_generic" );
        }
    }
}

_id_7824( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    wait(var_2);
    _id_7823( var_0, var_1, var_3, var_4 );
}

_id_7823( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( isdefined( level._id_1CA7 ) && level._id_1CA7 )
        return;

    if ( isdefined( var_0._id_133C ) && var_0._id_133C == 1 )
        return;

    if ( _id_51AF( var_0 ) )
        return;

    if ( var_0 _id_A7C2::get_is_in_mech() )
        return;

    if ( var_0._id_04A8 != "spectator" )
    {
        var_4 = var_0._id_030D["voicePrefix"];

        if ( isdefined( level._id_1358[var_1] ) )
        {
            var_5 = var_4 + level._id_1358[var_1];

            switch ( var_1 )
            {
                case "callout_sniper":
                case "callout_hover":
                case "callout_shield":
                case "callout_cloak":
                case "callout_overclock":
                    var_1 = "callout_generic";
                    break;
            }
        }
        else
        {
            _id_57F2( var_1 );
            var_5 = var_4 + "co_loc_" + var_1;
            var_0 thread _id_2D81( var_5, var_1 );
            var_1 = "callout_location";
        }

        var_0 _id_9AF7( var_1 );
        var_0 thread _id_2D7B( var_5, var_2, var_3 );
    }
}

_id_2D7B( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = self._id_030D["team"];
    level _id_0830( self, var_3 );
    var_4 = !level._id_51C4 || !_id_A75A::_id_05CB( "specialty_coldblooded" ) && ( isagent( self ) || self _meth_82EA() );

    if ( var_2 && var_4 )
    {
        if ( isagent( self ) || level._id_09DD[var_3] > 3 )
            thread _id_2D7C( var_0, var_3 );
    }

    if ( !soundexists( var_0 ) )
    {
        level _id_73DC( self, var_3 );
        return;
    }

    if ( isagent( self ) || isdefined( var_1 ) && var_1 )
        self _meth_8003( var_0, var_3 );
    else
        self _meth_8003( var_0, var_3, self );

    thread _id_935C( var_0 );
    _id_A4F0::_id_A060( var_0, "death", "disconnect" );
    level _id_73DC( self, var_3 );
}

_id_2D7C( var_0, var_1 )
{
    if ( soundexists( var_0 ) )
    {
        foreach ( var_3 in level._id_91F0 )
        {
            if ( var_3 != var_1 )
                self _meth_8003( var_0, var_3 );
        }
    }
}

_id_2D81( var_0, var_1 )
{
    var_2 = _id_A4F0::_id_A067( var_0, "death", "disconnect" );

    if ( var_2 == var_0 )
    {
        var_3 = self._id_04A8;

        if ( !isagent( self ) )
            var_4 = self _meth_843A();
        else
            var_4 = 0;

        var_5 = self._id_030D["voiceNum"];
        var_6 = self._id_02E6;
        wait 0.5;

        foreach ( var_8 in level._id_669A )
        {
            if ( !isdefined( var_8 ) )
                continue;

            if ( var_8 == self )
                continue;

            if ( !_id_A75A::_id_5186( var_8 ) )
                continue;

            if ( var_8._id_04A8 != var_3 )
                continue;

            if ( !isagent( var_8 ) )
                var_9 = var_8 _meth_843A();
            else
                var_9 = 0;

            if ( ( var_5 != var_8._id_030D["voiceNum"] || var_4 != var_9 ) && distancesquared( var_6, var_8._id_02E6 ) <= 262144 && !_id_51AF( var_8 ) )
            {
                var_10 = var_8._id_030D["voicePrefix"];
                var_11 = var_10 + "co_loc_" + var_1 + "_echo";

                if ( _id_A4F0::_id_2006() && soundexists( var_11 ) )
                    var_12 = var_11;
                else
                    var_12 = var_10 + level._id_1358["callout_response_generic"];

                var_8 thread _id_2D7B( var_12, 0, 0 );
                break;
            }
        }
    }
}

_id_935C( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 2.0;
    self notify( var_0 );
}

_id_51AF( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( !isdefined( var_1 ) )
        var_1 = 1000;

    var_2 = var_1 * var_1;

    if ( isdefined( var_0 ) && isdefined( var_0._id_04A8 ) && var_0._id_04A8 != "spectator" )
    {
        for ( var_3 = 0; var_3 < level._id_8A13[var_0._id_04A8].size; var_3++ )
        {
            var_4 = level._id_8A13[var_0._id_04A8][var_3];

            if ( var_4 == var_0 )
                return 1;

            if ( !isdefined( var_4 ) )
                continue;

            if ( distancesquared( var_4._id_02E6, var_0._id_02E6 ) < var_2 )
                return 1;
        }
    }

    return 0;
}

_id_0830( var_0, var_1 )
{
    level._id_8A13[var_1][level._id_8A13[var_1].size] = var_0;
}

_id_73DC( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_8A13[var_1].size; var_3++ )
    {
        if ( level._id_8A13[var_1][var_3] == var_0 )
            continue;

        var_2[var_2.size] = level._id_8A13[var_1][var_3];
    }

    level._id_8A13[var_1] = var_2;
}

_id_2AF5( var_0 )
{
    var_0._id_133C = 1;
}

_id_3108( var_0 )
{
    var_0._id_133C = undefined;
}

_id_1ADD( var_0 )
{
    var_1 = self._id_030D["team"];

    if ( var_1 == "spectator" )
        return 0;

    var_2 = level._id_133F["timeout_player"][var_0];
    var_3 = gettime() - self._id_133F["last_say_time"][var_0];

    if ( var_2 > var_3 )
        return 0;

    var_2 = level._id_133F["timeout"][var_0];
    var_3 = gettime() - level._id_133F["last_say_time"][var_1][var_0];

    if ( var_2 < var_3 )
        return 1;

    return 0;
}

_id_9AF7( var_0 )
{
    var_1 = self._id_030D["team"];
    self._id_133F["last_say_time"][var_0] = gettime();
    level._id_133F["last_say_time"][var_1][var_0] = gettime();
    level._id_133F["last_say_pos"][var_1][var_0] = self._id_02E6;
}

_id_4008()
{
    var_0 = _id_3CBD();
    var_0 = _id_A4F0::_id_0CF5( var_0 );

    if ( var_0.size )
    {
        foreach ( var_2 in var_0 )
        {
            if ( !_id_57F4( var_2 ) )
                return var_2;
        }

        foreach ( var_2 in var_0 )
        {
            if ( !_id_57F5( var_2 ) )
                return var_2;
        }
    }

    return undefined;
}

_id_4148( var_0 )
{
    var_1 = _id_3CBD();
    var_1 = _id_A4F0::_id_0CF5( var_1 );

    if ( var_1.size )
    {
        foreach ( var_3 in var_1 )
        {
            if ( !_id_57F4( var_3 ) && var_0 _id_1AB0( var_3 ) )
                return var_3;
        }

        foreach ( var_3 in var_1 )
        {
            if ( !_id_57F5( var_3 ) && var_0 _id_1AB0( var_3 ) )
                return var_3;
        }
    }

    return undefined;
}

_id_3CBD()
{
    var_0 = anim._id_134A;
    var_1 = self _meth_80AA( var_0 );
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( isdefined( var_4._id_57F8 ) )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_9A9A()
{
    if ( isdefined( anim._id_134A ) )
        anim._id_134A = _id_A4F0::_id_0D01( anim._id_134A );
}

_id_5039()
{
    var_0 = _id_3CBD();

    foreach ( var_2 in var_0 )
    {
        if ( !_id_57F5( var_2 ) )
            return 1;
    }

    return 0;
}

_id_57F4( var_0 )
{
    var_1 = _id_57F7( var_0._id_57F8[0] );

    if ( !isdefined( var_1 ) )
        return 0;

    return 1;
}

_id_57F5( var_0 )
{
    var_1 = _id_57F7( var_0._id_57F8[0] );

    if ( !isdefined( var_1 ) )
        return 0;

    var_2 = var_1 + 25000;

    if ( gettime() < var_2 )
        return 1;

    return 0;
}

_id_57F2( var_0 )
{
    anim._id_57F9[var_0] = gettime();
}

_id_57F7( var_0 )
{
    if ( isdefined( anim._id_57F9[var_0] ) )
        return anim._id_57F9[var_0];

    return undefined;
}

_id_1AB0( var_0 )
{
    foreach ( var_2 in var_0._id_57F8 )
    {
        var_3 = _id_4009( "co_loc_" + var_2 );
        var_4 = _id_409D( var_2, 0 );
        var_5 = _id_4009( "concat_loc_" + var_2 );
        var_6 = soundexists( var_3 ) || soundexists( var_4 ) || soundexists( var_5 );

        if ( var_6 )
            return var_6;
    }

    return 0;
}

_id_1AC2( var_0 )
{
    var_1 = var_0._id_57F8;

    foreach ( var_3 in var_1 )
    {
        if ( _id_50D0( var_3, self ) )
            return 1;
    }

    return 0;
}

_id_3F22( var_0 )
{
    var_1 = undefined;
    var_2 = self._id_57F8;

    foreach ( var_4 in var_2 )
    {
        if ( _id_50D1( var_4, var_0 ) && !isdefined( self._id_7070 ) )
        {
            var_1 = var_4;
            break;
        }

        if ( _id_50D2( var_4 ) )
            var_1 = var_4;
    }

    return var_1;
}

_id_50D2( var_0 )
{
    return issubstr( var_0, "_report" );
}

_id_50D0( var_0, var_1 )
{
    var_2 = var_1 _id_4009( "concat_loc_" + var_0 );

    if ( soundexists( var_2 ) )
        return 1;

    return 0;
}

_id_50D1( var_0, var_1 )
{
    if ( issubstr( var_0, "_qa" ) && soundexists( var_0 ) )
        return 1;

    var_2 = var_1 _id_409D( var_0, 0 );

    if ( soundexists( var_2 ) )
        return 1;

    return 0;
}

_id_4009( var_0 )
{
    var_1 = self._id_030D["voicePrefix"] + var_0;
    return var_1;
}

_id_409D( var_0, var_1 )
{
    var_2 = _id_4009( var_0 );
    var_2 += ( "_qa" + var_1 );
    return var_2;
}

_id_132E()
{
    return 0;
}

_id_132F()
{
    return 0;
}

_id_1335( var_0 )
{

}

_id_1336( var_0 )
{

}

_id_1330( var_0 )
{

}

_id_3EE7( var_0 )
{

}

_id_1337( var_0, var_1, var_2 )
{

}

_id_3A6F( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 262144;

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2._id_04A8 == self._id_030D["team"] )
        {
            if ( var_2 != self && distancesquared( var_2._id_02E6, self._id_02E6 ) <= var_0 )
                return 1;
        }
    }

    return 0;
}
