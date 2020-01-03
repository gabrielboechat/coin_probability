#simulando 20 vezes o lan�amento de 2000 moedas, convergindo a frequ�ncia relativa na probabilidade de 0.5
#mudando as janelas do plot (setinha direita em "plots") � poss�vel ver as 20 simula��es



   # set seed
   set.seed(1)
   
   # set number of coin tosses and simulate
   N <- 400
   Y <- sample(0:1, N, replace = TRUE)
   
   # Calculate R_n for 1:N
   S <- cumsum(Y)
   R <- S/(1:N)

   
for (i in c(1:N)){
   
   mypath = file.path("C:","Users","gabri","Desktop","Anima��es","Plots","slot 3",paste("imagem_",i,".jpeg",sep = ""))
   
   jpeg(file = mypath)
   
   plot(R[1:i],
        ylim = c(0.0, 1.0),
        type = "l",
        col = "purple",
        lwd = 2, 
        xlab = paste("n� of tossings: ",i), 
        ylab = "Ratio",
        main = "Converging Share of Heads in Repeated Coin Tossing")
   
   par(new = TRUE)
   
   lines(c(0, N), 
         c(0.5, 0.5), 
         col = "darkred", 
         lty = 2, 
         lwd = 1)
   
   dev.off()
}