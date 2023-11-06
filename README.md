# README

Scripts and dot files for setting up a new Manjaro Installation for my daily usage.

### Enable Deep sleep mode

Open `/etc/default/grub` and add `mem_sleep_default=deep to GRUB_CMDLINE_LINUX_DEFAULT`,
then run `update-grub`.

Example:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash mem_sleep_default=deep"
```
