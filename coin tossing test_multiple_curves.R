# Set number of coin tosses and simulate
N = 400

#  How many curves we will create?
C = 10

data_store = matrix(data = NA, nrow = N, ncol = C) # Creating each column in the matrix for individual curves that will be later plotted

for (j in c(1:C)){
   
   set.seed(j) # Since we change the seed each time the loop restarts, each j curve will be different
   
   Y = sample(0:1, N, replace = TRUE)
   
   S = cumsum(Y)
   R = S/(1:N)
   
   data_store[,j] = R # This matrix handle all data we need
   
}

   
for (i in c(1:N)){
   
   mypath = file.path("C:","Users","gabri","Desktop","Animações","Plots","slot 4",paste("imagem_",i,".jpeg",sep = ""))
   
   jpeg(file = mypath) # Saving each plot below on the designed archive

for (j in c(1:C)) {      
   plot(data_store[,j][1:i],
        ylim = c(0.0, 1.0),
        type = "l",
        col = j,
        lwd = 2, 
        xlab = paste("nº of tossings: ",i,"\n",C,"curves"), 
        ylab = "Ratio",
        main = "Converging Share of Heads in Repeated Coin Tossing \n Twitter: @gab_boechat")
   par(new = TRUE)
} # Looping to create each point of each curve. Notice that they will have different collors from one another
   
   par(new = TRUE)
   
   lines(c(0, N), 
         c(0.5, 0.5), 
         col = "black", 
         lty = 2, 
         lwd = 1) # The limit in 0.5 is plotted 
   
   dev.off()
}

# as we can see: "All roads lead to Rome!"