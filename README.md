# Bookmark Manager

## User Stories:
```
As a user
So I can see what bookmarks I have
I want to see a list of bookmarks
```

```
As a user
So I can store bookmarks for later
I want to be able to add bookmarks to the list
```

```
As a user
So I can modify my bookmarks
I want to be able to delete bookmarks I no longer want
```

```
As a user
So I can update my bookmarks
I want to be able to change my bookmark's details
```
Classes:
Bookmark
BookmarkManager (has list of Bookmarks).

show list -> method of the BookmarkManager

![user story 1](/user_story_1.png)

## How to use

### To set up the database

Connect to `psql` and create the `bookmark_manager` database & the `bookmark_manager_test:` database;

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup -p 3000
```

To view bookmarks, navigate to `localhost:3000/bookmarks`.

### To run tests:

```
rspec
```

### To run linting:

```
rubocop
```
