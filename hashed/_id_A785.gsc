// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    if ( !level._id_91E4 )
        return;

    precacheshader( "headicon_dead" );
    level thread _id_64C5();
}

_id_64C5()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_7C70 = [];
    }
}

_id_9B08()
{

}

_id_07DE( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !level._id_91E4 )
        return;

    if ( isdefined( var_4 ) && isplayer( var_4 ) && var_4 _id_A75A::_id_05CB( "specialty_silentkill" ) )
        return;

    var_5 = var_0._id_02E6;
    var_1 endon( "spawned_player" );
    var_1 endon( "disconnect" );
    wait 0.05;
    _id_A75A::_id_A0EB();

    if ( getdvar( "ui_hud_showdeathicons" ) == "0" )
        return;

    if ( level._id_46C7 )
        return;

    if ( isdefined( self._id_558F ) )
        self._id_558F _meth_8088();

    var_6 = newteamhudelem( var_2 );
    var_6._id_0530 = var_5[0];
    var_6._id_0538 = var_5[1];
    var_6._id_053B = var_5[2] + 54;
    var_6._id_0037 = 0.61;
    var_6._id_0048 = 1;

    if ( level._id_8A76 )
        var_6 _meth_80CC( "headicon_dead", 14, 14 );
    else
        var_6 _meth_80CC( "headicon_dead", 7, 7 );

    var_6 _meth_80D8( 0 );
    self._id_558F = var_6;
    var_6 thread _id_28F4( var_3 );
}

_id_28F4( var_0 )
{
    self endon( "death" );
    wait(var_0);
    self _meth_8084( 1.0 );
    self._id_0037 = 0;
    wait 1.0;
    self _meth_8088();
}
