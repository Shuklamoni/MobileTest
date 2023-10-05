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