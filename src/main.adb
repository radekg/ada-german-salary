with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;
with Exceptions;
with Cli; use Cli;

procedure Main is
begin
    begin
        declare
            GrossSalaryValue : Float := Get_Float_Flag(Flag => "--gross", Short => "-g", Required => true);
            GrossMode : String := Get_String_Flag(Flag => "--mode", Short => "-m", DefaultValue => "annual");
        begin
            Put_Line("Hello, World... gross=" & Float'Image(GrossSalaryValue) & ", mode=" & GrossMode);
        end;
    exception
        when E: Exceptions.CLI_Invalid_Value =>
            Put_Line("Invalid arguments, reason: " & Exception_Message(E));
        when E: Exceptions.CLI_Required_Missing =>
            Put_Line("Missing required arguments, reason: " & Exception_Message(E));
        when E: others =>
            Put_Line("Error while processing command line arguments: " & Exception_Message(E));
    end;
end;
