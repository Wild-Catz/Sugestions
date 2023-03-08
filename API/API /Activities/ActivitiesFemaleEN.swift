//
//  ActivitiesFemaleEN.swift
//  API
//
//  Created by Valentina Russo on 07/03/23.
//

import Foundation

extension APIService {
    private static let activitiesFemaleEN: [ActivityAPI] = [
            .init(id: 1,
                  name: "Pass me that",
                  description: """
                Place the objects you have chosen on a table. Sitting in front of the child, ask her to pass you an object by spelling out the name clearly.

                Don’t worry if the child doesn’t respond or is struggling, you can help her by pointing to the object in question or by placing her hands directly on it, aiming more and more to reduce the use of these aids.

                After each successful exercise, give the child positive reinforcement, even if you guided her physically.

                Finally, before repeating the exercise, repeat the name of the object in question to strengthen the association. Remember to always speak very clearly.

                Repeat this exercise several times but remember to change the order of the objects on the table.

                At the end of the session you can reward the child with sweets or a more substantial reward of her choice.
                """,
                  tips: ["The number of objects is up to you, you can start with 1 or 2 and go higher, the more objects there are, the more difficult it is.",
                         "Avoid objects with a similar pronunciation in the same session.",
                         "The table where you are doing the activity should be free from distractions and noise, if possible.",
                         "At the beginning it is normal that the child is confused. Start giving her physical prompts, leading her hand to the right object, then try reducing the support step by step."],
                  need: "Objects varying in shape, size, and color. Preferably that the child knows well, even if she doesn't know its name.",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 1, fineMotory: 1),
                  categories: .init(arrayLiteral: .receptive)),
            .init(id: 2,
                  name: "Object Matching",
                  description: """
                    Place the objects you have chosen on the table, only one for each type. Sitting in front of the child, pass her one of the objects and ask clearly to match it with the identical one that is already on the table.

                    Don’t worry if the child doesn’t respond or is struggling, you can help her by pointing to the right object or by placing her hands directly on it, aiming more and more to reduce the use of these aids.

                    After each successful try, give the child positive reinforcement, even if you guided her physically.

                    Go on passing the child other objects until they are all paired.

                    Finally, before repeating the exercise, change the order of the objects on the table. It is recommended that you repeat this process at least 5 times.

                    At the end of the session you can reward the child with sweets or a more substantial reward of her choice
                    """,
                  tips: ["The number of objects is up to you, you can start with 2 or 3 and go higher, the more objects there are, the more difficult it is.",
                        "Avoid objects that look similar during the same session.",
                        "The table where you are doing the activity should be free from distractions and noise, if possible.",
                        "At the beginning it is normal that the child is confused. Start giving her physical prompts, leading his hand to the right object, then try reducing the support step by step."],
                  need: "Objects varying in shape, size, and color of which you have 2 identical ones",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 1),
                  categories: .init(arrayLiteral: .problemSolving)),
            .init(id: 3,
                  name: "Pinch training",
                  description: """
                    Start by putting the cotton balls in one of the two containers and placing them on the table. The goal of this activity is to use the clothespin to transfer the cotton balls from one container to the other.

                    To begin, say out clearly to the child what she has to do. You can also show her how to do it by doing it yourself first.

                    If the child is struggling in holding the clothespin properly, help her by placing the fingers in the correct way and holding her hands while doing the activity. Then try to gradually give her more autonomy.

                    Every time the child manages to empty the container, give her positive reinforcement, even if you have guided her physically.

                    At the end of the session you can reward you child with sweets or a more substantial reward of her choice
                    """,
                  tips: ["The number of cotton balls is up to you, you can start with 2 or 3 and go higher. The more there are, the more difficult it will be to maintain his focus.",
                         "The table where you are doing the activity should be free from distractions and noise, if possible.",
                         "At the beginning it is normal that the child is confused. Start giving her physical prompts, guiding her hand and applying pressure to the clothespin to make it open, then try reducing the support step by step."],
                  need: "Two smalls containers, a clothespin, several small cotton balls (better if coloured)",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 1, fineMotory: 3),
                  categories: .init(arrayLiteral: .fineMotory)),
            .init(id: 4,
                  name: "Pre-graphism",
                  description: """
                    To start, it is better to start with the single letters. Sit at the table with your child, and say clearly what letter you are gonna practice this time.

                    If the child is struggling, don’t be afraid of helping her guiding her hand while doing the activity, then start to reduce the help when she feels more confident.

                    After every line of letters, give her a verbal/physical reward, with compliments and/or a high five for example.

                    At the end of the session you can reward the child with sweets or a more substantial reward of her choice.
                    """,
                  tips: ["Start with the single letters, then if the child has the capability to do so, switch to short words.",
                         "The table where you are doing the activity should be free from distractions and noise, if possible.",
                         "It is advisable to start with capital letters"],
                  need: "Some pre-graphism sheet you can easily print from the internet",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 6, fineMotory: 12),
                  categories: .init(arrayLiteral: .fineMotory)),
            .init(id: 5,
                  name: "Categorization",
                  description: """
                    First we explain to the child how to carry out the activity, clearly illustrating the categories into which we have to divide our images.

                    Start by doing a first round in which we demonstrate the exercise ourselves, describing clearly what we are doing, to make the child understand the mechanism.

                    When it is the child’s turn, show her the next image and say out loud its name. If the child is struggling, help her by guiding the hand to the right place. It is important to prevent errors, if the child is doing wrong, correct her.

                    Once the child will be more confident, you can start just pointing out the right category instead of guiding her hands. But don’t worry if this doesn’t happen during the first sessions, it can require time. At the end try without giving any hints.

                    At the end of the session you can reward the child with sweets or a more substantial reward of her choice.
                    """,
                  tips: ["Once the child will be proficient in this activity, you can also try to train the language skills, if she has the capability to do so. For example by asking the name of the image and to which category it belongs to.",
                         "The table where you are doing the activity should be free from distractions and noise, if possible.",
                         "The more the categories there are, the more difficult it is. Start with 2 or 3 and then add more for the next sessions.",
                         "It is important that the categories are very different from one another."],
                  need: "Some images/cards depicting some things that can be grouped in categories (clothes, animals, food, places, body parts, etc)",
                  difficult: .init(receptive: 6, expressive: 1, problemSolving: 12, fineMotory: 1),
                  categories: .init(arrayLiteral: .problemSolving)),
            .init(id: 6,
                  name: "Basic manual activity",
                  description: """
                    The aim of the activity is to be able to take bottle caps from one container and insert them into the hole made on the lid of the second one

                    Place the container with the cap on the left side of the child (right if she is left-handed) and the other one on the right, in a comfortable position.

                    For the first time you can start by showing the activity yourself, explaining to her what to do.

                    When it is the child’s turn, if she is struggling, you can start by guiding her hands to the caps and to the hole. You can even start by passing her the caps the first time.

                    After that try to reduce more and more the help given, to the point where she can do it by herself

                    At the end of the session you can reward the child with sweets or a more substantial reward of his choice.
                    """,
                  tips: ["This activity is also very useful for training the focus span. If the child is having trouble staying focused, start with a small number or caps, even just one. Then do the activity and reward her immediately after. The next time you can increase the number of caps.",
                         "The table where you are doing the activity should be free from distractions and noise, if possible"],
                  need: "2 small containers, one of them with a hole on the lid big enough to let a bottle cap trough, and various bottle caps",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 1, fineMotory: 3),
                  categories: .init(arrayLiteral: .problemSolving)),
            .init(id: 7,
                  name: "Bottle screwing",
                  description: """
                    Place a container with the caps on the table, on the child’s left side. The goal of the activity is to be able to recognize what cap goes on what bottle and to screw it in place.

                    For the first time you can start by showing the activity yourself, explaining to the child what to do.

                    When it is the child’s turn, give her a bottle. If she is struggling with the understanding of what cap to use, you can point at or hand her the correct one. If needed, guide the child’s hands through the screwing motion.

                    At the end of the session you can reward the child with sweets or a more substantial reward of his choice.
                    """,
                  tips: ["This activity is also very useful for training the focus span. If the child is having trouble staying focused, start with a small number of bottles, even just one. Then do the activity and reward her immediately after. The next time you can increase the number of bottles.",
                         "The table where you are doing the activity should be free from distractions and noise, if possible.",
                         "Use different kinds of bottles, for example the ones from detergent, after cleaning them up."],
                  need: "Several bottles of various size and their caps",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 1, fineMotory: 6),
                  categories: .init(arrayLiteral: .fineMotory)),
            .init(id: 8,
                  name: "Divide by shape",
                  description: """
                    First we explain to the child how to carry out the activity, clearly illustrating the categories into which we have to divide our shapes.

                    Start by doing a first round in which we demonstrate the exercise ourselves, describing clearly what we are doing, to make the child understand the mechanism.

                    When it is the child’s turn, show her the next image and ask her to place it in the correct categories. If the child is struggling, help her by guiding the hand to the right place. It is important to prevent errors, if the child is doing wrong, correct her.

                    Once the child will be more confident, you can start just pointing out the right category instead of guiding her hands. But don’t worry if this doesn’t happen during the first sessions, it could require time. At the end try without giving any hints.

                    At the end of the session you can reward the child with sweets or a more substantial reward of her choice.
                    """,
                  tips: ["Try to avoid shapes that are too similar at first, for example rectangles and squares.", "The more shapes there are, the more difficult it will be."],
                  need: "Some images/picture/cards that portray geometric shapes (circle, triangle, square, etc)",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 1),
                  categories: .init(arrayLiteral: .problemSolving)),
            .init(id: 9,
                  name: "Bracelet making",
                  description: """
                    Description:
                    To start, let’s begin by showing the child how to do the activity.

                    When it is the child's turn, if she needs it, help her out by guiding his hands. If the child is struggling, you can tie a knot on the cord, to show her where to handle it.

                    Start with a small amount of beads, then try to raise the number.

                    At the end of the session you can reward her with sweets or a more substantial reward of his choice.
                    """,
                  tips: ["Try using this activity to make some bracelets for the child, in this way she can feel more rewarded after.",
                         "If the child has a hard time staying focused, lower the number of beads required to get the reward, with the goal of using more beads the next time."],
                  need: "A cord and beads of various colors, better if they are big sized",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 3, fineMotory: 6),
                  categories: .init(arrayLiteral: .fineMotory)),
            .init(id: 10,
                  name: "The imitation game",
                  description: """
                    The goal of this activity is making the child replicate a pattern of coloured cubes.

                    Start with simple shapes, a line for example, and focus on the color pattern. Start with a few colors, so that the child can start understanding the task.

                    If the child is having a hard time understanding what color to use, help her by pointing at the correct one or passing it to her.

                    Try not allowing any mistakes, if the child picks the wrong color or is doing the wrong shape, correct her,

                    At the end of the session you can reward the child with sweets or a more substantial reward of her choice.
                    """,
                  tips: ["The more the colors used, the more challenging it will be.", "If the activity is too simple for her you can try by changing the shape to a more complex one."],
                  need: "Coloured cubes",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 3),
                  categories: .init(arrayLiteral: .problemSolving)),
            .init(id: 11,
                  name: "Divide by color",
                  description: """
                    Start by placing 3 cards on the table, one for each color we choose (the number can vary depending on how difficult you want it to be)

                    First we explain to the child how to carry out the activity, clearly illustrating how to divide the objects into color categories.

                    Start by doing a first round in which we demonstrate the exercise ourselves, describing clearly what we are doing, to make the child understand the mechanism.

                    When it is the child’s turn, show her the next image and ask her to place it in the correct categories. If the child is struggling, help her by guiding the hand to the right place. It is important to prevent errors, if the child is doing wrong, correct her.

                    Once the child will be more confident, you can start just pointing out the right category instead of guiding her hands. But don’t worry if this doesn’t happen during the first sessions, it could require time. At the end try without giving any hints.

                    At the end of the session you can reward the child with sweets or a more substantial reward of her choice.
                    """,
                  tips: ["The more the colors used, the more challenging it will be.",
                         "You could use this activity also to introduce the child to the object portrayed in the image, if she doesn’t know what that is."],
                  need: "Some images/picture/cards that portray objects of different colors (clothes, toys, animals, vehicles, etc)",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 6, fineMotory: 1),
                  categories: .init(arrayLiteral: .problemSolving)),
            .init(id: 12,
                  name: "Shape Box",
                  description: """
                    Ask the child to put  each shape into the corresponding hole.

                    First guiding very invasively, then gradually letting go and letting the child do it on her own.

                    In the end, when the child has pocketed each shape correctly, provide reinforcement.
                    """,
                  tips: ["Pay attention to position yourself so that you can comfortably intervene on the child's hand to guide her easily.",
                         "If you don’t have a shape box, a variation could be done using a puzzle with interlocking pieces (not a regular puzzle)."],
                  need: "A shape box",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 3),
                  categories: .init(arrayLiteral: .problemSolving, .fineMotory)),
            .init(id: 13,
                  name: "Recognizing body parts on others",
                  description: """
                    Choose 3 body parts that the child does not recognize on other people (e.g., shoulder, neck, and chest). Sit facing each other and state the goal of the activity, which is to recognize body parts.

                    Say to the child “touch my neck” and guide their hand with a total physical prompt to the correct part and reinforce with verbal reinforcement.

                    Repeat it 10 times for each selected body part (total physical prompts also count as recognitions) mixing the instructions, don't give too many identical prompts in a row but mix up the body parts.

                    Try to gradually reduce the amount of assistance given.

                    At the end of the activity you can provide reinforcement.
                    """,
                  tips: ["Be careful to avoid body parts that are too close together, especially at the beginning. (e.g., nose, mouth, and eyes could be too difficult at first).", "Be careful not to use the same phrase over and over to interact with the body part. We can vary the word \"touch\" with \"point\" or \"show me\" or \"what is\" for example.", "Try to vary the person on whom to identify the body part, perhaps even on dolls."],
                  need: "",
                  difficult: .init(receptive: 6, expressive: 3, problemSolving: 6, fineMotory: 1),
                  categories: .init(arrayLiteral: .problemSolving, .receptive)),
            .init(id: 14,
                  name: "Fine motor exercise",
                  description: """
                    Place the separate elements in the 3 containers, from left to right in the order of coupling. Bolts on the left, washers in the middle, and nuts on the right.

                    Make it clear what she has to do both verbally and with a practical example, and physically help the operation first in a very invasive way, then gradually less.

                    You can provide small reinforcement at the end of each bolt and big reinforcement at the end of the session.
                    """,
                  tips: ["Use large sizes to facilitate movement and minimize the risk of ingestion.", "Never leave the child alone with the components.", "If the activity is too easy you can increase the number of bolts to assemble or use 2-3 different sizes"],
                  need: "3 containers, large bolts (not drill bits), appropriately sized washer and nuts to complete the bolt",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 3, fineMotory: 12),
                  categories: .init(arrayLiteral: .fineMotory)),
            .init(id: 15,
                  name: "Cognitive puzzle with 2 pieces",
                  description: """
                    Start by place the first halves on the table to the left of the child and the remaining
                    halves to their right. They should all be well spaced without overlapping, to
                    facilitate recognition and movement.

                    Explain to the child the activity and show her how to do it. If needed, give the child a physical prompt to help her. When she feels more confident, scale back by just pointing at the right half or without any help.

                    After a few repetitions, change the cards or add more.

                    To do this exercise, ideally, the child would guide the right half to the left only
                    with their index finger, straight, avoiding the other cards in the middle.

                    At the end of the session you can reward the child with sweets or a more substantial reward of her choice.
                    """,
                  tips: ["A variation is to place all the first halves in front of the child, well spaced, and next to them a bundle with the other halves, so that she can concentrate on one thing at a time."],
                  need: "Various 2 pieces cognitive puzzles (you can make it yourself)",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 3, fineMotory: 3),
                  categories: .init(arrayLiteral: .problemSolving)),
            .init(id: 16,
                  name: "Fine motor exercise",
                  description: """
                    Sit at the table, place the caps on the left, pens in the center, and the container to collect the
                    capped pens on the right (opposite if left-handed).

                    The child must collect the pen and its cap from the containers, join them, and put them in the appropriate container.

                    Explain the activity well, you can start by showing her what to do by doing it yourself.
                    Then, if needed, help the child with full physical prompt, then gradually scale back.

                    It is important to intervene in case of errors by correcting the child on the spot.

                    You can provide small reinforcement at the end of each bolt and big reinforcement at the end of the session.
                    """,
                  tips: ["We can increase the difficulty by increasing the number of pens and varying the types, mixing with markers, highlighters, and other different tools by color, size, and shape.",
                         "This activity is also very useful for training the focus span. If the child is having trouble staying focused, start with a small number or pens, even just one. Then do the activity and reward her immediately after. Next time you can increase the number of pens."],
                  need: "3 containers and pens/markers/highlighters, etc",
                  difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 6),
                  categories: .init(arrayLiteral: .fineMotory)),
            .init(id: 17,
                  name: "Rulers imitation",
                  description: """
                    First of all, we’ll need images that represent the rulers in various positions. The purpose of the activity is for the child to overlay the rulers onto their representation in the image.

                    Start by explaining the activity well, demonstrate it first and then prompt the child physically until she can do it herself, always remember to intervene in case of errors.

                    You can provide small reinforcement at the end of each image and big reinforcement at the end of the session.
                    """,
                  tips: ["Phase 2 will be not to overlay the rulers on the image, but to reproduce the position of the rulers seen in the image in another location."],
                  need: "Colored rulers",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 3),
                  categories: .init(arrayLiteral: .problemSolving, .fineMotory)),
            .init(id: 18,
                  name: "Push pins patterns",
                  description: """
                    The purpose of the activity is to create strips of pushpins on the board with a certain color pattern, like red-yellow-red-yellow for example. To make it more easy, put the sheet of paper on the board and draw small circles where she will have to put the push pins

                    As usual, start by explaining the activity well, demonstrate it first and then prompt the child physically until she can do it herself, always remember to intervene in case of errors.

                    To make the activity more difficult, we can change the pattern. For example, instead of A-B-A-B we can switch to A-A-B or A-B-B or we can introduce a new color.

                    You can provide small reinforcement at the end of each pattern reproduced and big reinforcement at the end of the session.
                    """,
                  tips: ["If the activity is too complicated, we can first create a strip with a simple pattern ourselves and then have the child copy it below."],
                  need: "Push pins of various colors, the board for the pushpins and sheet of paper",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 6),
                  categories: .init(arrayLiteral: .problemSolving, .fineMotory)),
            .init(id: 19,
                  name: "Colored pegs",
                  description: """
                    The purpose of the activity is to have the child copy a shape created with the pegs.

                    First of all you will need to create a shape on the pegboard that the child will have to replicate. You can start with basic geometric shapes and then move to some more complex figures, such as a flower, tree, etc.

                    Start by explaining the activity well and then prompt the child physically until she can do it herself, always remember to intervene in case of errors.

                    To increase the difficulty, we can increase the number of colors of the pegs or the number of pegs required to complete the figure.
                    """,
                  tips: ["Never leave the child alone with the pegs if there is the risk that she could ingest them."],
                  need: "A peg board and colored pegs",
                  difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 6),
                  categories: .init(arrayLiteral: .problemSolving, .fineMotory)),
        ]
}
