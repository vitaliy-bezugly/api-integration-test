﻿FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["WeatherForecast.Api/WeatherForecast.Api.csproj", "WeatherForecast.Api/"]
RUN dotnet restore "WeatherForecast.Api/WeatherForecast.Api.csproj"
COPY . .
WORKDIR "/src/WeatherForecast.Api"
RUN dotnet build "WeatherForecast.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WeatherForecast.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WeatherForecast.Api.dll"]
