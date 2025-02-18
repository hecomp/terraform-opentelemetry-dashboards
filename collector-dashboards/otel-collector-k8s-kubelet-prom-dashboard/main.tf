terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.10"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "k8s_kubelet_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "K8S Kubelet"
  dashboard_description = "Monitor your K8S Kubelets with this overview dashboard."

  chart {
    name = "Running Kubelets"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_node_name | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Running Pods"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_running_pods | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Running Containers"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_running_containers | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Actual Volume Count"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric volume_manager_total_volumes | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Desired Volume Count"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric volume_manager_total_volumes | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Operation Rate"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_runtime_operations_total | rate | group_by ["operation_type"], sum
EOT
    }

  }

  chart {
    name = "Operation Error Rate"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_runtime_operations_errors_total | rate | group_by [], sum
EOT
    }

  }

  chart {
    name = "Operation duration (p99)"
    rank = "7"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_runtime_operations_duration_seconds | delta | group_by ["instance", "operation_type"], sum
EOT
    }

  }

  chart {
    name = "Pod Start Duration (p95)"
    rank = "8"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_pod_worker_duration_seconds | delta | group_by ["service"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_pod_start_duration_seconds | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Storage Operation Duration (p99)"
    rank = "9"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric storage_operation_duration_seconds | delta | group_by ["instance", "operation_name", "volume_plugin"], sum
EOT
    }

  }

  chart {
    name = "Cgroup manager duration seconds (p99)"
    rank = "10"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_cgroup_manager_duration_seconds | delta | group_by ["instance", "operation_type"], sum
EOT
    }

  }

  chart {
    name = "PLEG relist interval (p99)"
    rank = "11"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_pleg_relist_interval_seconds | delta | group_by ["instance"], sum
EOT
    }

  }

  chart {
    name = "PLEG relist duration (p99)"
    rank = "12"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric kubelet_pleg_relist_duration_seconds | delta | group_by ["instance"], sum
EOT
    }

  }

  chart {
    name = "RPC Rates (2xx, 4xx, 5xx)"
    rank = "13"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric rest_client_requests_total | rate | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric rest_client_requests_total | rate | group_by [], sum
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric rest_client_requests_total | rate | group_by [], sum
EOT
    }

  }

  chart {
    name = "Request duration (p99)"
    rank = "14"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric rest_client_request_duration_seconds | delta | group_by ["verb"], sum
EOT
    }

  }

  chart {
    name = "Memory"
    rank = "15"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric process_resident_memory_bytes | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "CPU Usage"
    rank = "16"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric process_cpu_seconds_total | rate | group_by ["instance"], mean
EOT
    }

  }

  chart {
    name = "Goroutines"
    rank = "17"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric go_goroutines | latest | group_by ["instance"], mean
EOT
    }

  }

}
