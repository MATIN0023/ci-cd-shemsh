# استفاده از SDK برای بیلد
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app
RUN ls -la
RUN dotnet restore ".csproj"


# کپی و بیلد پروژه
COPY . . 
RUN dotnet restore
RUN dotnet publish -c Release -o /publish

# استفاده از runtime برای اجرای برنامه
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /publish .
EXPOSE 80
CMD ["dotnet", "gold-api"]
