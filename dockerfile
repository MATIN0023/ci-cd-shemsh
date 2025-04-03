# مرحله بیلد
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# ایجاد پروژه جدید
RUN dotnet new console -n TestApp

WORKDIR /app/TestApp

# بازیابی وابستگی‌ها و بیلد پروژه
RUN dotnet restore
RUN dotnet build -c Release --no-restore

# مرحله اجرا
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS runtime
WORKDIR /app

# کپی کردن فایل‌های ساخته‌شده از مرحله بیلد
COPY --from=build /app/TestApp/bin/Release/net8.0/ ./

# اجرای برنامه
CMD ["dotnet", "TestApp.dll"]
