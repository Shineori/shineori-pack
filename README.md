# Shineori SMP Modpack

Client modpack for **play.shineori.me** (Fabric, Minecraft 26.3).
Set it up once and your mods update themselves whenever the pack changes.

**Pack link:** `https://shineori.github.io/shineori-pack/pack.toml`

> Don't want mods? You can still join with plain vanilla Minecraft. The pack just adds the minimap, JEI, textures and QoL stuff.

---

## Prism Launcher (fully automatic, recommended)

1. Create a new instance: **Minecraft 26.3**, loader **Fabric 0.19.5**.
2. Download [`packwiz-installer-bootstrap.jar`](https://shineori.github.io/shineori-pack/kit/packwiz-installer-bootstrap.jar).
3. Right-click the instance, **Folder**, and drop the jar into the `.minecraft` (or `minecraft`) folder.
4. **Edit**, **Settings**, **Custom commands**, tick the box, and paste into **Pre-launch command**:
   ```
   "$INST_JAVA" -jar packwiz-installer-bootstrap.jar https://shineori.github.io/shineori-pack/pack.toml
   ```
5. Hit Play. Every launch checks for updates automatically.

## Modrinth App (automatic)

See the Discord pin for the launch hook command (it's tested on Hasaam's PC).

## CurseForge app / Vanilla launcher (one double-click)

1. Make a Fabric 26.3 profile (CurseForge: Create Custom Profile; Vanilla: run the Fabric installer).
2. Download [`shineori-sync.zip`](https://shineori.github.io/shineori-pack/kit/shineori-sync.zip) and unzip it into the profile folder (the one with `mods` in it).
3. Double-click **`update-shineori.bat`** before you play. Needs Java 21 ([adoptium.net](https://adoptium.net)).

## Manual fallback

Grab the latest `.mrpack` or CurseForge `.zip` from Hasaam in Discord.

---

### For Hasaam: updating the pack
```
packwiz modrinth add <mod>
packwiz refresh
git add -A && git commit -m "add <mod>" && git push
```
Bump `version` in `pack.toml` when you feel like it. Friends get changes on next launch.
