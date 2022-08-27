with AUnit; use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;

package Cli.Tests.Getstring is

    type TC is new Test_Cases.Test_Case with record
        A : Boolean := false;
    end record;

    overriding procedure Register_Tests (T : in out TC);
    overriding procedure Set_Up (T : in out TC);

    function Name (T : TC) return Message_String;

    procedure Test_Get_String_Flag_OK_With_Default (T : in out Test_Cases.Test_Case'Class);
    procedure Test_Get_String_Flag_Throws_No_Flag_Or_Short (T : in out Test_Cases.Test_Case'Class);
    procedure Test_Get_String_Flag_Throws_When_Required (T : in out Test_Cases.Test_Case'Class);

end Cli.Tests.Getstring;
