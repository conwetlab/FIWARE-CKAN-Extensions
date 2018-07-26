FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt install -y python-dev libpq-dev python-pip python-virtualenv git-core tzdata && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    \
    mkdir -p /usr/lib/ckan/default && \
    chown `whoami` /usr/lib/ckan/default && \
    virtualenv --no-site-packages /usr/lib/ckan/default && \
    . /usr/lib/ckan/default/bin/activate && \
    pip install -e 'git+https://github.com/ckan/ckan.git@ckan-2.8.1#egg=ckan' && \
    pip install -r /usr/lib/ckan/default/src/ckan/requirement-setuptools.txt && \
    pip install -r /usr/lib/ckan/default/src/ckan/requirements.txt && \
    deactivate && \
    . /usr/lib/ckan/default/bin/activate && \
    mkdir -p /etc/ckan/default && \
    chown -R `whoami` /etc/ckan/ && \
    apt install -y apache2 libapache2-mod-wsgi && \
    mkdir /opt/ckan && chown www-data:www-data /opt/ckan && \
    ln -s /usr/lib/ckan/default/src/ckan/ckan/config/who.ini /etc/ckan/default/who.ini && \
    ln -s /usr/lib/ckan/default/bin/paster /usr/local/bin/ckan-paster && \
    apt remove -y --autoremove python-dev libpq-dev && \
    rm -rf /var/lib/apt/lists/*

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./ports.conf /etc/apache2/ports.conf
COPY apache.wsgi /etc/ckan/default

VOLUME /opt/ckan
VOLUME /var/lib/ckan

COPY ./entrypoint.sh /

EXPOSE 5000

ENTRYPOINT ["/entrypoint.sh"]

RUN . /usr/lib/ckan/default/bin/activate && \
    pip install ckanext-oauth2 ckanext-privatedatasets ckanext-right_time_context ckanext-wirecloud_view ckanext-baepublisher
