using DotNetEnv;

Env.Load("test.env");
Console.WriteLine(Environment.GetEnvironmentVariable("DOTNET_ENV_TEST"));
