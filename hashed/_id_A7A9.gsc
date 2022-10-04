// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    game["menu_quickcommands"] = "quickcommands";
    game["menu_quickstatements"] = "quickstatements";
    game["menu_quickresponses"] = "quickresponses";
    precacheminimapicon( "talkingicon" );
    precachestring( &"QUICKMESSAGE_FOLLOW_ME" );
    precachestring( &"QUICKMESSAGE_MOVE_IN" );
    precachestring( &"QUICKMESSAGE_FALL_BACK" );
    precachestring( &"QUICKMESSAGE_SUPPRESSING_FIRE" );
    precachestring( &"QUICKMESSAGE_ATTACK_LEFT_FLANK" );
    precachestring( &"QUICKMESSAGE_ATTACK_RIGHT_FLANK" );
    precachestring( &"QUICKMESSAGE_HOLD_THIS_POSITION" );
    precachestring( &"QUICKMESSAGE_REGROUP" );
    precachestring( &"QUICKMESSAGE_ENEMY_SPOTTED" );
    precachestring( &"QUICKMESSAGE_ENEMIES_SPOTTED" );
    precachestring( &"QUICKMESSAGE_IM_IN_POSITION" );
    precachestring( &"QUICKMESSAGE_AREA_SECURE" );
    precachestring( &"QUICKMESSAGE_GRENADE" );
    precachestring( &"QUICKMESSAGE_SNIPER" );
    precachestring( &"QUICKMESSAGE_NEED_REINFORCEMENTS" );
    precachestring( &"QUICKMESSAGE_HOLD_YOUR_FIRE" );
    precachestring( &"QUICKMESSAGE_YES_SIR" );
    precachestring( &"QUICKMESSAGE_NO_SIR" );
    precachestring( &"QUICKMESSAGE_IM_ON_MY_WAY" );
    precachestring( &"QUICKMESSAGE_SORRY" );
    precachestring( &"QUICKMESSAGE_GREAT_SHOT" );
    precachestring( &"QUICKMESSAGE_TOOK_LONG_ENOUGH" );
    precachestring( &"QUICKMESSAGE_ARE_YOU_CRAZY" );
    precachestring( &"QUICKMESSAGE_WATCH_SIX" );
    precachestring( &"QUICKMESSAGE_COME_ON" );
}

_id_709D( var_0 )
{
    self endon( "disconnect" );

    if ( !isdefined( self._id_030D["team"] ) || self._id_030D["team"] == "spectator" || isdefined( self._id_88B3 ) )
        return;

    self._id_88B3 = 1;

    switch ( var_0 )
    {
        case "1":
            var_1 = "mp_cmd_followme";
            var_2 = &"QUICKMESSAGE_FOLLOW_ME";
            break;
        case "2":
            var_1 = "mp_cmd_movein";
            var_2 = &"QUICKMESSAGE_MOVE_IN";
            break;
        case "3":
            var_1 = "mp_cmd_fallback";
            var_2 = &"QUICKMESSAGE_FALL_BACK";
            break;
        case "4":
            var_1 = "mp_cmd_suppressfire";
            var_2 = &"QUICKMESSAGE_SUPPRESSING_FIRE";
            break;
        case "5":
            var_1 = "mp_cmd_attackleftflank";
            var_2 = &"QUICKMESSAGE_ATTACK_LEFT_FLANK";
            break;
        case "6":
            var_1 = "mp_cmd_attackrightflank";
            var_2 = &"QUICKMESSAGE_ATTACK_RIGHT_FLANK";
            break;
        case "7":
            var_1 = "mp_cmd_holdposition";
            var_2 = &"QUICKMESSAGE_HOLD_THIS_POSITION";
            break;
        default:
            var_1 = "mp_cmd_regroup";
            var_2 = &"QUICKMESSAGE_REGROUP";
            break;
    }

    _id_7819();
    _id_2D74( var_1, var_2 );
    wait 2;
    self._id_88B3 = undefined;
    _id_74A8();
}

_id_70A5( var_0 )
{
    if ( !isdefined( self._id_030D["team"] ) || self._id_030D["team"] == "spectator" || isdefined( self._id_88B3 ) )
        return;

    self._id_88B3 = 1;

    switch ( var_0 )
    {
        case "1":
            var_1 = "mp_stm_enemyspotted";
            var_2 = &"QUICKMESSAGE_ENEMY_SPOTTED";
            break;
        case "2":
            var_1 = "mp_stm_enemiesspotted";
            var_2 = &"QUICKMESSAGE_ENEMIES_SPOTTED";
            break;
        case "3":
            var_1 = "mp_stm_iminposition";
            var_2 = &"QUICKMESSAGE_IM_IN_POSITION";
            break;
        case "4":
            var_1 = "mp_stm_areasecure";
            var_2 = &"QUICKMESSAGE_AREA_SECURE";
            break;
        case "5":
            var_1 = "mp_stm_watchsix";
            var_2 = &"QUICKMESSAGE_WATCH_SIX";
            break;
        case "6":
            var_1 = "mp_stm_sniper";
            var_2 = &"QUICKMESSAGE_SNIPER";
            break;
        default:
            var_1 = "mp_stm_needreinforcements";
            var_2 = &"QUICKMESSAGE_NEED_REINFORCEMENTS";
            break;
    }

    _id_7819();
    _id_2D74( var_1, var_2 );
    wait 2;
    self._id_88B3 = undefined;
    _id_74A8();
}

_id_70A0( var_0 )
{
    if ( !isdefined( self._id_030D["team"] ) || self._id_030D["team"] == "spectator" || isdefined( self._id_88B3 ) )
        return;

    self._id_88B3 = 1;

    switch ( var_0 )
    {
        case "1":
            var_1 = "mp_rsp_yessir";
            var_2 = &"QUICKMESSAGE_YES_SIR";
            break;
        case "2":
            var_1 = "mp_rsp_nosir";
            var_2 = &"QUICKMESSAGE_NO_SIR";
            break;
        case "3":
            var_1 = "mp_rsp_onmyway";
            var_2 = &"QUICKMESSAGE_IM_ON_MY_WAY";
            break;
        case "4":
            var_1 = "mp_rsp_sorry";
            var_2 = &"QUICKMESSAGE_SORRY";
            break;
        case "5":
            var_1 = "mp_rsp_greatshot";
            var_2 = &"QUICKMESSAGE_GREAT_SHOT";
            break;
        default:
            var_1 = "mp_rsp_comeon";
            var_2 = &"QUICKMESSAGE_COME_ON";
            break;
    }

    _id_7819();
    _id_2D74( var_1, var_2 );
    wait 2;
    self._id_88B3 = undefined;
    _id_74A8();
}

_id_2D74( var_0, var_1 )
{
    if ( self._id_03BC != "playing" )
        return;

    var_2 = _id_A7B2::_id_411E( self._id_04A8 );

    if ( isdefined( level._id_709F ) && level._id_709F )
    {
        self._id_01E5 = "none";
        self._id_01E4 = "talkingicon";
        self _meth_809A( var_2 + var_0 );
        self _meth_824D( var_1 );
    }
    else
    {
        if ( self._id_03BD == "allies" )
            self._id_01E5 = "allies";
        else if ( self._id_03BD == "axis" )
            self._id_01E5 = "axis";

        self._id_01E4 = "talkingicon";
        self _meth_809A( var_2 + var_0 );
        self _meth_824E( var_1 );
        self _meth_824B();
    }
}

_id_7819()
{
    if ( isdefined( self._id_01E4 ) )
        self._id_63D1 = self._id_01E4;

    if ( isdefined( self._id_01E5 ) )
        self._id_63D2 = self._id_01E5;
}

_id_74A8()
{
    if ( isdefined( self._id_63D1 ) )
        self._id_01E4 = self._id_63D1;

    if ( isdefined( self._id_63D2 ) )
        self._id_01E5 = self._id_63D2;
}
