FROM mcr.microsoft.com/dotnet/sdk:5.0  AS build-env

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

RUN mkdir /opt/app
COPY ./ /opt/app

WORKDIR /opt/app
RUN dotnet publish -c Release -o output -r linux-x64

FROM mcr.microsoft.com/dotnet/runtime:5.0 as production
WORKDIR /opt/app
COPY --from=build-env /opt/app/output .
ENTRYPOINT [ "dotnet", "DotnetTemplate.Web.dll" ]