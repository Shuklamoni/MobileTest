@ui @auth @signup
Feature: Signup to Torum through different credentials

    #---------------------------------------------------------------------------------------------------------------------------------------------------
    #---------------------------------------------------------------------------------------------------------------------------------------------------

    #new feature file


  @valid_scenario
  Scenario Outline: As a user,  I should be presented with a tickmark icon and the <Set Course> button should get enabled when I enter a valid mobile number.
    When User taps on "Sign Up with Account"
    And  User should be presented with the default "Country Code"
    And User taps on "Country Code"
    And User selects the country code "<Country Code>"
    And User enters a valid "<Phone number>"
    And Tickmark icon should be displayed
    Then "Set Course" Button Should get enabled "<isEnabled>" is "true"

    Examples:
    # need to add test data
      | Country name   | Country Code | Phone number |
      | United States  | +1           |              |
      | Canada         | +1           |              |
      | United Kingdom | +44          |              |
      | Australia      | +61          |              |
      | India          | +91          |              |
      | Germany        | +49          |              |
      | France         | +33          |              |
      | China          | +86          |              |
      | Japan          | +81          |              |
      | South Africa   | +27          |              |
      | Singapore      | +65          |              |
      | New Zealand    | +64          |              |
      | Israel         | +972         |              |
      | Turkey         | +90          |              |
      | Thailand       | +66          |              |


  @invalid_scenario
  Scenario Outline: As a user,  I should be presented with an inline error message and 'X' icon with a red highlight, when I enter an invalid phone number.
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User selects the country code "<Country Code>"
    And User enters invalid "Phone Number"
    And Cross icon Should be displayed
    Then User is presented with inline error "<inlineError>"

    #need to add test data
    Examples:

      | Country name   | Country Code | Phone Number |
      | United States  | +1           |              |
      | Canada         | +1           |              |
      | United Kingdom | +44          |              |
      | Australia      | +61          |              |
      | India          | +91          |              |
      | Germany        | +49          |              |
      | France         | +33          |              |
      | China          | +86          |              |
      | Japan          | +81          |              |


  @valid_scenario
  Scenario: As a user, I must be able to signup to Torum successfully using valid mobile number.
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User selects the country code "<Country Code>"
    And User enters a "Phone Number"
    And User taps on "Set Course"
    And User enters valid "OTP"
    And User enters a valid "<Alias Name>"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should get signedUp and "Home Feed" screen should be visible

  @valid_scenario
  Scenario: As a user, I must be able to signup to Torum successfully using valid email address.
    When User taps on "Sign Up with Account"
    And User taps on "Email"
    And User enters a valid "Email Address"
    And User taps on "Set Course"
    And User enters valid "OTP"
    And User enters a valid "<Alias Name>"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should get signedUp and "Home Feed" screen should be visible


  @valid_scenario
  Scenario Outline: As a user,  I should be presented with a <Set Course> button and tickmark icon, when I enter a valid Email Id format.
    When User taps on "Sign Up with Account"
    And User taps on "Email"
    And User enters a valid "Email Address"
    And Tickmark icon should be displayed
    Then  "Set Course" Button Should get enabled "<isEnabled>" is "true"

    Examples:
      | Email Address              |
      | john.doe@example.com       |
      | jane.smith1234@gmail.com   |
      | contact_us@company.co.uk   |
      | user-name@example-mail.org |
      | gmail.com                  |
      | yahoo.com                  |
      | outlook.com                |
      | icloud.com                 |
      | yahoo.co.uk                |
      | microsoft.com              |
      | apple.com                  |
      | amazon.com                 |
      | google.com                 |
      | harvard.edu                |
      | whitehouse.gov             |
      | redcross.org               |
      | johnsmith.com              |
      | verizon.net                |


  @invalid_scenario
  Scenario Outline: As a user, I should be presented with an inline error, when I enter invalid Email Id.
    When User taps on "Sign Up with Account"
    And User taps on "Email"
    And User enters a valid "Email Address"
    And Cross icon should be displayed
    Then User is presented with inline error "<Inline Error>"

  #need to add invalid email id's and change inline error messages
    Examples:
      | Email Address       | Inline Error                          |
      | john.Doeexample.com | Invalid Email format,please try again |
      | @example.com        | Invalid Email format,please try again |
      | John.Doe@           | Invalid Email format,please try again |
      | john.Doe@exa        | Invalid Email format,please try again |

  @invalid_scenario
  Scenario: As a user, I should be presented an Inline Error Message , When I enter an unmatched phone number and OTP.
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User selects the country code "<Country Code>"
    And User enters a "Phone Number"
    And User taps on "Set Course"
    And User enters invalid "OTP"
    Then User should be presented with an "inline error"


  @valid_scenario
  Scenario: As a user,I Should be presented with list of country codes and I should be able to scroll the country codes in the dropdown and search for a country using the initial character of any country's name.
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And Country code dropdown should be displayed
    And The country code dropdown should be scrollable
    And User enters initial character of the "Country Name" in the "Search Box"
    Then The "Country Name" with "Country Code" should be displayed in the search result


  @valid_scenario
  Scenario Outline: As a user, I should be presented with the <Set Username> button enabled, when I enter valid alias name.
    When User taps on "Sign Up with Account"
    And User taps on "Email"
    And User enters a valid "Email Address"
    And User taps on "Set Course"
    And User enters valid "OTP"
    And User enters a valid "<Alias Name>"
    And Tickmark icon should be displayed
    Then "Set Username" button should get "isEnabled" is "true"

    Examples:
      | Alias Name        |
      | user_123          |
      | alpha.beta        |
      | john_smith_45     |
      | code_master_89    |
      | my.username123    |
      | rock-n-roll       |
      | hello.world.42    |
      | 7wonders_of_world |
      | 2fast.2furious    |
      | moon_landing_69   |
      | underscore_name   |
      | dot.example       |
      | username_12345    |
      | number-1_2_3      |
      | xyz_abc_def       |


  @invalid_scenario
  Scenario Outline: As a user, I should be presented with an inline error message and an X icon with a red highlight when I enter an invalid username.
    When User taps on "Sign Up with Account"
    And User taps on "Email"
    And User enters a valid "Email Address"
    And User taps on "Set Course"
    And User enters valid "OTP"
    And User enters a valid "<Alias Name>"
    And Cross icon should be displayed
    Then User is presented with the inline error "<inlineError>"
    # error message "Your username must consist of 6 or more characters. Only alphabets, numbers and symbols ( -, •, _ ) are allowed."
    #need to add more invalid username test data
    Examples:
      | Alias Name                      |
      | @r^©Orsh^n9\                    |
      | abcde                           |
      | tevgvvvvvvvvccccvcccccccccccccc |
      | 12345                           |
      | 1234567891011121314151617181920 |
      | @!^&*abcdre                     |
      | trrrrtt65655@#_)((+==           |


  #@valid_scenario
  #Scenario: As a user, I must be able to signup to Torum successfully using Metamask Wallet
    #When User taps on "Sign Up with Account"
    #And User taps on "Metamask"
    #Given "Metamask" app is opened
    #And User taps on "Connect"
    #And User taps on "Sign"
    #And User enter valid "Alias Name"
    #And User taps on "Set Username"
    #And User taps on "Set Face ID"
    #And User taps on "Set Finger Print"
    #Then User should be signedUp and see "Home Feed" on screen

  #@valid_scenario
  #Scenario: As a user, I must be able to signup to Torum successfully using Coinbase Wallet
    #When User taps on "Continue With Wallet"
    #And User taps on "coinbase"
    #Given "Coinbase" app is opened
    #And User taps on "Connect"
    #And User taps on "Sign"
    #And User enter valid "Alias Name"
    #And User taps on "Set Username"
    #And User taps on "Set Face ID"
    #And User taps on "Set Finger Print"
    #Then User should be signedUp and see "Home Feed" on screen

  #@valid_scenario
  #Scenario: As a user, I must be able to signup to Torum successfully using Trust Wallet
    #When User taps on "Continue With Wallet"
    #And User taps on "Trust"
    #Given "Trust" app is opened
    #And User taps on "Connect"
    #And User taps on "Sign"
    #And User enter valid "Alias Name"
    #And User taps on "Set Username"
    #And User taps on "Set Face ID"
    #And User taps on "Set Finger Print"
    #Then User should be signedUp and see "Home Feed" on screen

  #@valid_scenario
  #Scenario: As a user, I must be able to signup to Torum successfully using Zerion Wallet
    #When User taps on "Continue With Wallet"
    #And User taps on "Zerion"
    #Given "Zerion" app is opened
    #And User taps on "Connect"
    #And User taps on "Sign"
    #And User enter valid "Alias Name"
    #And User taps on "Set Username"
    #And User taps on "Set Face ID"
    #And User taps on "Set Finger Print"
    #Then User should be signedUp and see "Home Feed" on screen

  #@valid_scenario
  #Scenario: As a user, I must be able to signup to Torum successfully using Apple
    #When User taps on "Continue With Apple"
    #And User taps on "Continue"
    #Given User is back in "Torum App"
    #And User enter valid "Alias Name"
    #And User taps on "Set Username"
    #And User taps on "Set Face ID"
    #And User taps on "Set Finger Print"
    #Then User should be signedUp and see "Home Feed" on screen

  #@valid_scenario
  #Scenario: As a user, I must be able to signup to Torum successfully using Google
    #When User taps on "Continue With Google"
    #And User taps on "Set Username"
    #And User enter valid "Email Address"
    #And User taps on "Next"
    #And User enter valid "Password"
    #And User taps on "Next"
    #Given User is back in "Torum App"
    #And User enter valid "Alias Name"
    #And User taps on "Set Username"
    #And User taps on "Set Face ID"
    #And User taps on "Set Finger Print"
    #Then User should be signedUp and see "Home Feed" on screen







