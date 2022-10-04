// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5DBB()
{
    level._id_058F["mdl_sticky_explosion"] = loadfx( "vfx/explosion/frag_grenade_default" );
    level._id_058F["mdl_sticky_blinking"] = loadfx( "vfx/lights/light_semtex_blinking" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "missile_fire", var_0, var_1 );

        if ( issubstr( var_1, "iw5_microdronelauncher_mp" ) )
            var_0 _meth_8383( self );
    }
}

_id_29A3( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        if ( !isdefined( self._id_6F57 ) )
            self._id_6F57 = self._id_02E6;

        wait 0.05;
        self._id_6F57 = self._id_02E6;
    }
}

_id_29A4( var_0 )
{
    var_0 endon( "spawned_player" );

    if ( !isdefined( self._id_6F57 ) )
        return;

    if ( !isdefined( self ) )
        return;

    var_1 = self._id_02E6 - self._id_6F57;
    var_2 = vectortoangles( var_1 );
    var_3 = anglestoforward( var_2 ) * 8000;
    var_4 = self._id_02E6 + var_3;
    var_5 = bullettrace( self._id_6F57, var_4, 1, var_0, 1, 1 );

    if ( var_5["fraction"] < 1 && isdefined( var_5["position"] ) )
    {
        var_6 = spawn( "script_model", var_5["position"] );
        var_6 _meth_80B1( "projectile_semtex_grenade" );

        if ( isdefined( var_5["entity"] ) )
        {
            if ( isplayer( var_5["entity"] ) )
            {
                var_0 thread _id_84EB();
                var_5["entity"] thread _id_84EB();
            }

            var_6 _meth_804D( var_5["entity"] );
        }

        var_6 thread _id_8E2D( var_0 );
        var_6 thread _id_8E2B( var_0 );
        var_6 thread _id_737E( var_0 );
    }
}

_id_5BFD()
{
    _id_A4F0::_id_A060( "death", "disconnect", "faux_spawn" );

    if ( isdefined( self._id_4AE9 ) )
    {
        foreach ( var_1 in self._id_4AE9 )
            var_1 _meth_8088();

        self._id_4AE9 = undefined;
    }
}

_id_84EB()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    if ( !isdefined( self._id_4AE9 ) )
        self._id_4AE9 = [];

    if ( isdefined( self._id_4AE9 ) && !isdefined( self._id_4AE9["mdlStuckText"] ) )
    {
        self._id_4AE9["mdlStuckText"] = newclienthudelem( self );
        self._id_4AE9["mdlStuckText"]._id_0530 = 0;
        self._id_4AE9["mdlStuckText"]._id_0538 = -170;
        self._id_4AE9["mdlStuckText"]._id_002C = "center";
        self._id_4AE9["mdlStuckText"]._id_002D = "middle";
        self._id_4AE9["mdlStuckText"]._id_01F4 = "center";
        self._id_4AE9["mdlStuckText"]._id_0500 = "middle";
        self._id_4AE9["mdlStuckText"]._id_018C = 3.0;
        self._id_4AE9["mdlStuckText"]._id_0037 = 0.0;
        self._id_4AE9["mdlStuckText"] _meth_80CA( "STUCK!" );
        thread _id_5BFD();
    }

    if ( isdefined( self._id_4AE9["mdlStuckText"] ) )
    {
        self._id_4AE9["mdlStuckText"]._id_0037 = 1.0;
        wait 2.0;
        self._id_4AE9["mdlStuckText"]._id_0037 = 0.0;
    }
}

_id_8E2D( var_0 )
{
    var_0 endon( "spawned_player" );
    wait 3;
    playfx( _id_A4F0::_id_3FA6( "mdl_sticky_explosion" ), self._id_02E6 );
    physicsexplosionsphere( self._id_02E6, 256, 32, 1.0 );
    radiusdamage( self._id_02E6, 256, 130, 15, var_0, "MOD_EXPLOSIVE", "iw5_microdronelauncher_mp" );
    self notify( "exploded" );
}

_id_8E2B( var_0 )
{
    var_0 endon( "spawned_player" );
    self endon( "exploded" );
    self._id_3B75 = _id_A4F0::_id_8953();
    self._id_3B75._id_02E6 = self._id_02E6;
    self._id_3B75 _meth_8053();
    wait 0.1;
    playfxontag( _id_A4F0::_id_3FA6( "mdl_sticky_blinking" ), self._id_3B75, "tag_origin" );
}

_id_737E( var_0 )
{
    thread _id_737F( var_0 );
    thread _id_7380( var_0 );
}

_id_737F( var_0 )
{
    var_0 endon( "spawned_player" );
    self waittill( "exploded" );

    if ( isdefined( self ) )
        _id_1E85();
}

_id_7380( var_0 )
{
    self endon( "exploded" );
    var_0 waittill( "spawned_player" );

    if ( isdefined( self ) )
        _id_1E85();
}

_id_1E85()
{
    stopfxontag( _id_A4F0::_id_3FA6( "mdl_sticky_blinking" ), self._id_3B75, "tag_origin" );
    self delete();
}

_id_5BFC( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "faux_spawn" );
    var_1 = self._id_02E6;
    _id_3D3C();
    wait 0.05;
    _id_3D3C();
    wait 0.05;
    var_2 = 0.1;
    var_3 = _id_3D3C();

    for (;;)
    {
        var_4 = _id_3D3C();
        var_5 = 0;

        if ( var_2 >= 0.35 )
        {
            var_6 = _id_5BF9( var_1, vectornormalize( var_3 ), var_4, var_0 );

            if ( isdefined( var_6 ) )
            {
                self _meth_81D9( var_6, _id_5BFA( var_6 ) );
                var_5 = 1;
                var_3 = var_4;
            }
        }
        else
        {

        }

        if ( !var_5 )
        {
            var_7 = vectornormalize( var_3 + ( 0, 0, -400.0 * squared( var_2 ) ) );
            self _meth_81DA( self._id_02E6 + var_7 * 10000 );
        }

        wait 0.05;
        var_2 += 0.05;
    }
}

_id_5BF9( var_0, var_1, var_2, var_3 )
{
    var_4 = cos( 15 );
    var_5 = undefined;
    var_6 = cos( 15 );

    foreach ( var_8 in level._id_0328 )
    {
        if ( var_8 == var_3 )
            continue;

        if ( var_8._id_04A8 == var_3._id_04A8 )
            continue;

        var_9 = _id_5BFB( var_8 );
        var_10 = vectordot( vectornormalize( var_2 ), vectornormalize( var_9 - self._id_02E6 ) );

        if ( var_10 > var_6 )
        {
            if ( bullettracepassed( self._id_02E6, var_9, 0, var_8 ) )
            {
                var_5 = var_8;
                var_6 = var_10;
                continue;
            }
        }
    }

    return var_5;
}

_id_501C( var_0, var_1 )
{
    var_2 = undefined;

    if ( isai( var_0 ) )
        var_2 = var_0._id_04A8;
    else if ( isdefined( var_0._id_7AE9 ) )
        var_2 = var_0._id_7AE9;

    return isenemyteam( var_2, var_1._id_04A8 );
}

_id_5BFB( var_0 )
{
    return var_0 _meth_8216( 0, 0, 0 );
}

_id_5BFA( var_0 )
{
    return _id_5BFB( var_0 ) - var_0._id_02E6;
}

_id_3D3C()
{
    _id_2A55();
    return self._id_2A5D;
}

_id_2A55()
{
    var_0 = gettime() * 0.001;

    if ( !isdefined( self._id_2A5A ) )
    {
        self._id_2A5A = var_0;
        self._id_2A59 = self._id_02E6;
        self._id_2A5B = ( 0, 0, 0 );
        self._id_2A58 = ( 0, 0, 0 );
        self._id_2A57 = ( 0, 0, 0 );
        self._id_2A56 = ( 0, 0, 0 );
        self._id_2A5D = ( 0, 0, 0 );
        self._id_2A5C = 0;
    }
    else if ( self._id_2A5A != var_0 )
    {
        var_1 = var_0 - self._id_2A5A;
        self._id_2A5A = var_0;
        self._id_2A57 = ( self._id_2A56 - self._id_2A58 ) / var_1;
        self._id_2A58 = self._id_2A56;
        self._id_2A56 = ( self._id_2A5D - self._id_2A5B ) / var_1;
        self._id_2A5B = self._id_2A5D;
        self._id_2A5D = ( self._id_02E6 - self._id_2A59 ) / var_1;
        self._id_2A59 = self._id_02E6;
        self._id_2A5C = length( self._id_2A5D );
    }
}
