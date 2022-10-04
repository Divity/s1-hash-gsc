// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_3FB9()
{
    return 120;
}

_id_3FB6()
{
    return 380;
}

_id_3FB8()
{
    return 50;
}

_id_3FB5()
{
    return 110;
}

_id_3FBA()
{
    return 75;
}

_id_3FB7()
{
    return 125;
}

_id_0209()
{
    level._id_058F["exo_slam_kneeslide_fx"] = loadfx( "vfx/code/slam_jetpack_kneeslide" );
    level thread _id_64C5();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_5E62();
        var_0 thread _id_5E63();
    }
}

_id_5E62()
{
    self endon( "disconnect" );
    var_0 = 10;
    var_1 = 4;
    var_2 = ( 1, 0, 0 );
    var_3 = ( 0, 1, 0 );
    var_4 = ( 0, 0, 1 );
    var_5 = 16;

    for (;;)
    {
        self waittill( "ground_slam", var_6 );

        if ( isdefined( level.groundslam ) && self [[ level.groundslam ]]( var_6 ) )
            continue;

        var_7 = getdvarfloat( "ground_slam_min_height", _id_3FB9() );
        var_8 = getdvarfloat( "ground_slam_max_height", _id_3FB6() );
        var_9 = getdvarfloat( "ground_slam_min_damage", _id_3FB8() );
        var_10 = getdvarfloat( "ground_slam_max_damage", _id_3FB5() );
        var_11 = getdvarfloat( "ground_slam_min_radius", _id_3FBA() );
        var_12 = getdvarfloat( "ground_slam_max_radius", _id_3FB7() );

        if ( var_6 < var_7 )
            continue;

        var_13 = ( var_6 - var_7 ) / ( var_8 - var_7 );
        var_13 = clamp( var_13, 0.0, 1.0 );
        var_14 = ( var_12 - var_11 ) * var_13 + var_11;
        var_15 = var_14 + 60;
        var_16 = var_15 * var_15;
        self _meth_81D5( self._id_02E6, var_14, var_10, var_9, self, "MOD_TRIGGER_HURT", "boost_slam_mp" );

        if ( _id_A75A::_id_05CB( "specialty_exo_slamboots" ) )
        {
            playfxontag( level._id_058F["exo_slam_kneeslide_fx"], self, "j_knee_ri" );
            physicsexplosionsphere( self._id_02E6, var_14, 20, 1 );

            foreach ( var_18 in level._id_0328 )
            {
                if ( _id_A75A::_id_5186( var_18 ) && var_18 != self && ( !level._id_91E4 || var_18._id_04A8 != self._id_04A8 ) && !var_18 _id_A75A::_id_51E0() )
                {
                    if ( distancesquared( self._id_02E6, var_18._id_02E6 ) < var_16 )
                    {
                        var_18 _meth_8182( "concussion_grenade_mp", 1.5 );
                        _id_A7A0::_id_6FF3( "ch_perk_overcharge" );
                    }
                }
            }
        }
        else
            physicsexplosionsphere( self._id_02E6, var_14, 20, 0.9 );

        if ( getdvarint( "ground_slam_debug" ) )
        {
            thread _id_2DA1( self._id_02E6, var_14 + var_5, ( 0, 1, 0 ), 0, 16, var_0 );
            var_20 = 100;
            var_21 = ( var_20 - var_9 ) * var_14 / ( var_10 - var_9 );
            thread _id_2DA1( self._id_02E6, var_21 + var_5, ( 1, 0, 0 ), 0, 16, var_0 );

            foreach ( var_18 in level._id_0328 )
            {

            }
        }
    }
}

_id_2DA1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = var_5 / 0.05;

    for ( var_7 = 0; var_7 < var_6; var_7++ )
    {
        maps\mp\bots\_bots_util::_id_1600( var_0, var_1, var_2, var_3, var_4 );
        wait 0.05;
    }
}

_id_5E63()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "ground_slam_hit_player", var_0 );

        if ( isdefined( level.groundslamhitplayer ) && self [[ level.groundslamhitplayer ]]( var_0 ) )
            continue;

        var_0 _meth_8051( var_0._id_01E7, self._id_02E6, self, self, "MOD_CRUSH", "boost_slam_mp" );
    }
}

_id_34B7( var_0 )
{
    var_1 = int( var_0 * 1000 );
    self _meth_82FB( "ui_exo_cooldown_time", var_1 );
    wait(var_0);
    self _meth_82FB( "ui_exo_cooldown_time", 0 );
    self _meth_82F4( "exo_power_recharged" );
}
