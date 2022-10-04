// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    var_0 = [];
    var_1 = getentarray( "zipline", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = _id_A78A::_id_244C( "neutral", var_1[var_2], var_0, ( 0, 0, 0 ) );
        var_3 _id_A78A::_id_0AB2( "any" );
        var_3 _id_A78A::_id_8346( 0.25 );
        var_3 _id_A78A::_id_8345( &"MP_ZIPLINE_USE" );
        var_3 _id_A78A::_id_8344( &"MP_ZIPLINE_USE" );
        var_3 _id_A78A::_id_834C( "any" );
        var_3._id_6451 = ::_id_6451;
        var_3._id_64F5 = ::_id_64F5;
        var_4 = [];
        var_5 = getent( var_1[var_2]._id_04A5, "targetname" );

        if ( !isdefined( var_5 ) )
        {

        }

        while ( isdefined( var_5 ) )
        {
            var_4[var_4.size] = var_5;

            if ( isdefined( var_5._id_04A5 ) )
            {
                var_5 = getent( var_5._id_04A5, "targetname" );
                continue;
            }

            break;
        }

        var_3._id_91D2 = var_4;
    }

    precachemodel( "tag_player" );
    _id_4CE3();
}

_id_6451( var_0 )
{
    var_0 _meth_809A( "scrambler_pullout_lift_plr" );
}

_id_64F5( var_0 )
{
    var_0 thread _id_A3B6( self );
}

_id_A3B6( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "zipline_drop" );
    level endon( "game_ended" );
    var_1 = spawn( "script_origin", var_0._id_04C6._id_02E6 );
    var_1._id_02E6 = var_0._id_04C6._id_02E6;
    var_1._id_0041 = self._id_0041;
    var_1 _meth_80B1( "tag_player" );
    self _meth_807D( var_1, "tag_player", 1, 180, 180, 180, 180 );
    thread _id_A206( var_1 );
    thread _id_A20A( var_1 );
    var_2 = var_0._id_91D2;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = distance( var_1._id_02E6, var_2[var_3]._id_02E6 ) / 600;
        var_5 = 0.0;

        if ( var_3 == 0 )
            var_5 = var_4 * 0.2;

        var_1 _meth_82AE( var_2[var_3]._id_02E6, var_4, var_5 );

        if ( var_1._id_0041 != var_2[var_3]._id_0041 )
            var_1 _meth_82B5( var_2[var_3]._id_0041, var_4 * 0.8 );

        wait(var_4);
    }

    self notify( "destination" );
    self _meth_804F();
    var_1 delete();
}

_id_A20A( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "destination" );
    level endon( "game_ended" );
    self _meth_82DD( "zipline_drop", "+gostand" );
    self waittill( "zipline_drop" );
    self _meth_804F();
    var_0 delete();
}

_id_A206( var_0 )
{
    self endon( "disconnect" );
    self endon( "destination" );
    self endon( "zipline_drop" );
    level endon( "game_ended" );
    self waittill( "death" );
    self _meth_804F();
    var_0 delete();
}

_id_4CE3()
{
    var_0 = [];
    var_1 = getentarray( "elevator_button", "targetname" );
    level._id_3028 = spawnstruct();
    level._id_3028._id_57F1 = "floor1";
    level._id_3028._id_8D61 = [];
    level._id_3028._id_8D61["elevator"] = "closed";
    level._id_3028._id_28BD = [];

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = _id_A78A::_id_244C( "neutral", var_1[var_2], var_0, ( 0, 0, 0 ) );
        var_3 _id_A78A::_id_0AB2( "any" );
        var_3 _id_A78A::_id_8346( 0.25 );
        var_3 _id_A78A::_id_8345( &"MP_ZIPLINE_USE" );
        var_3 _id_A78A::_id_8344( &"MP_ZIPLINE_USE" );
        var_3 _id_A78A::_id_834C( "any" );
        var_3._id_6451 = ::_id_6452;
        var_3._id_64F5 = ::_id_64F6;
        var_3._id_57F1 = var_1[var_2]._id_0397;
        level._id_3028._id_8D61[var_1[var_2]._id_0397] = "closed";

        if ( isdefined( var_1[var_2]._id_04A5 ) )
        {
            var_4 = _id_A4F0::_id_40F9( var_1[var_2]._id_04A5, "targetname" );

            if ( isdefined( var_4 ) )
                level._id_3028._id_28BD[var_1[var_2]._id_0397] = var_4;
        }
    }
}

_id_6452( var_0 )
{

}

_id_64F6( var_0 )
{
    switch ( self._id_57F1 )
    {
        case "floor1":
            if ( level._id_3028._id_8D61["floor1"] == "closed" )
            {
                if ( level._id_3028._id_57F1 == "floor1" )
                {
                    if ( level._id_3028._id_8D61["elevator"] == "closed" )
                    {
                        level thread _id_6500( "floor1" );
                        level thread _id_6500( "elevator" );
                    }
                }
                else if ( level._id_3028._id_57F1 == "floor2" )
                {
                    if ( level._id_3028._id_8D61["elevator"] == "opened" )
                    {
                        level notify( "stop_autoClose" );
                        level thread _id_1FCB( "floor2" );
                        level _id_1FCB( "elevator" );
                    }

                    if ( level._id_3028._id_8D61["elevator"] == "closed" )
                    {
                        level _id_5EFB();
                        level thread _id_6500( "floor1" );
                        level thread _id_6500( "elevator" );
                    }
                }
            }

            break;
        case "floor2":
            if ( level._id_3028._id_8D61["floor2"] == "closed" )
            {
                if ( level._id_3028._id_57F1 == "floor2" )
                {
                    if ( level._id_3028._id_8D61["elevator"] == "closed" )
                    {
                        level thread _id_6500( "floor2" );
                        level thread _id_6500( "elevator" );
                    }
                }
                else if ( level._id_3028._id_57F1 == "floor1" )
                {
                    if ( level._id_3028._id_8D61["elevator"] == "opened" )
                    {
                        level notify( "stop_autoClose" );
                        level thread _id_1FCB( "floor1" );
                        level _id_1FCB( "elevator" );
                    }

                    if ( level._id_3028._id_8D61["elevator"] == "closed" )
                    {
                        level _id_5EFB();
                        level thread _id_6500( "floor2" );
                        level thread _id_6500( "elevator" );
                    }
                }
            }

            break;
        case "elevator":
            if ( level._id_3028._id_8D61["elevator"] == "opened" )
            {
                level notify( "stop_autoClose" );
                level thread _id_1FCB( level._id_3028._id_57F1 );
                level _id_1FCB( "elevator" );
            }

            if ( level._id_3028._id_8D61["elevator"] == "closed" )
            {
                level _id_5EFB();
                level thread _id_6500( level._id_3028._id_57F1 );
                level thread _id_6500( "elevator" );
            }

            break;
    }
}

_id_6500( var_0 )
{
    level._id_3028._id_8D61[var_0] = "opening";
    var_1 = getent( "e_door_" + var_0 + "_left", "targetname" );
    var_2 = getent( "e_door_" + var_0 + "_right", "targetname" );

    if ( isdefined( var_1._id_039B ) && var_1._id_039B == "fahrenheit" )
    {
        var_1 _meth_82AE( var_1._id_02E6 - anglestoforward( var_1._id_0041 ) * 35, 2 );
        var_2 _meth_82AE( var_2._id_02E6 + anglestoforward( var_2._id_0041 ) * 35, 2 );
        var_1 _meth_809A( "elev_door_open" );
    }
    else
    {
        var_1 _meth_82AE( var_1._id_02E6 - anglestoright( var_1._id_0041 ) * 35, 2 );
        var_2 _meth_82AE( var_2._id_02E6 + anglestoright( var_2._id_0041 ) * 35, 2 );
    }

    wait 2;
    level._id_3028._id_8D61[var_0] = "opened";

    if ( var_0 == "elevator" )
        level thread _id_112B();
}

_id_1FCB( var_0 )
{
    level._id_3028._id_8D61[var_0] = "closing";
    var_1 = getent( "e_door_" + var_0 + "_left", "targetname" );
    var_2 = getent( "e_door_" + var_0 + "_right", "targetname" );

    if ( isdefined( var_1._id_039B ) && var_1._id_039B == "fahrenheit" )
    {
        var_1 _meth_82AE( var_1._id_02E6 + anglestoforward( var_1._id_0041 ) * 35, 2 );
        var_2 _meth_82AE( var_2._id_02E6 - anglestoforward( var_2._id_0041 ) * 35, 2 );
        var_1 _meth_809A( "elev_door_close" );
    }
    else
    {
        var_1 _meth_82AE( var_1._id_02E6 + anglestoright( var_1._id_0041 ) * 35, 2 );
        var_2 _meth_82AE( var_2._id_02E6 - anglestoright( var_2._id_0041 ) * 35, 2 );
    }

    wait 2;
    level._id_3028._id_8D61[var_0] = "closed";
}

_id_112B()
{
    level endon( "stop_autoClose" );
    wait 10;
    level thread _id_1FCB( level._id_3028._id_57F1 );
    level thread _id_1FCB( "elevator" );
}

_id_5EFB()
{
    level._id_3028._id_8D61["elevator"] = "moving";
    var_0 = getent( "e_door_elevator_left", "targetname" );
    var_1 = getent( "e_door_elevator_right", "targetname" );
    var_2 = getent( "elevator", "targetname" );

    if ( level._id_3028._id_57F1 == "floor1" )
    {
        level._id_3028._id_57F1 = "floor2";
        var_3 = var_0._id_02E6[2] - level._id_3028._id_28BD["floor1"]._id_02E6[2];
        var_0 _meth_82AE( ( var_0._id_02E6[0], var_0._id_02E6[1], level._id_3028._id_28BD["floor2"]._id_02E6[2] + var_3 ), 5 );
        var_3 = var_1._id_02E6[2] - level._id_3028._id_28BD["floor1"]._id_02E6[2];
        var_1 _meth_82AE( ( var_1._id_02E6[0], var_1._id_02E6[1], level._id_3028._id_28BD["floor2"]._id_02E6[2] + var_3 ), 5 );
        var_2 _meth_82AE( level._id_3028._id_28BD["floor2"]._id_02E6, 5 );
    }
    else
    {
        level._id_3028._id_57F1 = "floor1";
        var_3 = var_0._id_02E6[2] - level._id_3028._id_28BD["floor2"]._id_02E6[2];
        var_0 _meth_82AE( ( var_0._id_02E6[0], var_0._id_02E6[1], level._id_3028._id_28BD["floor1"]._id_02E6[2] + var_3 ), 5 );
        var_3 = var_1._id_02E6[2] - level._id_3028._id_28BD["floor2"]._id_02E6[2];
        var_1 _meth_82AE( ( var_1._id_02E6[0], var_1._id_02E6[1], level._id_3028._id_28BD["floor1"]._id_02E6[2] + var_3 ), 5 );
        var_2 _meth_82AE( level._id_3028._id_28BD["floor1"]._id_02E6, 5 );
    }

    wait 5;
    var_2 _meth_809A( "elev_bell_ding" );
    level._id_3028._id_8D61["elevator"] = "closed";
}
