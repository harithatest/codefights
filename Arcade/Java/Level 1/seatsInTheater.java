int seatsInTheater(int nCols, int nRows, int col, int row) {
    int rcols = nCols-col+1;
    int rRows = nRows-row;
    int res = rcols*rRows;
    return res;    
}
