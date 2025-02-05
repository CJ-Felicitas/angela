### Containerized Version of Nginx Reverse Proxy

- The obtain ssl script is somehow dumb since it requires the machine to install the nginx first (I mean literally installed)
- The ssl certificates that are obtained are coming from the nginx so I think we need a way to come up with something that we will obtain the certificates via the containerized nginx.
- TODO: include automatic certificate renewal (maybe add some cron (idk, still figuring it out)).
- TODO: create a script for obtaining ssl certificates properly