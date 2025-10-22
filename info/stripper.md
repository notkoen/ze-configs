# Writing Stripper Configs

Stripper:Source by Bailopan is an useful tool for fixing and modifying maps without having to recompile. Given its usefulness, this guide will serve as an introduction to the tool, and will cover various topis such as the limits of strippers, bad/good use cases, and other tips and tricks to help with writing strippers.

## Useful Links

- [Stripper:Source](https://www.bailopan.net/stripper/) - Contains a short guide and download links to the metamod plugin
- [Stripper Plugin](https://github.com/srcdslab/sm-plugin-stripper) - Sourcemod plugin version of Stripper:Source
- [bspsrc](https://github.com/ata4/bspsrc) - Useful tool for decompiling and extracting maps
- [VIDE](https://www.tophattwaffle.com/downloads/vide/) - Valve Integrated Development Environment that includes several useful tools, especially entity lump editor, to assist with writing strippers
- [Lumper](https://github.com/momentum-mod/lumper) - A more updated version of VIDE 
- [stripplier](https://github.com/Source2ZE/Stripplier) - Python tool for applying stripper changes to a VMF

## General Information

As stated earlier, strippers can allow mappers to edit maps without having to recompile. However, this tool is also limited to making changes that do not require recompiling. Some features of strippers include:

- Modifying the input/output (I/O) of entities
- Adding entities into a map
- Removing entities from a map
- Modifying the keyvalues of existing entities

### Comments

Comments in strippers is done by using the semicolon (`;`) symbol. While Stripper:Source does support the usage of `//` as comments, it is common practice to use `;` instead. Writing comments is useful for documenting changes so others can be informed of what was changed.

```text
;this is an example of a comment
```

```text
;Multiline comments can be done by
;starting several lines with semicolons
```

### Regex

Both stripper plugin

## Blocks

### Add

The `add:` block is used for adding entities into a map. Entities that require compilation in order to work (such as lights) cannnot be added. Otherwise, anything can be added into a map. When adding entities to a map, be sure to add all required keyvalues in order for the entity to work, although `origin:` may or may not be required. If the origin of an entity is omitted, it will default to spawning at `0, 0, 0`. Entity outputs can be included in the `add:` block, and does not require the use of `connections` unlike hammer VMFs.

> [!WARNING]
> While the base Stripper:Source plugin does support the use of `connections` block like VMFs, the Sourcepawn implementation of Stripper **DOES NOT**. It is better practice to not use `connections` block, both for cleanliness and compatability reasons.

```text
add:
{
    "classname" "info_target"
    "targetname" "Stage_CounterInit"
    "spawnflags" "0"
    "OnUser1" "Stage_CounterTemplate,ForceSpawn,,0,1"
    "OnUser1" "Stage_Counter,AddOutput,classname info_target,0.03,1"
    "OnUser1" "!self,Kill,,0.06,1"
}
```

```text
add:
{
    "origin" "-13296 2840 -6541"
    "UseRandomTime" "0"
    "RefireTime" "8"
    "targetname" "final_boss_npcspawntimer"
    "StartDisabled" "1"
    "spawnflags" "0"
    "classname" "logic_timer"
    "OnTimer" "finalboss_npcmaker_left,ForceSpawn,,0,-1"
    "OnTimer" "finalboss_npcmaker_right,ForceSpawn,,0,-1"
}
```

```text
add:
{
    "model" "*38"
    "targetname" "stage_3_teleport_perm_6"
    "target" "teleport_core_1_destination"
    "StartDisabled" "1"
    "spawnflags" "1"
    "origin" "-4456.59 2782.86 -1205.9"
    "classname" "trigger_teleport"
}
```

### Filter

As the name implies, this block removes entities from a map. Similar to the `add:` block, it is also limited to entities that do not require recompiling. When filtering entities on a map, you can filter things based different keyvalues such as `targetname`, `classname`, and `origin`. When filtering entities, you must be wary of what you are trying to filter as depending on what you in the block, it can end up removing more entities that you have intended.

Let's imagine you're trying to remove a `trigger_teleport` entity that is located at `100, 200, 300` and has the targetname of `teleport1`.

```text
filter:
{
    "classname" "trigger_teleport"
}
```

The block above will remove the teleport trigger that we wanted, but will also target all `trigger_teleport` entities.

```text
filter:
{
    "targetname" "teleport1"
}
```

The block above will also remove the teleport trigger that we wanted, but this has a chance of also targeting any other entity with the `targetname` of `teleport1`.

```text
filter:
{
    "classname" "trigger_teleport"
    "targetname" "teleport1"
    "origin" "100 200 300"
}
```

The block above is a much better filter block as it is more specific in what entity to target and remove, including three seperate keyvalues that make it distinct form other entities.

> [!WARNING]
> Certain entities, such as `worldspawn`, should not be filtered as this will cause a hard crash. Be careful with what you are targetting.
> [!TIP]
> `filter:` blocks support the usage of regex for targetting. 