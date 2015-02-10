# Battleships CRC

Game           | Colaborator
----------     |-------------
player_1_wins  |
player_2_wins  |
declare_winner |

Player        | Collaborator
------------- |--------------
place_ship    |
take_shot     |
                  
Board            | Collaborator
-----------      |---------------
display_markers  | Marker
has_a_size       | Ship
display_ships    |

Ship             | Collaborator
-------------    | -------------
sunk?            | 
damage_from_hit  | 

Marker        |Collaborator
------------- |-------------
missed_status |
              |
