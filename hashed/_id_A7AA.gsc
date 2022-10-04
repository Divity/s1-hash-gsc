// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_A3A1 = _id_416D();
    level._id_A39C = [];
    level._id_7137 = [];
    level._id_5A4D = int( tablelookup( "mp/rankTable.csv", 0, "maxrank", 1 ) );
    level.masterprestige = int( tablelookup( "mp/rankIconTable.csv", 0, "masterPrestige", 1 ) );
    level.grandmasterprestige = int( tablelookup( "mp/rankIconTable.csv", 0, "grandMasterPrestige", 1 ) );
    var_0 = 0;

    for ( var_1 = tablelookup( "mp/rankTable.csv", 0, var_0, 1 ); isdefined( var_1 ) && var_1 != ""; var_1 = tablelookup( "mp/rankTable.csv", 0, var_0, 1 ) )
    {
        level._id_7137[var_0][1] = tablelookup( "mp/rankTable.csv", 0, var_0, 1 );
        level._id_7137[var_0][2] = tablelookup( "mp/rankTable.csv", 0, var_0, 2 );
        level._id_7137[var_0][3] = tablelookup( "mp/rankTable.csv", 0, var_0, 3 );
        level._id_7137[var_0][7] = tablelookup( "mp/rankTable.csv", 0, var_0, 7 );
        var_0++;
    }

    _id_A7A0::_id_1878();
    level thread _id_64C5();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) && var_0 _id_A75A::_id_7136() )
        {
            var_1 = var_0 _id_4099();
            var_2 = var_0 _id_A7A4::_id_8D62( "experience" );

            if ( var_2 < 0 )
                var_2 = 0;

            var_3 = var_0 _meth_8507() - var_2;
            var_4 = var_0 _meth_8507();

            if ( !_id_A75A::_id_4FA3() && ( !isdefined( var_0._id_030D["gamesPlayedSet"] ) || !var_0._id_030D["gamesPlayedSet"] ) )
            {
                var_0 _id_A7A4::_id_8D4A( "gamesPlayed", 1 );
                var_0._id_030D["gamesPlayedSet"] = 1;
            }
        }
        else if ( isai( var_0 ) )
        {
            var_0 _id_A75A::_id_7E9F();
            var_2 = var_0._id_030D["rankxp"];
            var_1 = var_0._id_030D["prestige"];
            var_3 = 0;
            var_4 = var_2;
        }
        else
        {
            var_1 = 0;
            var_2 = 0;
            var_3 = 0;
            var_4 = var_2;
        }

        var_0._id_030D["rankxp"] = var_2;
        var_0._id_030D["redeemedxp"] = var_3;
        var_0._id_030D["prestige"] = var_1;

        if ( !isdefined( var_0._id_030D["participation"] ) )
            var_0._id_030D["participation"] = 0;

        var_5 = var_0 _id_40A8( var_0 _id_4135() );
        var_0._id_030D["rank"] = var_5;
        var_0._id_A3A2 = 0;
        var_0._id_6E87 = 0;
        var_0._id_357D[0] = 0;
        var_0 _meth_82A1( var_5, var_1 );
        var_0 processprestigemastery( var_1, var_2 );

        if ( var_0._id_1F0F < level._id_5A3F )
        {
            setmatchdata( "players", var_0._id_1F0F, "Prestige", var_1 );
            setmatchdata( "players", var_0._id_1F0F, "rankAtStart", _id_A75A::_id_1E28( var_0._id_030D["rank"] ) );
        }

        if ( !isdefined( var_0._id_030D["postGameChallenges"] ) )
            var_0 _meth_82FD( "ui_challenge_1_ref", "", "ui_challenge_2_ref", "", "ui_challenge_3_ref", "", "ui_challenge_4_ref", "", "ui_challenge_5_ref", "", "ui_challenge_6_ref", "", "ui_challenge_7_ref", "" );

        var_0 _meth_82FC( "ui_promotion", 0 );

        if ( !isdefined( var_0._id_030D["summary"] ) )
        {
            var_0._id_030D["summary"] = [];
            var_0._id_030D["summary"]["xp"] = 0;
            var_0._id_030D["summary"]["score"] = 0;
            var_0._id_030D["summary"]["challenge"] = 0;
            var_0._id_030D["summary"]["match"] = 0;
            var_0._id_030D["summary"]["misc"] = 0;
            var_0._id_030D["summary"]["entitlementXP"] = 0;
            var_0._id_030D["summary"]["clanWarsXP"] = 0;
            var_0._id_030D["summary"]["matchStartXp"] = var_4;
        }

        if ( getdvar( "virtualLobbyActive" ) != "1" )
        {
            var_0 _meth_82FC( "ui_opensummary", 0 );
            var_0 thread _id_A7A0::_id_9AF6();
        }

        var_0 thread _id_64D3();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
        self waittill( "spawned_player" );
}

_id_416D()
{
    var_0 = getdvarint( "scr_xpscale" );

    if ( var_0 > 4 || var_0 < 0 )
        exitlevel( 0 );

    return var_0;
}

_id_5187( var_0 )
{
    if ( isdefined( level._id_A39C[var_0] ) )
        return 1;
    else
        return 0;
}

_id_72FC( var_0, var_1, var_2, var_3 )
{
    level._id_A39C[var_0]["value"] = var_1;
    level._id_A39C[var_0]["allowPlayerScore"] = 0;
    level._id_A39C[var_0]["playSplash"] = 0;

    if ( isdefined( var_2 ) && var_2 )
        level._id_A39C[var_0]["allowPlayerScore"] = 1;

    if ( isdefined( var_3 ) && var_3 )
        level._id_A39C[var_0]["playSplash"] = 1;
}

_id_0AAE( var_0 )
{
    return level._id_A39C[var_0]["allowPlayerScore"];
}

_id_849E( var_0 )
{
    return level._id_A39C[var_0]["playSplash"];
}

_id_40BF( var_0 )
{
    var_1 = "scr_" + level._id_01B5 + "_score_" + var_0;

    if ( getdvar( var_1 ) != "" )
        return getdvarint( var_1 );

    return level._id_A39C[var_0]["value"];
}

_id_40AD( var_0 )
{
    return int( level._id_7137[var_0][2] );
}

_id_40AE( var_0 )
{
    return int( level._id_7137[var_0][3] );
}

_id_40AC( var_0 )
{
    return int( level._id_7137[var_0][7] );
}

_id_40AA( var_0 )
{
    return tablelookupistring( "mp/rankTable.csv", 0, var_0, 16 );
}

_id_40AB( var_0 )
{
    return int( tablelookup( "mp/rankTable.csv", 0, var_0, 13 ) );
}

_id_1208( var_0, var_1, var_2, var_3, var_4 )
{
    if ( _id_A75A::_id_4FA3() )
        return;

    if ( _id_849E( var_0 ) )
        var_1 thread _id_A79C::_id_8A62( var_0 );

    var_1 _id_41FC( var_0, undefined, var_2, var_4, undefined, var_3 );

    if ( _id_0AAE( var_0 ) )
        var_1 _id_A78B::_id_41F9( var_0, var_1, var_3 );
}

_id_41FC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    if ( isdefined( self._id_02E9 ) && !isbot( self ) )
    {
        self._id_02E9 _id_41FC( var_0, var_1, var_2, var_3, var_4, var_5 );
        return;
    }

    if ( isai( self ) )
        return;

    if ( !isplayer( self ) )
        return;

    if ( !_id_A75A::_id_7136() )
        return;

    if ( level._id_91E4 && ( !level._id_91E6["allies"] || !level._id_91E6["axis"] ) && var_0 != "win" )
        return;

    if ( !level._id_91E4 && level._id_91E6["allies"] + level._id_91E6["axis"] < 2 )
        return;

    if ( isdefined( level._id_2B22 ) && level._id_2B22 )
        return;

    if ( _id_A75A::_id_6E98() )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = _id_40BF( var_0 );

    if ( var_1 == 0 )
        return;

    if ( var_1 > 0 && !isdefined( self._id_5892 ) )
    {
        self._id_5892 = 1;
        _func_2B2( self._id_0537 );
    }

    var_6 = var_1;
    var_7 = 0;

    switch ( var_0 )
    {
        case "challenge":
        case "tie":
        case "win":
        case "loss":
            break;
        default:
            if ( _id_A75A::_id_3FA8() > 0 && var_0 != "shield_damage" )
            {
                var_8 = max( 1, int( 10 / _id_A75A::_id_3FA8() ) );

                if ( level._id_01B5 == "sr" )
                    var_8 = max( 1, int( 5 / _id_A75A::_id_3FA8() ) );

                var_6 = int( var_6 * var_8 );
            }

            if ( level._id_A3A1 > 1 )
                var_6 = int( var_6 * level._id_A3A1 );

            if ( self _meth_8223( "hasDoubleXPItem" ) )
                var_6 = int( var_6 * 2 );

            if ( isdefined( level._id_626A ) && level._id_626A )
            {
                if ( level._id_91E4 && level._id_6271._id_04A8 == self._id_04A8 )
                    var_6 *= level._id_6271._id_A3A0;
                else if ( !level._id_91E4 && level._id_6271._id_031D == self )
                    var_6 *= level._id_6271._id_A3A0;

                var_6 = int( var_6 );
            }

            if ( isdefined( self.costumebonus ) && isdefined( self.costumebonus["xp"] ) )
            {
                var_9 = int( var_6 + var_1 * self.costumebonus["xp"]["bonusTotal"] );
                var_6 = var_9;
            }

            var_7 = self _meth_853B();
            break;
    }

    var_10 = int( var_6 * var_7 );
    var_11 = _id_40AF();
    _id_4C2E( var_6 + var_10 );

    if ( _id_A75A::_id_7136() && _id_9B4A( var_11 ) )
        thread _id_9B4B();

    _id_9083();
    var_12 = _id_A7A0::_id_5202( var_4 );

    if ( var_12 )
        var_2 = self _meth_8311();

    if ( var_0 == "shield_damage" )
    {
        var_2 = self _meth_8311();
        var_3 = "MOD_MELEE";
    }

    self._id_030D["summary"]["clanWarsXP"] += var_10;
    self._id_030D["summary"]["xp"] += ( var_6 + var_10 );

    switch ( var_0 )
    {
        case "tie":
        case "win":
        case "loss":
            self._id_030D["summary"]["match"] += var_6;
            break;
        case "challenge":
            self._id_030D["summary"]["challenge"] += var_6;
            break;
        default:
            if ( _id_5187( var_0 ) )
                self._id_030D["summary"]["score"] += var_6;
            else
                self._id_030D["summary"]["misc"] += var_6;

            break;
    }
}

_id_9B4A( var_0 )
{
    var_1 = _id_40A7();

    if ( var_1 == self._id_030D["rank"] )
        return 0;

    var_2 = self._id_030D["rank"];
    self._id_030D["rank"] = var_1;
    self _meth_82A1( var_1 );
    return 1;
}

_id_9B4B()
{
    self endon( "disconnect" );
    self notify( "update_rank" );
    self endon( "update_rank" );
    var_0 = self._id_030D["team"];

    if ( !isdefined( var_0 ) )
        return;

    if ( !_id_A75A::_id_56D6( "game_over" ) )
        level _id_A4F0::_id_A097( "game_over", 0.25 );

    var_1 = _id_40AA( self._id_030D["rank"] );
    var_2 = level._id_7137[self._id_030D["rank"]][1];
    var_3 = int( var_2[var_2.size - 1] );
    thread _id_A79C::_id_7138( "ranked_up", self._id_030D["rank"], self._id_030D["prestige"] );

    if ( var_3 > 1 )
        return;

    for ( var_4 = 0; var_4 < level._id_0328.size; var_4++ )
    {
        var_5 = level._id_0328[var_4];
        var_6 = var_5._id_030D["team"];

        if ( isdefined( var_6 ) && var_5 != self )
        {
            if ( var_6 == var_0 )
                var_5 _meth_826D( &"RANK_PLAYER_WAS_PROMOTED", self, var_1 );
        }
    }
}

_id_A39D( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( var_1 == 0 )
        return;

    self notify( "xpPointsPopup" );
    self endon( "xpPointsPopup" );
    self._id_A3A2 += var_1;
    self _meth_82FB( "ui_points_popup", self._id_A3A2 );
    var_2 = tablelookuprownum( "mp/xp_event_table.csv", 0, var_0 );

    if ( !isdefined( var_2 ) || isdefined( var_2 ) && var_2 == -1 )
    {

    }
    else
        self _meth_82FB( "ui_points_popup_event", var_2 );

    wait 1;
    self._id_A3A2 = 0;
}

_id_40A7()
{
    var_0 = _id_4135();
    var_1 = self._id_030D["rank"];

    if ( var_0 < _id_40AD( var_1 ) + _id_40AE( var_1 ) )
        return var_1;
    else
        return _id_40A8( var_0 );
}

_id_40A8( var_0 )
{
    var_1 = 0;
    var_2 = level._id_7137[var_1][1];

    while ( isdefined( var_2 ) && var_2 != "" )
    {
        if ( var_0 < _id_40AD( var_1 ) + _id_40AE( var_1 ) )
            return var_1;

        var_1++;

        if ( isdefined( level._id_7137[var_1] ) )
        {
            var_2 = level._id_7137[var_1][1];
            continue;
        }

        var_2 = undefined;
    }

    var_1--;
    return var_1;
}

_id_4099()
{
    if ( isai( self ) && isdefined( self._id_030D["prestige_fake"] ) )
        return self._id_030D["prestige_fake"];
    else
        return _id_A7A4::_id_8D62( "prestige" );
}

_id_40AF()
{
    if ( isdefined( self._id_030D["rankxp"] ) )
        return self._id_030D["rankxp"];
    else
        return 0;
}

_id_40B1()
{
    if ( isdefined( self._id_030D["redeemedxp"] ) )
        return self._id_030D["redeemedxp"];
    else
        return 0;
}

_id_4135()
{
    return _id_40AF() + _id_40B1();
}

_id_4C2E( var_0 )
{
    if ( !_id_A75A::_id_7136() )
        return;

    var_1 = _id_40AF();
    var_2 = self._id_030D["prestige"];
    var_3 = _id_40AC( level._id_5A4D ) - _id_40B1();
    var_4 = int( min( var_1, var_3 ) ) + var_0;

    if ( var_4 > var_3 )
        var_4 = var_3;

    self._id_030D["rankxp"] = var_4;
    processprestigemastery( var_2, var_4 );
}

processprestigemastery( var_0, var_1 )
{
    var_2 = _id_40AC( level._id_5A4D ) - _id_40B1();

    if ( var_0 == level.masterprestige && var_1 >= var_2 && !isdefined( self._id_030D["prestigeMaster"] ) )
    {
        self._id_030D["prestigeMaster"] = self _meth_854B();

        if ( isdefined( self._id_030D["prestigeMaster"] ) )
            thread _id_A79C::_id_8A64( "prestigeMaster" );
    }

    if ( var_0 == level.grandmasterprestige && var_1 >= var_2 && !isdefined( self._id_030D["prestigeGrandMaster"] ) )
    {
        self._id_030D["prestigeGrandMaster"] = self _meth_854B();

        if ( isdefined( self._id_030D["prestigeGrandMaster"] ) )
            thread _id_A79C::_id_8A64( "prestigeGrandMaster" );
    }
}

_id_9083()
{
    var_0 = _id_40AF();
    _id_A7A4::_id_8D72( "experience", var_0 );
}
