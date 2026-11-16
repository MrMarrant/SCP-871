# SCP-871

This is an addon for Garry's mod game.

## ⚙️ Installation

Install the addon from the workshop page or by downloading the zip and placing its contents in the `addons` folder on your server/game.

## 🛠️ Functionality

SCP-871 is a self-replicating cake, available in the spawn menu under the **SCP** category.

- **Self-replication**: every cake spawns a new copy of itself nearby at a regular interval. New cakes are placed on the ground around the original, never through walls, and fade in with a spawn sound.
- **Random appearance**: each cake gets a random size and a random combination of bodygroups.
- **Eating**: press `Use` on a cake to eat it. A player must then wait before eating another cake. This cooldown is reset when the player dies or changes team.
- **Destruction**: cakes have health and explode into crumbs when destroyed.
- **Respawn**: a cake that has been eaten or destroyed respawns at the same spot after a delay.
- **Limit**: the total number of cakes on the map can be capped.

### ConVars

| ConVar | Default | Description |
| --- | --- | --- |
| `scp_871_delay_respawn` | `300` | Delay (in seconds) before a cake duplicates, or respawns after being eaten/destroyed. |
| `scp_871_cake_health` | `10` | Health of a cake. |
| `scp_871_limit` | `0` | Maximum number of cakes on the map (`0` = no limit). |
| `scp_871_delay_eat` | `180` | Delay (in seconds) before a player can eat another cake. |

### Commands

Admin/superadmin only.

| Command | Description |
| --- | --- |
| `scp_871_clear_respawn_cake` | Clear all pending respawn timers of eaten or destroyed cakes. |
| `scp_871_clear_all_cake` | Remove every cake on the map and clear all pending respawn timers. |

Both commands are also available through **ULX** (`ulx scp_871_clear_respawn_cake`, `!scp_871_clear_respawn_cake`, ...) and **SAM**, under the `SCP-871` category.

## 🧮 Contributing

Pull requests are welcome. For major changes, please open an issue first<br>
to discuss what you would like to change.<br>

## 📄 License
