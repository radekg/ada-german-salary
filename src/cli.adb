with Ada.Command_Line; use Ada.Command_Line;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Exceptions;
with Exceptions;

package body Cli is

    function Get_Float_Flag
        ( Flag : String := "";
          Short : String := "";
          Required : Boolean := false;
          DefaultValue : Float := 0.0 ) return Float is
    begin
        for Index in 1 .. Argument_Count loop
            if (Flag'Length > 0 and Argument(Index) = Flag) or (Short'Length > 0 and Argument(Index) = Short) then
                begin
                    return Float'Value(Argument(Index+1));
                exception
                    when E : constraint_error =>
                        raise Exceptions.CLI_Invalid_Value with "Invalid input for flag '"
                            & Flag & "', reason: " & Ada.Exceptions.Exception_Message(E);
                end;
            end if;
        end loop;
        if Required then
            raise Exceptions.CLI_Required_Missing with "Missing required flag '" & Flag & "'";
        end if;
        return DefaultValue;
    end Get_Float_Flag;

    function Get_String_Flag
        ( Flag : String := "";
          Short : String := "";
          Required : Boolean := false;
          DefaultValue : String := "" ) return String is
    begin
        for Index in 1 .. Argument_Count loop
            if (Flag'Length > 0 and Argument(Index) = Flag) or (Short'Length > 0 and Argument(Index) = Short) then
                return Argument(Index+1);
            end if;
        end loop;
        if Required then
            raise Exceptions.CLI_Required_Missing with "Missing required flag '" & Flag & "'";
        end if;
        return DefaultValue;
    end Get_String_Flag;

end Cli;
