# POSTMORTEM

This is a incident report for an imaginary latency issues due to a surge in demand on a social media platform.

## Issue

From Wednesday 11, May 2022, our customer services team began receiving querries that our messages are taking longer to load than usual. At it's peak, up to 35% of our users could not send or receive messages. The root cause of the issue was that our cache services were running out of allocated space due to a limited space allocation.

## Timelines:
- May 3: Our daily sign-ups grew by 30%
- May 10: The number of users doubled
- May 11: Latency issues first reported
- May 12, 7:00 pm: 35% of our clients couldn't send messages
- May 13, 3:00 am: Doubled the size of memory allocated on caching messages
- May 13, 3:00 pm: Deployed a separate server for caching messages
- May 13, 5:00 pm: Set new monitor alerts for cache data
- May 14: No more latency issues reported

## Root Cause

On May 1, we released an alpha-stage android app to serve access to our platform from mobile. On may 3, we recorded an increase in 30% of sign-ups on our platform, from both android and web app users, something we were happy of. But on May 11, our users began reporting that messages were taking longer to load. On May 12, 7:00 am, we started noticing that our servers could only handle 65% of online users.
Upon inspection, we noticed that our cache service was the problem, as it was limited to 32GB of storage. With our users able to send messages and videos to each other, this memory got quickly exhausted, and the traffic hitting our end servers increased highly, cutting some of our customers out of service.

## Resolution and Recovery

On May 12, 9:24 pm, we doubled the size of the memory allocated to caching. Because we only have a few servers, we waited for 3:00 am when most of our users are not active to restart our servers. At 3:00 pm, we deployed a dedicated server for caching, and started to move traffic to it gradually.
On May 14, we were not getting more latency reports

## Corrective and Preventive Measures

After this incident, we spent 2 days discussing about this incident and we decided on implementing the following:
- Do extensive monitoring and alerting of memory and performance issues
- Increase budget allocated to our cloud operations
- Implement code to deploy new servers if resource utilization of any server averages 85% for three straight days.

We would like to apologize to all our users who were affected by the latency, and promise to do all we can to prevent similar experience.
