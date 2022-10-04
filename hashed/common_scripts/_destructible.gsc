// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_293B = 50;
    level._id_293A = [];
    level._id_250B = 0;
    level._id_20C2 = gettime();

    if ( isdefined( level._id_00E4 ) && level._id_00E4 )
        level._id_293B = 25;

    if ( !isdefined( level._id_366F ) )
        level._id_366F = 0;

    if ( !isdefined( level._id_3AE2 ) )
        level._id_3AE2 = [];

    var_0 = 1;

    if ( var_0 )
        _id_3761();

    var_1 = getentarray( "delete_on_load", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 delete();

    _id_4CD4();
    _id_4CD5();
}

_id_2671()
{

}

_id_3761()
{
    if ( !isdefined( level._id_2910 ) )
        level._id_2910 = [];

    var_0 = [];

    foreach ( var_2 in level.struct )
    {
        if ( isdefined( var_2._id_039B ) && var_2._id_039B == "destructible_dot" )
            var_0[var_0.size] = var_2;
    }

    var_4 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_6 in var_4 )
        var_6 thread _id_80AC( var_0 );

    var_8 = getentarray( "destructible_toy", "targetname" );

    foreach ( var_10 in var_8 )
        var_10 thread _id_80AC( var_0 );

    _id_2671();
}

_id_80AC( var_0 )
{
    _id_80AB();
    _id_80AA( var_0 );
}

_id_80AA( var_0 )
{
    var_1 = self._id_2938;

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( level._id_0118[var_1]._id_290B ) )
            return;

        if ( isdefined( var_3._id_7A93 ) && issubstr( var_3._id_7A93, "destructible_type" ) && issubstr( var_3._id_7A93, self._id_0118 ) )
        {
            if ( distancesquared( self._id_02E6, var_3._id_02E6 ) < 1 )
            {
                var_4 = getentarray( var_3._id_04A5, "targetname" );
                level._id_0118[var_1]._id_290B = [];

                foreach ( var_6 in var_4 )
                {
                    var_7 = var_6._id_7A13;

                    if ( !isdefined( level._id_0118[var_1]._id_290B[var_7] ) )
                        level._id_0118[var_1]._id_290B[var_7] = [];

                    var_8 = level._id_0118[var_1]._id_290B[var_7].size;
                    level._id_0118[var_1]._id_290B[var_7][var_8]["classname"] = var_6._id_00AB;
                    level._id_0118[var_1]._id_290B[var_7][var_8]["origin"] = var_6._id_02E6;
                    var_9 = _id_A4F0::_id_928D( isdefined( var_6._id_03DB ), var_6._id_03DB, 0 );
                    level._id_0118[var_1]._id_290B[var_7][var_8]["spawnflags"] = var_9;

                    switch ( var_6._id_00AB )
                    {
                        case "trigger_radius":
                            level._id_0118[var_1]._id_290B[var_7][var_8]["radius"] = var_6._id_01E9;
                            level._id_0118[var_1]._id_290B[var_7][var_8]["height"] = var_6._id_01E9;
                            break;
                        default:
                    }

                    var_6 delete();
                }

                break;
            }
        }
    }
}

_id_2918( var_0 )
{
    if ( !isdefined( level._id_0118 ) )
        return -1;

    if ( level._id_0118.size == 0 )
        return -1;

    for ( var_1 = 0; var_1 < level._id_0118.size; var_1++ )
    {
        if ( var_0 == level._id_0118[var_1]._id_9C3A["type"] )
            return var_1;
    }

    return -1;
}

_id_28BB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = "test/concrete_cover_dest_test";

    if ( !isdefined( var_3 ) )
        var_3 = 150;

    _id_2905( var_0, "tag_origin", 1, undefined, 32, "no_melee" );

    if ( isdefined( var_4 ) )
        _id_2930( undefined, var_4, undefined, undefined, 32, "no_melee" );

    for ( var_6 = 0; var_6 < var_1; var_6++ )
    {
        var_7 = "fx_joint_" + var_6;
        _id_2923( var_7, undefined, var_3, undefined, undefined, "no_melee", 1 );
        _id_2911( var_7, var_2 );

        if ( isdefined( var_5 ) )
            _id_2929( var_5 );

        _id_2930( undefined );
    }
}

_id_2919( var_0 )
{
    var_1 = _id_2918( var_0 );

    if ( var_1 >= 0 )
        return var_1;

    if ( issubstr( var_0, "dest_cover" ) )
    {
        _id_28BB( self._id_0118, self._id_7994, self._id_798F, self._id_7990, self._id_7993, self._id_7991 );
        var_1 = _id_2918( var_0 );
        return var_1;
    }

    if ( !isdefined( level._id_2910[var_0] ) )
        return -1;

    [[ level._id_2910[var_0] ]]();
    var_1 = _id_2918( var_0 );
    return var_1;
}

_id_80AB()
{
    var_0 = undefined;
    self._id_5D3E = 0;
    _id_074B();
    self._id_2938 = _id_2919( self._id_0118 );

    if ( self._id_2938 < 0 )
        return;

    _id_6EB8();
    _id_0753();

    if ( isdefined( level._id_2934 ) && isdefined( level._id_2934[self._id_0118] ) )
        _id_A4F0::_id_3848( level._id_2934[self._id_0118] + "_loaded" );

    if ( isdefined( level._id_0118[self._id_2938]._id_0DF5 ) )
    {
        foreach ( var_3 in level._id_0118[self._id_2938]._id_0DF5 )
        {
            if ( isdefined( var_3._id_0429 ) )
                self _meth_801D( var_3._id_02A0, var_3._id_0429 );
            else
                self _meth_801D( var_3._id_02A0 );

            if ( self._id_5D3E )
            {
                if ( isdefined( var_3._id_0429 ) )
                {
                    self._id_5D3D _meth_801D( var_3._id_02A0, var_3._id_0429 );
                    continue;
                }

                self._id_5D3D _meth_801D( var_3._id_02A0 );
            }
        }
    }

    if ( isdefined( level._id_0118[self._id_2938]._id_66A4 ) )
    {
        self._id_2924 = [];

        for ( var_5 = 0; var_5 < level._id_0118[self._id_2938]._id_66A4.size; var_5++ )
        {
            self._id_2924[var_5] = spawnstruct();
            self._id_2924[var_5]._id_9C3A["currentState"] = 0;

            if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["health"] ) )
                self._id_2924[var_5]._id_9C3A["health"] = level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["health"];

            if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["random_dynamic_attachment_1"] ) )
            {
                var_6 = randomint( level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["random_dynamic_attachment_1"].size );
                var_7 = level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["random_dynamic_attachment_tag"][var_6];
                var_8 = level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["random_dynamic_attachment_1"][var_6];
                var_9 = level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["random_dynamic_attachment_2"][var_6];
                var_10 = level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["clipToRemove"][var_6];
                thread _id_2BCD( var_7, var_8, var_9, var_10 );
            }

            if ( var_5 == 0 )
                continue;

            var_11 = level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["modelName"];
            var_12 = level._id_0118[self._id_2938]._id_66A4[var_5][0]._id_9C3A["tagName"];

            for ( var_13 = 1; isdefined( level._id_0118[self._id_2938]._id_66A4[var_5][var_13] ); var_13++ )
            {
                var_14 = level._id_0118[self._id_2938]._id_66A4[var_5][var_13]._id_9C3A["tagName"];
                var_15 = level._id_0118[self._id_2938]._id_66A4[var_5][var_13]._id_9C3A["modelName"];

                if ( isdefined( var_14 ) && var_14 != var_12 )
                {
                    _id_4869( var_14 );

                    if ( self._id_5D3E )
                        self._id_5D3D _id_4869( var_14 );
                }
            }
        }
    }

    if ( isdefined( self._id_04A5 ) )
        thread _id_291A();

    if ( self._id_00AD != "script_vehicle" )
        self _meth_82C0( 1 );

    if ( _id_A4F0::_id_51AB() )
        thread _id_2150();

    thread _id_2931();

    if ( issubstr( self._id_0118, "dest_cover" ) )
        thread _id_2936();

    thread _id_2915();
}

_id_2905( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_0118 ) )
        level._id_0118 = [];

    var_6 = level._id_0118.size;
    level._id_0118[var_6] = spawnstruct();
    level._id_0118[var_6]._id_9C3A["type"] = var_0;
    level._id_0118[var_6]._id_66A4 = [];
    level._id_0118[var_6]._id_66A4[0][0] = spawnstruct();
    level._id_0118[var_6]._id_66A4[0][0]._id_9C3A["modelName"] = self._id_02A0;
    level._id_0118[var_6]._id_66A4[0][0]._id_9C3A["tagName"] = var_1;
    level._id_0118[var_6]._id_66A4[0][0]._id_9C3A["health"] = var_2;
    level._id_0118[var_6]._id_66A4[0][0]._id_9C3A["validAttackers"] = var_3;
    level._id_0118[var_6]._id_66A4[0][0]._id_9C3A["validDamageZone"] = var_4;
    level._id_0118[var_6]._id_66A4[0][0]._id_9C3A["validDamageCause"] = var_5;
    level._id_0118[var_6]._id_66A4[0][0]._id_9C3A["godModeAllowed"] = 1;
    level._id_0118[var_6]._id_66A4[0][0]._id_9C3A["rotateTo"] = self._id_0041;
    level._id_0118[var_6]._id_66A4[0][0]._id_9C3A["vehicle_exclude_anim"] = 0;
}

_id_2923( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = level._id_0118.size - 1;
    var_11 = level._id_0118[var_10]._id_66A4.size;
    var_12 = 0;
    _id_291D( var_11, var_12, var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, undefined, var_9 );
}

_id_2930( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = level._id_0118.size - 1;
    var_9 = level._id_0118[var_8]._id_66A4.size - 1;
    var_10 = level._id_0118[var_8]._id_66A4[var_9].size;

    if ( !isdefined( var_0 ) && var_9 == 0 )
        var_0 = level._id_0118[var_8]._id_66A4[var_9][0]._id_9C3A["tagName"];

    _id_291D( var_9, var_10, var_0, var_1, var_2, var_3, var_4, var_5, undefined, undefined, var_6, var_7 );
}

_id_2913( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    _id_2911( var_0, var_1, var_2, var_3, var_4, var_5, 1, var_6 );
}

_id_2911( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    if ( !isdefined( var_7 ) )
        var_7 = 0;

    var_8 = level._id_0118.size - 1;
    var_9 = level._id_0118[var_8]._id_66A4.size - 1;
    var_10 = level._id_0118[var_8]._id_66A4[var_9].size - 1;
    var_11 = 0;

    if ( isdefined( level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["fx_filename"] ) )
    {
        if ( isdefined( level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["fx_filename"][var_4] ) )
            var_11 = level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["fx_filename"][var_4].size;
    }

    if ( isdefined( var_3 ) )
        level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["fx_valid_damagetype"][var_4][var_11] = var_3;

    level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["fx_filename"][var_4][var_11] = var_1;
    level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["fx_tag"][var_4][var_11] = var_0;
    level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["fx_useTagAngles"][var_4][var_11] = var_2;
    level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["fx_cost"][var_4][var_11] = var_5;
    level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["spawn_immediate"][var_4][var_11] = var_6;
    level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["state_change_kill"][var_4][var_11] = var_7;
}

_id_2906( var_0 )
{
    var_1 = level._id_0118.size - 1;
    var_2 = level._id_0118[var_1]._id_66A4.size - 1;
    var_3 = level._id_0118[var_1]._id_66A4[var_2].size - 1;

    if ( !isdefined( level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["dot"] ) )
        level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["dot"] = [];

    var_4 = level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["dot"].size;
    var_5 = _id_23F6();
    var_5._id_04D8 = "predefined";
    var_5._id_0205 = var_0;
    level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["dot"][var_4] = var_5;
}

_id_2907( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_0118.size - 1;
    var_5 = level._id_0118[var_4]._id_66A4.size - 1;
    var_6 = level._id_0118[var_4]._id_66A4[var_5].size - 1;

    if ( !isdefined( level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["dot"] ) )
        level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["dot"] = [];

    var_7 = level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["dot"].size;
    var_8 = _id_23F7( ( 0, 0, 0 ), var_1, var_2, var_3 );
    var_8._id_0429 = var_0;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["dot"][var_7] = var_8;
}

_id_2927( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = level._id_0118.size - 1;
    var_9 = level._id_0118[var_8]._id_66A4.size - 1;
    var_10 = level._id_0118[var_8]._id_66A4[var_9].size - 1;
    var_11 = level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["dot"].size - 1;
    var_12 = level._id_0118[var_8]._id_66A4[var_9][var_10]._id_9C3A["dot"][var_11];
    var_12 _id_7F50( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
    _id_4DAF( var_6 );
}

_id_2928( var_0, var_1, var_2 )
{
    var_3 = level._id_0118.size - 1;
    var_4 = level._id_0118[var_3]._id_66A4.size - 1;
    var_5 = level._id_0118[var_3]._id_66A4[var_4].size - 1;
    var_6 = level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["dot"].size - 1;
    var_7 = level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["dot"][var_6];
    var_8 = var_7._id_933F.size;
    var_7._id_933F[var_8]._id_6493 = var_0;
    var_7._id_933F[var_8]._id_64A6 = var_1;
    var_7._id_933F[var_8]._id_6468 = var_2;
}

_id_2900( var_0, var_1 )
{
    var_2 = level._id_0118.size - 1;
    var_3 = level._id_0118[var_2]._id_66A4.size - 1;
    var_4 = level._id_0118[var_2]._id_66A4[var_3].size - 1;
    var_5 = level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["dot"].size - 1;
    var_6 = level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["dot"][var_5];
    var_6 _id_187B( var_0, var_1 );
}

_id_2901( var_0 )
{
    var_1 = level._id_0118.size - 1;
    var_2 = level._id_0118[var_1]._id_66A4.size - 1;
    var_3 = level._id_0118[var_1]._id_66A4[var_2].size - 1;
    var_4 = level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["dot"].size - 1;
    var_5 = level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["dot"][var_4];
    var_5 _id_187C( var_0 );
}

_id_28FF( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = level._id_0118.size - 1;
    var_7 = level._id_0118[var_6]._id_66A4.size - 1;
    var_8 = level._id_0118[var_6]._id_66A4[var_7].size - 1;
    var_9 = level._id_0118[var_6]._id_66A4[var_7][var_8]._id_9C3A["dot"].size - 1;
    var_10 = level._id_0118[var_6]._id_66A4[var_7][var_8]._id_9C3A["dot"][var_9];
    var_10 _id_187A( var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_2902( var_0 )
{
    var_1 = level._id_0118.size - 1;
    var_2 = level._id_0118[var_1]._id_66A4.size - 1;
    var_3 = level._id_0118[var_1]._id_66A4[var_2].size - 1;
    var_4 = level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["dot"].size - 1;
    var_5 = level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["dot"][var_4];
    var_5 _id_187D( var_0 );
}

_id_291F( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_4 = level._id_0118.size - 1;
    var_5 = level._id_0118[var_4]._id_66A4.size - 1;
    var_6 = level._id_0118[var_4]._id_66A4[var_5].size - 1;
    var_7 = 0;

    if ( isdefined( level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["loopfx_filename"] ) )
        var_7 = level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["loopfx_filename"].size;

    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["loopfx_filename"][var_7] = var_1;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["loopfx_tag"][var_7] = var_0;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["loopfx_rate"][var_7] = var_2;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["loopfx_cost"][var_7] = var_3;
}

_id_291C( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_0118.size - 1;
    var_5 = level._id_0118[var_4]._id_66A4.size - 1;
    var_6 = level._id_0118[var_4]._id_66A4[var_5].size - 1;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["healthdrain_amount"] = var_0;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["healthdrain_interval"] = var_1;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["badplace_radius"] = var_2;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["badplace_team"] = var_3;
}

_id_2929( var_0, var_1, var_2 )
{
    var_3 = level._id_0118.size - 1;
    var_4 = level._id_0118[var_3]._id_66A4.size - 1;
    var_5 = level._id_0118[var_3]._id_66A4[var_4].size - 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["sound"] ) )
    {
        level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["sound"] = [];
        level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["soundCause"] = [];
    }

    if ( !isdefined( level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["sound"][var_2] ) )
    {
        level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["sound"][var_2] = [];
        level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["soundCause"][var_2] = [];
    }

    var_6 = level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["sound"][var_2].size;
    level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["sound"][var_2][var_6] = var_0;
    level._id_0118[var_3]._id_66A4[var_4][var_5]._id_9C3A["soundCause"][var_2][var_6] = var_1;
}

_id_2920( var_0, var_1 )
{
    var_2 = level._id_0118.size - 1;
    var_3 = level._id_0118[var_2]._id_66A4.size - 1;
    var_4 = level._id_0118[var_2]._id_66A4[var_3].size - 1;

    if ( !isdefined( level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["loopsound"] ) )
    {
        level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["loopsound"] = [];
        level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["loopsoundCause"] = [];
    }

    var_5 = level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["loopsound"].size;
    level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["loopsound"][var_5] = var_0;
    level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["loopsoundCause"][var_5] = var_1;
}

_id_28F9( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_9 = [];
    var_9["anim"] = var_0;
    var_9["animTree"] = var_1;
    var_9["animType"] = var_2;
    var_9["vehicle_exclude_anim"] = var_3;
    var_9["groupNum"] = var_4;
    var_9["mpAnim"] = var_5;
    var_9["maxStartDelay"] = var_6;
    var_9["animRateMin"] = var_7;
    var_9["animRateMax"] = var_8;
    _id_0734( "animation", var_9 );
}

_id_292E( var_0 )
{
    var_1 = [];
    var_1["spotlight_tag"] = var_0;
    var_1["spotlight_fx"] = "spotlight_fx";
    var_1["spotlight_brightness"] = 0.85;
    var_1["randomly_flip"] = 1;
    _id_076E( var_1 );
}

_id_076D( var_0, var_1 )
{
    var_2 = [];
    var_2[var_0] = var_1;
    _id_076E( var_2 );
}

_id_076E( var_0 )
{
    var_1 = level._id_0118.size - 1;
    var_2 = level._id_0118[var_1]._id_66A4.size - 1;
    var_3 = level._id_0118[var_1]._id_66A4[var_2].size - 1;

    foreach ( var_6, var_5 in var_0 )
        level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A[var_6] = var_5;
}

_id_0734( var_0, var_1 )
{
    var_2 = level._id_0118.size - 1;
    var_3 = level._id_0118[var_2]._id_66A4.size - 1;
    var_4 = level._id_0118[var_2]._id_66A4[var_3].size - 1;
    var_5 = level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A;

    if ( !isdefined( var_5[var_0] ) )
        var_5[var_0] = [];

    var_5[var_0][var_5[var_0].size] = var_1;
    level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A = var_5;
}

_id_2903()
{
    var_0 = level._id_0118.size - 1;
    var_1 = level._id_0118[var_0]._id_66A4.size - 1;
    var_2 = level._id_0118[var_0]._id_66A4[var_1].size - 1;
    level._id_0118[var_0]._id_66A4[var_1][var_2]._id_9C3A["triggerCarAlarm"] = 1;
}

_id_291E( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 256;

    var_1 = level._id_0118.size - 1;
    var_2 = level._id_0118[var_1]._id_66A4.size - 1;
    var_3 = level._id_0118[var_1]._id_66A4[var_2].size - 1;
    level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["break_nearby_lights"] = var_0;
}

_id_7110( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "";

    var_4 = level._id_0118.size - 1;
    var_5 = level._id_0118[var_4]._id_66A4.size - 1;
    var_6 = 0;

    if ( !isdefined( level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["random_dynamic_attachment_1"] ) )
    {
        level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["random_dynamic_attachment_1"] = [];
        level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["random_dynamic_attachment_2"] = [];
        level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["random_dynamic_attachment_tag"] = [];
    }

    var_7 = level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["random_dynamic_attachment_1"].size;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["random_dynamic_attachment_1"][var_7] = var_1;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["random_dynamic_attachment_2"][var_7] = var_2;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["random_dynamic_attachment_tag"][var_7] = var_0;
    level._id_0118[var_4]._id_66A4[var_5][var_6]._id_9C3A["clipToRemove"][var_7] = var_3;
}

_id_2925( var_0, var_1 )
{
    var_2 = level._id_0118.size - 1;
    var_3 = level._id_0118[var_2]._id_66A4.size - 1;
    var_4 = level._id_0118[var_2]._id_66A4[var_3].size - 1;

    if ( !isdefined( level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["physics"] ) )
    {
        level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["physics"] = [];
        level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["physics_tagName"] = [];
        level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["physics_velocity"] = [];
    }

    var_5 = level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["physics"].size;
    level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["physics"][var_5] = 1;
    level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["physics_tagName"][var_5] = var_0;
    level._id_0118[var_2]._id_66A4[var_3][var_4]._id_9C3A["physics_velocity"][var_5] = var_1;
}

_id_292C( var_0 )
{
    var_1 = level._id_0118.size - 1;
    var_2 = level._id_0118[var_1]._id_66A4.size - 1;
    var_3 = level._id_0118[var_1]._id_66A4[var_2].size - 1;
    level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["splash_damage_scaler"] = var_0;
}

_id_290C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    var_14 = level._id_0118.size - 1;
    var_15 = level._id_0118[var_14]._id_66A4.size - 1;
    var_16 = level._id_0118[var_14]._id_66A4[var_15].size - 1;

    if ( _id_A4F0::_id_51AB() )
        level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["explode_range"] = var_2;
    else
        level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["explode_range"] = var_3;

    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["explode"] = 1;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["explode_force_min"] = var_0;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["explode_force_max"] = var_1;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["explode_mindamage"] = var_4;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["explode_maxdamage"] = var_5;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["continueDamage"] = var_6;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["originOffset"] = var_7;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["earthQuakeScale"] = var_8;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["earthQuakeRadius"] = var_9;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["originOffset3d"] = var_10;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["delaytime"] = var_11;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["explode_angularImpulse_min"] = var_12;
    level._id_0118[var_14]._id_66A4[var_15][var_16]._id_9C3A["explode_angularImpulse_max"] = var_13;
}

_id_290F( var_0 )
{
    var_1 = level._id_0118.size - 1;
    var_2 = level._id_0118[var_1]._id_66A4.size - 1;
    var_3 = level._id_0118[var_1]._id_66A4[var_2].size - 1;
    level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["function"] = var_0;
}

_id_2922( var_0 )
{
    var_1 = level._id_0118.size - 1;
    var_2 = level._id_0118[var_1]._id_66A4.size - 1;
    var_3 = level._id_0118[var_1]._id_66A4[var_2].size - 1;
    level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["functionNotify"] = var_0;
}

_id_2908( var_0 )
{
    var_1 = level._id_0118.size - 1;
    var_2 = level._id_0118[var_1]._id_66A4.size - 1;
    var_3 = level._id_0118[var_1]._id_66A4[var_2].size - 1;
    level._id_0118[var_1]._id_66A4[var_2][var_3]._id_9C3A["damage_threshold"] = var_0;
}

_id_28FC( var_0, var_1 )
{
    var_1 = tolower( var_1 );
    var_2 = level._id_0118.size - 1;

    if ( !isdefined( level._id_0118[var_2]._id_0DF5 ) )
        level._id_0118[var_2]._id_0DF5 = [];

    var_3 = spawnstruct();
    var_3._id_02A0 = var_1;
    var_3._id_0429 = var_0;
    level._id_0118[var_2]._id_0DF5[level._id_0118[var_2]._id_0DF5.size] = var_3;
}

_id_291D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    if ( isdefined( var_3 ) )
        var_3 = tolower( var_3 );

    var_13 = level._id_0118.size - 1;
    level._id_0118[var_13]._id_66A4[var_0][var_1] = spawnstruct();
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["modelName"] = var_3;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["tagName"] = var_2;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["health"] = var_4;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["validAttackers"] = var_5;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["validDamageZone"] = var_6;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["validDamageCause"] = var_7;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["alsoDamageParent"] = var_8;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["physicsOnExplosion"] = var_9;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["grenadeImpactDeath"] = var_10;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["godModeAllowed"] = 0;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["splashRotation"] = var_11;
    level._id_0118[var_13]._id_66A4[var_0][var_1]._id_9C3A["receiveDamageFromParent"] = var_12;
}

_id_6EB8()
{
    if ( !isdefined( level._id_0118[self._id_2938]._id_66A4 ) )
        return;

    if ( isdefined( level._id_0118[self._id_2938]._id_0DF5 ) )
    {
        foreach ( var_1 in level._id_0118[self._id_2938]._id_0DF5 )
            precachemodel( var_1._id_02A0 );
    }

    for ( var_3 = 0; var_3 < level._id_0118[self._id_2938]._id_66A4.size; var_3++ )
    {
        for ( var_4 = 0; var_4 < level._id_0118[self._id_2938]._id_66A4[var_3].size; var_4++ )
        {
            if ( level._id_0118[self._id_2938]._id_66A4[var_3].size <= var_4 )
                continue;

            if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_3][var_4]._id_9C3A["modelName"] ) )
                precachemodel( level._id_0118[self._id_2938]._id_66A4[var_3][var_4]._id_9C3A["modelName"] );

            if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_3][var_4]._id_9C3A["animation"] ) )
            {
                var_5 = level._id_0118[self._id_2938]._id_66A4[var_3][var_4]._id_9C3A["animation"];

                foreach ( var_7 in var_5 )
                {
                    if ( isdefined( var_7["mpAnim"] ) )
                        _id_A4F0::_id_6166( "precacheMpAnim", var_7["mpAnim"] );
                }
            }

            if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_3][var_4]._id_9C3A["random_dynamic_attachment_1"] ) )
            {
                foreach ( var_10 in level._id_0118[self._id_2938]._id_66A4[var_3][var_4]._id_9C3A["random_dynamic_attachment_1"] )
                {
                    if ( isdefined( var_10 ) && var_10 != "" )
                    {
                        precachemodel( var_10 );
                        precachemodel( var_10 + "_destroy" );
                    }
                }

                foreach ( var_10 in level._id_0118[self._id_2938]._id_66A4[var_3][var_4]._id_9C3A["random_dynamic_attachment_2"] )
                {
                    if ( isdefined( var_10 ) && var_10 != "" )
                    {
                        precachemodel( var_10 );
                        precachemodel( var_10 + "_destroy" );
                    }
                }
            }
        }
    }
}

_id_0753()
{
    if ( !isdefined( level._id_0118[self._id_2938]._id_66A4 ) )
        return;

    for ( var_0 = 0; var_0 < level._id_0118[self._id_2938]._id_66A4.size; var_0++ )
    {
        for ( var_1 = 0; var_1 < level._id_0118[self._id_2938]._id_66A4[var_0].size; var_1++ )
        {
            if ( level._id_0118[self._id_2938]._id_66A4[var_0].size <= var_1 )
                continue;

            var_2 = level._id_0118[self._id_2938]._id_66A4[var_0][var_1];

            if ( isdefined( var_2._id_9C3A["fx_filename"] ) )
            {
                for ( var_3 = 0; var_3 < var_2._id_9C3A["fx_filename"].size; var_3++ )
                {
                    var_4 = var_2._id_9C3A["fx_filename"][var_3];
                    var_5 = var_2._id_9C3A["fx_tag"][var_3];

                    if ( isdefined( var_4 ) )
                    {
                        if ( isdefined( var_2._id_9C3A["fx"] ) && isdefined( var_2._id_9C3A["fx"][var_3] ) && var_2._id_9C3A["fx"][var_3].size == var_4.size )
                            continue;

                        for ( var_6 = 0; var_6 < var_4.size; var_6++ )
                        {
                            var_7 = var_4[var_6];
                            var_8 = var_5[var_6];
                            level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["fx"][var_3][var_6] = loadfx( var_7, var_8 );
                        }
                    }
                }
            }

            var_9 = level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["loopfx_filename"];
            var_10 = level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["loopfx_tag"];

            if ( isdefined( var_9 ) )
            {
                if ( isdefined( var_2._id_9C3A["loopfx"] ) && var_2._id_9C3A["loopfx"].size == var_9.size )
                    continue;

                for ( var_6 = 0; var_6 < var_9.size; var_6++ )
                {
                    var_11 = var_9[var_6];
                    var_12 = var_10[var_6];
                    level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["loopfx"][var_6] = loadfx( var_11, var_12 );
                }
            }
        }
    }
}

_id_1AC4( var_0 )
{
    foreach ( var_2 in self._id_2939 )
    {
        if ( var_2 == var_0 )
            return 1;
    }

    return 0;
}

_id_2931()
{
    var_0 = 0;
    var_1 = self._id_02A0;
    var_2 = undefined;
    var_3 = self._id_02E6;
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = self._id_02A0;
    _id_2935( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
    self endon( "stop_taking_damage" );

    for (;;)
    {
        var_0 = undefined;
        var_5 = undefined;
        var_4 = undefined;
        var_3 = undefined;
        var_8 = undefined;
        var_1 = undefined;
        var_2 = undefined;
        var_9 = undefined;
        var_10 = undefined;
        self waittill( "damage", var_0, var_5, var_4, var_3, var_8, var_1, var_2, var_9, var_10 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( isdefined( var_5 ) && isdefined( var_5._id_04D8 ) && var_5._id_04D8 == "soft_landing" && !var_5 _id_1AC4( self ) )
            continue;

        if ( _id_A4F0::_id_51AB() )
            var_0 *= 0.5;
        else
            var_0 *= 1.0;

        if ( var_0 <= 0 )
            continue;

        if ( _id_A4F0::_id_51AB() )
        {
            if ( isdefined( var_5 ) && isplayer( var_5 ) )
                self._id_25A8 = var_5;
        }
        else if ( isdefined( var_5 ) && isplayer( var_5 ) )
            self._id_25A8 = var_5;
        else if ( isdefined( var_5 ) && isdefined( var_5._id_4470 ) && isplayer( var_5._id_4470 ) )
            self._id_25A8 = var_5._id_4470;

        var_8 = _id_3F4A( var_8 );

        if ( _id_507B( var_5, var_8 ) )
        {
            if ( _id_A4F0::_id_51AB() )
                var_0 *= 8.0;
            else
                var_0 *= 4.0;
        }

        if ( !isdefined( var_1 ) || var_1 == "" )
            var_1 = self._id_02A0;

        if ( isdefined( var_2 ) && var_2 == "" )
        {
            if ( isdefined( var_9 ) && var_9 != "" && var_9 != "tag_body" && var_9 != "body_animate_jnt" )
                var_2 = var_9;
            else
                var_2 = undefined;

            var_11 = level._id_0118[self._id_2938]._id_66A4[0][0]._id_9C3A["tagName"];

            if ( isdefined( var_11 ) && isdefined( var_9 ) && var_11 == var_9 )
                var_2 = undefined;
        }

        if ( var_8 == "splash" || var_8 == "energy" )
        {
            if ( isdefined( level._id_0118[self._id_2938]._id_66A4[0][0]._id_9C3A["splash_damage_scaler"] ) )
                var_0 *= level._id_0118[self._id_2938]._id_66A4[0][0]._id_9C3A["splash_damage_scaler"];
            else if ( _id_A4F0::_id_51AB() )
                var_0 *= 9.0;
            else
                var_0 *= 13.0;

            if ( var_7 == self._id_02A0 && isdefined( self._id_7993 ) )
                self _meth_80B1( self._id_7993 );

            _id_292B( int( var_0 ), var_3, var_4, var_5, var_8 );
            continue;
        }

        thread _id_2935( int( var_0 ), var_1, var_2, var_3, var_4, var_5, var_8 );
    }
}

_id_507B( var_0, var_1 )
{
    if ( var_1 != "bullet" )
        return 0;

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = undefined;

    if ( isplayer( var_0 ) )
        var_2 = var_0 _meth_8311();
    else if ( isdefined( level._id_309C ) && level._id_309C )
    {
        if ( isdefined( var_0._id_0512 ) )
            var_2 = var_0._id_0512;
    }

    if ( !isdefined( var_2 ) )
        return 0;

    var_3 = weaponclass( var_2 );

    if ( isdefined( var_3 ) && var_3 == "spread" )
        return 1;

    return 0;
}

_id_4079( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_9C3A = [];
    var_3 = -1;
    var_4 = -1;

    if ( tolower( var_0 ) == tolower( self._id_02A0 ) && !isdefined( var_1 ) )
    {
        var_0 = self._id_02A0;
        var_1 = undefined;
        var_3 = 0;
        var_4 = 0;
    }

    for ( var_5 = 0; var_5 < level._id_0118[self._id_2938]._id_66A4.size; var_5++ )
    {
        var_4 = self._id_2924[var_5]._id_9C3A["currentState"];

        if ( level._id_0118[self._id_2938]._id_66A4[var_5].size <= var_4 )
            continue;

        if ( !isdefined( var_1 ) )
            continue;

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_5][var_4]._id_9C3A["tagName"] ) )
        {
            var_6 = level._id_0118[self._id_2938]._id_66A4[var_5][var_4]._id_9C3A["tagName"];

            if ( tolower( var_6 ) == tolower( var_1 ) )
            {
                var_3 = var_5;
                break;
            }
        }
    }

    var_2._id_9C3A["stateIndex"] = var_4;
    var_2._id_9C3A["partIndex"] = var_3;
    return var_2;
}

_id_2935( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( self._id_2924 ) )
        return;

    if ( self._id_2924.size == 0 )
        return;

    if ( level._id_366F )
        self endon( "destroyed" );

    var_8 = _id_4079( var_1, var_2 );
    var_9 = var_8._id_9C3A["stateIndex"];
    var_10 = var_8._id_9C3A["partIndex"];

    if ( var_10 < 0 )
        return;

    var_11 = var_9;
    var_12 = 0;
    var_13 = 0;

    for (;;)
    {
        var_9 = self._id_2924[var_10]._id_9C3A["currentState"];

        if ( !isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_9] ) )
            break;

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][0]._id_9C3A["alsoDamageParent"] ) )
        {
            if ( _id_3F4A( var_6 ) != "splash" )
            {
                var_14 = level._id_0118[self._id_2938]._id_66A4[var_10][0]._id_9C3A["alsoDamageParent"];
                var_15 = int( var_0 * var_14 );
                thread _id_6226( var_15, var_5, var_4, var_3, var_6, "", "" );
            }
        }

        if ( var_10 == 0 && _id_3F4A( var_6 ) != "splash" )
        {
            for ( var_16 = 0; var_16 < level._id_0118[self._id_2938]._id_66A4.size; var_16++ )
            {
                var_17 = level._id_0118[self._id_2938]._id_66A4[var_16];

                if ( !isdefined( var_17[0]._id_9C3A["receiveDamageFromParent"] ) )
                    continue;

                var_18 = 0;

                if ( isdefined( self._id_2924[var_16]._id_9C3A["currentState"] ) )
                    var_18 = self._id_2924[var_16]._id_9C3A["currentState"];

                if ( !isdefined( var_17[var_18] ) )
                    continue;

                if ( !isdefined( var_17[var_18]._id_9C3A["tagName"] ) )
                    continue;

                var_19 = var_17[var_18]._id_9C3A["tagName"];
                var_14 = var_17[0]._id_9C3A["receiveDamageFromParent"];
                var_20 = int( var_0 * var_14 );
                thread _id_6226( var_20, var_5, var_4, var_3, var_6, "", var_19 );
            }
        }

        if ( !isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_9]._id_9C3A["health"] ) )
            break;

        if ( !isdefined( self._id_2924[var_10]._id_9C3A["health"] ) )
            break;

        if ( var_12 )
            self._id_2924[var_10]._id_9C3A["health"] = level._id_0118[self._id_2938]._id_66A4[var_10][var_9]._id_9C3A["health"];

        var_12 = 0;

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_9]._id_9C3A["grenadeImpactDeath"] ) && var_6 == "impact" )
            var_0 = 100000000;

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_9]._id_9C3A["damage_threshold"] ) && level._id_0118[self._id_2938]._id_66A4[var_10][var_9]._id_9C3A["damage_threshold"] > var_0 )
            var_0 = 0;

        var_21 = self._id_2924[var_10]._id_9C3A["health"];
        var_22 = _id_50BE( var_10, var_9, var_5 );

        if ( var_22 )
        {
            var_23 = _id_51E6( var_10, var_9, var_6 );

            if ( var_23 )
            {
                if ( isdefined( var_5 ) )
                {
                    if ( isplayer( var_5 ) )
                        self._id_6ABF += var_0;
                    else if ( var_5 != self )
                        self._id_614C += var_0;
                }

                if ( isdefined( var_6 ) )
                {
                    if ( var_6 == "melee" || var_6 == "impact" )
                        var_0 = 100000;
                }

                self._id_2924[var_10]._id_9C3A["health"] -= var_0;
            }
        }

        if ( self._id_2924[var_10]._id_9C3A["health"] > 0 )
            return;

        if ( isdefined( var_7 ) )
        {
            var_7._id_9C3A["fxcost"] = _id_3E15( var_10, self._id_2924[var_10]._id_9C3A["currentState"] );
            _id_0754( self, var_7, var_0 );

            if ( !isdefined( self._id_A03A ) )
                self._id_A03A = 1;
            else
                self._id_A03A++;

            self waittill( "queue_processed", var_24 );
            self._id_A03A--;

            if ( self._id_A03A == 0 )
                self._id_A03A = undefined;

            if ( !var_24 )
            {
                self._id_2924[var_10]._id_9C3A["health"] = var_21;
                return;
            }
        }

        var_0 = int( abs( self._id_2924[var_10]._id_9C3A["health"] ) );

        if ( var_0 < 0 )
            return;

        self._id_2924[var_10]._id_9C3A["currentState"]++;
        var_9 = self._id_2924[var_10]._id_9C3A["currentState"];
        var_25 = var_9 - 1;
        var_26 = undefined;

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25] ) )
            var_26 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A;

        var_27 = undefined;

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_9] ) )
            var_27 = level._id_0118[self._id_2938]._id_66A4[var_10][var_9]._id_9C3A;

        if ( !isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25] ) )
            return;

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["explode"] ) )
            self._id_353B = 1;

        if ( isdefined( self._id_5889 ) && isdefined( self._id_5889[_id_A4F0::_id_93EB( var_10 )] ) )
        {
            for ( var_16 = 0; var_16 < self._id_5889[_id_A4F0::_id_93EB( var_10 )].size; var_16++ )
            {
                self notify( self._id_5889[_id_A4F0::_id_93EB( var_10 )][var_16] );

                if ( _id_A4F0::_id_51AB() && self._id_5D3E )
                    self._id_5D3D notify( self._id_5889[_id_A4F0::_id_93EB( var_10 )][var_16] );
            }

            self._id_5889[_id_A4F0::_id_93EB( var_10 )] = undefined;
        }

        if ( isdefined( var_26["break_nearby_lights"] ) )
            _id_2917( var_26["break_nearby_lights"] );

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_9] ) )
        {
            if ( var_10 == 0 )
            {
                var_28 = var_27["modelName"];

                if ( isdefined( var_28 ) && var_28 != self._id_02A0 )
                {
                    self _meth_80B1( var_28 );

                    if ( _id_A4F0::_id_51AB() && self._id_5D3E )
                        self._id_5D3D _meth_80B1( var_28 );

                    _id_292D( var_27 );
                }
            }
            else
            {
                _id_4869( var_2 );

                if ( _id_A4F0::_id_51AB() && self._id_5D3E )
                    self._id_5D3D _id_4869( var_2 );

                var_2 = var_27["tagName"];

                if ( isdefined( var_2 ) )
                {
                    _id_84F8( var_2 );

                    if ( _id_A4F0::_id_51AB() && self._id_5D3E )
                        self._id_5D3D _id_84F8( var_2 );
                }
            }
        }

        var_29 = _id_3D49();

        if ( isdefined( self._id_353B ) )
            _id_1E99( var_29 );

        var_30 = _id_28FA( var_26, var_29, var_6, var_10 );
        var_30 = _id_2916( var_26, var_29, var_6, var_10, var_30 );
        self notify( "FX_State_Change_Kill" + var_10 );
        var_30 = _id_292A( var_26, var_29, var_6, var_30 );

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["loopfx"] ) )
        {
            var_31 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["loopfx_filename"].size;

            if ( var_31 > 0 )
                self notify( "FX_State_Change" + var_10 );

            for ( var_32 = 0; var_32 < var_31; var_32++ )
            {
                var_33 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["loopfx"][var_32];
                var_34 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["loopfx_tag"][var_32];
                var_35 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["loopfx_rate"][var_32];
                thread _id_587A( var_33, var_34, var_35, var_10 );
            }
        }

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["loopsound"] ) )
        {
            for ( var_16 = 0; var_16 < level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["loopsound"].size; var_16++ )
            {
                var_36 = _id_51F3( "loopsoundCause", var_26, var_16, var_6 );

                if ( var_36 )
                {
                    var_37 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["loopsound"][var_16];
                    var_38 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["tagName"];
                    thread _id_6971( var_37, var_38 );

                    if ( !isdefined( self._id_5889 ) )
                        self._id_5889 = [];

                    if ( !isdefined( self._id_5889[_id_A4F0::_id_93EB( var_10 )] ) )
                        self._id_5889[_id_A4F0::_id_93EB( var_10 )] = [];

                    var_39 = self._id_5889[_id_A4F0::_id_93EB( var_10 )].size;
                    self._id_5889[_id_A4F0::_id_93EB( var_10 )][var_39] = "stop sound" + var_37;
                }
            }
        }

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["triggerCarAlarm"] ) )
            thread _id_2BB6();

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["break_nearby_lights"] ) )
            thread _id_17D6();

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["healthdrain_amount"] ) )
        {
            self notify( "Health_Drain_State_Change" + var_10 );
            var_40 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["healthdrain_amount"];
            var_41 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["healthdrain_interval"];
            var_42 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["modelName"];
            var_43 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["tagName"];
            var_44 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["badplace_radius"];
            var_45 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["badplace_team"];

            if ( var_40 > 0 )
                thread _id_477E( var_40, var_41, var_10, var_42, var_43, var_44, var_45 );
        }

        var_46 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["dot"];

        if ( isdefined( var_46 ) )
        {
            foreach ( var_48 in var_46 )
            {
                var_49 = var_48._id_0205;

                if ( var_48._id_04D8 == "predefined" && isdefined( var_49 ) )
                {
                    var_50 = [];

                    foreach ( var_52 in level._id_0118[self._id_2938]._id_290B[var_49] )
                    {
                        var_53 = var_52["classname"];
                        var_54 = undefined;

                        switch ( var_53 )
                        {
                            case "trigger_radius":
                                var_55 = var_52["origin"];
                                var_56 = var_52["spawnflags"];
                                var_57 = var_52["radius"];
                                var_58 = var_52["height"];
                                var_54 = _id_23F7( self._id_02E6 + var_55, var_56, var_57, var_58 );
                                var_54._id_933F = var_48._id_933F;
                                var_50[var_50.size] = var_54;
                                continue;
                            default:
                        }
                    }

                    level thread _id_8D04( var_50 );
                    continue;
                }

                if ( isdefined( var_48 ) )
                {
                    if ( isdefined( var_48._id_0429 ) )
                        var_48 _id_7F51( self _meth_8180( var_48._id_0429 ) );

                    level thread _id_8D04( [ var_48 ] );
                }
            }

            var_46 = undefined;
        }

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["explode"] ) )
        {
            var_13 = 1;
            var_61 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["explode_force_min"];
            var_62 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["explode_force_max"];
            var_63 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["explode_angularImpulse_min"];
            var_64 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["explode_angularImpulse_max"];
            var_65 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["explode_range"];
            var_66 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["explode_mindamage"];
            var_67 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["explode_maxdamage"];
            var_68 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["continueDamage"];
            var_69 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["originOffset"];
            var_70 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["earthQuakeScale"];
            var_71 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["earthQuakeRadius"];
            var_72 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["originOffset3d"];
            var_73 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["delaytime"];

            if ( isdefined( var_5 ) && var_5 != self )
            {
                self._id_0055 = var_5;

                if ( self._id_00AD == "script_vehicle" )
                    self._id_258B = var_6;
            }

            thread _id_0165( var_10, var_61, var_62, var_65, var_66, var_67, var_68, var_69, var_70, var_71, var_5, var_72, var_73, var_63, var_64 );
        }

        var_74 = undefined;

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["physics"] ) )
        {
            for ( var_16 = 0; var_16 < level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["physics"].size; var_16++ )
            {
                var_74 = undefined;
                var_75 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["physics_tagName"][var_16];
                var_76 = level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["physics_velocity"][var_16];
                var_77 = undefined;

                if ( isdefined( var_76 ) )
                {
                    var_78 = undefined;

                    if ( isdefined( var_75 ) )
                        var_78 = self _meth_8181( var_75 );
                    else if ( isdefined( var_2 ) )
                        var_78 = self _meth_8181( var_2 );

                    var_74 = undefined;

                    if ( isdefined( var_75 ) )
                        var_74 = self _meth_8180( var_75 );
                    else if ( isdefined( var_2 ) )
                        var_74 = self _meth_8180( var_2 );

                    var_79 = var_76[0] - 5 + randomfloat( 10 );
                    var_80 = var_76[1] - 5 + randomfloat( 10 );
                    var_81 = var_76[2] - 5 + randomfloat( 10 );
                    var_82 = anglestoforward( var_78 ) * var_79 * randomfloatrange( 80, 110 );
                    var_83 = anglestoright( var_78 ) * var_80 * randomfloatrange( 80, 110 );
                    var_84 = anglestoup( var_78 ) * var_81 * randomfloatrange( 80, 110 );
                    var_77 = var_82 + var_83 + var_84;
                }
                else
                {
                    var_77 = var_3;
                    var_85 = ( 0, 0, 0 );

                    if ( isdefined( var_5 ) )
                    {
                        var_85 = var_5._id_02E6;
                        var_77 = vectornormalize( var_3 - var_85 );
                        var_77 *= 200;
                    }
                }

                if ( isdefined( var_75 ) )
                {
                    var_86 = undefined;

                    for ( var_87 = 0; var_87 < level._id_0118[self._id_2938]._id_66A4.size; var_87++ )
                    {
                        if ( !isdefined( level._id_0118[self._id_2938]._id_66A4[var_87][0]._id_9C3A["tagName"] ) )
                            continue;

                        if ( level._id_0118[self._id_2938]._id_66A4[var_87][0]._id_9C3A["tagName"] != var_75 )
                            continue;

                        var_86 = var_87;
                        break;
                    }

                    if ( isdefined( var_74 ) )
                        thread _id_67FA( var_86, 0, var_74, var_77 );
                    else
                        thread _id_67FA( var_86, 0, var_3, var_77 );

                    continue;
                }

                if ( isdefined( var_74 ) )
                    thread _id_67FA( var_10, var_25, var_74, var_77 );
                else
                    thread _id_67FA( var_10, var_25, var_3, var_77 );

                return;
            }
        }

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A ) && isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["functionNotify"] ) )
            self notify( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["functionNotify"] );

        if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["function"] ) )
            self thread [[ level._id_0118[self._id_2938]._id_66A4[var_10][var_25]._id_9C3A["function"] ]]();

        var_12 = 1;
    }
}

_id_292D( var_0 )
{
    var_1 = var_0["splashRotation"];
    var_2 = var_0["rotateTo"];

    if ( !isdefined( var_2 ) )
        return;

    if ( !isdefined( var_1 ) )
        return;

    if ( !var_1 )
        return;

    self._id_0041 = ( self._id_0041[0], var_2[1], self._id_0041[2] );
}

_id_2587( var_0 )
{
    var_1 = strtok( var_0, " " );
    var_2 = strtok( "splash melee bullet splash impact unknown", " " );
    var_3 = "";

    foreach ( var_6, var_5 in var_1 )
        var_2 = _id_A4F0::_id_0CF6( var_2, var_5 );

    foreach ( var_8 in var_2 )
        var_3 += ( var_8 + " " );

    return var_3;
}

_id_292B( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_0 <= 0 )
        return;

    if ( isdefined( self._id_3525 ) )
        return;

    if ( !isdefined( level._id_0118[self._id_2938]._id_66A4 ) )
        return;

    var_5 = _id_3EE8( var_2 );

    if ( var_5.size <= 0 )
        return;

    var_5 = _id_7F4C( var_5, var_1 );
    var_6 = _id_4011( var_5 );

    foreach ( var_8 in var_5 )
    {
        var_9 = var_8._id_9C3A["distance"] * 1.4;
        var_10 = var_0 - ( var_9 - var_6 );

        if ( var_10 <= 0 )
            continue;

        if ( isdefined( self._id_3525 ) )
            continue;

        thread _id_2935( var_10, var_8._id_9C3A["modelName"], var_8._id_9C3A["tagName"], var_1, var_2, var_3, var_4, var_8 );
    }
}

_id_3EE8( var_0 )
{
    var_1 = [];

    if ( !isdefined( level._id_0118[self._id_2938]._id_66A4 ) )
        return var_1;

    for ( var_2 = 0; var_2 < level._id_0118[self._id_2938]._id_66A4.size; var_2++ )
    {
        var_3 = var_2;
        var_4 = self._id_2924[var_3]._id_9C3A["currentState"];

        for ( var_5 = 0; var_5 < level._id_0118[self._id_2938]._id_66A4[var_3].size; var_5++ )
        {
            var_6 = level._id_0118[self._id_2938]._id_66A4[var_3][var_5]._id_9C3A["splashRotation"];

            if ( isdefined( var_6 ) && var_6 )
            {
                var_7 = vectortoangles( var_0 );
                var_8 = var_7[1] - 90;
                level._id_0118[self._id_2938]._id_66A4[var_3][var_5]._id_9C3A["rotateTo"] = ( 0, var_8, 0 );
            }
        }

        if ( !isdefined( level._id_0118[self._id_2938]._id_66A4[var_3][var_4] ) )
            continue;

        var_9 = level._id_0118[self._id_2938]._id_66A4[var_3][var_4]._id_9C3A["tagName"];

        if ( !isdefined( var_9 ) )
            var_9 = "";

        if ( var_9 == "" )
            continue;

        var_10 = level._id_0118[self._id_2938]._id_66A4[var_3][var_4]._id_9C3A["modelName"];

        if ( !isdefined( var_10 ) )
            var_10 = "";

        var_11 = var_1.size;
        var_1[var_11] = spawnstruct();
        var_1[var_11]._id_9C3A["modelName"] = var_10;
        var_1[var_11]._id_9C3A["tagName"] = var_9;
    }

    return var_1;
}

_id_7F4C( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = distance( var_1, self _meth_8180( var_0[var_2]._id_9C3A["tagName"] ) );
        var_0[var_2]._id_9C3A["distance"] = var_3;
    }

    return var_0;
}

_id_4011( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        var_4 = var_3._id_9C3A["distance"];

        if ( !isdefined( var_1 ) )
            var_1 = var_4;

        if ( var_4 < var_1 )
            var_1 = var_4;
    }

    return var_1;
}

_id_51F3( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
        var_5 = var_1[var_0][var_4][var_2];
    else
        var_5 = var_1[var_0][var_2];

    if ( !isdefined( var_5 ) )
        return 1;

    if ( var_5 == var_3 )
        return 1;

    return 0;
}

_id_50BE( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_39BC ) )
        return 1;

    if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["explode"] ) )
    {
        if ( isdefined( self._id_2D29 ) )
            return 0;
    }

    if ( !isdefined( var_2 ) )
        return 1;

    if ( var_2 == self )
        return 1;

    var_3 = level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["validAttackers"];

    if ( !isdefined( var_3 ) )
        return 1;

    if ( var_3 == "no_player" )
    {
        if ( !isplayer( var_2 ) )
            return 1;

        if ( !isdefined( var_2._id_25A4 ) )
            return 1;

        if ( var_2._id_25A4 == 0 )
            return 1;
    }
    else if ( var_3 == "player_only" )
    {
        if ( isplayer( var_2 ) )
            return 1;

        if ( isdefined( var_2._id_25A4 ) && var_2._id_25A4 )
            return 1;
    }
    else if ( var_3 == "no_ai" && isdefined( level._id_50A9 ) )
    {
        if ( ![[ level._id_50A9 ]]( var_2 ) )
            return 1;
    }
    else if ( var_3 == "ai_only" && isdefined( level._id_50A9 ) )
    {
        if ( [[ level._id_50A9 ]]( var_2 ) )
            return 1;
    }
    else
    {

    }

    return 0;
}

_id_51E6( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        return 1;

    var_3 = level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["godModeAllowed"];

    if ( var_3 && ( isdefined( self._id_4254 ) && self._id_4254 || isdefined( self._id_7961 ) && self._id_7961 && var_2 == "bullet" ) )
        return 0;

    var_4 = level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["validDamageCause"];

    if ( !isdefined( var_4 ) )
        return 1;

    if ( var_4 == "splash" && var_2 != "splash" )
        return 0;

    if ( var_4 == "no_splash" && var_2 == "splash" )
        return 0;

    if ( var_4 == "no_melee" && var_2 == "melee" || var_2 == "impact" )
        return 0;

    if ( var_4 == "bullet" && var_2 != "bullet" )
        return 0;

    return 1;
}

_id_3F4A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "unknown";

    var_0 = tolower( var_0 );

    switch ( var_0 )
    {
        case "melee":
        case "mod_melee":
        case "mod_melee_alt":
        case "mod_crush":
            return "melee";
        case "bullet":
        case "mod_pistol_bullet":
        case "mod_rifle_bullet":
            return "bullet";
        case "splash":
        case "mod_grenade":
        case "mod_grenade_splash":
        case "mod_projectile":
        case "mod_projectile_splash":
        case "mod_explosive":
            return "splash";
        case "mod_impact":
            return "impact";
        case "mod_energy":
            return "energy";
        case "unknown":
            return "unknown";
        default:
            return "unknown";
    }
}

_id_2585( var_0, var_1, var_2 )
{
    self notify( "stop_damage_mirror" );
    self endon( "stop_damage_mirror" );
    var_0 endon( "stop_taking_damage" );
    self _meth_82C0( 1 );

    for (;;)
    {
        self waittill( "damage", var_3, var_4, var_5, var_6, var_7 );
        var_0 notify( "damage", var_3, var_4, var_5, var_6, var_7, var_1, var_2 );
        var_3 = undefined;
        var_4 = undefined;
        var_5 = undefined;
        var_6 = undefined;
        var_7 = undefined;
    }
}

_id_074B()
{
    self._id_6ABF = 0;
    self._id_614C = 0;
    self._id_1B69 = 1;
}

_id_587A( var_0, var_1, var_2, var_3 )
{
    self endon( "FX_State_Change" + var_3 );
    self endon( "delete_destructible" );
    level endon( "putout_fires" );

    while ( isdefined( self ) )
    {
        var_4 = _id_3D49();
        playfxontag( var_0, var_4, var_1 );
        wait(var_2);
    }
}

_id_477E( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "Health_Drain_State_Change" + var_2 );
    level endon( "putout_fires" );
    self endon( "destroyed" );

    if ( isdefined( var_5 ) && isdefined( level._id_28FD ) )
        var_5 *= level._id_28FD;

    if ( isdefined( var_0 ) && isdefined( level._id_291B ) )
        var_0 *= level._id_291B;

    wait(var_1);
    self._id_4785 = 1;
    var_7 = undefined;

    if ( isdefined( level._id_2A91 ) && level._id_2A91 )
        var_5 = undefined;

    if ( isdefined( var_5 ) && isdefined( level._id_1262 ) )
    {
        var_7 = "" + gettime();

        if ( !isdefined( self._id_2AF4 ) )
        {
            if ( isdefined( self._id_7AAC ) )
                var_5 = self._id_7AAC;

            if ( _id_A4F0::_id_51AB() && isdefined( var_6 ) )
            {
                if ( var_6 == "both" )
                    call [[ level._id_1262 ]]( var_7, 0, self._id_02E6, var_5, 128, "allies", "bad_guys" );
                else
                    call [[ level._id_1262 ]]( var_7, 0, self._id_02E6, var_5, 128, var_6 );

                thread _id_1265( var_7 );
            }
            else
            {
                call [[ level._id_1262 ]]( var_7, 0, self._id_02E6, var_5, 128 );
                thread _id_1265( var_7 );
            }
        }
    }

    while ( isdefined( self ) && self._id_2924[var_2]._id_9C3A["health"] > 0 )
    {
        self notify( "damage", var_0, self, ( 0, 0, 0 ), ( 0, 0, 0 ), "MOD_UNKNOWN", var_3, var_4 );
        wait(var_1);
    }

    self notify( "remove_badplace" );
}

_id_1265( var_0 )
{
    _id_A4F0::_id_A060( "destroyed", "remove_badplace" );
    call [[ level._id_1263 ]]( var_0 );
}

_id_67FA( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_67FC( var_0, var_1 );
    var_4 _meth_82C2( var_2, var_3 );
}

_id_67FB( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_67FC( var_0, var_1 );
    var_4 _meth_83C3( var_2, var_3 );
}

_id_67FC( var_0, var_1 )
{
    var_2 = level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["modelName"];
    var_3 = level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A["tagName"];
    _id_4869( var_3 );

    if ( level._id_293A.size >= level._id_293B )
        _id_67FD( level._id_293A[0] );

    var_4 = spawn( "script_model", self _meth_8180( var_3 ) );
    var_4._id_0041 = self _meth_8181( var_3 );
    var_4 _meth_80B1( var_2 );
    level._id_293A[level._id_293A.size] = var_4;
    return var_4;
}

_id_67FD( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_293A.size; var_2++ )
    {
        if ( level._id_293A[var_2] == var_0 )
            continue;

        var_1[var_1.size] = level._id_293A[var_2];
    }

    level._id_293A = var_1;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_0165( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14 )
{
    if ( isdefined( var_3 ) && isdefined( level._id_290D ) )
        var_3 *= level._id_290D;

    if ( !isdefined( var_7 ) )
        var_7 = 80;

    if ( !isdefined( var_11 ) )
        var_11 = ( 0, 0, 0 );

    if ( !isdefined( var_6 ) || isdefined( var_6 ) && !var_6 )
    {
        if ( isdefined( self._id_3525 ) )
            return;

        self._id_3525 = 1;
    }

    if ( !isdefined( var_12 ) )
        var_12 = 0;

    self notify( "exploded", var_10 );
    level notify( "destructible_exploded", self, var_10 );

    if ( self._id_00AD == "script_vehicle" )
        self notify( "death", var_10, self._id_258B );

    if ( _id_A4F0::_id_51AB() )
        thread _id_2B39();

    if ( !level._id_366F )
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    var_15 = self._id_2924[var_0]._id_9C3A["currentState"];
    var_16 = undefined;

    if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_0][var_15] ) )
        var_16 = level._id_0118[self._id_2938]._id_66A4[var_0][var_15]._id_9C3A["tagName"];

    if ( isdefined( var_16 ) )
        var_17 = self _meth_8180( var_16 );
    else
        var_17 = self._id_02E6;

    self notify( "damage", var_5, self, ( 0, 0, 0 ), var_17, "MOD_EXPLOSIVE", "", "" );
    self notify( "stop_car_alarm" );
    waitframe;

    if ( isdefined( level._id_0118[self._id_2938]._id_66A4 ) )
    {
        for ( var_18 = level._id_0118[self._id_2938]._id_66A4.size - 1; var_18 >= 0; var_18-- )
        {
            if ( var_18 == var_0 )
                continue;

            var_19 = self._id_2924[var_18]._id_9C3A["currentState"];

            if ( var_19 >= level._id_0118[self._id_2938]._id_66A4[var_18].size )
                var_19 = level._id_0118[self._id_2938]._id_66A4[var_18].size - 1;

            var_20 = level._id_0118[self._id_2938]._id_66A4[var_18][var_19]._id_9C3A["modelName"];
            var_16 = level._id_0118[self._id_2938]._id_66A4[var_18][var_19]._id_9C3A["tagName"];

            if ( !isdefined( var_20 ) )
                continue;

            if ( !isdefined( var_16 ) )
                continue;

            var_21 = 0;

            if ( isdefined( self._id_2924[var_18]._id_9C3A["health"] ) )
                var_21 = self._id_2924[var_18]._id_9C3A["health"];

            var_22 = 0;

            if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_18][var_19]._id_9C3A["health"] ) )
                var_22 = level._id_0118[self._id_2938]._id_66A4[var_18][var_19]._id_9C3A["health"];

            if ( var_22 > 0 && var_21 <= 0 )
                continue;

            if ( isdefined( level._id_0118[self._id_2938]._id_66A4[var_18][0]._id_9C3A["physicsOnExplosion"] ) )
            {
                if ( level._id_0118[self._id_2938]._id_66A4[var_18][0]._id_9C3A["physicsOnExplosion"] > 0 )
                {
                    var_23 = level._id_0118[self._id_2938]._id_66A4[var_18][0]._id_9C3A["physicsOnExplosion"];
                    var_24 = self _meth_8180( var_16 );
                    var_25 = vectornormalize( var_24 - var_17 );
                    var_25 *= ( randomfloatrange( var_1, var_2 ) * var_23 );

                    if ( isdefined( var_13 ) && isdefined( var_14 ) )
                    {
                        var_26 = _id_A4F0::_id_712C( var_13, var_14 );
                        thread _id_67FB( var_18, var_19, var_25, var_26 );
                    }
                    else
                        thread _id_67FA( var_18, var_19, var_24, var_25 );

                    continue;
                }
            }
        }
    }

    var_27 = !isdefined( var_6 ) || isdefined( var_6 ) && !var_6;

    if ( var_27 )
        self notify( "stop_taking_damage" );

    if ( !level._id_366F )
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    var_28 = var_17 + ( 0, 0, var_7 ) + var_11;
    var_29 = getsubstr( level._id_0118[self._id_2938]._id_9C3A["type"], 0, 7 ) == "vehicle";

    if ( var_29 )
    {
        anim._id_5580 = gettime();
        anim._id_557D = var_28;
        anim._id_557E = var_17;
        anim._id_557F = var_3;
    }

    level thread _id_7E0D( 1 );

    if ( var_12 > 0 )
        wait(var_12);

    if ( isdefined( level._id_2926 ) )
        thread [[ level._id_2926 ]]();

    if ( _id_A4F0::_id_51AB() )
    {
        if ( level._id_3BFC == 0 && !_id_6C31() )
            self _meth_81D5( var_28, var_3, var_5, var_4, self, "MOD_RIFLE_BULLET" );
        else
            self _meth_81D5( var_28, var_3, var_5, var_4, self );

        if ( isdefined( self._id_25A8 ) && var_29 )
        {
            self._id_25A8 notify( "destroyed_car" );
            level notify( "player_destroyed_car", self._id_25A8, var_28 );
        }
    }
    else
    {
        var_30 = "destructible_toy";

        if ( var_29 )
            var_30 = "destructible_car";

        if ( !isdefined( self._id_25A8 ) )
            self _meth_81D5( var_28, var_3, var_5, var_4, self, "MOD_EXPLOSIVE", var_30 );
        else
        {
            self _meth_81D5( var_28, var_3, var_5, var_4, self._id_25A8, "MOD_EXPLOSIVE", var_30 );

            if ( var_29 )
            {
                self._id_25A8 notify( "destroyed_car" );
                level notify( "player_destroyed_car", self._id_25A8, var_28 );
            }
        }
    }

    if ( isdefined( var_8 ) && isdefined( var_9 ) )
        earthquake( var_8, 2.0, var_28, var_9 );

    level thread _id_7E0D( 0, 0.05 );
    var_31 = 0.01;
    var_32 = var_3 * var_31;
    var_3 *= 0.99;
    physicsexplosionsphere( var_17, var_3, 0, var_32 );

    if ( var_27 )
    {
        self _meth_82C0( 0 );
        thread _id_1E90();
    }

    self notify( "destroyed" );
}

_id_1E90()
{
    wait 0.05;

    while ( isdefined( self ) && isdefined( self._id_A03A ) )
    {
        self waittill( "queue_processed" );
        wait 0.05;
    }

    if ( !isdefined( self ) )
        return;

    self._id_0C7B = undefined;
    self._id_0055 = undefined;
    self._id_1B69 = undefined;
    self._id_1B81 = undefined;
    self._id_25A8 = undefined;
    self._id_2924 = undefined;
    self._id_0118 = undefined;
    self._id_2938 = undefined;
    self._id_4785 = undefined;
    self._id_614C = undefined;
    self._id_6ABF = undefined;

    if ( !isdefined( level._id_2904 ) )
        return;

    self._id_7A78 = undefined;
    self._id_353B = undefined;
    self._id_5889 = undefined;
    self._id_1B63 = undefined;
}

_id_7E0D( var_0, var_1 )
{
    level notify( "set_disable_friendlyfire_value_delayed" );
    level endon( "set_disable_friendlyfire_value_delayed" );

    if ( isdefined( var_1 ) )
        wait(var_1);

    level._id_3AA6 = var_0;
}

_id_2150()
{
    var_0 = _id_3E9F();

    if ( !isdefined( var_0 ) )
        return;

    var_0 call [[ level._id_214E ]]();
    var_0._id_02E6 -= ( 0, 0, 10000 );
}

_id_2B39()
{
    var_0 = _id_3E9F();

    if ( !isdefined( var_0 ) )
        return;

    var_0._id_02E6 += ( 0, 0, 10000 );
    var_0 call [[ level._id_2B38 ]]();
    var_0._id_02E6 -= ( 0, 0, 10000 );
}

_id_3E9F()
{
    if ( !isdefined( self._id_04A5 ) )
        return undefined;

    var_0 = getentarray( self._id_04A5, "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isspawner( var_2 ) )
            continue;

        if ( isdefined( var_2._id_7995 ) )
            continue;

        if ( var_2._id_00AD == "light" )
            continue;

        if ( !var_2._id_03DB & 1 )
            continue;

        return var_2;
    }
}

_id_4869( var_0 )
{
    self _meth_8048( var_0 );
}

_id_84F8( var_0 )
{
    self _meth_804B( var_0 );
}

_id_2AA0()
{
    self._id_2D29 = 1;
}

_id_3993()
{
    self._id_2D29 = undefined;
    self._id_39BC = 1;
    self notify( "damage", 100000, self, self._id_02E6, self._id_02E6, "MOD_EXPLOSIVE", "", "" );
}

_id_3D49()
{
    if ( !_id_A4F0::_id_51AB() )
        return self;

    if ( self._id_5D3E )
        var_0 = self._id_5D3D;
    else
        var_0 = self;

    return var_0;
}

_id_6971( var_0, var_1 )
{
    var_2 = _id_3D49();
    var_3 = spawn( "script_origin", ( 0, 0, 0 ) );

    if ( isdefined( var_1 ) )
        var_3._id_02E6 = var_2 _meth_8180( var_1 );
    else
        var_3._id_02E6 = var_2._id_02E6;

    var_3 _meth_8075( var_0 );
    var_2 thread _id_39A5( var_0 );
    var_2 waittill( "stop sound" + var_0 );

    if ( !isdefined( var_3 ) )
        return;

    var_3 _meth_80AB( var_0 );
    var_3 delete();
}

_id_39A5( var_0 )
{
    self endon( "stop sound" + var_0 );
    level waittill( "putout_fires" );
    self notify( "stop sound" + var_0 );
}

_id_6226( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    waitframe;

    if ( isdefined( self._id_3525 ) )
        return;

    if ( _id_A4F0::_id_51AB() )
        var_0 /= 0.5;
    else
        var_0 /= 1.0;

    self notify( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_69BE( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        var_2 = spawn( "script_origin", self _meth_8180( var_1 ) );
        var_2 _meth_8054();
        var_2 _meth_804D( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }
    else
    {
        var_2 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_2 _meth_8054();
        var_2._id_02E6 = self._id_02E6;
        var_2._id_0041 = self._id_0041;
        var_2 _meth_804D( self );
    }

    var_2 _meth_809A( var_0 );
    wait 5.0;

    if ( isdefined( var_2 ) )
        var_2 delete();
}

_id_2BB6()
{
    if ( isdefined( self._id_1B81 ) )
        return;

    self._id_1B81 = 1;

    if ( !_id_845D() )
        return;

    self._id_1B63 = spawn( "script_model", self._id_02E6 );
    self._id_1B63 _meth_8054();
    self._id_1B63 _meth_8075( "car_alarm" );
    level._id_250B++;
    thread _id_1B66();
    self waittill( "stop_car_alarm" );
    level._id_557C = gettime();
    level._id_250B--;
    self._id_1B63 _meth_80AB( "car_alarm" );
    self._id_1B63 delete();
}

_id_1B66()
{
    self endon( "stop_car_alarm" );
    wait 25;

    if ( !isdefined( self ) )
        return;

    thread _id_69BE( "car_alarm_off" );
    self notify( "stop_car_alarm" );
}

_id_845D()
{
    if ( level._id_250B >= 2 )
        return 0;

    var_0 = undefined;

    if ( !isdefined( level._id_557C ) )
    {
        if ( _id_A4F0::_id_2006() )
            return 1;

        var_0 = gettime() - level._id_20C2;
    }
    else
        var_0 = gettime() - level._id_557C;

    if ( level._id_250B == 0 && var_0 >= 120 )
        return 1;

    if ( randomint( 100 ) <= 33 )
        return 1;

    return 0;
}

_id_2BCD( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( _id_A4F0::_id_51AB() )
    {
        self _meth_801D( var_1, var_0, 0 );

        if ( isdefined( var_2 ) && var_2 != "" )
            self _meth_801D( var_2, var_0, 0 );
    }
    else
    {
        var_4[0] = spawn( "script_model", self _meth_8180( var_0 ) );
        var_4[0]._id_0041 = self _meth_8181( var_0 );
        var_4[0] _meth_80B1( var_1 );
        var_4[0] _meth_804D( self, var_0 );

        if ( isdefined( var_2 ) && var_2 != "" )
        {
            var_4[1] = spawn( "script_model", self _meth_8180( var_0 ) );
            var_4[1]._id_0041 = self _meth_8181( var_0 );
            var_4[1] _meth_80B1( var_2 );
            var_4[1] _meth_804D( self, var_0 );
        }
    }

    if ( isdefined( var_3 ) )
    {
        var_5 = self _meth_8180( var_0 );
        var_6 = _id_3D05( var_5, var_3 );

        if ( isdefined( var_6 ) )
            var_6 delete();
    }

    self waittill( "exploded" );

    if ( _id_A4F0::_id_51AB() )
    {
        self _meth_802A( var_1, var_0 );
        self _meth_801D( var_1 + "_destroy", var_0, 0 );

        if ( isdefined( var_2 ) && var_2 != "" )
        {
            self _meth_802A( var_2, var_0 );
            self _meth_801D( var_2 + "_destroy", var_0, 0 );
        }
    }
    else
    {
        var_4[0] _meth_80B1( var_1 + "_destroy" );

        if ( isdefined( var_2 ) && var_2 != "" )
            var_4[1] _meth_80B1( var_2 + "_destroy" );
    }
}

_id_3D05( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;
    var_4 = getentarray( var_1, "targetname" );

    foreach ( var_6 in var_4 )
    {
        var_7 = distancesquared( var_0, var_6._id_02E6 );

        if ( !isdefined( var_2 ) || var_7 < var_2 )
        {
            var_2 = var_7;
            var_3 = var_6;
        }
    }

    return var_3;
}

_id_6C31()
{
    var_0 = undefined;

    if ( !isdefined( self._id_04A5 ) )
        return 0;

    var_1 = getentarray( self._id_04A5, "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_7995 ) && var_3._id_7995 == "post" )
        {
            var_0 = var_3;
            break;
        }
    }

    if ( !isdefined( var_0 ) )
        return 0;

    var_5 = _id_3E2A( var_0 );

    if ( isdefined( var_5 ) )
        return 1;

    return 0;
}

_id_3E2A( var_0 )
{
    foreach ( var_2 in level._id_0328 )
    {
        if ( !isalive( var_2 ) )
            continue;

        if ( var_0 _meth_80A9( var_2 ) )
            return var_2;
    }

    return undefined;
}

_id_507D()
{
    return getdvar( "specialops" ) == "1";
}

_id_291A()
{
    var_0 = getentarray( self._id_04A5, "targetname" );
    var_1 = [];
    var_1["pre"] = ::_id_2030;
    var_1["post"] = ::_id_202F;

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3._id_7995 ) )
            continue;

        self thread [[ var_1[var_3._id_7995] ]]( var_3 );
    }
}

_id_2030( var_0 )
{
    waitframe;

    if ( _id_A4F0::_id_51AB() && var_0._id_03DB & 1 )
        var_0 call [[ level._id_2B38 ]]();

    self waittill( "exploded" );

    if ( _id_A4F0::_id_51AB() && var_0._id_03DB & 1 )
        var_0 call [[ level._id_214E ]]();

    var_0 delete();
}

_id_202F( var_0 )
{
    var_0 _meth_82BF();

    if ( _id_A4F0::_id_51AB() && var_0._id_03DB & 1 )
        var_0 call [[ level._id_214E ]]();

    self waittill( "exploded" );
    waitframe;

    if ( _id_A4F0::_id_51AB() )
    {
        if ( var_0._id_03DB & 1 )
            var_0 call [[ level._id_2B38 ]]();

        if ( _id_507D() )
        {
            var_1 = _id_3E2A( var_0 );

            if ( isdefined( var_1 ) )
                self thread [[ level._id_3AE5 ]]( var_1 );
        }
        else
        {

        }
    }

    var_0 _meth_82BE();
}

_id_26B4( var_0 )
{

}

_id_2917( var_0 )
{
    var_1 = getentarray( "light_destructible", "targetname" );

    if ( _id_A4F0::_id_51AB() )
    {
        var_2 = getentarray( "light_destructible", "script_noteworthy" );
        var_1 = _id_A4F0::_id_0CDD( var_1, var_2 );
    }

    if ( !var_1.size )
        return;

    var_3 = var_0 * var_0;
    var_4 = undefined;

    foreach ( var_6 in var_1 )
    {
        var_7 = distancesquared( self._id_02E6, var_6._id_02E6 );

        if ( var_7 < var_3 )
        {
            var_4 = var_6;
            var_3 = var_7;
        }
    }

    if ( !isdefined( var_4 ) )
        return;

    self._id_17DC = var_4;
}

_id_17D6( var_0 )
{
    if ( !isdefined( self._id_17DC ) )
        return;

    self._id_17DC _meth_81DF( 0 );
}

_id_26B6( var_0, var_1, var_2, var_3 )
{
    var_4 = 16;
    var_5 = 360 / var_4;
    var_6 = [];

    for ( var_7 = 0; var_7 < var_4; var_7++ )
    {
        var_8 = var_5 * var_7;
        var_9 = cos( var_8 ) * var_1;
        var_10 = sin( var_8 ) * var_1;
        var_11 = var_0[0] + var_9;
        var_12 = var_0[1] + var_10;
        var_13 = var_0[2];
        var_6[var_6.size] = ( var_11, var_12, var_13 );
    }

    thread _id_2682( var_6, 5.0, ( 1, 0, 0 ), var_0 );
    var_6 = [];

    for ( var_7 = 0; var_7 < var_4; var_7++ )
    {
        var_8 = var_5 * var_7;
        var_9 = cos( var_8 ) * var_1;
        var_10 = sin( var_8 ) * var_1;
        var_11 = var_0[0];
        var_12 = var_0[1] + var_9;
        var_13 = var_0[2] + var_10;
        var_6[var_6.size] = ( var_11, var_12, var_13 );
    }

    thread _id_2682( var_6, 5.0, ( 1, 0, 0 ), var_0 );
    var_6 = [];

    for ( var_7 = 0; var_7 < var_4; var_7++ )
    {
        var_8 = var_5 * var_7;
        var_9 = cos( var_8 ) * var_1;
        var_10 = sin( var_8 ) * var_1;
        var_11 = var_0[0] + var_10;
        var_12 = var_0[1];
        var_13 = var_0[2] + var_9;
        var_6[var_6.size] = ( var_11, var_12, var_13 );
    }

    thread _id_2682( var_6, 5.0, ( 1, 0, 0 ), var_0 );
}

_id_2682( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( var_4 + 1 >= var_0.size )
            var_6 = var_0[0];
        else
            var_6 = var_0[var_4 + 1];

        thread _id_26AA( var_5, var_6, var_1, var_2 );
        thread _id_26AA( var_3, var_5, var_1, var_2 );
    }
}

_id_26AA( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 1, 1, 1 );

    for ( var_4 = 0; var_4 < var_2 * 20; var_4++ )
        wait 0.05;
}

_id_8A85( var_0 )
{
    var_0 endon( "death" );
    level waittill( "new_destructible_spotlight" );
    var_0 delete();
}

_id_8A81( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "new_destructible_spotlight" );
    thread _id_8A85( var_4 );
    var_5 = var_0["spotlight_brightness"];
    wait(randomfloatrange( 2, 5 ));
    _id_2916( var_0, var_1, var_2, var_3 );
    level._id_292E delete();
    var_4 delete();
}

_id_292F( var_0, var_1, var_2, var_3 )
{
    if ( !_id_A4F0::_id_51AB() )
        return;

    if ( !isdefined( self._id_17DC ) )
        return;

    var_1 _id_A4F0::_id_7C6D( "startignoringspotLight" );

    if ( !isdefined( level._id_292E ) )
    {
        level._id_292E = _id_A4F0::_id_8953();
        var_4 = _id_A4F0::_id_3FA6( var_0["spotlight_fx"] );
        playfxontag( var_4, level._id_292E, "tag_origin" );
    }

    level notify( "new_destructible_spotlight" );
    level._id_292E _meth_804F();
    var_5 = _id_A4F0::_id_8953();
    var_5 _meth_804D( self, var_0["spotlight_tag"], ( 0, 0, 0 ), ( 0, 0, 0 ) );
    level._id_292E._id_02E6 = self._id_17DC._id_02E6;
    level._id_292E._id_0041 = self._id_17DC._id_0041;
    level._id_292E thread _id_8A81( var_0, var_1, var_2, var_3, var_5 );
    wait 0.05;

    if ( isdefined( var_5 ) )
        level._id_292E _meth_804D( var_5 );
}

_id_5098( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    if ( isdefined( var_1["fx_valid_damagetype"] ) )
        var_4 = var_1["fx_valid_damagetype"][var_3][var_2];

    if ( !isdefined( var_4 ) )
        return 1;

    return issubstr( var_4, var_0 );
}

_id_292A( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self._id_3525 ) )
        return undefined;

    if ( !isdefined( var_0["sound"] ) )
        return undefined;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_0["sound"][var_3] ) )
        return undefined;

    for ( var_4 = 0; var_4 < var_0["sound"][var_3].size; var_4++ )
    {
        var_5 = _id_51F3( "soundCause", var_0, var_4, var_2, var_3 );

        if ( !var_5 )
            continue;

        var_6 = var_0["sound"][var_3][var_4];
        var_7 = var_0["tagName"];
        var_1 thread _id_69BE( var_6, var_7 );
    }

    return var_3;
}

_id_2912( var_0 )
{
    var_1 = level._id_0118[self._id_2938]._id_66A4[0].size - 1;
    self endon( "FX_State_Change_Kill" + var_0 );

    for (;;)
    {
        var_2 = -1;

        if ( isdefined( self._id_2924[0]._id_9C3A["currentState"] ) )
            var_2 = self._id_2924[0]._id_9C3A["currentState"];

        if ( var_2 == var_1 )
            return 0;

        waittillframeend;
    }
}

_id_2914( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    waitframe;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    var_6 = undefined;
    var_7 = undefined;

    if ( isdefined( var_2 ) )
    {
        if ( var_4 )
        {
            playfxontag( var_1, var_0, var_2 );
            wait 0.05;

            if ( var_5 == 1 || var_5 == 2 )
            {
                _id_2912( var_3 );

                if ( var_5 == 1 )
                    stopfxontag( var_1, var_0, var_2 );
                else
                    killfxontag( var_1, var_0, var_2 );
            }
        }
        else
        {
            var_8 = var_0 _meth_8180( var_2 );
            var_9 = ( 0, 0, 100 );

            if ( var_5 == 1 || var_5 == 2 )
            {
                var_7 = spawnfx( var_1, var_8, var_9 );
                var_6 = triggerfx( var_7, 0.01 );
            }
            else
                var_6 = playfx( var_1, var_8, var_9 );

            wait 0.05;

            if ( var_5 == 1 || var_5 == 2 )
            {
                _id_2912( var_3 );

                if ( var_5 == 1 )
                    var_7 delete();
                else if ( var_5 == 2 )
                {
                    setwinningteam( var_7, 1 );
                    wait 0.05;
                    var_7 delete();
                }
            }
        }
    }
    else
    {
        var_8 = var_0._id_02E6;
        var_9 = ( 0, 0, 100 );

        if ( var_5 == 1 || var_5 == 2 )
        {
            var_7 = spawnfx( var_1, var_8, var_9 );
            var_6 = triggerfx( var_7, 0.01 );
        }
        else
            var_6 = playfx( var_1, var_8, var_9 );

        wait 0.05;

        if ( var_5 == 1 || var_5 == 2 )
        {
            _id_2912( var_3 );

            if ( var_5 == 1 )
                var_7 delete();
            else if ( var_5 == 2 )
            {
                setwinningteam( var_7, 1 );
                wait 0.05;
                var_7 delete();
            }
        }
    }
}

_id_2915()
{
    if ( !isdefined( level._id_0118[self._id_2938]._id_66A4 ) )
        return;

    var_0 = _id_3D49();

    for ( var_1 = 0; var_1 < level._id_0118[self._id_2938]._id_66A4.size; var_1++ )
    {
        for ( var_2 = 0; var_2 < level._id_0118[self._id_2938]._id_66A4[var_1].size; var_2++ )
        {
            var_3 = level._id_0118[self._id_2938]._id_66A4[var_1][var_2];

            if ( isdefined( var_3._id_9C3A["fx_filename"] ) )
            {
                for ( var_4 = 0; var_4 < var_3._id_9C3A["fx_filename"].size; var_4++ )
                {
                    var_5 = var_3._id_9C3A["fx_filename"][var_4];
                    var_6 = var_3._id_9C3A["fx_tag"][var_4];
                    var_7 = var_3._id_9C3A["spawn_immediate"][var_4];

                    if ( isdefined( var_5 ) && isdefined( var_7 ) )
                    {
                        for ( var_8 = 0; var_8 < var_5.size; var_8++ )
                        {
                            if ( var_7[var_8] == 1 )
                            {
                                var_9 = var_3._id_9C3A["state_change_kill"][var_4][var_8];
                                var_10 = level._id_0118[self._id_2938]._id_66A4[var_1][var_2]._id_9C3A["fx"][var_4][var_8];
                                var_11 = var_6[var_8];
                                var_12 = var_5[var_8];
                                var_13 = level._id_0118[self._id_2938]._id_66A4[var_1][var_2]._id_9C3A["fx_useTagAngles"][var_4][var_8];
                                thread _id_2914( var_0, var_10, var_11, var_1, var_13, var_9 );
                            }
                        }
                    }
                }
            }
        }
    }
}

_id_2916( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_0["fx"] ) )
        return undefined;

    if ( !isdefined( var_4 ) )
        var_4 = randomint( var_0["fx_filename"].size );

    if ( !isdefined( var_0["fx"][var_4] ) )
        var_4 = randomint( var_0["fx_filename"].size );

    var_5 = var_0["fx_filename"][var_4].size;

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        if ( !_id_5098( var_2, var_0, var_6, var_4 ) )
            continue;

        if ( var_0["spawn_immediate"][var_4][var_6] == 1 )
            continue;

        var_7 = var_0["fx"][var_4][var_6];
        var_8 = var_0["state_change_kill"][var_4][var_6];

        if ( isdefined( var_0["fx_tag"][var_4][var_6] ) )
        {
            var_9 = var_0["fx_tag"][var_4][var_6];
            self notify( "FX_State_Change" + var_3 );

            if ( var_0["fx_useTagAngles"][var_4][var_6] )
                thread _id_2914( var_1, var_7, var_9, var_3, 1, var_8 );
            else
                thread _id_2914( var_1, var_7, var_9, var_3, 0, var_8 );

            continue;
        }

        thread _id_2914( var_1, var_7, undefined, var_3, 0, var_8 );
    }

    return var_4;
}

_id_28FA( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self._id_3525 ) )
        return undefined;

    if ( !isdefined( var_0["animation"] ) )
        return undefined;

    if ( isdefined( self._id_60F5 ) )
        return undefined;

    if ( isdefined( var_0["randomly_flip"] ) && !isdefined( self._id_7A78 ) )
    {
        if ( _id_A4F0::_id_2006() )
            self._id_0041 += ( 0, 180, 0 );
    }

    if ( isdefined( var_0["spotlight_tag"] ) )
    {
        thread _id_292F( var_0, var_1, var_2, var_3 );
        wait 0.05;
    }

    var_4 = _id_A4F0::_id_710B( var_0["animation"] );
    var_5 = var_4["anim"];
    var_6 = var_4["animTree"];
    var_7 = var_4["groupNum"];
    var_8 = var_4["mpAnim"];
    var_9 = var_4["maxStartDelay"];
    var_10 = var_4["animRateMin"];
    var_11 = var_4["animRateMax"];

    if ( !isdefined( var_10 ) )
        var_10 = 1.0;

    if ( !isdefined( var_11 ) )
        var_11 = 1.0;

    if ( var_10 == var_11 )
        var_12 = var_10;
    else
        var_12 = randomfloatrange( var_10, var_11 );

    var_13 = var_4["vehicle_exclude_anim"];

    if ( self._id_00AD == "script_vehicle" && var_13 )
        return undefined;

    var_1 _id_A4F0::_id_7C6D( "useanimtree", var_6 );
    var_14 = var_4["animType"];

    if ( !isdefined( self._id_0C7B ) )
        self._id_0C7B = [];

    self._id_0C7B[self._id_0C7B.size] = var_5;

    if ( isdefined( self._id_353B ) )
        _id_1E99( var_1 );

    if ( isdefined( var_9 ) && var_9 > 0 )
        wait(randomfloat( var_9 ));

    if ( !_id_A4F0::_id_51AB() )
    {
        if ( isdefined( var_8 ) )
            _id_A4F0::_id_7C6D( "scriptModelPlayAnim", var_8 );

        return var_7;
    }

    if ( var_14 == "setanim" )
    {
        var_1 _id_A4F0::_id_7C6D( "setanim", var_5, 1.0, 1.0, var_12 );
        return var_7;
    }

    if ( var_14 == "setanimknob" )
    {
        var_1 _id_A4F0::_id_7C6D( "setanimknob", var_5, 1.0, 0, var_12 );
        return var_7;
    }

    return undefined;
}

_id_1E99( var_0 )
{
    if ( isdefined( self._id_0C7B ) )
    {
        foreach ( var_2 in self._id_0C7B )
        {
            if ( _id_A4F0::_id_51AB() )
            {
                var_0 _id_A4F0::_id_7C6D( "clearanim", var_2, 0 );
                continue;
            }

            var_0 _id_A4F0::_id_7C6D( "scriptModelClearAnim" );
        }
    }
}

_id_4CD4()
{
    level._id_28E4 = 0;
    level._id_28E5 = 0.5;

    if ( _id_A4F0::_id_51AB() )
        level._id_5A2A = 20;
    else
        level._id_5A2A = 2;
}

_id_07A8()
{
    level._id_28E4++;
    wait(level._id_28E5);
    level._id_28E4--;
}

_id_3D31()
{
    return level._id_28E4;
}

_id_3DD3()
{
    return level._id_5A2A;
}

_id_4CD5()
{
    level._id_2937 = [];
}

_id_0754( var_0, var_1, var_2 )
{
    var_3 = self _meth_81B1();

    if ( !isdefined( level._id_2937[var_3] ) )
    {
        level._id_2937[var_3] = spawnstruct();
        level._id_2937[var_3]._id_331B = var_3;
        level._id_2937[var_3]._id_28F8 = var_0;
        level._id_2937[var_3]._id_93F1 = 0;
        level._id_2937[var_3]._id_606D = 9999999;
        level._id_2937[var_3]._id_3BA0 = 0;
    }

    level._id_2937[var_3]._id_3BA0 += var_1._id_9C3A["fxcost"];
    level._id_2937[var_3]._id_93F1 += var_2;

    if ( var_1._id_9C3A["distance"] < level._id_2937[var_3]._id_606D )
        level._id_2937[var_3]._id_606D = var_1._id_9C3A["distance"];

    thread _id_4547();
}

_id_4547()
{
    level notify( "handle_destructible_frame_queue" );
    level endon( "handle_destructible_frame_queue" );
    wait 0.05;
    var_0 = level._id_2937;
    level._id_2937 = [];
    var_1 = _id_8889( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( _id_3D31() < _id_3DD3() )
        {
            if ( var_1[var_2]._id_3BA0 )
                thread _id_07A8();

            var_1[var_2]._id_28F8 notify( "queue_processed", 1 );
            continue;
        }

        var_1[var_2]._id_28F8 notify( "queue_processed", 0 );
    }
}

_id_8889( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
        var_1[var_1.size] = var_3;

    for ( var_5 = 1; var_5 < var_1.size; var_5++ )
    {
        var_6 = var_1[var_5];

        for ( var_7 = var_5 - 1; var_7 >= 0 && _id_3CDA( var_6, var_1[var_7] ) == var_6; var_7-- )
            var_1[var_7 + 1] = var_1[var_7];

        var_1[var_7 + 1] = var_6;
    }

    return var_1;
}

_id_3CDA( var_0, var_1 )
{
    if ( var_0._id_93F1 > var_1._id_93F1 )
        return var_0;
    else
        return var_1;
}

_id_3E15( var_0, var_1 )
{
    var_2 = 0;

    if ( !isdefined( level._id_0118[self._id_2938]._id_66A4[var_0][var_1] ) )
        return var_2;

    var_3 = level._id_0118[self._id_2938]._id_66A4[var_0][var_1]._id_9C3A;

    if ( isdefined( var_3["fx"] ) )
    {
        foreach ( var_5 in var_3["fx_cost"] )
        {
            foreach ( var_7 in var_5 )
                var_2 += var_7;
        }
    }

    return var_2;
}

_id_4DAF( var_0 )
{
    if ( !_id_A4F0::_id_3837( "FLAG_DOT_init" ) )
    {
        _id_A4F0::_id_383B( "FLAG_DOT_init" );
        _id_A4F0::_id_383D( "FLAG_DOT_init" );
    }

    var_0 = tolower( var_0 );

    switch ( var_0 )
    {
        case "poison":
            if ( !_id_A4F0::_id_3837( "FLAG_DOT_poison_init" ) )
            {
                _id_A4F0::_id_383B( "FLAG_DOT_poison_init" );
                _id_A4F0::_id_383D( "FLAG_DOT_poison_init" );
            }

            break;
        default:
    }
}

_id_23F6()
{
    var_0 = spawnstruct();
    var_0._id_933F = [];
    return var_0;
}

_id_23F7( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_04D8 = "trigger_radius";
    var_4._id_02E6 = var_0;
    var_4._id_03DB = var_1;
    var_4._id_0354 = var_2;
    var_4._id_5C84 = var_2;
    var_4._id_5A4C = var_2;
    var_4._id_01E9 = var_3;
    var_4._id_933F = [];
    return var_4;
}

_id_7F51( var_0 )
{
    self._id_02E6 = var_0;
}

_id_7F52( var_0, var_1 )
{
    if ( isdefined( self._id_00AB ) && self._id_00AB != "trigger_radius" )
    {

    }

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    self._id_5C84 = var_0;
    self._id_5A4C = var_1;
}

_id_7F4F( var_0, var_1 )
{
    if ( isdefined( self._id_00AB ) && issubstr( self._id_00AB, "trigger" ) )
        return;
}

_id_7F50( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( var_0 ) )
    {

    }
    else
        var_0 = 0;

    var_6 = tolower( var_6 );
    var_7 = tolower( var_7 );
    var_8 = self._id_933F.size;
    self._id_933F[var_8] = spawnstruct();
    self._id_933F[var_8]._id_013B = 0;
    self._id_933F[var_8]._id_27BF = var_0;
    self._id_933F[var_8]._id_020D = var_1;
    self._id_933F[var_8]._id_0137 = var_2;
    self._id_933F[var_8]._id_5C3D = var_3;
    self._id_933F[var_8]._id_5A27 = var_4;

    switch ( var_5 )
    {
        case 0:
        case 1:
            break;
        default:
    }

    self._id_933F[var_8]._id_3666 = var_5;
    self._id_933F[var_8]._id_8D3B = 0;

    switch ( var_6 )
    {
        case "normal":
            break;
        case "poison":
            switch ( var_7 )
            {
                case "player":
                    self._id_933F[var_8]._id_04D8 = var_6;
                    self._id_933F[var_8]._id_0890 = var_7;
                    self._id_933F[var_8]._id_6493 = ::_id_6492;
                    self._id_933F[var_8]._id_64A6 = ::_id_64A5;
                    self._id_933F[var_8]._id_6468 = ::_id_6467;
                    break;
                default:
            }

            break;
        default:
    }
}

_id_187B( var_0, var_1 )
{
    var_1 = tolower( var_1 );
    var_2 = self._id_933F.size;
    self._id_933F[var_2] = spawnstruct();
    self._id_933F[var_2]._id_0137 = var_0;
    self._id_933F[var_2]._id_27BF = 0;
    self._id_933F[var_2]._id_6493 = ::_id_648E;
    self._id_933F[var_2]._id_64A6 = ::_id_64A3;
    self._id_933F[var_2]._id_6468 = ::_id_6466;

    switch ( var_1 )
    {
        case "player":
            self._id_933F[var_2]._id_0890 = var_1;
            break;
        default:
    }
}

_id_187C( var_0 )
{
    var_1 = self._id_933F.size - 1;

    if ( !isdefined( self._id_933F[var_1]._id_8D60 ) )
        self._id_933F[var_1]._id_8D60 = [];

    var_2 = self._id_933F[var_1]._id_8D60.size;
    self._id_933F[var_1]._id_8D60 = [];
    self._id_933F[var_1]._id_8D60["vars"] = [];
    self._id_933F[var_1]._id_8D60["vars"]["count"] = var_0;
}

_id_187A( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = self._id_933F.size - 1;

    if ( !isdefined( self._id_933F[var_6]._id_8D60["actions"] ) )
        self._id_933F[var_6]._id_8D60["actions"] = [];

    var_7 = self._id_933F[var_6]._id_8D60["actions"].size;
    self._id_933F[var_6]._id_8D60["actions"][var_7] = [];
    self._id_933F[var_6]._id_8D60["actions"][var_7]["vars"] = [ var_0, var_1, var_2, var_3, var_4, var_5 ];
    self._id_933F[var_6]._id_8D60["actions"][var_7]["func"] = ::_id_2BE5;
}

_id_187D( var_0 )
{
    var_1 = self._id_933F.size - 1;

    if ( !isdefined( self._id_933F[var_1]._id_8D60["actions"] ) )
        self._id_933F[var_1]._id_8D60["actions"] = [];

    var_2 = self._id_933F[var_1]._id_8D60["actions"].size;
    self._id_933F[var_1]._id_8D60["actions"][var_2] = [];
    self._id_933F[var_1]._id_8D60["actions"][var_2]["vars"] = [ var_0 ];
    self._id_933F[var_1]._id_8D60["actions"][var_2]["func"] = ::_id_2BE6;
}

_id_648E( var_0, var_1 )
{
    var_2 = var_1 _meth_81B1();
    var_1 endon( "death" );
    var_1 endon( "LISTEN_kill_tick_" + var_0 + "_" + var_2 );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "death" );
    self endon( "LISTEN_exit_dot_" + var_2 );
    var_2 = undefined;
    var_3 = var_1._id_933F[var_0]._id_8D60;

    if ( !isdefined( var_3 ) || !isdefined( var_3["vars"] ) || !isdefined( var_3["vars"]["count"] ) || !isdefined( var_3["actions"] ) )
        return;

    var_4 = var_3["vars"]["count"];
    var_5 = var_3["actions"];
    var_3 = undefined;

    for ( var_6 = 1; var_6 <= var_4 || var_4 == 0; var_6-- )
    {
        foreach ( var_8 in var_5 )
        {
            var_9 = var_8["vars"];
            var_10 = var_8["func"];
            self [[ var_10 ]]( var_0, var_1, var_9 );
        }
    }
}

_id_64A3( var_0, var_1 )
{
    var_2 = var_1 _meth_81B1();
    var_3 = self _meth_81B1();
    var_1 notify( "LISTEN_kill_tick_" + var_0 + "_" + var_2 + "_" + var_3 );
}

_id_6466( var_0, var_1 )
{

}

_id_2BE5( var_0, var_1, var_2 )
{
    var_3 = var_2[0];
    var_4 = var_2[1];
    var_5 = var_2[2];
    var_6 = var_2[3];
    var_7 = var_2[4];
    var_8 = var_2[5];
    self thread [[ level._id_19FE ]]( var_1, var_1, var_4, var_6, var_7, var_8, var_1._id_02E6, ( 0, 0, 0 ) - var_1._id_02E6, "none", 0 );
}

_id_2BE6( var_0, var_1, var_2 )
{
    var_3 = var_1 _meth_81B1();
    var_4 = self _meth_81B1();
    var_1 endon( "death" );
    var_1 endon( "LISTEN_kill_tick_" + var_0 + "_" + var_3 );
    var_1 notify( "LISTEN_kill_tick_" + var_0 + "_" + var_3 + "_" + var_4 );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "death" );
    self endon( "LISTEN_exit_dot_" + var_3 );
    var_3 = undefined;
    var_4 = undefined;
    wait(var_2[0]);
}

_id_8D04( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = undefined;

        switch ( var_3._id_04D8 )
        {
            case "trigger_radius":
                var_4 = spawn( "trigger_radius", var_3._id_02E6, var_3._id_03DB, var_3._id_0354, var_3._id_01E9 );
                var_4._id_5C84 = var_3._id_5C84;
                var_4._id_5A4C = var_3._id_5A4C;
                var_4._id_933F = var_3._id_933F;
                var_1[var_1.size] = var_4;
                break;
            default:
        }

        if ( isdefined( var_3._id_6682 ) )
        {
            var_4 _meth_804D( var_3._id_6682 );
            var_3._id_6682._id_2D7F = var_4;
        }

        var_5 = var_4._id_933F;

        foreach ( var_7 in var_5 )
            var_7._id_8D3B = gettime();

        foreach ( var_7 in var_5 )
        {
            if ( !var_7._id_27BF )
                var_7._id_013B = 1;
        }

        foreach ( var_7 in var_5 )
        {
            if ( issubstr( var_7._id_0890, "player" ) )
            {
                var_4._id_64C4 = 1;
                break;
            }
        }
    }

    foreach ( var_4 in var_1 )
    {
        var_4._id_2D80 = [];

        foreach ( var_16 in var_1 )
        {
            if ( var_4 == var_16 )
                continue;

            var_4._id_2D80[var_4._id_2D80.size] = var_16;
        }
    }

    foreach ( var_4 in var_1 )
    {
        if ( var_4._id_64C4 )
            var_4 thread _id_8D05();
    }

    foreach ( var_4 in var_1 )
        var_4 thread _id_5E49();
}

_id_8D05()
{
    thread _id_9814( ::_id_648F, ::_id_64A4 );
}

_id_5E49()
{
    var_0 = gettime();

    while ( isdefined( self ) )
    {
        foreach ( var_4, var_2 in self._id_933F )
        {
            if ( isdefined( var_2 ) && gettime() - var_0 >= var_2._id_0137 * 1000 )
            {
                var_3 = self _meth_81B1();
                self notify( "LISTEN_kill_tick_" + var_4 + "_" + var_3 );
                self._id_933F[var_4] = undefined;
            }
        }

        if ( !self._id_933F.size )
            break;

        wait 0.05;
    }

    if ( isdefined( self ) )
    {
        foreach ( var_2 in self._id_933F )
            self [[ var_2._id_6468 ]]();

        self notify( "death" );
        self delete();
    }
}

_id_648F( var_0 )
{
    var_1 = var_0 _meth_81B1();
    self notify( "LISTEN_enter_dot_" + var_1 );

    foreach ( var_4, var_3 in var_0._id_933F )
    {
        if ( !var_3._id_013B )
            thread _id_2C31( var_4, var_0, var_3._id_27BF, var_3._id_6493 );
    }

    foreach ( var_4, var_3 in var_0._id_933F )
    {
        if ( var_3._id_013B && var_3._id_0890 == "player" )
            self thread [[ var_3._id_6493 ]]( var_4, var_0 );
    }
}

_id_64A4( var_0 )
{
    var_1 = var_0 _meth_81B1();
    self notify( "LISTEN_exit_dot_" + var_1 );

    foreach ( var_4, var_3 in var_0._id_933F )
    {
        if ( var_3._id_013B && var_3._id_0890 == "player" )
            self thread [[ var_3._id_64A6 ]]( var_4, var_0 );
    }
}

_id_2C31( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1 _meth_81B1();
    var_5 = self _meth_81B1();
    var_1 endon( "LISTEN_kill_tick_" + var_0 + "_" + var_4 + "_" + var_5 );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "death" );
    self notify( "LISTEN_exit_dot_" + var_4 );
    var_4 = undefined;
    var_5 = undefined;
    wait(var_2);
    self thread [[ var_3 ]]( var_0, var_1 );
}

_id_6492( var_0, var_1 )
{
    var_2 = var_1 _meth_81B1();
    var_3 = self _meth_81B1();
    var_1 endon( "death" );
    var_1 endon( "LISTEN_kill_tick_" + var_0 + "_" + var_2 );
    var_1 endon( "LISTEN_kill_tick_" + var_0 + "_" + var_2 + "_" + var_3 );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "death" );
    self endon( "LISTEN_exit_dot_" + var_2 );

    if ( !isdefined( self._id_6490 ) )
        self._id_6490 = [];

    if ( !isdefined( self._id_6490[var_0] ) )
        self._id_6490[var_0] = [];

    self._id_6490[var_0][var_2] = 0;
    var_4 = _id_A4F0::_id_928D( _id_A4F0::_id_51AB(), 1.5, 1 );

    while ( isdefined( var_1 ) && isdefined( var_1._id_933F[var_0] ) )
    {
        self._id_6490[var_0][var_2]++;

        switch ( self._id_6490[var_0][var_2] )
        {
            case 1:
                self _meth_81AF( 1, self._id_02E6 );
                break;
            case 3:
                self _meth_8182( "mp_radiation_low", 4 );
                _id_2C36( var_1, var_4 * 2 );
                break;
            case 4:
                self _meth_8182( "mp_radiation_med", 5 );
                thread _id_2C35( var_0, var_1 );
                _id_2C36( var_1, var_4 * 2 );
                break;
            case 6:
                self _meth_8182( "mp_radiation_high", 5 );
                _id_2C36( var_1, var_4 * 2 );
                break;
            case 8:
                self _meth_8182( "mp_radiation_high", 5 );
                _id_2C36( var_1, var_4 * 500 );
                break;
        }

        wait(var_1._id_933F[var_0]._id_020D);
    }
}

_id_64A5( var_0, var_1 )
{
    var_2 = var_1 _meth_81B1();
    var_3 = self _meth_81B1();
    var_4 = self._id_6491;

    if ( isdefined( var_4 ) )
    {
        foreach ( var_7, var_6 in var_4 )
        {
            if ( isdefined( var_4[var_7] ) && isdefined( var_4[var_7][var_2] ) )
                var_4[var_7][var_2] thread _id_2C33( 0.1, 0 );
        }
    }

    var_1 notify( "LISTEN_kill_tick_" + var_0 + "_" + var_2 + "_" + var_3 );
}

_id_6467()
{
    var_0 = self _meth_81B1();

    foreach ( var_2 in level._id_0328 )
    {
        var_3 = var_2._id_6491;

        if ( isdefined( var_3 ) )
        {
            foreach ( var_6, var_5 in var_3 )
            {
                if ( isdefined( var_3[var_6] ) && isdefined( var_3[var_6][var_0] ) )
                    var_3[var_6][var_0] thread _id_2C34();
            }
        }
    }
}

_id_2C36( var_0, var_1 )
{
    if ( _id_A4F0::_id_51AB() )
        return;

    self thread [[ level._id_19FE ]]( var_0, var_0, var_1, 0, "MOD_SUICIDE", "claymore_mp", var_0._id_02E6, ( 0, 0, 0 ) - var_0._id_02E6, "none", 0 );
    return;
}

_id_2C35( var_0, var_1 )
{
    var_2 = var_1 _meth_81B1();
    var_3 = self _meth_81B1();
    var_1 endon( "death" );
    var_1 endon( "LISTEN_kill_tick_" + var_0 + "_" + var_2 );
    var_1 endon( "LISTEN_kill_tick_" + var_0 + "_" + var_2 + "_" + var_3 );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "death" );
    self endon( "LISTEN_exit_dot_" + var_2 );

    if ( !isdefined( self._id_6491 ) )
        self._id_6491 = [];

    if ( !isdefined( self._id_6491[var_0] ) )
        self._id_6491[var_0] = [];

    if ( !isdefined( self._id_6491[var_0][var_2] ) )
    {
        var_4 = newclienthudelem( self );
        var_4._id_0530 = 0;
        var_4._id_0538 = 0;
        var_4._id_002C = "left";
        var_4._id_002D = "top";
        var_4._id_01F4 = "fullscreen";
        var_4._id_0500 = "fullscreen";
        var_4._id_0037 = 0;
        var_4 _meth_80CC( "black", 640, 480 );
        self._id_6491[var_0][var_2] = var_4;
    }

    var_4 = self._id_6491[var_0][var_2];
    var_5 = 1;
    var_6 = 2;
    var_7 = 0.25;
    var_8 = 1;
    var_9 = 5;
    var_10 = 100;
    var_11 = 0;

    for (;;)
    {
        while ( self._id_6490[var_0][var_2] > 1 )
        {
            var_12 = var_10 - var_9;
            var_11 = ( self._id_6490[var_0][var_2] - var_9 ) / var_12;

            if ( var_11 < 0 )
                var_11 = 0;
            else if ( var_11 > 1 )
                var_11 = 1;

            var_13 = var_6 - var_5;
            var_14 = var_5 + var_13 * ( 1 - var_11 );
            var_15 = var_8 - var_7;
            var_16 = var_7 + var_15 * var_11;
            var_17 = var_11 * 0.5;

            if ( var_11 == 1 )
                break;

            var_18 = var_14 / 2;
            var_4 _id_2C32( var_18, var_16 );
            var_4 _id_2C33( var_18, var_17 );
            wait(var_11 * 0.5);
        }

        if ( var_11 == 1 )
            break;

        if ( var_4._id_0037 != 0 )
            var_4 _id_2C33( 1, 0 );

        wait 0.05;
    }

    var_4 _id_2C32( 2, 0 );
}

_id_2C32( var_0, var_1 )
{
    self _meth_8084( var_0 );
    self._id_0037 = var_1;
    var_1 = undefined;
    wait(var_0);
}

_id_2C33( var_0, var_1 )
{
    self _meth_8084( var_0 );
    self._id_0037 = var_1;
    var_1 = undefined;
    wait(var_0);
}

_id_2C34( var_0, var_1 )
{
    self _meth_8084( var_0 );
    self._id_0037 = var_1;
    var_1 = undefined;
    wait(var_0);
    self _meth_8088();
}

_id_9814( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self._id_331B = self _meth_81B1();

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( !isplayer( var_2 ) && !isdefined( var_2._id_3795 ) )
            continue;

        if ( !isalive( var_2 ) )
            continue;

        if ( !isdefined( var_2._id_9408[self._id_331B] ) )
            var_2 thread _id_6D6E( self, var_0, var_1 );
    }
}

_id_6D6E( var_0, var_1, var_2 )
{
    var_0 endon( "death" );

    if ( !isplayer( self ) )
        self endon( "death" );

    if ( !_id_A4F0::_id_51AB() )
        var_3 = self._id_444D;
    else
        var_3 = "player" + gettime();

    var_0._id_9406[var_3] = self;

    if ( isdefined( var_0._id_5F92 ) )
        self._id_5F93++;

    var_0 notify( "trigger_enter", self );
    self notify( "trigger_enter", var_0 );
    var_4 = 1;

    foreach ( var_6 in var_0._id_2D80 )
    {
        foreach ( var_8 in self._id_9408 )
        {
            if ( var_6 == var_8 )
                var_4 = 0;
        }
    }

    if ( var_4 && isdefined( var_1 ) )
        self thread [[ var_1 ]]( var_0 );

    self._id_9408[var_0._id_331B] = var_0;

    while ( isalive( self ) && ( _id_A4F0::_id_51AB() || !level._id_3BD8 ) )
    {
        var_11 = 1;

        if ( self _meth_80A9( var_0 ) )
            wait 0.05;
        else
        {
            if ( !var_0._id_2D80.size )
                var_11 = 0;

            foreach ( var_6 in var_0._id_2D80 )
            {
                if ( self _meth_80A9( var_6 ) )
                {
                    wait 0.05;
                    break;
                }
                else
                    var_11 = 0;
            }
        }

        if ( !var_11 )
            break;
    }

    if ( isdefined( self ) )
    {
        self._id_9408[var_0._id_331B] = undefined;

        if ( isdefined( var_0._id_5F92 ) )
            self._id_5F93--;

        self notify( "trigger_leave", var_0 );

        if ( var_4 && isdefined( var_2 ) )
            self thread [[ var_2 ]]( var_0 );
    }

    if ( !_id_A4F0::_id_51AB() && level._id_3BD8 )
        return;

    var_0._id_9406[var_3] = undefined;
    var_0 notify( "trigger_leave", self );

    if ( !_id_0C9B( var_0 ) )
        var_0 notify( "trigger_empty" );
}

_id_0C9B( var_0 )
{
    return var_0._id_9406.size;
}

_id_3E38( var_0 )
{
    return level._id_057F[var_0];
}

_id_3E39( var_0 )
{
    return level._id_0580[var_0];
}

_id_2936()
{
    if ( !isdefined( level._id_031D ) )
        return;

    if ( !isdefined( self._id_7992 ) )
        self._id_7992 = 20000;

    while ( isdefined( self ) )
    {
        if ( isdefined( self._id_2924 ) )
        {
            var_0 = 0;

            for ( var_1 = 1; var_1 < self._id_2924.size; var_1++ )
            {
                if ( self._id_2924[var_1]._id_9C3A["currentState"] == 1 )
                    var_0++;
            }

            if ( var_0 == self._id_2924.size - 1 )
                break;
        }

        var_2 = distancesquared( level._id_031D._id_02E6, self._id_02E6 );

        if ( var_2 > self._id_7992 * self._id_7992 )
            self _meth_82C0( 0 );
        else
            self _meth_82C0( 1 );

        wait 0.05;
    }
}
