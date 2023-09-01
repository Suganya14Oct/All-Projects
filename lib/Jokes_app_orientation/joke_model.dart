import 'package:flutter/cupertino.dart';

class Joke {

  final int? id;
  final String? type;
  final String? setup;
  final String? punchline;

  Joke(
      {@required this.id,
        @required this.type,
        @required this.setup,
        @required this.punchline});
}

final List<Joke> jokesList = <Joke>[
  Joke(
      id: 1,
      type: "general",
      setup: "What did the fish say when it hit the wall?",
      punchline: "Damn."
  ),
  Joke(
      id: 2,
      type: "general",
      setup: "How do you make a tissue dance?",
      punchline: "You put a little boogie on it."
  ),
  Joke(
      id: 3,
      type: "general",
      setup: "What's Forrest Gump's password?",
      punchline: "1Forrest1"
  ),
  Joke(
      id: 4,
      type: "general",
      setup: "What do you call a belt made out of watches?",
      punchline: "A waist of time."
  ),
  Joke(
      id: 5,
      type: "general",
      setup: "Why can't bicycles stand on their own?",
      punchline: "They are two tired"
  ),
  Joke(
      id: 6,
      type: "general",
      setup: "How does a train eat?",
      punchline: "It goes chew, chew"
  ),
  Joke(
      id: 7,
      type: "general",
      setup: "What do you call a singling Laptop",
      punchline: "A Dell"
  ),
  Joke(
      id: 8,
      type: "general",
      setup: "How many lips does a flower have?",
      punchline: "Tulips"
  ),
  Joke(
      id: 9,
      type: "general",
      setup: "What kind of shoes does a thief wear?",
      punchline: "Sneakers"
  ),
  Joke(
      id: 10,
      type: "general",
      setup: "What's the best time to go to the dentist?",
      punchline: "Tooth hurty."
  ),
  Joke(
      id: 11,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n A broken pencil. \n A broken pencil who?",
      punchline: "Never mind. It's pointless."
  ),
  Joke(
      id: 12,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n Cows go. \n Cows go who?",
      punchline: "No, cows go moo."
  ),
  Joke(
      id: 13,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n Little old lady. \n Little old lady who?",
      punchline: "I didn't know you could yodel!"
  ),
  Joke(
      id: 14,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n Cereal \n Cereal who?",
      punchline: "Cereal pleasure to meet you"
  ),
  Joke(
      id: 15,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n Harry! \n Harry who?",
      punchline: "Harry up and answer the door!"
  ),
  Joke(
      id: 16,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n Bless! \n Bless who?",
      punchline: "I didn't sneeze, but thank you."
  ),
  Joke(
      id: 17,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n Tank \n Tank who?",
      punchline: "You're welcome!"
  ),
  Joke(
      id: 18,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n Opportunity",
      punchline: "... Opportunity doesn't knock twice."
  ),
  Joke(
      id: 19,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n Alex. \n Alex who?",
      punchline: "ALex the questions around here!"
  ),
  Joke(
      id: 20,
      type: "knock-knock",
      setup: "Knock knock. \n Who's there? \n Hawaii. \n Hawaii who?",
      punchline: "I'm fine, Hawaii you?"
  ),
];