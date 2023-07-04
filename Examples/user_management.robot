*** Settings ***
Library                             SeleniumLibrary
Library                             String

*** Variables ***
${USER_ROLE}   ESS
${STATUS}   Enabled 
${EMPLOYEE_NAME}   a
${USERNAME}   Admin
${PASSWORD}   admin123
${BROWSER}   Chrome
${URL}   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${employee_username} 
${employe_password}


*** Test Cases ***
Test 
    Connection au site (Username : Admin, Password : admin123)
    Cliquer dans le menu sur la page « Admin »
    Ajouter un utilisateur
    Recherche l’utilisateur précédemment créé
    Modifier les informations de l’utilisateur recherché
# 5. Modifier les informations de l’utilisateur recherché
# 6. Supprimer l’utilisateur modifié
# 7. Se déconnecter
# 8. Vérifier que nous sommes revenus sur la page de connexion



*** Keywords ***

Connection au site (Username : Admin, Password : admin123)
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Sleep   6s
    Input Text   name=username  ${USERNAME}
    Input Password   name=password  ${PASSWORD}  
    Click Button   class=oxd-button
    Sleep   4s

Cliquer dans le menu sur la page « Admin »
    Click Link   class=oxd-main-menu-item
    Sleep   4s

Ajouter un utilisateur
    ${employee_username}  Generate Random String   10   [LETTERS]
    Set Test Variable  ${employee_username}
    Click Button   //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[1]/button
    Sleep   4s
    ${employe_password}  Generate Random String   10   [LETTERS][NUMBERS]
    Set Test Variable  ${employe_password}
    Press Keys    (//div[@class="oxd-select-text-input"])[1]    ARROW_DOWN  ARROW_DOWN   ENTER
    Sleep   2s
    Input Text  //label[text()="Employee Name"]/following::input[1]  ${EMPLOYEE_NAME}
    Sleep   4s
    Press Keys    //label[text()="Employee Name"]/following::input[1]    ARROW_DOWN   ENTER
    sleep    2s
    Press Keys    (//div[@class="oxd-select-text-input"])[2]    ARROW_DOWN   ENTER
    Sleep    2s
    Input Text  //label[text()="Username"]/following::input[1]  ${employee_username}
    Sleep    3s
    Input Text  //label[text()="Password"]/following::input[1]  ${employe_password}
    Sleep    3s
    Input Text  //label[text()="Confirm Password"]/following::input[1]  ${employe_password}
    Click Element  //button[text()=" Save "]
    Sleep   6s

Recherche l’utilisateur précédemment créé
    Input Text  //label[text()="Username"]/following::input[1]  ${employee_username}
    Sleep   4s
    Press Keys  //label[text()="Username"]/following::input[1]  ENTER
    Sleep   4s
    Input Text  //label[text()="Employee Name"]/following::input[1]  ${EMPLOYEE_NAME}
    Sleep   4s
    Press Keys  //label[text()="Employee Name"]/following::input[1]   ARROW_DOWN   ENTER
    Sleep   4s
    Input Text   //label[text()="User Role"]/following::input[1]  ${USER_ROLE}  
    Sleep   4s
    Press Keys  //label[text()="User Role"]/following::input[1]  ENTER
    Sleep   4s
    Input Text   //label[text()="Status"]/following::input[1]  ${STATUS}
    Sleep   4s
    Press Keys  //label[text()="Status"]/following::input[1]  ENTER
    Sleep   4s
    Click Element  //button[text()=" Search "]




Modifier les informations de l’utilisateur recherché
    Click Element  //td[text()="${employee_username}"]/following::td[8]/a[1]
    Sleep   4s
    Press Keys    (//div[@class="oxd-select-text-input"])[1]    ARROW_DOWN  ARROW_DOWN   ENTER
    Sleep   2s
    Input Text  //label[text()="Employee Name"]/following::input[1]  ${EMPLOYEE_NAME}
    Sleep   4s
    Press Keys    //label[text()="Employee Name"]/following::input[1]    ARROW_DOWN   ENTER
    sleep    2s
    Press Keys    (//div[@class="oxd-select-text-input"])[2]    ARROW_DOWN   ENTER
    Sleep    2s
    Input Text  //label[text()="Username"]/following::input[1]  ${employee_username}
    Sleep    3s
    Input Text  //label[text()="Password"]/following::input[1]  ${employe_password}
    Sleep    3s
    Input Text  //label[text()="Confirm Password"]/following::input[1]  ${employe_password}
    Click Element  //button[text()=" Save "]
    Sleep   6s
