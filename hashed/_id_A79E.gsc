// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_5348 = _id_A7B3::_id_413F( "game", "allowkillcam" );
}

_id_7F33( var_0, var_1, var_2, var_3, var_4 )
{
    self _meth_82FB( "cam_scene_name", var_0 );
    self _meth_82FB( "cam_scene_lead", var_1 );
    self _meth_82FB( "cam_scene_support", var_2 );

    if ( isdefined( var_3 ) )
        self _meth_82FB( "cam_scene_lead_alt", var_3 );
    else
        self _meth_82FB( "cam_scene_lead_alt", var_1 );

    if ( isdefined( var_4 ) )
        self _meth_82FB( "cam_scene_support_alt", var_4 );
    else
        self _meth_82FB( "cam_scene_support_alt", var_2 );
}

_id_7F95( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_0 ) && isdefined( var_0._id_08A0 ) )
    {
        if ( var_0._id_08A0 == "dog" )
            _id_7F33( "killcam_dog", var_0 _meth_81B1(), self _meth_81B1() );
        else
            _id_7F33( "killcam_agent", var_0 _meth_81B1(), self _meth_81B1() );
    }
    else if ( isdefined( var_4 ) && isdefined( var_3 ) && var_3 == "orbital_laser_fov_mp" && var_5 == 5 )
    {
        var_6 = -1;

        if ( isdefined( var_4._id_0087 ) )
            var_6 = var_4._id_0087 _meth_81B1();

        thread _id_7F33( "orbital_laser_killcam", var_1, var_4 _meth_81B1(), var_1, var_6 );
    }
    else if ( var_2 >= 0 )
    {
        _id_7F33( "unknown", -1, -1 );
        return 0;
    }
    else if ( level._id_8510 )
        _id_7F33( "unknown", var_1, self _meth_81B1() );
    else
        _id_7F33( "unknown", var_1, -1 );

    return 1;
}

isworldkillcam( var_0, var_1 )
{
    if ( isdefined( var_0 ) && var_0 _meth_81B1() == positionwouldtelefrag() && isdefined( var_1 ) && isdefined( var_1._id_534A ) )
        return 1;

    return 0;
}

_id_6EF6( var_0, var_1, var_2, var_3 )
{
    if ( isplayer( self ) && isdefined( var_1 ) && isplayer( var_1 ) )
    {
        var_4 = _id_A7A7::_id_3C5E();
        var_5 = gettime();
        waittillframeend;

        if ( isplayer( self ) && isdefined( var_1 ) && isplayer( var_1 ) )
        {
            var_5 = ( gettime() - var_5 ) / 1000;
            self._id_8F2C = self _meth_841C( var_1, var_2 + var_5, var_3, var_4 );
            self _meth_8539( var_3 );
        }
    }
}

_id_5350( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( getdvar( "scr_killcam_time" ) == "" )
    {
        var_7 = _id_A75A::_id_8F56( var_1, "_lefthand" );

        if ( var_5 || var_1 == "artillery_mp" || var_1 == "stealth_bomb_mp" || var_1 == "killstreakmahem_mp" )
            var_8 = ( gettime() - var_0 ) / 1000 - var_2 - 0.1;
        else if ( var_6 || var_1 == "agent_mp" )
            var_8 = 4.0;
        else if ( issubstr( var_1, "remotemissile_" ) )
            var_8 = 5;
        else if ( !var_3 || var_3 > 5.0 )
            var_8 = 5.0;
        else if ( var_7 == "frag_grenade_mp" || var_7 == "frag_grenade_short_mp" || var_7 == "semtex_mp" || var_7 == "semtexproj_mp" || var_7 == "thermobaric_grenade_mp" || var_7 == "frag_grenade_var_mp" || var_7 == "contact_grenade_var_mp" || var_7 == "semtex_grenade_var_mp" )
            var_8 = 4.25;
        else
            var_8 = 2.5;
    }
    else
        var_8 = getdvarfloat( "scr_killcam_time" );

    if ( var_5 && var_8 > 5 )
        var_8 = 5;

    if ( isdefined( var_4 ) )
    {
        if ( var_8 > var_4 )
            var_8 = var_4;

        if ( var_8 < 0.05 )
            var_8 = 0.05;
    }

    return var_8;
}

killcamarchivetime( var_0, var_1, var_2, var_3 )
{
    if ( var_0 > var_1 )
        var_0 = var_1;

    var_4 = var_0 + var_2 + var_3;
    return var_4;
}

_id_5351( var_0, var_1 )
{
    return var_1 && level._id_5348 && !( isdefined( var_0._id_1AB3 ) && var_0._id_1AB3 ) && game["state"] == "playing" && !var_0 _id_A75A::_id_51E0() && !level._id_8510 && !isai( var_0 );
}

_id_5348( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14 )
{
    self endon( "disconnect" );
    self endon( "spawned" );
    level endon( "game_ended" );
    var_15 = isworldkillcam( var_0, var_9 );

    if ( ( var_1 < 0 || !isdefined( var_9 ) ) && !var_15 )
        return;

    level._id_62A8++;
    var_16 = level._id_62A8 * 0.05;

    if ( level._id_62A8 > 1 )
        wait(0.05 * ( level._id_62A8 - 1 ));

    wait 0.05;
    level._id_62A8--;
    var_17 = _id_5350( var_3, var_4, var_5, var_7, var_8, var_14, level._id_8510 );

    if ( getdvar( "scr_killcam_posttime" ) == "" )
        var_18 = 2;
    else
    {
        var_18 = getdvarfloat( "scr_killcam_posttime" );

        if ( var_18 < 0.05 )
            var_18 = 0.05;
    }

    var_19 = var_17 + var_18;

    if ( isdefined( var_8 ) && var_19 > var_8 )
    {
        if ( var_8 < 2 )
            return;

        if ( var_8 - var_17 >= 1 )
            var_18 = var_8 - var_17;
        else
        {
            var_18 = 1;
            var_17 = var_8 - 1;
        }

        var_19 = var_17 + var_18;
    }

    self _meth_82FB( "ui_killcam_end_milliseconds", 0 );

    if ( isagent( var_9 ) && !isdefined( var_9._id_50A3 ) )
        return;

    if ( isplayer( var_9 ) )
        self _meth_82FB( "ui_killcam_killedby_id", var_9 _meth_81B1() );
    else if ( isagent( var_9 ) )
        self _meth_82FB( "ui_killcam_killedby_id", -1 );

    if ( _id_A75A::_id_513A( var_4 ) )
    {
        var_20 = _id_A75A::_id_3FF3( level._id_53AC[var_4] );
        self _meth_82FB( "ui_killcam_killedby_killstreak", var_20 );
        self _meth_82FB( "ui_killcam_killedby_weapon", -1 );
        self _meth_82FB( "ui_killcam_killedby_attachment1", -1 );
        self _meth_82FB( "ui_killcam_killedby_attachment2", -1 );
        self _meth_82FB( "ui_killcam_killedby_attachment3", -1 );
        self _meth_82FB( "ui_killcam_copycat", 0 );
    }
    else
    {
        var_21 = [];
        var_22 = getweaponbasename( var_4 );

        if ( isdefined( var_22 ) )
        {
            if ( _id_A75A::_id_514D( var_11 ) && !_id_A7B4::_id_518F( var_4 ) )
                var_22 = "iw5_combatknife";
            else
            {
                var_22 = _id_A75A::_id_8F56( var_22, "_lefthand" );
                var_22 = _id_A75A::_id_8F56( var_22, "_mp" );
            }

            var_23 = tablelookuprownum( "mp/statsTable.csv", 4, var_22 );
            self _meth_82FB( "ui_killcam_killedby_weapon", var_23 );
            self _meth_82FB( "ui_killcam_killedby_killstreak", -1 );

            if ( var_22 != "iw5_combatknife" )
                var_21 = getweaponattachments( var_4 );

            if ( !level._id_8510 && _id_A75A::_id_6E98() && isplayer( var_9 ) && !isbot( self ) && !isagent( self ) && _id_A781::_id_57E3( var_9 ) )
            {
                self _meth_82FB( "ui_killcam_copycat", 1 );
                thread _id_A003( var_9 );
            }
            else
                self _meth_82FB( "ui_killcam_copycat", 0 );
        }
        else
        {
            self _meth_82FB( "ui_killcam_killedby_weapon", -1 );
            self _meth_82FB( "ui_killcam_killedby_killstreak", -1 );
            self _meth_82FB( "ui_killcam_copycat", 0 );
        }

        for ( var_24 = 0; var_24 < 3; var_24++ )
        {
            if ( isdefined( var_21[var_24] ) )
            {
                var_25 = tablelookuprownum( "mp/attachmentTable.csv", 3, _id_A75A::_id_0E02( var_21[var_24] ) );
                self _meth_82FB( "ui_killcam_killedby_attachment" + ( var_24 + 1 ), var_25 );
                continue;
            }

            self _meth_82FB( "ui_killcam_killedby_attachment" + ( var_24 + 1 ), -1 );
        }
    }

    if ( var_7 && !level._id_3BD8 || isdefined( self ) && isdefined( self._id_132A ) && !level._id_3BD8 )
        self _meth_82FB( "ui_killcam_text", "skip" );
    else if ( !level._id_3BD8 )
        self _meth_82FB( "ui_killcam_text", "respawn" );
    else
        self _meth_82FB( "ui_killcam_text", "none" );

    switch ( var_12 )
    {
        case "score":
            self _meth_82FB( "ui_killcam_type", 1 );
            break;
        case "normal":
        default:
            self _meth_82FB( "ui_killcam_type", 0 );
            break;
    }

    var_26 = var_17 + var_5 + var_16;
    var_27 = gettime();
    self notify( "begin_killcam", var_27 );

    if ( !var_15 && !isagent( var_9 ) && isdefined( var_9 ) && isplayer( var_10 ) )
        var_9 _meth_82A4( var_10 );

    _id_A75A::_id_9B61( "spectator" );
    self._id_03DF = 1;

    if ( isagent( var_9 ) )
        var_1 = var_10 _meth_81B1();

    self _meth_8538( 0 );

    if ( var_15 )
        self._id_0198 = var_10 _meth_81B1();
    else
        self._id_0198 = var_1;

    self._id_023A = -1;
    var_28 = _id_7F95( var_0, var_1, var_2, var_4, var_10, var_17 );

    if ( !var_28 )
        thread _id_7F94( var_2, var_26, var_3 );

    if ( var_15 )
    {
        if ( var_26 > gettime() / 1000.0 )
            var_26 = gettime() / 1000.0;
    }
    else if ( var_26 > var_13 )
        var_26 = var_13;

    self._id_0049 = var_26;
    self._id_534C = var_19;
    self._id_034E = var_6;
    self _meth_8273( "allies", 1 );
    self _meth_8273( "axis", 1 );
    self _meth_8273( "freelook", 1 );
    self _meth_8273( "none", 1 );

    if ( level._id_5FE9 )
    {
        foreach ( var_30 in level._id_91F0 )
            self _meth_8273( var_30, 1 );
    }

    foreach ( var_30 in level._id_91F0 )
        self _meth_8273( var_30, 1 );

    thread _id_3159();
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    if ( self._id_0049 < var_26 )
    {

    }

    var_17 = self._id_0049 - 0.05 - var_5;
    var_19 = var_17 + var_18;
    self._id_534C = var_19;

    if ( var_17 <= 0 )
    {
        _id_A75A::_id_9B61( "dead" );
        _id_A75A::_id_1EF2();
        self notify( "killcam_ended" );
        return;
    }

    self _meth_82FB( "ui_killcam_end_milliseconds", int( var_19 * 1000 ) + gettime() );

    if ( level._id_8510 )
        thread _id_2C7C( var_17, var_2 );

    self._id_5348 = 1;

    if ( isdefined( self._id_132A ) && !level._id_3BD8 )
        self._id_132B = gettime();

    thread _id_89A0();
    self._id_85B9 = 0;
    self._id_534E = _id_A75A::_id_412C();

    if ( !level._id_8510 )
        thread _id_A052( var_7 );
    else
        self notify( "showing_final_killcam" );

    thread _id_31B2();
    _id_A0D6();

    if ( level._id_8510 )
    {
        if ( self == var_9 )
            var_9 _id_A7A0::_id_6FF3( "ch_precision_moviestar" );

        thread _id_A7A7::_id_89B0();
        return;
    }

    thread _id_5349( 1 );
}

_id_2C7C( var_0, var_1 )
{
    if ( isdefined( level._id_2CE5 ) )
        return;

    level._id_2CE5 = 1;
    var_2 = var_0;

    if ( var_2 > 1.0 )
    {
        var_2 = 1.0;
        wait(var_0 - 1.0);
    }

    setslowmotion( 1.0, 0.25, var_2 );
    wait(var_2 + 0.5);
    setslowmotion( 0.25, 1, 1.0 );
    level._id_2CE5 = undefined;
}

_id_A0D6()
{
    self endon( "abort_killcam" );
    wait(self._id_534C - 0.05);
}

_id_7F94( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    var_3 = gettime() - var_1 * 1000;

    if ( var_2 > var_3 )
    {
        wait 0.05;
        var_1 = self._id_0049;
        var_3 = gettime() - var_1 * 1000;

        if ( var_2 > var_3 )
            wait(( var_2 - var_3 ) / 1000);
    }

    self._id_023A = var_0;
}

_id_A052( var_0 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );

    while ( self _meth_833C() )
        wait 0.05;

    while ( !self _meth_833C() )
        wait 0.05;

    self._id_85B9 = 1;

    if ( isdefined( self._id_030D["totalKillcamsSkipped"] ) )
        self._id_030D["totalKillcamsSkipped"]++;

    if ( var_0 <= 0 )
        _id_A75A::_id_1EF5( "kc_info" );

    self notify( "abort_killcam" );
}

_id_A003( var_0 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    self _meth_82DD( "KillCamCopyCat", "weapnext" );
    self waittill( "KillCamCopyCat" );
    self _meth_82FB( "ui_killcam_copycat", 0 );
    self _meth_809A( "copycat_steal_class" );
    _id_A781::_id_7F3B( var_0 );
}

_id_31B2()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );

    for (;;)
    {
        if ( self._id_0049 <= 0 )
            break;

        wait 0.05;
    }

    self notify( "abort_killcam" );
}

_id_89A0()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    self waittill( "spawned" );
    thread _id_5349( 0 );
}

_id_3159()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    level waittill( "game_ended" );
    thread _id_5349( 1 );
}

_id_5349( var_0 )
{
    self _meth_82FB( "ui_killcam_end_milliseconds", 0 );
    _id_7F33( "unknown", -1, -1 );
    self._id_5348 = undefined;

    if ( isdefined( self._id_534E ) && isplayer( self ) && _id_A744::_id_1AD1( self._id_56F4 ) )
    {
        var_1 = _id_A75A::_id_412C();
        setmatchdata( "lives", self._id_56F4, "killcamWatchTimeDeciSeconds", _id_A75A::_id_1E28( var_1 - self._id_534E ) );
    }

    if ( !level._id_3BD8 )
        _id_A75A::_id_1EF5( "kc_info" );

    thread _id_A7B1::_id_8013();
    self notify( "killcam_ended" );

    if ( !var_0 )
        return;

    _id_A75A::_id_9B61( "dead" );
    _id_A75A::_id_1EF2();
}

_id_1AB5()
{
    self._id_1AB3 = 0;
    thread _id_1AB6( ::_id_1AB9, ::_id_1AB4 );
}

_id_1AB9()
{
    return self _meth_833C();
}

_id_1AB7()
{
    return self _meth_82EE();
}

_id_1AB4()
{
    self._id_1AB3 = 1;
}

_id_1AB8()
{
    self._id_1AB3 = 1;
    self._id_A149 = 1;
}

_id_1AB6( var_0, var_1 )
{
    self endon( "death_delay_finished" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( !self [[ var_0 ]]() )
        {
            wait 0.05;
            continue;
        }

        var_2 = 0;

        while ( self [[ var_0 ]]() )
        {
            var_2 += 0.05;
            wait 0.05;
        }

        if ( var_2 >= 0.5 )
            continue;

        var_2 = 0;

        while ( !self [[ var_0 ]]() && var_2 < 0.5 )
        {
            var_2 += 0.05;
            wait 0.05;
        }

        if ( var_2 >= 0.5 )
            continue;

        self [[ var_1 ]]();
        return;
    }
}
