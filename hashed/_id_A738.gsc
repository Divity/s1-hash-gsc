// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_058F["exo_knife_blood"] = loadfx( "vfx/weaponimpact/flesh_impact_head_fatal_exit" );
}

_id_34A2()
{
    thread _id_34A3();
}

_id_34A3()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = _id_A75A::_id_8F56( var_1, "_lefthand" );

        if ( var_2 != "exoknife_mp" && var_2 != "exoknife_jug_mp" )
            continue;

        var_0._id_5977 = ::_id_349C;
        var_0._id_3921 = 1;
        var_0._id_A2D6 = var_1;

        if ( !isdefined( var_0._id_725B ) )
            var_0._id_725B = 0;

        var_0._id_02E9 = self;
        thread _id_349B( var_0 );
        var_0 thread _id_34A4();
        var_0 thread _id_34A1();
        var_0 thread _id_349F();
        var_0 thread _id_349A();
    }
}

_id_349A()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "emp_update" );

        if ( isdefined( level._id_3082 ) && level._id_3082 && self._id_02E9 _id_A75A::_id_50F7() )
            thread _id_3499();
    }
}

_id_349B( var_0 )
{
    self endon( "disconnect" );

    if ( !isdefined( self._id_3504 ) )
        self._id_3504 = 0;

    if ( !self._id_3504 )
        _id_A4F0::_id_0591( var_0._id_A2D6, 1 );

    self._id_3504++;
    var_0 waittill( "death" );
    self._id_3504--;

    if ( !self._id_3504 )
        _id_A4F0::_id_0591( var_0._id_A2D6, 0 );
}

_id_349D()
{
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self waittill( "missile_passed_target" );
    _id_34A0();
}

_id_34A4()
{
    if ( !isdefined( self._id_02E9 ) )
        return;

    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    var_0 = spawn( "trigger_radius", self._id_02E6, 0, 15, 5 );
    var_0 _meth_8069();
    var_0 _meth_804D( self );
    var_0._id_53B7 = self;
    thread _id_A4F0::_id_2824( var_0 );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 != self._id_02E9 )
            continue;

        if ( var_1 _meth_8334( self._id_A2D6 ) >= 1.0 )
            continue;

        break;
    }

    _id_34A0();
}

_id_34A0()
{
    self._id_02E9 _meth_82FB( "damage_feedback", "throwingknife" );
    self._id_02E9 _meth_82F7( self._id_A2D6, self._id_02E9 _meth_82F9( self._id_A2D6 ) + 1 );
    _id_3499();
}

_id_34A1()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "missile_stuck", var_0 );
        var_1 = _id_A74D::_id_330B();
        self._id_3921 = 0;
        self._id_725B = 0;

        if ( isdefined( self._id_02E9 ) && isdefined( var_0 ) && ( isdefined( level._id_511A ) && level._id_511A && var_0._id_02A0 == "animal_dobernan" || _id_A75A::_id_510F( var_0 ) ) && !var_1 )
        {
            if ( isdefined( var_0._id_04A8 ) && isdefined( self._id_02E9._id_04A8 ) && var_0._id_04A8 != self._id_02E9._id_04A8 )
                announcement( self._id_02E6, self._id_02E6 - self._id_02E9._id_02E6 );

            var_0 _id_A750::_id_8706( "exo_knife_player_impact" );
            var_2 = getdvarfloat( "exo_knife_return_delay", 0.5 );
            self._id_02E9 thread _id_349E( var_2 );
            continue;
        }

        thread _id_A7B4::_id_8E2E( undefined, "exo_knife_recall" );
    }
}

exo_knife_recall_stuck_watch()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "missile_stuck", var_0 );

        if ( isdefined( self._id_02E9 ) && isdefined( var_0 ) && var_0 _id_A75A::_id_512E() )
        {
            if ( !level._id_91E4 || isdefined( self._id_02E9._id_04A8 ) && isdefined( var_0._id_04A8 ) && var_0._id_04A8 != self._id_02E9._id_04A8 )
                thread _id_3499();
        }
    }
}

_id_349E( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "exo_knife_recall" );

    if ( isdefined( var_0 ) && var_0 > 0 )
        wait(var_0);

    self notify( "exo_knife_recall" );
}

_id_349C( var_0 )
{
    if ( isdefined( var_0 ) && !var_0._id_725B )
        _id_349E();
}

_id_349F()
{
    self endon( "death" );

    if ( !isdefined( self._id_02E9 ) )
        return;

    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "death" );
    self._id_02E9 waittill( "exo_knife_recall" );
    var_0 = self._id_02E6;
    var_1 = self._id_02E9 _meth_80A8();

    if ( self._id_02E9 _meth_817C() != "prone" )
        var_1 -= ( 0, 0, 20 );

    var_2 = getdvarfloat( "exo_knife_speed", 1200.0 );
    var_3 = distance( var_0, var_1 );
    var_4 = var_3 / var_2;
    var_5 = self._id_02E9 _meth_8339();
    var_1 += var_5 * var_4;
    var_6 = var_1 - var_0;
    var_6 = vectornormalize( var_6 );
    var_7 = 0;

    if ( var_7 != 0 )
        var_0 += var_6 * var_7;

    var_8 = var_6 * var_2;
    var_9 = _func_071( self._id_A2D6, var_0, var_8, 30, self._id_02E9, 1 );
    var_9._id_02E9 = self._id_02E9;
    var_9._id_725B = 1;
    var_9 _meth_81D9( self._id_02E9 );
    var_9 thread exo_knife_recall_stuck_watch();
    var_9 thread _id_349D();
    _id_3499();
}

_id_3498( var_0, var_1, var_2 )
{
    _id_A4F0::_id_A061( var_1, "disconnect", var_1, "death", var_2, "death", var_2, "missile_stuck" );
    missile_deleteattractor( var_0 );
}

_id_3499()
{
    self delete();
}
