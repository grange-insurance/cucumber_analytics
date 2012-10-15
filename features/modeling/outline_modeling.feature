Feature: Scenario Outline elements can be modeled.


  Acceptance criteria

  All conceptual pieces of a Scenario Outline can be modeled:
    1. the outline's name
    2. the outline's description
    3. the outline's steps
    4. the outline's tags
    5. the outline's example rows


  Background: Test file setup.
    Given the following feature file:
    """
    @a_feature_level_tag
    Feature: The test feature name.
      Some more feature description.

      @outline_tag
      Scenario Outline: The scenario outline's name.
        Some text describing the scenario.
        More text.
        Given this *parameterized* step takes a table:
          | <param1> |
          | <param2> |
        And some setup step
#
        When a step with a *parameter*
        And a big step:
        #random comment
        -"-"-"-
      some text

        #some comments
        Scenario:
        Scenario Outline:
        Examples:
        @
        Feature:
        |
        Given
        When
        Then
        *
            some more text
        -"-"-"-
        Then *lots* *of* *parameters*

      Examples: text describing the significance of the examples
        #
        #
        And even more description if you really need it.
        | param1 | param2 |
        #A more random comment
        | x      | y      |
        @example_tag @another_one
      Examples: some examples with different significance and a tag

        Words, words, words, words,

         why so many words?
         #

        | param1 | param2 |
        #

        #
        | a      | b      |

    """
    And parameter delimiters of "*" and "*"
    When the file is read


  Scenario: The outline name is modeled.
    Then the outline is found to have the following properties:
      | name | The scenario outline's name. |

  Scenario: The outline description is modeled.
    Then the outline descriptive lines are as follows:
      | Some text describing the scenario. |
      | More text.                         |

  Scenario: The outline steps are modeled.
    Then the outline steps are as follows:
      | Given this *parameterized* step takes a table: |
      | \| <param1> \|                                 |
      | \| <param2> \|                                 |
      | And some setup step                            |
      | When a step with a *parameter*                 |
      | And a big step:                                |
      | """                                            |
      | 'some text'                                    |
      | ''                                             |
      | '#some comments'                               |
      | 'Scenario:'                                    |
      | 'Scenario Outline:'                            |
      | 'Examples:'                                    |
      | '@'                                            |
      | 'Feature:'                                     |
      | '\|'                                           |
      | 'Given'                                        |
      | 'When'                                         |
      | 'Then'                                         |
      | '*'                                            |
      | '    some more text'                           |
      | """                                            |
      | Then *lots* *of* *parameters*                  |
    And the outline steps "without" arguments are as follows:
      | Given this ** step takes a table: |
      | And some setup step               |
      | When a step with a **             |
      | And a big step:                   |
      | Then ** ** **                     |
    And the outline steps "without" keywords are as follows:
      | this *parameterized* step takes a table: |
      | \| <param1> \|                           |
      | \| <param2> \|                           |
      | some setup step                          |
      | a step with a *parameter*                |
      | a big step:                              |
      | """                                      |
      | 'some text'                              |
      | ''                                       |
      | '#some comments'                         |
      | 'Scenario:'                              |
      | 'Scenario Outline:'                      |
      | 'Examples:'                              |
      | '@'                                      |
      | 'Feature:'                               |
      | '\|'                                     |
      | 'Given'                                  |
      | 'When'                                   |
      | 'Then'                                   |
      | '*'                                      |
      | '    some more text'                     |
      | """                                      |
      | *lots* *of* *parameters*                 |
    And the outline steps "without" arguments "without" keywords are as follows:
      | this ** step takes a table: |
      | some setup step             |
      | a step with a **            |
      | a big step:                 |
      | ** ** **                    |
    And the outline step "1" has the following block:
      | \| <param1> \| |
      | \| <param2> \| |
    And the outline step "4" has the following block:
      | """                  |
      | 'some text'          |
      | ''                   |
      | '#some comments'     |
      | 'Scenario:'          |
      | 'Scenario Outline:'  |
      | 'Examples:'          |
      | '@'                  |
      | 'Feature:'           |
      | '\|'                 |
      | 'Given'              |
      | 'When'               |
      | 'Then'               |
      | '*'                  |
      | '    some more text' |
      | """                  |

  Scenario: The outline tags are modeled.
    Then the outline is found to have the following tags:
      | @outline_tag |

  Scenario Outline: The outline examples are modeled.
    Then "<outline>" example "<set>" has a "<name>"
    And "<outline>" example "<set>" descriptive lines are as follows:
      | <description1> |
      | <description2> |
    And "<outline>" example "<set>" tags are as follows:
      | <tag1> |
      | <tag2> |
    And "<outline>" example "<set>" rows are as follows:
      | <row1> |
      | <row2> |
  Examples:
    | outline | set | name                                                | description1                                     | description2       | tag1         | tag2         | row1                   | row2                   |
    | 1       | 1   | text describing the significance of the examples    | And even more description if you really need it. |                    |              |              | \| param1 \| param2 \| | \| x      \| y      \| |
    | 1       | 2   | some examples with different significance and a tag | Words, words, words, words,                      | why so many words? | @example_tag | @another_one | \| param1 \| param2 \| | \| a      \| b      \| |