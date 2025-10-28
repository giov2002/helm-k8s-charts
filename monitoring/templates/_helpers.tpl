{{/*
Expand the name of the chart.
*/}}
{{- define "monitoring.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "monitoring.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "monitoring.labels" -}}
helm.sh/chart: {{ include "monitoring.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Prometheus labels
*/}}
{{- define "monitoring.prometheus.labels" -}}
{{ include "monitoring.labels" . }}
app.kubernetes.io/name: prometheus
app.kubernetes.io/component: monitoring
{{- end }}

{{/*
Grafana labels
*/}}
{{- define "monitoring.grafana.labels" -}}
{{ include "monitoring.labels" . }}
app.kubernetes.io/name: grafana
app.kubernetes.io/component: visualization
{{- end }}
