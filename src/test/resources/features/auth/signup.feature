@ui @auth @signup
Feature: Signup to Torum through different credentials

    #---------------------------------------------------------------------------------------------------------------------------------------------------
    #---------------------------------------------------------------------------------------------------------------------------------------------------

    #new feature file

  @valid_scenario
  Scenario: As a user, I should be presented with Torum's onboarding/flash screen as soon as I tap on the Torum App icon from my phone's home screen
    When User Opens Torum App
    Then Torum App's Home Screen Should Be displayed With all Sign Up Opions


  @valid_scenario
  Scenario: As a user, I should be presented with the Malaysia country code by default with a <Phone Number > input field, when I click on signup with the account
    When User taps on "Sign Up with Account"
    Then User Should be presented with deafult "country code"

  @valid_scenario
  Scenario: As a user, I should be presented with a complete list of country codes when I click the arrow button next to the country code
    When User taps on "Sign Up with Account"
    Then Country code dropdown should display


  @valid_scenario
  Scenario Outline: As a user,  I should be presented with the <Set Course> button, when I enter a valid mobile number
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User select phone number country "<Country name>" with country code "<Country Code>"
    And User enter valid "<Phone number>"
    Then "Set Course" Button Should get enabled "<isEnabled>"

    Examples:
    # need to add test data
      | Country name   | Country Code | Phone number | isEnabled |
      | United States  | +1           |              | true      |
      | Canada         | +1           |              | true      |
      | United Kingdom | +44          |              | true      |
      | Australia      | +61          |              | true      |
      | India          | +91          |              | true      |
      | Germany        | +49          |              | true      |
      | France         | +33          |              | true      |
      | China          | +86          |              | true      |
      | Japan          | +81          |              | true      |
      | South Africa   | +27          |              | true      |
      | Singapore      | +65          |              | true      |
      | New Zealand    | +64          |              | true      |
      | Israel         | +972         |              | true      |
      | Turkey         | +90          |              | true      |
      | Thailand       | +66          |              | true      |


  @valid_scenario
  Scenario: As a user, I should be presented with a validating tick mark when I enter a valid mobile number according to the selected country code
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone Number"
    Then the checkmark should be visible

  @valid_scenario
  Scenario: As a user, I should be presented with the 'X' icon with a red highlight, when I enter an invalid phone number
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone Number"
    Then the Cross button should be visible

  @invalid_scenario
  Scenario Outline: As a user,  I should be presented with an inline error , when I enter an invalid phone number
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User select phone number country "<Country name>" with country code "<Country Code>"
    And User enter valid "<Phone Number>"
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
  Scenario: As a user, I must be able to signup to Torum successfully using valid mobile number
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone Number"
    And User taps on "Set Course"
    And User enter valid "OTP"
    And User enter valid "Alias Name"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should be signedUp and see "Home Feed" on screen

  @valid_scenario
  Scenario: As a user, I must be able to signup to Torum successfully using valid email address
    When User taps on "Sign Up with Account"
    And User taps on "Email"
    And User enter valid "Email Address"
    And User taps on "Set Course"
    And User enter valid "OTP"
    And User enter valid "Alias Name"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should be signedUp and see "Home Feed" on screen



  @valid_scenario
  Scenario: As a user, I must be able to signup to Torum successfully using Metamask Wallet
    When User taps on "Sign Up with Account"
    And User taps on "Metamask"
    Given "Metamask" app is opened
    And User taps on "Connect"
    And User taps on "Sign"
    And User enter valid "Alias Name"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should be signedUp and see "Home Feed" on screen

  @valid_scenario
  Scenario: As a user, I must be able to signup to Torum successfully using Coinbase Wallet
    When User taps on "Continue With Wallet"
    And User taps on "coinbase"
    Given "Coinbase" app is opened
    And User taps on "Connect"
    And User taps on "Sign"
    And User enter valid "Alias Name"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should be signedUp and see "Home Feed" on screen

  @valid_scenario
  Scenario: As a user, I must be able to signup to Torum successfully using Trust Wallet
    When User taps on "Continue With Wallet"
    And User taps on "Trust"
    Given "Trust" app is opened
    And User taps on "Connect"
    And User taps on "Sign"
    And User enter valid "Alias Name"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should be signedUp and see "Home Feed" on screen

  @valid_scenario
  Scenario: As a user, I must be able to signup to Torum successfully using Zerion Wallet
    When User taps on "Continue With Wallet"
    And User taps on "Zerion"
    Given "Zerion" app is opened
    And User taps on "Connect"
    And User taps on "Sign"
    And User enter valid "Alias Name"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should be signedUp and see "Home Feed" on screen

  @valid_scenario
  Scenario: As a user, I must be able to signup to Torum successfully using Apple
    When User taps on "Continue With Apple"
    And User taps on "Continue"
    Given User is back in "Torum App"
    And User enter valid "Alias Name"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should be signedUp and see "Home Feed" on screen

  @valid_scenario
  Scenario: As a user, I must be able to signup to Torum successfully using Google
    When User taps on "Continue With Google"
    And User taps on "Set Username"
    And User enter valid "Email Address"
    And User taps on "Next"
    And User enter valid "Password"
    And User taps on "Next"
    Given User is back in "Torum App"
    And User enter valid "Alias Name"
    And User taps on "Set Username"
    And User taps on "Set Face ID"
    And User taps on "Set Finger Print"
    Then User should be signedUp and see "Home Feed" on screen


  @valid_scenario
  Scenario Outline: As a user,  I should be presented with a <Set Course> button, when I enter a valid Email Id format
    When User taps on "Sign Up with Account"
    And User taps on "Email"
    And User enter valid "<Email Address>"
    Then  "Set Course" Button Should get enabled "<isEnabled>"

    Examples:
      | Email Address              | isEnabled |
      | john.doe@example.com       | true      |
      | jane.smith1234@gmail.com   | true      |
      | contact_us@company.co.uk   | true      |
      | user-name@example-mail.org | true      |
      | gmail.com                  | true      |
      | yahoo.com                  | true      |
      | outlook.com                | true      |
      | icloud.com                 | true      |
      | yahoo.co.uk                | true      |
      | microsoft.com              | true      |
      | apple.com                  | true      |
      | amazon.com                 | true      |
      | google.com                 | true      |
      | harvard.edu                | true      |
      | whitehouse.gov             | true      |
      | redcross.org               | true      |
      | johnsmith.com              | true      |
      | verizon.net                | true      |


  @invalid_scenario
  Scenario Outline: As a user,  I should be presented with an inline error, when I enter invalid Email Id
    When User taps on "Sign Up with Account"
    And User taps on "Email"
    And User enter valid "<Email Address>"
    Then User is presented with inline error "<inlineError>"


    Examples:
      | Email Address       | inlineError                           |
      | john.Doeexample.com | Invalid Email format,please try again |
      | @example.com        | Invalid Email format,please try again |
      | John.Doe@           | Invalid Email format,please try again |
      | john.Doe@exa        | Invalid Email format,please try again |

  @invalid_scenario
  Scenario: As a user, I should be presented an Error, When I enter an unmatched phone number and OTP
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone Number"
    And User taps on "Set Course"
    And User enter invalid "OTP"
    Then User should be presented with an "inline error"




  @valid_scenario
  Scenario:  As a user, I should be able to scroll the country codes in the dropdown when tapping on the country code field
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    Then the country code dropdown should be scrollable

  @valid_scenario
  Scenario: As a user, I should be able to search for a country using the initial character of any country's name.
    When User taps on "Sign Up with Account"
    And User taps on "Country code"
    And User Enters initial character of the "Country name" in the "search box"
    Then The "Country Name" with "Country Code" should be displayed in the search result


  @invalid_scenario
  Scenario: As a user, I shouldn't be able to proceed with the <Set Course> button when I haven't entered the phone number
    When User taps on "Sign Up with Account"
    Then "Set Course" Button Should be disabled

  @valid_scenario
  Scenario Outline: As a user, I should be presented with the <Set Username> button enabled, when I enter valid alias name
    When User taps on "Sign Up with Account"
    And User taps on "Email"
    And User enter valid "Email Address"
    And User taps on "Set Course"
    And User enter valid "OTP"
    And User enter valid "<Alias Name>"
    Then "Set Username" button should get enabled "true"

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
    And User enter valid "Email Address"
    And User taps on "Set Course"
    And User enter valid "OTP"
    And User enter valid "<Alias Name>"
    Then User is presented with inline error "<inlineError>"

    #need to add more invalid username test data
    Examples:
      | Alias Name                      | inlineError                                                                                                      |
      | @r^©Orsh^n9\                    | Your username must consist of 6 or more characters. Only alphabets, numbers and symbols ( -, •, _ ) are allowed. |
      | abcde                           | Your username must consist of 6 or more characters. Only alphabets, numbers and symbols ( -, •, _ ) are allowed. |
      | tevgvvvvvvvvccccvcccccccccccccc | Your username must consist of 6 or more characters. Only alphabets, numbers and symbols ( -, •, _ ) are allowed. |
      | 12345                           | Your username must consist of 6 or more characters. Only alphabets, numbers and symbols ( -, •, _ ) are allowed. |
      | 1234567891011121314151617181920 | Your username must consist of 6 or more characters. Only alphabets, numbers and symbols ( -, •, _ ) are allowed. |
      | @!^&*abcdre                     | Your username must consist of 6 or more characters. Only alphabets, numbers and symbols ( -, •, _ ) are allowed. |
      | trrrrtt65655@#_)((+==           |Your username must consist of 6 or more characters. Only alphabets, numbers and symbols ( -, •, _ ) are allowed.  |






