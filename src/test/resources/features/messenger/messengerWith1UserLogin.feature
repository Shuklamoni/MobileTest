@ui @messenger @single
Feature: As a Torum user, I must be able to see chat history, find user.

  Background: Login to Torum website

    When User click on Login button in page footer
    And User enter user ID "ruby@torum.com"
    And User enter password
    And User click on Login button
    Then User should be logged in and see the "View Profile" nav bar

  Scenario: As a Torum user, I must be able to be indicated the status of message and messenger
    When User click on Messenger menu
    Then User should be able to see the chat content in list
    When User click on the first single chat in list
    Then User should be able to see the messenger is "offline"
    Then User send message "hello, message status check"
    Then User should not be able to see a message status mark

  Scenario: As a Torum user, I must be able to find user with search text
    When User click on Messenger menu
    And User click on new chat button
    And User enter "ruby" in search field
    Then User should be able to see "rubytest02" appears in search result
    When User enter "RUBY" in search field
    Then User should be able to see "rubytest02" appears in search result
    When User enter "test02" in search field
    Then User should be able to see "rubytest02" appears in search result
    When User enter "@rubytest02" in search field
    Then User should be able to see "rubytest02" appears in search result
    When User enter "ruby+test02" in search field
    Then User should be able to see "rubytest02" appears in search result
    When User enter "ruby+test02@torum.com" in search field
    Then User should be able to see "rubytest02" appears in search result

  Scenario: As a user, I must not able to select more than 99 members in the Group Chat
    When User click on Messenger menu
    And User click on new chat button
    And User select 99 lander
    Then User should be able to see Add Recipient "99/99"
    When User try to select one more lander
    Then User should be able to see Add Recipient "99/99"

  Scenario: As a user, I must not be able to write group name with invalid format
    When User click on Messenger menu
    And User click on new chat button
    And User select 2 lander
    Then User should be able to see the start conversion button is disabled
    When User enter group name with 50 characters
    Then User should be able to see group name indicates "50/50"
    And User try to enter group name with 2 more characters
    Then User should be able to see group name indicates "50/50"
    And User should be able to see group name doesn't change