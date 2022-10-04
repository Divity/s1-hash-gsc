// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_2402()
{
    level._id_3AEC = _id_A4F0::_id_9F2D;
    level._id_3AED = ::_id_3AED;
    level._id_3AE9 = _id_A4EE::_id_5880;
    level._id_3AEA = _id_A4EE::_id_649D;
    level._id_3AE4 = _id_A4EE::_id_23CA;
    level._id_3AEF = common_scripts\_createfx::_id_7487;
    level._id_3AEE = common_scripts\_createfx::_id_6FE9;
    level._id_3AEB = ::_id_3AEB;
    level._id_5FA9 = 1;
    level._id_1A05 = _id_A4F0::_id_9F2D;
    level._id_19FD = _id_A4F0::_id_9F2D;
    level._id_19FF = _id_A4F0::_id_9F2D;
    level._id_19FE = _id_A4F0::_id_9F2D;
    level._id_1A01 = _id_A4F0::_id_9F2D;
    level._id_19FB = _id_A4F0::_id_9F2D;
    level._id_19FA = _id_A4F0::_id_9F2D;
    level._id_1A02 = _id_A4F0::_id_9F2D;
    level._id_19FD = ::_id_19F0;
    level._id_1A03 = _id_A4F0::_id_9F2D;
    _id_A78A::main( [] );
    thread common_scripts\_createfx::_id_3AE6();
    common_scripts\_createfx::_id_2407();
    level waittill( "eternity" );
}

_id_3AED( var_0 )
{
    return level._id_031D._id_02E6;
}

_id_19F0()
{
    self waittill( "begin" );

    if ( !isdefined( level._id_031D ) )
    {
        var_0 = getentarray( "mp_global_intermission", "classname" );
        var_1 = ( var_0[0]._id_0041[0], var_0[0]._id_0041[1], 0.0 );
        self _meth_826F( var_0[0]._id_02E6, var_1 );
        _id_A75A::_id_9B61( "playing" );
        self._id_0275 = 10000000;
        self._id_01E7 = 10000000;
        level._id_031D = self;
        thread common_scripts\_createfx::_id_241B();
    }
    else
        kick( self _meth_81B1() );
}

_id_3AEB()
{
    var_0 = level._id_0575._id_6C16 / 190;
    level._id_031D _meth_81E1( var_0 );
}
