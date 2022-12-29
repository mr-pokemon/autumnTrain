
// (outdoor/indoor/underground/low/mid/high, locations); from https://kol.coldfront.net/thekolwiki/index.php/Autumn-aton

// ash if (item_amount($item[autumn-aton]) > 0) cli_execute("autumnTrain.ash");

void main() {

    string upgraded = cli_execute("autumnaton upgrade");
    
    string currentUpgrades = get_property("autumnatonUpgrades");
    string[9] allUpgrades = {"base_blackhat", "rightarm1", "periscope", "leftarm1", "rightleg1", "radardish", "leftleg1", "cowcatcher", "dualexhaust"};

    int i = 0;
    int j = 0;
    int[int] toUpgrade;
    while (i < 9) {
        if (!contains_text(currentUpgrades, allUpgrades[i])) {
            toUpgrade[j++]=i++;
            continue;
        }
        else if (i==8) {
            print("You have collected all of the autumn-aton parts. Hurray!");
            exit;
        }
        else {
            i++;
        }
    }


    location[int,int] SendLocs = {
    // outdoor
        { //low, Energy-absorptive hat ("base_blackhat"), autumn leaf
            $location[The Spooky Forest], $location[The Sleazy Back Alley], $location[8-Bit Realm]
        },
        { //mid, High performance right arm ("rightarm1"), autumn debris shield
            $location[The Old Landfill], $location[The Overgrown Lot], $location[Whitey\'s Grove], $location[The Goatlet]
        },
        { //high, Vision extender ("periscope"), autumn leaf pendant
            $location[Sonofa Beach], $location[The Hole in the Sky], $location[The Penultimate Fantasy Airship], $location[The Oasis]
        },
    //indoor
        { //low, Enhanced left arm ("leftarm1"), AutumnFest ale
            $location[The Haunted Pantry]
        },
        { //mid, high speed right leg ("rightleg1"), autumn-spice donut
            $location[The Haunted Kitchen], $location[The Haunted Library], $location[A Barroom Brawl], $location[The Skeleton Store]
        },
        { //high, Radar dish ("radardish"), autumn breeze
            $location[The Red Zeppelin], $location[The Castle in the Clouds in the Sky (Top Floor)]
        },
    //underground
        {//low, Upgraded left leg ("leftleg1"), autumn sweater-weather sweater
            $location[Noob Cave], $location[Cobb\'s Knob Barracks], $location[Cobb\'s Knob Kitchens], $location[The Haiku Dungeon], $location[The Batrat and Ratbat Burrow], $location[The Beanbat Chamber]
        },
        { //mid, collection prow ("cowcatcher"), autumn dollar
            $location[The Daily Dungeon], $location[The Enormous Greater-Than Sign], $location[The Dungeons of Doom], $location[Itznotyerzitz Mine], $location[The Defiled Nook]
        },
        { //high, Dual exhaust ("dualexhaust"), autumn years wisdom
            $location[The Castle in the Clouds in the Sky (Basement)], $location[The Haunted Boiler Room], $location[The Haunted Wine Cellar], $location[The Haunted Laundry Room], $location[The Middle Chamber]
        }
    };

    foreach partidx in toUpgrade {
        int n = toUpgrade.count() - 1 ;
        int k = toUpgrade[partidx];
        print("Hunting for the " + allUpgrades[k] + "!");
        foreach place in SendLocs[k] {
            int m = SendLocs[k].count() - 1;
            string sendstr = "autumnaton send " + SendLocs[k,place];
            print("Attempting to send the autumn-aton to: " + SendLocs[k,place]);
            print(place+"-"+m+"-"+partidx+"-"+n);
            if (cli_execute(sendstr) == false) {
                // print("Failed to send autumn-aton to " + SendLocs[k,place] + ". Are you sure you have it unlocked?");
                }
            else if (cli_execute(sendstr) == false && place == m && partidx == n) {
                print("Sorry, couldn\'t send the autumn-aton anywhere! T_T Try again once you\'ve unlocked more areas!");
            }
            else {
                print("Sent the autumn-aton to " + SendLocs[k,place]);
                exit; 
            }
        }

    }

}
