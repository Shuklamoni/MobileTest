@ui @auth @signup
Feature: Signup to Torum through different credentials

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