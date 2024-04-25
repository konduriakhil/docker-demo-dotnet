FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ADD . /src
WORKDIR /src
RUN dotnet publish -c Release -o dist/ docker-demo-dotnet.csproj


FROM mcr.microsoft.com/dotnet/aspnet:8.0
LABEL author="Shaikkhajaibrahim"
COPY --from=build /src/dist /myapp
WORKDIR /myapp
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
CMD ["dotnet", "docker-demo-dotnet.dll"]