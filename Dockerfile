# Use the official .NET SDK image for building the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy the solution and project files
COPY RPG-Front-end/*.csproj RPG-Front-end/
WORKDIR /app/RPG-Front-end
RUN dotnet restore

# Copy the rest of the source code and build the app
COPY RPG-Front-end/. .
RUN dotnet publish -c Release -o /publish

# Use the official ASP.NET Core runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /publish .

# Expose the application port
EXPOSE 8080

# Set the entry point to run the application
ENTRYPOINT ["dotnet", "RPG-Front-end.dll"]
