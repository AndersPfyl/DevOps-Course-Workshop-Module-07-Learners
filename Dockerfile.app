FROM mcr.microsoft.com/dotnet/sdk:5.0

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

RUN mkdir /opt/app
COPY ./ /opt/app

WORKDIR /opt/app
RUN dotnet build DotnetTemplate.sln

WORKDIR /opt/app/DotnetTemplate.Web
RUN npm i && npm run build
