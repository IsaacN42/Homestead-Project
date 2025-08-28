import crafttweaker.api.recipe.SmithingRecipeManager;
//removing old recipes
smithing.remove(<item:minecraft:netherite_helmet>);
smithing.remove(<item:minecraft:netherite_chestplate>);
smithing.remove(<item:minecraft:netherite_leggings>);
smithing.remove(<item:minecraft:netherite_boots>);
smithing.remove(<item:minecraft:netherite_shovel>);
smithing.remove(<item:minecraft:netherite_pickaxe>);
smithing.remove(<item:minecraft:netherite_axe>);
smithing.remove(<item:minecraft:netherite_hoe>);
smithing.remove(<item:minecraft:netherite_sword>);
craftingTable.remove(<item:obsidianequipment:obsidian_helmet>);
craftingTable.remove(<item:obsidianequipment:obsidian_chestplate>);
craftingTable.remove(<item:obsidianequipment:obsidian_leggings>);
craftingTable.remove(<item:obsidianequipment:obsidian_boots>);
craftingTable.remove(<item:obsidianequipment:obsidian_sword>);
craftingTable.remove(<item:obsidianequipment:obsidian_pickaxe>);
craftingTable.remove(<item:obsidianequipment:obsidian_shovel>);
craftingTable.remove(<item:obsidianequipment:obsidian_axe>);
craftingTable.remove(<item:obsidianequipment:obsidian_hoe>);

//adding recipes
//netherite
<recipetype:minecraft:smithing>.addJsonRecipe( "netherite_helmet_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "minecraft:netherite_ingot"
        },
        "base": {
        "item": "obsidianequipment:obsidian_helmet"
        },
        "result": {
        "item": "minecraft:netherite_helmet"
        },
        "template": {
        "item": "minecraft:netherite_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "netherite_chestplate_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "minecraft:netherite_ingot"
        },
        "base": {
        "item": "obsidianequipment:obsidian_chestplate"
        },
        "result": {
        "item": "minecraft:netherite_chestplate"
        },
        "template": {
        "item": "minecraft:netherite_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "netherite_leggings_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "minecraft:netherite_ingot"
        },
        "base": {
        "item": "obsidianequipment:obsidian_leggings"
        },
        "result": {
        "item": "minecraft:netherite_leggings"
        },
        "template": {
        "item": "minecraft:netherite_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "netherite_boots_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "minecraft:netherite_ingot"
        },
        "base": {
        "item": "obsidianequipment:obsidian_boots"
        },
        "result": {
        "item": "minecraft:netherite_boots"
        },
        "template": {
        "item": "minecraft:netherite_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "netherite_sword_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "minecraft:netherite_ingot"
        },
        "base": {
        "item": "obsidianequipment:obsidian_sword"
        },
        "result": {
        "item": "minecraft:netherite_sword"
        },
        "template": {
        "item": "minecraft:netherite_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "netherite_pickaxe_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "minecraft:netherite_ingot"
        },
        "base": {
        "item": "obsidianequipment:obsidian_pickaxe"
        },
        "result": {
        "item": "minecraft:netherite_pickaxe"
        },
        "template": {
        "item": "minecraft:netherite_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "netherite_shovel_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "minecraft:netherite_ingot"
        },
        "base": {
        "item": "obsidianequipment:obsidian_shovel"
        },
        "result": {
        "item": "minecraft:netherite_shovel"
        },
        "template": {
        "item": "minecraft:netherite_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "netherite_axe_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "minecraft:netherite_ingot"
        },
        "base": {
        "item": "obsidianequipment:obsidian_axe"
        },
        "result": {
        "item": "minecraft:netherite_axe"
        },
        "template": {
        "item": "minecraft:netherite_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "netherite_hoe_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "minecraft:netherite_ingot"
        },
        "base": {
        "item": "obsidianequipment:obsidian_hoe"
        },
        "result": {
        "item": "minecraft:netherite_hoe"
        },
        "template": {
        "item": "minecraft:netherite_upgrade_smithing_template"
        }
    }
);

//obsidian
<recipetype:minecraft:smithing>.addJsonRecipe( "obsidian_helmet_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "obsidianequipment:obsidian_ingot"
        },
        "base": {
        "item": "minecraft:diamond_helmet"
        },
        "result": {
        "item": "obsidianequipment:obsidian_helmet"
        },
        "template": {
        "item": "kubejs:obsidian_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "obsidian_chestplate_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "obsidianequipment:obsidian_ingot"
        },
        "base": {
        "item": "minecraft:diamond_chestplate"
        },
        "result": {
        "item": "obsidianequipment:obsidian_chestplate"
        },
        "template": {
        "item": "kubejs:obsidian_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "obsidian_leggings_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "obsidianequipment:obsidian_ingot"
        },
        "base": {
        "item": "minecraft:diamond_leggings"
        },
        "result": {
        "item": "obsidianequipment:obsidian_leggings"
        },
        "template": {
        "item": "kubejs:obsidian_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "obsidian_boots_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "obsidianequipment:obsidian_ingot"
        },
        "base": {
        "item": "minecraft:diamond_boots"
        },
        "result": {
        "item": "obsidianequipment:obsidian_boots"
        },
        "template": {
        "item": "kubejs:obsidian_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "obsidian_sword_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "obsidianequipment:obsidian_ingot"
        },
        "base": {
        "item": "minecraft:diamond_sword"
        },
        "result": {
        "item": "obsidianequipment:obsidian_sword"
        },
        "template": {
        "item": "kubejs:obsidian_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "obsidian_pickaxe_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "obsidianequipment:obsidian_ingot"
        },
        "base": {
        "item": "minecraft:diamond_pickaxe"
        },
        "result": {
        "item": "obsidianequipment:obsidian_pickaxe"
        },
        "template": {
        "item": "kubejs:obsidian_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "obsidian_shovel_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "obsidianequipment:obsidian_ingot"
        },
        "base": {
        "item": "minecraft:diamond_shovel"
        },
        "result": {
        "item": "obsidianequipment:obsidian_shovel"
        },
        "template": {
        "item": "kubejs:obsidian_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "obsidian_axe_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "obsidianequipment:obsidian_ingot"
        },
        "base": {
        "item": "minecraft:diamond_axe"
        },
        "result": {
        "item": "obsidianequipment:obsidian_axe"
        },
        "template": {
        "item": "kubejs:obsidian_upgrade_smithing_template"
        }
    }
);

<recipetype:minecraft:smithing>.addJsonRecipe( "obsidian_hoe_smithing", {
        "type": "minecraft:smithing_transform",
        "addition": {
        "item": "obsidianequipment:obsidian_ingot"
        },
        "base": {
        "item": "minecraft:diamond_hoe"
        },
        "result": {
        "item": "obsidianequipment:obsidian_hoe"
        },
        "template": {
        "item": "kubejs:obsidian_upgrade_smithing_template"
        }
    }
);