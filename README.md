# Keyphrase

Extracts keywords from texts using a stoplist and some magic. This is forked
from the original gem [rake_text](https://github.com/voidplus/rake-text-ruby)
and has some added improvements.

* Multi-language support.
* Better split word support, handles - and ' characters better.
* Stop word is not removed if deemed important.

## Installation

Install [Keyphrase](https://rubygems.org/gems/keyphrase) via RubyGem:

```
gem install keyphrase
```

## Usage

Import the library and create an instance:

```
require 'keyphrase'
keyphrase = Keyphrase.new
```

Use a custom stopword list:

```
keyphrase.analyse "your text", stopwords: %w{words to remove here}
# → {"compatibility"=>1.0, "systems"=>1.0, "linear constraints"=>4.5, "set"=>2.0, "natural numbers"=>4.0, "criteria"=>1.0, "system"=>1.0, "linear diophantine equations"=>8.5, "strict inequations"=>4.0, "nonstrict inequations"=>4.0, "considered"=>1.5, "upper bounds"=>4.0, "components"=>1.0, "minimal set"=>4.666666666666666, "solutions"=>1.0, "algorithms"=>1.0, "construction"=>1.0, "minimal generating sets"=>8.666666666666666, "types"=>1.6666666666666667, "constructing"=>1.0, "minimal supporting set"=>7.666666666666666, "solving"=>1.0, "considered types"=>3.166666666666667, "mixed types"=>3.666666666666667}
```

Use a stopword list for a language:

```
keyphrase.analyse "your text", lang: :kor
```
See `lib/keyphrase/stoplist` for all supported languages.

Shorthand usage:

```
Keyphrase.analyse "your text"
```

Show sorted results:

```
keyphrase.analyse "your text", verbose: true
# 8.67 - minimal generating sets
# 8.50 - linear diophantine equations
# 7.67 - minimal supporting set
# 4.67 - minimal set
# 4.50 - linear constraints
# 4.00 - upper bounds
# 4.00 - strict inequations
# [...]
# → {"compatibility"=>1.0, "systems"=>1.0, "linear constraints"=>4.5, "set"=>2.0, "natural numbers"=>4.0, "criteria"=>1.0, "system"=>1.0, "linear diophantine equations"=>8.5, "strict inequations"=>4.0, "nonstrict inequations"=>4.0, "considered"=>1.5, "upper bounds"=>4.0, "components"=>1.0, "minimal set"=>4.666666666666666, "solutions"=>1.0, "algorithms"=>1.0, "construction"=>1.0, "minimal generating sets"=>8.666666666666666, "types"=>1.6666666666666667, "constructing"=>1.0, "minimal supporting set"=>7.666666666666666, "solving"=>1.0, "considered types"=>3.166666666666667, "mixed types"=>3.666666666666667}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bendangelo/keyphrase.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
