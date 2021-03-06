#-------------------------------------------------------------
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
#-------------------------------------------------------------


args <- commandArgs(TRUE)
# args[1]=""
options(digits=22)
library("Matrix")
library("matrixStats")

X = as.matrix(readMM(paste(args[1], "X.mtx", sep="")))
Y = as.matrix(readMM(paste(args[1], "Y.mtx", sep="")))
v = as.matrix(readMM(paste(args[1], "v.mtx", sep="")))
z = as.matrix(readMM(paste(args[1], "z.mtx", sep="")))
w = as.matrix(readMM(paste(args[1], "w.mtx", sep="")))

R = 2* X *3* X *5* Y *4*5*2*2* (matrix(1,length(w),1)%*%z) * (matrix(1,length(w),1)%*%v)^2 * (w%*%matrix(1,1,length(v)))

writeMM(as(R, "CsparseMatrix"), paste(args[2], "R", sep=""));
