+++
title = 'Error Messages: Help Me Help You'
date = 2023-11-11T08:27:25Z
draft = false
+++

> If you haven't yet, please read the [About](/about) section. This blog might not be for you.

Let's not beat around the bush. Error messages suck.

They are cryptic, noisy, loud. They make us face the crushing reality that we're not as smart as we thought, we've made a mistake, the computer knows that, and it won't hesitate to tell you in bright red.

It will even provide you with a stack trace, because "how could you _not_ remember that when you pass the `foobar` argument to build a `BarBazFactory` you need to check that the `doingle` is not null you protozooic slime? Look, it's right there, just 20 getters deep!"

Nobody likes error messages (except, maybe, the [rust compiler's error messages][rust-errors]). They don't feel good. So, it's only normal that, when faced with a big, scary, stack trace, we try to forget it ever happened as soon as possible.

# A Story

Let me know if this sounds familiar. It does to me:

Your team has decided to use a new tool. A famously "steep-learning-curve" tool, like `git`, `kubernetes`, or `bazel`. Let's call it `snazel`. It's what your team will use for all of its `yakshave` pipeline. The `snazel` team has pinky-promised you that `snazel yakshave` is the only command you'll ever need.

You just got assigned a task. Things are tight this sprint, so you feel a vague pressure tingling on the back of your skull.

You just want to get your job done. You're ready. You know exactly what you want to write. Should be easy, just a few lines of code and...

```shell
$ snazel yakshave
Error: Cannot yakshave. The electric shears are not compatible with the European socket.
```
You mutter a mild curse, something below the f-word. Not loud enough to disturb the other fish in the coding tank, but loud enough for your teammate to chuckle. "Yakshaving?" they ask, their battle-scars twisting as they grin in camraderie.

You nod.

"The snazel team gave us this script. Try running it and see what happens?"

You do. Still nothing. _Now_ you say the f-word, and someone three teams back chuckles. This is tech, nobody is happy with the code.

You jump to Slack.

```text
You: Hey, @snazel-team, could you fix the electric shears in snazel? This is blocking a very urgent production change.
```

And you wait. For ten whole minutes.

```text
Snazel-oncall: Sorry for being late! Taking a look...
You: Thanks! This is blocking critical progress in the Stockholm feature, so if we could find a fix quickly it would be great.
```

Maybe it's not _that_ urgent, but it definitely feels like it. You're blocked, after all, and you're already wasting too much time on this tool that should have just goddamn worked in the first place!

Fifteen minutes pass.

```text
Snazel-oncall: I don't see anything on our end. Could you please paste the full error message?
```

Ah. Right.

```text
You: <Pastes error message>
```

You really hope they don't take that much time. By this time, you've already been waiting **for an hour**. You're frustrated. Why do they keep changing things? Was it even such a good idea to change tools? The other ones were working just fi--

```text
Snazel-oncall: I think I got something! Did you change the version of the socket recently?
```

You look, and you see that indeed the socket version got upgraded in your branch due to some other changes.

```text
You: Yes, we did.
Snazel-oncall: Great! I'm sorry for the inconvenience. Because we haven't had time to fix the wool consistency index, the electric shears still depend on the old version of the sockets. I'll file a ticket with the team, and see if we can get it fixed ASAP. In the meantime, here is a patch to get you unblocked.
```

Thank Christ. **An hour and a half later**, you can freaking move on with your day.

# The Uno-Reverse-Card Moment

*Later on, in the Snazel team Slack*

```text
Snazel-lead: I see this new bug about unblocking the team to upgrade the electric plug. @Snazel-oncall, this seems high-priority.
Snazel-oncall: Yup, I agree. They are unblocked, but it's not pretty.
Snazel-lead: Do you think we'll have time to fix it?
Snazel-oncall: I'll get to it right away, I'll work when there's downtime between user questions in Slack.
```

As soon as `Snazel-oncall` started working on it, their Slack lit up:

```text
Other person: Hey, @snazel-team, could you fix the water tank, please?
```

`Snazel-oncall` spent an hour and a half helping that customer, asking for the full error message, and looking for a repro. In the end, the user had misconfigured `snazel`, and `Snazel-oncall` just had to point them to the right piece of documentation.

However, by that time, `Snazel-oncall` was already answering another user's question.

Legends say the Slack chain never broke, and `Snazel-oncall` is still "hoping to get to it as soon as they have a moment".

In the meantime, `Snazel-oncall` is angry. They're angry with the `Snazel` team because they don't have time to fix the actual error message. They're angry with the users because they keep pestering them.

Slowly, their faith in good engineering and competence erodes and, helping people, the very reason they got into dev tools to begin with, is now a chore.

Eventually, `Snazel-oncall` decided to buy actual yaks to shave somewhere else.

# The Point

Caveat Emptor
: This is the ranty bit, hold on to something. Ready? Let's go.

The point here is: Read your freaking error messages!

I don't mean just skim over them, looking for which keyword sounds blameable.

Read them!

In the error message:

```text
Error: Can't yakshave. The electric shears are not compatible with the European socket.
```

I'm going to bet my sweet sweet morning coffee sludge that if you run `git diff`, you'll see that you have, indeed, changed the freaking socket version to the European socket.

I don't know, maybe _that's_ the thing that's wrong with the code!

Yes, the error message is bad. It could give you more information. And yes, _even if you knew_ what the error was, it's still the fault of the Snazel team.

But, as a member of the Snazel-like team, I plead with you: Help me help you. Save me Slack round-trips. Save us both time, so that I have time to **fix** your actual issue instead of bumbling for an hour trying to find out what's wrong.

At the very minimum, give me the full error message when you ask for help. Even better, give me a branch of code to look at. It's not hard. I know you know how to push code to GitHub, because you're a competent engineer. If you give me a concrete set of steps (text commands, not words) to reproduce your issue, you'll make my list of "people I should help even if it takes some personal time."

You can be angry. That's fine. Another team blocked you through no fault of your own. I understand. I would be pissed too.

But that doesn't help you. What will help you is giving me all the context at once, so that we can leave this nasty episode behind quickly and go back to moaning together about a different tool.

Don't worry. Even if you're very nice and helpful, I promise to feel adequately bad for blocking your workflow.

[rust-errors]: https://rustc-dev-guide.rust-lang.org/diagnostics.html
