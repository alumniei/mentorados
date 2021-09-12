## Contributing

This document contains some rough guidelines of this project.

- It must work without javascript;
- Keyboard navigation must work;
- It must work in touch only devices;
- Content must be available in both portuguese and english;
- Dark and light modes should work;
- Do not load third party content such as fonts, styles, and javascript;
- The cookie policy must be respected and kept up to date;


## Security considerations

We don't want to let anyone find out if a student has registered an account, so
we need to be careful on registration/login/password recovery to prevent
leaking this information, even through timing attacks.

The same applies for the email used by mentors to login. Even though registered
students may see mentors' email addresses in their profile, we don't want to
anonymous users to enumerate them. We will probably migrate to a system where
mentors have the possibility to specify a different display contact than the
one used for logging in.

Profile pictures should not be hotlinks to other domains (not even gravatar),
since these allow third parties to track who is accessing our platform. Images
need to be stored locally.

Mentors should not have access to the list of registered students.


## Writing style

We should use gender neutral language:
- In english, use "they" instead of "he/she".
- In portuguese, don't use the "masculine default", use either the "ilu/elu"
  system or avoid using gendered adjectives when referring to people ("a
  cadeira" is fine; "o mentor" is not).

In portuguese, we're referring to users as "tu", not "você".
