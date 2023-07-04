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
    Recherche l’utilisateur précédemment créé
    Supprimer l’utilisateur modifié
    Se déconnecter
    Vérifier que nous sommes revenus sur la page de connexion

*** Keywords ***

Connection au site (Username : Admin, Password : admin123)
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Sleep   2s
    Input Text   name=username  ${USERNAME}
    Input Password   name=password  ${PASSWORD}  
    Click Button   class=oxd-button
    Sleep   2s

Cliquer dans le menu sur la page « Admin »
    Click Link   class=oxd-main-menu-item
    Sleep   2s

Ajouter un utilisateur
    ${employee_username}  Generate Random String   10   [LETTERS]
    Set Test Variable  ${employee_username}
    Click Button   //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[1]/button
    Sleep   2s
    ${employe_password_letter}  Generate Random String   5   [LETTERS]
    ${employe_password_number}  Generate Random String    5  [NUMBERS]
    Set Test Variable  ${employe_password_letter}
    Set Test Variable  ${employe_password_number}
    ${employe_password}  Catenate  ${employe_password_letter}${employe_password_number}
    Press Keys    (//div[@class="oxd-select-text-input"])[1]    ARROW_DOWN  ARROW_DOWN   ENTER
    Sleep   2s
    Input Text  //label[text()="Employee Name"]/following::input[1]  ${EMPLOYEE_NAME}
    Sleep   4s
    Press Keys    //label[text()="Employee Name"]/following::input[1]    ARROW_DOWN   ENTER
    sleep    2s
    Press Keys    (//div[@class="oxd-select-text-input"])[2]    ARROW_DOWN   ENTER
    Sleep    2s
    Input Text  //label[text()="Username"]/following::input[1]  ${employee_username}
    Sleep    2s
    Input Text  //label[text()="Password"]/following::input[1]  ${employe_password}
    Sleep    2s
    Input Text  //label[text()="Confirm Password"]/following::input[1]  ${employe_password}
    Sleep    1s
    Click Element  //button[text()=" Save "]
    Sleep   6s

Recherche l’utilisateur précédemment créé
    Input Text  //label[text()="Employee Name"]/following::input[1]  ${EMPLOYEE_NAME}
    Sleep   2s
    Press Keys  //label[text()="Employee Name"]/following::input[1]   ARROW_DOWN   ENTER
    Sleep   2s
    Click Element  //button[text()=" Search "]
    Sleep   4s

Modifier les informations de l’utilisateur recherché
    Click Element    //button[i[@class="oxd-icon bi-pencil-fill"]]
    Sleep   2s
    Input Text  //label[text()="Username"]/following::input[1]  ${employee_username}
    Sleep    2s
    Click Element  //button[text()=" Save "]
    Sleep   6s

Supprimer l’utilisateur modifié
    Click Element  //button[i[@class="oxd-icon bi-trash"]]
    Sleep   2s
    Click Element    //button[text()=" Yes, Delete "]
    Sleep    2s

Se déconnecter
    Click Element    //li[@class="oxd-userdropdown"]
    Sleep    1s
    Click Element    //a[text()="Logout"]
    Sleep    2s

Vérifier que nous sommes revenus sur la page de connexion
    Page Should Contain Element    //div[@class="orangehrm-login-form"]
