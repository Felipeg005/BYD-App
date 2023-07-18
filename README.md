## BYD (Budget Your Day) App

Mobile web application where you can manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what.

## Live Version

[Please visit the live version](https://thawing-escarpment-03695.herokuapp.com/)

## Built With

- Ruby (ruby 3.0.3p0)
- Rails 5.2.3

## Prerequisites

- Before we begin, make sure you have a fresh version of Ruby and PostgresSQL porperly installed.
- Please be sure that the cluster to the local server database is running with the next command:
`sudo pg_ctlcluster <Here your pg Version or the cluster you configured> main start` 

please note that if the cluster is stoped or doesn't exits the application will not run because it needs an online database.

## Getting Started

1. Clone this repository in your local. `git clone https://github.com/Felipeg005/Recipe-App-Rails`
2. Checkout the correct branch `git checkout <desired branch>`
3. Please run `bundle install` to install all necessary gems before set up the database
4. Create the database of the project and load default data in db/seed.rb with this command
  `rails db:setup`
5. Now with all installations ready please start the local server with the next code `rails s`
6. Please if you want to populate the database with more information do it in ypur own branch in
the seed.rb file and run the command
  `rails db:reset`

## Rspec Test

1. Please run `bundle install` to install all necessary gems before the test
2. You can run `rspec spec` or `rails spec` to test all files

## Author

👤 **Juan Felipe Gomez Tobon**

- GitHub: [@githubhandle](https://github.com/Felipeg005/)
- Twitter: [@twitterhandle](https://twitter.com/JuanFGT05)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/juan-felipe-gomez-tobon/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Thanks to Microverse for make it possible!

- <div>Iconos diseñados por <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.es/" title="Flaticon">www.flaticon.es</a></div>

- <a href="https://www.flaticon.com/free-icons/switch" title="switch icons">Switch icons created by Plastic Donut - Flaticon</a>

- <a href="https://www.flaticon.com/free-icons/toggle" title="toggle icons">Toggle icons created by Plastic Donut - Flaticon</a>

- <a href="https://www.flaticon.com/free-icons/budget" title="budget icons">Budget icons created by Freepik - Flaticon</a>

## 📝 License

This project is [MIT](./MIT.md) licensed.
