Creating the battleships game logic in Ruby. 

Pairing with Paul we designed the game by defining the necessary classes first then incrementally build up the game. 


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
