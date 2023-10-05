@ui @notification
Feature: As a user, I must be able to get notifications related with comment, like, reply, repost, spread etc..

  Background: Login to Torum website
    When "User1" "rubyyan" login to Torum website
    Then "User1" should be logged in and see the "View Profile" nav bar
    When "User2" "rubytest02" login to Torum website
    Then "User2" should be logged in and see the "View Profile" nav bar

  Scenario Outline: As a user, I must be able to get notification when someone "<action>" my post
    When "User1" navigate to "user2" profile page via link "https://torum.team/u/rubytest02"
    And "User1" "<action>" on "user2" "<content>"
    Then "User2" should be able to see 1 new notification
    And "User2" should be able to see notification "<notification>"
    When "User1" cancel "<action>" on "<content>"
    Then "User2" should not be able to see notification "<notification>"
    Examples:
      | action | content            | notification                          |
      | like   | My first post      | rubyyan liked your post.              |
      | like   | it is comment test | rubyyan liked your comment on a post. |
      | like   | My second post     | rubyyan liked your post.              |
      | like   | image              | rubyyan liked your image.             |
      | like   | video              | rubyyan liked your video.             |
      | spread | My second post     | rubyyan spread your post.             |

  Scenario: As a user, I must be able to get notification when someone "like" my reply on post
    When "User1" navigate to "user2" profile page via link "https://torum.team/u/rubytest02"
    And "User1" like the reply "it is reply test" under "user2" comment "it is comment test"
    Then "User2" should be able to see 1 new notification
    And "User2" should be able to see notification "rubyyan liked your comment reply on a post."
    When "User1" cancel "like" on "it is reply test"
    Then "User2" should not be able to see notification "rubyyan liked your comment reply on a post."

  Scenario Outline: As a user, I must be able to get notification when someone "<action>" my post
    When "User1" navigate to "user2" profile page via link "https://torum.team/u/rubytest02"
    And "User1" "<action>" "user2" post "My first post" with content "<actionContent>"
    Then "User2" should be able to see 1 new notification
    And "User2" should be able to see notification "<notification>"
    When "User1" cancel "<action>" with "<actionContent>"
    Then "User2" should not be able to see notification "<notification>"
    Examples:
      | action  | actionContent             | notification                    |
      | comment | comment notification test | rubyyan commented on your post. |
      | repost  | spread notification test  | rubyyan reposted your post.     |

  Scenario: As a user, I must be able to get notification when someone "reply" my post
    When "User2" click on navigation panel "View Profile"
    And "User2" reply "user1" comment "How are you doing" with content "Hey"
    Then "User1" should be able to see 1 new notification
    And "User1" should be able to see notification "rubytest02 has replied to your comment on rubytest02's post"
    When "User2" delete reply "Hey" under comment "How are you doing"
    And "User2" click on notification menu
    Then "User2" should not be able to see notification "rubytest02 has replied to your comment on rubytest02's post"

  Scenario: As a user, I must be able to get notification when someone follows me
    When "User1" navigate to "user2" profile page via link "https://torum.team/u/rubytest02"
    And "User1" click on follow button
    Then "User2" should be able to see 1 new notification
    And "User2" should be able to see notification "rubyyan is now following you."
    And "User1" click on unfollow button
    Then "User2" should not be able to see notification "rubyyan is now following you."