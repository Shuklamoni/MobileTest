@ui @user @profile @valid_scenario
Feature: As a Torum user, I must be able to view and update my profile

  Background: Login to Torum website

    When User click on "Login here"
    And User enter "Username" with value "<user>"
    And User enter "Password"
    And User click on "Continue"
    Then User should be loggedIn and see "Search" on screen

  @followOption
  Scenario: As a user, I must be able to Select the Follow option in User Description and display it
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User select "Follow" option in user description section
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see the "Followers" and "Following" displays in user description section

  @tagLineOption
  Scenario: As a user, I must be able to Select and Enter valid data in Tagline option in  User Description and display it
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User select "Tagline" option in user description section
    And User enter "Hi, this is me!" in "tagline" text area
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see the Tagline "Hi, this is me!" displays in user description section

  @updateBio
  Scenario: As a user, I must be able to update bio
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User enter "I am an crypto enthusiast" in "bio" text area
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see the Bio "I am an crypto enthusiast" displays in Bio section

  @favoriteCryptoCurrency
  Scenario Outline: As a user, I must be able to add my favorite crypto currencies in ABOUT section
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User switch to about tab
    And User remove saved favorite crypto currency
    And User click on enter field favorite crypto currency
    Then User should be presented with suggestion list
    When User enter "<enter>" in favorite crypto currency
    And User select "<suggestion>"
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see the "<suggestion>" displays in favorite crypto currency section
    Examples:
      | enter   | suggestion   |
      | XTM     | TORUM(XTM)   |
      | bitcoin | Bitcoin(BTC) |
      | torum   | TORUM(XTM)   |


  @updateLocation
  Scenario: As a user, As a user, I must be able to add a location
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User switch to about tab
    And User enter "India" in location enter
    And User select the first option from location searching result
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see selected option displays in location section

    @updateBirthdate
  Scenario: As a user, As a user, I must be able to update birthdate
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User switch to about tab
    And User enter "12/12/1991" in birthdate enter
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see "12th December 1991" displays in birthdate section

  @updateCareer
  Scenario Outline: As a user, As a user, I must be able to add a career
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User switch to about tab
    And User click on add another career
    And User enter career information "<position>","<company>","<startDate>","<endDate>"
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see "<position>","<company>","<startDate>","<endDate>" displays in location section
    Examples:
      | position  | company | startDate  | endDate    |
      | Developer | Torum   | 01/01/2019 | 05/05/2022 |
      | QA        | Torum   | 01/01/2022 | Present    |

  @careerOption
  Scenario: As a user, I must be able to add a career and highlight it and then add it to user description
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User select "Career" option in user description section
    And User switch to about tab
    And User click on career highlight button
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see the career displays in user description section

  @updateEducation
  Scenario Outline: As a user, I must be able to add a Education
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User switch to about tab
    And User click on add another education
    And User enter education information "<course>","<school>","<startDate>","<endDate>"
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see "<course>","<school>","<startDate>","<endDate>" displays in education section
    Examples:
      | course   | school  | startDate  | endDate    |
      | IT       | Beijing | 01/08/2011 | 09/06/2015 |
      | Language | Qinghua | 17/01/2022 | Present    |

  @educationOption
  Scenario: As a user, I must be able to add a education and highlight it and then add it to user description
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User select "Education" option in user description section
    And User switch to about tab
    And User click on education highlight button
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    And User should see the education displays in user description section


  Scenario Outline: As a user, I must be able to update my Profile picture
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User changes profile picture to "<path>"
    And User clicks on save button
    And wait for images to upload
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    Examples:
      | path |
      | \src\test\resources\ImageFiles\Ahri.jpeg|
      | \src\test\resources\ImageFiles\J4.png|
      | \src\test\resources\ImageFiles\Kindred.jpg|
      | \src\test\resources\ImageFiles\Pardeep.png|

  Scenario Outline: As a user, I must be able to update my cover picture
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User changes cover picture to "<path>"
    And User clicks on save button
    And wait for images to upload
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"
    Examples:
      | path |
      | \src\test\resources\ImageFiles\Ahri.jpeg|
      | \src\test\resources\ImageFiles\J4.png|
      | \src\test\resources\ImageFiles\Kindred.jpg|
      | \src\test\resources\ImageFiles\Pardeep.png|

  #Scenario: As a user, I must be able to update my cover picture
    #When User clicks on all follow buttons on active landers
   #Then status of all follow button must change to following
   #And User Unfollows all followed users on Active landers
   # Then status of all following button must change to followed
   # And User clicks on view more below active landers
    #And user follows first 2 users on Active landers
   # Then Status of first two users must change to unfollow


  Scenario: As a user, I must be able to update my display with valid name
    When User click on navigation panel "View Profile"
    And User click on "Edit profile"
    And User Enters display name < 6 characters
    And User click on save changes
    And user is presented with Error "A minimum of 6 characters is required."
    And user Enters a valid display name
    And User click on save changes
    Then User is presented with the toast message "Profile successfully updated!"