# Mentorados

MIEIC students facing difficult career decisions, personal or academic problems
at university or any other issues, can benefit from speaking to someone who has
walked a similar path before.

This platform was built to connect current MIEIC students looking for
advice/mentorship, with MIEIC alumni who volunteer their time to lend a
sympathetic ear and advise wherever they can.

## Development

To run this application, you need to have ruby 2.7.1 and a recent version
(>=10) of postgresql installed.

After cloning this repository, run the following command to install
dependencies:

```
bundle install
```

Create an environment file `.env.development.local` with the something like
following:

```
DATABASE_URL=postgres://localhost/mentorados_development
BASE_URL=http://localhost:3000
```

Setup the database:

```
bin/rails db:create db:migrate
```

Finally, start the rails server:

```
bin/rails server
```

The website should be available in `http://localhost:3000`.
