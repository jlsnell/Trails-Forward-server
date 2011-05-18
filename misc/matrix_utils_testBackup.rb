require 'matrix_utils'

require 'narray'



def sayhello
  puts "Waddup, dawg!"
end

def actualMatrixThings
  width = 20
  height = 20
  
  mainMatrix = NArray.byte(width,height)
  typeMatrix = NArray.byte(width,height)
  for y in (0...(height-1))
    str = ""
    for x in (0...(width-1))
      mainMatrix[x,y] = rand 3
      typeMatrix[x,y] = -1
      str += mainMatrix[x,y].to_s()
      str += '-'
    end
    puts str
  end
  #puts mainMatrix[0,0]
  
  puts "Break time"
  
 

  testNum = 2
  nextLabel = 0

  linked = []
   #labels = structure with dimensions of data, initialized with the value of Background
   
   #First pass
   
   
   for y in (0...(height-1))
     for x in (0...(width-1))
               
            neighbors = []
            neighborLabels = []
            if(x>0 && mainMatrix[(x-1),y]==mainMatrix[x,y])
              neighbors.push(mainMatrix[(x-1),y])
              neighborLabels.push(typeMatrix[(x-1),y])
            end
            
            
               
            if(y>0 && mainMatrix[x,(y-1)]==mainMatrix[x,y])
              neighbors.push(mainMatrix[x,(y-1)])
              neighborLabels.push(typeMatrix[x,(y-1)])
            end
            
            
            
            
            
            if (neighbors.length == 0)   
              linked[nextLabel] = []
              linked[nextLabel].push(nextLabel) 
              typeMatrix[x,y] = nextLabel
              nextLabel = nextLabel + 1
            else
              typeMatrix[x,y] = neighborLabels.min
              neighborLabels.each { |label|
                linked[label] = linked[label]|neighborLabels
              }
              #linked[typeMatrix[x,y]] = linked[typeMatrix[x,y]]|neighborLabels
            end
          
        end
      end
      
    #Second pass
    
            
               
   for y in (0...(height-1))
      for x in (0...(width-1))
        temp = []
        temp = linked[typeMatrix[x,y]]
        typeMatrix[x,y] = temp.min
      end
    end
    
    for y in (0...(height-1))
      str = ""
      for x in (0...(width-1))
        #str += (typeMatrix[x,y]+97).chr
        str += typeMatrix[x,y].to_s()
        str += '-'
      end
      puts str

    end
end   
   
  
      



sayhello
actualMatrixThings




 /#
  puts "----------------------------"
  
  
  for y in (0...(height-1))
    for x in (0...(width-1))
      if y==0
        if x==0
          typeMatrix[x,y]=typeNum
          typeNum=typeNum+1
        end
        if x<(width-1)
          #same
          if(((mainMatrix[x,y]==4)&&(mainMatrix[(x+1),y]==4))||((mainMatrix[x,y]!=4)&&(mainMatrix[(x+1),y]!=4)))
            typeMatrix[(x+1),y]=typeMatrix[x,y]
          end
          #dif
          if(((mainMatrix[x,y]!=4)&&(mainMatrix[(x+1),y]==4))||((mainMatrix[x,y]==4)&&(mainMatrix[(x+1),y]!=4)))
            typeMatrix[(x+1),y]=typeNum
            typeNum=typeNum+1
          end
        end
      end
      if y!=0
        if x<(width-1)
          #same
          if(((mainMatrix[x,y]==4)&&(mainMatrix[(x+1),y]==4))||((mainMatrix[x,y]!=4)&&(mainMatrix[(x+1),y]!=4)))
            puts "equivalence between"
            puts typeMatrix[x,y]
            puts typeMatrix[(x+1),y]
          end
          #dif
          if(((mainMatrix[x,y]!=4)&&(mainMatrix[(x+1),y]==4))||((mainMatrix[x,y]==4)&&(mainMatrix[(x+1),y]!=4)))
            #puts "nothing to do"
          end
        end
      end
      #standard down pass
      if y<(height-1)
        #same
        if(((mainMatrix[x,y]==4)&&(mainMatrix[x,(y+1)]==4))||((mainMatrix[x,y]!=4)&&(mainMatrix[x,(y+1)]!=4)))
          typeMatrix[x,(y+1)]=typeMatrix[x,y]
        end
        #dif
        if(((mainMatrix[x,y]!=4)&&(mainMatrix[x,(y+1)]==4))||((mainMatrix[x,y]==4)&&(mainMatrix[x,(y+1)]!=4)))
          typeMatrix[x,(y+1)]=typeNum
          typeNum=typeNum+1
        end
      end
    end
  end
  
  
  
  for y in (0...(height-1))
    str = ""
    for x in (0...(width-1))
      str += typeMatrix[x,y].to_s()
      str += '-'
    end
    puts str
    
  end
  
  #first right pass is like down pass
  
  
  #through matrix down 
  #if dif assign new
  #if same pass old
  #through matrix right 
  #if dif do nothing 
  #if same establish equivalence
end

#/