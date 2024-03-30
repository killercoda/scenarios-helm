### Helm upgrade flags

Beside the flags for the `install` command, the `upgrade` command has the `--cleanup-on-fail` flag which will allow the deletion of the new resources introduced in the upgrade.
It can be used together with the `--atomic` for reverting the release to the revision before the upgrade, because using only `--atomic` means that the resources present before the upgrade will stay the same but the newly introduced resources (if they exists) will be left dangling in the cluster.

