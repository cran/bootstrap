"spatial" <-
structure(list(V1 = c(48, 42), V2 = c(36, 33), V3 = c(20, 16), V4 = c(29, 
39), V5 = c(42, 38), V6 = c(42, 36), V7 = c(20, 15), V8 = c(42, 
33), V9 = c(22, 20), V10 = c(41, 43), V11 = c(45, 34), V12 = c(14, 
22), V13 = c(6, 7), V14 = c(0, 15), V15 = c(33, 34), V16 = c(28, 
29), V17 = c(34, 41), V18 = c(4, 13), V19 = c(32, 38), V20 = c(24, 
25), V21 = c(47, 27), V22 = c(41, 41), V23 = c(24, 28), V24 = c(26, 
14), V25 = c(30, 28), V26 = c(41, 40)), class = "data.frame", row.names = c("1", 
"2"))
spatial  <-  t(spatial)
colnames(spatial) <- c("A", "B")
spatial <- as.data.frame(spatial)

