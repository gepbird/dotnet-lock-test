{ buildDotnetModule, nugetDeps }:

buildDotnetModule {
  pname = "dotnet-lock-test";
  version = "1.0.0";

  src = ./.;

  inherit nugetDeps;

  projectFile = [ "dotnet-lock-test.csproj" ];
}
