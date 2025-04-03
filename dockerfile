
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
RUN dotnet new console -n TestApp
WORKDIR /app/TestApp


