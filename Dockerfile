FROM microsoft/dotnet-framework:4.5.2-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY MindShoft/*.csproj ./MindShift/
COPY MindShift/*.config ./MindShift/
RUN nuget restore

# copy everything else and build app
COPY MindShift/. ./MindShift/
WORKDIR /app/MindShift
RUN msbuild /p:Configuration=Release


# copy build artifacts into runtime image
FROM microsoft/aspnet:4.5.2 AS runtime
WORKDIR /app
COPY --from=build /app/MindShiftp/. ./