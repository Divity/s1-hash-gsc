// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_806C();
}

_id_806C()
{
    level._id_0897["player"]["think"] = ::_id_089C;
}

_id_089C()
{
    _id_A4F0::_id_0594();

    foreach ( var_1 in level._id_1555 )
        var_1._id_04C6 _meth_800A( self );

    thread maps\mp\bots\_bots_gametype_sd::_id_16D8();
}
