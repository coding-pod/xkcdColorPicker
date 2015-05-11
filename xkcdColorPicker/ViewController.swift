//
//  ViewController.swift
//  ColorPicker
//
//  Created by Lee-kai Wang on 5/7/15.
//  Copyright (c) 2015 Lee-kai Wang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let colors = ["acc2d9": "cloudy blue", "56ae57": "dark pastel green", "b2996e": "dust", "a8ff04": "electric lime", "69d84f": "fresh green", "894585": "light eggplant", "70b23f": "nasty green", "d4ffff": "really light blue", "65ab7c": "tea", "952e8f": "warm purple", "fcfc81": "yellowish tan", "a5a391": "cement", "388004": "dark grass green", "4c9085": "dusty teal", "5e9b8a": "grey teal", "efb435": "macaroni and cheese", "d99b82": "pinkish tan", "0a5f38": "spruce", "0c06f7": "strong blue", "61de2a": "toxic green", "3778bf": "windows blue", "2242c7": "blue blue", "533cc6": "blue with a hint of purple", "9bb53c": "booger", "05ffa6": "bright sea green", "1f6357": "dark green blue", "017374": "deep turquoise", "0cb577": "green teal", "ff0789": "strong pink", "afa88b": "bland", "08787f": "deep aqua", "dd85d7": "lavender pink", "a6c875": "light moss green", "a7ffb5": "light seafoam green", "c2b709": "olive yellow", "e78ea5": "pig pink", "966ebd": "deep lilac", "ccad60": "desert", "ac86a8": "dusty lavender", "947e94": "purpley grey", "983fb2": "purply", "ff63e9": "candy pink", "b2fba5": "light pastel green", "63b365": "boring green", "8ee53f": "kiwi green", "b7e1a1": "light grey green", "ff6f52": "orange pink", "bdf8a3": "tea green", "d3b683": "very light brown", "fffcc4": "egg shell", "430541": "eggplant purple", "ffb2d0": "powder pink", "997570": "reddish grey", "ad900d": "baby shit brown", "c48efd": "liliac", "507b9c": "stormy blue", "7d7103": "ugly brown", "fffd78": "custard", "da467d": "darkish pink", "410200": "deep brown", "c9d179": "greenish beige", "fffa86": "manilla", "5684ae": "off blue", "6b7c85": "battleship grey", "6f6c0a": "browny green", "7e4071": "bruise", "009337": "kelley green", "d0e429": "sickly yellow", "fff917": "sunny yellow", "1d5dec": "azul", "054907": "darkgreen", "b5ce08": "green/yellow", "8fb67b": "lichen", "c8ffb0": "light light green", "fdde6c": "pale gold", "ffdf22": "sun yellow", "a9be70": "tan green", "6832e3": "burple", "fdb147": "butterscotch", "c7ac7d": "toupe", "fff39a": "dark cream", "850e04": "indian red", "efc0fe": "light lavendar", "40fd14": "poison green", "b6c406": "baby puke green", "9dff00": "bright yellow green", "3c4142": "charcoal grey", "f2ab15": "squash", "ac4f06": "cinnamon", "c4fe82": "light pea green", "2cfa1f": "radioactive green", "9a6200": "raw sienna", "ca9bf7": "baby purple", "875f42": "cocoa", "3a2efe": "light royal blue", "fd8d49": "orangeish", "8b3103": "rust brown", "cba560": "sand brown", "698339": "swamp", "0cdc73": "tealish green", "b75203": "burnt siena", "7f8f4e": "camo", "26538d": "dusk blue", "63a950": "fern", "c87f89": "old rose", "b1fc99": "pale light green", "ff9a8a": "peachy pink", "f6688e": "rosy pink", "76fda8": "light bluish green", "53fe5c": "light bright green", "4efd54": "light neon green", "a0febf": "light seafoam", "7bf2da": "tiffany blue", "bcf5a6": "washed out green", "ca6b02": "browny orange", "107ab0": "nice blue", "2138ab": "sapphire", "719f91": "greyish teal", "fdb915": "orangey yellow", "fefcaf": "parchment", "fcf679": "straw", "1d0200": "very dark brown", "cb6843": "terracota", "31668a": "ugly blue", "247afd": "clear blue", "ffffb6": "creme", "90fda9": "foam green", "86a17d": "grey/green", "fddc5c": "light gold", "78d1b6": "seafoam blue", "13bbaf": "topaz", "fb5ffc": "violet pink", "20f986": "wintergreen", "ffe36e": "yellow tan", "9d0759": "dark fuchsia", "3a18b1": "indigo blue", "c2ff89": "light yellowish green", "d767ad": "pale magenta", "720058": "rich purple", "ffda03": "sunflower yellow", "01c08d": "green/blue", "ac7434": "leather", "014600": "racing green", "9900fa": "vivid purple", "02066f": "dark royal blue", "8e7618": "hazel", "d1768f": "muted pink", "96b403": "booger green", "fdff63": "canary", "95a3a6": "cool grey", "7f684e": "dark taupe", "751973": "darkish purple", "089404": "true green", "ff6163": "coral pink", "598556": "dark sage", "214761": "dark slate blue", "3c73a8": "flat blue", "ba9e88": "mushroom", "021bf9": "rich blue", "734a65": "dirty purple", "23c48b": "greenblue", "8fae22": "icky green", "e6f2a2": "light khaki", "4b57db": "warm blue", "d90166": "dark hot pink", "015482": "deep sea blue", "9d0216": "carmine", "728f02": "dark yellow green", "ffe5ad": "pale peach", "4e0550": "plum purple", "f9bc08": "golden rod", "ff073a": "neon red", "c77986": "old pink", "d6fffe": "very pale blue", "fe4b03": "blood orange", "fd5956": "grapefruit", "fce166": "sand yellow", "b2713d": "clay brown", "1f3b4d": "dark blue grey", "699d4c": "flat green", "56fca2": "light green blue", "fb5581": "warm pink", "3e82fc": "dodger blue", "a0bf16": "gross green", "d6fffa": "ice", "4f738e": "metallic blue", "ffb19a": "pale salmon", "5c8b15": "sap green", "54ac68": "algae", "89a0b0": "bluey grey", "7ea07a": "greeny grey", "1bfc06": "highlighter green", "cafffb": "light light blue", "b6ffbb": "light mint", "a75e09": "raw umber", "152eff": "vivid blue", "8d5eb7": "deep lavender", "5f9e8f": "dull teal", "63f7b4": "light greenish blue", "606602": "mud green", "fc86aa": "pinky", "8c0034": "red wine", "758000": "shit green", "ab7e4c": "tan brown", "030764": "darkblue", "fe86a4": "rosa", "d5174e": "lipstick", "fed0fc": "pale mauve", "680018": "claret", "fedf08": "dandelion", "fe420f": "orangered", "6f7c00": "poop green", "ca0147": "ruby", "1b2431": "dark", "00fbb0": "greenish turquoise", "db5856": "pastel red", "ddd618": "piss yellow", "41fdfe": "bright cyan", "cf524e": "dark coral", "21c36f": "algae green", "a90308": "darkish red", "6e1005": "reddy brown", "fe828c": "blush pink", "4b6113": "camouflage green", "4da409": "lawn green", "beae8a": "putty", "0339f8": "vibrant blue", "a88f59": "dark sand", "5d21d0": "purple/blue", "feb209": "saffron", "4e518b": "twilight", "964e02": "warm brown", "85a3b2": "bluegrey", "ff69af": "bubble gum pink", "c3fbf4": "duck egg blue", "2afeb7": "greenish cyan", "005f6a": "petrol", "0c1793": "royal", "ffff81": "butter", "f0833a": "dusty orange", "f1f33f": "off yellow", "b1d27b": "pale olive green", "fc824a": "orangish", "71aa34": "leaf", "b7c9e2": "light blue grey", "4b0101": "dried blood", "a552e6": "lightish purple", "af2f0d": "rusty red", "8b88f8": "lavender blue", "9af764": "light grass green", "a6fbb2": "light mint green", "ffc512": "sunflower", "750851": "velvet", "c14a09": "brick orange", "fe2f4a": "lightish red", "0203e2": "pure blue", "0a437a": "twilight blue", "a50055": "violet red", "ae8b0c": "yellowy brown", "fd798f": "carnation", "bfac05": "muddy yellow", "3eaf76": "dark seafoam green", "c74767": "deep rose", "b9484e": "dusty red", "647d8e": "grey/blue", "bffe28": "lemon lime", "d725de": "purple/pink", "b29705": "brown yellow", "673a3f": "purple brown", "a87dc2": "wisteria", "fafe4b": "banana yellow", "c0022f": "lipstick red", "0e87cc": "water blue", "8d8468": "brown grey", "ad03de": "vibrant purple", "8cff9e": "baby green", "94ac02": "barf green", "c4fff7": "eggshell blue", "fdee73": "sandy yellow", "33b864": "cool green", "fff9d0": "pale", "758da3": "blue/grey", "f504c9": "hot magenta", "77a1b5": "greyblue", "8756e4": "purpley", "889717": "baby shit green", "c27e79": "brownish pink", "017371": "dark aquamarine", "9f8303": "diarrhea", "f7d560": "light mustard", "bdf6fe": "pale sky blue", "75b84f": "turtle green", "9cbb04": "bright olive", "29465b": "dark grey blue", "696006": "greeny brown", "adf802": "lemon green", "c1c6fc": "light periwinkle", "35ad6b": "seaweed green", "fffd37": "sunshine yellow", "a442a0": "ugly purple", "f36196": "medium pink", "947706": "puke brown", "fff4f2": "very light pink", "1e9167": "viridian", "b5c306": "bile", "feff7f": "faded yellow", "cffdbc": "very pale green", "0add08": "vibrant green", "87fd05": "bright lime", "1ef876": "spearmint", "7bfdc7": "light aquamarine", "bcecac": "light sage", "bbf90f": "yellowgreen", "ab9004": "baby poo", "1fb57a": "dark seafoam", "00555a": "deep teal", "a484ac": "heather", "c45508": "rust orange", "3f829d": "dirty blue", "548d44": "fern green", "c95efb": "bright lilac", "3ae57f": "weird green", "016795": "peacock blue", "87a922": "avocado green", "f0944d": "faded orange", "5d1451": "grape purple", "25ff29": "hot green", "d0fe1d": "lime yellow", "ffa62b": "mango", "01b44c": "shamrock", "ff6cb5": "bubblegum", "6b4247": "purplish brown", "c7c10c": "vomit yellow", "b7fffa": "pale cyan", "aeff6e": "key lime", "ec2d01": "tomato red", "76ff7b": "lightgreen", "730039": "merlot", "040348": "night blue", "df4ec8": "purpleish pink", "6ecb3c": "apple", "8f9805": "baby poop green", "5edc1f": "green apple", "d94ff5": "heliotrope", "c8fd3d": "yellow/green", "070d0d": "almost black", "4984b8": "cool blue", "51b73b": "leafy green", "ac7e04": "mustard brown", "4e5481": "dusk", "876e4b": "dull brown", "58bc08": "frog green", "2fef10": "vivid green", "2dfe54": "bright light green", "0aff02": "fluro green", "9cef43": "kiwi", "18d17b": "seaweed", "35530a": "navy green", "1805db": "ultramarine blue", "6258c4": "iris", "ff964f": "pastel orange", "ffab0f": "yellowish orange", "8f8ce7": "perrywinkle", "24bca8": "tealish", "3f012c": "dark plum", "cbf85f": "pear", "ff724c": "pinkish orange", "280137": "midnight purple", "b36ff6": "light urple", "48c072": "dark mint", "bccb7a": "greenish tan", "a8415b": "light burgundy", "06b1c4": "turquoise blue", "cd7584": "ugly pink", "f1da7a": "sandy", "ff0490": "electric pink", "805b87": "muted purple", "50a747": "mid green", "a8a495": "greyish", "cfff04": "neon yellow", "ffff7e": "banana", "ff7fa7": "carnation pink", "ef4026": "tomato", "3c9992": "sea", "886806": "muddy brown", "04f489": "turquoise green", "fef69e": "buff", "cfaf7b": "fawn", "3b719f": "muted blue", "fdc1c5": "pale rose", "20c073": "dark mint green", "9b5fc0": "amethyst", "0f9b8e": "blue/green", "742802": "chestnut", "9db92c": "sick green", "a4bf20": "pea", "cd5909": "rusty orange", "ada587": "stone", "be013c": "rose red", "b8ffeb": "pale aqua", "dc4d01": "deep orange", "a2653e": "earth", "638b27": "mossy green", "419c03": "grassy green", "b1ff65": "pale lime green", "9dbcd4": "light grey blue", "fdfdfe": "pale grey", "77ab56": "asparagus", "464196": "blueberry", "990147": "purple red", "befd73": "pale lime", "32bf84": "greenish teal", "af6f09": "caramel", "a0025c": "deep magenta", "ffd8b1": "light peach", "7f4e1e": "milk chocolate", "bf9b0c": "ocher", "6ba353": "off green", "f075e6": "purply pink", "7bc8f6": "lightblue", "475f94": "dusky blue", "f5bf03": "golden", "fffeb6": "light beige", "fffd74": "butter yellow", "895b7b": "dusky purple", "436bad": "french blue", "d0c101": "ugly yellow", "c6f808": "greeny yellow", "f43605": "orangish red", "02c14d": "shamrock green", "b25f03": "orangish brown", "2a7e19": "tree green", "490648": "deep violet", "536267": "gunmetal", "5a06ef": "blue/purple", "cf0234": "cherry", "c4a661": "sandy brown", "978a84": "warm grey", "1f0954": "dark indigo", "03012d": "midnight", "2bb179": "bluey green", "c3909b": "grey pink", "a66fb5": "soft purple", "770001": "blood", "922b05": "brown red", "7d7f7c": "medium grey", "990f4b": "berry", "8f7303": "poo", "c83cb9": "purpley pink", "fea993": "light salmon", "acbb0d": "snot", "c071fe": "easter purple", "ccfd7f": "light yellow green", "00022e": "dark navy blue", "828344": "drab", "ffc5cb": "light rose", "ab1239": "rouge", "b0054b": "purplish red", "99cc04": "slime green", "937c00": "baby poop", "019529": "irish green", "ef1de7": "pink/purple", "000435": "dark navy", "42b395": "greeny blue", "9d5783": "light plum", "c8aca9": "pinkish grey", "c87606": "dirty orange", "aa2704": "rust red", "e4cbff": "pale lilac", "fa4224": "orangey red", "0804f9": "primary blue", "5cb200": "kermit green", "76424e": "brownish purple", "6c7a0e": "murky green", "fbdd7e": "wheat", "2a0134": "very dark purple", "044a05": "bottle green", "fd4659": "watermelon", "0d75f8": "deep sky blue", "fe0002": "fire engine red", "cb9d06": "yellow ochre", "fb7d07": "pumpkin orange", "b9cc81": "pale olive", "edc8ff": "light lilac", "61e160": "lightish green", "8ab8fe": "carolina blue", "920a4e": "mulberry", "fe02a2": "shocking pink", "9a3001": "auburn", "65fe08": "bright lime green", "befdb7": "celadon", "b17261": "pinkish brown", "885f01": "poo brown", "02ccfe": "bright sky blue", "c1fd95": "celery", "836539": "dirt brown", "fb2943": "strawberry", "84b701": "dark lime", "b66325": "copper", "7f5112": "medium brown", "5fa052": "muted green", "6dedfd": "robin's egg", "0bf9ea": "bright aqua", "c760ff": "bright lavender", "ffffcb": "ivory", "f6cefc": "very light purple", "155084": "light navy", "f5054f": "pink red", "645403": "olive brown", "7a5901": "poop brown", "a8b504": "mustard green", "3d9973": "ocean green", "000133": "very dark blue", "76a973": "dusty green", "2e5a88": "light navy blue", "0bf77d": "minty green", "bd6c48": "adobe", "ac1db8": "barney", "2baf6a": "jade green", "26f7fd": "bright light blue", "aefd6c": "light lime", "9b8f55": "dark khaki", "ffad01": "orange yellow", "c69c04": "ocre", "f4d054": "maize", "de9dac": "faded pink", "05480d": "british racing green", "c9ae74": "sandstone", "60460f": "mud brown", "98f6b0": "light sea green", "8af1fe": "robin egg blue", "2ee8bb": "aqua marine", "11875d": "dark sea green", "fdb0c0": "soft pink", "b16002": "orangey brown", "f7022a": "cherry red", "d5ab09": "burnt yellow", "86775f": "brownish grey", "c69f59": "camel", "7a687f": "purplish grey", "042e60": "marine", "c88d94": "greyish pink", "a5fbd5": "pale turquoise", "fffe71": "pastel yellow", "6241c7": "bluey purple", "fffe40": "canary yellow", "d3494e": "faded red", "985e2b": "sepia", "a6814c": "coffee", "ff08e8": "bright magenta", "9d7651": "mocha", "feffca": "ecru", "98568d": "purpleish", "9e003a": "cranberry", "287c37": "darkish green", "b96902": "brown orange", "ba6873": "dusky rose", "ff7855": "melon", "94b21c": "sickly green", "c5c9c7": "silver", "661aee": "purply blue", "6140ef": "purpleish blue", "9be5aa": "hospital green", "7b5804": "shit brown", "276ab3": "mid blue", "feb308": "amber", "8cfd7e": "easter green", "6488ea": "soft blue", "056eee": "cerulean blue", "b27a01": "golden brown", "0ffef9": "bright turquoise", "fa2a55": "red pink", "820747": "red purple", "7a6a4f": "greyish brown", "f4320c": "vermillion", "a13905": "russet", "6f828a": "steel grey", "a55af4": "lighter purple", "ad0afd": "bright violet", "004577": "prussian blue", "658d6d": "slate green", "ca7b80": "dirty pink", "005249": "dark blue green", "2b5d34": "pine", "bff128": "yellowy green", "b59410": "dark gold", "2976bb": "bluish", "014182": "darkish blue", "bb3f3f": "dull red", "fc2647": "pinky red", "a87900": "bronze", "82cbb2": "pale teal", "667c3e": "military green", "fe46a5": "barbie pink", "fe83cc": "bubblegum pink", "94a617": "pea soup green", "a88905": "dark mustard", "7f5f00": "shit", "9e43a2": "medium purple", "062e03": "very dark green", "8a6e45": "dirt", "cc7a8b": "dusky pink", "9e0168": "red violet", "fdff38": "lemon yellow", "c0fa8b": "pistachio", "eedc5b": "dull yellow", "7ebd01": "dark lime green", "3b5b92": "denim blue", "01889f": "teal blue", "3d7afd": "lightish blue", "5f34e7": "purpley blue", "6d5acf": "light indigo", "748500": "swamp green", "706c11": "brown green", "3c0008": "dark maroon", "cb00f5": "hot purple", "002d04": "dark forest green", "658cbb": "faded blue", "749551": "drab green", "b9ff66": "light lime green", "9dc100": "snot green", "faee66": "yellowish", "7efbb3": "light blue green", "7b002c": "bordeaux", "c292a1": "light mauve", "017b92": "ocean", "fcc006": "marigold", "657432": "muddy green", "d8863b": "dull orange", "738595": "steel", "aa23ff": "electric purple", "08ff08": "fluorescent green", "9b7a01": "yellowish brown", "f29e8e": "blush", "6fc276": "soft green", "ff5b00": "bright orange", "fdff52": "lemon", "866f85": "purple grey", "8ffe09": "acid green", "eecffe": "pale lavender", "510ac9": "violet blue", "4f9153": "light forest green", "9f2305": "burnt red", "728639": "khaki green", "de0c62": "cerise", "916e99": "faded purple", "ffb16d": "apricot", "3c4d03": "dark olive green", "7f7053": "grey brown", "77926f": "green grey", "010fcc": "true blue", "ceaefa": "pale violet", "8f99fb": "periwinkle blue", "c6fcff": "light sky blue", "5539cc": "blurple", "544e03": "green brown", "017a79": "bluegreen", "01f9c6": "bright teal", "c9b003": "brownish yellow", "929901": "pea soup", "0b5509": "forest", "a00498": "barney purple", "2000b1": "ultramarine", "94568c": "purplish", "c2be0e": "puke yellow", "748b97": "bluish grey", "665fd1": "dark periwinkle", "9c6da5": "dark lilac", "c44240": "reddish", "a24857": "light maroon", "825f87": "dusty purple", "c9643b": "terra cotta", "90b134": "avocado", "01386a": "marine blue", "25a36f": "teal green", "59656d": "slate grey", "75fd63": "lighter green", "21fc0d": "electric green", "5a86ad": "dusty blue", "fec615": "golden yellow", "fffd01": "bright yellow", "dfc5fe": "light lavender", "b26400": "umber", "7f5e00": "poop", "de7e5d": "dark peach", "048243": "jungle green", "ffffd4": "eggshell", "3b638c": "denim", "b79400": "yellow brown", "84597e": "dull purple", "411900": "chocolate brown", "7b0323": "wine red", "04d9ff": "neon blue", "667e2c": "dirty green", "fbeeac": "light tan", "d7fffe": "ice blue", "4e7496": "cadet blue", "874c62": "dark mauve", "d5ffff": "very light blue", "826d8c": "grey purple", "ffbacd": "pastel pink", "d1ffbd": "very light green", "448ee4": "dark sky blue", "05472a": "evergreen", "d5869d": "dull pink", "3d0734": "aubergine", "4a0100": "mahogany", "f8481c": "reddish orange", "02590f": "deep green", "89a203": "vomit green", "e03fd8": "purple pink", "d58a94": "dusty pink", "7bb274": "faded green", "526525": "camo green", "c94cbe": "pinky purple", "db4bda": "pink purple", "9e3623": "brownish red", "b5485d": "dark rose", "735c12": "mud", "9c6d57": "brownish", "028f1e": "emerald green", "b1916e": "pale brown", "49759c": "dull blue", "a0450e": "burnt umber", "39ad48": "medium green", "b66a50": "clay", "8cffdb": "light aqua", "a4be5c": "light olive green", "cb7723": "brownish orange", "05696b": "dark aqua", "ce5dae": "purplish pink", "c85a53": "dark salmon", "96ae8d": "greenish grey", "1fa774": "jade", "7a9703": "ugly green", "ac9362": "dark beige", "01a049": "emerald", "d9544d": "pale red", "fa5ff7": "light magenta", "82cafc": "sky", "acfffc": "light cyan", "fcb001": "yellow orange", "910951": "reddish purple", "fe2c54": "reddish pink", "c875c4": "orchid", "cdc50a": "dirty yellow", "fd411e": "orange red", "9a0200": "deep red", "be6400": "orange brown", "030aa7": "cobalt blue", "fe019a": "neon pink", "f7879a": "rose pink", "887191": "greyish purple", "b00149": "raspberry", "12e193": "aqua green", "fe7b7c": "salmon pink", "ff9408": "tangerine", "6a6e09": "brownish green", "8b2e16": "red brown", "696112": "greenish brown", "e17701": "pumpkin", "0a481e": "pine green", "343837": "charcoal", "ffb7ce": "baby pink", "6a79f7": "cornflower", "5d06e9": "blue violet", "3d1c02": "chocolate", "82a67d": "greyish green", "be0119": "scarlet", "c9ff27": "green yellow", "373e02": "dark olive", "a9561e": "sienna", "caa0ff": "pastel purple", "ca6641": "terracotta", "02d8e9": "aqua blue", "88b378": "sage green", "980002": "blood red", "cb0162": "deep pink", "5cac2d": "grass", "769958": "moss", "a2bffe": "pastel blue", "10a674": "bluish green", "06b48b": "green blue", "af884a": "dark tan", "0b8b87": "greenish blue", "ffa756": "pale orange", "a2a415": "vomit", "154406": "forrest green", "856798": "dark lavender", "34013f": "dark violet", "632de9": "purple blue", "0a888a": "dark cyan", "6f7632": "olive drab", "d46a7e": "pinkish", "1e488f": "cobalt", "bc13fe": "neon purple", "7ef4cc": "light turquoise", "76cd26": "apple green", "74a662": "dull green", "80013f": "wine", "b1d1fc": "powder blue", "ffffe4": "off white", "0652ff": "electric blue", "045c5a": "dark turquoise", "5729ce": "blue purple", "069af3": "azure", "ff000d": "bright red", "f10c45": "pinkish red", "5170d7": "cornflower blue", "acbf69": "light olive", "6c3461": "grape", "5e819d": "greyish blue", "601ef9": "purplish blue", "b0dd16": "yellowish green", "cdfd02": "greenish yellow", "2c6fbb": "medium blue", "c0737a": "dusty rose", "d6b4fc": "light violet", "020035": "midnight blue", "703be7": "bluish purple", "fd3c06": "red orange", "960056": "dark magenta", "40a368": "greenish", "03719c": "ocean blue", "fc5a50": "coral", "ffffc2": "cream", "7f2b0a": "reddish brown", "b04e0f": "burnt sienna", "a03623": "brick", "87ae73": "sage", "789b73": "grey green", "ffffff": "white", "98eff9": "robin's egg blue", "658b38": "moss green", "5a7d9a": "steel blue", "380835": "eggplant", "fffe7a": "light yellow", "5ca904": "leaf green", "d8dcd6": "light grey", "a5a502": "puke", "d648d7": "pinkish purple", "047495": "sea blue", "b790d4": "pale purple", "5b7c99": "slate blue", "607c8e": "blue grey", "0b4008": "hunter green", "ed0dd9": "fuchsia", "8c000f": "crimson", "ffff84": "pale yellow", "bf9005": "ochre", "d2bd0a": "mustard yellow", "ff474c": "light red", "0485d1": "cerulean", "ffcfdc": "pale pink", "040273": "deep blue", "a83c09": "rust", "90e4c1": "light teal", "516572": "slate", "fac205": "goldenrod", "d5b60a": "dark yellow", "363737": "dark grey", "4b5d16": "army green", "6b8ba4": "grey blue", "80f9ad": "seafoam", "a57e52": "puce", "a9f971": "spring green", "c65102": "dark orange", "e2ca76": "sand", "b0ff9d": "pastel green", "9ffeb0": "mint", "fdaa48": "light orange", "fe01b1": "bright pink", "c1f80a": "chartreuse", "36013f": "deep purple", "341c02": "dark brown", "b9a281": "taupe", "8eab12": "pea green", "9aae07": "puke green", "02ab2e": "kelly green", "7af9ab": "seafoam green", "137e6d": "blue green", "aaa662": "khaki", "610023": "burgundy", "014d4e": "dark teal", "8f1402": "brick red", "4b006e": "royal purple", "580f41": "plum", "8fff9f": "mint green", "dbb40c": "gold", "a2cffe": "baby blue", "c0fb2d": "yellow green", "be03fd": "bright purple", "840000": "dark red", "d0fefe": "pale blue", "3f9b0b": "grass green", "01153e": "navy", "04d8b2": "aquamarine", "c04e01": "burnt orange", "0cff0c": "neon green", "0165fc": "bright blue", "cf6275": "rose", "ffd1df": "light pink", "ceb301": "mustard", "380282": "indigo", "aaff32": "lime", "53fca1": "sea green", "8e82fe": "periwinkle", "cb416b": "dark pink", "677a04": "olive green", "ffb07c": "peach", "c7fdb5": "pale green", "ad8150": "light brown", "ff028d": "hot pink", "000000": "black", "cea2fd": "lilac", "001146": "navy blue", "0504aa": "royal blue", "e6daa6": "beige", "ff796c": "salmon", "6e750e": "olive", "650021": "maroon", "01ff07": "bright green", "35063e": "dark purple", "ae7181": "mauve", "06470c": "forest green", "13eac9": "aqua", "00ffff": "cyan", "d1b26f": "tan", "00035b": "dark blue", "c79fef": "lavender", "06c2ac": "turquoise", "033500": "dark green", "9a0eea": "violet", "bf77f6": "light purple", "89fe05": "lime green", "929591": "grey", "75bbfd": "sky blue", "ffff14": "yellow", "c20078": "magenta", "96f97b": "light green", "f97306": "orange", "029386": "teal", "95d0fc": "light blue", "e50000": "red", "653700": "brown", "ff81c0": "pink", "0343df": "blue", "15b01a": "green", "7e1e9c": "purple"]
    
    // Set up
    let captureSession = AVCaptureSession()
    var captureDevice: AVCaptureDevice?
    var output: AVCaptureVideoDataOutput?
    var topPreviewLayer : AVCaptureVideoPreviewLayer?
    var bottomPreviewLayer : AVCaptureVideoPreviewLayer?
    var averageColor: UIColor?
    
    var redInt = 0
    var greenInt = 0
    var blueInt = 0
    var redString = ""
    var greenString = ""
    var blueString = ""
    
    var ind = find([0], 0)
    
    var rFloat: CGFloat = 0
    var gFloat: CGFloat = 0
    var bFloat: CGFloat = 0
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var currentColorView: UIView!
    @IBOutlet weak var nearestColorView: UIView!
    @IBOutlet weak var currentColorLabel: UILabel!
    @IBOutlet weak var nearestColorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let devices = AVCaptureDevice.devices()
        
        captureSession.sessionPreset = AVCaptureSessionPresetLow // can be changed
        
        // Loop through all the capture devices on this phone
        for device in devices {
            if device.hasMediaType(AVMediaTypeVideo) {
                if device.position == AVCaptureDevicePosition.Back {
                    captureDevice = device as? AVCaptureDevice
                    if captureDevice != nil {
                        beginSession()
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func beginSession() {
        
        if let device = captureDevice {
            device.lockForConfiguration(nil)
            device.whiteBalanceMode = AVCaptureWhiteBalanceMode.Locked
            device.unlockForConfiguration()
        }
        
        var err: NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
        //captureSession.addOutput(videoDataOutput)
        
        if err != nil {
            println("error: \(err?.localizedDescription)")
        }
        
        topPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        topPreviewLayer!.videoGravity = AVLayerVideoGravityResize
        topView.layer.addSublayer(topPreviewLayer)
        topPreviewLayer?.frame = topView.bounds
        
        //        bottomPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        //        bottomPreviewLayer!.videoGravity = AVLayerVideoGravityResize
        //        bottomView.layer.addSublayer(bottomPreviewLayer)
        //        bottomPreviewLayer?.frame = bottomView.bounds
        //        println(bottomPreviewLayer?.transform)
        
        output = AVCaptureVideoDataOutput()
        output?.alwaysDiscardsLateVideoFrames = true // I think this is default anyway
        output?.videoSettings = [kCVPixelBufferPixelFormatTypeKey: kCVPixelFormatType_32BGRA]
        let cameraQueue = dispatch_queue_create("cameraQueue", DISPATCH_QUEUE_SERIAL)
        output?.setSampleBufferDelegate(self, queue: cameraQueue)
        captureSession.addOutput(output)
        
        
        
        
        // we can apply animations to layers, but I do not think there is a way to get the average color via this method
        // bottomPreviewLayer?.addAnimation(animationForRotation(0.5, Y: 0.5, Z: 0.5), forKey: nil)
        
        captureSession.startRunning()
    }
    
    func animationForRotation(X: CGFloat, Y: CGFloat, Z: CGFloat) -> CAAnimation {
        let transform = CATransform3DMakeRotation(CGFloat(M_PI), X, Y, Z)
        println(transform)
        let animation = CABasicAnimation(keyPath: "transform")
        animation.toValue = NSValue(CATransform3D: transform)
        println(animation.toValue)
        animation.duration = 2
        animation.cumulative = true
        animation.repeatCount = 10000
        return animation
    }
    
    func hexToColor(dictColor: String) -> UIColor {
        let dictR = Int(strtoul(dictColor.substringWithRange(Range<String.Index>(start: advance(dictColor.startIndex, 0), end: advance(dictColor.startIndex, 2))), nil, 16))
        let dictG = Int(strtoul(dictColor.substringWithRange(Range<String.Index>(start: advance(dictColor.startIndex, 2), end: advance(dictColor.startIndex, 4))), nil, 16))
        let dictB = Int(strtoul(dictColor.substringWithRange(Range<String.Index>(start: advance(dictColor.startIndex, 4), end: advance(dictColor.startIndex, 6))), nil, 16))
        return UIColor(red: CGFloat(dictR) / 255.0, green: CGFloat(dictG) / 255.0, blue: CGFloat(dictB) / 255.0, alpha: 1.0)
    }
    
    func captureOutput(captureOutput: AVCaptureOutput,
        didOutputSampleBuffer sampleBuffer: CMSampleBuffer,
        fromConnection connection: AVCaptureConnection) {
            
            var pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
            
            CVPixelBufferLockBaseAddress( pixelBuffer, 0 ); // ?
            
            var bufferWidth = CVPixelBufferGetWidth(pixelBuffer);
            var bufferHeight = CVPixelBufferGetHeight(pixelBuffer);
            var rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
            var pixelBytes = rowBytes/bufferWidth;
            
            let base = UnsafeMutablePointer<UInt8>(CVPixelBufferGetBaseAddress(pixelBuffer))
            
            redInt = 0
            greenInt = 0
            blueInt = 0
            
            for( var row = 0; row < bufferHeight; row++ ) {
                for( var column = 0; column < bufferWidth; column++ ) {
                    
                    var pixel:UnsafeMutablePointer<UInt8> = base + (row * rowBytes) + (column * pixelBytes)
                    
                    redInt += Int(pixel[2]); // BGRA pixel format
                    greenInt += Int(pixel[1]); // BGRA pixel format
                    blueInt += Int(pixel[0]); // BGRA pixel format
                }
            }
            
            CVPixelBufferUnlockBaseAddress( pixelBuffer, 0 );
            
            redInt /= (bufferWidth * bufferHeight)
            greenInt /= (bufferWidth * bufferHeight)
            blueInt /= (bufferWidth * bufferHeight)
            
            redString = String(redInt, radix: 16)
            greenString = String(greenInt, radix: 16)
            blueString = String(blueInt, radix: 16)
            if redInt < 16 {
                redString = "0" + redString
            }
            if greenInt < 16 {
                greenString = "0" + greenString
            }
            if blueInt < 16 {
                blueString = "0" + blueString
            }
            
            var dictR = redInt
            var dictG = greenInt
            var dictB = blueInt
            
            let strings = colors.keys.array.map {
                dictColor -> Float in
                
                dictR = Int(strtoul(dictColor.substringWithRange(Range<String.Index>(start: advance(dictColor.startIndex, 0), end: advance(dictColor.startIndex, 2))), nil, 16))
                dictG = Int(strtoul(dictColor.substringWithRange(Range<String.Index>(start: advance(dictColor.startIndex, 2), end: advance(dictColor.startIndex, 4))), nil, 16))
                dictB = Int(strtoul(dictColor.substringWithRange(Range<String.Index>(start: advance(dictColor.startIndex, 4), end: advance(dictColor.startIndex, 6))), nil, 16))
                
                return sqrt(Float((dictR - self.redInt) * (dictR - self.redInt))) + sqrt(Float((dictG - self.greenInt) * (dictG - self.greenInt))) + sqrt(Float((dictB - self.blueInt) * (dictB - self.blueInt)))
            }
            
            let minDistance = minElement(strings)
            ind = find(strings, minDistance)
            if let huh = ind {
                println(colors.keys.array[huh])
                println(colors.values.array[huh])
            }
            
            //                dispatch_async(dispatch_get_main_queue(), {
            //                });
            
            dispatch_async(dispatch_get_main_queue(), {
                self.currentColorLabel.text = "Your color: " + self.redString + self.greenString + self.blueString
                self.currentColorView.backgroundColor = UIColor(red: CGFloat(self.redInt) / 255.0, green: CGFloat(self.greenInt) / 255.0, blue: CGFloat(self.blueInt) / 255.0, alpha: 1.0)
                self.nearestColorLabel.text = "Nearest color: " + self.colors.keys.array[self.ind!] + " (" + self.colors.values.array[self.ind!] + ")"
                self.nearestColorView.backgroundColor = self.hexToColor(self.colors.keys.array[self.ind!])
            });
            
    }
    
}

