<p align="center">
    <img width="400" height="200" src="https://www.google.com.br/url?sa=i&url=https%3A%2F%2Flogo.com%2F&psig=AOvVaw0QnWXG39r3_9-Gr1DOqoOv&ust=1616509723778000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOjt6JCOxO8CFQAAAAAdAAAAABAD" title="Logo do projeto"><br />
    <img src="https://img.shields.io/maintenance/yes/2020?style=for-the-badge" title="Status do projeto">
    <img src="https://img.shields.io/github/workflow/status/ccuffs/template/ci.uffs.cc?label=Build&logo=github&logoColor=white&style=for-the-badge" title="Status do build">
</p>

# Eveniment

Eveniment is an application to facilitate the dissemination of events that happen inside and outside the university and also to facilitate the lives of people who seek to participate in events and lectures that take place both online and in person.

## Features

Here you can place a screenshot of the product resulting from this project. Also describe your features using a list:

* Easy integration;
* Few dependencies;
* Uses higher-level technologies for application development;

## Starting

### 1. Dependencies

To execute the project, you will initially need to install the following dependencies:

- [Flutter](https://flutter.dev/docs/get-started/install);
- [MySQL](https://www.mysql.com/downloads/);
- [NodeJS](https://nodejs.org/en/);
- [NPM](https://www.npmjs.com/package/npm);

### 2. Settings

After the installation of the premises, it is necessary to obtain a copy of the project, to do this `fork` it through the button located in the upper right corner and then clone it on your machine. Then it will be necessary to configure the interaction between the project and its dependencies.

#### Database

The SGBD used in the project is MySQL knowing this, access the terminal and go to the server directory and create your database by executing the following command: 

```
mysql -h localhost -u root -p <./script_sql/script.sql
```

#### Server

Install the Server dependencies using the command below:

```
npm install
```

#### Client

Also install the Client dependencies by running:
```
flutter pub get
```

#### Running the project

Finally, after following the previous steps, start the client using the command:
```
flutter run
```

and finally start the server:

```
npm start
```
After that, the server will be running on port 8000 and can be accessed at [localhost:8000](http://localhost:8000).

### Documentação da API

In creation

## Projetos semelhates

Below is a list of interesting links and similar projects:

* [It does not have](https://github.com/PauloGSC/eveniment)
