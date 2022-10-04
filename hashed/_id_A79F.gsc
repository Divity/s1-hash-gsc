// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( !isdefined( game["gamestarted"] ) )
    {
        game["menu_team"] = "team_marinesopfor";

        if ( level._id_5FE9 )
            game["menu_team"] = "team_mt_options";

        game["menu_class"] = "class";
        game["menu_class_allies"] = "class_marines";
        game["menu_class_axis"] = "class_opfor";
        game["menu_changeclass_allies"] = "changeclass_marines";
        game["menu_changeclass_axis"] = "changeclass_opfor";

        if ( level._id_5FE9 )
        {
            for ( var_0 = 0; var_0 < level._id_91F0.size; var_0++ )
            {
                var_1 = "menu_class_" + level._id_91F0[var_0];
                var_2 = "menu_changeclass_" + level._id_91F0[var_0];
                game[var_1] = game["menu_class_allies"];
                game[var_2] = "changeclass_marines";
            }
        }

        game["menu_changeclass"] = "changeclass";

        if ( level._id_2153 )
        {
            game["menu_controls"] = "ingame_controls";

            if ( level._id_8A76 )
            {
                if ( level._id_5FE9 )
                {
                    for ( var_0 = 0; var_0 < level._id_91F0.size; var_0++ )
                    {
                        var_1 = "menu_class_" + level._id_91F0[var_0];
                        var_2 = "menu_changeclass_" + level._id_91F0[var_0];
                        game[var_1] += "_splitscreen";
                        game[var_2] += "_splitscreen";
                    }
                }

                game["menu_team"] += "_splitscreen";
                game["menu_class_allies"] += "_splitscreen";
                game["menu_class_axis"] += "_splitscreen";
                game["menu_changeclass_allies"] += "_splitscreen";
                game["menu_changeclass_axis"] += "_splitscreen";
                game["menu_controls"] += "_splitscreen";
                game["menu_changeclass_defaults_splitscreen"] = "changeclass_splitscreen_defaults";
                game["menu_changeclass_custom_splitscreen"] = "changeclass_splitscreen_custom";
            }
        }

        precachestring( &"MP_HOST_ENDED_GAME" );
        precachestring( &"MP_HOST_ENDGAME_RESPONSE" );
    }

    level thread _id_64C5();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_A215();
        var_0 thread _id_A222();
        var_0 thread _id_A21D();
        var_0 thread _id_2149();
    }
}

_id_2149()
{

}

_id_3F2F( var_0 )
{
    if ( var_0 <= 100 )
    {
        if ( _id_A75A::_id_6E98() )
            var_0 = "practice" + var_0;
        else
            var_0 = "custom" + var_0;
    }
    else if ( var_0 <= 200 )
    {
        var_0 -= 101;
        var_0 = "class" + var_0;
    }
    else if ( var_0 <= 206 )
    {
        var_0 -= 200;
        var_0 = "axis_recipe" + var_0;
    }
    else
    {
        var_0 -= 206;
        var_0 = "allies_recipe" + var_0;
    }

    return var_0;
}

_id_A215()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "class_select" )
            continue;

        if ( _id_A75A::_id_5152() && self _meth_8432() && !_id_A75A::_id_4FA3() )
        {
            self _meth_82FB( "ui_options_menu", 0 );
            continue;
        }

        if ( !istestclient( self ) && !isai( self ) )
        {
            if ( "" + var_1 != "callback" )
                self _meth_82FB( "ui_loadout_selected", var_1 );
        }

        if ( isdefined( self._id_A043 ) && self._id_A043 )
            continue;

        if ( !_id_A75A::_id_0AA2() )
            continue;

        self _meth_82FB( "ui_options_menu", 0 );

        if ( "" + var_1 != "callback" )
        {
            if ( isbot( self ) || istestclient( self ) )
            {
                self._id_030D["class"] = var_1;
                self._id_1E2E = var_1;
                _id_A781::_id_1EE7();
            }
            else
            {
                var_2 = var_1 + 1;
                var_2 = _id_3F2F( var_2 );

                if ( !isdefined( self._id_030D["class"] ) || var_2 == self._id_030D["class"] )
                    continue;

                self._id_030D["class"] = var_2;
                self._id_1E2E = var_2;
                _id_A781::_id_1EE7();
                thread _id_5BAF();
            }

            continue;
        }

        _id_5BAE( "callback" );
    }
}

_id_A21D()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "end_game" )
            continue;

        level thread _id_A789::_id_39BA();
    }
}

_id_A222()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "team_select" )
            continue;

        if ( _id_A75A::_id_59E0() && !getdvarint( "force_ranking" ) )
            continue;

        if ( var_1 != 3 )
            thread _id_8516();

        if ( var_1 == 3 )
        {
            self _meth_82FB( "ui_options_menu", 0 );
            self _meth_82FB( "ui_spectator_selected", 1 );
            self _meth_82FB( "ui_loadout_selected", -1 );
            self._id_8A45 = 1;

            if ( _id_A75A::_id_5152() )
            {
                self _meth_8506( 1 );
                self _meth_82FB( "ui_use_mlg_hud", 1 );
                thread _id_A7B1::_id_8013();
            }
        }
        else
        {
            self _meth_82FB( "ui_spectator_selected", -1 );
            self._id_8A45 = 0;

            if ( _id_A75A::_id_5152() )
            {
                self _meth_8506( 0 );
                self _meth_82FB( "ui_use_mlg_hud", 0 );
            }
        }

        self _meth_82FB( "ui_team_selected", var_1 );

        if ( var_1 == 0 )
            var_1 = "axis";
        else if ( var_1 == 1 )
            var_1 = "allies";
        else if ( var_1 == 2 )
            var_1 = "random";
        else
            var_1 = "spectator";

        if ( isdefined( self._id_030D["team"] ) && var_1 == self._id_030D["team"] )
        {
            self notify( "selected_same_team" );
            continue;
        }

        self _meth_82FB( "ui_loadout_selected", -1 );

        if ( var_1 == "axis" )
        {
            thread _id_8021( "axis" );
            continue;
        }

        if ( var_1 == "allies" )
        {
            thread _id_8021( "allies" );
            continue;
        }

        if ( var_1 == "random" )
        {
            self thread [[ level._id_112A ]]();
            continue;
        }

        if ( var_1 == "spectator" )
            thread _id_8014();
    }
}

_id_8516()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    _id_A4F0::_id_A060( "joined_team", "selected_same_team" );
    self _meth_82FB( "ui_options_menu", 2 );
}

_id_112A()
{
    if ( _id_A75A::iscoop() )
    {
        thread _id_8021( "allies" );
        self._id_03BD = "allies";
    }
    else if ( !isdefined( self._id_04A8 ) )
    {
        if ( self _meth_8432() && !_id_A75A::_id_4FA3() )
            thread _id_8014();
        else if ( level._id_91E6["axis"] < level._id_91E6["allies"] )
            thread _id_8021( "axis" );
        else if ( level._id_91E6["allies"] < level._id_91E6["axis"] )
            thread _id_8021( "allies" );
        else if ( setclientnamemode( "allies" ) > setclientnamemode( "axis" ) )
            thread _id_8021( "axis" );
        else
            thread _id_8021( "allies" );
    }
    else if ( self _meth_8432() && !_id_A75A::_id_4FA3() )
        thread _id_8014();
    else
    {
        if ( level._id_91E6["axis"] < level._id_91E6["allies"] && self._id_04A8 != "axis" )
        {
            thread _id_8021( "axis" );
            return;
        }

        if ( level._id_91E6["allies"] < level._id_91E6["axis"] && self._id_04A8 != "allies" )
        {
            thread _id_8021( "allies" );
            return;
        }

        if ( level._id_91E6["allies"] == level._id_91E6["axis"] )
        {
            if ( setclientnamemode( "allies" ) > setclientnamemode( "axis" ) && self._id_04A8 != "axis" )
                thread _id_8021( "axis" );
            else if ( self._id_04A8 != "allies" )
                thread _id_8021( "allies" );
        }
    }
}

_id_8021( var_0 )
{
    self endon( "disconnect" );

    if ( !isai( self ) && level._id_91E4 && !_id_A7B2::_id_3FDB( var_0 ) )
        return;

    if ( level._id_4C6A && !self._id_4726 )
        self._id_4742 = 0;

    if ( self._id_03BC == "playing" )
    {
        self._id_9078 = 1;
        self._id_5289 = var_0;
        self._id_566A = self._id_030D["team"];
    }

    _id_0851( var_0 );

    if ( self._id_03BC == "playing" )
        self _meth_826B();

    _id_A00F();
    _id_31BE();

    if ( self._id_03BC == "spectator" )
    {
        if ( game["state"] == "postgame" )
            return;

        if ( game["state"] == "playing" && !_id_A75A::_id_5126() )
        {
            if ( isdefined( self._id_A045 ) && self._id_A045 )
                return;

            _id_A7A7::_id_8992();
        }

        thread _id_A7B1::_id_8013();
    }
}

_id_8014()
{
    if ( isdefined( self._id_030D["team"] ) && self._id_030D["team"] == "spectator" )
        return;

    if ( isalive( self ) )
    {
        self._id_9078 = 1;
        self._id_5289 = "spectator";
        self._id_566A = self._id_030D["team"];
        self _meth_826B();
    }

    self notify( "becameSpectator" );
    _id_0851( "spectator" );
    self._id_030D["class"] = undefined;
    self._id_1E2E = undefined;
    thread _id_A7A7::_id_8A08();
}

handleclasschoicedisallowed()
{
    if ( !isai( self ) && _id_A75A::_id_850A() )
    {
        thread _id_A7A7::_id_8036( 3 );

        for (;;)
        {
            self waittill( "luinotifyserver", var_0, var_1 );

            if ( var_0 == "class_select" )
                break;
        }
    }

    self notify( "notWaitingToSelectClass" );
    self._id_A043 = 0;
    _id_1968();
}

_id_A00F()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_A043 = 1;

    if ( _id_A75A::_id_0AA2() )
    {
        for (;;)
        {
            self waittill( "luinotifyserver", var_0, var_1 );

            if ( var_0 == "class_select" )
                break;
        }

        if ( "" + var_1 != "callback" )
        {
            if ( isbot( self ) || istestclient( self ) )
            {
                self._id_030D["class"] = var_1;
                self._id_1E2E = var_1;
                _id_A781::_id_1EE7();
            }
            else
            {
                var_1 += 1;
                self._id_030D["class"] = _id_3F2F( var_1 );
                self._id_1E2E = _id_3F2F( var_1 );
                _id_A781::_id_1EE7();
            }

            self notify( "notWaitingToSelectClass" );
            self._id_A043 = 0;
            return;
        }

        self notify( "notWaitingToSelectClass" );
        self._id_A043 = 0;
        _id_5BAE( "callback" );
        return;
    }
    else
        handleclasschoicedisallowed();
}

_id_1398( var_0 )
{
    var_1 = self._id_030D["team"];

    if ( _id_A75A::_id_0AA2() )
    {
        thread _id_A7A7::_id_8036( 2 );

        if ( !self _meth_8432() || _id_A75A::_id_4FA3() )
            _id_A00F();

        _id_31BE();

        if ( self._id_03BC == "spectator" )
        {
            if ( game["state"] == "postgame" )
                return;

            if ( game["state"] == "playing" && !_id_A75A::_id_5126() )
            {
                if ( isdefined( self._id_A045 ) && self._id_A045 )
                    return;

                thread _id_A7A7::_id_8992();
            }

            thread _id_A7B1::_id_8013();
        }

        self._id_214F = gettime();
    }
    else
        thread _id_1968();
}

_id_1968()
{
    _id_A781::_id_1EE7();
    self._id_7C62 = 1;
    self._id_1E2E = "class0";

    if ( isdefined( level._id_1969 ) )
        self [[ level._id_1969 ]]();
}

_id_13A1()
{
    thread _id_A7A7::_id_8036( 1 );
}

_id_8517()
{
    var_0 = self._id_030D["team"];
    self _meth_8323( game["menu_class_" + var_0] );
}

_id_5BB2()
{
    if ( isdefined( self._id_030D["team"] ) && self._id_030D["team"] == "spectator" )
        return;

    if ( isalive( self ) )
    {
        self._id_9078 = 1;
        self._id_5289 = "spectator";
        self._id_566A = self._id_030D["team"];
        self _meth_826B();
    }

    _id_0851( "spectator" );
    self._id_030D["class"] = undefined;
    self._id_1E2E = undefined;
    _id_A781::_id_1EE7();
    thread _id_A7A7::_id_8A08();
}

_id_A22A()
{
    if ( !self._id_4726 )
    {
        self endon( "death" );
        self endon( "disconnect" );
        self endon( "streamClassWeaponsComplete" );
        level endon( "game_ended" );
        self waittill( "hasDoneCombat" );
        self notify( "endStreamClassWeapons" );
        self _meth_826E( game["strings"]["change_class_cancel"] );
        wait 2.0;
        self _meth_826E( game["strings"]["change_class"] );
    }
}

_id_5BAF()
{
    if ( level._id_4C6A && !self._id_4726 )
    {
        thread _id_A7A7::_id_8F2A( 1 );

        if ( self._id_1E41 )
        {
            self endon( "death" );
            self endon( "disconnect" );
            level endon( "game_ended" );
            self endon( "endStreamClassWeapons" );
            thread _id_A22A();
            self _meth_826E( game["strings"]["change_class_wait"] );
            self waittill( "streamClassWeaponsComplete" );
            self _meth_826E( "" );
            self _meth_8538( 0 );
        }

        _id_A781::_id_7F35( self._id_030D["class"] );
        self._id_048C = undefined;
        self._id_90CC = undefined;
        _id_A781::_id_41EE( self._id_030D["team"], self._id_030D["class"] );

        if ( !isdefined( self.spawnplayergivingloadout ) )
            _id_A781::_id_0CAE();

        if ( _id_A75A::_id_05CB( "specialty_moreminimap" ) )
            setomnvar( "ui_minimap_extend_grace_period", 1 );
        else
            setomnvar( "ui_minimap_extend_grace_period", 0 );
    }
    else
    {
        _id_A7A7::_id_8F2A();
        self _meth_826E( game["strings"]["change_class"] );
    }
}

_id_5BAE( var_0 )
{
    var_1 = self._id_030D["team"];
    var_2 = _id_A781::_id_3F2F( var_0 );
    var_3 = _id_A781::_id_4163( var_0 );

    if ( var_2 == "restricted" )
    {
        _id_1398();
        return;
    }

    if ( isdefined( self._id_030D["class"] ) && self._id_030D["class"] == var_2 && ( isdefined( self._id_030D["primary"] ) && self._id_030D["primary"] == var_3 ) )
        return;

    if ( self._id_03BC == "playing" )
    {
        if ( isdefined( self._id_030D["lastClass"] ) && isdefined( self._id_030D["class"] ) )
        {
            self._id_030D["lastClass"] = self._id_030D["class"];
            self._id_5586 = self._id_030D["lastClass"];
        }

        self._id_030D["class"] = var_2;
        self._id_1E2E = var_2;
        _id_A781::_id_1EE7();
        self._id_030D["primary"] = var_3;

        if ( game["state"] == "postgame" )
            return;

        thread _id_5BAF();
    }
    else
    {
        if ( isdefined( self._id_030D["lastClass"] ) && isdefined( self._id_030D["class"] ) )
        {
            self._id_030D["lastClass"] = self._id_030D["class"];
            self._id_5586 = self._id_030D["lastClass"];
        }

        self._id_030D["class"] = var_2;
        self._id_1E2E = var_2;
        _id_A781::_id_1EE7();
        self._id_030D["primary"] = var_3;

        if ( game["state"] == "postgame" )
            return;

        if ( game["state"] == "playing" && !_id_A75A::_id_5126() )
            thread _id_A7A7::_id_8992();
    }

    thread _id_A7B1::_id_8013();
}

_id_0851( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_04A8 ) )
    {
        _id_A7A7::_id_73AC();

        if ( isdefined( var_2 ) && var_2 )
            _id_A7A7::_id_275D( self._id_04A8 );
    }

    self._id_030D["team"] = var_0;
    self._id_04A8 = var_0;

    if ( !getdvarint( "party_playersCoop", 0 ) && ( !_id_A75A::_id_59E0() || isbot( self ) || istestclient( self ) || !_id_A75A::_id_0AB0() || getdvarint( "force_ranking" ) ) )
    {
        if ( level._id_91E4 )
            self._id_03BD = var_0;
        else if ( var_0 == "spectator" )
            self._id_03BD = "spectator";
        else
            self._id_03BD = "none";
    }

    if ( game["state"] != "postgame" )
    {
        _id_A7A7::_id_0852();

        if ( isdefined( var_2 ) && var_2 )
            _id_A7A7::_id_4C39( self._id_04A8 );
    }

    _id_A75A::_id_9B3A();

    if ( isdefined( var_1 ) && var_1 )
        waitframe;

    _id_A75A::_id_9B2B();

    if ( var_0 == "spectator" )
    {
        self notify( "joined_spectators" );
        level notify( "joined_team", self );
    }
    else
    {
        self notify( "joined_team" );
        level notify( "joined_team", self );
    }
}

_id_31BE()
{
    self._id_A044 = 0;
    self notify( "end_respawn" );
}
