@ui @messenger @messenger2users
Feature: As a Torum user, I must be able to send/receive messages

  Background: Login to Torum website
    When "User1" "rubyyan" login to Torum website
    Then "User1" should be logged in and see the "View Profile" nav bar
    When "User2" "rubytest02" login to Torum website
    Then "User2" should be logged in and see the "View Profile" nav bar

  Scenario: As a user, I must be able to send a new request to the user after declining his request
    When "User1" click on Messenger menu
    And "User2" click on Messenger menu
    And "User2" click on the chat with user "rubyyan"
    And "User1" click on the chat with user "rubytest02"
    Then "User1" should be able to see "User2" is "online"
    When "User1" enter message "hello, test message"
    Then "User2" should be able to "see" typing status
    When "User1" send the message
    Then "User2" should be able to see the message "hello, test message" in the chat content
    And "User1" should be able to see a seen mark
    And "User2" should be able to "notSee" typing status
    When "User1" deletes message
    Then "User1" should be able to see the message "This message has been deleted." in the chat content
    And "User2" should be able to see the message "This message has been deleted." in the chat content

  Scenario: As a user, I must be able to see the new ongoing message reminder
    When "User1" click on Messenger menu
    And "User1" click on the chat with user "rubytest02"
    And "User1" enter message "hello, test message 1"
    And "User1" send the message
    Then "User2" should be able to see the red dot on "messenger" menu
    And "User2" should be able to see the red dot on "chat" menu
    When "User2" click on Messenger menu
    And "User2" click on the chat with user "rubyyan"
    And "User1" enter message "hello, test message 1"
    And "User1" send the message
    And "User1" enter message "hello, test message 2"
    And "User1" send the message
    Then "User2" should be able to see there is 2 unread message


  Scenario: As a Torum user, I must be able to send text message of 5000 characters to user "rubytest02"
    When "User1" click on Messenger menu
    And "User1" click on the chat with user "rubytest02"
    And User1 send message with 5000 characters
    And "User2" click on Messenger menu
    And "User2" click on the chat with user "rubyyan"
    Then User2 should be able to see the message in the chat content

  Scenario Outline: As a Torum user, I must be able to send image message to user "rubytest02"
    When "User1" click on Messenger menu
    And "User1" click on the chat with user "rubytest02"
    And "User1" send image "<path>"
    And "User2" click on Messenger menu
    And "User2" click on the chat with user "rubyyan"
    Then "User2" should be able to see the image "<path>" in the chat content
    Examples:
      | path                                       |
      | \src\test\resources\ImageFiles\Ahri.jpeg   |
      | \src\test\resources\ImageFiles\J4.png      |
      | \src\test\resources\ImageFiles\Kindred.jpg |
      | \src\test\resources\ImageFiles\dancing.gif |

  Scenario Outline: As a Torum user, I must be able to send "<messageType>" message to user "rubytest02"
    When "User1" click on Messenger menu
    And "User1" click on the chat with user "rubytest02"
    And "User1" send "<count>" number of "<messageType>"
    And "User2" click on Messenger menu
    And "User2" click on the chat with user "rubyyan"
    Then "User2" should be able to see the "<messageType>" in the chat content
    Examples:
      | messageType | count  |
      | murots      | random |
      | emojis      | random |

  Scenario: As a Torum user, I must be able to send gif message to user "rubytest02"
    When "User1" click on Messenger menu
    And "User1" click on the chat with user "rubytest02"
    And "User1" send "random" gif
    And "User2" click on Messenger menu
    And "User2" click on the chat with user "rubyyan"
    Then "User2" should be able to see the "gif" in the chat content

  Scenario: As a user, I must be able to select more than 2 lander and enter the Group name to start a group chat
    When "User1" click on Messenger menu
    And "User2" click on Messenger menu
    And "User1" click on new chat button
    And "User1" enter "ruby" in search field
    Then "User1" should be able to see "Ruby's test company" appears in search result
    And "User1" should be able to see "rubytest02" appears in search result
    And "User1" should be able to see "rubytest0908" appears in search result
    When "User1" select user "Ruby's test company"
    And "User1" select user "rubytest02"
    And "User1" select user "rubytest0908"
    And "User1" unselect user "rubytest0908"
    And "User1" enter group name with 8 characters
    And "User1" start conversation
    And "User1" go to member list
    Then User1 should be able to see "rubyyan" in the top of member list
    And "User1" should not be able to see "rubytest0908" in member list
    And "User1" should be able to see "Admin" badge beside "rubyyan"
    And "User1" should be able to see "Invited" badge beside "rubytest02"
    And "User1" should be able to see "Invited" badge beside "Ruby's test company"
    When "User1" go back
    And "User1" enter message "hello, group test message"
    And "User1" send the message
    When "User2" switch to "REQUESTS" tab
    Then "User2" should be able to see "group" chat request
    When "User2" click on the chat with "group"
    And "User2" should be able to see the message "hello, group test message" in the chat content
    And User2 should not be able to see the send message button
    When "User2" accept the connection
    And "User1" go to member list
    Then "User1" should be able to see "No" badge beside "rubytest02"

  Scenario: As a user, I must be able to take corresponding actions as an admin or member
    When "User1" click on Messenger menu
    And "User2" click on Messenger menu
    And "User1" click on new chat button
    And "User1" enter "ruby" in search field
    Then "User1" should be able to see "Ruby's test company" appears in search result
    And "User1" should be able to see "rubytest02" appears in search result
    And "User1" should be able to see "rubytest0908" appears in search result
    When "User1" select user "Ruby's test company"
    And "User1" select user "rubytest02"
    And "User1" enter group name with 8 characters
    And "User1" start conversation
    And "User2" switch to "REQUESTS" tab
    And "User2" should be able to see "group" chat request
    And "User2" click on the chat with "group"
    And "User2" accept the connection
    And "User2" click on Settings button
    Then "User2" should not be able to see button "Invite Members"
    And "User2" should not be able to see button "Delete Channel"
    When "User2" go to member list
    Then "User2" should not be able to remove or make admin to other member
    And "User1" go to member list
    And "User1" remove "Ruby's test company"
    Then "User1" is presented with the toast message "User Removed successfully."
    And "User1" should not be able to see "Ruby's test company" in member list
    When "User1" make "rubytest02" to be admin
    Then "User1" is presented with the toast message "User registered as admin successfully."
    And "User1" should be able to see "Admin" badge beside "rubytest02"
    When "User1" invite "rubytest01"
    Then "User1" is presented with the toast message "Invites have been sent successfully."
    When "User1" go to member list
    And "User1" should be able to see "rubytest01" in member list
    When "User1" delete channel
    And "User1" should not be able to see group chat in ongoing chats

  Scenario: As a user, I must be able to take corresponding actions to message
    When "User1" click on Messenger menu
    And "User2" click on Messenger menu
    And "User1" click on new chat button
    And "User1" enter "ruby" in search field
    Then "User1" should be able to see "Ruby's test company" appears in search result
    And "User1" should be able to see "rubytest02" appears in search result
    And "User1" should be able to see "rubytest0908" appears in search result
    When "User1" select user "Ruby's test company"
    And "User1" select user "rubytest02"
    And "User1" enter group name with 8 characters
    And "User1" start conversation
    And "User1" enter message "hello, group test message"
    And "User1" send the message
    When "User2" switch to "REQUESTS" tab
    Then "User2" should be able to see "group" chat request
    Then "User2" click on the chat with "group"
    And "User2" should be able to see the message "hello, group test message" in the chat content
    When "User2" accept the connection
    And "User2" hover on latest message
    Then "User2" should not be able to see delete button
    When "User2" send "first" gif
    Then "User1" should be able to see the "gif" in the chat content
    When "User2" reply message "hello, group test message"
    And "User2" send "first" number of "murot"
    Then "User1" should be able to see the "murot" in the chat content
    When  "User1" hover on replied message
    Then "User1" should not be able to see reply button
    When "User2" send "first" number of "emoji"
    Then "User1" should be able to see the "emoji" in the chat content
    When "User2" send image "\src\test\resources\ImageFiles\Ahri.jpeg"
    Then "User1" should be able to see the image "\src\test\resources\ImageFiles\Ahri.jpeg" in the chat content
    When  "User1" reply image message with murot shortcut
    Then "User2" should be able to see murot under image message
    When "User2" deletes message
    Then "User1" should be able to see the message "This message has been deleted." in the chat content