# Drift: how this repo handles it

## How it's found
A scheduled workflow plans prod every weekday at 07:00 and opens an issue when the plan isn't empty.

## What I do when it fires
1. Read the plan in the run's log: what changed, and who changed it (the Activity log).
2. If the change was a mistake, run the apply workflow to put Azure back to the code.
3. If the change was wanted, write it into the code through a pull request, so the plan is empty again.
4. Never leave it: drift that stays makes every later plan harder to read.

## The test I ran
- On 17 Nov 2026 I added a tag outside Terraform with `az network vnet update --set tags.changedby=portal` on vnet-iac-w06. My first drift check found no changes, because I had approved an apply in between, and that apply had already removed the tag. Any apply fixes drift, not just the change it was started for, so read the plan before approving. I added the tag again and ran the drift check straight away: it planned 1 to change and opened issue #11. The change wasn't wanted, so I ran the apply workflow by hand and approved it (1 to change, removing the tag). A second drift check found no changes, and I closed the issue with a comment.
- The drift job first failed to sign in (AADSTS700213) because GitHub sends subjects with my account and repo IDs. I added a federated credential for `repo:jasonwalker3003@268015595/terraform-iac-pipeline@1451709029:environment:drift`, and after a few minutes for it to take effect, the job signed in.
