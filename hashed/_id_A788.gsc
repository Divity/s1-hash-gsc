// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_2DD6 = 0;
    game["headicon_allies"] = _id_A7B2::_id_4114( "allies" );
    game["headicon_axis"] = _id_A7B2::_id_4114( "axis" );
    level thread _id_64C5();

    for (;;)
    {
        _id_9B15();
        wait 5;
    }
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64D3();
        var_0 thread _id_64D0();
    }
}

_id_64D3()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_8507();
    }
}

_id_64D0()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "killed_player" );
        self._id_01E4 = "";
    }
}

_id_8507()
{
    if ( level._id_2DD6 )
    {
        if ( self._id_030D["team"] == "allies" )
        {
            self._id_01E4 = game["headicon_allies"];
            self._id_01E5 = "allies";
        }
        else
        {
            self._id_01E4 = game["headicon_axis"];
            self._id_01E5 = "axis";
        }
    }
}

_id_9B15()
{
    var_0 = _id_A75A::_id_3FD9( "scr_drawfriend", level._id_2DD6 );

    if ( level._id_2DD6 != var_0 )
    {
        level._id_2DD6 = var_0;
        _id_9B14();
    }
}

_id_9B14()
{
    var_0 = level._id_0328;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2._id_030D["team"] ) && var_2._id_030D["team"] != "spectator" && var_2._id_03BC == "playing" )
        {
            if ( level._id_2DD6 )
            {
                if ( var_2._id_030D["team"] == "allies" )
                {
                    var_2._id_01E4 = game["headicon_allies"];
                    var_2._id_01E5 = "allies";
                }
                else
                {
                    var_2._id_01E4 = game["headicon_axis"];
                    var_2._id_01E5 = "axis";
                }

                continue;
            }

            var_0 = level._id_0328;

            for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            {
                var_2 = var_0[var_1];

                if ( isdefined( var_2._id_030D["team"] ) && var_2._id_030D["team"] != "spectator" && var_2._id_03BC == "playing" )
                    var_2._id_01E4 = "";
            }
        }
    }
}
