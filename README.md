# Linguine

A menu bar battery manager for Apple silicon Macs.

Lithium batteries wear fastest when held at 100%. Linguine stops charging at a
limit you choose -- 80% is the usual pick -- so a Mac that lives on its charger
isn't sitting full all day.

## What it does

Click the menu bar icon and set the charge limit. That's the whole of the basic
use. The rest is optional:

- **Sailing mode** -- once the limit is reached, let the battery drift down a
  few percent before charging resumes, instead of trickling constantly.
- **Heat protection** -- pause charging when the battery runs hot.
- **Pause charging on sleep** -- don't top up with the lid shut.
- **Auto discharge** -- if the battery is already above the limit, run it down
  to meet it.
- **Keep limit after quit** -- the limit stays applied with the app closed.

The menu also shows live power flow and a history of charge over time.

## Schedules

Timed actions for when a flat rule isn't enough: set the limit to a value, top
up to 100% (the night before a trip), calibrate, discharge to the limit, or
pause charging. Each repeats daily, on weekdays, weekly, every two weeks, or
monthly.

## Installing

**Don't drag this one to Applications** -- it won't work on its own.

Download the zip from the [**Releases page**](../../releases/latest) and unzip
it. Open that folder in Terminal and run:

```
sudo ./install.sh
```

It asks for your password because changing the charge limit means writing to
the Mac's power controller, which needs admin rights. A small helper does that
part and is installed as a launch daemon; the app itself runs as you.

`./uninstall.sh` removes everything, helper included.

**Apple silicon only** (M1/M2/M3/M4). It will not run on an Intel Mac.

## Updates

Linguine does not update itself. Watch this repo to hear when a new version
lands.

## Source

The source is in a private repo. This one holds the builds.

## Bugs

Open an [issue](../../issues). This has run mostly on my own Mac, so real
reports are useful.
