FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY MindShift/*.csproj ./MindShift/
COPY MindShift.DataAccess/*.csproj ./MindShift.DataAccess/
COPY MindShift.Models/*.csproj ./MindShift.Models/
RUN dotnet restore

# copy everything else and build app
COPY MindShift/. ./MindShift/
COPY MindShift.DataAccess/. ./MindShift.DataAccess/
COPY MindShift.Models/. ./MindShift.Models/
WORKDIR /app/MindShift
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=build /app/MindShift/out ./
ENTRYPOINT ["dotnet", "MindShift.dll"]
