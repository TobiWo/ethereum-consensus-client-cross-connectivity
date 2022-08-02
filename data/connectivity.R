# Legend
# TRUE  == validator client works with respective beacon client
# FALSE == validator client does not work with respective beacon client
# NA    == not checked yet

# CL clients in format <client name>_<release or tag>
clients <- c("lighthouse_v2.5.0", "teku_v22.7.0", "nimbus_v22.7.0", "prysm", "lodestar_v0.41.0")

client_combinations <- c(
  "lighthouse_lighthouse",
  "lighthouse_teku",
  "lighthouse_nimbus", 
  "lighthouse_prysm",
  "lighthouse_lodestar",
  "teku_lighthouse",
  "teku_teku",
  "teku_nimbus",
  "teku_prysm",
  "teku_lodestar",
  "nimbus_lighthouse",
  "nimbus_teku",
  "nimbus_nimbus",
  "nimbus_prysm",
  "nimbus_lodestar",
  "prysm_lighthouse",
  "prysm_teku",
  "prysm_nimbus",
  "prysm_prysm",
  "prysm_lodestar",
  "lodestar_lighthouse",
  "lodestar_teku",
  "lodestar_nimbus",
  "lodestar_prysm",
  "lodestar_lodestar"
)

# lighthouse beacon client with validator client x
lighthouse_lighthouse <- TRUE
lighthouse_teku <- TRUE
lighthouse_nimbus <- TRUE
lighthouse_prysm <- NA
lighthouse_lodestar <- TRUE

# teku beacon client with validator client x
teku_lighthouse <- TRUE
teku_teku <- TRUE
teku_nimbus <- TRUE
teku_prysm <- NA
teku_lodestar <- TRUE

# nimbus beacon client with validator client x
nimbus_lighthouse <- TRUE
nimbus_teku <- TRUE
nimbus_nimbus <- TRUE
nimbus_prysm <- NA
nimbus_lodestar <- FALSE

# prysm beacon client with validator client x
prysm_lighthouse <- NA
prysm_teku <- NA
prysm_nimbus <- NA
prysm_prysm <- TRUE
prysm_lodestar <- NA

# lodestar beacon client with validator client x
lodestar_lighthouse <- TRUE
lodestar_teku <- FALSE
lodestar_nimbus <- TRUE
lodestar_prysm <- NA
lodestar_lodestar <- TRUE