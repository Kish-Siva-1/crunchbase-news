# Crunchbase News

The Crunchbase News Gem is designed to extract news articles from news.crunchbase.com, page by page. 

The scraper automatically extracts the latest 10 pages of news articles and stores them. It retrieves whichever page of the 10 pages the user specifies and returns a list of articles with the article number, title, date and authors(s) provided. The user can select whether they would like to read any of the articles in further detail by specifying the article number to see the content of the article.   

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crunchbase-news'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crunchbase-news

## Usage

Type the below and follow the on screen prompts.

  ./bin/crunchbase-news

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'Kish'/crunchbase-news. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Crunchbase News project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'Kish'/crunchbase-news/blob/master/CODE_OF_CONDUCT.md).
