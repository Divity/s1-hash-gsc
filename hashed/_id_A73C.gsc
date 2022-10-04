// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A213()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );

    if ( !isdefined( level._id_367B ) )
        _id_367A();

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "fast_heal_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            thread _id_98AA();
        }
    }
}

_id_367A()
{
    self._id_367B = spawnstruct();
}

_id_98AA()
{
    if ( !isdefined( self._id_367B ) )
        _id_367A();

    _id_7446();
    thread _id_8D10();
    thread _id_5E99();
    return 1;
}

_id_8D10()
{
    self endon( "ClearFastHeal" );
    self endon( "death" );
    self _meth_82F4( "earn_superbonus" );
    self._id_367B._id_65F3 = newclienthudelem( self );
    self._id_367B._id_65F3._id_0530 = 0;
    self._id_367B._id_65F3._id_0538 = 0;
    self._id_367B._id_65F3._id_01F4 = "fullscreen";
    self._id_367B._id_65F3._id_0500 = "fullscreen";
    self._id_367B._id_65F3 _meth_80CC( "exo_hud_cloak_overlay", 640, 480 );
    self._id_367B._id_65F3._id_0CCB = 1;
    self._id_367B._id_65F3._id_0037 = 1.0;
    self._id_5101 = 1;
    self._id_4BB6 = 1;
    self._id_478F = 0.99;
    self notify( "damage" );
    wait 10;
    self._id_478F = undefined;
    self._id_5101 = 0;

    if ( isdefined( self._id_367B._id_65F3 ) )
        self._id_367B._id_65F3 _meth_8088();

    self notify( "EndFastHeal" );
}

_id_7446()
{
    if ( isdefined( self._id_5101 ) && self._id_5101 == 1 )
    {
        if ( isdefined( self._id_367B._id_65F3 ) )
            self._id_367B._id_65F3 _meth_8088();

        self._id_478F = undefined;
        self notify( "ClearFastHeal" );
    }
}

_id_5E99()
{
    self endon( "EndFastHeal" );
    self waittill( "death" );
    self._id_478F = undefined;
    self._id_5101 = 0;

    if ( isdefined( self._id_367B._id_65F3 ) )
        self._id_367B._id_65F3 _meth_8088();
}

_id_6FAF()
{
    self endon( "EndFastHeal" );
    self endon( "death" );

    for (;;)
    {
        iprintlnbold( self._id_01E7 );
        wait 1;
    }
}
