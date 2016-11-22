FROM php:7

RUN apt-get update
RUN apt-get install git unzip npm ruby-full gem -y

RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
RUN php /tmp/composer-setup.php --install-dir=/bin --filename=composer
RUN php -r "unlink('/tmp/composer-setup.php');"

RUN curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v1.12.4/php-cs-fixer.phar -o /bin/php-cs-fixer
RUN chmod a+x /bin/php-cs-fixer

RUN curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o /bin/phpcs
RUN chmod a+x /bin/phpcs

RUN curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar -o /bin/phpcbf
RUN chmod a+x /bin/phpcbf

RUN npm install -g bower

RUN gem update --system
RUN gem install compass