# Legend
# TRUE    == validator client works with respective beacon client
# FALSE   == validator client does not work with respective beacon client
# NA      == not checked yet
# "WARNING" == validator client works with respective beacon client but produces at least some error or warning logs

# CL clients in format <client name>_<release or tag>
clients <- c(
  "lighthouse_v3.0.0",
  "teku_v22.8.1",
  "nimbus_v22.7.0",
  "prysm_v3.0.0",
  "lodestar_v1.0.0",
  "vouch_v1.5.0"
)

# Warning log variable
WARNING <- "WARNING"

client_combinations <- c(
  "lighthouse_lighthouse",
  "lighthouse_teku",
  "lighthouse_nimbus",
  "lighthouse_prysm",
  "lighthouse_lodestar",
  "lighthouse_vouch",
  "teku_lighthouse",
  "teku_teku",
  "teku_nimbus",
  "teku_prysm",
  "teku_lodestar",
  "teku_vouch",
  "nimbus_lighthouse",
  "nimbus_teku",
  "nimbus_nimbus",
  "nimbus_prysm",
  "nimbus_lodestar",
  "nimbus_vouch",
  "prysm_lighthouse",
  "prysm_teku",
  "prysm_nimbus",
  "prysm_prysm",
  "prysm_lodestar",
  "prysm_vouch",
  "lodestar_lighthouse",
  "lodestar_teku",
  "lodestar_nimbus",
  "lodestar_prysm",
  "lodestar_lodestar",
  "lodestar_vouch"
)

# lighthouse beacon client with validator client x
lighthouse_lighthouse <- TRUE
lighthouse_teku <- TRUE
lighthouse_nimbus <- TRUE
lighthouse_prysm <- FALSE
lighthouse_lodestar <- TRUE
lighthouse_vouch <- TRUE

# teku beacon client with validator client x
teku_lighthouse <- TRUE
teku_teku <- TRUE
teku_nimbus <- TRUE
teku_prysm <- FALSE
teku_lodestar <- TRUE
teku_vouch <- TRUE

# nimbus beacon client with validator client x
nimbus_lighthouse <- TRUE
nimbus_teku <- TRUE
nimbus_nimbus <- TRUE
nimbus_prysm <- FALSE
nimbus_lodestar <- FALSE
nimbus_vouch <- TRUE

# prysm beacon client with validator client x
prysm_lighthouse <- NA
prysm_teku <- NA
prysm_nimbus <- NA
prysm_prysm <- TRUE
prysm_lodestar <- NA
prysm_vouch <- TRUE

# lodestar beacon client with validator client x
lodestar_lighthouse <- TRUE
lodestar_teku <- FALSE
lodestar_nimbus <- FALSE
lodestar_prysm <- FALSE
lodestar_lodestar <- TRUE
lodestar_vouch <- NA
