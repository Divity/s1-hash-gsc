// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_19EE()
{
    level._id_4A35 = 0;

    if ( level._id_3BD8 )
        return;

    var_0 = getmatchdata( "hostMigrationCount" );
    var_0++;
    setmatchdata( "hostMigrationCount", var_0 );

    foreach ( var_2 in level._id_1C8E )
        var_2._id_4A33 = 0;

    level._id_4A36 = 1;
    setdvar( "ui_inhostmigration", 1 );
    level notify( "host_migration_begin" );
    _id_A789::_id_9B84();

    foreach ( var_2 in level._id_1C8E )
    {
        var_2 thread _id_4A37();

        if ( isplayer( var_2 ) )
            var_2 _meth_82FB( "ui_session_state", var_2._id_03BC );
    }

    setdvar( "ui_game_state", game["state"] );
    level endon( "host_migration_begin" );
    _id_4A39();
    level._id_4A36 = undefined;
    setdvar( "ui_inhostmigration", 0 );
    level notify( "host_migration_end" );
    _id_A789::_id_9B84();
    level thread _id_A789::_id_9B17();
}

_id_4A39()
{
    level endon( "game_ended" );
    level._id_4C6A = 25;
    thread _id_A789::_id_59EA( 20.0 );
    _id_4A3A();
    level._id_4C6A = 10;
    thread _id_A789::_id_59EA( 5.0 );
    wait 5;
    level._id_4C6A = 0;
}

_id_4A3A()
{
    level endon( "hostmigration_enoughplayers" );
    wait 15;
}

_id_4A34( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "<removed_ent>";

    var_1 = -1;
    var_2 = "?";

    if ( isdefined( var_0._id_3313 ) )
        var_1 = var_0._id_3313;

    if ( isplayer( var_0 ) && isdefined( var_0._id_02AB ) )
        var_2 = var_0._id_02AB;

    if ( isplayer( var_0 ) )
        return "player <" + var_2 + "> (entNum " + var_1 + " )";

    if ( isagent( var_0 ) && _id_A75A::_id_510F( var_0 ) )
        return "participant agent <" + var_1 + ">";

    if ( isagent( var_0 ) )
        return "non-participant agent <" + var_1 + ">";

    return "unknown entity <" + var_1 + ">";
}

_id_4A38()
{
    level endon( "host_migration_begin" );
    level endon( "host_migration_end" );
    self endon( "disconnect" );
    self._id_4A33 = 1;

    while ( !_id_A75A::_id_5186( self ) )
        self waittill( "spawned" );

    _id_A75A::_id_3A30( 1 );
    self _meth_800D();
    level waittill( "host_migration_end" );
}

_id_4A37()
{
    level endon( "host_migration_begin" );
    self endon( "disconnect" );

    if ( isagent( self ) )
        self endon( "death" );

    _id_4A38();

    if ( self._id_4A33 )
    {
        if ( _id_A75A::_id_3BDB( "prematch_done" ) )
        {
            _id_A75A::_id_3A30( 0 );
            self _meth_800C();
        }

        self._id_4A33 = undefined;
    }
}

_id_A0D4()
{
    if ( !isdefined( level._id_4A36 ) )
        return 0;

    var_0 = gettime();
    level waittill( "host_migration_end" );
    return gettime() - var_0;
}

_id_A0D5( var_0 )
{
    if ( isdefined( level._id_4A36 ) )
        return;

    level endon( "host_migration_begin" );
    wait(var_0);
}

_id_A049( var_0 )
{
    if ( var_0 == 0 )
        return;

    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    while ( gettime() < var_2 )
    {
        _id_A0D5( ( var_2 - gettime() ) / 1000 );

        if ( isdefined( level._id_4A36 ) )
        {
            var_3 = _id_A0D4();
            var_2 += var_3;
        }
    }

    _id_A0D4();
    return gettime() - var_1;
}

_id_A098( var_0, var_1 )
{
    self endon( var_0 );

    if ( var_1 == 0 )
        return;

    var_2 = gettime();
    var_3 = gettime() + var_1 * 1000;

    while ( gettime() < var_3 )
    {
        _id_A0D5( ( var_3 - gettime() ) / 1000 );

        if ( isdefined( level._id_4A36 ) )
        {
            var_4 = _id_A0D4();
            var_3 += var_4;
        }
    }

    _id_A0D4();
    return gettime() - var_2;
}

_id_A048( var_0 )
{
    if ( var_0 == 0 )
        return;

    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    while ( gettime() < var_2 )
    {
        _id_A0D5( ( var_2 - gettime() ) / 1000 );

        while ( isdefined( level._id_4A36 ) )
        {
            var_2 += 1000;
            setgameendtime( int( var_2 ) );
            wait 1;
        }
    }

    while ( isdefined( level._id_4A36 ) )
    {
        var_2 += 1000;
        setgameendtime( int( var_2 ) );
        wait 1;
    }

    return gettime() - var_1;
}
