{{ define "slack_title" }}
  {{- if (eq .Status "firing") -}}
      {{- printf "%s" .CommonAnnotations.triggered_title -}}
  {{- else if (eq .Status "resolved") -}}
      {{- printf "%s" .CommonAnnotations.resolved_title -}}
  {{- else -}}
  {{- end -}}
{{ end }}

{{ define "slack_message" }}
    {{- if (eq .Status "firing") -}}
      {{- range .Alerts -}}
      {{- printf "• Instance : %s\n• Private IP : %s\n" .Annotations.instance_name .Annotations.private_ip -}}
      {{- end -}}
    {{- else if (eq .Status "resolved") -}}
      {{- range .Alerts -}}
      {{- printf "• Instance : %s\n• Private IP : %s\n" .Annotations.instance_name .Annotations.private_ip -}}
      {{- end -}}
    {{- else -}}
    {{- end -}}
{{ end }}

{{ define "slack_color" }}
  {{- if (eq .Status "firing") -}}
    critical
  {{- else -}}
    good
  {{- end -}}
{{ end }}
