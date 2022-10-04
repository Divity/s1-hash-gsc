// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6D46( var_0, var_1, var_2 )
{
    var_3 = gettime();

    if ( var_3 > var_0 )
        return;

    if ( !isdefined( self._id_78CF ) )
        self._id_78CF = [];

    _id_0613();
    var_4 = spawnstruct();
    var_4._id_31C7 = var_0;
    var_4._id_92B6 = var_1;
    var_4._id_99DE = _id_05BB( var_2 );
    var_4._id_78E5 = _id_0616();
    self._id_78CF[self._id_78CF.size] = var_4;

    if ( !isdefined( self._id_78CE ) || _id_50FC( var_4, self._id_78CE ) )
    {
        self _meth_82FB( "ui_exo_reboot_end_time", var_4._id_31C7 );
        self _meth_82FB( "ui_exo_reboot_text", var_4._id_92B6 );
        self _meth_82FB( "ui_exo_reboot_type", var_4._id_99DE );
        self._id_78CE = var_4;
        thread _id_0617( var_4 );
    }

    return var_4._id_78E5;
}

_id_6D47( var_0 )
{
    if ( !isdefined( self._id_78CF ) )
        return;

    var_1 = _id_0615( var_0 );
    _id_0613();

    if ( isdefined( var_1 ) )
    {
        self._id_78CF = _id_A4F0::_id_0CF6( self._id_78CF, var_1 );
        var_1 notify( "done" );

        if ( var_1 == self._id_78CE )
        {
            var_2 = _id_0614();

            if ( isdefined( var_2 ) )
            {
                self _meth_82FB( "ui_exo_reboot_end_time", var_2._id_31C7 );
                self _meth_82FB( "ui_exo_reboot_text", var_2._id_92B6 );
                self _meth_82FB( "ui_exo_reboot_type", var_2._id_99DE );
                self._id_78CE = var_2;
            }
        }
    }

    if ( self._id_78CF.size == 0 )
    {
        self _meth_82FB( "ui_exo_reboot_end_time", 0 );
        self _meth_82FB( "ui_exo_reboot_type", 0 );
        self._id_78CF = undefined;
        self._id_78CE = undefined;
    }
}

_id_0617( var_0 )
{
    self notify( "_waitToStartNextScrambleEvent" );
    self endon( "_waitToStartNextScrambleEvent" );
    level endon( "game_ended" );
    self endon( "disconnect" );

    while ( isdefined( self._id_78CE ) )
    {
        var_1 = ( self._id_78CE._id_31C7 - gettime() ) / 1000;
        var_2 = self._id_78CE _id_A4F0::_id_A099( "done", var_1 );

        if ( isdefined( var_2 ) && var_2 == "timeout" )
            _id_6D47( self._id_78CE._id_78E5 );
    }
}

_id_05BB( var_0 )
{
    switch ( var_0 )
    {
        case "emp":
            return 1;
        case "systemHack":
            return 2;
        default:
            return 0;
    }
}

_id_0613()
{
    if ( self._id_78CF.size == 0 )
        return;

    var_0 = [];
    var_1 = gettime();

    foreach ( var_3 in self._id_78CF )
    {
        if ( var_1 < var_3._id_31C7 )
            var_0[var_0.size] = var_3;
    }

    self._id_78CF = var_0;
}

_id_0616()
{
    var_0 = 0;

    foreach ( var_2 in self._id_78CF )
    {
        if ( var_2._id_78E5 >= var_0 )
            var_0 = var_2._id_78E5 + 1;
    }

    return var_0;
}

_id_0615( var_0 )
{
    foreach ( var_2 in self._id_78CF )
    {
        if ( var_2._id_78E5 == var_0 )
            return var_2;
    }
}

_id_0614()
{
    if ( self._id_78CF.size == 0 )
        return;

    var_0 = self._id_78CF[0];

    for ( var_1 = 1; var_1 < self._id_78CF.size; var_1++ )
    {
        var_2 = self._id_78CF[var_1];

        if ( _id_50FC( var_2, var_0 ) )
            var_0 = var_2;
    }

    return var_0;
}

_id_50FC( var_0, var_1 )
{
    return var_0._id_99DE > var_1._id_99DE || var_0._id_99DE == var_1._id_99DE && var_0._id_31C7 > var_1._id_31C7;
}

_id_2866( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in level._id_0328 )
    {
        if ( isdefined( var_2 ) )
            var_2._id_4E3E = undefined;
    }

    var_0 notify( "death" );
    var_0 delete();
    self._id_288E = undefined;
    var_4 = [];
    var_4 = _id_A75A::_id_1E5D( level._id_78FB );
    level._id_78FB = var_4;
}

_id_5EBA()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "scrambler" || var_1 == "scrambler_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            var_0 _meth_8054();
            var_0 waittill( "missile_stuck" );
            var_2 = 40;

            if ( var_2 * var_2 < distancesquared( var_0._id_02E6, self._id_02E6 ) )
            {
                var_3 = bullettrace( self._id_02E6, self._id_02E6 - ( 0, 0, var_2 ), 0, self );

                if ( var_3["fraction"] == 1 )
                {
                    var_0 delete();
                    self _meth_82F7( "scrambler_mp", self _meth_82F9( "scrambler_mp" ) + 1 );
                    continue;
                }

                var_0._id_02E6 = var_3["position"];
            }

            var_0 _meth_8053();

            if ( isdefined( self._id_288E ) )
                _id_2866( self._id_288E );

            var_4 = var_0._id_02E6;
            var_5 = spawn( "script_model", var_4 );
            var_5._id_01E7 = 100;
            var_5._id_04A8 = self._id_04A8;
            var_5._id_02E9 = self;
            var_5 _meth_82C0( 1 );
            var_5 _meth_800E( self );
            var_5 _id_A4F0::_id_5920( self._id_04A8, 1 );
            var_5 _id_78FC( self );
            var_5 thread _id_A7B4::_id_23E6( "weapon_jammer_bombsquad", "tag_origin", self );
            level._id_78FB[level._id_78FB.size] = var_5;
            self._id_288E = var_5;
            self._id_1C87 = undefined;
            wait 0.05;

            if ( isdefined( var_0 ) )
                var_0 delete();
        }
    }
}

_id_78FC( var_0 )
{
    self _meth_80B1( "weapon_jammer" );

    if ( level._id_91E4 )
        _id_A72D::_id_8022( self._id_04A8, ( 0, 0, 20 ) );
    else
        _id_A72D::_id_7FDF( var_0, ( 0, 0, 20 ) );

    thread _id_78F6( var_0 );
    thread _id_78FD( var_0 );
    var_0 thread _id_78FE( self );
    thread _id_78F5();
    thread _id_A75A::_id_623D( var_0 );
}

_id_78FE( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    _id_A4F0::_id_A060( "disconnect", "joined_team", "joined_spectators", "death" );
    level thread _id_2866( var_0 );
}

_id_78F5()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 3.0;
        self _meth_809A( "scrambler_beep" );
    }
}

_id_78F6( var_0 )
{
    self endon( "death" );
    self._id_01E7 = 999999;
    self._id_0275 = 100;
    self._id_0102 = 0;

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !_id_A7B4::_id_3AA4( self._id_02E9, var_2 ) )
            continue;

        if ( isdefined( var_10 ) )
        {
            var_11 = _id_A75A::_id_8F56( var_10, "_lefthand" );

            switch ( var_11 )
            {
                case "flash_grenade_mp":
                case "concussion_grenade_mp":
                case "stun_grenade_mp":
                case "smoke_grenade_mp":
                case "stun_grenade_var_mp":
                case "smoke_grenade_var_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( _id_A75A::_id_514D( var_5 ) )
            self._id_0102 += self._id_0275;

        if ( isdefined( var_9 ) && var_9 & level._id_4B59 )
            self._id_A1BC = 1;

        self._id_A1BA = 1;
        self._id_0102 += var_1;

        if ( isplayer( var_2 ) )
            var_2 _id_A784::_id_9B04( "scrambler" );

        if ( self._id_0102 >= self._id_0275 )
        {
            if ( isdefined( var_0 ) && var_2 != var_0 )
                var_2 notify( "destroyed_explosive" );

            self _meth_809A( "sentry_explode" );
            self._id_2659 = playfx( _id_A4F0::_id_3FA6( "equipment_explode" ), self._id_02E6 );
            self _meth_813A();
            var_2 thread _id_2866( self );
        }
    }
}

_id_78FD( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self _meth_80DA( "HINT_NOICON" );
    self _meth_80DB( &"MP_PATCH_PICKUP_SCRAMBLER" );
    _id_A75A::_id_7FFF( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_0 );
        var_1 = var_0 _meth_82F9( "scrambler_mp" );

        if ( var_1 < _func_1E1( "scrambler_mp" ) )
        {
            var_0 _meth_82F4( "scavenger_pack_pickup" );
            var_0 _meth_82F7( "scrambler_mp", var_1 + 1 );
            var_0 thread _id_2866( self );
        }
    }
}

_id_78FA()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );
    self._id_790C = 0;
    var_0 = 512;

    for (;;)
    {
        wait 0.05;
        self._id_790C = 0;

        foreach ( var_2 in level._id_78FB )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( !_id_A75A::_id_5186( self ) )
                continue;

            var_3 = distancesquared( var_2._id_02E6, self._id_02E6 );

            if ( level._id_91E4 && var_2._id_04A8 != self._id_04A8 || !level._id_91E4 && isdefined( var_2._id_02E9 ) && var_2._id_02E9 != self )
            {
                if ( var_3 < var_0 * var_0 )
                    self._id_4E3E = var_2._id_02E9;
                else
                    self._id_4E3E = undefined;

                continue;
            }

            if ( var_3 < var_0 * var_0 )
            {
                self._id_790C = 1;
                break;
            }
        }

        if ( self._id_790C )
        {
            if ( !_id_A75A::_id_05CB( "specialty_blindeye" ) )
            {
                _id_A75A::_id_41F5( "specialty_blindeye", 0 );
                self._id_790D = 1;
            }

            continue;
        }

        if ( isdefined( self._id_790D ) && self._id_790D )
            self._id_790D = 0;
    }
}
