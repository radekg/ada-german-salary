package Cli is

    function Get_Float_Flag
        ( Flag : String := "";
          Short : String := "";
          Required : Boolean := false;
          DefaultValue : Float := 0.0 ) return Float
        with Pre => Flag'Length > 0 or Short'Length > 0;

    function Get_String_Flag
        ( Flag : String := "";
          Short : String := "";
          Required : Boolean := false;
          DefaultValue : String := "" ) return String
        with Pre => Flag'Length > 0 or Short'Length > 0;

end Cli;
