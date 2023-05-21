# Rust Web APIs using Actix Course <!-- omit in toc -->
<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [Rust Web APIs using Actix Course <!-- omit in toc -->](#rust-web-apis-using-actix-course)
  * [Overview](#overview)
    + [Repository Branches  ](#repository-branches)
  * [Development Environment Setup](#development-environment-setup)
    + [Tools](#tools)
  * [Setup the database](#setup-the-database)
  * [Updating the paths to files in the code](#updating-the-paths-to-files-in-the-code)
  * [Docker images](#docker-images)
  * [More Examples](#more-examples)

<!-- TOC end -->
## Overview
This repository contains the example project for the Pluralsight course "Building REST API's in Rust 2021 with Actix Web"

### Repository Branches  
Branch|Description
:---|:---
Master|This branch holds the finished project
Module3|We will build on this code to implement the database.
Module4|This branch has the database code that we implemented in Module 3. We will build various aspects of endpoints on this code.
Module5|This branch has the database code that we implemented in Module 4. We're going to implement authentication and  security for the APIs in this module.
Module6|This is the starting code for implementing the front end.

## Development Environment Setup
### Tools
For this course we'll be using these tools:

> ##
> #### Visual Studio Code
> * Visual Studio Code which you can download at https://visualstudio.microsoft.com/ 
> * A couple of Visual Studio Code extensions that you will probably want to install
> 
>  Extension Name|URL
>  :---|:---
>  HTTP Sever|https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer
>  C++ Debugging (it works for Rust too)|https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools |
>  Rust Analyzer|https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer    |  
>  Even Better TOML|https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml   |
>  &nbsp;
>> #### HTTP Server Setup
>> ##### Setup HTTPS
>> * Go to VS Code Settings `Ctrl+,`. 
>> * Under `Extensions` click on `Live Server Config`. 
>> * In the right hand pane you will find a section labeled `Settings: Https`
>>
>> ![Settings Image][settings_image]
>>
>> * Set `enable` to `true`
>> * Set `cert` to the location of the `duckair.crt` file
>> * Set `key` to the location of the `duckair.key` file
>> 
>> &nbsp;
>>
>> ##### Setup document root
>> Open the `settings.json` file by clicking on `Edit in settings.json` link.
>>
>> ![settings_image2][settings_image2]
>>
>> Add `"liveServer.settings.root": "{path goes here}",` to the `settings.json` file. Of course, replace `{path goes here}` with the actual path to the site documents root
> ##
<br>

> ##
> #### Postman
> * You can download Postman at https://www.postman.com/
> * We're going to be using a self-signed certficate for SSL in the course. By default Postman does client side validation against certificates and will block us from calling the API endpoints. To fix this we will turn off Postman's client side certficate checking. 
>
> Open Postman and in the upper right side of the title bar click on the gear icon <br>
> <img src="https://github.com/sentrid/docs/blob/main/postmanSettingsGear.png?raw=true" width=50% height=50%>
> 
> Then turn off the `SSL cerficiate verification` switch.<br>
> <img src="https://github.com/sentrid/docs/blob/main/postmanNoSslValidation.png?raw=true" width=50% height=50%>
> 
> Instructions for turning off certificate validation can also be found here: https://learning.postman.com/docs/sending-requests/certificates/
> 
> ##
<br>

> ##
> #### OpenSSL library
> If you don't currently have OpenSSL installed on your machine, or if you do have OpenSSL installed on your machine but you run into compliation errors when writing the code, I recommend installing the libraries with `vcpkg`. You will need to have `git` installed first. You can find it here https://www.git-scm.com/ 
>
> #### Install vcpkg and OpenSSL
> * Start by creating a directory for vcpkg
> * `cd` inot that directory and clone the vcpkg git repository `git clone https://github.com/Microsoft/vcpkg.git`
> * Run the bootstrap script to build vcpkg `.\vcpkg\bootstrap-vcpkg.bat`
> * Install OpenSSL `vcpkg --triplet x64-windows-static install openssl`
> * To use the resulting build type in `vcpkg integrate install` 
> * This will create a new directory under the vcpkg directory called `installed\x64-windows-static`. You can leave it there or move the `x64-windows-static` directory to any location you like. Just remember where it is.
>
> #### Add the OpenSSL library to your environment variables
>  * Run `sysdm.cpl` This will open up a Systems Properties dialog box.
>  * Under the Advanced tab click on the "Environment Variables" button at the bottom of the dialog.
>  * Add a new Environment Variable named `OPENSSL_DIR` and set it to the path where the `x64-windows-static` directory lives.
> ## 

## Setup the database
The SQLite database is included with the example code, however if you want to recreate the database you can use the 
database.sql file. You will need sqlite3.exe which can be found here: https://www.sqlite.org/2022/sqlite-tools-win32-x86-3400100.zip

The command line statement to recreate the database is `{Path To SQLite exe}\sqlite3.exe duckair.db ".read database.sql"`

## Updating the paths to files in the code
In main.rs lines 17 and 18 change path to where those files are on your computer.
```rust
const CERT_KEY: &'static str = "assets\\duckair.key";
const CERT: &'static str = "assets\\duckair.crt";
```

## Docker images
There are docker images for the final implementation of the project which live at https://hub.docker.com/repositories/duckairlines<br>
There are two images there. One for the API backend and one for the web interface. Below are the `pull` and `run` command lines for each.<br>

The Web API project docker image:<br>
`docker pull duckairlines/flight-plan:latest`<br>
`docker run -p 3000:3000 -p 3001:3001 duckairlines/flight-plan:latest`<br>

The Website front end poject docker image:<br>
`docker pull duckairlines/web-frontend:latest`<br>
`docker run -p 80:80 duckairlines/web-frontend:latest`

## More Examples
Actix has a wealth of examples to continue developing the project. They can be found at this GitHub link: https://github.com/actix/examples

[settings_image]: https://github.com/sentrid/docs/blob/main/lsc-hs.png?raw=true "Settings Image"
[settings_image2]: https://github.com/sentrid/docs/blob/main/lsc-hsr2.png?raw=true "Settings Image"
[postman_image1]: https://github.com/sentrid/docs/blob/main/postmanSettingsGear.png?raw=true "Postman Settings Image"
