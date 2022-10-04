// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{

}

_id_83B8( var_0, var_1 )
{
    if ( _id_A73D::_id_5104() )
        return;

    if ( _id_A75A::_id_51E0() || _id_A75A::_id_5128() )
        return;

    if ( var_0 == "MOD_EXPLOSIVE" || var_0 == "MOD_GRENADE" || var_0 == "MOD_GRENADE_SPLASH" || var_0 == "MOD_PROJECTILE" || var_0 == "MOD_PROJECTILE_SPLASH" )
    {
        if ( var_1 > 10 )
        {
            if ( !_id_A75A::_id_05CB( "specialty_hard_shell" ) )
                self _meth_8182( "frag_grenade_mp", 0.5 );
        }
    }
}

_id_31B7()
{
    self waittill( "death" );
    waitframe;
    self notify( "end_explode" );
}

_id_43E6()
{
    thread _id_31B7();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.5, 0.75, var_0, 800 );

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 _id_A75A::_id_51E0() || var_2 _id_A75A::_id_5128() )
            continue;

        if ( distancesquared( var_0, var_2._id_02E6 ) > 360000 )
            continue;

        if ( var_2 _meth_81D7( var_0 ) )
            var_2 thread _id_2A6F( var_0 );

        var_2 _meth_82FB( "ui_hud_shake", 1 );
    }
}

_id_2A6F( var_0 )
{
    self notify( "dirtEffect" );
    self endon( "dirtEffect" );
    self endon( "disconnect" );

    if ( !_id_A75A::_id_5186( self ) )
        return;

    var_1 = vectornormalize( anglestoforward( self._id_0041 ) );
    var_2 = vectornormalize( anglestoright( self._id_0041 ) );
    var_3 = vectornormalize( var_0 - self._id_02E6 );
    var_4 = vectordot( var_3, var_1 );
    var_5 = vectordot( var_3, var_2 );
    var_6 = [ "death", "damage" ];

    if ( var_4 > 0 && var_4 > 0.5 && self _meth_8311() != "iw6_riotshield_mp" )
        _id_A4F0::_id_A062( var_6, 2.0 );
    else if ( abs( var_4 ) < 0.866 )
    {
        if ( var_5 > 0 )
            _id_A4F0::_id_A062( var_6, 2.0 );
        else
            _id_A4F0::_id_A062( var_6, 2.0 );
    }
}

_id_14B8( var_0 )
{
    self notify( "bloodEffect" );
    self endon( "bloodEffect" );
    self endon( "disconnect" );

    if ( !_id_A75A::_id_5186( self ) )
        return;

    var_1 = vectornormalize( anglestoforward( self._id_0041 ) );
    var_2 = vectornormalize( anglestoright( self._id_0041 ) );
    var_3 = vectornormalize( var_0 - self._id_02E6 );
    var_4 = vectordot( var_3, var_1 );
    var_5 = vectordot( var_3, var_2 );
    var_6 = [ "death", "damage" ];

    if ( var_4 > 0 && var_4 > 0.5 )
        _id_A4F0::_id_A062( var_6, 7.0 );
    else if ( abs( var_4 ) < 0.866 )
    {
        if ( var_5 > 0 )
            _id_A4F0::_id_A062( var_6, 7.0 );
        else
            _id_A4F0::_id_A062( var_6, 7.0 );
    }
}

_id_14B9()
{
    self endon( "disconnect" );
    wait 0.5;

    if ( isalive( self ) )
        _id_A4F0::_id_A097( "death", 1.5 );
}

_id_196B()
{
    thread _id_31B7();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.4, 0.75, var_0, 512 );

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 _id_A75A::_id_51E0() || var_2 _id_A75A::_id_5128() )
            continue;

        if ( distance( var_0, var_2._id_02E6 ) > 512 )
            continue;

        if ( var_2 _meth_81D7( var_0 ) )
            var_2 thread _id_2A6F( var_0 );

        var_2 _meth_82FB( "ui_hud_shake", 1 );
    }
}

_id_12E5()
{
    var_0 = self._id_02E6;
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.4, 0.5, var_0, 512 );

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 _id_A75A::_id_51E0() || var_2 _id_A75A::_id_5128() )
            continue;

        if ( distance( var_0, var_2._id_02E6 ) > 512 )
            continue;

        if ( var_2 _meth_81D7( var_0 ) )
            var_2 thread _id_2A6F( var_0 );

        var_2 _meth_82FB( "ui_hud_shake", 1 );
    }
}

_id_0D32()
{
    var_0 = self._id_02E6;
    playrumbleonposition( "artillery_rumble", self._id_02E6 );
    earthquake( 0.7, 0.5, self._id_02E6, 800 );

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 _id_A75A::_id_51E0() || var_2 _id_A75A::_id_5128() )
            continue;

        if ( distance( var_0, var_2._id_02E6 ) > 600 )
            continue;

        if ( var_2 _meth_81D7( var_0 ) )
            var_2 thread _id_2A6F( var_0 );

        var_2 _meth_82FB( "ui_hud_shake", 1 );
    }
}

_id_8E11( var_0 )
{
    playrumbleonposition( "grenade_rumble", var_0 );
    earthquake( 0.6, 0.6, var_0, 2000 );

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 _id_A75A::_id_51E0() || var_2 _id_A75A::_id_5128() )
            continue;

        if ( distance( var_0, var_2._id_02E6 ) > 1000 )
            continue;

        if ( var_2 _meth_81D7( var_0 ) )
            var_2 thread _id_2A6F( var_0 );

        var_2 _meth_82FB( "ui_hud_shake", 1 );
    }
}

_id_0999( var_0 )
{
    playrumbleonposition( "artillery_rumble", var_0 );
    earthquake( 0.7, 0.75, var_0, 1000 );

    foreach ( var_2 in level._id_0328 )
    {
        if ( var_2 _id_A75A::_id_51E0() || var_2 _id_A75A::_id_5128() )
            continue;

        if ( distance( var_0, var_2._id_02E6 ) > 900 )
            continue;

        if ( var_2 _meth_81D7( var_0 ) )
            var_2 thread _id_2A6F( var_0 );

        var_2 _meth_82FB( "ui_hud_shake", 1 );
    }
}
