with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO; use Ada.Text_IO;

with Cli;

package body Cli.Tests.Getstring is

    procedure Register_Tests (T : in out TC) is
        use AUnit.Test_Cases.Registration;
    begin
        Register_Routine
            (T, Test_Get_String_Flag_OK_With_Default'Access, "Test CLI get string with default values");
        Register_Routine
            (T, Test_Get_String_Flag_Throws_No_Flag_Or_Short'Access, "Test CLI get string throws when no flag and short");
        Register_Routine
            (T, Test_Get_String_Flag_Throws_When_Required'Access, "Test CLI get string when required argument not found");
    end Register_Tests;

    function Name (T : TC) return Message_String is
        pragma Unreferenced (T);
    begin
        return AUnit.Format ("CLI Get_String_Flag");
    end Name;

    procedure Set_Up (T : in out TC) is
    begin
        null;
    end Set_Up;

    -- Test_Get_String_Flag_OK_With_Default
    -- ------------------------------------

    procedure Test_Get_String_Flag_OK_With_Default (T : in out Test_Cases.Test_Case'Class) is
        Required_Flag : constant String := "--test-switch";
        Default_Value : constant String := "this is the default value";
    begin
        declare
            Res : String := Cli.Get_String_Flag(Flag => Required_Flag, Required => false, DefaultValue => Default_Value);
        begin
            Assert(Res = Default_Value, "Expected didn't match received: expected=" & Default_Value & ", received=" & Res);
        end;
    end Test_Get_String_Flag_OK_With_Default;

    -- Test_Get_String_Flag_Throws_No_Flag_Or_Short
    -- --------------------------------------------

    procedure Get_String_Flag_No_Flag_Or_Short_Throws is
        Res : String := "";
    begin
        Res := Cli.Get_String_Flag;
    end Get_String_Flag_No_Flag_Or_Short_Throws;

    procedure Test_Get_String_Flag_Throws_No_Flag_Or_Short (T : in out Test_Cases.Test_Case'Class) is
    begin
        Assert_Exception(Get_String_Flag_No_Flag_Or_Short_Throws'Access, "Expected an exception");
    end Test_Get_String_Flag_Throws_No_Flag_Or_Short;

    -- Test_Get_String_Flag_Throws_When_Required
    -- -----------------------------------------

    procedure Get_String_Flag_Throws_When_Required is
        Required_Flag : constant String := "--test-switch";
        Res : String := "";
    begin
        Res := Cli.Get_String_Flag(Flag => Required_Flag, Required => true);
    end Get_String_Flag_Throws_When_Required;

    procedure Test_Get_String_Flag_Throws_When_Required (T : in out Test_Cases.Test_Case'Class) is
    begin
        Assert_Exception(Get_String_Flag_Throws_When_Required'Access, "Expected an exception, got no exception");
    end Test_Get_String_Flag_Throws_When_Required;

end Cli.Tests.Getstring;
