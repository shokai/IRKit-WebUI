IRKit WebUI
===========
controll IRKit via Web

![scrennshot](http://shokai.org/archive/file/9e1c2e62dff7baa495e2f6271f1ee496.png)


Dependencies
------------
- Ruby 2.0.0+
- [IRKit](http://getirkit.com)

Install Dependencies
--------------------

    % gem install bundler foreman
    % bundle install


Run
---

    % export BASIC_AUTH_USERNAME=username
    % export BASIC_AUTH_PASSWORD=password
    % export IRKIT=192.168.1.106
    % bundle exec rackup config.ru -p 5000

=> http://localhost:5000


## Install as a Service

### for launchd (Mac OSX)

export launchd plist file

    % sudo foreman export launchd /Library/LaunchDaemons/ --app irkit-webui -u `whoami`

edit plist before launch, then

    % sudo launchctl load -w /Library/LaunchDaemons/irkit-webui-1.plist

edit plist before launch


### for upstart (Ubuntu)

export upstart file

    % sudo foreman export upstart /etc/init/ --app irkit-webui -d `pwd` -u `whoami`

edit upstartfile before launch, then

    % sudo service irkit-webui start

