
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

---
## Timers and schedules
---

### Luxe.timer

To schedule things ahead of time, you have two options.

- use `Luxe.timer` (returns a Timer instance)
- use `snow.utils.Timer` class directly

A comprehensive example of this is demonstrated in the [beginners guide](guide.four.html).   
A schedule is simply a function that will be called at a later time. As always, time in luxe is always in seconds.

```
override function ready() {

    var timer = Luxe.timer.schedule( time, function() {} );
        timer.stop();

}
```

&nbsp;

#### cancel your timers

This is important to note that when you set up a schedule, be aware that you might have a situation where the schedule must be stopped, to avoid game events happening in the menus etc.  Shown above is a single instance stopped, to cancel *all timers*,

`Luxe.timer.reset();`

#### roadmap

- pause all, pause single
- timer grouping, for pausing game specific timers vs menu specific timers

---

&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   