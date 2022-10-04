// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( level._id_7134 && !( getdvarint( "scr_game_division", 0 ) > 0 ) )
        level thread _id_64C5();
}

_id_64C5()
{
    level endon( "game_ended" );
    level waittill( "prematch_over" );
    waittillframeend;

    foreach ( var_1 in level._id_0328 )
    {
        if ( isbot( var_1 ) )
            continue;

        var_1 _id_7454();
        var_1 thread _id_1D05();
    }

    for (;;)
    {
        level waittill( "connected", var_1 );

        if ( isbot( var_1 ) )
            continue;

        var_1 _id_7454();
        var_1 thread _id_1D05();
    }
}

_id_7454()
{
    self _meth_82FB( "ui_reinforcement_timer_type", 0 );
    self _meth_82FB( "ui_reinforcement_timer", 0 );
}

_id_8F16( var_0 )
{
    self._id_030D["reinforcements"] = spawnstruct();
    self._id_030D["reinforcements"]._id_04D8 = var_0;
    self._id_030D["reinforcements"]._id_8D3C = _id_A75A::getgametimepassedms();
}

_id_1ABD()
{
    self._id_030D["reinforcements"]._id_04D8 = 0;
}

_id_67B8()
{
    return isdefined( self._id_030D["reinforcements"] );
}

_id_1D05()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !_id_A75A::_id_0AA2() )
        return;

    if ( self._id_01E7 <= 0 )
        self waittill( "spawned_player" );

    if ( _id_67B8() )
    {
        thread _id_2166();
        return;
    }

    var_0 = 0;

    if ( _id_A75A::_id_6E98() )
        var_0 = 4;
    else
        var_0 = self _meth_850F();

    _id_8F16( var_0 );

    if ( var_0 == 0 )
        return;

    var_2 = _id_4132( var_0 );
    var_3 = _id_4130();

    if ( var_3 < var_2 )
    {
        _id_1ABD();
        return;
    }

    thread _id_A026( var_0, var_2 );
}

_id_2166()
{
    var_0 = self._id_030D["reinforcements"]._id_04D8;

    if ( var_0 == 0 )
        return;

    var_1 = _id_4132( var_0 );
    var_2 = _id_A75A::getgametimepassedms();
    var_3 = self._id_030D["reinforcements"]._id_8D3C;
    var_1 -= var_2;
    var_1 += var_3;
    thread _id_A026( var_0, var_1 );
}

_id_4130()
{
    if ( _id_A75A::_id_5191() )
    {
        var_0 = _id_A75A::_id_40C0();
        var_1 = min( var_0 - _id_A75A::_id_40B9( "allies" ), var_0 - _id_A75A::_id_40B9( "axis" ) );
        var_2 = _id_A75A::_id_4129() * var_1;
        return var_2 * 60 * 1000 - _id_A75A::_id_412A();
    }
    else
        return _id_A789::_id_412F();
}

_id_4132( var_0 )
{
    switch ( var_0 )
    {
        case 1:
            return 120000;
        case 2:
            return 240000;
        case 3:
            return 360000;
        case 4:
            return 60000;
        default:
            break;
    }

    return 0;
}

_id_3FCF( var_0 )
{
    switch ( var_0 )
    {
        case 1:
            return 1;
        case 2:
            return 2;
        case 3:
            return 3;
        case 4:
            return 1;
        default:
            break;
    }

    return 0;
}

_id_3F24( var_0 )
{
    switch ( var_0 )
    {
        case 1:
            return "airdrop_reinforcement_common";
        case 2:
            return "airdrop_reinforcement_uncommon";
        case 3:
            return "airdrop_reinforcement_rare";
        case 4:
            return "airdrop_reinforcement_practice";
        default:
            break;
    }

    return "";
}

_id_A026( var_0, var_1 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_2 = _id_3FCF( var_0 );
    self _meth_82FB( "ui_reinforcement_timer_type", var_2 );
    self _meth_82FB( "ui_reinforcement_timer", gettime() + var_1 );
    _id_A79A::_id_A049( var_1 / 1000.0 );
    self _meth_82FB( "ui_reinforcement_timer_type", 0 );
    self _meth_82FB( "ui_reinforcement_timer", 0 );
    _id_41FE( var_0 );
}

_id_41FE( var_0 )
{
    if ( !isplayer( self ) )
        return;

    var_1 = _id_3F24( var_0 );
    var_2 = 500;
    var_3 = _id_A7C3::getnextkillstreakslotindex( var_1 );
    thread _id_A79C::_id_53A6( var_1, var_2, undefined, undefined, var_3 );
    _id_A7C3::_id_41EB( var_1 );
    _id_1ABD();
}
