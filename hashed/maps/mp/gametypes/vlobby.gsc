// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

    _id_A78D::_id_0209();
    maps\mp\gametypes\_callbacksetup::SetupCallbacks();
    _id_A78D::SetupCallbacks();
    level._id_7134 = 0;
    level._id_64E9 = ::_id_64E9;
    level._id_40D0 = ::_id_40D0;
    level._id_64E6 = ::_id_64E6;
    _id_A75A::_id_72F1( level._id_01B5, 0 );
    _id_A75A::_id_72F6( level._id_01B5, 0 );
    _id_A75A::_id_72F5( level._id_01B5, 1 );
    _id_A75A::_id_72EC( level._id_01B5, 0 );
    level._id_1E38 = level._id_1E2E;
    level._id_1E2E = ::_id_5BAE;
    game["menu_team"] = "main";
    game["menu_class_allies"] = "main";
    game["menu_class_axis"] = "main";
    game["menu_changeclass_allies"] = "main";
    game["menu_changeclass_axis"] = "main";
    game["menu_changeclass"] = "menu_cac_assault";
    game["allies"] = "sentinel_vl";
    game["axis"] = "atlas";
}

_id_5BAE( var_0 )
{
    level._id_4C6A = 1;
    self._id_4726 = 0;
    [[ level._id_1E38 ]]( var_0 );
}

_id_64E9()
{
    getteamplayersalive( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    _id_A75A::_id_7FBF( "allies", &"OBJECTIVES_WAR" );
    _id_A75A::_id_7FBF( "axis", &"OBJECTIVES_WAR" );
    _id_A75A::_id_7FBE( "allies", &"OBJECTIVES_WAR" );
    _id_A75A::_id_7FBE( "axis", &"OBJECTIVES_WAR" );
    _id_A75A::_id_7FBD( "allies", &"OBJECTIVES_WAR" );
    _id_A75A::_id_7FBD( "axis", &"OBJECTIVES_WAR" );
    _id_4D5A();
    var_0[0] = level._id_01B5;
    _id_A78A::main( var_0 );
    level._id_6F06 = 0;
    level._id_6F07 = 0;
}

_id_4D5A()
{
    level._id_89F0 = ( 0, 0, 0 );
    level._id_89ED = ( 0, 0, 0 );
    _id_A7AF::_id_0831( "mp_tdm_spawn_allies_start" );
    _id_A7AF::_id_0831( "mp_tdm_spawn_axis_start" );
    level._id_8923 = "mp_tdm_spawn";
    _id_A7AF::_id_082F( "allies", level._id_8923 );
    _id_A7AF::_id_082F( "axis", level._id_8923 );
    level._id_5983 = _id_A7AF::_id_3777( level._id_89F0, level._id_89ED );
    setmapcenter( level._id_5983 );
}

_id_40D0( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        var_0 = 0;

        for ( var_1 = 0; var_1 < level._id_0328.size; var_1++ )
        {
            if ( level._id_0328[var_1] == self )
            {
                var_0 = var_1;
                break;
            }
        }
    }

    var_2 = getentarray( "player_pos", "targetname" );
    var_3 = undefined;

    foreach ( var_3 in var_2 )
    {
        if ( var_3._id_039B == "" + var_0 )
            break;
    }

    if ( !isdefined( var_3 ) )
        var_3 = var_2[0];

    self._id_117A = var_3;
    return var_3;
}

_id_64E6()
{
    if ( isdefined( level._id_9EA1 ) )
        self [[ level._id_9EA1 ]]();
}
