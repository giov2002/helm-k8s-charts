# Monitoring Stack - Prometheus & Grafana

Stack de monitoring pour la plateforme email avec Prometheus et Grafana.

## Composants

- **Prometheus** : Collecte des métriques (port 30090)
- **Grafana** : Visualisation des dashboards (port 30030)
- **Node Exporter** : Métriques système des workers
- **Postfix Exporter** : Métriques email (SMTP, queue, etc.)

## Installation
```bash
# Déployer le monitoring
cd ~/helm-k8s-charts
helm upgrade --install monitoring monitoring/ -n monitoring --create-namespace

# Vérifier le déploiement
kubectl get pods -n monitoring
kubectl get svc -n monitoring
```

## Accès

### Prometheus
- URL: `http://<worker-ip>:30090`
- Exemple: `http://197.158.77.40:30090`

### Grafana
- URL: `http://<worker-ip>:30030`
- Username: `admin`
- Password: `admin123`

## Dashboards

1. **Email Stack Overview** : Vue d'ensemble de la stack email
2. **Kubernetes Cluster** : Métriques du cluster K8s

## Métriques collectées

### Mailserver
- Nombre d'emails envoyés/reçus
- File d'attente SMTP
- Connexions IMAP/SMTP actives
- Erreurs de livraison

### Roundcube
- Sessions actives
- Requêtes HTTP
- Temps de réponse

### Kubernetes
- État des pods
- CPU/RAM utilisés
- Stockage (PVC)
- Network traffic

## Troubleshooting
```bash
# Logs Prometheus
kubectl logs -n monitoring -l app=prometheus

# Logs Grafana
kubectl logs -n monitoring -l app=grafana

# Vérifier les targets Prometheus
# Aller sur http://<worker-ip>:30090/targets
```
