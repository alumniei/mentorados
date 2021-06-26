# Mentorados

MIEIC students facing difficult career decisions, personal or academic problems
at university or any other issues, can benefit from speaking to someone who has
walked a similar path before.

This platform was built to connect current MIEIC students looking for
advice/mentorship, with MIEIC alumni who volunteer their time to lend a
sympathetic ear and advise wherever they can.

## Development

### Using Docker

After cloning this repository, you can run this application using Docker and docker-compose.

First, create an environment file `.env` with something like you see below, which defines the some of the necessary parameters for the app You can set `db_user`, `db_password` and `db_name` to whatever you want:

```
POSTGRES_USER=<db_user>
POSTGRES_PASSWORD=<db_password>
POSTGRES_DB=<db_name>
BASE_URL=http://localhost:3000
```

To start the containers in detached mode, use `docker-compose up -d`.

To stop the containers, use `docker-compose down`.

The website should be available in `http://localhost:3000`.

## Contributing

Check the `CONTRIBUTING.md` files for some rough guidelines.
