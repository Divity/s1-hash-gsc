// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    precachemodel( "animal_dobernan" );
    level._id_5398["guard_dog"] = ::_id_98A6;
}

_id_806C()
{
    level._id_0897["dog"] = level._id_0897["player"];
    level._id_0897["dog"]["spawn"] = ::_id_88DF;
    level._id_0897["dog"]["on_killed"] = ::_id_6435;
    level._id_0897["dog"]["on_damaged"] = maps\mp\agents\_agents::_id_6436;
    level._id_0897["dog"]["on_damaged_finished"] = ::_id_643E;
    level._id_0897["dog"]["think"] = maps\mp\agents\dog\_dog_think::main;
    level._id_53AC["agent_mp"] = "agent_mp";
}

_id_98A6( var_0, var_1 )
{
    return _id_9BF4();
}

_id_9BF4()
{
    if ( maps\mp\agents\_agent_utility::_id_4052( "dog" ) >= 5 )
    {
        self _meth_826E( &"KILLSTREAKS_TOO_MANY_DOGS" );
        return 0;
    }

    if ( maps\mp\agents\_agent_utility::_id_4055( self, "dog" ) >= 1 )
    {
        self _meth_826E( &"KILLSTREAKS_ALREADY_HAVE_DOG" );
        return 0;
    }

    if ( maps\mp\agents\_agent_utility::_id_4054( self ) >= 2 )
    {
        self _meth_826E( &"KILLSTREAKS_AGENT_MAX" );
        return 0;
    }

    var_0 = _func_1FB();

    if ( maps\mp\agents\_agent_utility::_id_4052() >= var_0 )
    {
        self _meth_826E( &"KILLSTREAKS_UNAVAILABLE" );
        return 0;
    }

    if ( !_id_A75A::_id_5186( self ) )
        return 0;

    var_1 = maps\mp\agents\_agent_utility::_id_414A( 1 );

    if ( !isdefined( var_1 ) )
        return 0;

    var_2 = maps\mp\agents\_agent_common::_id_214C( "dog", self._id_04A8 );

    if ( !isdefined( var_2 ) )
        return 0;

    var_2 maps\mp\agents\_agent_utility::_id_7DAB( self._id_04A8, self );
    var_3 = var_1._id_02E6;
    var_4 = vectortoangles( self._id_02E6 - var_1._id_02E6 );
    var_2 thread [[ var_2 maps\mp\agents\_agent_utility::_id_08A6( "spawn" ) ]]( var_3, var_4, self );
    var_2 _id_A75A::_id_063B( "player_name_bg_green_dog", "player_name_bg_red_dog" );

    if ( isdefined( self._id_12D6 ) && self._id_12D6._id_12D7 == "ball_drone_backup" )
        _id_A7A0::_id_6FF3( "ch_twiceasdeadly" );

    return 1;
}

_id_6435( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self._id_50A3 = 0;
    self._id_4723 = 0;
    var_1._id_55AD = gettime();

    if ( isdefined( self._id_0C69._id_64A2[self._id_09A3] ) )
        self [[ self._id_0C69._id_64A2[self._id_09A3] ]]();

    if ( isplayer( var_1 ) && isdefined( self._id_02E9 ) && var_1 != self._id_02E9 )
    {
        self._id_02E9 _id_A75A::_id_5652( "dog_killed" );
        _id_A783::_id_64B3( var_1, var_4, var_3, var_2, "destroyed_guard_dog" );

        if ( isplayer( var_1 ) )
        {
            var_1 _id_A7A0::_id_6FF3( "ch_notsobestfriend" );

            if ( !self _meth_8341() )
                var_1 _id_A7A0::_id_6FF3( "ch_hoopla" );
        }
    }

    self _meth_83D2( "death" );
    var_9 = self _meth_83D3();
    var_10 = getanimlength( var_9 );
    var_8 = int( var_10 * 1000 );
    self._id_0087 = self _meth_838D( var_8 );
    self _meth_809A( "anml_doberman_death" );
    maps\mp\agents\_agent_utility::_id_2630();
    self notify( "killanimscript" );
}

_id_643E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( self._id_6DB0 ) )
        thread _id_6987( 2.5 );

    var_10 = var_2;

    if ( isdefined( var_8 ) && var_8 == "head" && level._id_01B5 != "horde" )
    {
        var_10 = int( var_10 * 0.6 );

        if ( var_2 > 0 && var_10 <= 0 )
            var_10 = 1;
    }

    if ( self._id_01E7 - var_10 > 0 )
        maps\mp\agents\dog\_dog_think::_id_6461( var_0, var_1, var_10, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

    if ( isplayer( var_1 ) )
    {
        if ( isdefined( self._id_0E4A ) && self._id_0E4A != "attacking" )
        {
            if ( distancesquared( self._id_02E6, var_1._id_02E6 ) <= self._id_2CC3 )
            {
                self._id_017C = var_1;
                self._id_39AA = 1;
                thread maps\mp\agents\dog\_dog_think::_id_A214();
            }
        }
    }

    maps\mp\agents\_agents::_id_0896( var_0, var_1, var_10, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_6987( var_0 )
{
    self endon( "death" );
    self _meth_809A( "anml_doberman_pain" );
    self._id_6DB0 = 1;
    wait(var_0);
    self._id_6DB0 = undefined;
}

_id_88DF( var_0, var_1, var_2 )
{
    if ( _func_282() )
        self _meth_80B1( "animal_dobernan" );
    else
        self _meth_80B1( "animal_dobernan" );

    self._id_8A3A = "dog";
    self._id_648D = maps\mp\agents\dog\_dog_think::_id_648D;

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_3 = var_0;
        var_4 = var_1;
    }
    else
    {
        var_5 = self [[ level._id_40D0 ]]();
        var_3 = var_5._id_02E6;
        var_4 = var_5._id_0041;
    }

    maps\mp\agents\_agent_utility::_id_070B();
    self._id_03DD = gettime();
    self._id_55DC = gettime();
    maps\mp\agents\dog\_dog_think::_id_0209();
    self _meth_838A( var_3, var_4, "dog_animclass", 15, 40, var_2 );
    level notify( "spawned_agent", self );
    maps\mp\agents\_agent_common::_id_7DAA( 250 );

    if ( isdefined( var_2 ) )
        maps\mp\agents\_agent_utility::_id_7DAB( var_2._id_04A8, var_2 );

    self _meth_8177( "Dogs" );
    self _meth_8310();

    if ( isdefined( self._id_02E9 ) )
    {
        self _meth_8054();
        wait 1.0;

        if ( !isalive( self ) )
            return;

        self _meth_8053();
        wait 0.1;
    }

    self thread [[ maps\mp\agents\_agent_utility::_id_08A6( "think" ) ]]();
    wait 0.1;

    if ( _func_282() )
        playfxontag( level._id_3B0C, self, "tag_origin" );
}
