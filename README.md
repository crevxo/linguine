# Linguine

A menu bar battery manager for Apple silicon Macs.

Lithium batteries wear fastest when held at 100%. Linguine stops charging at a
limit you choose. A limit around 80% keeps a Mac that lives on its charger from
sitting full all day.

## What it does

Click the menu bar icon and set the charge limit. The other controls are
optional:

- **Sailing mode:** Once the limit is reached, let the battery drift down a
  few percent before charging resumes, instead of trickling constantly.
- **Heat protection:** Pause charging when the battery runs hot.
- **Pause charging on sleep:** Do not top up with the lid shut.
- **Auto discharge:** If the battery is already above the limit, run it down
  to meet it.
- **Keep limit after quit:** The limit stays applied with the app closed.

The menu also shows live power flow and a history of charge over time.

## Schedules

Timed actions for when a flat rule isn't enough: set the limit to a value, top
up to 100% (the night before a trip), calibrate, discharge to the limit, or
pause charging. Each repeats daily, on weekdays, weekly, every two weeks, or
monthly.

## Installing

Download the `.dmg` from the [**Releases page**](../../releases/latest), open
it, and drag Linguine to Applications.

The first time it opens, Linguine asks to install its charging helper, and
macOS asks for your password once. Changing the charge limit means writing to
the Mac's power controller, which needs admin rights. The helper does that part
and runs as a launch daemon; the app itself runs as you.

If you open it from Downloads instead, it offers to move itself to
Applications.

To remove Linguine, download [`uninstall.sh`](uninstall.sh) and run
`sudo bash uninstall.sh`. It hands charging back to macOS and removes the
helper too.

**Apple silicon only** (M1/M2/M3/M4). It will not run on an Intel Mac.

## Updates

Linguine checks this repository for updates. It asks before downloading or
installing anything.

## Source

The source is in a private repo. This one holds the builds.

## Bugs

Open an [issue](../../issues). This has run mostly on my own Mac, so real
reports are useful.
