// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{

}

_id_9B04( var_0, var_1 )
{
    if ( !isplayer( self ) || !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "scavenger":
            self _meth_82F4( "scavenger_pack_pickup" );

            if ( !level._id_46C7 )
                setdamagefeedbackclientomnvar( var_0 );

            break;
        case "hitspecialarmor":
            setdamagefeedbackclientomnvar( "hitspecialarmor" );
            break;
        case "hitblastshield":
        case "hitlightarmor":
        case "hitjuggernaut":
            self _meth_82F4( "mp_hit_armor" );
            setdamagefeedbackclientomnvar( var_0 );
            break;
        case "mp_solar":
            if ( !isdefined( self._id_8499 ) )
            {
                if ( isdefined( level._id_5988 ) )
                    self thread [[ level._id_5988 ]]();
            }
            else
                self._id_25A0 = 10;

            break;
        case "laser":
            if ( isdefined( level._id_7CC2 ) )
            {
                if ( !isdefined( self._id_8499 ) )
                {
                    if ( isdefined( level._id_5988 ) )
                        self thread [[ level._id_5988 ]]( level._id_7CC2 );
                }
            }

            break;
        case "headshot":
            self _meth_82F4( "mp_hit_headshot" );
            setdamagefeedbackclientomnvar( "headshot" );
            break;
        case "hitmorehealth":
            self _meth_82F4( "mp_hit_armor" );
            setdamagefeedbackclientomnvar( "hitmorehealth" );
            break;
        case "killshot":
            self _meth_82F4( "mp_hit_kill" );
            setdamagefeedbackclientomnvar( "killshot" );
            break;
        case "killshot_headshot":
            self _meth_82F4( "mp_hit_kill_headshot" );
            setdamagefeedbackclientomnvar( "killshot_headshot" );
            break;
        case "nosound":
            setdamagefeedbackclientomnvar( "standard" );
            break;
        case "none":
            break;
        default:
            self _meth_82F4( "mp_hit_default" );
            setdamagefeedbackclientomnvar( "standard" );
            break;
    }
}

setdamagefeedbackclientomnvar( var_0 )
{
    var_1 = gettime();

    if ( isdefined( self.damagefeedbacktime ) )
        var_2 = self.damagefeedbacktime;
    else
        var_2 = 0;

    if ( var_1 - var_2 < 300 && self _meth_8447( "damage_feedback" ) == var_0 )
        return;

    self.damagefeedbacktime = var_1;
    self _meth_82FB( "damage_feedback", var_0 );
}
