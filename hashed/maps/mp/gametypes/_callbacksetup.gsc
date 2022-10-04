// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

CodeCallback_StartGameType()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    if ( !isdefined( level._id_3C01 ) || !level._id_3C01 )
    {
        [[ level._id_1A05 ]]();
        level._id_3C01 = 1;
    }
}

CodeCallback_PlayerConnect()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self endon( "disconnect" );
    [[ level._id_19FD ]]();
}

CodeCallback_PlayerDisconnect( var_0 )
{
    self notify( "disconnect" );
    [[ level._id_19FF ]]( var_0 );
}

CodeCallback_PlayerDamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self endon( "disconnect" );
    [[ level._id_19FE ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

CodeCallback_PlayerKilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level._id_1A01 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

CodeCallback_PlayerGrenadeSuicide( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "disconnect" );
    [[ level._id_1A00 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

CodeCallback_EntityOutOfWorld()
{
    self endon( "disconnect" );
    [[ level._id_19FB ]]();
}

CodeCallback_BulletHitEntity( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "disconnect" );

    if ( isdefined( self._id_18AC ) )
        [[ self._id_18AC ]]( var_0, var_1, var_2, var_3, var_4, var_5 );
}

CodeCallback_VehicleDamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self._id_258D ) )
        self [[ self._id_258D ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    else
        self vehicle_finishdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

CodeCallback_EntityDamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self._id_258D ) )
        self [[ self._id_258D ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    else
        self finishentitydamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

CodeCallback_CodeEndGame()
{
    self endon( "disconnect" );
    [[ level._id_19FA ]]();
}

CodeCallback_PlayerLastStand( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    [[ level._id_1A02 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

CodeCallback_PlayerMigrated()
{
    self endon( "disconnect" );
    [[ level._id_1A03 ]]();
}

CodeCallback_HostMigration()
{
    [[ level._id_19FC ]]();
}

CodeCallback_GiveKillstreak( var_0, var_1 )
{
    if ( isbot( var_0 ) || istestclient( var_0 ) || var_0._id_04A8 == "spectator" || var_0._id_03BC == "spectator" )
        return;

    if ( isdefined( level._id_5398[var_1] ) && tablelookup( "mp/killstreakTable.csv", 1, var_1, 0 ) != "" || issubstr( var_1, "turrethead" ) )
    {
        if ( issubstr( var_1, "turrethead" ) )
            var_0 thread _id_A7CE::_id_6CAF( var_1 );
        else
        {
            var_2 = var_0 _id_A7C3::_id_40F4( var_1 );
            var_3 = var_0 _id_A7C3::_id_3FEF( var_0, var_1 );
            var_4 = var_0 _id_A7C3::getnextkillstreakslotindex( var_1 );
            var_0 thread _id_A79C::_id_53A6( var_1, var_2, undefined, var_3, var_4 );
            var_0 _id_A7C3::_id_41EB( var_1 );
        }
    }
}

codecallback_givekillstreakmodule( var_0, var_1 )
{
    if ( isbot( var_0 ) || istestclient( var_0 ) || var_0._id_04A8 == "spectator" || var_0._id_03BC == "spectator" )
        return;

    var_2 = _id_A7C3::_id_40F6( var_1 );

    if ( isdefined( var_2 ) && var_2 != "" )
    {
        if ( !isdefined( var_0._id_539D[var_1] ) )
        {
            var_3 = _id_A7C3::_id_40F7( var_1 );
            var_0._id_539D[var_1] = var_3;
        }
        else
            var_0._id_539D[var_1] = undefined;
    }
}

CodeCallback_PartyMembers( var_0 )
{
    if ( isdefined( level._id_66A6 ) )
        [[ level._id_66A6 ]]( var_0 );
}

SetupDamageFlags()
{
    level._id_4B5A = 1;
    level._id_4B54 = 2;
    level._id_4B55 = 4;
    level._id_4B59 = 8;
    level._id_4B5E = 16;
    level._id_4B5B = 32;
    level._id_4B5C = 64;
    level._id_4B5D = 128;
    level._id_4B57 = 256;
    level._id_4B56 = 512;
    level._id_4B58 = 1024;
}

SetupCallbacks()
{
    SetDefaultCallbacks();
    SetupDamageFlags();
}

SetDefaultCallbacks()
{
    level._id_1A05 = _id_A789::_id_19F9;
    level._id_19FD = _id_A7A7::_id_19F0;
    level._id_19FF = _id_A7A7::_id_19F3;
    level._id_19FE = _id_A783::_id_19F1;
    level._id_1A01 = _id_A783::_id_19F5;
    level._id_19FB = _id_A783::_id_19ED;
    level._id_1A00 = _id_A783::_id_19F4;
    level._id_19FA = _id_A789::_id_19EC;
    level._id_1A02 = _id_A783::_id_19F6;
    level._id_1A03 = _id_A7A7::_id_19F8;
    level._id_19FC = _id_A79A::_id_19EE;
}

AbortLevel()
{
    level._id_1A05 = ::callbackVoid;
    level._id_19FD = ::callbackVoid;
    level._id_19FF = ::callbackVoid;
    level._id_19FE = ::callbackVoid;
    level._id_1A01 = ::callbackVoid;
    level._id_19FB = ::callbackVoid;
    level._id_1A00 = ::callbackVoid;
    level._id_19FA = ::callbackVoid;
    level._id_1A02 = ::callbackVoid;
    level._id_1A03 = ::callbackVoid;
    level._id_19FC = ::callbackVoid;
    setdvar( "g_gametype", "dm" );
    exitlevel( 0 );
}

callbackVoid()
{

}
