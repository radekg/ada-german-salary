with Cli.Tests.Getstring;

package body Cli.Tests.Suite is

    Result : aliased AUnit.Test_Suites.Test_Suite;
    Getstring_TC : aliased Cli.Tests.Getstring.TC;

    function Suite return AUnit.Test_Suites.Access_Test_Suite is
    begin
        AUnit.Test_Suites.Add_Test (Result'Access, Getstring_TC'Access);
        return Result'Access;
    end Suite;

end Cli.Tests.Suite;
