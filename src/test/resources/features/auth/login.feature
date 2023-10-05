@ui @auth @login
Feature: Login to Torum through different credentials
    #----------------------------------------------------------------------------------------
    #new feature code


  @valid_scenario
  Scenario: As a user, I should be able to select the country code from the dropdown when tapping on a country code field
    When User taps on "Log In" button
    And  User should be presented with the "country code" as "My" by default
    And  User taps on "country code"
    Given User Should be presented with dropdown with different country code list
    And  Then the country code dropdown should be scrollable
    And user taps on one of the "country code"
    Then the selected country code should get selected


  @invalid_scenario
  Scenario: As a user, an error message should be shown below the phone number input when I add a phone number that is mismatched with the country code
    When User taps on "Log In" button
    And User taps on "country code"
    And User enters invalid "Phone Number"
    Then User should be presented with an "inline error"


  @valid_scenario
  Scenario: As a user, I should be logged in as soon as I enter the valid OTP in the input with valid phone number and otp
    When User taps on "Log In" button
    And User taps on "Country code"
    And User enters "Phone Number"
    And User taps on "Continue"
    And User enters valid "OTP"
    Then User should be LoggedIn and see "Home Feed" on screen


 @invalid_scenario
 Scenario:   As a user, I should be presented with an error message when I enter an invalid Email ID
   When User taps on "Log In" button
   And User taps on "Continue with username/ email"
   And User enters "invalid email" id in the "email id" text box
   Then User should be presented with an "inline error" As "This username or email isn't registered yet. Sign up now."


  @valid_scenario
    Scenario: As a non-existing user, I should be able to navigate to the Sign Up screen by hitting the Sign Up button when the "Continue" button switches to the "SignUp/Get Started" button as soon as I enter an email id, which is not saved in the database
      When User taps on "Log In" button
      And User taps on "Continue with username/ email"
      And User enters "invalid email id" in the "email id" text box
      Given the "continue" button should be changed to the "SignUp/Get started"
      And user taps on "SignUp/Get started" button
      Then User should see the sign up window with sign up options

  @valid_scenario
    Scenario: As a user, I should be able to continue to Email when I add a valid and existing Email ID and OTP
       When User taps on "Log In" button
       And User taps on "Continue with username/ email"
       And User enters valid "Email id"
       And User taps on "Continue"
       And User enters valid "OTP"
       Then User should be LoggedIn and see "Home Feed" on screen


  @valid_scenario
    Scenario: As a user, I should be able to continue to login when I add a valid and existing username and Password
      When User taps on "Log In" button
      And User taps on "Continue with username/ email"
      And User enters valid "Username"
      And User taps on "Continue"
      And User taps on "Try Another Way"
      And User taps on "Enter Password"
      And User enters "Password"
      Then User should be LoggedIn and see "Home Feed" on screen


  @valid_scenario
    Scenario Outline: As a user, I should be able to enter a username that contain only dashes (-), full stops (.), and underscores (_), without any other symbols
      When User taps on "Log In" button
      And User taps on "Continue with username/ email"
      And User enters valid "<Username>"
      Then  "Continue" button should be enabled "true"

    Examples:
      | Username          |
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
      | user-34_name      |
      | coding.rocks      |
      | abc_123_def       |
      | alpha_numeric     |
      | mix-symbols-123   |


    @invalid_scenario
      Scenario Outline: As a user, I should be presented with an error message: '' when I enter an invalid username
        When User taps on "Log In" button
        And User taps on "Continue with username/ email"
        And User enters valid "<Username>"
        Then  User should be presented with an "<Inline Error>"

      Examples:
        | Username     | Inline Error                                              |
        | 123$username | This username or email isn't registered yet. Sign up now. |
        | user@home    | This username or email isn't registered yet. Sign up now. |
        | username!    | This username or email isn't registered yet. Sign up now. |
        | user         | This username or email isn't registered yet. Sign up now. |
        | %username%   | This username or email isn't registered yet. Sign up now. |
        | usern@me     | This username or email isn't registered yet. Sign up now. |
        | user^1234    | This username or email isn't registered yet. Sign up now. |
        | u$ern@me     | This username or email isn't registered yet. Sign up now. |
        | username#    | This username or email isn't registered yet. Sign up now. |
        | us3rn@me     | This username or email isn't registered yet. Sign up now. |
        | –__@…        | This username or email isn't registered yet. Sign up now. |
        | …—__         | This username or email isn't registered yet. Sign up now. |


    @valid_scenario
      Scenario: As a user logging in via phone number, I should be presented with the options of SMS and Password in 'Try another way' if I've created my account via phone number and set my password from settings
        When User taps on "Log In" button
        And User taps on "Country code"
        And User enters "Phone Number"
        And User taps on "Continue"
        Given User has password Setup from Settings
        Then "Try Another Way" Option Should be displayed

    @valid_scenario
      Scenario: As a user logging in via phone number, I should be presented with the options of SMS and Password in 'Try another way' if I've created my account via phone number and set my password from settings
        When User taps on "Log In" button
        And User taps on "Country code"
        And User enters "Phone Number"
        And User taps on "Continue"
        Given User has password Setup from settings
        And User taps on "Try Another Way"
        Then two options "Verify Via SMS" and "Enter Password" Should be displayed

    @valid_scenario
      Scenario: As a user logging in via phone number, I should be presented with the options of SMS and Email ID in 'Try another way' if I've created my account via phone number and added email from settings
        When User taps on "Log In" button
        And User taps on "Country code"
        And User enters "Phone Number"
        And User taps on "Continue"
        Given User has Email Setup from settings
        And User taps on "Try Another Way"
        Then two options "Verify Via SMS" and "Verify Via Email" Should be displayed


    @valid_scenario
      Scenario: As a user logging in via phone number, I should be presented with the options of SMS and Email ID in 'Try another way' if I've created my account via Email and added phone number from settings
        When User taps on "Log In" button
        And User taps on "Country code"
        And User enters "Phone Number"
        And User taps on "Continue"
        Given User has Mobile Setup from settings
        And User taps on "Try Another Way"
        Then two options "Verify Via SMS" and "Verify Via Email" Should be displayed

    @valid_scenario
      Scenario: As a user,if i login with phone number  I should be presented with all three options (SMS, Email ID and Password) in 'Try another way' if I set my profile with all the preferences already
        When User taps on "Log In" button
        And User taps on "Country code"
        And User enters "Phone Number"
        And User taps on "Continue"
        Given User has Password and email and Setup from settings
        And User taps on "Try Another Way"
        Then Three options "Verify Via SMS" ,"Verify Via Email" and "Enter Password"  Should be displayed

   @valid_scenario
      Scenario: As a user,if i login with email address I should be presented with all three options (SMS, Email ID and Password) in 'Try another way' if I set my profile with all the preferences already
        When User taps on "Log In" button
        And User taps on "Continue with username/ email"
        And User enters valid "Email id"
        And User taps on "Continue"
        Given User has Password and Phone and Setup from settings
        And User taps on "Try Another Way"
        Then Three options "Verify Via SMS" ,"Verify Via Email" and "Enter Password"  Should be displayed


    @valid_scenario
      Scenario: As a user loging in via Email Address I should be presented with the 'Try another way' option if I've created my account via Email and set my password from settings
        When User taps on "Log In" button
        And User taps on "Continue with username/ email"
        And User enters valid "Email id"
        And User taps on "Continue"
        Given User has password Setup from Settings
        Then "Try Another Way" Option Should be displayed

   @valid_scenario
      Scenario: As a user, while logging in via email, the Email verification screen should be prioritised if an email and phone number are available on my account
         When User taps on "Log In" button
         And User taps on "Continue with username/ email"
         And User enters valid "Email id"
         Given User has Mobile Setup from settings
         And User taps on "Continue"
         Then "Email Verification" Screen Should be displayed

   @valid_scenario
     Scenario: As a user, while logging in via email, the Email verification screen should be prioritised if only email Id is available on my account
       Given User has not setup mobile and sms
       When User taps on "Log In" button
       And User taps on "Continue with username/ email"
       And User enters valid "Email id"
       And User taps on "Continue"
       Then "Email Verification" Screen Should be displayed

   @valid_scenario
     Scenario: As a user, while logging in via email, the Password screen should be prioritised if an email and password are available on my account
       Given User has password Setup from Settings
       When User taps on "Log In" button
       And User taps on "Continue with username/ email"
       And User enters valid "Email id"
       And User taps on "Continue"
       Then "Password" Screen Should be displayed

   @valid_scenario
      Scenario: As a user, while logging in Email, the Password screen should be prioritised if password, email and phone number are available on my account
         Given User has Password and Phone and Setup from settings
         When User taps on "Log In" button
         And User taps on "Continue with username/ email"
         And User enters valid "Email id"
         And User taps on "Continue"
         Then "Password" Screen Should be displayed
