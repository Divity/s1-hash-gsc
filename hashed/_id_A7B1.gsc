// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_8A44["allies"] = spawnstruct();
    level._id_8A44["axis"] = spawnstruct();
    level thread _id_64C5();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_64B1();
        var_0 thread _id_64B0();
        var_0 thread _id_64E8();
    }
}

_id_64B1()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_8013();
    }
}

_id_64B0()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        _id_8013();

        if ( !_id_A75A::_id_4FA3() && ( self _meth_8432() || isdefined( self._id_030D["mlgSpectator"] ) && self._id_030D["mlgSpectator"] ) )
        {
            self _meth_8506( 1 );

            if ( game["roundsPlayed"] > 0 )
                self _meth_82FB( "ui_use_mlg_hud", 1 );
        }
    }
}

updatemlgicons()
{
    self endon( "disconnect" );

    if ( self _meth_8432() )
    {
        for (;;)
        {
            level waittill( "player_spawned", var_0 );
            var_1 = var_0._id_8A46;

            if ( isdefined( var_1 ) )
            {
                if ( isdefined( var_1._id_033B ) )
                    self _meth_8539( var_1._id_033B );

                if ( isdefined( var_1._id_03AC ) )
                    self _meth_8539( var_1._id_03AC );
            }
        }
    }
}

_id_64E8()
{
    self endon( "disconnect" );
    thread updatemlgicons();

    for (;;)
    {
        self waittill( "spectating_cycle" );
        var_0 = self _meth_829D();

        if ( isdefined( var_0 ) )
        {
            self _meth_82C5( var_0, 6 );

            if ( self _meth_8432() )
                _id_9B68( var_0 );
        }
    }
}

_id_9B6A()
{
    level endon( "game_ended" );

    for ( var_0 = 0; var_0 < level._id_0328.size; var_0++ )
        level._id_0328[var_0] _id_8013();
}

_id_8013()
{
    var_0 = self._id_03BD;

    if ( level._id_3BD8 && gettime() - level._id_3BDA >= 2000 )
    {
        if ( level._id_5FE9 )
        {
            for ( var_1 = 0; var_1 < level._id_91F0.size; var_1++ )
                self _meth_8273( level._id_91F0[var_1], 0 );
        }
        else
        {
            self _meth_8273( "allies", 0 );
            self _meth_8273( "axis", 0 );
        }

        self _meth_8273( "freelook", 0 );
        self _meth_8273( "none", 1 );
        return;
    }

    var_2 = _id_A7B3::_id_413F( "game", "spectatetype" );
    var_3 = _id_A7B3::_id_413F( "game", "lockspectatepov" );

    if ( self _meth_8432() && !_id_A75A::_id_4FA3() )
        var_2 = 2;

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        var_2 = 1;

    switch ( var_2 )
    {
        case 0:
            if ( level._id_5FE9 )
            {
                for ( var_1 = 0; var_1 < level._id_91F0.size; var_1++ )
                    self _meth_8273( level._id_91F0[var_1], 0 );
            }
            else
            {
                self _meth_8273( "allies", 0 );
                self _meth_8273( "axis", 0 );
            }

            self _meth_8273( "freelook", 0 );
            self _meth_8273( "none", 0 );
            break;
        case 1:
            if ( !level._id_91E4 )
            {
                self _meth_8273( "allies", 1 );
                self _meth_8273( "axis", 1 );
                self _meth_8273( "none", 1 );
                self _meth_8273( "freelook", 0 );
            }
            else if ( isdefined( var_0 ) && ( var_0 == "allies" || var_0 == "axis" ) && !level._id_5FE9 )
            {
                self _meth_8273( var_0, 1 );
                self _meth_8273( _id_A75A::_id_4065( var_0 ), 0 );
                self _meth_8273( "freelook", 0 );
                self _meth_8273( "none", 0 );
            }
            else if ( isdefined( var_0 ) && issubstr( var_0, "team_" ) && level._id_5FE9 )
            {
                for ( var_1 = 0; var_1 < level._id_91F0.size; var_1++ )
                {
                    if ( var_0 == level._id_91F0[var_1] )
                    {
                        self _meth_8273( level._id_91F0[var_1], 1 );
                        continue;
                    }

                    self _meth_8273( level._id_91F0[var_1], 0 );
                }

                self _meth_8273( "freelook", 0 );
                self _meth_8273( "none", 0 );
            }
            else
            {
                if ( level._id_5FE9 )
                {
                    for ( var_1 = 0; var_1 < level._id_91F0.size; var_1++ )
                        self _meth_8273( level._id_91F0[var_1], 0 );
                }
                else
                {
                    self _meth_8273( "allies", 0 );
                    self _meth_8273( "axis", 0 );
                }

                self _meth_8273( "freelook", 0 );
                self _meth_8273( "none", 0 );
            }

            break;
        case 2:
            if ( level._id_5FE9 )
            {
                for ( var_1 = 0; var_1 < level._id_91F0.size; var_1++ )
                    self _meth_8273( level._id_91F0[var_1], 1 );
            }
            else
            {
                self _meth_8273( "allies", 1 );
                self _meth_8273( "axis", 1 );
            }

            self _meth_8273( "freelook", 1 );
            self _meth_8273( "none", 1 );
            break;
    }

    var_4 = self _meth_8297();

    if ( !self _meth_8432() )
    {
        switch ( var_3 )
        {
            case 0:
                self _meth_8274( var_4, "freelook" );
                break;
            case 1:
                self _meth_8273( "none", 0 );
                self _meth_8273( "freelook", 0 );
                self _meth_8274( var_4, "first_person" );
                break;
            case 2:
                self _meth_8273( "none", 0 );
                self _meth_8273( "freelook", 0 );
                self _meth_8274( var_4, "third_person" );
                break;
        }
    }

    if ( isdefined( var_0 ) && ( var_0 == "axis" || var_0 == "allies" ) )
    {
        if ( isdefined( level._id_8A44[var_0]._id_0AA9 ) )
            self _meth_8273( "freelook", 1 );

        if ( isdefined( level._id_8A44[var_0]._id_0AA7 ) )
            self _meth_8273( _id_A75A::_id_4065( var_0 ), 1 );
    }
}

_id_9B69( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
    {
        var_1 = _id_A75A::_id_8F56( var_1, "_mp" );
        var_1 = tablelookuprownum( "mp/statsTable.csv", 4, var_1 );
    }

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self _meth_82FB( var_0 + "weapon", var_1 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = undefined;

        if ( isdefined( var_2[var_3] ) )
        {
            var_4 = _id_A75A::_id_0E02( var_2[var_3] );
            var_4 = tablelookuprownum( "mp/attachmentTable.csv", 3, var_4 );
        }

        if ( !isdefined( var_4 ) )
            var_4 = 0;

        self _meth_82FB( var_0 + "attachment_" + var_3, var_4 );
    }
}

_id_9B68( var_0 )
{
    var_1 = var_0._id_8A46;
    _id_9B69( "ui_mlg_loadout_primary_", var_1._id_033B, [ var_1._id_6F7F, var_1._id_033D, var_1._id_033E ] );
    _id_9B69( "ui_mlg_loadout_secondary_", var_1._id_03AC, [ var_1._id_7BF1, var_1._id_03AE ] );
    var_2 = var_1._id_02DA;

    if ( isdefined( var_2 ) )
        var_2 = tablelookuprownum( "mp/perkTable.csv", 1, var_2 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self _meth_82FB( "ui_mlg_loadout_equipment_0", var_2 );
    var_3 = var_1._id_0156;

    if ( isdefined( var_3 ) )
        var_3 = tablelookuprownum( "mp/perkTable.csv", 1, var_3 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self _meth_82FB( "ui_mlg_loadout_equipment_1", var_3 );

    if ( var_1._id_3348 )
        self _meth_82FB( "ui_mlg_loadout_equipment_2", var_3 );
    else
        self _meth_82FB( "ui_mlg_loadout_equipment_2", -1 );

    var_4 = [ var_1._id_5391, var_1._id_5392, var_1._id_5393, var_1._id_5394 ];

    for ( var_5 = 0; var_5 < 4; var_5++ )
    {
        var_6 = var_4[var_5];

        if ( isdefined( var_6 ) )
            var_6 = tablelookuprownum( "mp/killstreakTable.csv", 1, var_6 );

        if ( !isdefined( var_6 ) )
            var_7 = 0;

        self _meth_82FB( "ui_mlg_loadout_streak_" + var_5, var_6 );
    }

    for ( var_5 = 0; var_5 < 6; var_5++ )
    {
        var_8 = var_1._id_030B[var_5];

        if ( isdefined( var_8 ) )
            var_8 = tablelookuprownum( "mp/perkTable.csv", 1, var_8 );

        if ( !isdefined( var_8 ) )
            var_8 = 0;

        self _meth_82FB( "ui_mlg_loadout_perk_" + var_5, var_8 );
    }
}
