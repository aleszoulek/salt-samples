{% for username in pillar['users'] %}
{{ username }}:
  group:
    - present
  user.present:
    - groups:
      - {{ username }}
    - shell: /bin/bash
    - require:
      - group: {{ username }}
  ssh_auth:
    - present
    - user: {{ username }}
    - source: salt://users/{{ username }}.pub
    - require:
      - user: {{ username }}
{% endfor %}

