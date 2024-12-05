{{/*
Expand the name of the chart.
*/}}
{{- define "capieks.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "capieks.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "capieks.labels" -}}
helm.sh/chart: {{ include "capieks.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ include "capieks.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "capieks.selectorLabels" -}}
app.kubernetes.io/name: {{ include "capieks.name" . }}
{{- end }}
