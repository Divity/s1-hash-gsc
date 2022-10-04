// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_4A3B = getdvar( "sv_hostname" );

    if ( level._id_4A3B == "" )
        level._id_4A3B = "CoDHost";

    setdvar( "sv_hostname", level._id_4A3B );
    level._id_0AB4 = getdvarint( "g_allowvote", 1 );
    setdvar( "g_allowvote", level._id_0AB4 );
    level._id_01A9 = _id_A7B3::_id_413F( "team", "fftype" );
    _id_215B( getdvar( "g_gametype" ) );

    for (;;)
    {
        _id_9B60();
        wait 5;
    }
}

_id_9B60()
{
    var_0 = getdvar( "sv_hostname" );

    if ( level._id_4A3B != var_0 )
        level._id_4A3B = var_0;

    var_1 = getdvarint( "g_allowvote", 1 );

    if ( level._id_0AB4 != var_1 )
        level._id_0AB4 = var_1;

    var_2 = _id_A7B3::_id_413F( "team", "fftype" );

    if ( level._id_01A9 != var_2 )
        level._id_01A9 = var_2;
}

_id_215B( var_0 )
{
    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( var_0 == "dm" )
        {
            if ( isdefined( var_3._id_79F2 ) && var_3._id_79F2 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "tdm" )
        {
            if ( isdefined( var_3._id_79F6 ) && var_3._id_79F6 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "ctf" )
        {
            if ( isdefined( var_3._id_79F1 ) && var_3._id_79F1 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "hq" )
        {
            if ( isdefined( var_3._id_79F3 ) && var_3._id_79F3 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "sd" )
        {
            if ( isdefined( var_3._id_79F5 ) && var_3._id_79F5 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "koth" )
        {
            if ( isdefined( var_3._id_79F4 ) && var_3._id_79F4 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "atdm" )
        {
            if ( isdefined( var_3._id_79F0 ) && var_3._id_79F0 != "1" )
                var_3 delete();
        }
    }
}
