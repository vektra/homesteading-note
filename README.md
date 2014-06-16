# Homesteading Note

+[![Build Status](https://travis-ci.org/homesteading/homesteading-note.svg?branch=master)](https://travis-ci.org/homesteading/homesteading-note)

## Spoke App for Notes

**[Homesteading](https://github.com/homesteading)**
is a personal publishing platform where the creator owns the content
and can syndicate copies to third parties.

**[Homesteading Note](https://github.com/homesteading/homesteading-note)**
is an app used for publishing note updates. It connects to a
**[Homesteading Hub](https://github.com/homesteading/homesteading-hub)**
to feed updates downstream to subscriber apps.


## Setup

1. Install all the required gems.

    ```bash
    bundle
    ```

2. Set up your database.

    ```bash
    cp config/database.example.yml config/database.yml
    rake db:setup
    ```

3. Run the specs.

    ```bash
    rake db:test:prepare
    rspec
    ```

4. Start the application.

    ```bash
    rails s
    ```


## Authors

* Jessica Lynn Suttles / [@jlsuttles](https://github.com/jlsuttles)
* Shane Becker / [@veganstraightedge](https://github.com/veganstraightedge)


## Contributing

1. Fork it
1. Get it running
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Write your code and **specs**
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request

If you find bugs, have feature requests or questions, please
[file an issue](https://github.com/homesteading/homesteading-note/issues).


## Specs

Run once.

```bash
rspec
```


## License

**PUBLIC DOMAIN**

Your heart is as free as the air you breathe. <br>
The ground you stand on is liberated territory.

In legal text, Homesteading Note is dedicated to the public domain
using Creative Commons -- CC0 1.0 Universal.

[http://creativecommons.org/publicdomain/zero/1.0](http://creativecommons.org/publicdomain/zero/1.0 "Creative Commons &mdash; CC0 1.0 Universal")
