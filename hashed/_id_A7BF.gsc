// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_2F0A( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 50;

    var_1 = 75;
    var_2 = 23;
    var_3 = var_2 * 2;
    var_4 = self._id_02E6 + ( 0, 0, var_0 );
    var_5 = self _meth_833B();
    var_6 = anglestoforward( _id_A4F0::_id_38C6( var_5 ) );
    var_7 = var_4 + var_6 * var_1;
    var_8 = var_7;
    var_9 = self._id_0041;
    var_10 = 1;
    var_11 = _id_40CE( var_8 + ( 0, 0, -30 ) );

    if ( isdefined( var_11 ) && var_11 > 0 )
    {
        var_8 += ( 0, 0, var_11 );
        var_4 += ( 0, 0, var_11 );
    }
    else if ( !isdefined( var_11 ) )
        var_10 = 0;

    if ( var_10 && !sighttracepassed( var_4, var_7, 1, self ) )
        var_10 = 0;

    if ( var_10 )
    {
        var_12 = bullettrace( var_4, var_7, 1, self, 1, 0, 1, 1, 1 );

        if ( var_12["fraction"] < 1 )
            var_10 = 0;
    }

    if ( var_10 )
    {
        var_13 = var_4 + ( 0, 0, var_3 * -0.5 );
        var_7 += ( 0, 0, var_3 * -0.5 );
        var_12 = self _meth_83E5( var_13, var_7, var_2, var_3, 0, 1 );

        if ( var_12["fraction"] < 1 )
            var_10 = 0;
    }

    var_14 = spawnstruct();
    var_14._id_6862 = var_10;
    var_14._id_02E6 = var_8;
    var_14._id_0041 = var_9;
    return var_14;
}

_id_40CE( var_0 )
{
    var_1 = getentarray( "trigger_underwater", "targetname" );

    if ( var_1.size == 0 )
        return 0;

    var_2 = 200;
    var_3 = 0;
    var_4 = spawn( "script_origin", var_0 );
    var_5 = 0;

    while ( var_3 < var_2 )
    {
        if ( _id_9405( var_4, var_1 ) )
        {
            var_3 += 10;
            var_4._id_02E6 += ( 0, 0, 10 );
            continue;
        }

        break;
    }

    var_4 delete();

    if ( var_3 >= var_2 )
        return undefined;
    else
        return var_3;
}

_id_9405( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( var_0 _meth_80A9( var_3 ) )
            return 1;
    }

    return 0;
}

_id_2EF4( var_0 )
{
    level._id_99E7[var_0] = self;
}

_id_2F17( var_0 )
{
    level._id_99E7[var_0] = undefined;
}

_id_2F0F()
{

}

_id_2F27( var_0, var_1 )
{
    var_0 endon( "death" );
    _id_2F0F();
    var_0._id_1FC7 = 0;
    var_0._id_1FBB = 0;
    _id_2EFE( var_0, 1, 1 );
    _id_A7C3::_id_6D85();

    if ( isdefined( var_1 ) && var_1 )
    {
        thread _id_2F14( var_0 );
        self _meth_82FB( "ui_drone_cloak", 2 );
        var_2 = 10000;
        var_3 = gettime() + var_2;
        self _meth_82FB( "ui_drone_cloak_time", var_3 );
        var_0._id_1FBB = 5;
        thread _id_1FBB( var_0 );
        thread _id_2F00( var_0 );
    }
    else
    {
        var_0 _meth_809A( "recon_drn_cloak_deactivate" );
        _id_2EFE( var_0, 0 );
    }
}

_id_2F10( var_0 )
{
    return var_0._id_4721 && var_0._id_1FC7 >= 0;
}

_id_2EFF( var_0, var_1 )
{
    var_0 endon( "death" );

    if ( isdefined( var_1 ) && var_1 )
    {
        thread _id_2EFC( var_0 );
        self waittill( "CloakCharged" );
    }

    for (;;)
    {
        self _meth_82FB( "ui_drone_cloak", 1 );
        thread _id_2EFB( var_0 );
        thread _id_2EFC( var_0 );

        if ( var_0._id_1FBB != 0 )
        {
            self _meth_82FB( "ui_drone_cloak", 3 );
            wait(var_0._id_1FBB);
        }

        if ( var_0._id_4721 )
            self _meth_82FB( "ui_drone_cloak", 1 );

        var_0 waittill( "Cloak" );
        var_0 notify( "ActivateCloak" );
        var_0 _meth_809A( "recon_drn_cloak_activate" );
        self waittill( "CloakCharged" );
    }
}

_id_2EFB( var_0 )
{
    var_0 endon( "death" );
    var_0 waittill( "ActivateCloak" );
    thread _id_2EFE( var_0, 1 );
    thread _id_2F14( var_0 );
    var_1 = 10000;
    var_2 = gettime() + var_1;
    self _meth_82FB( "ui_drone_cloak_time", var_2 );
    self _meth_82FB( "ui_drone_cloak", 2 );
    var_0._id_1FBB = 5;
    thread _id_1FBB( var_0 );
    thread _id_2F00( var_0 );
}

_id_2EFC( var_0 )
{
    var_0 endon( "death" );
    self waittill( "UnCloak" );
    var_0 _meth_809A( "recon_drn_cloak_deactivate" );
    thread _id_2EFE( var_0, 0 );
    self _meth_82FB( "ui_drone_cloak", 3 );
    thread _id_2EFD( var_0 );
}

_id_1FBB( var_0 )
{
    var_0 endon( "death" );
    self waittill( "UnCloak" );

    while ( var_0._id_1FBB > 0 )
    {
        var_0._id_1FBB -= 0.5;
        wait 0.5;
    }

    var_0._id_1FBB = 0;
    self notify( "CloakCharged" );
}

_id_2F00( var_0 )
{
    var_0 endon( "death" );
    var_1 = gettime();
    _id_A4F0::_id_A06B( 10, "ForceUncloak", "Cloak" );
    var_2 = gettime();
    var_3 = max( var_2 - var_1, 5000 );
    var_0._id_1FBB = var_3 / 1000;
    var_4 = gettime() + var_3;
    self _meth_82FB( "ui_drone_cloak_cooldown", var_4 );
    self notify( "UnCloak" );
}

_id_2EFE( var_0, var_1, var_2 )
{
    var_0 notify( "cloaking_transition" );
    var_0 endon( "cloaking_transition" );
    var_0 endon( "death" );

    if ( var_1 )
    {
        if ( var_0._id_1FC7 == -2 )
            return;

        var_0._id_1FC7 = -1;
        var_0 _meth_844B();

        if ( isdefined( var_0._id_5BD2 ) )
            var_0._id_5BD2 _meth_844B();

        var_0 _meth_848F( 0 );

        if ( !isdefined( var_2 ) || !var_2 )
            wait 2.2;
        else
            wait 1.5;

        var_0 _meth_8053();

        if ( isdefined( var_0._id_5BD2 ) )
            var_0._id_5BD2 _meth_8053();

        var_0._id_1FC7 = -2;
    }
    else
    {
        if ( var_0._id_1FC7 == 2 )
            return;

        var_0._id_1FC7 = 1;
        var_0 _meth_844C();
        var_0 _meth_848F( 1 );

        if ( isdefined( var_0._id_5BD2 ) )
            var_0._id_5BD2 _meth_844C();

        wait 2.2;
        var_0._id_1FC7 = 2;
    }
}

_id_2EFD( var_0 )
{
    var_0 endon( "death" );
    self endon( "CloakCharged" );

    for (;;)
    {
        self waittill( "Cloak" );
        self _meth_82F4( "recon_drn_cloak_notready" );
        wait 1;
    }
}

_id_2F14( var_0 )
{
    var_0 endon( "death" );
    self endon( "UnCloak" );
    wait 1;
    var_0 waittill( "damage" );
    self notify( "ForceUncloak" );
}

_id_9B62( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    var_0 endon( "stopShootLocationUpdate" );
    var_0._id_91C2 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0._id_91C2 _meth_80B1( "tag_origin" );
    var_0._id_91C2._id_0041 = ( -90, 0, 0 );

    if ( isdefined( var_0._id_5BD2 ) && ( !isdefined( var_2 ) || !var_2 ) )
    {
        var_0._id_5BD2 _meth_8106( var_0._id_91C2 );
        var_0._id_5BD2 _meth_8508( var_0._id_91C2 );
    }
    else
        var_0 _meth_8383( var_0._id_91C2 );

    thread _id_0565( var_0, var_1 );

    if ( isdefined( var_1 ) )
    {
        playfxontagforclients( var_1, var_0._id_91C2, "tag_origin", self );
        var_0 thread _id_8523( var_1 );
    }

    if ( isdefined( var_0._id_4714 ) && var_0._id_4714 )
        return;

    for (;;)
    {
        var_3 = self _meth_845C();
        var_4 = self _meth_833B();
        var_5 = anglestoforward( var_4 );
        var_6 = var_3 + var_5 * 8000;
        var_7 = bullettrace( var_3, var_6, 0, var_0 );
        var_0._id_91C2._id_02E6 = var_7["position"];
        waittillframeend;
    }
}

_id_8523( var_0 )
{
    self endon( "death" );
    self endon( "end_remote" );

    if ( !level._id_46C7 )
    {
        foreach ( var_2 in level._id_0328 )
        {
            if ( self._id_02E9 _id_A75A::_id_50F9( var_2 ) )
            {
                waittillframeend;
                playfxontagforclients( var_0, self._id_91C2, "tag_origin", var_2 );
            }
        }
    }
}

_id_0565( var_0, var_1 )
{
    var_0 _id_A4F0::_id_A060( "death", "stopShootLocationUpdate" );

    if ( isdefined( var_0._id_91C2 ) )
    {
        var_2 = var_0._id_91C2;

        if ( isdefined( var_1 ) )
            stopfxontag( var_1, var_2, "tag_origin" );

        waittillframeend;
        var_2 delete();
    }
}

_id_6CB7( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    playfxontag( _id_A4F0::_id_3FA6( var_1 ), var_0, var_2 );
    thread _id_6C84( var_0, var_1, var_2 );

    if ( !var_0._id_4721 )
        return;

    for (;;)
    {
        self waittill( "Cloak" );
        stopfxontag( _id_A4F0::_id_3FA6( var_1 ), var_0, var_2 );
        waittillframeend;
        playfxontagforclients( _id_A4F0::_id_3FA6( var_1 ), var_0, var_2, self );
        self waittill( "UnCloak" );
        stopfxontag( _id_A4F0::_id_3FA6( var_1 ), var_0, var_2 );
        waittillframeend;
        playfxontag( _id_A4F0::_id_3FA6( var_1 ), var_0, var_2 );
    }
}

_id_6C84( var_0, var_1, var_2 )
{
    var_0 waittill( "death" );
    killfxontag( _id_A4F0::_id_3FA6( var_1 ), var_0, var_2 );
}

_id_7F56( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "death" );
    wait(var_0);

    if ( isdefined( level._id_2F3B ) )
        self _meth_847A( level._id_2F3B, 0 );

    if ( isdefined( level._id_2F12 ) )
        self _meth_83C0( level._id_2F12 );
}

_id_739C( var_0 )
{
    self _meth_847A( "", var_0 );
    self _meth_83C0( "" );
}

playerwatchfordroneemp( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    self endon( "assaultDroneHunterKiller" );
    var_0 waittill( "emp_damage" );
    var_0 notify( "death" );
}
