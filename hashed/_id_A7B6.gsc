// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_5398["agent"] = ::_id_98C7;
    level._id_5398["recon_agent"] = ::_id_98BA;
}

_id_806C()
{
    level._id_0897["squadmate"] = level._id_0897["player"];
    level._id_0897["squadmate"]["think"] = ::_id_8ACB;
    level._id_0897["squadmate"]["on_killed"] = ::_id_6439;
    level._id_0897["squadmate"]["on_damaged"] = maps\mp\agents\_agents::_id_6437;
    level._id_0897["squadmate"]["gametype_update"] = ::_id_60F9;
}

_id_60F9()
{
    return 0;
}

_id_98C7( var_0, var_1 )
{
    return _id_9C0B( "agent" );
}

_id_98BA( var_0, var_1 )
{
    return _id_9C0B( "reconAgent" );
}

_id_9C0B( var_0 )
{
    if ( maps\mp\agents\_agent_utility::_id_4052( "squadmate" ) >= 5 )
    {
        self _meth_826E( &"KILLSTREAKS_AGENT_MAX" );
        return 0;
    }

    if ( maps\mp\agents\_agent_utility::_id_4054( self ) >= 2 )
    {
        self _meth_826E( &"KILLSTREAKS_AGENT_MAX" );
        return 0;
    }

    var_1 = maps\mp\agents\_agent_utility::_id_414A( 0, 1 );

    if ( !isdefined( var_1 ) )
        return 0;

    if ( !_id_A75A::_id_5186( self ) )
        return 0;

    var_2 = var_1._id_02E6;
    var_3 = vectortoangles( self._id_02E6 - var_1._id_02E6 );
    var_4 = maps\mp\agents\_agents::_id_0768( "squadmate", self._id_04A8, undefined, var_2, var_3, self, 0, 0, "veteran" );

    if ( !isdefined( var_4 ) )
    {
        self _meth_826E( &"KILLSTREAKS_AGENT_MAX" );
        return 0;
    }

    var_4._id_53A8 = var_0;

    if ( var_4._id_53A8 == "reconAgent" )
    {
        var_4 thread _id_7C7F( "iw6_riotshield_mp" );
        var_4 thread _id_3799();
        var_4 thread _id_A781::_id_41DD( self._id_030D["team"], "reconAgent", 0 );
        var_4 maps\mp\agents\_agent_common::_id_7DAA( 250 );
        var_4 _id_A7DB::_id_7F9A();
    }
    else
        var_4 _id_A7DB::_id_7F9A();

    var_4 _id_A75A::_id_063B( "player_name_bg_green_agent", "player_name_bg_red_agent" );
    return 1;
}

_id_3799()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "applyLoadout" );
    _id_A7DB::_id_7F9A();
    _id_A75A::_id_41F5( "specialty_quickswap", 0 );
    _id_A75A::_id_41F5( "specialty_regenfaster", 0 );
}

_id_7C7F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "applyLoadout" );

    if ( !isdefined( var_0 ) )
        var_0 = "iw6_riotshield_mp";

    self notify( "weapon_change", var_0 );
}

_id_8ACB()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "owner_disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self _meth_8351( "prefer_shield_out", 1 );
        var_0 = self [[ maps\mp\agents\_agent_utility::_id_08A6( "gametype_update" ) ]]();

        if ( !var_0 )
        {
            if ( !maps\mp\bots\_bots_util::_id_165F( self._id_02E9 ) )
                maps\mp\bots\_bots_strategy::_id_1646( self._id_02E9, 350 );
        }

        wait 0.05;
    }
}

_id_6439( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    maps\mp\agents\_agents::_id_643F( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 0 );

    if ( isplayer( var_1 ) && isdefined( self._id_02E9 ) && var_1 != self._id_02E9 )
    {
        self._id_02E9 _id_A75A::_id_5652( "squad_killed" );
        _id_A783::_id_64B3( var_1, var_4, var_3, var_2, "destroyed_squad_mate" );
    }

    maps\mp\agents\_agent_utility::_id_2630();
}
