outer <- c(
  "#294596",
  "#D91615",
  "#F0F134",
  "#89CBEC",
  "#294596"
)

middle1 <- c(
  "#6764AC",
  "#F06C43",
  "#E5F086",
  "#99D2E7",
  "#6764AC"
)

middle2 <- c(
  "#A198CC",
  "#E5A28C",
  "#E5ECB0",
  "#BDE2EC",
  "#A198CC"
)

inner <- c(
  "#DDD8EE",
  "#EFDBD5",
  "#F1F3E2",
  "#E6F3F7",
  "#DDD8EE"
)

outer_palette <- colorRampPalette(outer)
middle1_palette <- colorRampPalette(middle1)
middle2_palette <- colorRampPalette(middle2)
inner_palette <- colorRampPalette(inner)

ex1 <- outer_palette(40 + 1)
ex2 <- middle1_palette(32 + 1)
ex3 <- middle2_palette(24 + 1)
ex4 <- inner_palette(16 + 1)
w <- rep("#FFFFFF", 3)

r1 <- ex1[1:11]
r2 <- c(ex1[40], ex2[1:9], ex1[12])
r3 <- c(ex1[39], ex2[32], ex3[1:7], ex2[10], ex1[13])
r4 <- c(ex1[38], ex2[31], ex3[24], ex4[1:5], ex3[8], ex2[11], ex1[14])
r5 <- c(ex1[37], ex2[30], ex3[23], ex4[16], w, ex4[6], ex3[9], ex2[12], ex1[15])
r6 <- c(ex1[36], ex2[29], ex3[22], ex4[15], w, ex4[7], ex3[10], ex2[13], ex1[16])
r7 <- c(ex1[35], ex2[28], ex3[21], ex4[14], w, ex4[8], ex3[11], ex2[14], ex1[17])
r8 <- c(ex1[34], ex2[27], ex3[20], ex4[13:9], ex3[12], ex2[15], ex1[18])
r9 <- c(ex1[33], ex2[26], ex3[19:13], ex2[16], ex1[19])
r10 <- c(ex1[32], ex2[25:17], ex1[20])
r11 <- ex1[31:21]

colmat <- unname(rbind(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11))
save(colmat, file = "R/sysdata.rda")
