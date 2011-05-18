require 'matrix_utils'
require 'narray'

BirdOutput = Struct.new(:outputMatrix, :count)




class Matrix_utils_test
  
  #tests bwcc
  def test(testMatrix)
    outputMatrix = bwcc(testMatrix)
    return outputMatrix
  end
  
  #tests the newer version of bwcc
  def test_New(testMatrix)
    output = bwccN(testMatrix)
    return output
  end
  
  #Tests the label matrix generator
  def test_Label(testMatrix)
    outputMatrix = bwccL(testMatrix)
    return outputMatrix
  end
  
  #Tests the perimeter matrix generator
  def test_Perimeter(testMatrix)
    outputMatrix = bwccP(testMatrix)
    return outputMatrix
  end
  
  def test_Chickadee(testMatrix)
    tempOutput = bwccN(testMatrix)
    width = testMatrix.shape[0]
    height = testMatrix.shape[1]
    outputMatrix = NArray.byte(width,height)
    outputMatrix.fill!(0)
    count = 0
    
    tempOutput.PixelIdxList.each{ |val|
      if(val.length>5 && testMatrix[val[0][0],val[0][1]]!=0)
        val.each{ |point|
          outputMatrix[point[0],point[1]] = 1 
          count = count + 1
        }
      end
    }
    
    output = BirdOutput.new(outputMatrix, count)
    return output
  end
  
  def test_Warbler(testMatrix)
    tempOutput = bwccN(testMatrix)
    perimOutput = bwccP(testMatrix)
    width = testMatrix.shape[0]
    height = testMatrix.shape[1]
    outputMatrix = NArray.byte(width,height)
    outputMatrix.fill!(0)
    count = 0
    
    tempOutput.PixelIdxList.each{ |val|
      if(val.length>0 && testMatrix[val[0][0],val[0][1]]!=0)
        val.each{ |point|
          if( perimOutput[point[0],point[1]] != 1)
            outputMatrix[point[0],point[1]] = 1 
            count = count + 1
          end
        }
      end
    }
    
    output = BirdOutput.new(outputMatrix, count)
    return output
  end
  
  
end  
  