#LeadFlow API

A smart lead distribution backend built in Rails API.

## Features
- JWT Authentication
- Role-based access (Admin / Agent)
- Smart lead assignment
- Region matching
- Language matching
- Skill-based routing
- Capacity-aware allocation
- Redis + Sidekiq background jobs

## Tech Stack
- Ruby on Rails API
- PostgreSQL
- Redis
- Sidekiq
- JWT
- Postman

## Lead Assignment Logic
Priority order:
1. Agent availability
2. Region match
3. Language match
4. Skill level match
5. Lowest active lead count
6. Capacity check

## API Endpoints
POST /signup
POST /login
GET /users
POST /users
POST /leads
GET /my_leads
PATCH /availability

## Run Locally
(bundle install etc)

# Postman Collection - 
https://documenter.getpostman.com/view/54924140/2sBXqRicJ4

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /signup | Create user |
| POST | /login | Login |
| GET | /users | Admin only |
| POST | /leads | Create lead |
| GET | /my_leads | Agent leads |
| PATCH | /availability | Toggle status |

## Future Improvements
- Swagger docs
- Docker
- Rate limiting
- Notifications
- AI lead scoring
