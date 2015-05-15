package com.google.code.p.Mallory
{
	public class Structure
	{
		public function Structure(newChriteria:Array=null,newOperations:Array=null,newInverses:Array=null,newIdentities:Array=null,newWrapMethod:Object=null, newEqualityMethod:Object=null)
		{
			_chriteria = newChriteria;
			_operations = newOperations;
			_inverses = newInverses;
			_identities = newIdentities;
			_wrapMethod = newWrapMethod;
			_equalityMethod = newEqualityMethod;				
		}
		private var _chriteria:Array;
		private var _operations:Array;
		private var _inverses:Array;
		private var _identities:Array;
		private var _wrapMethod:Object;
		private var _equalityMethod:Object;		
		////////////////////
		//Chriteria
		////////////////////
		
		public function chriterion(index:uint):Object{
			return _chriteria[index]
		}		

		
		public function isMember(element:*):Boolean{
			for(var i:uint = 0; i<_chriteria.length; i++){
				if(_chriteria[i](element) == false){
					return false;	
				}
				
			} 
			return true;
		}		
		

		

		////////////////////
		//Operations
		////////////////////
		
		public function operation(index:uint):Object{
			return _operations[index];
		}
		
		public function integerPower(scalar:*,power:int,operationIndex:uint=0):*{
			var finalScalar:* = identity(operationIndex);
			var opp:Object = operation(operationIndex);
			if(power <0){
				power *=-1;
				scalar = inverse(operationIndex)(scalar);
			}
			
			
			for(var i:uint=0; i<power; i++){
				finalScalar = opp(finalScalar,scalar);
			}
			
			
			return finalScalar;
		}
		
		
		//First Operation
		
		public function get add():Object{
			return _operations[0];
		}
		
		public function addPower(scalar:*,power:int):*{
			return integerPower(scalar,power);
		}
		
		

		
		//Second Operation
		public function get multiply():Object{
			return _operations[1];
		}		
		
		public function multiplyPower(scalar:*,power:int):*{
			return integerPower(scalar,power,1);
		}		
		////////////////////
		//Inverse Specific Stuff
		////////////////////
		
		public function inverse(index:uint=0):Object{
			return _inverses[index];
		}		
		
		public function get negative():Object{
			return inverse(0);
		}
		public function get reciprocal():Object{
			return inverse(1);
		}		

		public function subtract(elementA:*,elementB:*):*{
			return add(elementA, negative(elementB));
		}
		
		public function divide(elementA:*,elementB:*):*{
			return multiply(elementA, reciprocal(elementB));
		}			
		
		////////////////////
		//Identities
		////////////////////		
		
		public function identity(index:uint=0):*{
			return _identities[index]
		}		
		
		
		public function get zero():*{
			return _identities[0];
		}

		public function get one():*{
			return _identities[1];
		}		
		
		////////////////////
		//Wrapper 
		////////////////////		
		public function get wrap():Object{
			return _wrapMethod;
		}
		
		////////////////////
		//Wrapper 
		////////////////////		
		public function get equality():Object{
			return _equalityMethod;
		}		
		
		/////
		//////////
		///////////////
		//Section II : Vector Specific 
		//These are functions for manipulating vectors whose elements come from this structure
		///////////////
		//////////
		/////
		
		public function contains(alpha:Vector,element:*):Boolean{
			return VectorUtils.Contains(alpha,element,equality);
		}
						
		public function wrapVector(alpha:Vector):Vector{
			return VectorUtils.Transform(alpha,wrap);
		}


		/**
		 * DESCRIPTION: Adds two vectors component-wise
		 * @id=addVector
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first vector to be added
		 * @param {Vector} beta 	second vector to be added
		 * -------------------------------------
		 * RETURNS: A vector that is the component-wise sum of two vectors
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
 		public function addVector(alpha:Vector, beta:Vector):Vector{
			return VectorUtils.Combine(alpha,beta,add,zero);
		}
		
		/**
		 * DESCRIPTION: Scales a vector by a given number
		 * @id=scaleVector
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	vector to be scaled
		 * @param {*} scalar 		scalar with which to scale vector
		 * -------------------------------------
		 * RETURNS: A vector that is the original vector scaled by a scalar
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 *
		 */
		public function scaleVector(alpha:Vector,scalar:*):Vector{
			return VectorUtils.Transform(alpha,function(x:*):*{return multiply(scalar,x)});
		}
		




		/**
		 * DESCRIPTION: Negates a vector
		 * @id=negativeVector
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	vector to be scaled
		 * -------------------------------------
		 * RETURNS: A negated version of the original vector
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)trace(Negative(new Vector(1,2,3)); //Output: [-1,-2,-3] 
		 * (b)trace(Negative(new Vector(-5))); //Output: [5]
		 */
		public function negativeVector(alpha:Vector):Vector{
			return VectorUtils.Transform(alpha,negative);
		}
		
		public function reciprocalVector(alpha:Vector):Vector{
			return VectorUtils.Transform(alpha,reciprocal);
		}
		
		public function inverseVector(alpha:Vector,index:uint=0):Vector{
			return VectorUtils.Transform(alpha,inverse(index));
		}		
		
		
		/**
		 * DESCRIPTION: Subtracts a vector from another
		 * @id=subtractVector
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	Vector 
		 * @param {Vector} beta 	Vector to be subtracted from alpha
		 * -------------------------------------
		 * RETURNS: A Vector that is the difference of two vectors
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public function subtractVector(alpha:Vector, beta:Vector):Vector{
				return addVector(alpha,negativeVector(beta));
		}


		/**
		 * DESCRIPTION: Multiplies two vectors using the "Dot Procuct" (A.K.A. "Scalar Product") 
		 * @id=dotProduct
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first Vector to be multiplied 
		 * @param {Vector} beta 	second Vector to be multiplied
		 * -------------------------------------
		 * RETURNS: A Number that is the dot product of two given vectors
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public function dotProduct(alpha:Vector,beta:Vector):*{
			var collapsable:Vector = VectorUtils.Combine(alpha,beta,multiply,zero);
			return VectorUtils.Collapse(collapsable,add);
		}
		
		
		
		
		
		
		
		
		/**
		 * DESCRIPTION: Multiplies two vectors using the "Cross Procuct" (A.K.A. "Vector Product", "Gibbs Product") 
		 * @id=crossProduct
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first Vector to be multiplied 
		 * @param {Vector} beta 	second Vector to be multiplied
		 * -------------------------------------
		 * RETURNS: A Vector that is the cross product of two given vectors
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a) If Vectors have length greater than 3, then components beyond the third are ignored.  
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 * 
		 */
		public function crossProduct(alpha:Vector,beta:Vector):Vector{
			var a0:Number=zero; var a1:Number=zero; var a2:Number=zero;
			var b0:Number=zero; var b1:Number=zero; var b2:Number=zero;
			
			if(alpha[0]){a0=alpha[0];}
			if(alpha[1]){a1=alpha[1];}
			if(alpha[2]){a2=alpha[3];}
			if(beta[0]){a0=beta[0];}
			if(beta[1]){a1=beta[1];}
			if(beta[2]){a2=beta[3];}			

			var i:Number = subtract(multiply(a1,b2) , multiply(a2,b1));
			var j:Number = subtract(multiply(a2,b0) , multiply(a0,b2));
			var k:Number = subtract(multiply(a0,b1) , multiply(a1,b0));
			return new Vector(i,j,k);
		}		
		
		
		
		/**
		 * DESCRIPTION: Multiplies two vectors using the "Kronecker Procuct" 
		 * @id=kroneckerProduct
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first Vector to be multiplied 
		 * @param {Vector} beta 	second Vector to be multiplied
		 * -------------------------------------
		 * RETURNS: A Vector that is the kronecker product of two given vectors
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a) A kronecker product is actually a product of two matricies.
		 * This is somewhat analogous to that, but probably wouldn't be considered a true kronocker product. 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public function kroneckerProduct(A:Vector, B:Vector):Vector{
			
			var kronecker:Vector = VectorUtils.ConstantVector(A.length);
			kronecker = VectorUtils.FillByIndex(kronecker,function(i:int):*{return scaleVector(B,A[i]);})
			//return kronecker;
			return VectorUtils.FlattenSDLevels(kronecker,2);
		}		
		

		/////
		//////////
		///////////////
		//Section III : Matricies 
		//
		///////////////
		//////////
		/////
		/**
		 * DESCRIPTION: Generates an identiy matrix
		 * @id=generateIdentity
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} height 	height of generated matrix
		 * @param {Vector} width	width of identity matrix
		 * -------------------------------------
		 * RETURNS: A matrix with 1s along it's main diagnoal and 0s everywhere else
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public function generateIdentity(height:uint=1,width:uint=1):Vector{
			return VectorUtils.GenerateIdentity(height,width,one,zero);			
		}
		
		/**
		 * DESCRIPTION: Adds two matricies component-wise
		 * @id=addMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first matrix to be added
		 * @param {Vector} beta 	second matrix to be added
		 * -------------------------------------
		 * RETURNS: A matrix that is the component-wise sum of two matricies
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public function addMatrix(alpha:Vector,beta:Vector):Vector{
			return VectorUtils.Combine(alpha,beta,addVector);
		}
		
		/**
		 * DESCRIPTION: Scales a vector by a given number
		 * @id=scaleMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix to be scaled
		 * @param {*} scalar 		scalar with which to scale matrix
		 * -------------------------------------
		 * RETURNS: A matrix that is the original vector scaled by a scalar
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public function scaleMatrix(alpha:Vector,scalar:Number):Vector{
			return VectorUtils.TransformEndNodes(alpha,function(x:*):*{return multiply(scalar,x)});
		}		
		
		
		
		
		
		
		
		/**
		 * DESCRIPTION: Negates a matrix
		 * @id=negativeMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix to be scaled
		 * -------------------------------------
		 * RETURNS: A negated version of the original matrix
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public function negativeMatrix(alpha:Vector):Vector{
			return VectorUtils.TransformEndNodes(alpha,negative)
		}
		
				
		/**
		 * DESCRIPTION: Subtracts a matrix from another
		 * @id=subtractMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix 
		 * @param {Vector} beta 	matrix to be subtracted from alpha
		 * -------------------------------------
		 * RETURNS: A matrix that is the difference of two matricies
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public function subtractMatrix(alpha:Vector,beta:Vector):Vector{
			return addMatrix(alpha,negativeMatrix(beta));
		}		
		
		/**
		 * DESCRIPTION: Scales a specific row of a matrix
		 * @id=scaleRow
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix containing row to be scaled
		 * @param {uint} index 		index of row to be scaled
		 * @param {Number} scalar 	scalar with which to scale the given row
		 * -------------------------------------
		 * RETURNS: A matrix with a row that has been scaled
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function scaleRow(alpha:Vector,index:uint=0,scalar:*=null):Vector{
			var newM:Vector = alpha.clone();
			newM = VectorUtils.RowSet(newM, Scale(newM[index],scalar),index);
			return newM;
		}
		
		/**
		 * DESCRIPTION: Scales a specific column of a matrix
		 * @id=scaleColumn
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix containing column to be scaled
		 * @param {uint} index 		index of column to be scaled
		 * @param {Number} scalar 	scalar with which to scale the given column
		 * -------------------------------------
		 * RETURNS: A matrix with a row that has been scaled
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function scaleColumn(alpha:Vector,index:uint=0,scalar:*=null):Vector{
			return VectorUtils.Transpose(ScaleRow(alpha,index,scalar));
		}
		
		
		
		/**
		 * DESCRIPTION: Calculates the trace of a given matrix
		 * @id=Trace
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix whos trace is to be calculated
		 * -------------------------------------
		 * RETURNS: A number that is the trace of a given matrix
		 * @return {Number}
		 * -------------------------------------
		 * NOTES:
		 * (a) By definition, only a square matrix has a trace, but this also calulates the "trace" of non-square matrices
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function Trace(alpha:Vector):*{
			return VectorUtils.Collapse(VectorUtils.Diagnoal(alpha),add)
		}		
		
		/**
		 * DESCRIPTION: Multiplies two matricies using the "Kronecker Procuct" 
		 * @id=kroneckerMatrixProduct
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first Vector to be multiplied 
		 * @param {Vector} beta 	second Vector to be multiplied
		 * -------------------------------------
		 * RETURNS: A matrix that is the kronecker product of two given matricies
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */
		public static function kroneckerMatrixProduct(alpha:Vector, beta:Vector):Vector{
			var kronecker:Vector = VectorUtils.ConstantMatrix(VectorUtils.Height(alpha),VectorUtils.Width(alpha)); 
			kronecker = VectorUtils.FillMatrixByIndex(kronecker,function(i:int,j:int):*{return scaleMatrix(beta,alpha[i][j]);})
			return VectorUtils.BreakBlock(kronecker);
		}
		
		/**
		 * DESCRIPTION: Multiplies two matricies using the standard matrix product
		 * @id=multiplyMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	first matrix to be multiplied 
		 * @param {Vector} beta 	second matrix to be multiplied
		 * -------------------------------------
		 * RETURNS: A matrix that is the kronecker product of two given matricies
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a) The Height of the alpha should mathch the width of beta
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */		
		public static function multiplyMatrix(alpha:Vector,beta:Vector):Vector{
			var kroneckerList:Vector = new Vector();
			for(var i:int = 0; i<VectorUtils.Width(alpha); i++){
				kroneckerList.push(kroneckerMatrixProduct(VectorUtils.GetColumn(alpha,i),VectorUtils.GetRow(beta,i)));
			}
			return VectorUtils.Collapse(kroneckerList,addMatrix);
		}		
		
		
		/**
		 * DESCRIPTION: Raises a matrix to a an integer power
		 * @id=powerMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix to be raised to a power
		 * @param {int} power 		power to raise matrix to 
		 * -------------------------------------
		 * RETURNS: A matrix that is the given matrix raised to a given power
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:\
		 * (a) Matricies should be square 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */		
		public static function powerMatrix(alpha:Vector,power:int=1):Vector{
			var powerList:Vector = new Vector();
			var newMatrix:Vector;
			
			if(power==0){
				return GenerateIdentity(VectorUtils.Height(alpha),VectorUtils.Width(alpha));
			}else if(power>0){
				newMatrix = alpha.clone();
			}else{
				newMatrix = InvertMatrix(alpha);
			}
			for(var i:uint = 0; i<power; i++){
				powerList.newMatrix(alpha.clone());
			}

			return VectorUtils.Collapse(powerList,multiplyMatrix);
		}		
		
		/**
		 * DESCRIPTION: Calculates the Determinant of a given matrix
		 * @id=determinant
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix whose determinant is to be calculated
		 * -------------------------------------
		 * RETURNS: The the determinant of a given matrix
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES:
		 * (a) If a non-square matrix is passed, 0 is automatically returned as it's Determinant
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */		
		public static function determinant(alpha:Vector):Number{
			if(VectorUtils.Width(alpha) != VectorUtils.Height(alpha)) return 0;
			
			
			if(VectorUtils.Width(alpha) < 2) return alpha[0][0];

			//These functions should be changed for optimization
			function UseRow():Boolean{return true;}
			function WhichRowCol():int{return 0;}			
			
			var useRow:Boolean = UseRow();
			var whichRowCol:int = WhichRowCol();
			var i:int = 0;
			var tempMatrix:Vector;
			var detList:Vector = new Vector();			
			var signedMatrix:Vector = VectorUtils.FillByIndex(alpha,function(i:int,j:int):*{return ((i+j) % 2 == 0)? alpha[i][j]:negative(alpha[i][j]);})
			if(useRow){
				for(i = 0; i < VectorUtils.Width(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,whichRowCol),i);
					detList.push(multiply(signedMatrix[whichRowCol][i],determinant(tempMatrix)));
				}
			}else{
			for(i= 0; i < VectorUtils.Height(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,i),whichRowCol)
					detList.push(multiply(signedMatrix[whichRowCol][i],determinant(tempMatrix)));

				}
			}
			return VectorUtils.Collapse(detList,add);
		}

		/**
		 * DESCRIPTION: Calculates the Permanent of a given matrix
		 * @id=permanent
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix whose permanent is to be calculated
		 * -------------------------------------
		 * RETURNS: The the permanent of a given matrix
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */	
		public static function permanent(alpha:Vector):Number{

			if(VectorUtils.Width(alpha) < 2) return alpha[0][0];

			//These functions should be changed for optimization
			function UseRow():Boolean{return true;}
			function WhichRowCol():int{return 0;}			
			
			var useRow:Boolean = UseRow();
			var whichRowCol:int = WhichRowCol();
			var i:int = 0;
			var tempMatrix:Vector;
			var detList:Vector = new Vector();			
			
			if(useRow){
				for(i = 0; i < VectorUtils.Width(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,whichRowCol),i);
					detList.push(multiply(alpha[whichRowCol][i],permanent(tempMatrix)));
				}
			}else{
			for(i= 0; i < VectorUtils.Height(alpha); i++){
					tempMatrix = VectorUtils.ColumnRemoved(VectorUtils.RowRemoved(alpha,i),whichRowCol)
					detList.push(multiply(alpha[whichRowCol][i],permanent(tempMatrix)));

				}
			}
			return VectorUtils.Collapse(detList,function(a:Number,b:Number):Number{return a+b;});
		}
				
		/**
		 * DESCRIPTION: Inverts a matrix
		 * @id=invertMatrix
		 * -------------------------------------
		 * PARAMETERS:
		 * @param {Vector} alpha 	matrix to be inverted
		 * -------------------------------------
		 * RETURNS: An inverted version of a given matrix
		 * @return {Vector}
		 * -------------------------------------
		 * NOTES: 
		 * (a) If checkDeterminant is set to true and alpha is not invertable, then the function returns a matrix the same size as alpha, filled with zeross.
		 * -------------------------------------
		 * EXAMPLES:
		 * (a)
		 */			
		public static function invertMatrix(alpha:Vector,checkDeterminant:Boolean=true):Vector{
			if(checkDeterminant){
				if(Determinant(alpha)==zero){
					return VectorUtils.ConstantMatrix(VectorUtils.Height(alpha),VectorUtils.Width(alpha),zero)
				}
			}
						
			var i:int =0;
			var j:int = 0;
			var mat:Vector = alpha.clone();
			
			var identity:Vector = generateIdentity(VectorUtils.Height(alpha),VectorUtils.Width(alpha));

			
			

			var scalar:*;

			for(i = 0; i < VectorUtils.Height(mat); i++){
				scalar = mat[i][i];

				mat = VectorUtils.RowSet(mat,ScaleMatrix(VectorUtils.GetRow(mat,i),1/scalar),i);
				identity = VectorUtils.RowSet(identity,ScaleMatrix(VectorUtils.GetRow(identity,i),1/scalar),i);
				for(j = VectorUtils.Height(mat)-1; j > i; j--){
					scalar = mat[j][i];	
					mat = VectorUtils.RowSet(mat,SubtractMatrix(VectorUtils.GetRow(mat,j),ScaleMatrix(VectorUtils.GetRow(mat,i),scalar)),j);
					identity = VectorUtils.RowSet(identity,SubtractMatrix(VectorUtils.GetRow(identity,j),ScaleMatrix(VectorUtils.GetRow(identity,i),scalar)),j);
				} 
			
			}
		
			for(i = VectorUtils.Height(mat) -1; i >0; i--){
				scalar = mat[i][i];
				mat = VectorUtils.RowSet(mat,ScaleMatrix(VectorUtils.GetRow(mat,i),1/scalar),i);
				identity = VectorUtils.RowSet(identity,ScaleMatrix(VectorUtils.GetRow(identity,i),1/scalar),i);
				
					for(j = 0; j < i; j++){
						scalar = mat[j][i];	
						mat = VectorUtils.RowSet(mat,SubtractMatrix(VectorUtils.GetRow(mat,j),ScaleMatrix(VectorUtils.GetRow(mat,i),scalar)),j);
						identity = VectorUtils.RowSet(identity,SubtractMatrix(VectorUtils.GetRow(identity,j),ScaleMatrix(VectorUtils.GetRow(identity,i),scalar)),j);
					} 
			}
	
			return identity;
		}					
				
		
		
		
		
		
		/////
		//////////
		///////////////
		//Section IV : Vector Statistics 
		//
		///////////////
		//////////
		/////		





		public function vectorSum(alpha:Vector):*{
			VectorUtils.Collapse(alpha,add);
		}
		
		public function vectorProduct(alpha:Vector):*{
			VectorUtils.Collapse(alpha,multiply);
		}
		
		public function vectorCollapseOperation(alpha:Vector, index:uint = 0):*{
			VectorUtils.Collapse(alpha,operation(index));
		}



























		

		

		


					

			

	}
}