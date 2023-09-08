@ui @messenger @messenger2users
Feature: As a Torum user, I must be able to send/receive messages

  Background: Signup to Torum website
    Given User1 signup to Torum website
    Then User1 should be signed up and see the profile picture uploading popup
    And User1 skips all popups
    When "User2" "rubytest02" login to Torum website
    Then "User2" should be logged in and see the "View Profile" nav bar

  Scenario: As a Torum user, I must be able to start a conversion
    When "User2" click on Messenger menu
    And "User2" get current number of requests
    And "User1" click on Messenger menu
    And "User1" click on new chat button
    And "User1" enter "rubytest02" in search field
    And "User1" select user "rubytest02"
    And "User1" start conversation
    And "User1" enter message "hello, test message"
    And "User1" send the message
    Then "User2" should be able to see 1 more requests
    When "User2" switch to "REQUESTS" tab
    And "User2" click on the chat with "user1"
    Then "User2" should be able to see the message "hello, test message" in the chat content
    And User2 should not be able to see the send message button
    And "User2" should be able to see "user1" is "offline"
    When "User2" accept the connection
    And "User2" enter message "hello, this is message from user2"
    And "User2" send the message
    Then "User1" should be able to see the message "hello, this is message from user2" in the chat content

  Scenario: As a user, I must be able to send a new request to the user after declining his request
    When "User2" click on Messenger menu
    And "User2" get current number of requests
    And "User1" click on Messenger menu
    And "User1" click on new chat button
    And "User1" enter "rubytest02" in search field
    And "User1" select user "rubytest02"
    And "User1" start conversation
    And "User1" enter message "hello, test message"
    And "User1" send the message
    When "User2" switch to "REQUESTS" tab
    Then "User2" should be able to see "single" chat request
    When "User2" click on the chat with "user1"
    And "User2" get "user1's" username
    And User2 decline the connection
    And "User2" switch to "ONGOING" tab
    And "User1" get current number of requests
    And "User2" click on new chat button
    And "User2" enter "user1's" username in search field
    And User2 select user1
    And "User2" start conversation
    And "User2" enter message "hello, this is test message from user2"
    And "User2" send the message
    Then "User1" should be able to see 1 more requests

  Scenario: As a User, I must be able to re-send a request after the first one gets declined
    When "User2" click on Messenger menu
    And "User2" get current number of requests
    And "User1" click on Messenger menu
    And "User1" click on new chat button
    And "User1" enter "rubytest02" in search field
    And "User1" select user "rubytest02"
    And "User1" start conversation
    And "User1" enter message "hello, test message"
    And "User1" send the message
    Then "User2" should be able to see 1 more requests
    When "User2" switch to "REQUESTS" tab
    And "User2" click on the chat with "user1"
    And User2 decline the connection
    And "User1" click on new chat button
    And "User1" enter "rubytest02" in search field
    And "User1" select user "rubytest02"
    And "User1" start conversation
    And "User1" enter message "hello, it's me again"
    And "User1" send the message
    Then "User2" should be able to see 1 more requests

  Scenario: As a Torum user, I must be able to block user's message
    When "User1" click on Messenger menu
    And "User1" click on new chat button
    And "User1" enter "rubytest02" in search field
    And "User1" select user "rubytest02"
    And "User1" start conversation
    And "User1" enter message "hello, test message"
    And "User1" send the message
    And "User2" click on Messenger menu
    And "User2" switch to "REQUESTS" tab
    And "User2" click on the chat with "user1"
    Then "User2" should be able to see the message "hello, test message" in the chat content
    When "User2" accept the connection
    And "User2" block "user1"
    Then "User2" should be able to see "Block Lander" button
    When "User1" enter message "hello, can you receive my message"
    And "User1" send the message
    Then "User2" should not be able to see the message "hello, can you receive my message" in the chat content
    And "User1" should be able to see "user2" is "offline"

  Scenario: As a Torum user, I must be able to report suspicious lander
    When "User1" click on Messenger menu
    And "User1" click on new chat button
    And "User1" enter "rubytest02" in search field
    And "User1" start conversation
    When "User1" enter message "hello, test message"
    And "User1" send the message
    And "User1" report "user2"
    Then "User1" is presented with the toast message "Thank you for your submission. Your report will be reviewed soon."
    When "User1" enter message "hello, test message after report you"
    And "User1" send the message
    And "User2" click on Messenger menu
    And "User2" switch to "REQUESTS" tab
    Then User2 should be able to see the chat from user1
    And "User2" click on the chat with "user1"
    And "User2" should be able to see the message "hello, test message after report you" in the chat content
    When "User1" go back
    And "User1" click on new chat button
    And "User1" enter "rubytest02" in search field
    Then User1 should be able to see "rubytest02" in search result