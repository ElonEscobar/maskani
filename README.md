# <strong> Rails API Template Repository </strong>

<h2> A template repository for rails API projects, configured with deployment options for <a href='railway.app'>railway.app</a>. </h2>

## Gems 

* `active_model_serializer` to format the json responses. 
* `pg` production gem for provisioning a postgres database. 
* `foreman` optional gem that will allow deployment of a react app as a client side for the API. 

## Configuration 

* The template sets a fake asset pipeline for the Railway deployment in <strong>`lib/assets/tasks/fake-assets`</strong>.
* In the `database.yml` file, sets the url for the database to use an env variable and the postgres adapter.
* In the `production.rb` and `development.rb` files, sets the application hosts
* Adds a `Procfile` with web starting options. 

