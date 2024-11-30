resource "google_compute_security_policy" "policy" {
  name        = "infrastructure-as-code-security-policy"
  description = "template rules"

  advanced_options_config {
    json_parsing = "STANDARD"
    log_level    = "VERBOSE"
  }

  adaptive_protection_config {
    layer_7_ddos_defense_config {
      enable          = true
      rule_visibility = "STANDARD"
    }
  }

  type = "CLOUD_ARMOR"



  rule {
    action   = "deny(403)"
    priority = "11000"
    preview  = true
    match {
      expr {
        expression = "evaluatePreconfiguredWaf('sqli-v33-stable', {'sensitivity': 1})"
      }
    }
    description = "SQLi - OWASP Rule"
  }

  rule {
    action   = "deny(403)"
    priority = "12000"
    preview  = true
    match {
      expr {
        expression = "evaluatePreconfiguredWaf('xss-v33-stable', {'sensitivity': 1})"
      }
    }
    description = "XSS - OWASP Rule"
  }

  rule {
    action   = "deny(403)"
    priority = "18000"
    preview  = true
    match {
      expr {
        expression = "evaluatePreconfiguredWaf('protocolattack-v33-stable', {'sensitivity': 1})"
      }
    }
    description = "Protocol Attack - OWASP Rule"
  }

  rule {
    action   = "deny(403)"
    priority = "19000"
    preview  = true
    match {
      expr {
        expression = "evaluatePreconfiguredWaf('sessionfixation-v33-stable', {'sensitivity': 1})"
      }
    }
    description = "Session Fixation - OWASP Rule"
  }


  rule {
    action   = "deny(403)"
    priority = "22000"
    preview  = true
    match {
      expr {
        expression = "evaluatePreconfiguredWaf('cve-canary', {'sensitivity': 3})"
      }
    }
    description = "Critical vulnerabilities rule"
  }

  rule {
    action   = "throttle"
    priority = "30000"
    preview  = true
    rate_limit_options {
      enforce_on_key = "ALL"
      conform_action = "allow"
      exceed_action  = "deny(429)"
      rate_limit_threshold {
        count        = "500"
        interval_sec = "60"
      }
    }
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "Rate limit all user IPs"
  }

  rule {
    action   = "allow"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default rule"
  }
}
