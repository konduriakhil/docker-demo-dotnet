FROM mcr.microsoft.com/dotnet/aspnet:8.0
LABEL author="Shaikkhajaibrahim"
ADD dist/ /myapp
WORKDIR /myapp
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
CMD ["dotnet", "docker-demo-dotnet.dll"]