@ui @user @settings
Feature: As a Torum user, I must be able to make changes to my account settings

  Background: Login to Torum website

    When User click on Login button in page footer
    And User enter user ID "ruby@torum.com"
    And User enter password
    And User click on Login button
    Then User should be logged in and see the "View Profile" nav bar

   @valid_scenario @changePassword
   Scenario: As a user, I must be able to Change password from Settings
     When User click on settings button
     And User click on menu settings
     And User click on password change button
     And User enter current password
     And User enter new password
     And And User enter confirm password
     And User click on save button
     Then User is presented with the toast message "Password changed successfully!"
     And User save the new password

  @invalid_scenario @changePassword
  Scenario Outline: As a user, I must not be able to change password with invalid Password format
    When User click on settings button
    And User click on menu settings
    And User click on password change button
    And User enter current password
    And User enter invalid new password "<password>"
    Then User is presented with warning text "Password should be 8 to 50 characters long, with at least one uppercase letter, one lowercase letter, one number, and one special characters (!,@,#,$,%,^,&,*)"
    Examples:
      | password  |
      | FALfjyMF  |
      | 12345678  |
      | !@#$%^&*  |
      | aa23am!fa |
      | FS223FSD! |
      | Sd23FSDdf |
      | 1ER23s!   |

  @invalid_scenario @changePassword
  Scenario: As a user, I must not be able to change password with wrong OLD password
    When User click on settings button
    And User click on menu settings
    And User click on password change button
    And User enter current password
    And User enter new password same as current password
    And And User enter confirm password
    And User click on save button
    Then User is presented with the toast message "new password should be different from the old password."

  @valid_scenario @blockUser
  Scenario: As a user, I must be able to block a person
    When User navigate to user's profile page via link "https://torum.team/u/randomuser"
    And User click on follow button
    And User click on more actions button
    And User click on block user
    And User click on confirm button
    Then User is presented with the toast message "The user has been blocked successfully. You can manage your block list at 'Settings' section."
    And User navigate to user's profile page via link "https://torum.team/u/randomuser"
    Then User is presented 404 page
    And User is presented with the toast message "User does not exist."
    When User navigate to user's post via link "https://torum.team/post/6316a6a477f1b60014f9c2ff"
    Then User is presented with content not found page
    When User click on settings button
    And User click on menu settings
    And User click on view Blocked Users and Companies
    Then User should see "randomuser", "blockedusr01","blockuser02","blockuser03" in the list
    When User unblock user "randomuser"
    And User navigate to user's profile page via link "https://torum.team/u/randomuser"
    Then User should be able to view user "randomuser" profile page
    And User should see the follow button

