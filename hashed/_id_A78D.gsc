// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_8A76 = issplitscreen();
    level._id_034C = getdvar( "ps3Game" ) == "true";
    level._id_0532 = getdvar( "xenonGame" ) == "true";
    level._id_2153 = getdvar( "consoleGame" ) == "true";
    level._id_64B5 = _func_2BB();
    level._id_7134 = level._id_64B5 && !getdvarint( "xblive_privatematch" );
    level._id_6E92 = getdvarint( "practiceroundgame" );
    level._id_0391 = tolower( getdvar( "mapname" ) );

    if ( getdvarint( "virtualLobbyActive", 0 ) )
        level._id_01B5 = "vlobby";
    else
        level._id_01B5 = tolower( getdvar( "g_gametype" ) );

    level._id_91F0 = [ "axis", "allies" ];
    level._id_65B0["allies"] = "axis";
    level._id_65B0["axis"] = "allies";
    level._id_5FE9 = 0;
    level._id_91E4 = 0;
    level._id_62F5 = 0;
    level._id_3162 = 1;
    level._id_8510 = 0;
    level._id_937F = getdvarint( "scr_tispawndelay" );

    if ( !isdefined( level._id_99D8 ) )
        _id_A7B3::_id_0209();

    precachestring( &"MP_HALFTIME" );
    precachestring( &"MP_OVERTIME" );
    precachestring( &"MP_ROUNDEND" );
    precachestring( &"MP_INTERMISSION" );
    precachestring( &"MP_SWITCHING_SIDES" );
    precachestring( &"MP_FRIENDLY_FIRE_WILL_NOT" );
    precachestring( &"MP_SUICIDE_PUNISHED" );
    precachestring( &"PLATFORM_REVIVE" );
    precachestring( &"MP_OBITUARY_NEUTRAL" );
    precachestring( &"MP_OBITUARY_FRIENDLY" );
    precachestring( &"MP_OBITUARY_ENEMY" );

    if ( level._id_8A76 )
        precachestring( &"MP_ENDED_GAME" );
    else
        precachestring( &"MP_HOST_ENDED_GAME" );

    level._id_44FC = "halftime";
    level._id_44FA = 0;
    level._id_55F9 = 0;
    level._id_A1CB = "none";
    level._id_55D9 = 0;
    level._id_685E["allies"] = [];
    level._id_685E["axis"] = [];
    level._id_685E["all"] = [];
    level._id_6E89 = 5.0;

    if ( _id_A75A::_id_6E98() )
        level._id_6E89 = 0.0;

    level._id_6D56 = [];
    _id_72EB();
    precachemodel( "tag_origin" );

    if ( !level._id_6E92 && ( _id_A75A::_id_59E0() || ( level._id_01B5 == "horde" || level._id_01B5 == "zombies" ) && level._id_64B5 ) )
    {
        var_0 = " LB_MAP_" + getdvar( "ui_mapname" );
        var_1 = " LB_GM_" + level._id_01B5;

        if ( getdvarint( "g_hardcore" ) )
            var_1 += "_HC";
        else if ( !_id_A75A::_id_50C1() )
            var_1 += "_CL";

        if ( level._id_01B5 == "horde" && level._id_64B5 )
            precacheleaderboards( "LB_GM_HORDE LB_GM_HORDE_BESTS" );
        else if ( level._id_01B5 == "zombies" && level._id_64B5 )
        {
            switch ( level._id_0391 )
            {
                case "mp_zombie_brg":
                    precacheleaderboards( "LB_GM_ZOMBIES_2 LB_GM_ZOMBIES_2_BESTS" );
                    break;
                case "mp_zombie_ark":
                    precacheleaderboards( "LB_GM_ZOMBIES_3 LB_GM_ZOMBIES_3_BESTS" );
                    break;
                case "mp_zombie_h2o":
                    if ( isdefined( game["start_in_zmb_hard_mode"] ) && game["start_in_zmb_hard_mode"] )
                        precacheleaderboards( "LB_GM_ZOMBIES_4X LB_GM_ZOMBIES_4X_BESTS" );
                    else
                        precacheleaderboards( "LB_GM_ZOMBIES_4 LB_GM_ZOMBIES_4_BESTS" );

                    break;
                case "mp_zombie_lab":
                default:
                    precacheleaderboards( "LB_GM_ZOMBIES LB_GM_ZOMBIES_BESTS" );
                    break;
            }
        }
        else
            precacheleaderboards( "LB_GB_TOTALXP_AT LB_GB_TOTALXP_LT LB_GB_WINS_AT LB_GB_WINS_LT LB_GB_KILLS_AT LB_GB_KILLS_LT LB_GB_ACCURACY_AT LB_ACCOLADES LB_GB_RANKEDPLAY" + var_1 + var_0 );
    }

    level._id_91E6["allies"] = 0;
    level._id_91E6["axis"] = 0;
    level._id_91E6["spectator"] = 0;
    level._id_09DD["allies"] = 0;
    level._id_09DD["axis"] = 0;
    level._id_09DD["spectator"] = 0;
    level._id_57B6["allies"] = 0;
    level._id_57B6["axis"] = 0;
    level._id_6488 = [];
    level._id_4742["allies"] = 0;
    level._id_4742["axis"] = 0;
    var_2 = 9;
    _id_4D1A( var_2 );
}

_id_4D1A( var_0 )
{
    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = "team_" + var_1;
        level._id_685E[var_2] = [];
        level._id_91E6[var_2] = 0;
        level._id_09DD[var_2] = 0;
        level._id_57B6[var_2] = 0;
        level._id_4742[var_2] = 0;
    }
}

_id_72EB()
{
    setomnvar( "ui_bomb_timer", 0 );
    setomnvar( "ui_nuke_end_milliseconds", 0 );
    setdvar( "ui_danger_team", "" );
    setdvar( "ui_inhostmigration", 0 );
    setdvar( "camera_thirdPerson", getdvarint( "scr_thirdPerson" ) );
}

SetupCallbacks()
{
    level._id_64FB = ::_id_64FB;
    level._id_40D0 = ::_id_148E;
    level._id_64E6 = ::_id_148E;
    level._id_64DF = ::_id_148E;
    level._id_64ED = _id_A789::_id_2786;
    level._id_64AF = _id_A789::_id_2784;
    level._id_6463 = _id_A789::_id_2783;
    level._id_64BD = _id_A789::_id_2785;
    level._id_64D7 = ::_id_148E;
    level._id_64E9 = ::_id_148E;
    level._id_64D0 = ::_id_148E;
    level._id_112A = _id_A79F::_id_112A;
}

_id_148E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{

}

_id_92A9()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        wait 10.0;
        var_0 = spawnstruct();
        var_0._id_939B = &"MP_CHALLENGE_COMPLETED";
        var_0._id_6235 = "wheee";
        var_0._id_8893 = "mp_challenge_complete";
        thread _id_A79C::_id_622B( var_0 );
    }
}

_id_92AA()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        wait 3.0;
        var_0 = randomint( 6 );

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            iprintlnbold( var_0 );
            self _meth_8182( "frag_grenade_mp", 0.2 );
            wait 0.1;
        }
    }
}

_id_64FB( var_0 )
{
    level thread _id_A7AA::_id_1208( var_0, self );
}

_id_2728( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 50; var_2++ )
        wait 0.05;
}
