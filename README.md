
  ![](https://img.shields.io/badge/Microverse-blueviolet)
***
>> # Ruby on Rails capstone project - Budget App 🟢
***

## Setup

To get a local copy up and running follow this simple step:

- Clone repository to your local machine:
  `git@github.com:TesheMaximillan/BudgetApp.git`
  This will create a directory in the name of the project folder.

- Navigate to project folder using `cd BudgetApp`

## Install

- Run `bundle install` to install all gems for the project.

## Usage

- Run `rails s` to start the server
- Open `http://127.0.0.1:3000/` in your browser to use the app

## Tests
- Run `rspec` to run the tests
---
![DBMS ER diagram (UML notation)](https://user-images.githubusercontent.com/51437483/182948071-564346a6-f50c-44e2-b845-04adc386f963.png)
---
### Basic Requirements:
***

> **Design**

* I followed [Design Guidelines](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=), including:
</br></br>
> **Splash screen**: with App name, login button, and sign up button


> **Sign up and Log in Pages**
  * The user able to register in the app with full name, email and password.
  * The user can log into the app using email and password.
  * If the user is not logged in, they can't access pages that require the user to be logged in (all the pages described below).
</br></br>
> **Home page (Categories page)**
  * When the user logs in, they are presented with the categories page.
  * For each category, the user can see their name, icon and the total amount of all the transactions that belongs to that category.
  * When the user clicks (or taps) on a category item, the application navigates to the transactions page for that category.
  * There is a button "add a new category" at the bottom that brings the user to the page to create a new category.
</br></br>
> **Transactions page**
  * For a given category, the list of transactions is presented, ordered by the most recent.
  * At the top of the page the user can see the total amount for the category (sum of all of the amounts of the transactions in that category).
  * There is a button "add a new transaction" at the bottom that brings the user to the page to create a new transaction.
  * When the user clicks on the "Back" button (<), the user navigates to the home page.
</br></br>
> **Add a new category page**
  * The user fills out a form to create a new category, indicating their name and icon (both mandatory).
  * The user click (or taps) the "Save" button to create the new category, and is taken to the home page on success.
  * When the user clicks on the "Back" button (<), the user navigates to the home page.
</br></br>
> **Add a new category page**
  * The user fills out a form to create a new transaction with:
    * name
    * amount
  * The user click (or taps) the "Save" button to create the new category, and is taken to the transactions page for that category.
  * When the user clicks on the "Back" button (<), the user navigates to the transactions page for that category.

### Testing Requirements:
***
> **Unit Test and Integration Test**

* Using RSpec and Capyabara, 
  * Test Models
  * Test Controllers
  * Test Views (Features)

### Technical Requirements:
***
> **For Technical Requirements**
* PostgreSQL for Database
* Ruby on Rails for Web Framework
* RSpec for Testing
* Capyabara for Integration Testing
* validates all user input
* Heroku for Deployment

## Live Demo

[Live Demo]()

## Screenshots

>> Splash Screen | Sign Up | Log in | Categories | New Categories | Transactions | New Transactions

![image](https://user-images.githubusercontent.com/51437483/182955220-58aeb90a-92fe-421c-b591-8d427e9307b4.png)
![image](https://user-images.githubusercontent.com/51437483/182958981-8d814fba-54d0-49ac-9cef-63ebb961bfec.png)
![image](https://user-images.githubusercontent.com/51437483/182958821-031e84ba-c888-4961-b7df-0e1bfcec7917.png)
![image](https://user-images.githubusercontent.com/51437483/182956506-64c0c61f-cb24-48c7-8925-25987f707578.png)
![image](https://user-images.githubusercontent.com/51437483/182956712-959b1b71-405e-4e80-b7fd-c26fb9b767ac.png)
![image](https://user-images.githubusercontent.com/51437483/182957038-b289cddd-8e94-4df9-8b0c-e7642c5d9ec4.png)
![image](https://user-images.githubusercontent.com/51437483/182958647-3fb8e040-60ee-419f-80b6-2c2f5b23c8cd.png)

## Authors

👤 **Teshome Kurabachew**

- GitHub: [@githubhandle](https://github.com/TesheMaximillan)
- Twitter: [@twitterhandle](https://twitter.com/TesheKura)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/teshome-kurabachew-aa8067180/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/TesheMaximillan/BlogApp/issues).

## Show your support

Give a ⭐️ if you like this project!

## Credits

[Gregoire Vella on Behance.](https://www.behance.net/gregoirevella)

## Acknowledgments

Microverse

## 📝 License

This project is [MIT](./MIT.md) licensed.
