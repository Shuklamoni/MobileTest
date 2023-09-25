@ui @auth @login
Feature: Login to Torum through different credentials

  @valid_scenario
  Scenario Outline: As a user, I must be able to login to Torum successfully via valid email and password
    When User click on "Login here"
    And User enter "Username" with value "<user>"
    And User enter "Password"
    And User click on "Continue"
    Then User should be loggedIn and see "Search" on screen
    Examples:
      | user           |
      | ruby@torum.com |
      | rubyyan        |
      | +213777865866  |

  @invalid_scenario
  Scenario Outline: As a user I must not be able to login with Invalid credentials
    When User click on "Login here"
    And User enter "Username" with value "<user>"
    And User enter "Password" with value "<password>"
    And User click on "Continue"
    Then User is presented with the toast message "<error>"
    Examples:
      | user                           | password | error                                              |
      | magiclinkautomation            | Test1234 | Invalid username or password.                      |
      | +917013255371                  | Test1234 | Invalid username or password.                      |
      | testingteamtorum@gmail.com     | Test1234 | Invalid username or password.                      |
      | idontthinkthisexists           | Test1234 | Invalid username or password.                      |
      | idontthinkthisexists@gmail.com | Test1234 | Invalid username or password.                      |
      | +915652323                     | Test1234 | Invalid username or password.                      |
      | magiclinkautomation            | 1234     | password length must be at least 8 characters long |


  @invalid_scenario
  Scenario Outline: As a user I must not be able to login with empty credentials
    When User click on "Login here"
    And User enter "Username" with value "<user>"
    And User enter "Password" with value "<password>"
    Then User should see the button "Continue" is enabled "<isEnabled>"
    Examples:
      | user   | password     | isEnabled |
      |        | Password@123 | false     |
      | test01 |              | false     |




    #----------------------------------------------------------------------------------------
  #new feature code

  @valid_scenario
  Scenario: As a user, I should be redirected to the login screen with the phone number option by default when clicking on the Log in button near 'Already landed?' on the welcome screen
    When User taps on "Log In" button
    Then "Phone Number" textbox should display

  @valid_scenario
  Scenario: As a user, I should be presented with the Malaysia country code by default in the phone number option when clicking on the Log in button on the welcome screen
     When User taps on "Log In" button
     Then User should be presented with the "country code" as "My" by default


  @valid_scenario
  Scenario: As a user, I should be presented with different country codes in the dropdown when tapping on the country code field
    When User taps on "Log In" button
    And  User taps on "country code"
    Then User Should be presented with dropdown with different country code list


  @valid_scenario
  Scenario: As a user, I should be able to select the country code from the dropdown when tapping on a country code field
    When User taps on "Log In" button
    And  User taps on "country code"
    Given User Should be presented with dropdown with different country code list
    And user taps on one of the "country code"
    Then the selected country code should get selected

  @valid_scenario
  Scenario: As a user, I should be able to scroll the country codes in the dropdown when tapping on the country code field
    When User taps on "Log In" button
    And  User taps on "country code"
    Given User Should be presented with dropdown with different country code list
    Then the country code dropdown should be scrollable

  @invalid_scenario
  Scenario: As a user, an error message should be shown below the phone number input when I add a phone number that is mismatched with the country code
    When User taps on "Log In" button
    And User taps on "country code"
    And User enters invalid "Phone Number"
    Then User should be presented with an "inline error"


  @valid_scenario
  Scenario: As a user, the 'Continue' button should be enabled as soon as I enter the first character in the input
    When User taps on "Log In" button
    And User taps on "country code"
    And User enters "Phone Number"
    Then  "Continue" button should be enabled "true"

