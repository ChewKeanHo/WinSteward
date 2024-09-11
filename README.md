# WinSteward

[![WinSteward](https://raw.githubusercontent.com/ChewKeanHo/WinSteward/main/src/icons/banner_1200x160.svg)](#)

Shell script for sealing a customized Windows OS as a disk image for
distributing across the organization legally. The target Windows OS shall load
not only the first Windows OS bootup but also the organization's custom settings
and policies.

**This is NOT A TOOL for Windows OS piracy!** You still need to purchase the
Windows OS license for your target. As of 2024 with Windows 10 and above, they
should already have one when you purchase an endpoint (unless you customized
too far with your vendor).




## Why It Matters

This project was initiated primarily because of:

1. **Have a sane way of managing all endpoints within an organization** -
   maintains high consistency, low wait time, and quick re-format for responding
   against new generation malware.
2. **Single control surface for Windows OS** - IT department maintains only 1
   Windows OS image (prime) rather than every machines.
3. **Maintains good relationship with Microsoft** - When managing mulitple
   organizations with proper legal compliances, we need a good way.
4. **No more Cortana or AI first boot greeting** - seriously, it's very
   annoying when you have 10 endpoints running at the same time.




## Design Principles

The definitions complies to only the following rules:

1. **STRICTLY 1 file payload** - easier to audit, download, and deploy.

This library is heavily guarded with unit tests whenever available.




## License

This project is licensed under [Chew Kean Ho's WinSteward License Agreement](LICENSE.pdf).
