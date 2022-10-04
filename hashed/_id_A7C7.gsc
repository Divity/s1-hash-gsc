// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_058F["nuke_flash"] = loadfx( "vfx/explosion/dna_bomb_flash_mp" );
    level._id_058F["nuke_aftermath"] = loadfx( "vfx/dust/nuke_aftermath_mp" );
    level._id_058F["dna_bomb_body_gas"] = loadfx( "vfx/explosion/dna_bomb_body_gas" );
    game["strings"]["nuclear_strike"] = &"KILLSTREAKS_TACTICAL_NUKE";
    level._id_5398["nuke"] = ::_id_98B4;
    level._id_53AC["nuke_mp"] = "nuke";
    setdvarifuninitialized( "scr_nukeTimer", 10 );
    setdvarifuninitialized( "scr_nukeCancelMode", 0 );
    level._id_6275 = getdvarint( "scr_nukeTimer" );
    level._id_1ABA = getdvarint( "scr_nukeCancelMode" );
    level._id_626E = 60.0;
    level._id_626F = int( level._id_626E );
    level._id_6271 = spawnstruct();
    level._id_6271._id_A3A0 = 2;
    level._id_626A = undefined;
    level thread _id_64C5();
}

_id_98B4( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_6270 ) )
    {
        self _meth_826E( &"KILLSTREAKS_NUKE_ALREADY_INBOUND" );
        return 0;
    }

    if ( _id_A75A::_id_51E0() )
        return 0;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    thread _id_2D3E( var_2 );
    _id_A744::_id_5838( "nuke", self._id_02E6 );
    return 1;
}

_id_27EF( var_0, var_1 )
{
    level endon( "nuke_cancelled" );
    _id_A79A::_id_A049( var_0 );
    thread [[ var_1 ]]();
}

_id_2D3E( var_0 )
{
    level endon( "nuke_cancelled" );
    level._id_6271._id_031D = self;
    level._id_6271._id_04A8 = self._id_030D["team"];
    level._id_6270 = 1;
    setomnvar( "ui_bomb_timer", 4 );

    if ( level._id_91E4 )
        thread _id_A75A::_id_91F3( "used_nuke", self, self._id_04A8 );
    else if ( !level._id_46C7 )
        self _meth_826E( &"MP_FRIENDLY_TACTICAL_NUKE" );

    level thread _id_27EF( level._id_6275 - 3.3, ::_id_6274 );
    level thread _id_27EF( level._id_6275, ::_id_6273 );
    level thread _id_27EF( level._id_6275, ::_id_6272 );
    level thread _id_27EF( level._id_6275 - 0.32, ::_id_626D );
    level thread _id_27EF( level._id_6275 - 0.1, ::_id_6276 );
    level thread _id_27EF( level._id_6275 + 0.5, ::_id_6269 );
    level thread _id_27EF( level._id_6275 + 1.5, ::_id_626B );
    level thread _id_6267();
    level thread _id_9AE3();

    if ( level._id_1ABA && var_0 )
        level thread _id_1ABB( self );

    if ( !isdefined( level._id_6263 ) )
    {
        level._id_6263 = spawn( "script_origin", ( 0, 0, 0 ) );
        level._id_6263 _meth_8054();
    }

    if ( !isdefined( level._id_6266 ) )
    {
        level._id_6266 = spawn( "script_origin", ( 0, 0, 1 ) );
        level._id_6266 _meth_8054();
    }

    for ( var_1 = level._id_6275; var_1 > 0; var_1-- )
    {
        level._id_6263 _meth_809A( "ks_dna_warn_timer" );
        wait 1.0;
    }
}

_id_1ABB( var_0 )
{
    var_0 _id_A4F0::_id_A060( "death", "disconnect" );
    setomnvar( "ui_bomb_timer", 0 );
    level._id_6270 = undefined;
    level notify( "nuke_cancelled" );
}

_id_6274()
{
    level endon( "nuke_cancelled" );

    if ( isdefined( level._id_6266 ) )
        level._id_6266 _meth_809A( "ks_dna_incoming" );
}

_id_6273()
{
    level endon( "nuke_cancelled" );

    if ( isdefined( level._id_6266 ) )
    {
        level._id_6266 _meth_809A( "ks_dna_explosion" );
        level._id_6266 _meth_809A( "ks_dna_wave" );
    }
}

_id_626D()
{
    level endon( "nuke_cancelled" );

    foreach ( var_1 in level._id_0328 )
    {
        var_2 = anglestoforward( var_1._id_0041 );
        var_2 = ( var_2[0], var_2[1], 0 );
        var_2 = vectornormalize( var_2 );
        var_3 = 300;
        var_4 = spawn( "script_model", var_1._id_02E6 + var_2 * var_3 );
        var_4 _meth_80B1( "tag_origin" );
        var_4._id_0041 = ( 0, var_1._id_0041[1] + 180, 90 );
        var_4 thread _id_626C( var_1 );
    }
}

_id_626C( var_0 )
{
    level endon( "nuke_cancelled" );
    var_0 endon( "disconnect" );
    waittillframeend;
    playfxontagforclients( level._id_058F["nuke_flash"], self, "tag_origin", var_0 );
}

_id_6267()
{
    level endon( "nuke_cancelled" );
    level waittill( "spawning_intermission" );
    var_0 = getentarray( "mp_global_intermission", "classname" );
    var_0 = var_0[0];
    var_1 = anglestoup( var_0._id_0041 );
    var_2 = anglestoright( var_0._id_0041 );
    playfx( level._id_058F["nuke_aftermath"], var_0._id_02E6, var_1, var_2 );
}

_id_6272()
{
    level endon( "nuke_cancelled" );
    setomnvar( "ui_bomb_timer", 0 );
    setslowmotion( 1.0, 0.25, 0.5 );
    level waittill( "nuke_death" );
    setslowmotion( 0.25, 1, 2.0 );
}

_id_6276()
{
    level endon( "nuke_cancelled" );
    var_0 = "dna_bomb";

    if ( isdefined( level.dnavisionset ) )
        var_0 = level.dnavisionset;

    level._id_6277 = 1;

    foreach ( var_2 in level._id_0328 )
    {
        var_2 _meth_847A( var_0, 0.5 );
        var_2 thread _id_A73D::_id_0CAD( 1.6, 0.35 );
    }

    level waittill( "nuke_death" );
    wait 3.0;

    foreach ( var_2 in level._id_0328 )
        var_2 _meth_847A( "", 10 );

    level._id_6277 = undefined;
}

_id_6269()
{
    level endon( "nuke_cancelled" );
    level notify( "nuke_death" );
    _id_A79A::_id_A0D4();
    ambientstop( 1 );
    var_0 = 0;

    foreach ( var_2 in level._id_0328 )
    {
        if ( level._id_91E4 )
        {
            if ( isdefined( level._id_6271._id_04A8 ) && var_2._id_04A8 == level._id_6271._id_04A8 )
                continue;
        }
        else if ( isdefined( level._id_6271._id_031D ) && var_2 == level._id_6271._id_031D )
            continue;

        var_2._id_6268 = 1;

        if ( isalive( var_2 ) )
        {
            var_2 thread _id_A783::_id_3798( level._id_6271._id_031D, level._id_6271._id_031D, 999999, 0, "MOD_EXPLOSIVE", "nuke_mp", var_2._id_02E6, var_2._id_02E6, "none", 0, 0 );

            if ( isdefined( var_2._id_512E ) && var_2._id_512E == 1 )
                var_2 _meth_8051( 1, var_2._id_02E6, level._id_6271._id_031D, level._id_6271._id_031D, "MOD_EXPLOSIVE", "nuke_mp" );

            _id_A75A::_id_27EE( var_0 + 1, ::_id_1515, var_2._id_0087 );
            var_0 += 0.05;
        }
    }

    level thread _id_6264();
    level._id_6270 = undefined;
}

_id_1515( var_0 )
{
    if ( isdefined( var_0 ) )
        playfxontag( _id_A4F0::_id_3FA6( "dna_bomb_body_gas" ), var_0, "J_SPINELOWER" );
}

_id_626B()
{
    level endon( "nuke_cancelled" );
    level waittill( "nuke_death" );
}

_id_6264()
{
    level endon( "game_ended" );
    level notify( "nuke_EMPJam" );
    level endon( "nuke_EMPJam" );

    if ( level._id_5FE9 )
    {
        for ( var_0 = 0; var_0 < level._id_91F0.size; var_0++ )
        {
            if ( level._id_6271._id_04A8 != level._id_91F0[var_0] )
                level _id_A7C1::_id_28E0( level._id_6271._id_031D, level._id_91F0[var_0] );
        }
    }
    else if ( level._id_91E4 )
        level _id_A7C1::_id_28E0( level._id_6271._id_031D, _id_A75A::_id_4065( level._id_6271._id_04A8 ) );
    else
        level _id_A7C1::_id_28E0( level._id_6271._id_031D, _id_A75A::_id_4065( level._id_6271._id_04A8 ) );

    level notify( "nuke_emp_update" );
    level notify( "nuke_emp_update" );
    level notify( "nuke_emp_ended" );
}

_id_52DC()
{
    level notify( "keepNukeEMPTimeRemaining" );
    level endon( "keepNukeEMPTimeRemaining" );
    level endon( "nuke_emp_ended" );

    for ( level._id_626F = int( level._id_626E ); level._id_626F; level._id_626F-- )
        wait 1.0;
}

_id_6265()
{
    level endon( "game_ended" );

    for (;;)
    {
        level _id_A4F0::_id_A07E( "joined_team", "nuke_emp_update" );

        foreach ( var_1 in level._id_0328 )
        {
            if ( var_1._id_04A8 == "spectator" )
                continue;

            if ( level._id_91E4 )
            {
                if ( isdefined( level._id_6271._id_04A8 ) && var_1._id_04A8 == level._id_6271._id_04A8 )
                    continue;
            }
            else if ( isdefined( level._id_6271._id_031D ) && var_1 == level._id_6271._id_031D )
                continue;

            if ( !level._id_91F1[var_1._id_04A8] && !var_1 _id_A75A::_id_50F6() )
            {
                var_1 _meth_821D( 0 );
                continue;
            }

            var_1 _meth_821D( 1 );
        }
    }
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

        if ( isdefined( level._id_6277 ) )
        {
            self _meth_847A( "dna_bomb" );
            waittillframeend;
            self _meth_847A( "", 10 );
        }
    }
}

_id_9AE3()
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level endon( "nuke_cancelled" );
    level endon( "nuke_death" );
    var_0 = level._id_6275 * 1000 + gettime();
    setomnvar( "ui_nuke_end_milliseconds", var_0 );
    level waittill( "host_migration_begin" );
    var_1 = _id_A79A::_id_A0D4();

    if ( var_1 > 0 )
        setomnvar( "ui_nuke_end_milliseconds", var_0 + var_1 );
}
