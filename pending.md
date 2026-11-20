# Pending: Accurova Rhenium

Open steps after the 2026-11-20 rebrand (was TBJ-reels / thebooleanjulian-reels). Tick a box when done.

## 1. Laptop (needed before the studio pairs with the new site)
- [ ] Open the Drive folder `I:\My Drive\TheBooleanJulian_GD\accurova-rhenium` (it was renamed from `thebooleanjulian-reels`; wait for Drive to finish syncing).
- [ ] Repoint any shortcut, taskbar pin or bookmark to [`studio.bat`](studio.bat) in the new folder.
- [ ] Double-click `studio.bat`. It opens https://rhenium.accurova.com and should show "connected". If it says to update, close and reopen `studio.bat`.
- [ ] Optional: move `%USERPROFILE%\.tbj-reels` to `%USERPROFILE%\.accurova-rhenium`. Until you do, the old folder is still used, so nothing is re-rendered.

## 2. Google sign-in and cloud sync (still switched off)
- [ ] Create a Google OAuth web client: https://console.cloud.google.com/apis/credentials, redirect URI `https://rhenium.accurova.com/auth/callback`.
- [ ] Review and merge the schema PR (renamed to `accurova_rhenium`): https://github.com/TheBooleanJulian/thebooleanjulian-db/pull/8. `apply.mjs` also applies 5 other pending migrations, including `rename_schemas_to_repo_names`, so decide the order first.
- [ ] Apply migrations and provision the database role: `node scripts/apply.mjs`, then `node scripts/provision.mjs <supabase.env> accurova_rhenium <out dir>` in thebooleanjulian-db. This gives the Hyperdrive id for `accurova-rhenium-db`.
- [ ] Uncomment the `hyperdrive` block in [`wrangler.jsonc`](wrangler.jsonc) and put in that id.
- [ ] Set the secrets, from this repo's folder: `npx wrangler secret put GOOGLE_CLIENT_ID`, then `GOOGLE_CLIENT_SECRET`, then `SESSION_SECRET`.
- [ ] Redeploy with `npx wrangler deploy` (from `main`), then check https://rhenium.accurova.com/auth/me.

## 3. Cleanup and polish
- [ ] Rename the dev clone `C:\Users\Temp\dev\tbj-reels-dev` to `accurova-rhenium` (close editors first).
- [ ] Update the Workers Builds or CI repo link if one was set to the old repo name: https://dash.cloudflare.com (GitHub redirects the old URL, so this isn't urgent).
- [ ] Decide whether the studio page keeps the Julian Unified UI palette or moves to an Accurova palette ([`studio/index.html`](studio/index.html), token block near line 22).
- [ ] Re-transcribe Congruence-01 (the transcript is still the broken 228-word one).
