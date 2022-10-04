// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( !isdefined( level._id_685B ) )
        level._id_685B = [];
}

_id_41F6( var_0 )
{
    var_1 = _id_2431( var_0 );
    _id_73CC();
    self._id_1BAB = var_1;
    var_2 = _id_6450( var_0, var_1, 1 );
    self._id_1BAB = undefined;
    _id_74AA();
    return isdefined( var_1 );
}

_id_2431( var_0 )
{
    if ( isdefined( self._id_50D7 ) && self._id_50D7 )
        return;

    var_1 = level._id_685B[var_0];
    var_2 = spawn( "script_model", self._id_02E6 );
    var_2 _meth_80B1( var_1._id_5D3A );
    var_2._id_0041 = self._id_0041;
    var_2._id_02E9 = self;
    var_2._id_04A8 = self._id_04A8;
    var_2._id_210F = var_1;
    var_2._id_381E = 1;

    if ( isdefined( var_1._id_6460 ) )
        var_2 [[ var_1._id_6460 ]]( var_0 );

    var_2 _id_2628( var_0 );
    var_2 thread _id_9364( var_0 );
    var_2 thread _id_468A( var_0 );
    var_2 thread _id_64B2( var_0 );
    var_2 thread _id_64AE( var_0 );
    var_2 thread _id_23E6( var_0 );
    return var_2;
}

_id_468A( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !_id_A75A::_id_5186( var_1 ) )
            continue;

        if ( isdefined( self _meth_83EC() ) )
            self _meth_804F();

        var_1 _id_6450( var_0, self, 0 );
    }
}

_id_6450( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_1 thread _id_6457( var_0, self );
    _id_A4F0::_id_0587();

    if ( !isai( self ) )
    {
        self _meth_82DD( "placePlaceable", "+attack" );
        self _meth_82DD( "placePlaceable", "+attack_akimbo_accessible" );
        self _meth_82DD( "cancelPlaceable", "+actionslot 4" );

        if ( !level._id_2153 )
        {
            self _meth_82DD( "cancelPlaceable", "+actionslot 5" );
            self _meth_82DD( "cancelPlaceable", "+actionslot 6" );
            self _meth_82DD( "cancelPlaceable", "+actionslot 7" );
            self _meth_82DD( "cancelPlaceable", "+actionslot 8" );
        }
    }

    for (;;)
    {
        var_3 = _id_A4F0::_id_A067( "placePlaceable", "cancelPlaceable", "force_cancel_placement" );

        if ( !isdefined( var_1 ) )
        {
            _id_A4F0::_id_0595();
            return 1;
        }
        else if ( var_3 == "cancelPlaceable" && var_2 || var_3 == "force_cancel_placement" )
        {
            var_1 _id_6454( var_0, var_3 == "force_cancel_placement" && !isdefined( var_1._id_381E ) );
            return 0;
        }
        else if ( var_1._id_1AAE )
        {
            var_1 thread _id_64C2( var_0 );
            _id_A4F0::_id_0595();
            return 1;
        }
    }
}

_id_6454( var_0, var_1 )
{
    if ( isdefined( self._id_1BAA ) )
    {
        var_2 = self._id_1BAA;
        var_2 _meth_80DE();
        var_2._id_50D7 = undefined;
        var_2._id_1BAB = undefined;
        var_2 _id_A4F0::_id_0595();
    }

    if ( isdefined( self._id_154E ) )
        self._id_154E delete();

    if ( isdefined( self._id_1BAC ) )
        self._id_1BAC delete();

    var_3 = level._id_685B[var_0];

    if ( isdefined( var_3._id_6455 ) )
        self [[ var_3._id_6455 ]]( var_0 );

    if ( isdefined( var_1 ) && var_1 )
        _id_A7B4::_id_3344();

    self delete();
}

_id_64C2( var_0 )
{
    var_1 = level._id_685B[var_0];
    self._id_02E6 = self._id_6863;
    self._id_0041 = self._id_1BAC._id_0041;
    self _meth_809A( var_1._id_685C );
    _id_851E( var_0 );

    if ( isdefined( var_1._id_64C3 ) )
        self [[ var_1._id_64C3 ]]( var_0 );

    self _meth_80DA( "HINT_NOICON" );
    self _meth_80DB( var_1._id_01F2 );
    var_2 = self._id_02E9;
    var_2 _meth_80DE();
    var_2._id_50D7 = undefined;
    self._id_1BAA = undefined;
    self._id_5170 = 1;
    self._id_381E = undefined;

    if ( isdefined( var_1._id_4775 ) )
    {
        if ( level._id_91E4 )
            _id_A72D::_id_8022( self._id_04A8, ( 0, 0, var_1._id_4775 ) );
        else
            _id_A72D::_id_7FDF( var_2, ( 0, 0, var_1._id_4775 ) );
    }

    thread _id_4651( var_0 );
    thread _id_4653( var_0 );
    self _meth_80BF();
    _id_A4F0::_id_5920( self._id_02E9._id_04A8 );

    if ( issentient( self ) )
        self _meth_8177( "DogsDontAttack" );

    foreach ( var_4 in level._id_0328 )
    {
        if ( var_4 == var_2 )
        {
            self _meth_800A( var_4 );
            continue;
        }

        self _meth_800B( var_4 );
    }

    if ( isdefined( self._id_84AA ) )
    {
        level thread _id_A75A::_id_91F3( var_1._id_8A61, var_2 );
        self._id_84AA = 0;
    }

    var_6 = spawnstruct();
    var_6._id_5791 = self._id_5F9F;
    var_6._id_6A3B = 1;
    var_6._id_31BA = "carried";

    if ( isdefined( var_1._id_64BA ) )
        var_6._id_2662 = var_1._id_64BA;

    thread _id_A747::_id_45BC( var_6 );
    thread _id_A241();
    self notify( "placed" );
    self._id_1BAC delete();
    self._id_1BAC = undefined;
}

_id_6457( var_0, var_1 )
{
    var_2 = level._id_685B[var_0];
    self._id_1BAC = var_1 _id_23E8( var_0 );
    self._id_5170 = undefined;
    self._id_1BAA = var_1;
    var_1._id_50D7 = 1;
    _id_2628( var_0 );
    _id_487B( var_0 );

    if ( isdefined( var_2._id_6458 ) )
        self [[ var_2._id_6458 ]]( var_0 );

    thread _id_9B41( var_0, var_1 );
    thread _id_6459( var_0, var_1 );
    self notify( "carried" );
}

_id_9B41( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "placed" );
    self endon( "death" );
    self._id_1AAE = 1;
    var_2 = -1;
    var_3 = level._id_685B[var_0];
    var_4 = ( 0, 0, 0 );

    if ( isdefined( var_3._id_6861 ) )
        var_4 = ( 0, 0, var_3._id_6861 );

    var_5 = self._id_1BAC;

    for (;;)
    {
        var_6 = var_1 _meth_82D2( 1, var_3._id_6864 );
        self._id_6863 = var_6["origin"];
        var_5._id_02E6 = self._id_6863 + var_4;
        var_5._id_0041 = var_6["angles"];
        self._id_1AAE = var_1 _meth_8341() && var_6["result"] && abs( self._id_6863[2] - var_1._id_02E6[2] ) < var_3._id_685F;

        if ( isdefined( var_6["entity"] ) )
            self._id_5F9F = var_6["entity"];
        else
            self._id_5F9F = undefined;

        if ( self._id_1AAE != var_2 )
        {
            if ( self._id_1AAE )
            {
                var_5 _meth_80B1( var_3._id_5D40 );
                var_1 _meth_80DD( var_3._id_6865 );
            }
            else
            {
                var_5 _meth_80B1( var_3._id_5D41 );
                var_1 _meth_80DD( var_3._id_1AD4 );
            }
        }

        var_2 = self._id_1AAE;
        wait 0.05;
    }
}

_id_2628( var_0 )
{
    self _meth_80C0();
    _id_4874();
    self _meth_813A();
    var_1 = level._id_685B[var_0];

    if ( isdefined( var_1._id_6462 ) )
        self [[ var_1._id_6462 ]]( var_0 );
}

_id_4874()
{
    if ( level._id_91E4 )
        _id_A72D::_id_8022( "none", ( 0, 0, 0 ) );
    else if ( isdefined( self._id_02E9 ) )
        _id_A72D::_id_7FDF( undefined, ( 0, 0, 0 ) );
}

_id_4651( var_0 )
{
    self endon( "carried" );
    var_1 = level._id_685B[var_0];
    _id_A783::_id_7F5F( var_1._id_0275, var_1._id_259C, ::_id_4654, ::_id_5D4C, 1 );
}

_id_5D4C( var_0, var_1, var_2, var_3 )
{
    var_4 = var_3;
    var_5 = self._id_210F;

    if ( isdefined( var_5._id_0AAC ) && var_5._id_0AAC )
        var_4 = _id_A783::_id_4664( var_1, var_2, var_4 );

    if ( isdefined( var_5._id_0AA6 ) && var_5._id_0AA6 )
        var_4 = _id_A783::_id_465A( var_1, var_2, var_4, var_0 );

    var_4 = _id_A783::_id_4666( var_1, var_2, var_4 );
    var_4 = _id_A783::_id_465F( var_1, var_2, var_4 );
    var_4 = _id_A783::_id_4646( var_1, var_2, var_4, var_0 );

    if ( isdefined( var_5._id_5D4C ) )
        var_4 = self [[ var_5._id_5D4C ]]( var_1, var_2, var_4 );

    return var_4;
}

_id_4654( var_0, var_1, var_2, var_3 )
{
    var_4 = self._id_210F;
    _id_A783::_id_64B3( var_0, var_1, var_2, var_3, var_4._id_A39E, var_4._id_28E6 );
}

_id_4653( var_0 )
{
    self endon( "carried" );
    self waittill( "death" );
    var_1 = level._id_685B[var_0];

    if ( isdefined( self ) )
    {
        _id_2628( var_0 );

        if ( isdefined( var_1._id_5D3C ) )
            self _meth_80B1( var_1._id_5D3C );

        if ( isdefined( var_1._id_6465 ) )
            self [[ var_1._id_6465 ]]( var_0 );

        self delete();
    }
}

_id_6459( var_0, var_1 )
{
    self endon( "placed" );
    self endon( "death" );
    var_1 endon( "disconnect" );
    var_1 waittill( "death" );

    if ( self._id_1AAE )
        thread _id_64C2( var_0 );
    else
        _id_6454( var_0 );
}

_id_64B2( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self._id_02E9 waittill( "killstreak_disowned" );
    _id_1E5F( var_0 );
}

_id_64AE( var_0 )
{
    self endon( "death" );
    level waittill( "game_ended" );
    _id_1E5F( var_0 );
}

_id_1E5F( var_0 )
{
    if ( isdefined( self._id_5170 ) )
        self notify( "death" );
    else
        _id_6454( var_0 );
}

_id_A241()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        thread _id_64C8( var_0 );
    }
}

_id_64C8( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 waittill( "spawned_player" );
    self _meth_800B( var_0 );
}

_id_9364( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_1 = level._id_685B[var_0];
    var_2 = var_1._id_56F5;

    while ( var_2 > 0.0 )
    {
        wait 1.0;
        _id_A79A::_id_A0D4();

        if ( !isdefined( self._id_1BAA ) )
            var_2 -= 1.0;
    }

    if ( isdefined( self._id_02E9 ) && isdefined( var_1._id_4273 ) )
        self._id_02E9 thread _id_A75A::_id_5652( var_1._id_4273 );

    self notify( "death" );
}

_id_73E9()
{
    if ( self _meth_8314( "iw6_riotshield_mp" ) )
    {
        self._id_74B0 = "iw6_riotshield_mp";
        self _meth_830F( "iw6_riotshield_mp" );
    }
}

_id_73CC()
{
    if ( _id_A75A::_id_05CB( "specialty_explosivebullets" ) )
    {
        self._id_74A9 = "specialty_explosivebullets";
        _id_A75A::_id_067B( "specialty_explosivebullets" );
    }
}

_id_74B2()
{
    if ( isdefined( self._id_74B0 ) )
    {
        _id_A75A::_id_05C0( self._id_74B0 );
        self._id_74B0 = undefined;
    }
}

_id_74AA()
{
    if ( isdefined( self._id_74A9 ) )
    {
        _id_A75A::_id_41F5( self._id_74A9, 0 );
        self._id_74A9 = undefined;
    }
}

_id_23E6( var_0 )
{
    var_1 = level._id_685B[var_0];

    if ( isdefined( var_1._id_5D3B ) )
    {
        var_2 = spawn( "script_model", self._id_02E6 );
        var_2._id_0041 = self._id_0041;
        var_2 _meth_8054();
        var_2 thread _id_A7B4::_id_154F( self._id_02E9 );
        var_2 _meth_80B1( var_1._id_5D3B );
        var_2 _meth_804D( self );
        var_2 _meth_80BE( 0 );
        self._id_154E = var_2;
        self waittill( "death" );

        if ( isdefined( var_2 ) )
        {
            var_2 delete();
            self._id_154E = undefined;
        }
    }
}

_id_851E( var_0 )
{
    self _meth_8053();

    if ( isdefined( self._id_154E ) )
    {
        self._id_154E _meth_8053();
        level notify( "update_bombsquad" );
    }
}

_id_487B( var_0 )
{
    self _meth_8054();

    if ( isdefined( self._id_154E ) )
        self._id_154E _meth_8054();
}

_id_23E8( var_0 )
{
    if ( isdefined( self._id_50D7 ) && self._id_50D7 )
        return;

    var_1 = spawnturret( "misc_turret", self._id_02E6 + ( 0, 0, 25 ), "sentry_minigun_mp" );
    var_1._id_0041 = self._id_0041;
    var_1._id_02E9 = self;
    var_2 = level._id_685B[var_0];
    var_1 _meth_80B1( var_2._id_5D3A );
    var_1 _meth_8138();
    var_1 _meth_817A( 1 );
    var_1 _meth_8065( "sentry_offline" );
    var_1 _meth_80C0();
    var_1 _meth_8103( self );
    var_1 _meth_8104( self );
    var_1 _meth_82C0( 0 );
    var_1 _meth_80BE( 0 );
    return var_1;
}
