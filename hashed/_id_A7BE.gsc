// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_1B8F = spawnstruct();
    level._id_1B8F._id_01E7 = 999999;
    level._id_1B8F._id_0275 = 200;
    level._id_1B8F._id_3BA9 = loadfx( "vfx/explosion/tracking_drone_explosion" );
    level._id_1B8F._id_8898 = "veh_tracking_drone_explode";
    level._id_1B8F._id_730D = &"KILLSTREAKS_DRONE_CAREPACKAGE_RELEASE";
    level._id_1B99 = [];
}

_id_82FC( var_0, var_1 )
{
    var_0 _id_A4F0::_id_5920( self._id_04A8 );
    var_0 _meth_83F3( 1 );
    var_0 _id_0847();
    var_0 thread _id_73A3();
    var_0._id_01E7 = level._id_1B8F._id_01E7;
    var_0._id_0275 = level._id_1B8F._id_0275;
    var_0._id_0102 = 0;
    var_0._id_03E3 = 15;
    var_0._id_3978 = 15;
    var_0._id_02E9 = self;
    var_0._id_04A8 = self._id_04A8;
    var_0 _meth_8283( var_0._id_03E3, 10, 10 );
    var_0 _meth_8292( 120, 90 );
    var_0 _meth_825A( 64 );
    var_0 _meth_8253( 4, 5, 5 );
    var_0._id_3B88 = "tag_body";

    if ( var_1 )
    {
        var_0._id_9BC7 = spawn( "script_model", var_0._id_02E6 + ( 0, 0, 1 ) );
        var_0._id_9BC7 _meth_80B1( "tag_origin" );
        var_0._id_9BC7._id_02E9 = self;
        var_0._id_9BC7 _id_A75A::_id_5940( "killstreakRemote", level._id_1B8F._id_730D, self );
    }

    var_2 = 45;
    var_3 = 45;
    var_0 _meth_8294( var_2, var_3 );
    var_4 = 10000;
    var_5 = 150;
    var_0._id_0E54 = missile_createattractorent( var_0, var_4, var_5 );
    var_0._id_8F6E = 0;
    var_0 thread _id_1B95();
    var_0 thread _id_1B96();
    var_0 thread _id_1B97();
}

_id_1B91()
{
    self endon( "death" );
    var_0 = self._id_02E9;
    self._id_9BC7 waittill( "trigger" );
    _id_1B90();
}

_id_1B95()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    _id_1B93();
}

_id_1B96()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 _id_A4F0::_id_A060( "disconnect", "joined_team", "joined_spectators" );
    self notify( "owner_gone" );
    thread _id_1B93();
}

_id_1B97()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self._id_02E9 endon( "disconnect" );
    self endon( "owner_gone" );
    level _id_A4F0::_id_A060( "round_end_finished", "game_ended" );
    thread _id_1B93();
}

_id_1B93()
{
    self endon( "death" );
    self notify( "leaving" );
    _id_1B92();
}

_id_1B92()
{
    if ( isdefined( level._id_1B8F._id_3BA9 ) )
        playfx( level._id_1B8F._id_3BA9, self._id_02E6 );

    if ( isdefined( level._id_1B8F._id_8898 ) )
        self _meth_809A( level._id_1B8F._id_8898 );

    if ( isdefined( self._id_9BC7 ) )
    {
        self._id_9BC7 _id_A75A::_id_593F();
        self._id_9BC7 delete();
    }

    self notify( "explode" );
    _id_1B94();
}

_id_1B90()
{
    if ( isdefined( self._id_9BC7 ) )
    {
        self._id_9BC7 _id_A75A::_id_593F();
        self._id_9BC7 delete();
    }

    self notify( "explode" );
    _id_1B94();
}

_id_1B94()
{
    _id_A75A::_id_2760();
    self delete();
}

_id_0847()
{
    level._id_1B99[level._id_1B99.size] = self;
}

_id_73A3()
{
    var_0 = self _meth_81B1();
    self waittill( "death" );
    level._id_1B99 = _id_A4F0::_id_0CF6( level._id_1B99, self );
}
