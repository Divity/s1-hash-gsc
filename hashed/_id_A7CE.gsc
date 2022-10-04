// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_5398["ripped_turret"] = ::_id_98C3;
    level._id_53AC["turretheadmg_mp"] = "ripped_turret";
    level._id_53AC["turretheadenergy_mp"] = "ripped_turret";
    level._id_53AC["turretheadrocket_mp"] = "ripped_turret";
    level thread _id_64C5();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        level thread _id_64D3( var_0 );
    }
}

_id_64D3( var_0 )
{
    for (;;)
    {
        var_0 waittill( "killstreakUseWaiter" );
        level thread _id_9AEB( var_0 );
    }
}

_id_9AEB( var_0 )
{
    var_0 _meth_82FB( "ui_energy_ammo", 1 );

    if ( !isdefined( var_0._id_030D["rippableSentry"] ) )
        return;

    var_1 = undefined;

    if ( var_0 _meth_8314( "turretheadmg_mp" ) )
        var_1 = "turretheadmg_mp";
    else if ( var_0 _meth_8314( "turretheadenergy_mp" ) )
        var_1 = "turretheadenergy_mp";
    else if ( var_0 _meth_8314( "turretheadrocket_mp" ) )
        var_1 = "turretheadrocket_mp";

    if ( !isdefined( var_1 ) )
        return;

    var_2 = var_0 _id_6CAB();

    if ( _id_51D9( var_1 ) )
    {
        var_3 = _id_3EEE( var_1 );
        var_4 = var_2 / var_3;
        var_0 _meth_82FB( "ui_energy_ammo", var_4 );
    }
    else
        var_0 _meth_82F6( var_1, var_2 );
}

_id_98C3( var_0, var_1 )
{
    var_2 = _id_98C4( var_1 );

    if ( var_2 )
        _id_A744::_id_5838( "ripped_turret", self._id_02E6 );

    return var_2;
}

_id_98C4( var_0 )
{
    if ( _id_A75A::_id_51E0() )
        return 0;

    var_1 = _id_6D4C( var_0 );
    return var_1;
}

_id_6CAF( var_0 )
{
    _id_A7C3::_id_41EB( "ripped_turret", 0, 0, self, [ var_0 ] );

    if ( !isdefined( self._id_030D["rippableSentry"] ) )
        self._id_030D["rippableSentry"] = spawnstruct();

    var_1 = _id_3EEE( var_0 );
    _id_6D29( var_1 );

    if ( !_id_A4F0::_id_5061() )
    {
        self notify( "streakUsed1" );
        waitframe;
    }

    self _meth_8315( var_0 );
}

_id_6D13( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( var_2 == "turretheadenergy_mp" || var_2 == "turretheadrocket_mp" || var_2 == "turretheadmg_mp" )
            return 1;
    }

    return 0;
}

_id_6D4C( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = _id_6CAB();
    var_2 = var_0[0];

    if ( !_id_51D9( var_2 ) )
        self _meth_82F6( var_2, var_1 );

    self _meth_82F7( var_2, 0 );
    thread _id_6D19( var_2 );

    if ( _id_51D9( var_2 ) )
        thread _id_6D4E( var_2, var_1 );
    else
        thread _id_6D6F( var_2 );

    _id_A4F0::_id_A067( "death", "rippable_complete", "rippable_switch" );

    if ( !isdefined( self ) )
        return 0;

    if ( _id_51D9( var_2 ) )
    {
        self _meth_849C( "fire_turret_weapon", "+attack" );
        self _meth_849C( "fire_turret_weapon", "+attack_akimbo_accessible" );
    }

    var_3 = !_id_6CBC();
    return var_3;
}

_id_6D19( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "rippable_complete" );
    var_1 = self _meth_8311();

    while ( var_1 == var_0 || _id_A75A::_id_50C6( var_1 ) )
        self waittill( "weapon_change", var_1 );

    if ( _id_A75A::_id_513A( var_1 ) )
        self._id_52CA = var_1;

    self notify( "rippable_switch" );
}

_id_6D6F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "rippable_switch" );

    for (;;)
    {
        var_1 = self _meth_82F8( var_0 );
        _id_6D29( var_1 );

        if ( var_1 == 0 )
        {
            _id_6C73();
            self notify( "rippable_complete" );
            return;
        }

        waittillframeend;
    }
}

_id_6CBE()
{
    if ( _id_6CBC() )
        return 1;

    var_0 = self _meth_830C();

    foreach ( var_2 in var_0 )
    {
        if ( var_2 == "turretheadenergy_mp" || var_2 == "turretheadrocket_mp" || var_2 == "turretheadmg_mp" )
            return 1;
    }

    return 0;
}

_id_3EEE( var_0 )
{
    if ( var_0 == "turretheadmg_mp" )
        return 100;
    else if ( var_0 == "turretheadrocket_mp" )
        return 6;
    else
        return getfullenergy();
}

_id_51D9( var_0 )
{
    return var_0 == "turretheadenergy_mp";
}

_id_6D4E( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "rippable_switch" );
    var_2 = getfullenergy();
    self _meth_82DD( "fire_turret_weapon", "+attack" );
    self _meth_82DD( "fire_turret_weapon", "+attack_akimbo_accessible" );
    var_1 = _id_6CAB();
    var_3 = var_1 / var_2;
    self _meth_82FB( "ui_energy_ammo", var_3 );

    for (;;)
    {
        if ( !self _meth_833D() )
            self waittill( "fire_turret_weapon" );

        if ( self _meth_8337() || self _meth_8311() != "turretheadenergy_mp" || !self _meth_812D() || self _meth_84E0() )
        {
            waittillframeend;
            continue;
        }

        var_1 = _id_6CAB();
        var_1 = clamp( var_1 - 1, 0, getfullenergy() );
        var_3 = var_1 / var_2;
        self _meth_82FB( "ui_energy_ammo", var_3 );

        if ( var_1 <= 0 )
        {
            var_4 = self _meth_830C();

            if ( var_4.size > 0 )
                self _meth_8315( var_4[0] );
            else
                self _meth_830F( var_0 );

            _id_6C73();
            self notify( "rippable_complete" );
            return;
        }

        waittillframeend;
        _id_6D29( var_1 );
    }
}

getfullenergy()
{
    return 200.0;
}

_id_6CAB()
{
    return self._id_030D["rippableSentry"]._id_0B6E;
}

_id_6D29( var_0 )
{
    self._id_030D["rippableSentry"]._id_0B6E = var_0;
}

_id_6CBC()
{
    return isdefined( self._id_030D["rippableSentry"] ) && _id_6CAB() > 0;
}

_id_6C73()
{
    self._id_030D["rippableSentry"] = undefined;
}
