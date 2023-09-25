@ui @auth @signup
Feature: Signup to Torum through different credentials

#old feature file





  @valid_scenario
  Scenario Outline: As a user, I must be able to signup to Torum successfully via valid password format and length of <password_length> characters
    When User click on "Build your crypto profile"
    And User enter "Username" with <username_length> characters
    And User enter valid "Email"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone"
    And User click on "Next"
    And User enter "Password" with <password_length> characters
    And User enter "Confirm Password" same as password
    And User click on "Next"
    Then User should be signedUp and see "Pick a profile picture" on screen
    Examples:
      | username_length | password_length |
      | 8               | 8               |
      | 15              | 8               |
      | 30              | 8               |
      | 8               | 8               |
      | 8               | 15              |
      | 8               | 50              |


  @valid_scenario @referral
  Scenario: As a user, I must be able to signup to Torum successfully via valid referral user
    When User click on "Build your crypto profile"
    And User enter "Username" with 8 characters
    And User enter valid "Email"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone"
    And User enter "Referral username" with value "Nelthan"
    And User click on "Next"
    And User enter "Password" with 8 characters
    And User enter "Confirm Password" same as password
    And User click on "Next"
    Then User should be signedUp and see "Pick a profile picture" on screen

  @invalid_scenario @referral
  Scenario: As a user, I must not be able to signup to Torum successfully via invalid referral user
    When User click on "Build your crypto profile"
    And User enter "Username" with 8 characters
    And User enter valid "Email"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone"
    And User enter "Referral username" with value "Rubytest02"
    Then User is presented with field error "Invalid referral code or account is not verified."

  @invalid_scenario @emptyCredential
  Scenario Outline: As a user, I must not be able to SignUp with any empty "<fieldName>"
    When User click on "Build your crypto profile"
    And User enter empty "<fieldName>"
    Then User is presented with field error "<fieldError>"
    Examples:
      | fieldName | fieldError           |
      | Username  | Username (required!) |
      | Email     | Email (required!)    |
      | Phone     | Phone (required!)    |

  @invalid_scenario @username
  Scenario: As a user, I must not be able to SignUp with invalid length of username
    When User click on "Build your crypto profile"
    And User enter "Username" with 5 characters
    Then User is presented with field error "Username must be at least 6 characters"

#    unable to run this case because of only text locator is available
#  @invalid_scenario @username
#  Scenario: As a user, I must not be able to SignUp with invalid length of username
#    When User click on "Build your crypto profile"
#    And User enter "Username" with 31 characters
#    Then User is presented with field error "Username must be at least 6 characters"
#    Then User actually only entered 30 characters in "Username"


  @invalid_scenario @username
  Scenario Outline: As a user, I must not be able to SignUp with invalid details in username
    When User click on "Build your crypto profile"
    And User enter invalid "Username" with value "<username>"
    Then User is presented with field error "<fieldError>"
    Examples:
      | username | fieldError                                                                                                                                     |
      | 1test01  | The username should be alphanumeric, must start with an alphabet, can only contain lowercase alphabets, and should be 6 to 30 characters long. |
      | !test01  | Username must contain at least 6 alpha-numeric characters in a valid format!                                                                   |
      | !@#$%^&* | Username must contain at least 6 alpha-numeric characters in a valid format!                                                                   |
      | user001  | Username already in use.                                                                                                                       |
      | nelthan  | Username already in use.                                                                                                                       |
      | rubyyan  | Username already in use.                                                                                                                       |

  @invalid_scenario @email
  Scenario Outline: As a user, I must not be able to SignUp with invalid details in Email
    When User click on "Build your crypto profile"
    And User enter invalid "Email" with value "<email>"
    Then User is presented with field error "<fieldError>"
    Examples:
      | email                  | fieldError             |
      | karthik.sake           | Invalid email address! |
      | karthik.sake@gmail.com | Email already in use.  |
      | ruby@torum.com         | Email already in use.  |

  @invalid_scenario @mobile
  Scenario Outline: As a user, I must not be able to SignUp with invalid details in Phone number
    When User click on "Build your crypto profile"
    And User select phone number country "India" with country code "+91"
    And User enter invalid "Phone" with value "<phoneNumber>"
    Then User is presented with field error "<fieldError>"
    Examples:
      | phoneNumber | fieldError                           |
      | 9705502623  | This phone number is already in use. |
      | 701325537   | This phone number is invalid.        |
      | 542620590   | This phone number is invalid.        |


  @invalid_scenario @password
  Scenario Outline: As a user, I must not be able to SignUp with invalid details in password
    When User click on "Build your crypto profile"
    And User enter "Username" with 8 characters
    And User enter valid "Email"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone"
    And User click on "Next"
    And User enter invalid "Password" with value "<password>"
    Then User is presented with field error "<fieldError>"
    Examples:
      | password  | fieldError                                                                                                                                                    |
      | aBCdEfge  | Password should be 8 to 50 characters long, with at least one uppercase letter, one lowercase letter, one number and one special character! (!,@,#,$,%,^,&,*) |
      | 12345678  | Password should be 8 to 50 characters long, with at least one uppercase letter, one lowercase letter, one number and one special character! (!,@,#,$,%,^,&,*) |
      | !@#$%^&*  | Password should be 8 to 50 characters long, with at least one uppercase letter, one lowercase letter, one number and one special character! (!,@,#,$,%,^,&,*) |
      | aa23am!fa | Password should be 8 to 50 characters long, with at least one uppercase letter, one lowercase letter, one number and one special character! (!,@,#,$,%,^,&,*) |
      | SD23FSD!  | Password should be 8 to 50 characters long, with at least one uppercase letter, one lowercase letter, one number and one special character! (!,@,#,$,%,^,&,*) |
      | Sd23FSDdf | Password should be 8 to 50 characters long, with at least one uppercase letter, one lowercase letter, one number and one special character! (!,@,#,$,%,^,&,*) |

  @invalid_scenario @password
  Scenario: As a user, I must not be able to SignUp with invalid password length
    When User click on "Build your crypto profile"
    And User enter "Username" with 8 characters
    And User enter valid "Email"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone"
    And User click on "Next"
    And User enter "Password" with 7 characters
    Then User is presented with field error "Password should be 8 to 50 characters long, with at least one uppercase letter, one lowercase letter, one number and one special character! (!,@,#,$,%,^,&,*)"

#    unable to run this case because of only text locator is available
#  @invalid_scenario @ @password
#  Scenario: As a user,  I must not be able to SignUp with invalid password length
#    When User click on "Build your crypto profile"
#    And User enter "Username" with 8 characters
#    And User enter valid "Email"
#    And User select phone number country "India" with country code "+91"
#    And User enter valid "Phone"
#    And User click on "Next"
#    And User enter "Password" with 51 characters
#    Then User actually only entered 50 characters in "Password"

  @invalid_scenario @password
  Scenario: As a user, I must not be able to SignUp with mismatching confirm password
    When User click on "Build your crypto profile"
    And User enter "Username" with 8 characters
    And User enter valid "Email"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone"
    And User click on "Next"
    And User enter "Password" with 12 characters
    And User enter "Confirm Password" different from password
    And User click on "Next"
    Then User is presented with field error "Passwords do not match."

  @invalid_scenario @emptyCredential1
  Scenario: As a user, I must not be able to SignUp with any empty "Password"
    When User click on "Build your crypto profile"
    And User enter "Username" with 8 characters
    And User enter valid "Email"
    And User select phone number country "India" with country code "+91"
    And User enter valid "Phone"
    And User click on "Next"
    And User enter empty "Password"
    And User enter "Confirm Password" different from password
    Then User should see the button "Next" is enabled "false"

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

