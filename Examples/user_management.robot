*** Settings ***
Library                             SeleniumLibrary

*** Variables ***
${USER_ROLE}   ESS
${STATUS}   Enabled 
${EMPLOYEE_NAME}   (type any caracter and select the first result) 
${USERNAME}   Robotframework
${PASSWORD}   secure password
${BROWSER}   Chrome
${URL}   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
User Managment (Selenium|Playwright) Robot Test
    [Tags]  User Managment (Selenium|Playwright) Robot Test
# 1. aller sur le site https://opensourcedemo.orangehrmlive.com/web/index.php/auth/login connecté avec le compte 
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window
    Input Text   id=txtUsername   ${USERNAME}
    Input Password   id=txtPassword   ${PASSWORD}
    Click Button   id=btnLogin
    Sleep   2s

générique (Username : Admin, Password : admin123)
2. cliquer dans le menu sur la page « Admin »
3. Ajouter un utilisateur
4. Recherche l’utilisateur précédemment créé
5. Modifier les informations de l’utilisateur recherché
6. Supprimer l’utilisateur modifié
7. Se déconnecter
8. Vérifier que nous sommes revenus sur la page de connexion



*** Keywords ***
