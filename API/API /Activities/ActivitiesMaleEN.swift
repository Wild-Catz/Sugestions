//
//  ActivitiesMaleEN.swift
//  API
//
//  Created by Valentina Russo on 07/03/23.
//

import Foundation

extension APIService {
    private static let activitiesMaleEN: [ActivityAPI] = [
            .init(id: 1,
                  name: "Pass me that",
                  description: """
                Place the objects you have chosen on a table. Sitting in front of the child, ask him to pass you an object by spelling out the name clearly.

                Don’t worry if he doesn’t respond or is struggling, you can help him by pointing to the object in question or by placing his hands directly on it, aiming more and more to reduce the use of these aids.

                After each successful exercise, give him positive reinforcement, even if you guided him physically.

                Finally, before repeating the exercise, repeat the name of the object in question to strengthen the association. Remember to always speak very clearly.

                Repeat this exercise several times but remember to change the order of the objects on the table.

                At the end of the session you can reward him with sweets or a more substantial reward of his choice.

                """,
                  tips: ["The number of objects is up to you, you can start with 1 or 2 and go higher, the more objects there are, the more difficult it is.",
                         "Avoid objects with a similar pronunciation in the same session.",
                         "The table where you are doing the activity should be free from distractions and noise, if possible.",
                         "At the beginning it is normal that the child is confused. Start giving him physical prompts, leading his hand to the right object, then try reducing the support step by step."],
                  need: "Objects varying in shape, size, and color. Preferably that the child knows well, even if he doesn't know its name.",
                  difficult: .init(receptive: 2, expressive: 1, problemSolving: 1, fineMotory: 1),
                  categories: .init(arrayLiteral: .receptive)),
            .init(id: 2,
                  name: "Object Matching",
                  description: """
                    Place the objects you have chosen on the table, only one for each type. Sitting in front of the child, pass him one of the objects and ask clearly to match it with the identical one that is already on the table.

                    Don’t worry if the child doesn’t respond or is struggling, you can help him by pointing to the right object or by placing his hands directly on it, aiming more and more to reduce the use of these aids.

                    After each successful try, give him positive reinforcement, even if you guided him physically.

                    Go on passing the child other objects until they are all paired.

                    Finally, before repeating the exercise, change the order of the objects on the table. It is recommended that you repeat this process at least 5 times.

                    At the end of the session you can reward him with sweets or a more substantial reward of his choice

                    """,
                  tips: ["The number of objects is up to you, you can start with 2 or 3 and go higher, the more objects there are, the more difficult it is.",
                        "Avoid objects that look similar during the same session.",
                        "The table where you are doing the activity should be free from distractions and noise, if possible.",
                        "At the beginning it is normal that the child is confused. Start giving him physical prompts, leading his hand to the right object, then try reducing the support step by step."],
                  need: "Objects varying in shape, size, and color of which you have 2 identical ones",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 2, fineMotory: 1),
                  categories: .init(arrayLiteral: .problemSolving)),
            .init(id: 3,
                  name: "Pinch training",
                  description: """
                    Start by putting the cotton balls in one of the two containers and placing them on the table. The goal of this activity is to use the clothespin to transfer the cotton balls from one container to the other.

                    To begin, say out clearly to the child what he has to do. You can also show him how to do it by doing it yourself first.

                    If the child is struggling in holding the clothespin properly, help him by placing the fingers in the correct way and holding his hands while doing the activity. Then try to gradually give him more autonomy.

                    Every time the child manages to empty the container, give him positive reinforcement, even if you have guided him physically.

                    At the end of the session you can reward your child with sweets or a more substantial reward of his choice

                    """,
                  tips: ["The number of cotton balls is up to you, you can start with 2 or 3 and go higher. The more there are, the more difficult it will be to maintain his focus.", "The table where you are doing the activity should be free from distractions and noise, if possible.", "At the beginning it is normal that the child is confused. Start giving him physical prompts, guiding his hand and applying pressure to the clothespin to make it open, then try reducing the support step by step."],
                  need: "Two smalls containers, a clothespin, several small cotton balls (better if coloured)",
                  difficult: .init(receptive: 2, expressive: 1, problemSolving: 1, fineMotory: 2),
                  categories: .init(arrayLiteral: .fineMotory)),
            .init(id: 4,
                  name: "Pre-graphism",
                  description: """
                    To start, it is better to start with the single letters. Sit at the table with your child, and say clearly what letter you are gonna practice this time.

                    If the child is struggling, don’t be afraid of helping him by guiding his hand while doing the activity, then start to reduce the help when he feels more confident.

                    After every line of letters, give him a verbal/physical reward, with compliments and/or a high five for example.

                    At the end of the session you can reward the child with sweets or a more substantial reward of his choice.
                    """,
                  tips: ["Start with the single letters, then if the child has the capability to do so, switch to short words.", "The table where you are doing the activity should be free from distractions and noise, if possible.", "It is advisable to start with capital letters"],
                  need: "Some pre-graphism sheet you can easily print from the internet",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 4),
                  categories: .init(arrayLiteral: .fineMotory)),
            .init(id: 5,
                  name: "Categorization",
                  description: """
                    First we explain to the child how to carry out the activity, clearly illustrating the categories into which we have to divide our images.

                    Start by doing a first round in which we demonstrate the exercise ourselves, describing clearly what we are doing, to make him understand the mechanism.

                    When it is the child’s turn, show him the next image and say out loud its name. If the child is struggling, help him by guiding the hand to the right place. It is important to prevent errors, if the child is doing wrong, correct him.

                    Once the child will be more confident, you can start just pointing out the right category instead of guiding his hands. But don’t worry if this doesn’t happen during the first sessions, it can require time. At the end try without giving any hints.

                    At the end of the session you can reward the child with sweets or a more substantial reward of his choice.
                    """,
                  tips: ["Once the child will be proficient in this activity, you can also try to train the language skills, if he has the capability to do so. For example by asking the name of the image and to which category it belongs to.", "The table where you are doing the activity should be free from distractions and noise, if possible.", "The more the categories there are, the more difficult it is. Start with 2 or 3 and then add more for the next sessions.", "It is important that the categories are very different from one another."],
                  need: "Some images/cards depicting some things that can be grouped in categories (clothes, animals, food, places, body parts, etc)",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 4, fineMotory: 1),
                  categories: .init(arrayLiteral: .problemSolving)),
            .init(id: 6,
                  name: "Basic manual activity",
                  description: """
                    """,
                  tips: ["2 small containers, one of them with a hole on the lid big enough to let a bottle cap trough", ""],
                  need: "Various bottle caps",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 4),
                  categories: .init(arrayLiteral: .problemSolving))
        ]
}
