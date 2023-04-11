<h1 align="center">
  Tea Service
</h1>

<p align="center">
  <img width="600" src="https://github.com/bflanagan138/image_repo/blob/main/Screen%20Shot%202023-04-11%20at%201.24.39%20PM.png?raw=true">
</p>

## Table of Contents

- [Project Overview](#project-overview)
- [Schema](#schema)
- [Technologies](#technologies)
- [Setup and Installation](#setup-and-installation)
- [Learning Goals](#learning-goals)

## Project Overview

**_Tea Service_** is an application that creates back end API endpoints for Customers to add Tea Subscriptions.

## Schema
<p align="center">
  <img width="900
  " src="https://github.com/bflanagan138/image_repo/blob/main/Tea%20Service%20Schema.png?raw=true">
</p>

## API Endpoints
Here is a list of all mapped client requests with their respective json responses below them:

Shows Customer and their subscriptions: 
```GET http://localhost:3000/api/v1/customers/1/subscriptions```
```
{
    "data": {
        "id": 1,
        "attributes": {
            "first_name": "Alejandra",
            "last_name": "Stark",
            "email": "jack@wisozk-marks.biz",
            "address": "Apt. 818 754 Kuhlman Manors, Steuberside, AZ 22149-1295",
            "subscriptions": [
                {
                    "title": "Subscription 1",
                    "price": 11.88,
                    "status": "active",
                    "frequency": "Monthly"
                },
                {
                    "title": "Subscription 2",
                    "price": 22.12,
                    "status": "cancelled",
                    "frequency": "Weekly"
                },
                {
                    "title": "Subscription 4",
                    "price": 8.88,
                    "status": "active",
                    "frequency": "Yearly"
                }
            ]
        }
    }
}
```
If customer has no subscriptions: 
```GET http://localhost:3000/api/v1/customers/1/subscriptions```

```
{
    "data": {
        "id": 2,
        "attributes": {
            "first_name": "Modesto",
            "last_name": "Langworth",
            "email": "von@schinner.org",
            "address": "Suite 790 479 Clement Locks, Lake Mallie, MN 19861-3397",
            "subscriptions": "No Subscriptions Found"
        }
    }
}
```

## Technologies

<p align="center">
<img height="50"src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"> 
<img height="50"src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white">
<img height="50height="60"src="https://img.shields.io/badge/json-5E5C5C?style=for-the-badge&logo=json&logoColor=white">
<img height="50"src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white">
<img height="50"src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white">
<img height="50"src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white">
<img height="50"src="https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white">
<img height="50"src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white">
</p>

  
## Setup and Installation

From your terminal, run:

- ```git clone https://github.com/bflanagan138/tea_service.git```
- ```bundle install```
- ```rails db:create```
- To run the tests: ```bundle exec rspec```
- In your command line, run ```rails s``` then in a webbrowser, visit "http://localhost:3000/api/v1/customers/#{customer.id}/subscriptions" to run on your local host

## Learning Goals

- Employ Service-Oriented Architecture to create back end API endpoints for front end consumption
- Document process utilizing project board
- Create ReadMe to ensure users can easily use service
- Graduate Turing

<p align="center">
  <img width="100" src="https://github.com/bflanagan138/image_repo/blob/main/Screen%20Shot%202023-04-11%20at%201.24.39%20PM.png?raw=true">
</p>
