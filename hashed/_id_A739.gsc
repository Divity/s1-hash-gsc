// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A20F()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );

    if ( !isdefined( level._id_3575 ) )
        _id_3570();

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        var_2 = _id_A75A::_id_8F56( var_1, "_lefthand" );

        if ( var_2 == "explosive_drone_mp" )
        {
            var_0._id_04A8 = self._id_04A8;

            if ( !isdefined( var_0._id_02E9 ) )
                var_0._id_02E9 = self;

            if ( !isdefined( var_0._id_A2D6 ) )
                var_0._id_A2D6 = var_1;

            var_0 thread _id_3571();
        }
    }
}

_id_3571()
{
    thread _id_A221();
    wait 0.1;

    if ( isdefined( self ) )
    {
        self._id_3550 = spawn( "script_model", self._id_02E6 );
        self._id_3550._id_04A7 = "explosive_drone_head_model";
        self._id_3550 _meth_80B1( level._id_3575._id_5D3A );
        self._id_3550._id_63C4 = self._id_3550 _meth_80BE( 0 );
        self._id_3550 _meth_804D( self, "tag_spike", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        self._id_3550._id_02E9 = self._id_02E9;
        var_0 = self._id_3550;
        var_0 thread cleanup_on_grenade_death( self );
        thread _id_5EC5();
        thread _id_5E6B();
    }
}

cleanup_on_grenade_death( var_0 )
{
    var_0 waittill( "death" );

    if ( isdefined( self ) )
        self delete();
}

_id_3579( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self ) )
    {
        self notify( "death" );

        if ( isdefined( self._id_3550 ) )
            self._id_3550 _id_2850();

        self delete();
    }
}

_id_357A( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self ) )
        self delete();
}

_id_3570()
{
    level._id_3572 = 1;
    level._id_3575 = spawnstruct();
    level._id_3575._id_9364 = 20.0;
    level._id_3575._id_3580 = 30.0;
    level._id_3575._id_01E7 = 60;
    level._id_3575._id_0275 = 60;
    level._id_3575._id_9D6D = "vehicle_tracking_drone_mp";
    level._id_3575._id_5D3A = "npc_drone_explosive_main";
    level._id_3575._id_3BAF = loadfx( "vfx/sparks/direct_hack_stun" );
    level._id_3575._id_3BAB = loadfx( "vfx/lights/tracking_drone_laser_blue" );
    level._id_3575._id_3BA9 = loadfx( "vfx/explosion/explosive_drone_explosion" );
    level._id_3575._id_3BAD = loadfx( "vfx/explosion/explosive_drone_explosion" );
    level._id_3575._id_3BA7 = loadfx( "vfx/lights/light_explosive_drone_beacon_enemy" );
    level._id_3575._id_3BAA = loadfx( "vfx/lights/light_explosive_drone_beacon_friendly" );
    level._id_3575._id_3BA8 = loadfx( "vfx/distortion/tracking_drone_distortion_hemi" );
    level._id_3575._id_3BAC = loadfx( "vfx/trail/explosive_drone_thruster_large" );
    level._id_3575._id_3BAE = loadfx( "vfx/trail/explosive_drone_thruster_small" );
    level._id_3575._id_8898 = "wpn_explosive_drone_exp";
    level._id_3575._id_889A = "wpn_explosive_drone_lock";
    level._id_3575._id_8899 = "wpn_explosive_drone_open";

    foreach ( var_1 in level._id_0328 )
        var_1._id_4FFF = 0;

    level thread _id_64A8();
    level._id_3576 = level._id_3575._id_9364;
    level._id_3576 = level._id_3575._id_3580;
    level._id_356A = 0;
    level._id_356B = 0;
    level._id_356C = 0;
}

_id_98A7( var_0 )
{
    var_1 = 1;

    if ( _id_A75A::_id_51E0() )
        return 0;
    else if ( _id_33E0() )
    {
        self _meth_826E( &"MP_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( _id_A75A::_id_2508() >= _id_A75A::_id_5A56() || level._id_3692 + var_1 >= _id_A75A::_id_5A56() )
    {
        self _meth_826E( &"MP_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    if ( !isdefined( self._id_3569 ) )
        self._id_3569 = [];

    if ( self._id_3569.size )
    {
        self._id_3569 = _id_A4F0::_id_0D01( self._id_3569 );

        if ( self._id_3569.size >= level._id_3572 )
        {
            if ( isdefined( self._id_3569[0] ) )
                self._id_3569[0] thread _id_355A();
        }
    }

    _id_A75A::_id_4C3C();
    var_2 = var_0 _id_2400();

    if ( !isdefined( var_2 ) )
    {
        _id_A75A::_id_2760();
        return 0;
    }

    self _meth_809A( level._id_3575._id_8899 );
    self _meth_809A( level._id_3575._id_889A );
    self._id_3569[self._id_3569.size] = var_2;
    thread _id_8D0D( var_2 );
    playfxontag( level._id_3575._id_3BAC, var_2, "TAG_THRUSTER_BTM" );
    var_0 notify( "mine_selfdestruct" );
    return var_2;
}

_id_2400( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !var_0 )
    {
        var_4 = self._id_0041;
        var_5 = anglestoforward( var_4 );
        var_6 = anglestoright( var_4 );
        var_7 = var_5 * 50;
        var_8 = var_6 * 0;
        var_9 = 80;

        if ( isdefined( self._id_3550 ) )
        {
            var_11 = self._id_3550._id_02E6;
            var_4 = self._id_3550._id_0041;
            self._id_3550 _id_2850();
            _id_0849();
        }
        else
            var_11 = self._id_02E6;
    }
    else
    {
        var_11 = var_1;
        var_12 = var_1;
        var_4 = var_2;
    }

    var_13 = anglestoup( self._id_0041 );
    var_11 += var_13 * 10;
    var_14 = spawnhelicopter( self._id_02E9, var_11, var_4, level._id_3575._id_9D6D, level._id_3575._id_5D3A );

    if ( !isdefined( var_14 ) )
        return;

    var_14._id_04D8 = "explosive_drone";
    var_14 _id_A4F0::_id_5920( self._id_02E9._id_04A8 );
    var_14 _meth_83F3( 1 );
    var_14 _id_084A();
    var_14 thread _id_73A5();
    var_14._id_01E7 = level._id_3575._id_01E7;
    var_14._id_0275 = level._id_3575._id_0275;
    var_14._id_0102 = 0;
    var_14._id_03E3 = 20;
    var_14._id_3978 = 20;
    var_14._id_02E9 = self._id_02E9;
    var_14._id_04A8 = self._id_02E9._id_04A8;
    var_14 _meth_8283( var_14._id_03E3, 10, 10 );
    var_14 _meth_8292( 120, 90 );
    var_14 _meth_825A( 64 );
    var_14 _meth_8253( 20, 5, 5 );
    var_14._id_3B88 = undefined;

    if ( isdefined( var_14._id_04D8 ) )
    {
        if ( var_14._id_04D8 == "explosive_drone" )
        {

        }
    }

    var_14._id_5A54 = 2000;
    var_14._id_5A3A = 300;
    var_14._id_94B6 = undefined;
    var_15 = 45;
    var_16 = 45;
    var_14 _meth_8294( var_15, var_16 );
    var_14._id_91D1 = var_11;
    var_14._id_0E53 = 10000;
    var_14._id_0E52 = 150;
    var_14._id_0E54 = missile_createattractorent( var_14, var_14._id_0E53, var_14._id_0E52 );
    var_14._id_4724 = 0;
    var_14._id_8F6E = 0;
    var_14._id_4C0E = 0;
    var_14 thread _id_A783::_id_7F5F( var_14._id_0275, undefined, ::_id_64A7, undefined, 0 );
    var_14 thread _id_3561();
    var_14 thread _id_3560();
    var_14 thread _id_3568();
    var_14 thread _id_3565();
    var_14 thread _id_3564();
    var_14 thread _id_3566();
    var_14 thread _id_3563();
    var_14 thread _id_3552();
    var_14 thread _id_3554();
    var_14 thread _id_2EE1();
    return var_14;
}

_id_0849()
{
    var_0 = 5;

    if ( !isdefined( level._id_8A56 ) )
    {
        level._id_8A56 = [];
        level._id_8A57 = 0;
    }

    if ( level._id_8A56.size >= var_0 )
    {
        if ( isdefined( level._id_8A56[level._id_8A57] ) )
            level._id_8A56[level._id_8A57] delete();
    }

    level._id_8A56[level._id_8A57] = self;
    level._id_8A57 = ( level._id_8A57 + 1 ) % var_0;
}

_id_4B83( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_1 = anglestoforward( self._id_0041 );

    for (;;)
    {
        if ( _id_A75A::_id_5186( self ) && !_id_A75A::_id_51E0() && anglestoforward( self._id_0041 ) != var_1 )
        {
            var_1 = anglestoforward( self._id_0041 );
            var_2 = self._id_02E6 + var_1 * -100 + ( 0, 0, 40 );
            var_0 _meth_82AE( var_2, 0.5 );
        }

        wait 0.5;
    }
}

_id_3552()
{
    self endon( "death" );
    self._id_02E9 endon( "faux_spawn" );

    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1 ) && issentient( var_1 ) && issentient( self ) && var_1._id_04A8 != self._id_04A8 )
        {
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
        }
    }
}

_id_3554()
{
    self endon( "death" );
    self._id_02E9 endon( "faux_spawn" );

    foreach ( var_1 in level._id_0328 )
    {
        if ( isdefined( var_1 ) && issentient( var_1 ) && issentient( self ) && var_1._id_04A8 == self._id_04A8 )
        {
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_1 );
        }
    }

    thread _id_A203();
    thread _id_A22E();
}

_id_2EE1()
{
    self endon( "death" );
    self endon( "disconnect" );
    self._id_02E9 endon( "faux_spawn" );

    for (;;)
    {
        foreach ( var_1 in level._id_0328 )
        {
            thread _id_2EDF( var_1 );
            thread _id_2EE0( var_1 );
        }

        wait 1.1;
    }
}

_id_2EE0( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self._id_02E9 endon( "faux_spawn" );
    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUST_SIDE_X_nY_Z", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUST_SIDE_X_nY_nZ", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUST_SIDE_nX_nY_Z", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUST_SIDE_nX_nY_nZ", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUST_SIDE_nX_Y_nZ", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUST_SIDE_nX_Y_Z", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUST_SIDE_X_Y_Z", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUST_SIDE_X_Y_nZ", var_0 );
}

_id_2EDF( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self._id_02E9 endon( "faux_spawn" );
    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BA8 ) )
        playfxontagforclients( level._id_3575._id_3BA8, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BA8 ) )
        playfxontagforclients( level._id_3575._id_3BA8, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BA8 ) )
        playfxontagforclients( level._id_3575._id_3BA8, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BA8 ) )
        playfxontagforclients( level._id_3575._id_3BA8, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BA8 ) )
        playfxontagforclients( level._id_3575._id_3BA8, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BAE ) )
        playfxontagforclients( level._id_3575._id_3BAE, self, "TAG_THRUSTER_BTM", var_0 );

    wait 0.1;

    if ( isdefined( var_0 ) && isdefined( self ) && isdefined( level._id_3575._id_3BA8 ) )
        playfxontagforclients( level._id_3575._id_3BA8, self, "TAG_THRUSTER_BTM", var_0 );
}

_id_A203()
{
    self endon( "death" );
    self._id_02E9 endon( "faux_spawn" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 waittill( "spawned_player" );

        if ( isdefined( var_0 ) && var_0._id_04A8 == self._id_04A8 )
        {
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_0 );
        }
    }
}

_id_A22E()
{
    self endon( "death" );
    self._id_02E9 endon( "faux_spawn" );

    for (;;)
    {
        level waittill( "joined_team", var_0 );
        var_0 waittill( "spawned_player" );

        if ( isdefined( var_0 ) && var_0._id_04A8 == self._id_04A8 )
        {
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BAA, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_0 );
            wait 0.15;
            playfxontagforclients( level._id_3575._id_3BA7, self, "TAG_BEACON", var_0 );
        }
    }
}

_id_8D0D( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 thread _id_3553();
    var_0 thread _id_2424();

    if ( isdefined( var_0._id_04D8 ) )
    {
        if ( var_0._id_04D8 == "explosive_drone" )
            var_0 thread _id_1D03();
    }
}

_id_1D03()
{
    level endon( "game_ended" );
    level endon( "host_migration_begin" );
    self endon( "death" );
    self endon( "leaving" );
    var_0 = gettime();
    thread _id_14C2( var_0 );
}

_id_14C2( var_0 )
{
    level endon( "game_ended" );
    level endon( "host_migration_begin" );
    self endon( "death" );
    self endon( "leaving" );

    while ( gettime() - var_0 < 3000 )
        waittillframeend;

    if ( isdefined( self ) )
    {
        self notify( "exploding" );
        thread _id_14C4();
    }
}

_id_14C4()
{
    var_0 = undefined;

    if ( isdefined( self ) )
    {
        if ( isdefined( self._id_02E9 ) )
            var_0 = self._id_02E9;

        self _meth_809A( level._id_3575._id_889A );
        wait 0.5;
    }

    if ( isdefined( self ) )
    {
        self _meth_809A( "wpn_explosive_drone_exp" );
        var_1 = anglestoup( self._id_0041 );
        var_2 = anglestoforward( self._id_0041 );
        playfx( level._id_3575._id_3BAD, self._id_02E6, var_2, var_1 );

        if ( isdefined( var_0 ) )
            self _meth_81D5( self._id_02E6, 256, 130, 55, var_0, "MOD_EXPLOSIVE", "explosive_drone_mp" );
        else
            self _meth_81D5( self._id_02E6, 256, 130, 55, undefined, "MOD_EXPLOSIVE", "explosive_drone_mp" );

        self notify( "death" );
    }
}

_id_992E()
{
    if ( isdefined( self ) )
    {

    }

    wait 0.05;

    if ( isdefined( self ) )
    {

    }

    wait 0.15;

    if ( isdefined( self ) )
        return;
}

_id_3553()
{
    level endon( "game_ended" );
    level endon( "host_migration_begin" );
    self endon( "death" );
    self endon( "leaving" );
    self endon( "exploding" );

    if ( !isdefined( self._id_02E9 ) )
    {
        thread _id_355A();
        return;
    }

    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    self _meth_8283( self._id_3978, 10, 10 );
    self._id_6F66 = self._id_02E9;
    self._id_94B6 = undefined;

    for (;;)
    {
        if ( isdefined( self._id_8F6E ) && self._id_8F6E )
        {
            wait 0.5;
            continue;
        }

        if ( isdefined( self._id_02E9 ) && isalive( self._id_02E9 ) )
        {
            var_0 = self._id_5A54 * self._id_5A54;
            var_1 = var_0;

            if ( !isdefined( self._id_94B6 ) || self._id_94B6 == self._id_02E9 )
            {
                foreach ( var_3 in level._id_0328 )
                {
                    if ( isdefined( var_3 ) && isalive( var_3 ) && var_3 != self._id_02E9 && ( !level._id_91E4 || var_3._id_04A8 != self._id_04A8 ) && !var_3 _id_A75A::_id_05CB( "specialty_blindeye" ) )
                    {
                        var_4 = distancesquared( self._id_02E6, var_3._id_02E6 );

                        if ( var_4 < var_1 )
                        {
                            var_1 = var_4;
                            self._id_94B6 = var_3;
                            thread _id_A243( var_3 );
                        }
                    }
                }
            }

            if ( !isdefined( self._id_94B6 ) )
                thread _id_356F();

            if ( isdefined( self._id_94B6 ) )
                _id_355B( self._id_94B6 );

            if ( self._id_94B6 != self._id_6F66 )
            {
                _id_8EE9( self._id_6F66 );
                self._id_6F66 = self._id_94B6;
            }
        }

        wait 1;
    }
}

_id_A243( var_0 )
{
    var_0 _id_A4F0::_id_A060( "death", "disconnect", "faux_spawn", "joined_team" );

    if ( var_0._id_4FFF == 1 )
        thread _id_355A();
    else
        self._id_94B6 = undefined;
}

_id_355B( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    self notify( "explosiveDrone_moveToPlayer" );
    self endon( "explosiveDrone_moveToPlayer" );
    var_1 = 0;
    var_2 = 0;
    var_3 = 65;

    switch ( var_0 _meth_817C() )
    {
        case "stand":
            var_3 = 65;
            break;
        case "crouch":
            var_3 = 50;
            break;
        case "prone":
            var_3 = 22;
            break;
    }

    var_4 = ( var_2, var_1, var_3 );
    self _meth_83F9( var_0, var_4 );
    self._id_4EC1 = 1;
    thread _id_3562();
    thread _id_3567();
}

_id_355C()
{
    self _meth_825B( self._id_02E6, 1 );
    self._id_4EC1 = 0;
    self._id_4C0E = 1;
}

_id_3551( var_0 )
{
    _id_A75A::_id_4C3C();
    var_1 = var_0 _id_2400( 1, self._id_02E6, self._id_0041 );

    if ( !isdefined( var_1 ) )
    {
        _id_A75A::_id_2760();
        return 0;
    }

    if ( !isdefined( var_0._id_3569 ) )
        var_0._id_3569 = [];

    var_0._id_3569[var_0._id_3569.size] = var_1;
    var_0 thread _id_8D0D( var_1 );

    if ( isdefined( level._id_3575._id_3BAF ) )
    {

    }

    _id_739F();
    return 1;
}

_id_3559()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );

    if ( !isdefined( self._id_02E9 ) )
    {
        thread _id_355A();
        return;
    }

    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "joined_team" );
    self._id_02E9 endon( "joined_spectators" );
    self._id_54FE = spawn( "script_model", self._id_02E6 );
    self._id_54FE _meth_80B1( "tag_laser" );

    for (;;)
    {
        if ( isdefined( self._id_94B6 ) )
        {
            self._id_54FE._id_02E6 = self _meth_8180( "tag_weapon" );
            var_0 = 20;
            var_1 = ( randomfloat( var_0 ), randomfloat( var_0 ), randomfloat( var_0 ) ) - ( 10, 10, 10 );
            var_2 = 65;

            switch ( self._id_94B6 _meth_817C() )
            {
                case "stand":
                    var_2 = 65;
                    break;
                case "crouch":
                    var_2 = 50;
                    break;
                case "prone":
                    var_2 = 22;
                    break;
            }

            self._id_54FE._id_0041 = vectortoangles( self._id_94B6._id_02E6 + ( 0, 0, var_2 - 20 ) + var_1 - self._id_02E6 );
        }

        if ( isdefined( self._id_8F6E ) && self._id_8F6E )
        {
            wait 0.5;
            continue;
        }

        var_3 = undefined;

        if ( isdefined( self._id_94B6 ) )
        {
            var_4 = bullettrace( self._id_02E6, self._id_94B6._id_02E6, 1, self );
            var_3 = var_4["entity"];
        }

        if ( isdefined( self._id_94B6 ) && self._id_94B6 != self._id_02E9 && isdefined( var_3 ) && var_3 == self._id_94B6 && distancesquared( self._id_02E6, self._id_94B6._id_02E6 ) < self._id_5A3A * self._id_5A3A )
        {
            if ( self._id_94B6._id_4FFF == 0 )
                _id_8D19( self._id_94B6 );
        }
        else if ( isdefined( self._id_94B6 ) && self._id_94B6._id_4FFF == 1 )
            _id_8EE9( self._id_94B6 );

        wait 0.05;
    }
}

_id_8D19( var_0 )
{
    self._id_54FE _meth_80B2( "explosive_drone_laser" );
    playfxontag( level._id_3575._id_3BAB, self._id_54FE, "tag_laser" );

    if ( isdefined( level._id_3575._id_889A ) )
        self _meth_809A( level._id_3575._id_889A );

    var_0 _meth_82A6( "specialty_radararrow", 1, 0 );

    if ( var_0._id_4FFF == 0 )
    {
        var_0._id_4FFF = 1;
        var_0._id_94B5 = self._id_02E9;
    }
}

_id_8EE9( var_0 )
{
    if ( isdefined( self._id_54FE ) )
    {
        self._id_54FE _meth_80B3();
        stopfxontag( level._id_3575._id_3BAB, self._id_54FE, "tag_laser" );
    }

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( level._id_3575._id_889A ) )
            self _meth_80AB();

        if ( var_0 _meth_82A7( "specialty_radararrow", 1 ) )
            var_0 _meth_82A9( "specialty_radararrow", 1 );

        var_0 notify( "player_not_tracked" );
        var_0._id_4FFF = 0;
        var_0._id_94B5 = undefined;
    }
}

_id_64A8()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_4FFF = 0;

        foreach ( var_0 in level._id_0328 )
        {
            if ( !isdefined( var_0._id_4FFF ) )
                var_0._id_4FFF = 0;
        }
    }
}

_id_3562()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    self notify( "explosiveDrone_watchForGoal" );
    self endon( "explosiveDrone_watchForGoal" );
    var_0 = _id_A4F0::_id_A067( "goal", "near_goal", "hit_goal" );
    self._id_4EC1 = 0;
    self._id_4C0E = 0;
    self notify( "hit_goal" );
}

_id_3560()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self waittill( "death" );
    thread _id_356E();
}

_id_3568()
{
    level endon( "game_ended" );
    level endon( "host_migration_begin" );
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    var_0 = level._id_3576;

    if ( self._id_04D8 == "explosive_drone" )
        var_0 = level._id_3576;

    wait(var_0);
    thread _id_355A();
}

_id_3565()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 _id_A4F0::_id_A060( "disconnect", "joined_team", "joined_spectators" );
    self notify( "owner_gone" );
    thread _id_355A();
}

_id_3564()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );

    for (;;)
    {
        self._id_02E9 waittill( "death" );
        thread _id_355A();
    }
}

_id_3567()
{
    level endon( "game_ended" );
    level endon( "host_migration_begin" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    self notify( "explosiveDrone_watchTargetDisconnect" );
    self endon( "explosiveDrone_watchTargetDisconnect" );
    self._id_94B6 waittill( "disconnect" );
    _id_8EE9( self._id_94B6 );
    _id_355B( self._id_02E9 );
}

_id_3566()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    level _id_A4F0::_id_A060( "round_end_finished", "game_ended" );
    thread _id_355A();
}

_id_3563()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    level waittill( "host_migration_begin" );
    _id_8EE9( self._id_94B6 );
    _id_A79A::_id_A0D4();
    thread _id_3551( self._id_02E9 );
}

_id_355A()
{
    self endon( "death" );
    self notify( "leaving" );
    _id_8EE9( self._id_94B6 );
    _id_356F();
}

_id_64A7( var_0, var_1, var_2, var_3 )
{
    self notify( "death" );
}

_id_3558()
{
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    level endon( "game_ended" );
    self._id_8F6E = 0;

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        thread _id_3557();
    }
}

_id_3561()
{
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        thread _id_355F();
    }
}

_id_3557()
{
    self notify( "explosiveDrone_stunned" );
    self endon( "explosiveDrone_stunned" );
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    level endon( "game_ended" );
    _id_3555();
    wait 10.0;
    _id_3556();
}

_id_355F()
{
    self notify( "explosiveDrone_stunned" );
    self endon( "explosiveDrone_stunned" );
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    level endon( "game_ended" );
    _id_355D();
    wait 10.0;
    _id_355E();
}

_id_3555()
{
    if ( self._id_8F6E )
        return;

    self._id_8F6E = 1;

    if ( isdefined( level._id_3575._id_3BAF ) )
        playfxontag( level._id_3575._id_3BAF, self, "TAG_BEACON" );
}

_id_355D()
{
    if ( self._id_8F6E )
        return;

    self._id_8F6E = 1;

    if ( isdefined( level._id_3575._id_3BAF ) )
        playfxontag( level._id_3575._id_3BAF, self, "TAG_BEACON" );

    thread _id_8EE9( self._id_94B6 );
    self._id_94B6 = undefined;
    self._id_6F66 = self._id_02E9;
    thread _id_355C();
}

_id_3556()
{
    if ( isdefined( level._id_3575._id_3BAF ) )
        killfxontag( level._id_3575._id_3BAF, self, "TAG_BEACON" );

    self._id_8F6E = 0;
    self._id_4C0E = 0;
}

_id_355E()
{
    if ( isdefined( level._id_3575._id_3BAF ) )
        killfxontag( level._id_3575._id_3BAF, self, "TAG_BEACON" );

    self._id_8F6E = 0;
    self._id_4C0E = 0;
}

_id_356E()
{
    if ( !isdefined( self ) )
        return;

    _id_8EE9( self._id_94B6 );
    _id_355E();
    _id_356F();
}

_id_356F()
{
    if ( isdefined( level._id_3575._id_3BA9 ) )
        playfx( level._id_3575._id_3BA9, self._id_02E6 );

    if ( isdefined( level._id_3575._id_8898 ) )
        self _meth_809A( level._id_3575._id_8898 );

    self notify( "exploding" );
    _id_739F();
}

_id_2850()
{
    if ( isdefined( self._id_0E54 ) )
        missile_deleteattractor( self._id_0E54 );

    _id_73B3();
    self delete();
}

_id_739F()
{
    _id_A75A::_id_2760();

    if ( isdefined( self._id_02E9 ) && isdefined( self._id_02E9._id_3550 ) )
        self._id_02E9._id_3550 = undefined;

    _id_2850();
}

_id_084A()
{
    level._id_3574[self _meth_81B1()] = self;
}

_id_73A5()
{
    var_0 = self _meth_81B1();
    self waittill( "death" );
    level._id_3574[var_0] = undefined;
    level._id_3574 = _id_A4F0::_id_0D01( level._id_3574 );
}

_id_33E0()
{
    if ( isdefined( level._id_3574 ) && level._id_3574.size >= _id_A75A::_id_5A56() )
        return 1;
    else
        return 0;
}

_id_3573()
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "faux_spawn" );
    wait 3;

    if ( isdefined( self ) && isdefined( self._id_3550 ) )
    {
        var_0 = self._id_3550 _meth_8180( "TAG_BEACON" ) - self _meth_8180( "TAG_BEACON" ) + ( 0, 0, 10 );

        if ( level._id_91E4 )
            _id_A72D::_id_8022( self._id_02E9._id_04A8, var_0, "TAG_BEACON" );
        else
            _id_A72D::_id_7FDF( self._id_02E9, var_0, "TAG_BEACON" );

        var_1 = spawn( "trigger_radius", self._id_02E6 + ( 0, 0, -96 ), 0, 192, 192 );
        var_1._id_02E9 = self;
        thread _id_356D( var_1 );
        thread _id_A21F( var_1 );
        var_2 = undefined;

        while ( isdefined( self ) && isdefined( self._id_3550 ) )
        {
            var_1 waittill( "trigger", var_2 );

            if ( !isdefined( var_2 ) )
            {
                wait 0.1;
                continue;
            }

            if ( var_2 _id_A75A::_id_05CB( "specialty_blindeye" ) )
            {
                wait 0.1;
                continue;
            }

            if ( isdefined( self._id_3550 ) && !var_2 _meth_81D8( self._id_3550 _meth_8180( "TAG_BEACON" ), self._id_3550 ) )
            {
                wait 0.1;
                continue;
            }

            if ( isdefined( self._id_3550 ) )
            {
                var_3 = self._id_3550 _meth_8180( "TAG_BEACON" );
                var_4 = var_2 _meth_80A8();

                if ( !bullettracepassed( var_3, var_4, 0, self._id_3550 ) )
                {
                    wait 0.1;
                    continue;
                }
            }

            if ( _id_A75A::_id_5186( var_2 ) && var_2 != self._id_02E9 && ( !level._id_91E4 || var_2._id_04A8 != self._id_02E9._id_04A8 ) && !self._id_8F6E )
                var_2 _id_98A7( self );
        }
    }
}

_id_356D( var_0 )
{
    _id_A4F0::_id_A060( "mine_triggered", "mine_destroyed", "mine_selfdestruct", "death" );

    if ( isdefined( self._id_3316 ) )
    {
        self notify( "kill_entity_headicon_thread" );
        self._id_3316 _meth_8088();
    }

    var_0 delete();
}

_id_84FF( var_0 )
{
    var_1 = spawnfx( level._id_3575._id_2CF1, var_0._id_02E6 );
    triggerfx( var_1 );
    self waittill( "death" );
    var_1 delete();
}

_id_31B8()
{
    self._id_02E9 _id_A4F0::_id_A060( "spawned_player", "faux_spawn", "delete_explosive_drones" );
    _id_3579();
}

_id_5EC5()
{
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "faux_spawn" );
    _id_A4F0::_id_A060( "mine_selfdestruct" );
    _id_3579();
}

_id_5E6B()
{
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "faux_spawn" );

    while ( isdefined( self._id_3550 ) )
        wait 0.15;

    if ( isdefined( self ) )
    {
        self _meth_809A( "wpn_explosive_drone_exp" );
        var_0 = anglestoup( self._id_0041 );
        var_1 = anglestoforward( self._id_0041 );
        playfx( level._id_3575._id_3BAD, self._id_02E6, var_1, var_0 );
        self _meth_81D5( self._id_02E6, 256, 130, 55, self._id_02E9, "MOD_EXPLOSIVE", "explosive_drone_mp" );
        self notify( "death" );
    }

    _id_3579();
}

_id_8D14()
{
    self endon( "death" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    var_0 = 0.6;

    while ( isdefined( self._id_3550 ) )
    {
        foreach ( var_2 in level._id_0328 )
        {
            if ( isdefined( var_2 ) && issentient( var_2 ) && var_2._id_04A8 == self._id_04A8 && isdefined( self._id_3550 ) )
                thread _id_3B9F( level._id_3575._id_3BAA, self._id_3550, "TAG_BEACON", var_2 );

            if ( isdefined( var_2 ) && issentient( var_2 ) && var_2._id_04A8 != self._id_04A8 && isdefined( self._id_3550 ) )
                thread _id_3B9F( level._id_3575._id_3BA7, self._id_3550, "TAG_BEACON", var_2 );
        }

        wait(var_0);
    }
}

_id_3B9F( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 <= 4 && isdefined( var_1 ); var_4++ )
    {
        if ( isdefined( var_3 ) && isdefined( var_1 ) && isdefined( self._id_8F6E ) && !self._id_8F6E )
        {
            playfxontagforclients( var_0, var_1, var_2, var_3 );
            wait 0.15;
        }
    }
}

_id_A221()
{
    self endon( "death" );
    self._id_02E9 endon( "death" );
    self._id_02E9 endon( "disconnect" );
    var_0 = undefined;
    var_0 = _id_A4F0::_id_A069( "missile_stuck", "mp_exo_repulsor_repel" );

    while ( !isdefined( self._id_3550 ) )
        waittillframeend;

    if ( isdefined( var_0[1] ) )
    {
        var_1 = var_0[1]._id_7ADA;

        if ( var_0[1]._id_00AB == "script_model" && !( isdefined( var_1 ) && var_1 == 1 ) )
        {
            self _meth_809A( "wpn_explosive_drone_exp" );
            var_2 = anglestoup( self._id_0041 );
            var_3 = anglestoforward( self._id_0041 );
            playfx( level._id_3575._id_3BAD, self._id_02E6, var_3, var_2 );
            self _meth_81D5( self._id_02E6, 256, 130, 55, self._id_02E9, "MOD_EXPLOSIVE", "explosive_drone_mp" );
            thread _id_3579();
        }
    }

    if ( isdefined( self ) )
    {
        self._id_3550 _meth_80BE( self._id_3550._id_63C4 );
        thread _id_3573();
        thread _id_31B8();
        thread _id_3558();
        thread _id_8D14();
        thread _id_A783::_id_7F5F( 100, undefined, ::_id_3579, undefined, 0 );
        self._id_3550 thread _id_A783::_id_7F5F( 100, undefined, ::_id_357A, undefined, 0 );
        thread _id_A7B4::_id_8E2E( "mine_selfdestruct" );
    }
}

_id_2424()
{
    var_0 = ( 0, 0, 0 );
    self._id_534A = spawn( "script_model", self._id_02E6 );
    self._id_534A _meth_834D( "explosive" );
    self._id_534A _meth_804D( self, "TAG_THRUSTER_BTM", var_0, ( 0, 0, 0 ) );
    self._id_534A _meth_80BE( 0 );
    self._id_534A._id_8D3B = gettime();
}

_id_73B3()
{
    if ( isdefined( self._id_534A ) )
        self._id_534A delete();
}

_id_A21F( var_0 )
{
    self._id_02E9 endon( "disconnect" );
    self._id_02E9 endon( "faux_spawn" );
    level endon( "game_ended" );
    self endon( "death" );
    self._id_02E9 endon( "death" );
    self._id_3550 _meth_80BF();
    self._id_3550 _meth_80DB( &"MP_PICKUP_EXPLOSIVE_DRONE" );
    self._id_3550 _meth_849B( 1 );
    var_1 = getdvarfloat( "player_useRadius", 128 );
    var_1 *= var_1;

    for (;;)
    {
        if ( !isdefined( self ) || !isdefined( var_0 ) )
            break;

        var_2 = isdefined( self._id_3550 ) && distancesquared( self._id_02E9 _meth_80A8(), self._id_3550._id_02E6 ) <= var_1;

        if ( self._id_02E9 _meth_80A9( var_0 ) && var_2 )
        {
            var_3 = 0;

            while ( self._id_02E9 _meth_833C() )
            {
                if ( !_id_A75A::_id_5186( self._id_02E9 ) )
                    break;

                if ( !self._id_02E9 _meth_80A9( var_0 ) )
                    break;

                if ( self._id_02E9 _meth_82EE() || self._id_02E9 _meth_82EF() || isdefined( self._id_02E9._id_9337 ) )
                    break;

                if ( self._id_02E9 _meth_8342() || self._id_02E9 _id_A75A::_id_51E0() )
                    break;

                if ( isdefined( self._id_02E9._id_50D4 ) && self._id_02E9._id_50D4 )
                    break;

                if ( isdefined( self._id_02E9._id_3086 ) && self._id_02E9._id_3086 )
                    break;

                if ( isdefined( self._id_02E9._id_9C1E ) && self._id_02E9._id_9C1E )
                    break;

                var_3 += 0.05;

                if ( var_3 > 0.75 )
                {
                    self._id_02E9 _meth_82F7( self._id_A2D6, self._id_02E9 _meth_82F9( self._id_A2D6 ) + 1 );
                    self._id_3550 _id_2850();
                    self delete();
                    break;
                }

                waittillframeend;
            }
        }

        waittillframeend;
    }
}
