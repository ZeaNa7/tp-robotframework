*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${USER_ROLE}   ESS
${STATUS}   Enabled
${EMPLOYEE_NAME}   (type any caracter and select the first result)
${USERNAME}   Admin
${PASSWORD}   admin123
${BROWSER}   Chrome
${URL}   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

${FIRSTNAME}  randomfirstname
${MIDDLENAME}  randommiddlename
${LASTNAME}  randomlastname
${USERNAME_RANDOM}  randomusername
${PASSWORD_RANDOM}  securepassword
${ID}  randomID
${ZIZI}  Nicknamechanged

*** Test Cases ***
Test1
    générique (Username: Admin, Password: admin123)
    cliquer dans le menu sur la page «PIM»
    Ajouter un utilisateur avec création de login (checkbox«CreateLogin Details»)
    Recherche l’utilisateur précédemment créé
    Modifier les informations de l’utilisateur recherché
    Recherche l’utilisateur précédemment créé
    Supprimer l’utilisateur modifié
    Se déconnecter
    Vérifier que nous sommes revenus sur la page de connexion

*** Keywords ***

générique (Username: Admin, Password: admin123)
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Input Text   name=username   ${USERNAME}
    Input Password   name=password   ${PASSWORD}
    Click Button   class=oxd-button
    Sleep    2s

cliquer dans le menu sur la page «PIM»
    Click Element    //span[text()="PIM"]
    Sleep    2s

Ajouter un utilisateur avec création de login (checkbox«CreateLogin Details»)
    ${FIRSTNAME}  Generate Random String    10  [LETTERS]
    Set Test Variable    ${FIRSTNAME}
    ${MIDDLENAME}  Generate Random String    10  [LETTERS]
    Set Test Variable    ${MIDDLENAME}
    ${LASTNAME}  Generate Random String    10  [LETTERS]
    Set Test Variable    ${LASTNAME}
    ${USERNAME_RANDOM}  Generate Random String    10  [LETTERS]
    Set Test Variable    ${USERNAME_RANDOM}
    ${PASSWORD_RANDOM}  Generate Random String    10  [LETTERS][NUMBERS]
    Set Test Variable    ${PASSWORD_RANDOM}
    ${ID}  Generate Random String    4  [NUMBERS]
    Set Test Variable    ${ID}

    Click Element    //button[text()=" Add "]
    Sleep    2s
    Input Text    class=orangehrm-firstname  ${FIRSTNAME}
    Input Text    class=orangehrm-middlename  ${MIDDlENAME}
    Input Text    class=orangehrm-lastname  ${LASTNAME}
    Input Text    //label[text()="Employee Id"]/following::input[1]  ${ID}
    Click Element    class=oxd-switch-input
    Sleep    2s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[3]/div/div[1]/div/div[2]/input  ${USERNAME_RANDOM}
    Input Password    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[4]/div/div[1]/div/div[2]/input  ${PASSWORD_RANDOM}
    Input Password    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[4]/div/div[2]/div/div[2]/input  ${PASSWORD_RANDOM}
    Sleep    2s
    Click Element    //button[text()=" Save "]
    Sleep    2s

Recherche l’utilisateur précédemment créé
    Click Element    //a[text()="Employee List"]
    Sleep    2s
    Input Text    //label[text()="Employee Name"]/following::input[1]  ${FIRSTNAME}
    Click Element    //button[text()=" Search "]
    Sleep    2s

Modifier les informations de l’utilisateur recherché
    Click Element    class=oxd-table-row--clickable
    Sleep    2s
    Input Text    //label[text()="Nickname"]/following::input[1]  ${ZIZI}
    Sleep    2s
    Click Element    //button[text()=" Save "]
    Sleep    5s
Supprimer l’utilisateur modifié
    Click Element    //button[i[@class="oxd-icon bi-trash"]]
    Sleep    2s
    Click Element    //button[text()=" Yes, Delete "]
    Sleep    2s
Se déconnecter
    Click Element    //li[@class="oxd-userdropdown"]
    Sleep    1s
    Click Element    //a[text()="Logout"]
    Sleep    2s
Vérifier que nous sommes revenus sur la page de connexion
    Page Should Contain Element    //div[@class="orangehrm-login-form"]