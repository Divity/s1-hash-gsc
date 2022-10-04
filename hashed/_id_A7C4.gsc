// S1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0209()
{
    level._id_538D = "mp/killstreakTable.csv";
    level._id_5383 = 0;
    level._id_5388 = 1;
    level._id_5389 = 2;
    level._id_538A = 3;
    level._id_538B = 4;
    level._id_538C = 5;
    level._id_53D9 = "mp/killstreakModules.csv";
    level._id_53D6 = 1;
    level._id_53D5 = 4;
    level._id_53D4 = 5;
    level._id_53D7 = 6;
    level._id_53D8 = 7;
    level._id_539F = _id_A75A::_id_3FD9( "scr_game_killstreakdelay", 10 );
    level._id_5398 = [];
    level._id_53A4 = [];
    level._id_53AC = [];
    _id_4DE7();
    level thread _id_A7C3::_id_64C5();

    if ( isdefined( level.iszombiegame ) && level.iszombiegame )
        return;

    level thread _id_A7B5::_id_0209();
    level thread _id_A7BB::_id_0209();

    if ( isdefined( level._id_5985 ) )
        [[ level._id_5985 ]]();

    level thread _id_A7D0::_id_0209();
    level thread _id_A7B7::_id_0209();
    level thread _id_A7CD::_id_0209();
    level thread _id_A7CE::_id_0209();
    level thread _id_A7C1::_id_0209();
    level thread _id_A7C7::_id_0209();
    level thread _id_A7C2::_id_0209();
    level thread _id_A7C9::_id_0209();
    level thread _id_A7C6::_id_0209();
    level thread _id_A7C8::_id_0209();
    level thread _id_A7D1::_id_0209();
    level thread _id_A7BD::_id_0209();
    level thread _id_A7C0::_id_0209();
    level thread _id_A7CB::_id_0209();
    level thread _id_A7B8::_id_0209();
    level thread _id_A7BE::_id_0209();
    level thread _id_A7CA::_id_4E24();
}

_id_4DE7()
{
    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( level._id_538D, var_0, 1 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        if ( var_1 == "b1" || var_1 == "none" )
        {

        }
        else
        {
            var_2 = tablelookupistringbyrow( level._id_538D, var_0, 5 );
            var_3 = tablelookupbyrow( level._id_538D, var_0, 7 );
            game["dialog"][var_1] = var_3;
            var_4 = tablelookupbyrow( level._id_538D, var_0, 8 );
            game["dialog"]["allies_friendly_" + var_1 + "_inbound"] = "ks_" + var_4 + "_allyuse";
            game["dialog"]["allies_enemy_" + var_1 + "_inbound"] = "ks_" + var_4 + "_enemyuse";
            var_5 = tablelookupbyrow( level._id_538D, var_0, 9 );
            game["dialog"]["axis_friendly_" + var_1 + "_inbound"] = "ks_" + var_5 + "_allyuse";
            game["dialog"]["axis_enemy_" + var_1 + "_inbound"] = "ks_" + var_5 + "_enemyuse";
            var_6 = int( tablelookupbyrow( level._id_538D, var_0, 12 ) );
            _id_A7AA::_id_72FC( var_1 + "_earned", var_6 );
        }

        var_0++;
    }

    _id_07EF();
}

_id_07EF()
{
    var_0 = "allies_friendly_emp_inbound";
    var_1 = "allies_enemy_emp_inbound";
    var_2 = "axis_friendly_emp_inbound";
    var_3 = "axis_enemy_emp_inbound";

    for ( var_4 = 1; var_4 < 9; var_4++ )
    {
        var_5 = "_0" + var_4;
        game["dialog"][var_0 + var_5] = game["dialog"][var_0] + var_5;
        game["dialog"][var_1 + var_5] = game["dialog"][var_1] + var_5;
        game["dialog"][var_2 + var_5] = game["dialog"][var_2] + var_5;
        game["dialog"][var_3 + var_5] = game["dialog"][var_3] + var_5;
    }
}
