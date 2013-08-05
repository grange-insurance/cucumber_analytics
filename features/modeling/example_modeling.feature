Feature: Example elements can be modeled.


  Acceptance criteria

  All conceptual pieces of an Examples block can be modeled:
    1. the example's name
    2. the example's description
    3. the example's parameters
    4. the example's rows
    5. the example's tags
    6. the example's applied tags
    7. the example's source line
    8. the example's raw element


  Background: Test file setup.
    Given the following feature file:
    """
    @a_feature_level_tag
    Feature:

      @outline_tag
      Scenario Outline:
        * a step

      Examples: text describing the significance of the examples
          Example description
          more description
        |param1| param2 | extra param |
        |x     | y      |      ?      |
        |1     | 2      |      3      |
      @example_tag @another_one
      Examples: some examples with different significance and a tag
          Description
        | param1 |
        | a      |
    """
    And parameter delimiters of "*" and "*"
    When the file is read


  Scenario: The raw example element is modeled.
    Then the test example block correctly stores its underlying implementation

  Scenario: The example's source line is modeled.
    Then the test example block "1" is found to have the following properties:
      | source_line | 8 |
    And the test example block "2" is found to have the following properties:
      | source_line | 15 |

  Scenario: The examples' name is modeled.
    Then the test example block "1" is found to have the following properties:
      | name | text describing the significance of the examples |
    And the test example block "2" is found to have the following properties:
      | name | some examples with different significance and a tag |

  Scenario: The examples' description is modeled.
    Then the test example block "1" descriptive lines are as follows:
      | Example description |
      | more description    |
    And the test example block "2" descriptive lines are as follows:
      | Description |

  Scenario: The examples' tags are modeled.
    Then the test example block "1" has no tags
    And the test example block "2" is found to have the following tags:
      | @example_tag |
      | @another_one |

  Scenario: The examples' applied tags are modeled.
    Then the test example block "2" is found to have the following applied tags:
      | @a_feature_level_tag |
      | @outline_tag         |

  Scenario: The examples' parameters are modeled.
    Then the test example block "1" parameters are as follows:
      | param1      |
      | param2      |
      | extra param |
    And the test example block "2" parameters are as follows:
      | param1 |

  Scenario: The examples' rows are modeled.
    Then the test example block "1" rows are as follows:
      | x,y,? |
      | 1,2,3 |
    And the test example block "2" rows are as follows:
      | a |

  Scenario Outline: Example models pass all other specifications
  Exact specifications detailing the API for Examples models.
    Given that there are "<additional specifications>" detailing models
    When the corresponding unit tests are run
    Then all of those specifications are met
  Examples:
    | additional specifications   |
    | example_unit_spec.rb        |
    | example_integration_spec.rb |
